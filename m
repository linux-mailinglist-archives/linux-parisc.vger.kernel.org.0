Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B255436580
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jun 2019 22:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfFEUc0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jun 2019 16:32:26 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:52626 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfFEUcZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jun 2019 16:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=z1elbVVltapW8ahosAFQzFHZFJ29dmYjr8bHHGr4vms=; b=aQUuG7s2fPav63dcNJfyjXtoKr
        fe2EHDBSv/QjT6T+A2pvFOz4wcuCOJQy/lX5aGCXsfuEJOADRrSp7yBHB1mQdhbMLSjsKdlXzmmi5
        5plpHQNro6THAmU//Gx5Yw1G0ztNBysXYo4fap0/wDVx7dzvF5fzZZdcDgE7cixH+X20=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hYca8-0004ei-J8; Wed, 05 Jun 2019 22:32:24 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v3 1/6] parisc: add support for patching multiple words
Date:   Wed,  5 Jun 2019 22:32:17 +0200
Message-Id: <20190605203222.6194-2-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190605203222.6194-1-svens@stackframe.org>
References: <20190605203222.6194-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

add patch_text_multiple() which allows to patch multiple
text words in memory. This can be used to copy functions.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/patch.h |  4 +-
 arch/parisc/kernel/patch.c      | 75 ++++++++++++++++++++++++++-------
 2 files changed, 62 insertions(+), 17 deletions(-)

diff --git a/arch/parisc/include/asm/patch.h b/arch/parisc/include/asm/patch.h
index 685b58a13968..400d84c6e504 100644
--- a/arch/parisc/include/asm/patch.h
+++ b/arch/parisc/include/asm/patch.h
@@ -4,8 +4,10 @@
 
 /* stop machine and patch kernel text */
 void patch_text(void *addr, unsigned int insn);
+void patch_text_multiple(void *addr, u32 *insn, unsigned int len);
 
 /* patch kernel text with machine already stopped (e.g. in kgdb) */
-void __patch_text(void *addr, unsigned int insn);
+void __patch_text(void *addr, u32 insn);
+void __patch_text_multiple(void *addr, u32 *insn, unsigned int len);
 
 #endif
diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
index cdcd981278b3..70e9997a3f80 100644
--- a/arch/parisc/kernel/patch.c
+++ b/arch/parisc/kernel/patch.c
@@ -17,15 +17,18 @@
 
 struct patch {
 	void *addr;
-	unsigned int insn;
+	u32 *insn;
+	unsigned int len;
 };
 
-static void __kprobes *patch_map(void *addr, int fixmap)
-{
+static DEFINE_RAW_SPINLOCK(patch_lock);
+
+static void __kprobes *patch_map(void *addr, int fixmap, int *need_unmap)
 	unsigned long uintaddr = (uintptr_t) addr;
 	bool module = !core_kernel_text(uintaddr);
 	struct page *page;
 
+	*need_unmap = 0;
 	if (module && IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
 		page = vmalloc_to_page(addr);
 	else if (!module && IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
@@ -33,6 +36,7 @@ static void __kprobes *patch_map(void *addr, int fixmap)
 	else
 		return addr;
 
+	*need_unmap = 1;
 	set_fixmap(fixmap, page_to_phys(page));
 
 	return (void *) (__fix_to_virt(fixmap) + (uintaddr & ~PAGE_MASK));
@@ -43,34 +47,73 @@ static void __kprobes patch_unmap(int fixmap)
 	clear_fixmap(fixmap);
 }
 
-void __kprobes __patch_text(void *addr, unsigned int insn)
+void __kprobes __patch_text_multiple(void *addr, u32 *insn, unsigned int len)
+{
+	unsigned long start = (unsigned long)addr;
+	unsigned long end = (unsigned long)addr + len;
+	u32 *p, *fixmap;
+	int mapped;
+
+	/* Make sure we don't have any aliases in cache */
+	flush_kernel_vmap_range(addr, len);
+	flush_icache_range(start, end);
+
+	p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &mapped);
+
+	while (len >= 4) {
+		*p++ = *insn++;
+		addr += sizeof(u32);
+		len -= sizeof(u32);
+		if (len && offset_in_page(addr) == 0) {
+			/*
+			 * We're crossing a page boundary, so
+			 * need to remap
+			 */
+			flush_kernel_vmap_range((void *)fixmap,
+						(p-fixmap) * sizeof(*p));
+			if (mapped)
+				patch_unmap(FIX_TEXT_POKE0);
+			p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &mapped);
+		}
+	}
+
+	flush_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
+	if (mapped)
+		patch_unmap(FIX_TEXT_POKE0);
+	flush_icache_range(start, end);
+}
+
+void __kprobes __patch_text(void *addr, u32 insn)
 {
-	void *waddr = addr;
-	int size;
-
-	waddr = patch_map(addr, FIX_TEXT_POKE0);
-	*(u32 *)waddr = insn;
-	size = sizeof(u32);
-	flush_kernel_vmap_range(waddr, size);
-	patch_unmap(FIX_TEXT_POKE0);
-	flush_icache_range((uintptr_t)(addr),
-			   (uintptr_t)(addr) + size);
+	__patch_text_multiple(addr, &insn, sizeof(insn));
 }
 
 static int __kprobes patch_text_stop_machine(void *data)
 {
 	struct patch *patch = data;
 
-	__patch_text(patch->addr, patch->insn);
-
+	__patch_text_multiple(patch->addr, patch->insn, patch->len);
 	return 0;
 }
 
 void __kprobes patch_text(void *addr, unsigned int insn)
 {
+	struct patch patch = {
+		.addr = addr,
+		.insn = &insn,
+		.len = sizeof(insn),
+	};
+
+	stop_machine_cpuslocked(patch_text_stop_machine, &patch, NULL);
+}
+
+void __kprobes patch_text_multiple(void *addr, u32 *insn, unsigned int len)
+{
+
 	struct patch patch = {
 		.addr = addr,
 		.insn = insn,
+		.len = len
 	};
 
 	stop_machine_cpuslocked(patch_text_stop_machine, &patch, NULL);
-- 
2.20.1


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1F32BA7C
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 21:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfE0TFI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 15:05:08 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:43121 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbfE0TFI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 15:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=pLNcE4k8E/SWtoAOCDC2aZyIZX/nkWEhNn7ZdPOkv9U=; b=e1IbVoIeYvT57ml1RyDwy0jDnJ
        VSZtoSxzbIJ1aHBoCiraab0/+sEv/DDhVVt2+Ao2d6mtomP3xhX7HP1Lc1kyqJN4rRyPKlw3C4Im/
        4Eb8q8wlYrjOoUVTJBKGTdDMG3klXw80oH0kXnY/G4+DH8KmpB6Au57pCwbg47DcEFAg=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hVKvi-0005jT-Dl; Mon, 27 May 2019 21:05:06 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 2/6] parisc: add spinlock to patch function
Date:   Mon, 27 May 2019 21:04:46 +0200
Message-Id: <20190527190450.14988-3-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527190450.14988-1-svens@stackframe.org>
References: <20190527190450.14988-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

If multiple CPUs are patching code we need the spinlock
to protect against parallel fixmap maps/unmap calls.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/patch.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
index eaef5515f5b6..8ed8e7191e8d 100644
--- a/arch/parisc/kernel/patch.c
+++ b/arch/parisc/kernel/patch.c
@@ -23,7 +23,9 @@ struct patch {
 
 static DEFINE_RAW_SPINLOCK(patch_lock);
 
-static void __kprobes *patch_map(void *addr, int fixmap, int *need_unmap)
+static void __kprobes *patch_map(void *addr, int fixmap, unsigned long *flags,
+				 int *need_unmap)
+{
 	unsigned long uintaddr = (uintptr_t) addr;
 	bool module = !core_kernel_text(uintaddr);
 	struct page *page;
@@ -38,19 +40,29 @@ static void __kprobes *patch_map(void *addr, int fixmap, int *need_unmap)
 
 	*need_unmap = 1;
 	set_fixmap(fixmap, page_to_phys(page));
+	if (flags)
+		raw_spin_lock_irqsave(&patch_lock, *flags);
+	else
+		__acquire(&patch_lock);
 
 	return (void *) (__fix_to_virt(fixmap) + (uintaddr & ~PAGE_MASK));
 }
 
-static void __kprobes patch_unmap(int fixmap)
+static void __kprobes patch_unmap(int fixmap, unsigned long *flags)
 {
 	clear_fixmap(fixmap);
+
+	if (flags)
+		raw_spin_unlock_irqrestore(&patch_lock, *flags);
+	else
+		__release(&patch_lock);
 }
 
 void __kprobes __patch_text_multiple(void *addr, u32 *insn, int len)
 {
 	unsigned long start = (unsigned long)addr;
 	unsigned long end = (unsigned long)addr + len;
+	unsigned long flags;
 	u32 *p, *fixmap;
 	int mapped;
 
@@ -58,7 +70,7 @@ void __kprobes __patch_text_multiple(void *addr, u32 *insn, int len)
 	flush_kernel_vmap_range(addr, len);
 	flush_icache_range(start, end);
 
-	p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &mapped);
+	p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &flags, &mapped);
 
 	while (len > 0) {
 		*p++ = *insn++;
@@ -72,14 +84,15 @@ void __kprobes __patch_text_multiple(void *addr, u32 *insn, int len)
 			flush_kernel_vmap_range((void *)fixmap,
 						(p-fixmap) * sizeof(*p));
 			if (mapped)
-				patch_unmap(FIX_TEXT_POKE0);
-			p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &mapped);
+				patch_unmap(FIX_TEXT_POKE0, &flags);
+			p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &flags,
+						&mapped);
 		}
 	}
 
 	flush_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
 	if (mapped)
-		patch_unmap(FIX_TEXT_POKE0);
+		patch_unmap(FIX_TEXT_POKE0, &flags);
 	flush_icache_range(start, end);
 }
 
-- 
2.20.1


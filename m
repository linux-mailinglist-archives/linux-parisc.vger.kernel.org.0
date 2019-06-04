Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5FC834FD9
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jun 2019 20:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfFDSem (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jun 2019 14:34:42 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:50063 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfFDSem (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jun 2019 14:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=GmDHIu1BJL9Ph+7cg7uQdhbzzPluV1mLesQ6JPjun9A=; b=LcVti18Tl8s4HkbldsB9RJ249+
        G52RCNvXCgydXGc2I2YYNQyqLYb1rzKseTE5z3kAAjm1z1mWVBN3OOX7ru7DLXcU7sFi4uFaw+cdW
        AZEq8DbOn1kbqBwU4gI+znf3WVdjVSAEtICfbOAfA0FE7yJWO0mJEieNmP4NVEqkdonw=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hYEGe-0002tN-JT; Tue, 04 Jun 2019 20:34:40 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v2 2/6] parisc: add spinlock to patch function
Date:   Tue,  4 Jun 2019 20:34:31 +0200
Message-Id: <20190604183435.20175-3-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604183435.20175-1-svens@stackframe.org>
References: <20190604183435.20175-1-svens@stackframe.org>
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
index 624de41e0524..fb503f7ff60e 100644
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
 
 void __kprobes __patch_text_multiple(void *addr, u32 *insn, unsigned int len)
 {
 	unsigned long start = (unsigned long)addr;
 	unsigned long end = (unsigned long)addr + len;
+	unsigned long flags;
 	u32 *p, *fixmap;
 	int mapped;
 
@@ -58,7 +70,7 @@ void __kprobes __patch_text_multiple(void *addr, u32 *insn, unsigned int len)
 	flush_kernel_vmap_range(addr, len);
 	flush_icache_range(start, end);
 
-	p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &mapped);
+	p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &flags, &mapped);
 
 	while (len >= 4) {
 		*p++ = *insn++;
@@ -72,14 +84,15 @@ void __kprobes __patch_text_multiple(void *addr, u32 *insn, unsigned int len)
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


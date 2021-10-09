Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B8B427CA6
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Oct 2021 20:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhJIS0r (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Oct 2021 14:26:47 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:45724 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbhJIS0r (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Oct 2021 14:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uymi4hpW8zCa2p47QKZ17D5Q5Zkm3pDFw0UdUBiljA0=; b=qhTnguL06sk1Wwqlf8ZGqiZkrF
        V5UVLf684TPkmR0Dn/5AJTdM8jSLCGeS3t+i25I6suuSkJxrV2xqRY8mDesL+Y3TYu8yf/pEqCVnm
        CeqRZQzA/LkmQlsF56Wf6I4DyTWYIKJYC/eYAs0iwJ4jxFQXl+aF9cjfYvjBkB+FZYUs=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZH1c-0001dj-Pv; Sat, 09 Oct 2021 20:24:48 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v2 2/5] parisc: deduplicate code in flush_cache_mm() and flush_cache_range()
Date:   Sat,  9 Oct 2021 20:24:36 +0200
Message-Id: <20211009182439.30016-3-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009182439.30016-1-svens@stackframe.org>
References: <20211009182439.30016-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Parts of both functions are the same, so deduplicate them. No functional
change.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/cache.c | 81 ++++++++++++++------------------------
 1 file changed, 30 insertions(+), 51 deletions(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index a1a7e2b0812f..c61827e4928a 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -543,10 +543,33 @@ static inline pte_t *get_ptep(pgd_t *pgd, unsigned long addr)
 	return ptep;
 }
 
+static void flush_cache_pages(struct vm_area_struct *vma, struct mm_struct *mm,
+			      unsigned long start, unsigned long end)
+{
+	unsigned long addr, pfn;
+	pte_t *ptep;
+
+	for (addr = start; addr < end; addr += PAGE_SIZE) {
+		ptep = get_ptep(mm->pgd, addr);
+		if (ptep) {
+			pfn = pte_pfn(*ptep);
+			flush_cache_page(vma, addr, pfn);
+		}
+	}
+}
+
+static void flush_user_cache_tlb(struct vm_area_struct *vma,
+				 unsigned long start, unsigned long end)
+{
+	flush_user_dcache_range_asm(start, end);
+	if (vma->vm_flags & VM_EXEC)
+		flush_user_icache_range_asm(start, end);
+	flush_tlb_range(vma, start, end);
+}
+
 void flush_cache_mm(struct mm_struct *mm)
 {
 	struct vm_area_struct *vma;
-	pgd_t *pgd;
 
 	/* Flushing the whole cache on each cpu takes forever on
 	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
@@ -560,46 +583,20 @@ void flush_cache_mm(struct mm_struct *mm)
 
 	preempt_disable();
 	if (mm->context == mfsp(3)) {
-		for (vma = mm->mmap; vma; vma = vma->vm_next) {
-			flush_user_dcache_range_asm(vma->vm_start, vma->vm_end);
-			if (vma->vm_flags & VM_EXEC)
-				flush_user_icache_range_asm(vma->vm_start, vma->vm_end);
-			flush_tlb_range(vma, vma->vm_start, vma->vm_end);
-		}
+		for (vma = mm->mmap; vma; vma = vma->vm_next)
+			flush_user_cache_tlb(vma, vma->vm_start, vma->vm_end);
 		preempt_enable();
 		return;
 	}
 
-	pgd = mm->pgd;
-	for (vma = mm->mmap; vma; vma = vma->vm_next) {
-		unsigned long addr;
-
-		for (addr = vma->vm_start; addr < vma->vm_end;
-		     addr += PAGE_SIZE) {
-			unsigned long pfn;
-			pte_t *ptep = get_ptep(pgd, addr);
-			if (!ptep)
-				continue;
-			pfn = pte_pfn(*ptep);
-			if (!pfn_valid(pfn))
-				continue;
-			if (unlikely(mm->context)) {
-				flush_tlb_page(vma, addr);
-				__flush_cache_page(vma, addr, PFN_PHYS(pfn));
-			} else {
-				__purge_cache_page(vma, addr, PFN_PHYS(pfn));
-			}
-		}
-	}
+	for (vma = mm->mmap; vma; vma = vma->vm_next)
+		flush_cache_pages(vma, mm, vma->vm_start, vma->vm_end);
 	preempt_enable();
 }
 
 void flush_cache_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end)
 {
-	pgd_t *pgd;
-	unsigned long addr;
-
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    end - start >= parisc_cache_flush_threshold) {
 		if (vma->vm_mm->context)
@@ -610,30 +607,12 @@ void flush_cache_range(struct vm_area_struct *vma,
 
 	preempt_disable();
 	if (vma->vm_mm->context == mfsp(3)) {
-		flush_user_dcache_range_asm(start, end);
-		if (vma->vm_flags & VM_EXEC)
-			flush_user_icache_range_asm(start, end);
-		flush_tlb_range(vma, start, end);
+		flush_user_cache_tlb(vma, start, end);
 		preempt_enable();
 		return;
 	}
 
-	pgd = vma->vm_mm->pgd;
-	for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
-		unsigned long pfn;
-		pte_t *ptep = get_ptep(pgd, addr);
-		if (!ptep)
-			continue;
-		pfn = pte_pfn(*ptep);
-		if (pfn_valid(pfn)) {
-			if (unlikely(vma->vm_mm->context)) {
-				flush_tlb_page(vma, addr);
-				__flush_cache_page(vma, addr, PFN_PHYS(pfn));
-			} else {
-				__purge_cache_page(vma, addr, PFN_PHYS(pfn));
-			}
-		}
-	}
+	flush_cache_pages(vma, vma->vm_mm, vma->vm_start, vma->vm_end);
 	preempt_enable();
 }
 
-- 
2.33.0


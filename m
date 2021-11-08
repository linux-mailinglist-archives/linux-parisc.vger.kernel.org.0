Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68BF2449E6F
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Nov 2021 22:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240602AbhKHVvF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 8 Nov 2021 16:51:05 -0500
Received: from mta-mtl-004.bell.net ([209.71.208.14]:59888 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S240591AbhKHVvE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 8 Nov 2021 16:51:04 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C894590B4B7718
X-CM-Envelope: MS4xfDHKotfRS2n1Ex9bLXrd+iVL8okI498G+O3umGOsOnSVQ1Ila60uVEcUqIDfqyI4th+wZl6Euxa3aMpY1ByHOcfJW+TwUt9MtSXFdOCaww47h89uKB2x
 3unlPvMuRSK7zNxE7KODn20C1VaBq1bmYFRuww260BkMITOFNsPjs4bkP4JxISWHmEjFFd7VrDbQmLAiGUYDXumsGCaejNZJEW+03wNcyELJItqV8KZEB+jg
 UWHL7K9Qo7FPim80w2hIGV8vDQGyU4f9mP1d+f8z1ttIwL+fk7Oobk73yoJ7TLlNnfG+Sy/iQc3z/uEc7K2TiVY1r9AwAo0StSjqEYiGjW8=
X-CM-Analysis: v=2.4 cv=ENdlb3VC c=1 sm=1 tr=0 ts=61899b20
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=Ig3HJIhBWjIyQfak5WcA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C894590B4B7718; Mon, 8 Nov 2021 16:48:16 -0500
Message-ID: <d659e011-274b-33de-96f4-4ccb6f81296c@bell.net>
Date:   Mon, 8 Nov 2021 16:48:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH/RFC] parisc: Flush kernel data mapping in set_pte_at() when
 installing pte for user page
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

For years, there have been random segmentation faults in userspace on SMP PA-RISC machines.  It
occurred to me that this might be a problem in set_pte_at().  MIPS and some other architectures
do cache flushes when installing PTEs with the present bit set.

Here I have adapted the code in update_mmu_cache() to flush the kernel mapping when the kernel
flush is deferred, or when the kernel mapping may alias with the user mapping.  This simplifies
calls to update_mmu_cache().

I also changed the barrier in set_pte() from a compiler barrier to a full memory barrier.  I know
this change is not sufficient to fix the problem.  It might not be needed.

I have had a few days of operation with 5.14.16 to 5.15.1 and haven't seen any random segmentation
faults on rp3440 or c8000 so far.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 43937af127b1..9ea9872212cb 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -65,6 +65,8 @@ extern int pa_serialize_tlb_flushes;
   * are slow on SMP machines since the purge must be broadcast to all CPUs.
   */

+extern void __update_cache(pte_t pte);
+
  static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
  {
  	unsigned long flags;
@@ -80,16 +82,19 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
   * within a page table are directly modified.  Thus, the following
   * hook is made available.
   */
-#define set_pte(pteptr, pteval)			\
-	do {					\
-		*(pteptr) = (pteval);		\
-		barrier();			\
+#define set_pte(pteptr, pteval)				\
+	do {						\
+		*(pteptr) = (pteval);			\
+		mb();					\
  	} while(0)

-#define set_pte_at(mm, addr, pteptr, pteval)	\
-	do {					\
-		*(pteptr) = (pteval);		\
-		purge_tlb_entries(mm, addr);	\
+#define set_pte_at(mm, addr, pteptr, pteval)		\
+	do {						\
+		if (pte_present(pteval) &&		\
+		    pte_user(pteval))			\
+			__update_cache(pteval);		\
+		*(pteptr) = (pteval);			\
+		purge_tlb_entries(mm, addr);		\
  	} while (0)

  #endif /* !__ASSEMBLY__ */
@@ -303,6 +308,7 @@ extern unsigned long *empty_zero_page;

  #define pte_none(x)     (pte_val(x) == 0)
  #define pte_present(x)	(pte_val(x) & _PAGE_PRESENT)
+#define pte_user(x)	(pte_val(x) & _PAGE_USER)
  #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))

  #define pmd_flag(x)	(pmd_val(x) & PxD_FLAG_MASK)
@@ -410,7 +416,7 @@ extern void paging_init (void);

  #define PG_dcache_dirty         PG_arch_1

-extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t *);
+#define update_mmu_cache(vms,addr,ptep) __update_cache(*ptep)

  /* Encode and de-code a swap entry */

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 86a1a63563fd..c9f09d2a4461 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -83,9 +83,9 @@ EXPORT_SYMBOL(flush_cache_all_local);
  #define pfn_va(pfn)	__va(PFN_PHYS(pfn))

  void
-update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
+__update_cache(pte_t pte)
  {
-	unsigned long pfn = pte_pfn(*ptep);
+	unsigned long pfn = pte_pfn(pte);
  	struct page *page;

  	/* We don't have pte special.  As a result, we can be called with

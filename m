Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFCD131A204
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Feb 2021 16:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbhBLPqe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 12 Feb 2021 10:46:34 -0500
Received: from mout.gmx.net ([212.227.17.22]:33117 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhBLPq1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 12 Feb 2021 10:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1613144675;
        bh=hrBqYwl52eLafPx7Yuu63lHnZb1mctcl/Iky4B4G+iU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=A+aihz/S0njNiRk797Z/QdrGP3DP8Y7kCnGJKXQF8dNJ12BcbWxbc/6y5gRVdPo3r
         Vhjh760fpi2G6Iy27SMuVEcAgioKLf0FG77oCyDUCS/mtszZlfOE/eCsUKE8qUR8Dt
         8zVM/yoH61yC+n4hbqjadHYLNSTbGgeUUhkuwWNc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.146.165]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9MpY-1lvnz50M6e-015FvI; Fri, 12
 Feb 2021 16:44:35 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] parisc: Optimize per-pagetable spinlocks
Date:   Fri, 12 Feb 2021 16:44:25 +0100
Message-Id: <20210212154425.672331-1-deller@gmx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cR86Ze5dOhajntn+NvoJnFJfGrIosSfPl0vKg7UjDW426nYp695
 2w4XPwTDwgoH0mZmhODcrZvpkuGMbhvhdZKMS0I2zmo1NWZZjBPi1EM7DfRycTYnyyQyxVg
 e51VQvbKiKqMLo8nTYW1IBk+gGCcv/VumAKVHZNn9ZvaX8KitnVJYXCO2K4pIvZvfHpHPEX
 6wvEbQ5wu1rOhj2kBdMJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tSyKc+K0Rdc=:hw3lIuN+K+kGqaSSdUPIL8
 +BM3vCiaa/ZwZAwLRi6EpTTFj+Ne5f299O/Mpso2lGlBo8gu+KfI6Ize0IB21pRWw56L6RPcw
 +sws117shjI9X3dQC++m9XCNYHogwmjEz2pnaP6hsO8DQMaoCAe98eNFLSlT8W8sweDr7hzYf
 Qx5f/7KUUaol1csqvYilakpBfXFZS7xNYNqreP9Ix2PyIE6s87e919DTKdKfl5TLO+PirD/Ml
 kipGDCi9WhzanzCoGq3fsMzU1RTXxIBJ4dLzBNuSvqPO/Y1FLEKvtndyJ7U0zcPvj6CfoUGZ9
 kZDFUzXNHuMZF+b9xdgXuF12AveUt6W8r0A+72/qF5OqUs9CumnIxVDh5XvSx+1npdWrdYRnI
 3Csm856i0sMjUAGECl4wBAmHIQFnSvrs3dhoP7Pt6WmslgqD2hEw05sBIR2ThOg9vaGLZtw85
 mK3RqOm0bvHy6PAoTe79t9aJrSRGb+/aGP4zTgCPZ9SZetDhKoyCQ/56v6j7xueLy5UYUoc53
 1RkiU7Yp4q1p6T3F2goCwBIG5HGGS/vOSsFXRauvlLW/pCYuZUmvaLB8wb4PanfAGMNUmwOIp
 dnF47177etdNUYW/V0x9yDBBwpqvibeD/p3mI9beYOSjECEsWdLxa1wLfJhGWf6Ds6f/xF9oh
 XSGaGH9sLAgPUIkb5ORd/ytNQ2RPzTChpolWwV7ycjR0BNBPHWcGWWFvzpbHC6TjmJOQYBK+6
 /LdkhgC6UDiUB3nWe3L0A7NCfBQYpGeDmacK1I9pyrWCyL7lf9yZfiaEW1236C8rxkWZDy/rg
 h2QPOM+vh1EkUYz2rBKzhj8/PRuvNJxlIjWUYfBOF6s5QQj00P0mpjMymryPFY8Cz/J04t29v
 Nt/rW1ZZ9cjapMjP8PYw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On parisc a spinlock is stored in the next page behind the pgd which
protects against parallel accesses to the pgd. That's why one additional
page (PGD_ALLOC_ORDER) is allocated for the pgd.

Matthew Wilcox suggested that we instead should use a pointer in the
struct page table for this spinlock and noted, that the comments for the
PGD_ORDER and PMD_ORDER defines were wrong.

Both suggestions are addressed with this patch. Instead of having an own
spinlock to protect the pgd, we now switch to use the existing
page_table_lock.  Additionally, beside loading the pgd into cr25 in
switch_mm_irqs_off(), the physical address of this lock is loaded into
cr28 (tr4), so that we can avoid implementing a complicated lookup in
assembly for this lock in the TLB fault handlers.

The existing Hybrid L2/L3 page table scheme (where the pmd is adjacent
to the pgd) has been dropped with this patch.

Remove the locking in set_pte() and the huge-page pte functions too.
They trigger a spinlock recursion on 32bit machines and seem unnecessary.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Kconfig                   |  10 +++
 arch/parisc/include/asm/mmu_context.h |   7 ++
 arch/parisc/include/asm/page.h        |   2 +-
 arch/parisc/include/asm/pgalloc.h     |  76 ++++-------------
 arch/parisc/include/asm/pgtable.h     |  89 ++++----------------
 arch/parisc/kernel/asm-offsets.c      |   1 -
 arch/parisc/kernel/entry.S            | 116 +++++++++++---------------
 arch/parisc/mm/hugetlbpage.c          |  13 ---
 arch/parisc/mm/init.c                 |  10 +--
 9 files changed, 110 insertions(+), 214 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 278462186ac4..8368a806a18f 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -311,6 +311,16 @@ config IRQSTACKS
 	  for handling hard and soft interrupts.  This can help avoid
 	  overflowing the process kernel stacks.

+config TLB_PTLOCK
+	bool "Use page table locks in TLB fault handler"
+	depends on SMP
+	default n
+	help
+	  Select this option to enable page table locking in the TLB
+	  fault handler. This ensures that page table entries are
+	  updated consistently on SMP machines at the expense of some
+	  loss in performance.
+
 config HOTPLUG_CPU
 	bool
 	default y if SMP
diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/include/a=
sm/mmu_context.h
index 46f8c22c5977..726257648d9f 100644
=2D-- a/arch/parisc/include/asm/mmu_context.h
+++ b/arch/parisc/include/asm/mmu_context.h
@@ -5,6 +5,7 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 #include <linux/atomic.h>
+#include <linux/spinlock.h>
 #include <asm-generic/mm_hooks.h>

 /* on PA-RISC, we actually have enough contexts to justify an allocator
@@ -50,6 +51,12 @@ static inline void switch_mm_irqs_off(struct mm_struct =
*prev,
 		struct mm_struct *next, struct task_struct *tsk)
 {
 	if (prev !=3D next) {
+#ifdef CONFIG_TLB_PTLOCK
+		/* put physical address of page_table_lock in cr28 (tr4)
+		   for TLB faults */
+		spinlock_t *pgd_lock =3D &next->page_table_lock;
+		mtctl(__pa(__ldcw_align(&pgd_lock->rlock.raw_lock)), 28);
+#endif
 		mtctl(__pa(next->pgd), 25);
 		load_context(next->context);
 	}
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page=
.h
index 6b3f6740a6a6..d00313d1274e 100644
=2D-- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -112,7 +112,7 @@ extern int npmem_ranges;
 #else
 #define BITS_PER_PTE_ENTRY	2
 #define BITS_PER_PMD_ENTRY	2
-#define BITS_PER_PGD_ENTRY	BITS_PER_PMD_ENTRY
+#define BITS_PER_PGD_ENTRY	2
 #endif
 #define PGD_ENTRY_SIZE	(1UL << BITS_PER_PGD_ENTRY)
 #define PMD_ENTRY_SIZE	(1UL << BITS_PER_PMD_ENTRY)
diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/p=
galloc.h
index a6482b2ce0ea..dda557085311 100644
=2D-- a/arch/parisc/include/asm/pgalloc.h
+++ b/arch/parisc/include/asm/pgalloc.h
@@ -15,47 +15,23 @@
 #define __HAVE_ARCH_PGD_FREE
 #include <asm-generic/pgalloc.h>

-/* Allocate the top level pgd (page directory)
- *
- * Here (for 64 bit kernels) we implement a Hybrid L2/L3 scheme: we
- * allocate the first pmd adjacent to the pgd.  This means that we can
- * subtract a constant offset to get to it.  The pmd and pgd sizes are
- * arranged so that a single pmd covers 4GB (giving a full 64-bit
- * process access to 8TB) so our lookups are effectively L2 for the
- * first 4GB of the kernel (i.e. for all ILP32 processes and all the
- * kernel for machines with under 4GB of memory) */
+/* Allocate the top level pgd (page directory) */
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *pgd =3D (pgd_t *)__get_free_pages(GFP_KERNEL,
-					       PGD_ALLOC_ORDER);
-	pgd_t *actual_pgd =3D pgd;
+	pgd_t *pgd;

-	if (likely(pgd !=3D NULL)) {
-		memset(pgd, 0, PAGE_SIZE<<PGD_ALLOC_ORDER);
-#if CONFIG_PGTABLE_LEVELS =3D=3D 3
-		actual_pgd +=3D PTRS_PER_PGD;
-		/* Populate first pmd with allocated memory.  We mark it
-		 * with PxD_FLAG_ATTACHED as a signal to the system that this
-		 * pmd entry may not be cleared. */
-		set_pgd(actual_pgd, __pgd((PxD_FLAG_PRESENT |
-				        PxD_FLAG_VALID |
-					PxD_FLAG_ATTACHED)
-			+ (__u32)(__pa((unsigned long)pgd) >> PxD_VALUE_SHIFT)));
-		/* The first pmd entry also is marked with PxD_FLAG_ATTACHED as
-		 * a signal that this pmd may not be freed */
-		set_pgd(pgd, __pgd(PxD_FLAG_ATTACHED));
-#endif
-	}
-	spin_lock_init(pgd_spinlock(actual_pgd));
-	return actual_pgd;
+	pgd =3D (pgd_t *) __get_free_pages(GFP_KERNEL, PGD_ORDER);
+	if (unlikely(pgd =3D=3D NULL))
+		return NULL;
+
+	memset(pgd, 0, PAGE_SIZE << PGD_ORDER);
+
+	return pgd;
 }

 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-#if CONFIG_PGTABLE_LEVELS =3D=3D 3
-	pgd -=3D PTRS_PER_PGD;
-#endif
-	free_pages((unsigned long)pgd, PGD_ALLOC_ORDER);
+	free_pages((unsigned long)pgd, PGD_ORDER);
 }

 #if CONFIG_PGTABLE_LEVELS =3D=3D 3
@@ -70,41 +46,25 @@ static inline void pud_populate(struct mm_struct *mm, =
pud_t *pud, pmd_t *pmd)

 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long ad=
dress)
 {
-	return (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);
+	pmd_t *pmd;
+
+	pmd =3D (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);
+	if (likely(pmd))
+		memset ((void *)pmd, 0, PAGE_SIZE << PMD_ORDER);
+	return pmd;
 }

 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
-	if (pmd_flag(*pmd) & PxD_FLAG_ATTACHED) {
-		/*
-		 * This is the permanent pmd attached to the pgd;
-		 * cannot free it.
-		 * Increment the counter to compensate for the decrement
-		 * done by generic mm code.
-		 */
-		mm_inc_nr_pmds(mm);
-		return;
-	}
 	free_pages((unsigned long)pmd, PMD_ORDER);
 }
-
 #endif

 static inline void
 pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
 {
-#if CONFIG_PGTABLE_LEVELS =3D=3D 3
-	/* preserve the gateway marker if this is the beginning of
-	 * the permanent pmd */
-	if(pmd_flag(*pmd) & PxD_FLAG_ATTACHED)
-		set_pmd(pmd, __pmd((PxD_FLAG_PRESENT |
-				PxD_FLAG_VALID |
-				PxD_FLAG_ATTACHED)
-			+ (__u32)(__pa((unsigned long)pte) >> PxD_VALUE_SHIFT)));
-	else
-#endif
-		set_pmd(pmd, __pmd((PxD_FLAG_PRESENT | PxD_FLAG_VALID)
-			+ (__u32)(__pa((unsigned long)pte) >> PxD_VALUE_SHIFT)));
+	set_pmd(pmd, __pmd((PxD_FLAG_PRESENT | PxD_FLAG_VALID)
+		+ (__u32)(__pa((unsigned long)pte) >> PxD_VALUE_SHIFT)));
 }

 #define pmd_populate(mm, pmd, pte_page) \
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/p=
gtable.h
index 75cf84070fc9..39017210dbf0 100644
=2D-- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -23,8 +23,6 @@
 #include <asm/processor.h>
 #include <asm/cache.h>

-static inline spinlock_t *pgd_spinlock(pgd_t *);
-
 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
  * memory.  For the return value to be meaningful, ADDR must be >=3D
@@ -42,12 +40,8 @@ static inline spinlock_t *pgd_spinlock(pgd_t *);

 /* This is for the serialization of PxTLB broadcasts. At least on the N c=
lass
  * systems, only one PxTLB inter processor broadcast can be active at any=
 one
- * time on the Merced bus.
-
- * PTE updates are protected by locks in the PMD.
- */
+ * time on the Merced bus. */
 extern spinlock_t pa_tlb_flush_lock;
-extern spinlock_t pa_swapper_pg_lock;
 #if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
 extern int pa_serialize_tlb_flushes;
 #else
@@ -86,18 +80,16 @@ static inline void purge_tlb_entries(struct mm_struct =
*mm, unsigned long addr)
  * within a page table are directly modified.  Thus, the following
  * hook is made available.
  */
-#define set_pte(pteptr, pteval)                                 \
-        do{                                                     \
-                *(pteptr) =3D (pteval);                           \
-        } while(0)
-
-#define set_pte_at(mm, addr, ptep, pteval)			\
-	do {							\
-		unsigned long flags;				\
-		spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);\
-		set_pte(ptep, pteval);				\
-		purge_tlb_entries(mm, addr);			\
-		spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);\
+#define set_pte(pteptr, pteval)			\
+	do {					\
+		*(pteptr) =3D (pteval);		\
+		barrier();			\
+	} while(0)
+
+#define set_pte_at(mm, addr, pteptr, pteval)	\
+	do {					\
+		*(pteptr) =3D (pteval);		\
+		purge_tlb_entries(mm, addr);	\
 	} while (0)

 #endif /* !__ASSEMBLY__ */
@@ -120,12 +112,10 @@ static inline void purge_tlb_entries(struct mm_struc=
t *mm, unsigned long addr)
 #define KERNEL_INITIAL_SIZE	(1 << KERNEL_INITIAL_ORDER)

 #if CONFIG_PGTABLE_LEVELS =3D=3D 3
-#define PGD_ORDER	1 /* Number of pages per pgd */
-#define PMD_ORDER	1 /* Number of pages per pmd */
-#define PGD_ALLOC_ORDER	(2 + 1) /* first pgd contains pmd */
+#define PMD_ORDER	1
+#define PGD_ORDER	0
 #else
-#define PGD_ORDER	1 /* Number of pages per pgd */
-#define PGD_ALLOC_ORDER	(PGD_ORDER + 1)
+#define PGD_ORDER	1
 #endif

 /* Definitions for 3rd level (we use PLD here for Page Lower directory
@@ -240,11 +230,9 @@ static inline void purge_tlb_entries(struct mm_struct=
 *mm, unsigned long addr)
  * able to effectively address 40/42/44-bits of physical address space
  * depending on 4k/16k/64k PAGE_SIZE */
 #define _PxD_PRESENT_BIT   31
-#define _PxD_ATTACHED_BIT  30
-#define _PxD_VALID_BIT     29
+#define _PxD_VALID_BIT     30

 #define PxD_FLAG_PRESENT  (1 << xlate_pabit(_PxD_PRESENT_BIT))
-#define PxD_FLAG_ATTACHED (1 << xlate_pabit(_PxD_ATTACHED_BIT))
 #define PxD_FLAG_VALID    (1 << xlate_pabit(_PxD_VALID_BIT))
 #define PxD_FLAG_MASK     (0xf)
 #define PxD_FLAG_SHIFT    (4)
@@ -326,23 +314,10 @@ extern unsigned long *empty_zero_page;
 #define pgd_flag(x)	(pgd_val(x) & PxD_FLAG_MASK)
 #define pgd_address(x)	((unsigned long)(pgd_val(x) &~ PxD_FLAG_MASK) << P=
xD_VALUE_SHIFT)

-#if CONFIG_PGTABLE_LEVELS =3D=3D 3
-/* The first entry of the permanent pmd is not there if it contains
- * the gateway marker */
-#define pmd_none(x)	(!pmd_val(x) || pmd_flag(x) =3D=3D PxD_FLAG_ATTACHED)
-#else
 #define pmd_none(x)	(!pmd_val(x))
-#endif
 #define pmd_bad(x)	(!(pmd_flag(x) & PxD_FLAG_VALID))
 #define pmd_present(x)	(pmd_flag(x) & PxD_FLAG_PRESENT)
 static inline void pmd_clear(pmd_t *pmd) {
-#if CONFIG_PGTABLE_LEVELS =3D=3D 3
-	if (pmd_flag(*pmd) & PxD_FLAG_ATTACHED)
-		/* This is the entry pointing to the permanent pmd
-		 * attached to the pgd; cannot clear it */
-		set_pmd(pmd, __pmd(PxD_FLAG_ATTACHED));
-	else
-#endif
 		set_pmd(pmd,  __pmd(0));
 }

@@ -358,12 +333,6 @@ static inline void pmd_clear(pmd_t *pmd) {
 #define pud_bad(x)      (!(pud_flag(x) & PxD_FLAG_VALID))
 #define pud_present(x)  (pud_flag(x) & PxD_FLAG_PRESENT)
 static inline void pud_clear(pud_t *pud) {
-#if CONFIG_PGTABLE_LEVELS =3D=3D 3
-	if(pud_flag(*pud) & PxD_FLAG_ATTACHED)
-		/* This is the permanent pmd attached to the pud; cannot
-		 * free it */
-		return;
-#endif
 	set_pud(pud, __pud(0));
 }
 #endif
@@ -456,32 +425,18 @@ extern void update_mmu_cache(struct vm_area_struct *=
, unsigned long, pte_t *);
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })

-
-static inline spinlock_t *pgd_spinlock(pgd_t *pgd)
-{
-	if (unlikely(pgd =3D=3D swapper_pg_dir))
-		return &pa_swapper_pg_lock;
-	return (spinlock_t *)((char *)pgd + (PAGE_SIZE << (PGD_ALLOC_ORDER - 1))=
);
-}
-
-
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, u=
nsigned long addr, pte_t *ptep)
 {
 	pte_t pte;
-	unsigned long flags;

 	if (!pte_young(*ptep))
 		return 0;

-	spin_lock_irqsave(pgd_spinlock(vma->vm_mm->pgd), flags);
 	pte =3D *ptep;
 	if (!pte_young(pte)) {
-		spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
 		return 0;
 	}
-	set_pte(ptep, pte_mkold(pte));
-	purge_tlb_entries(vma->vm_mm, addr);
-	spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
+	set_pte_at(vma->vm_mm, addr, ptep, pte_mkold(pte));
 	return 1;
 }

@@ -489,24 +444,16 @@ struct mm_struct;
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned lon=
g addr, pte_t *ptep)
 {
 	pte_t old_pte;
-	unsigned long flags;

-	spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
 	old_pte =3D *ptep;
-	set_pte(ptep, __pte(0));
-	purge_tlb_entries(mm, addr);
-	spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
+	set_pte_at(mm, addr, ptep, __pte(0));

 	return old_pte;
 }

 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long=
 addr, pte_t *ptep)
 {
-	unsigned long flags;
-	spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
-	set_pte(ptep, pte_wrprotect(*ptep));
-	purge_tlb_entries(mm, addr);
-	spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
+	set_pte_at(mm, addr, ptep, pte_wrprotect(*ptep));
 }

 #define pte_same(A,B)	(pte_val(A) =3D=3D pte_val(B))
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-off=
sets.c
index 305768a40773..cd2cc1b1648c 100644
=2D-- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -268,7 +268,6 @@ int main(void)
 	DEFINE(ASM_BITS_PER_PGD, BITS_PER_PGD);
 	DEFINE(ASM_BITS_PER_PMD, BITS_PER_PMD);
 	DEFINE(ASM_BITS_PER_PTE, BITS_PER_PTE);
-	DEFINE(ASM_PGD_PMD_OFFSET, -(PAGE_SIZE << PGD_ORDER));
 	DEFINE(ASM_PMD_ENTRY, ((PAGE_OFFSET & PMD_MASK) >> PMD_SHIFT));
 	DEFINE(ASM_PGD_ENTRY, PAGE_OFFSET >> PGDIR_SHIFT);
 	DEFINE(ASM_PGD_ENTRY_SIZE, PGD_ENTRY_SIZE);
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 4d37cc9cba37..9f939afe6b88 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -35,10 +35,9 @@
 	.level 2.0
 #endif

-	.import		pa_tlb_lock,data
-	.macro  load_pa_tlb_lock reg
-	mfctl		%cr25,\reg
-	addil		L%(PAGE_SIZE << (PGD_ALLOC_ORDER - 1)),\reg
+	/* Get aligned page_table_lock address for this mm from cr28/tr4 */
+	.macro  get_ptl reg
+	mfctl	%cr28,\reg
 	.endm

 	/* space_to_prot macro creates a prot id from a space id */
@@ -407,7 +406,9 @@
 # endif
 #endif
 	dep             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
+#if CONFIG_PGTABLE_LEVELS < 3
 	copy		%r0,\pte
+#endif
 	ldw,s		\index(\pmd),\pmd
 	bb,>=3D,n		\pmd,_PxD_PRESENT_BIT,\fault
 	dep		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
@@ -417,38 +418,23 @@
 	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd /* pmd is now pte */
 	.endm

-	/* Look up PTE in a 3-Level scheme.
-	 *
-	 * Here we implement a Hybrid L2/L3 scheme: we allocate the
-	 * first pmd adjacent to the pgd.  This means that we can
-	 * subtract a constant offset to get to it.  The pmd and pgd
-	 * sizes are arranged so that a single pmd covers 4GB (giving
-	 * a full LP64 process access to 8TB) so our lookups are
-	 * effectively L2 for the first 4GB of the kernel (i.e. for
-	 * all ILP32 processes and all the kernel for machines with
-	 * under 4GB of memory) */
+	/* Look up PTE in a 3-Level scheme. */
 	.macro		L3_ptep pgd,pte,index,va,fault
-#if CONFIG_PGTABLE_LEVELS =3D=3D 3 /* we might have a 2-Level scheme, e.g=
. with 16kb page size */
+#if CONFIG_PGTABLE_LEVELS =3D=3D 3
+	copy		%r0,\pte
 	extrd,u		\va,63-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
-	extrd,u,*=3D	\va,63-ASM_PGDIR_SHIFT,64-ASM_PGDIR_SHIFT,%r0
 	ldw,s		\index(\pgd),\pgd
-	extrd,u,*=3D	\va,63-ASM_PGDIR_SHIFT,64-ASM_PGDIR_SHIFT,%r0
 	bb,>=3D,n		\pgd,_PxD_PRESENT_BIT,\fault
-	extrd,u,*=3D	\va,63-ASM_PGDIR_SHIFT,64-ASM_PGDIR_SHIFT,%r0
-	shld		\pgd,PxD_VALUE_SHIFT,\index
-	extrd,u,*=3D	\va,63-ASM_PGDIR_SHIFT,64-ASM_PGDIR_SHIFT,%r0
-	copy		\index,\pgd
-	extrd,u,*<>	\va,63-ASM_PGDIR_SHIFT,64-ASM_PGDIR_SHIFT,%r0
-	ldo		ASM_PGD_PMD_OFFSET(\pgd),\pgd
+	shld		\pgd,PxD_VALUE_SHIFT,\pgd
 #endif
 	L2_ptep		\pgd,\pte,\index,\va,\fault
 	.endm

-	/* Acquire pa_tlb_lock lock and check page is present. */
-	.macro		tlb_lock	spc,ptp,pte,tmp,tmp1,fault
-#ifdef CONFIG_SMP
+	/* Acquire page_table_lock and check page is present. */
+	.macro		ptl_lock	spc,ptp,pte,tmp,tmp1,fault
+#ifdef CONFIG_TLB_PTLOCK
 98:	cmpib,COND(=3D),n	0,\spc,2f
-	load_pa_tlb_lock \tmp
+	get_ptl		\tmp
 1:	LDCW		0(\tmp),\tmp1
 	cmpib,COND(=3D)	0,\tmp1,1b
 	nop
@@ -463,26 +449,26 @@
 3:
 	.endm

-	/* Release pa_tlb_lock lock without reloading lock address.
+	/* Release page_table_lock without reloading lock address.
 	   Note that the values in the register spc are limited to
 	   NR_SPACE_IDS (262144). Thus, the stw instruction always
 	   stores a nonzero value even when register spc is 64 bits.
 	   We use an ordered store to ensure all prior accesses are
 	   performed prior to releasing the lock. */
-	.macro		tlb_unlock0	spc,tmp
-#ifdef CONFIG_SMP
+	.macro		ptl_unlock0	spc,tmp
+#ifdef CONFIG_TLB_PTLOCK
 98:	or,COND(=3D)	%r0,\spc,%r0
 	stw,ma		\spc,0(\tmp)
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	.endm

-	/* Release pa_tlb_lock lock. */
-	.macro		tlb_unlock1	spc,tmp
-#ifdef CONFIG_SMP
-98:	load_pa_tlb_lock \tmp
+	/* Release page_table_lock. */
+	.macro		ptl_unlock1	spc,tmp
+#ifdef CONFIG_TLB_PTLOCK
+98:	get_ptl		\tmp
+	ptl_unlock0	\spc,\tmp
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
-	tlb_unlock0	\spc,\tmp
 #endif
 	.endm

@@ -1165,14 +1151,14 @@ dtlb_miss_20w:

 	L3_ptep		ptp,pte,t0,va,dtlb_check_alias_20w

-	tlb_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_20w
+	ptl_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_20w
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb	spc,pte,prot,t1

 	idtlbt          pte,prot

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1191,14 +1177,14 @@ nadtlb_miss_20w:

 	L3_ptep		ptp,pte,t0,va,nadtlb_check_alias_20w

-	tlb_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_20w
+	ptl_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_20w
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb	spc,pte,prot,t1

 	idtlbt          pte,prot

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1219,7 +1205,7 @@ dtlb_miss_11:

 	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_11

-	tlb_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_11
+	ptl_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_11
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb_11	spc,pte,prot
@@ -1232,7 +1218,7 @@ dtlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1252,7 +1238,7 @@ nadtlb_miss_11:

 	L2_ptep		ptp,pte,t0,va,nadtlb_check_alias_11

-	tlb_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_11
+	ptl_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_11
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb_11	spc,pte,prot
@@ -1265,7 +1251,7 @@ nadtlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1285,7 +1271,7 @@ dtlb_miss_20:

 	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_20

-	tlb_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_20
+	ptl_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_20
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb	spc,pte,prot,t1
@@ -1294,7 +1280,7 @@ dtlb_miss_20:

 	idtlbt          pte,prot

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1313,7 +1299,7 @@ nadtlb_miss_20:

 	L2_ptep		ptp,pte,t0,va,nadtlb_check_alias_20

-	tlb_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_20
+	ptl_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_20
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb	spc,pte,prot,t1
@@ -1322,7 +1308,7 @@ nadtlb_miss_20:

 	idtlbt		pte,prot

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1422,14 +1408,14 @@ itlb_miss_20w:

 	L3_ptep		ptp,pte,t0,va,itlb_fault

-	tlb_lock	spc,ptp,pte,t0,t1,itlb_fault
+	ptl_lock	spc,ptp,pte,t0,t1,itlb_fault
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb	spc,pte,prot,t1

 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1446,14 +1432,14 @@ naitlb_miss_20w:

 	L3_ptep		ptp,pte,t0,va,naitlb_check_alias_20w

-	tlb_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_20w
+	ptl_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_20w
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb	spc,pte,prot,t1

 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1474,7 +1460,7 @@ itlb_miss_11:

 	L2_ptep		ptp,pte,t0,va,itlb_fault

-	tlb_lock	spc,ptp,pte,t0,t1,itlb_fault
+	ptl_lock	spc,ptp,pte,t0,t1,itlb_fault
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb_11	spc,pte,prot
@@ -1487,7 +1473,7 @@ itlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1498,7 +1484,7 @@ naitlb_miss_11:

 	L2_ptep		ptp,pte,t0,va,naitlb_check_alias_11

-	tlb_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_11
+	ptl_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_11
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb_11	spc,pte,prot
@@ -1511,7 +1497,7 @@ naitlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1532,7 +1518,7 @@ itlb_miss_20:

 	L2_ptep		ptp,pte,t0,va,itlb_fault

-	tlb_lock	spc,ptp,pte,t0,t1,itlb_fault
+	ptl_lock	spc,ptp,pte,t0,t1,itlb_fault
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb	spc,pte,prot,t1
@@ -1541,7 +1527,7 @@ itlb_miss_20:

 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1552,7 +1538,7 @@ naitlb_miss_20:

 	L2_ptep		ptp,pte,t0,va,naitlb_check_alias_20

-	tlb_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_20
+	ptl_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_20
 	update_accessed	ptp,pte,t0,t1

 	make_insert_tlb	spc,pte,prot,t1
@@ -1561,7 +1547,7 @@ naitlb_miss_20:

 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	ptl_unlock1	spc,t0
 	rfir
 	nop

@@ -1584,14 +1570,14 @@ dbit_trap_20w:

 	L3_ptep		ptp,pte,t0,va,dbit_fault

-	tlb_lock	spc,ptp,pte,t0,t1,dbit_fault
+	ptl_lock	spc,ptp,pte,t0,t1,dbit_fault
 	update_dirty	ptp,pte,t1

 	make_insert_tlb	spc,pte,prot,t1

 	idtlbt          pte,prot

-	tlb_unlock0	spc,t0
+	ptl_unlock0	spc,t0
 	rfir
 	nop
 #else
@@ -1604,7 +1590,7 @@ dbit_trap_11:

 	L2_ptep		ptp,pte,t0,va,dbit_fault

-	tlb_lock	spc,ptp,pte,t0,t1,dbit_fault
+	ptl_lock	spc,ptp,pte,t0,t1,dbit_fault
 	update_dirty	ptp,pte,t1

 	make_insert_tlb_11	spc,pte,prot
@@ -1617,7 +1603,7 @@ dbit_trap_11:

 	mtsp            t1, %sr1     /* Restore sr1 */

-	tlb_unlock0	spc,t0
+	ptl_unlock0	spc,t0
 	rfir
 	nop

@@ -1628,7 +1614,7 @@ dbit_trap_20:

 	L2_ptep		ptp,pte,t0,va,dbit_fault

-	tlb_lock	spc,ptp,pte,t0,t1,dbit_fault
+	ptl_lock	spc,ptp,pte,t0,t1,dbit_fault
 	update_dirty	ptp,pte,t1

 	make_insert_tlb	spc,pte,prot,t1
@@ -1637,7 +1623,7 @@ dbit_trap_20:

 	idtlbt		pte,prot

-	tlb_unlock0	spc,t0
+	ptl_unlock0	spc,t0
 	rfir
 	nop
 #endif
diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
index d7ba014a7fbb..43652de5f139 100644
=2D-- a/arch/parisc/mm/hugetlbpage.c
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -142,24 +142,17 @@ static void __set_huge_pte_at(struct mm_struct *mm, =
unsigned long addr,
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t entry)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);
 	__set_huge_pte_at(mm, addr, ptep, entry);
-	spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);
 }


 pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep)
 {
-	unsigned long flags;
 	pte_t entry;

-	spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);
 	entry =3D *ptep;
 	__set_huge_pte_at(mm, addr, ptep, __pte(0));
-	spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);

 	return entry;
 }
@@ -168,29 +161,23 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm, =
unsigned long addr,
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep)
 {
-	unsigned long flags;
 	pte_t old_pte;

-	spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);
 	old_pte =3D *ptep;
 	__set_huge_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
-	spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);
 }

 int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 				unsigned long addr, pte_t *ptep,
 				pte_t pte, int dirty)
 {
-	unsigned long flags;
 	int changed;
 	struct mm_struct *mm =3D vma->vm_mm;

-	spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);
 	changed =3D !pte_same(*ptep, pte);
 	if (changed) {
 		__set_huge_pte_at(mm, addr, ptep, pte);
 	}
-	spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);
 	return changed;
 }

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 3ec633b11b54..9ca4e4ff6895 100644
=2D-- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -37,11 +37,6 @@ extern int  data_start;
 extern void parisc_kernel_start(void);	/* Kernel entry point in head.S */

 #if CONFIG_PGTABLE_LEVELS =3D=3D 3
-/* NOTE: This layout exactly conforms to the hybrid L2/L3 page table layo=
ut
- * with the first pmd adjacent to the pgd and below it. gcc doesn't actua=
lly
- * guarantee that global objects will be laid out in memory in the same o=
rder
- * as the order of declaration, so put these in different sections and us=
e
- * the linker script to order them. */
 pmd_t pmd0[PTRS_PER_PMD] __section(".data..vm0.pmd") __attribute__ ((alig=
ned(PAGE_SIZE)));
 #endif

@@ -559,6 +554,11 @@ void __init mem_init(void)
 	BUILD_BUG_ON(PGD_ENTRY_SIZE !=3D sizeof(pgd_t));
 	BUILD_BUG_ON(PAGE_SHIFT + BITS_PER_PTE + BITS_PER_PMD + BITS_PER_PGD
 			> BITS_PER_LONG);
+#if CONFIG_PGTABLE_LEVELS =3D=3D 3
+	BUILD_BUG_ON(PT_INITIAL > PTRS_PER_PMD);
+#else
+	BUILD_BUG_ON(PT_INITIAL > PTRS_PER_PGD);
+#endif

 	high_memory =3D __va((max_pfn << PAGE_SHIFT));
 	set_max_mapnr(max_low_pfn);
=2D-
2.29.2


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322483065DE
	for <lists+linux-parisc@lfdr.de>; Wed, 27 Jan 2021 22:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbhA0VUs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 27 Jan 2021 16:20:48 -0500
Received: from mout.gmx.net ([212.227.17.22]:43675 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229817AbhA0VUp (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 27 Jan 2021 16:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611782336;
        bh=0lEh1nZuq1NnQt6PhRBV/aVwgt2jiNUfVhbyyKmLkmU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=GGLpFXKOLCdLXZy8n4QIkEUT8AQSrAPHb+b5Jxti4UiyWisPYEFE7m+VhCOa2sOQR
         9TFqmW8Uot9veHLgb/P5B9b4ifQF1MKz+GohBiOkKCH4+7BT2w/JPuCctF6MCBysTO
         75hxNPjDMnFdrMCwNigs7lsaXDbCY2+VeoNKazf0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.167.183]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPXhK-1lIXTZ3dqs-00MgDw; Wed, 27
 Jan 2021 22:18:55 +0100
Date:   Wed, 27 Jan 2021 22:18:51 +0100
From:   Helge Deller <deller@gmx.de>
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Cc:     Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] parisc: Optimize per-pagetable spinlocks (v11)
Message-ID: <20210127211851.GA32689@ls3530.fritz.box>
References: <c696f95d-a5ba-1f73-fbe9-a5d3f25e79c0@bell.net>
 <2786b971-254a-ae07-ea24-38e57bd29892@bell.net>
 <d4751664-6627-920e-9c44-7f9b7e287431@bell.net>
 <6fb36e0e-62f5-68c7-92ec-c6dd16841813@bell.net>
 <44ee7e09-90e7-0766-f0e4-bde2d3cdc2ec@bell.net>
 <5100eb80-975f-d77d-846a-5aabc25d0f95@bell.net>
 <e023991b-ba2e-f6da-94fb-0988ad70e717@bell.net>
 <9b9c6446-365f-9ca6-b89f-c330fca11952@bell.net>
 <94210da5-5642-82ef-85ae-688e1c07473d@gmx.de>
 <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
X-Provags-ID: V03:K1:/pfJX/ix4pXaCoSTlFJI4GvbQwVJUIE2x57gc24D9bY+YJCjUhz
 2FRDXQ/L0VeoBO0EI9BhkU4uT8rfGfNB3Fu9QsBw92IWV8mnuItz0X0JZwgtTq+B0RJXLWo
 ytHgUCLwJblOwWeZNO5KhPnL9fEKfc5xiRjUAKKYsKawhVx79rKM90c59lNaFC2IcjYG1YL
 DACz+OhXGErz5S8BjrRtw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WQr57gFcWzo=:prkK4K8raR5bJxtKG2HuXe
 QT0QOF2ZxwsKxvHTOPU+wz6FGDtJFULu8QfJnxbe1r1vLdM9bvkID4qK1RyQFhqZ285HcFWt7
 gMy8HOiD2aIqAag9WHGaWaKXxY0WVTmspd7az3To7hvtAyiiT9bLnJlEB4smubydbvAY6OmyO
 2M6941sKjbPREJuEkfonVuTrGflGhfOpQ/+BM8RaNF6bwww5NZ8WagMFDJ0FnndjbnYt/Y7pX
 W//nMNlHVQFvMuk75MN2pr+M6RFAV1JhSzHhB7hlfDB+VppPLIq1/zhZgkzyLUwtyEcHk55L6
 30x7DmJIix2w2odyBXb2F+dqIKS+lh+14F4G0NJl0qZ6q2N2yDKy5dvu5M+kk/xvYxBUr1/Bw
 mMR4rkOzYu+v6Uwle1aiK8fRLz2/zl4Fmk1Wc/buaEwkygSascBG29E2u3MWGCvDp23Z5Ifns
 iX8sz6OcDonPQoHNaIbxWK0Y7qtDJRXZnZ38Xl2Rqqm5Y+lf06Al0S5LxK5v6N5IGDrLOf9dL
 fv4rXvJLTcHBP/vC5NjoYGtxCGICZw3X3xMU6pFH+e729p/4NKAJHYQNquKF4fEsK/xG9haok
 +7vYu0UFrlk313vMu9eIcrL1CQfTsunoP2o2k2QeqGnWzKBDWJ91p9ukqW/aisEk4a85SDDW/
 /yaigw1RZA9j+ETWSR3HwSoD+HxHnU5GsPX6JyNXXua1bEaMTjQ0BxGFM9T26Xd6zjz/BNDWd
 ujQldys9bb7tQ/9wMOwV408An4AkLy0i1VfyiWtwMBEI8csPuCvE6YlAE2bAlotfMvSyM0uio
 rp+JXO6RtMvZuvfp0njWbcGj12J6YmWq/I+vCUxMZiwH10QN65vX6u0rcOIoF/9xdYXBi0Q3u
 OXMRfgj56BxbpcN9va4A==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On parisc a spinlock is stored in the next page behind the pgd which
protects against parallel accesses to the pgd. That's why one additional
page (PGD_ALLOC_ORDER) is allocated for the pgd.

Matthew Wilcox suggested that we instead should use a pointer in the
struct page table for this spinlock and noted, that the comments for the
PGD_ORDER and PMD_ORDER defines were wrong.

Both suggestions are addressed in this patch. The pgd spinlock
(parisc_pgd_lock) is stored in the struct page table. In
switch_mm_irqs_off() the physical address of this lock is loaded into
cr28 (tr4) and the pgd into cr25, so that the fault handlers can
directly access the lock.

The currently implemened Hybrid L2/L3 page table scheme (where the pmd
is adjacent to the pgd) is dropped now too.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: John David Anglin <dave.anglin@bell.net>

diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/include/a=
sm/mmu_context.h
index 46f8c22c5977..3e02b1f75e54 100644
=2D-- a/arch/parisc/include/asm/mmu_context.h
+++ b/arch/parisc/include/asm/mmu_context.h
@@ -5,6 +5,7 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 #include <linux/atomic.h>
+#include <linux/spinlock.h>
 #include <asm-generic/mm_hooks.h>

 /* on PA-RISC, we actually have enough contexts to justify an allocator
@@ -50,6 +51,14 @@ static inline void switch_mm_irqs_off(struct mm_struct =
*prev,
 		struct mm_struct *next, struct task_struct *tsk)
 {
 	if (prev !=3D next) {
+#ifdef CONFIG_SMP
+		/* phys address of tlb lock in cr28 (tr4) for TLB faults */
+		struct page *page;
+
+		page =3D virt_to_page((unsigned long) next->pgd);
+		/* BUG_ON(!page->parisc_pgd_lock); */
+		mtctl(__pa(__ldcw_align(&page->parisc_pgd_lock->rlock.raw_lock)), 28);
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
index a6482b2ce0ea..9c1a54543c87 100644
=2D-- a/arch/parisc/include/asm/pgalloc.h
+++ b/arch/parisc/include/asm/pgalloc.h
@@ -15,47 +15,45 @@
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
-
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
+	pgd_t *pgd;
+#ifdef CONFIG_SMP
+	spinlock_t *pgd_lock;
+	struct page *page;
 #endif
+
+	pgd =3D (pgd_t *) __get_free_pages(GFP_KERNEL, PGD_ORDER);
+	if (unlikely(pgd =3D=3D NULL))
+		return NULL;
+
+	memset(pgd, 0, PAGE_SIZE << PGD_ORDER);
+
+#ifdef CONFIG_SMP
+	/* allocate & initialize pgd_spinlock() for this PGD */
+	pgd_lock =3D kmalloc(sizeof(*pgd_lock), GFP_KERNEL);
+	if (unlikely(pgd_lock =3D=3D NULL)) {
+		free_pages((unsigned long)pgd, PGD_ORDER);
+		return NULL;
 	}
-	spin_lock_init(pgd_spinlock(actual_pgd));
-	return actual_pgd;
+
+	page =3D virt_to_page((unsigned long) pgd);
+	spin_lock_init(pgd_lock);
+	page->parisc_pgd_lock =3D pgd_lock;
+#endif
+
+	return pgd;
 }

 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-#if CONFIG_PGTABLE_LEVELS =3D=3D 3
-	pgd -=3D PTRS_PER_PGD;
+#ifdef CONFIG_SMP
+	spinlock_t *lock =3D pgd_spinlock(pgd);
+	kfree(lock);
 #endif
-	free_pages((unsigned long)pgd, PGD_ALLOC_ORDER);
+
+	free_pages((unsigned long)pgd, PGD_ORDER);
 }

 #if CONFIG_PGTABLE_LEVELS =3D=3D 3
@@ -68,43 +66,27 @@ static inline void pud_populate(struct mm_struct *mm, =
pud_t *pud, pmd_t *pmd)
 			(__u32)(__pa((unsigned long)pmd) >> PxD_VALUE_SHIFT)));
 }

-static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long ad=
dress)
+static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long ad=
dr)
 {
-	return (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);
+	pmd_t *pmd;
+
+	pmd =3D (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);
+	if (pmd)
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
index 75cf84070fc9..c08c7b37e5f4 100644
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
@@ -40,14 +38,18 @@ static inline spinlock_t *pgd_spinlock(pgd_t *);
  */
 #define kern_addr_valid(addr)	(1)

+/* PTE updates are protected by a lock per PGD in the page table struct. =
*/
+extern spinlock_t pa_swapper_pg_lock;
+#ifdef CONFIG_SMP
+extern spinlock_t *pgd_spinlock(pgd_t *pgd);
+#else
+#define pgd_spinlock(x) &pa_swapper_pg_lock
+#endif
+
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
@@ -94,10 +96,12 @@ static inline void purge_tlb_entries(struct mm_struct =
*mm, unsigned long addr)
 #define set_pte_at(mm, addr, ptep, pteval)			\
 	do {							\
 		unsigned long flags;				\
-		spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);\
+		spinlock_t *pgd_lock;				\
+		pgd_lock =3D pgd_spinlock((mm)->pgd);		\
+		spin_lock_irqsave(pgd_lock, flags);		\
 		set_pte(ptep, pteval);				\
 		purge_tlb_entries(mm, addr);			\
-		spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);\
+		spin_unlock_irqrestore(pgd_lock, flags);	\
 	} while (0)

 #endif /* !__ASSEMBLY__ */
@@ -120,12 +124,10 @@ static inline void purge_tlb_entries(struct mm_struc=
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
@@ -240,11 +242,9 @@ static inline void purge_tlb_entries(struct mm_struct=
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
@@ -326,23 +326,10 @@ extern unsigned long *empty_zero_page;
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

@@ -358,12 +345,6 @@ static inline void pmd_clear(pmd_t *pmd) {
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
@@ -456,32 +437,25 @@ extern void update_mmu_cache(struct vm_area_struct *=
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
 	unsigned long flags;
+	spinlock_t *pgd_lock;

 	if (!pte_young(*ptep))
 		return 0;

-	spin_lock_irqsave(pgd_spinlock(vma->vm_mm->pgd), flags);
+	pgd_lock =3D pgd_spinlock(vma->vm_mm->pgd);
+	spin_lock_irqsave(pgd_lock, flags);
 	pte =3D *ptep;
 	if (!pte_young(pte)) {
-		spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
+		spin_unlock_irqrestore(pgd_lock, flags);
 		return 0;
 	}
 	set_pte(ptep, pte_mkold(pte));
 	purge_tlb_entries(vma->vm_mm, addr);
-	spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
+	spin_unlock_irqrestore(pgd_lock, flags);
 	return 1;
 }

@@ -490,12 +464,14 @@ static inline pte_t ptep_get_and_clear(struct mm_str=
uct *mm, unsigned long addr,
 {
 	pte_t old_pte;
 	unsigned long flags;
+	spinlock_t *pgd_lock;

-	spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
+	pgd_lock =3D pgd_spinlock(mm->pgd);
+	spin_lock_irqsave(pgd_lock, flags);
 	old_pte =3D *ptep;
 	set_pte(ptep, __pte(0));
 	purge_tlb_entries(mm, addr);
-	spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
+	spin_unlock_irqrestore(pgd_lock, flags);

 	return old_pte;
 }
@@ -503,10 +479,13 @@ static inline pte_t ptep_get_and_clear(struct mm_str=
uct *mm, unsigned long addr,
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long=
 addr, pte_t *ptep)
 {
 	unsigned long flags;
-	spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
+	spinlock_t *pgd_lock;
+
+	pgd_lock =3D pgd_spinlock(mm->pgd);
+	spin_lock_irqsave(pgd_lock, flags);
 	set_pte(ptep, pte_wrprotect(*ptep));
 	purge_tlb_entries(mm, addr);
-	spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
+	spin_unlock_irqrestore(pgd_lock, flags);
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
index beba9816cc6c..538114d81760 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -35,10 +35,9 @@
 	.level 2.0
 #endif

-	.import		pa_tlb_lock,data
-	.macro  load_pa_tlb_lock reg
-	mfctl		%cr25,\reg
-	addil		L%(PAGE_SIZE << (PGD_ALLOC_ORDER - 1)),\reg
+	/* Load parisc_pgd_lock address from cr28/tr4 for this pgd (cr25) */
+	.macro  load_pgd_spinlock reg
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
@@ -417,29 +418,14 @@
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
@@ -448,7 +434,7 @@
 	.macro		tlb_lock	spc,ptp,pte,tmp,tmp1,fault
 #ifdef CONFIG_SMP
 98:	cmpib,COND(=3D),n	0,\spc,2f
-	load_pa_tlb_lock \tmp
+	load_pgd_spinlock \tmp
 1:	LDCW		0(\tmp),\tmp1
 	cmpib,COND(=3D)	0,\tmp1,1b
 	nop
@@ -480,9 +466,9 @@
 	/* Release pa_tlb_lock lock. */
 	.macro		tlb_unlock1	spc,tmp
 #ifdef CONFIG_SMP
-98:	load_pa_tlb_lock \tmp
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
+98:	load_pgd_spinlock \tmp
 	tlb_unlock0	\spc,\tmp
+99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	.endm

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 3ec633b11b54..4f3f180b0b20 100644
=2D-- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -681,6 +681,24 @@ static void __init parisc_bootmem_free(void)
 	free_area_init(max_zone_pfn);
 }

+static void __init parisc_init_pgd_lock(void)
+{
+	struct page *page;
+
+	page =3D virt_to_page((unsigned long) &swapper_pg_dir);
+	page->parisc_pgd_lock =3D &pa_swapper_pg_lock;
+}
+
+#ifdef CONFIG_SMP
+spinlock_t *pgd_spinlock(pgd_t *pgd)
+{
+	struct page *page;
+
+	page =3D virt_to_page((unsigned long) pgd);
+	return page->parisc_pgd_lock;
+}
+#endif
+
 void __init paging_init(void)
 {
 	setup_bootmem();
@@ -691,6 +709,7 @@ void __init paging_init(void)

 	sparse_init();
 	parisc_bootmem_free();
+	parisc_init_pgd_lock();
 }

 #ifdef CONFIG_PA20
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 07d9acb5b19c..d8520af04b7d 100644
=2D-- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -150,6 +150,7 @@ struct page {
 			union {
 				struct mm_struct *pt_mm; /* x86 pgds only */
 				atomic_t pt_frag_refcount; /* powerpc */
+				spinlock_t *parisc_pgd_lock; /* parisc pgds only */
 			};
 #if ALLOC_SPLIT_PTLOCKS
 			spinlock_t *ptl;

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496952F02E9
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Jan 2021 19:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbhAISwq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Jan 2021 13:52:46 -0500
Received: from mout.gmx.net ([212.227.15.19]:33005 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbhAISwp (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Jan 2021 13:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610218257;
        bh=/jOQAtD0hwTbXv1ib2gLTEul5US2xMvDzBJ+BVWwefs=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=Fb32zU1IT+67N+5d7aBGNyzlWtOP6wVFvQ4Puu963dFEladzqJXxcT5H9RRBcu8/6
         KMapGexAkR5jVaAnnxPgQ2WCwOcRiCsS5F0XrfMgTV3K7Yh1qB6Ej1jz08jql/juIj
         dtlrBeIdKU7ZrQtrBpg1yU4SO+xGfEqzz+6nWpH0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.151.117]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1HZo-1kweMt1EBm-002kfe; Sat, 09
 Jan 2021 19:50:57 +0100
Date:   Sat, 9 Jan 2021 19:50:51 +0100
From:   Helge Deller <deller@gmx.de>
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Matthew Wilcox <willy@infradead.org>
Subject: [RFC PATCH v2] parisc: Optimize per-pagetable spinlocks
Message-ID: <20210109185051.GA12198@ls3530.fritz.box>
References: <20210104170118.GA12722@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104170118.GA12722@ls3530.fritz.box>
X-Provags-ID: V03:K1:9tPTZcyU2yi0GPPDN95+dXBb7K1aZ9+Bbb/HL+7ET7eIr/JO2jm
 +2knCPU3LE8dP252vQuu5xQ9RMRLs8px7D+7zXeby+BcZzw0bB+mJkeLsNkrIqZflGZbspl
 YgQ1I4GLhy1Q6RRd3jjHfm1OPjLM6mSTVbejY3vXBbM31O73NH4e88W5VKYUvLfABR6bEh1
 o0SeHzHBY89DFHwPaD4CQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d4LD2pcTElI=:/VwCz7aOn/hIfVo4pC6CD+
 HTU4fq/4rFjvD2lOEi5J5kVVgOwZkqMhG/Co7m4kZHhXDjOD/KQ7JqaKiMMyPa1wYc2fVXPha
 LFb04AJGAWqZoOspxysbLnL4suXXnAwxuCcMdFOz0bk8tIIbD7CfUUvJGKw9jg6EYrTCtSysZ
 v81bLePha3uNxYAm/2ghabfT2MHfd41Dtdl5N/cS/UrS7ftgEAd/7IUwDOYJq726ILjUM7yLn
 2hgZbTKVz8x4wwMLt8HtnZK2h0i7ndTJgJOfts4M5ljatDrzdMRsIQ7cOoM5suwhdElMVm4FF
 rOG5/ZfOVAqMZm4F37DLILDwsrXJ30rdcsfCZdl5p+r8S2Gt8wG4uRy08jG6BfgZAWKam0KW0
 sXYOG+L6IQCvnH+mPVU3U3RITE/QyYoNikVLB7jeYCRug2trU6xOJekLgaxWV1/SWa5Y7Xh+d
 u06mCaem7SIHcDYW3VX9ABBIwjfkL7Y1Azafh2Yf6xmA4wPAh9diRlv0eTmooB0wrM6Rhtkz7
 xxZ3gZsDHaGP/ORXSBShWJiH+9CjDSg8+NSZI9+NJBo6PG3jVeJnY7jsvk0HR4eqyGMUq5J0o
 EVzeIVmEYhCUk2KJM4UC6Zqlj+uVCbmjSY7ynsQwBxudypfm+dO8uQtsGRyGVIp07p0iSotzm
 kPnPN4zjYERfvo8iHMmQuguZjYBOh+3b4nXQcIWLgOpXptKff8KKVA4PLpjINoG9WjReUjdj7
 /6cp9V9VcQNZ+/hW7XHUnrCT9cY1bZc6C85lQqZ6dswNbtlRhKpcXahUp3sUEOSkgugntL9Po
 LgYl8Z2s7N6yz2YluVZ1ftStGAX4LI/lausGYohHHHcl3SiBFpiAAFL0Y6x4RO9NS+DWsi1bM
 Mr7fbL41Xnk+RwrgRRPg==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* Helge Deller <deller@gmx.de>:
> On parisc a spinlock is stored in the next page behind the pgd which
> protects against parallel accesses to the pgd. That's why one additional
> page (PGD_ALLOC_ORDER) is allocated for the pgd.
>
> Matthew Wilcox suggested that we instead should use a pointer in the
> struct page table for this spinlock and noted, that the comments for
> the PGD_ORDER and PMD_ORDER defines were wrong.
>
> This patch fixes the comments and implements a parisc_pgd_lock spinlock
> in the struct page table.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
> Signed-off-by: Helge Deller <deller@gmx.de>

This is an updated v2 patch, still work-in-progress.
Instead of old patch it now loads cr28 (tr4) with pointer to tlb_lock poin=
ter
when loading the pgd into cr25 for fault handlers.

Idea to use cr28 is from Dave Anglin.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D--

diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/include/a=
sm/mmu_context.h
index 46f8c22c5977..427d95cd95ac 100644
=2D-- a/arch/parisc/include/asm/mmu_context.h
+++ b/arch/parisc/include/asm/mmu_context.h
@@ -50,6 +50,14 @@ static inline void switch_mm_irqs_off(struct mm_struct =
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
+		mtctl(__pa(page->parisc_pgd_lock), 28);
+#endif
 		mtctl(__pa(next->pgd), 25);
 		load_context(next->context);
 	}
diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/p=
galloc.h
index a6482b2ce0ea..bbda8a9c9f54 100644
=2D-- a/arch/parisc/include/asm/pgalloc.h
+++ b/arch/parisc/include/asm/pgalloc.h
@@ -26,34 +26,55 @@
  * kernel for machines with under 4GB of memory) */
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *pgd =3D (pgd_t *)__get_free_pages(GFP_KERNEL,
-					       PGD_ALLOC_ORDER);
-	pgd_t *actual_pgd =3D pgd;
+	pgd_t *pgd;
+	pmd_t *pmd;
+	spinlock_t *pgd_lock;
+	struct page *page;
+
+	pmd =3D (pmd_t *) __get_free_pages(GFP_KERNEL, PGD_ALLOC_ORDER);
+	if (unlikely(pmd =3D=3D NULL))
+		return NULL;
+
+	memset(pmd, 0, PAGE_SIZE << PGD_ALLOC_ORDER);

-	if (likely(pgd !=3D NULL)) {
-		memset(pgd, 0, PAGE_SIZE<<PGD_ALLOC_ORDER);
 #if CONFIG_PGTABLE_LEVELS =3D=3D 3
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
+	pgd =3D (pgd_t *) (pmd + PTRS_PER_PMD);
+	/*
+	 * Mark first pmd and pgd with PxD_FLAG_ATTACHED as a signal to the
+	 * system that this pmd entry may not be cleared.
+	 */
+	set_pgd(pgd, __pgd((PxD_FLAG_PRESENT |
+				PxD_FLAG_VALID |
+				PxD_FLAG_ATTACHED)
+		+ (__u32)(__pa((unsigned long)pmd) >> PxD_VALUE_SHIFT)));
+	set_pmd(pmd, __pmd(PxD_FLAG_ATTACHED));
+#else
+	pgd =3D (pgd_t *) pmd;
 #endif
+
+	/* allocate & initialize pgd_spinlock() for this PGD */
+	pgd_lock =3D kmalloc(sizeof(*pgd_lock), GFP_KERNEL);
+	if (unlikely(pgd_lock =3D=3D NULL)) {
+		free_pages((unsigned long)pmd, PGD_ALLOC_ORDER);
+		return NULL;
 	}
-	spin_lock_init(pgd_spinlock(actual_pgd));
-	return actual_pgd;
+
+	page =3D virt_to_page((unsigned long) pgd);
+	spin_lock_init(pgd_lock);
+	page->parisc_pgd_lock =3D pgd_lock;
+
+	return pgd;
 }

 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
+	spinlock_t *lock;
+
+	lock =3D pgd_spinlock(pgd);
+	kfree(lock);
+
 #if CONFIG_PGTABLE_LEVELS =3D=3D 3
-	pgd -=3D PTRS_PER_PGD;
+	pgd -=3D PTRS_PER_PMD;
 #endif
 	free_pages((unsigned long)pgd, PGD_ALLOC_ORDER);
 }
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/p=
gtable.h
index 75cf84070fc9..c26a27ef2c88 100644
=2D-- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -23,7 +23,7 @@
 #include <asm/processor.h>
 #include <asm/cache.h>

-static inline spinlock_t *pgd_spinlock(pgd_t *);
+extern spinlock_t *pgd_spinlock(pgd_t *pgd);

 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
@@ -94,10 +94,12 @@ static inline void purge_tlb_entries(struct mm_struct =
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
@@ -120,13 +122,10 @@ static inline void purge_tlb_entries(struct mm_struc=
t *mm, unsigned long addr)
 #define KERNEL_INITIAL_SIZE	(1 << KERNEL_INITIAL_ORDER)

 #if CONFIG_PGTABLE_LEVELS =3D=3D 3
-#define PGD_ORDER	1 /* Number of pages per pgd */
-#define PMD_ORDER	1 /* Number of pages per pmd */
-#define PGD_ALLOC_ORDER	(2 + 1) /* first pgd contains pmd */
-#else
-#define PGD_ORDER	1 /* Number of pages per pgd */
-#define PGD_ALLOC_ORDER	(PGD_ORDER + 1)
+#define PMD_ORDER	0
 #endif
+#define PGD_ORDER	0
+#define PGD_ALLOC_ORDER	1	/* first pmd allocated in front of pgd */

 /* Definitions for 3rd level (we use PLD here for Page Lower directory
  * because PTE_SHIFT is used lower down to mean shift that has to be
@@ -456,32 +455,25 @@ extern void update_mmu_cache(struct vm_area_struct *=
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

@@ -490,12 +482,14 @@ static inline pte_t ptep_get_and_clear(struct mm_str=
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
@@ -503,10 +497,13 @@ static inline pte_t ptep_get_and_clear(struct mm_str=
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
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index beba9816cc6c..0187a9400385 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -35,10 +35,9 @@
 	.level 2.0
 #endif

-	.import		pa_tlb_lock,data
-	.macro  load_pa_tlb_lock reg
-	mfctl		%cr25,\reg
-	addil		L%(PAGE_SIZE << (PGD_ALLOC_ORDER - 1)),\reg
+	/* Load offset to PGD Lock - needs to be 16-byte aligned! */
+	.macro  load_pgd_spinlock reg
+	mfctl	%cr28,\reg
 	.endm

 	/* space_to_prot macro creates a prot id from a space id */
@@ -448,7 +447,7 @@
 	.macro		tlb_lock	spc,ptp,pte,tmp,tmp1,fault
 #ifdef CONFIG_SMP
 98:	cmpib,COND(=3D),n	0,\spc,2f
-	load_pa_tlb_lock \tmp
+	load_pgd_spinlock \tmp
 1:	LDCW		0(\tmp),\tmp1
 	cmpib,COND(=3D)	0,\tmp1,1b
 	nop
@@ -480,9 +479,9 @@
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
index 3ec633b11b54..1bc53cb7de69 100644
=2D-- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -681,6 +681,22 @@ static void __init parisc_bootmem_free(void)
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
+spinlock_t *pgd_spinlock(pgd_t *pgd)
+{
+	struct page *page;
+
+	page =3D virt_to_page((unsigned long) pgd);
+	return page->parisc_pgd_lock;
+}
+
 void __init paging_init(void)
 {
 	setup_bootmem();
@@ -691,6 +707,7 @@ void __init paging_init(void)

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

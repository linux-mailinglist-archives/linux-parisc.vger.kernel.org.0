Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9662E9BA4
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Jan 2021 18:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbhADRDL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 4 Jan 2021 12:03:11 -0500
Received: from mout.gmx.net ([212.227.17.21]:36187 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbhADRDL (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 4 Jan 2021 12:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609779682;
        bh=GA+IqgFptitIhqE5c3f3wjQTAITIGshWZS6laXyJH0w=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=S9LboBBH8G1w7o4GZRhQAKWXZsWW5nNr7hs2hIYXvZE3t5XXElYNMcYcw7T3gzNAe
         j3wJHZJvf+Gy+mUkNtxmOiC4MwO6ZqVLyMO5P4XYogjFwfbvAM9Snsw9FvwztlrD0u
         5ragqWDBHqPZvN+7Ek311q+zjna9nYpCGWTP7QJs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.162.2]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Rm-1khYBI39cE-00LVC5; Mon, 04
 Jan 2021 18:01:22 +0100
Date:   Mon, 4 Jan 2021 18:01:18 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Optimize per-pagetable spinlocks
Message-ID: <20210104170118.GA12722@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:y2SO7nP3/bwDIgrf3cfgdg1qnWNVb9Ux+mkEtgfDz+n+WXUm622
 EG28J1NVOGO+60vtXzvoA9Gphaef1aqBbiOFKnzbVoMSk0SSmA0WbrP31oIUWXQ/tHMLBJ/
 FKj+OxdykYVWqaFXttTRD0xXbHUtUa4s0Tdw004Whlc7ozTl6e2redyFzYlOc22YCFFuVY1
 yoxaeCC7tn2e0PQQpGICg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:63hWy/EB9tI=:McJcJUZ0gbjomsLNSE9CEM
 LN1tnX3n/TQGAm2vBAp2dZFr9P+HjnZ/6ePIY+zmXr5/1EJmHNfjfChDWLQCMY5n62Afqbq6R
 jGS4WFAr/uIbB+7mqQgK2v+NbDmvHNET163dgLzis/7t2vOBkuz0y2bg9ZH67xIxOcYeO//te
 CDslMFeygVQVnsyKUuXvXjHhsheUUyp3ErHV0XScTxHH8oEv6v15VJVvgthDCjxExVoD6Hprj
 8cnIokvj7iEzORQYnzg/0dCk9dzCtoPQ2195Xyd1OlZC7CB3FzDjcvyCZHeQrryAGBV2gTlsF
 8Meu4MFRiq1hDMVf+j3cQqow2NqOhv5ENw4YwlaFOLbW18pZC4RtDeSfmOGJyVpinyFPTL58T
 GeAOI6xv3JC7ndLKXGsuLBCLvyENuZiTD+DhYRCe7PE86vZ7yFrBt+/XcLOtNsBfIC0PIIsun
 CwzNckTPLrduNb69AJ71k44gq4c1WRDM5qgs0wqvRUe8wOxiAu9R5KwzjYfgKtp2dicrIygJi
 i5za13uy6BgxiJTuZ7FZgGV7I40HqJOzzvF5GvUCHB7xtcYqn07hw1tbh681di+6fGpDxWTxa
 AnvNBuno7rg5T9pEI0sqytM5Nwj2Nm+NvtukrV3kYmEpQCkYLNRuq0W5lX0jHzBY69orPGPaf
 HqOByrutpIvYIT8jyeEX394G9lmB/BbqoHAEcDsvmrMliPeX7P4zqKzIXo0jGa7X5Em2JbtB5
 I4TDaE9eEdm+UO+eKa8EhfGs4dPsPoetQN7UXmiyDeGyWS4JQGTUqjpp2IifL2opDFD3J0xn5
 xrca/v1dMrvdJjsQT8Sg+8kBw5ncWKvA9bOtjhwhpN2r1s7q3SI0a74oIIlL2oTE0wBtZ1TR7
 JsI7x4m07GYAykhRIAiA==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On parisc a spinlock is stored in the next page behind the pgd which
protects against parallel accesses to the pgd. That's why one additional
page (PGD_ALLOC_ORDER) is allocated for the pgd.

Matthew Wilcox suggested that we instead should use a pointer in the
struct page table for this spinlock and noted, that the comments for
the PGD_ORDER and PMD_ORDER defines were wrong.

This patch fixes the comments and implements a parisc_pgd_lock spinlock
in the struct page table.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
Signed-off-by: Helge Deller <deller@gmx.de>

=2D--

diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/p=
galloc.h
index a6482b2ce0ea..4100786f5b48 100644
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
+	page->parisc_pgd_lock =3D pgd_lock;
+	spin_lock_init(pgd_lock);
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
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-off=
sets.c
index 305768a40773..9c3ccf1c91eb 100644
=2D-- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -263,6 +263,8 @@ int main(void)
 	DEFINE(TIF_BLOCKSTEP_PA_BIT, 31-TIF_BLOCKSTEP);
 	DEFINE(TIF_SINGLESTEP_PA_BIT, 31-TIF_SINGLESTEP);
 	BLANK();
+	DEFINE(ASM_PGD_LOCK_OFFSET, offsetof(struct page, parisc_pgd_lock));
+	BLANK();
 	DEFINE(ASM_PMD_SHIFT, PMD_SHIFT);
 	DEFINE(ASM_PGDIR_SHIFT, PGDIR_SHIFT);
 	DEFINE(ASM_BITS_PER_PGD, BITS_PER_PGD);
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index beba9816cc6c..8058b6aac461 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -35,10 +35,10 @@
 	.level 2.0
 #endif

-	.import		pa_tlb_lock,data
-	.macro  load_pa_tlb_lock reg
-	mfctl		%cr25,\reg
-	addil		L%(PAGE_SIZE << (PGD_ALLOC_ORDER - 1)),\reg
+	.macro  load_pgd_spinlock reg, tmp
+	mfctl	%cr25,\tmp
+	LDREG	ASM_PGD_LOCK_OFFSET(\tmp),\tmp
+	tophys	\tmp,\reg
 	.endm

 	/* space_to_prot macro creates a prot id from a space id */
@@ -448,7 +448,7 @@
 	.macro		tlb_lock	spc,ptp,pte,tmp,tmp1,fault
 #ifdef CONFIG_SMP
 98:	cmpib,COND(=3D),n	0,\spc,2f
-	load_pa_tlb_lock \tmp
+	load_pgd_spinlock \tmp,\tmp1
 1:	LDCW		0(\tmp),\tmp1
 	cmpib,COND(=3D)	0,\tmp1,1b
 	nop
@@ -478,9 +478,9 @@
 	.endm

 	/* Release pa_tlb_lock lock. */
-	.macro		tlb_unlock1	spc,tmp
+	.macro		tlb_unlock1	spc,tmp,tmp1
 #ifdef CONFIG_SMP
-98:	load_pa_tlb_lock \tmp
+98:	load_pgd_spinlock \tmp,\tmp1
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 	tlb_unlock0	\spc,\tmp
 #endif
@@ -1165,7 +1165,7 @@ dtlb_miss_20w:

 	idtlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1191,7 +1191,7 @@ nadtlb_miss_20w:

 	idtlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1225,7 +1225,7 @@ dtlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1258,7 +1258,7 @@ nadtlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1287,7 +1287,7 @@ dtlb_miss_20:

 	idtlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1315,7 +1315,7 @@ nadtlb_miss_20:

 	idtlbt		pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1422,7 +1422,7 @@ itlb_miss_20w:

 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1446,7 +1446,7 @@ naitlb_miss_20w:

 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1480,7 +1480,7 @@ itlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1504,7 +1504,7 @@ naitlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1534,7 +1534,7 @@ itlb_miss_20:

 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1554,7 +1554,7 @@ naitlb_miss_20:

 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 3ec633b11b54..0416e59d84f6 100644
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
+spinlock_t *pgd_spinlock(pgd_t *pgd)
+{
+	struct page *page;
+
+	page =3D virt_to_page((unsigned long) pgd);
+	WARN_ON(IS_ENABLED(CONFIG_DEBUG_VM) && (pgd =3D=3D swapper_pg_dir) &&
+		(page->parisc_pgd_lock !=3D &pa_swapper_pg_lock));
+	return page->parisc_pgd_lock;
+}
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

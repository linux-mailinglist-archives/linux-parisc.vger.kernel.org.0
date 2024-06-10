Return-Path: <linux-parisc+bounces-1525-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B39028EB
	for <lists+linux-parisc@lfdr.de>; Mon, 10 Jun 2024 20:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ED5B284E20
	for <lists+linux-parisc@lfdr.de>; Mon, 10 Jun 2024 18:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C1715EA6;
	Mon, 10 Jun 2024 18:53:51 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from dellerweb.de (dellerweb.de [173.249.48.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B633814C584
	for <linux-parisc@vger.kernel.org>; Mon, 10 Jun 2024 18:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.48.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718045631; cv=none; b=rUuEX6CwCG4P805dEBXL48QFYJTbiQfOpoWCWAyGaHHG7ff9XEklPNQW7xFfTtqUhTrDlDvWNzBZ7Gu4sHszsxIPuZEGyeJoPjk2iaMCVebSWR+qKoSxw2p7w4W8/v4Donkz8SoOKJZ6q72q/3wj5kDQdczmAhMHRz6Qwdkimvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718045631; c=relaxed/simple;
	bh=T+TwOYOIiY3IG7i7vf30PkSU8MrS0geb4caWuvEqYyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X545N/zuhmBI0PvuQVxczCAA8sPVTT0ElFOKfJQ68kWNhNcu/SzOP4/b/G0WCchxYZnnijO5ZZNDuTAkaH9gfoa21FnRsUY7F/P0Fm91pcTcCxPpRKNynsoAtefv55ANC+oZr2wUtwZsVhDNBfujNOelvgZZQz8bZgLJAbR77kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=parisc-linux.org; spf=pass smtp.mailfrom=parisc-linux.org; arc=none smtp.client-ip=173.249.48.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=parisc-linux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parisc-linux.org
Received: from atlas.localdomain (unknown [142.126.188.251])
	by dellerweb.de (Postfix) with ESMTPSA id D71AB160026E;
	Mon, 10 Jun 2024 20:47:09 +0200 (CEST)
Received: by atlas.localdomain (Postfix, from userid 1000)
	id 8DD8B350880; Mon, 10 Jun 2024 18:47:07 +0000 (GMT)
Date: Mon, 10 Jun 2024 18:47:07 +0000
From: John David Anglin <dave@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH v3] parisc: Try to fix random segmentation faults in package
 builds
Message-ID: <ZmdKK804ldDSpt_L@atlas>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="podLECar2ai/EDgO"
Content-Disposition: inline


--podLECar2ai/EDgO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The majority of random segmentation faults that I have looked at
appear to be memory corruption in memory allocated using mmap and
malloc.

My first attempt at fixing the random faults didn't work. On
reviewing the cache code, I realized that there were two issues
which the existing code didn't handle correctly. Both relate
to cache move-in. Another issue is that the present bit in PTEs
is racy.

1) PA-RISC caches have a mind of their own and they can speculatively
load data and instructions to a page as long as there is a entry in
the TLB for the page which allows move-in. TLBs are local to each
CPU. Thus, the TLB entry for a page must be purged before flushing
the page. This is particularly important on SMP systems.

In some of the flush routines, the flush routine would be called
and then the TLB entry would be purged. This was because the flush
routine needed the TLB entry to do the flush.

2) My initial approach to trying the fix the random faults was to
try and use flush_cache_page_if_present for all flush operations.
This actually made things worse and led to a couple of hardware
lockups. It finally dawned on me that some lines weren't being
flushed because the pte check code was racy. This resulted in
random inequivalent mappings to physical pages.

The __flush_cache_page tmpalias flush sets up its own TLB entry
and it doesn't need the existing TLB entry. As long as we can find
the pte pointer for the vm page, we can get the pfn and physical
address of the page. We can also purge the TLB entry for the page
before doing the flush. Further, __flush_cache_page uses a special
TLB entry that inhibits cache move-in.

When switching page mappings, we need to ensure that lines are
removed from the cache.  It is not sufficient to just flush the
lines to memory.

This made it clear that we needed to implement all the required
flush operations using tmpalias routines. This includes flushes
for user and kernel pages.

This change is the result of that conversion. As far as I can
tell, it fixes the random segmentation faults on c8000.

v3) After more testing, it became clear that the random segmentation
faults were not fully resolved in v2. Larger cache sizes (PA8900) and
more CPUs (rp4440) made the problem worse than on my c8000.

The warning that I added to flush_cache_page_if_present to detect
pages that couldn't be flushed triggered frequently on some systems.

Helge and I looked at the pages that couldn't be flushed and found
that the PTE was either cleared or for a swap page. Ignoring pages
that were swapped out seemed okay but pages with cleared PTEs seemed
problematic.

I looked at routines related to pte_clear and noticed ptep_clear_flush.
The default implementation just flushes the TLB entry. However, it was
obvious that on parisc we need to flush the cache page as well. If
we don't flush the cache page, stale lines will be left in the cache
and cause random corruption. Once a PTE is cleared, there is no way
to find the physical address associated with the PTE and flush the
associated page.

I implemented an updated change with a parisc specific version of
ptep_clear_flush. It fixed the random data corruption on Helge's rp4440
and rp3440, as well as on my c8000.

At this point, I realized that I could restore the code where we only
flush in flush_cache_page_if_present if the page has been accessed.
However, for this, we also need to flush the cache when the accessed
bit is cleared in ptep_clear_flush_young. Again, the default only flushes
the TLB entry.

At this time, I don't know whether it is better to always flush when
the PTE present bit is set or when both the accessed and present bits
are set. The later saves flushing pages that haven't been accessed,
but we need to flush in ptep_clear_flush_young. It also needs a page
table lookup to find the PTE pointer. The lpa instruction only needs
a page table lookup when the PTE entry isn't in the TLB. Currently, the
flush method can be selected using the CONFIG_FLUSH_PAGE_ACCESSED define
in cache.c.

Other minor changes in v3 are:

1) Implement parisc specific version of ptep_get. It's identical to
default but needed in arch/parisc/include/asm/pgtable.h.
2) Revise parisc implementation of ptep_test_and_clear_young to use
ptep_get.
3) Drop parisc implementation of ptep_get_and_clear. We can use default.

Base for patch is 6.9.3.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm=
/cacheflush.h
index ba4c05bc24d6..8597f8c387d7 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -31,18 +31,19 @@ void flush_cache_all_local(void);
 void flush_cache_all(void);
 void flush_cache_mm(struct mm_struct *mm);
=20
-void flush_kernel_dcache_page_addr(const void *addr);
-
 #define flush_kernel_dcache_range(start,size) \
 	flush_kernel_dcache_range_asm((start), (start)+(size));
=20
+/* The only way to flush a vmap range is to flush whole cache */
 #define ARCH_IMPLEMENTS_FLUSH_KERNEL_VMAP_RANGE 1
 void flush_kernel_vmap_range(void *vaddr, int size);
 void invalidate_kernel_vmap_range(void *vaddr, int size);
=20
-#define flush_cache_vmap(start, end)		flush_cache_all()
+// #define flush_cache_vmap(start, end)		flush_cache_all()
+void flush_cache_vmap(unsigned long start, unsigned long end);
 #define flush_cache_vmap_early(start, end)	do { } while (0)
-#define flush_cache_vunmap(start, end)		flush_cache_all()
+// #define flush_cache_vunmap(start, end)		flush_cache_all()
+void flush_cache_vunmap(unsigned long start, unsigned long end);
=20
 void flush_dcache_folio(struct folio *folio);
 #define flush_dcache_folio flush_dcache_folio
@@ -77,17 +78,11 @@ void flush_cache_page(struct vm_area_struct *vma, unsig=
ned long vmaddr,
 void flush_cache_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end);
=20
-/* defined in pacache.S exported in cache.c used by flush_anon_page */
-void flush_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
-
 #define ARCH_HAS_FLUSH_ANON_PAGE
 void flush_anon_page(struct vm_area_struct *vma, struct page *page, unsign=
ed long vmaddr);
=20
 #define ARCH_HAS_FLUSH_ON_KUNMAP
-static inline void kunmap_flush_on_unmap(const void *addr)
-{
-	flush_kernel_dcache_page_addr(addr);
-}
+void kunmap_flush_on_unmap(const void *addr);
=20
 #endif /* _PARISC_CACHEFLUSH_H */
=20
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pg=
table.h
index 974accac05cd..babf65751e81 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -448,14 +448,17 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return pte;
 }
=20
+static inline pte_t ptep_get(pte_t *ptep)
+{
+	return READ_ONCE(*ptep);
+}
+#define ptep_get ptep_get
+
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, un=
signed long addr, pte_t *ptep)
 {
 	pte_t pte;
=20
-	if (!pte_young(*ptep))
-		return 0;
-
-	pte =3D *ptep;
+	pte =3D ptep_get(ptep);
 	if (!pte_young(pte)) {
 		return 0;
 	}
@@ -463,17 +466,10 @@ static inline int ptep_test_and_clear_young(struct vm=
_area_struct *vma, unsigned
 	return 1;
 }
=20
-struct mm_struct;
-static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long=
 addr, pte_t *ptep)
-{
-	pte_t old_pte;
-
-	old_pte =3D *ptep;
-	set_pte(ptep, __pte(0));
-
-	return old_pte;
-}
+int ptep_clear_flush_young(struct vm_area_struct *vma, unsigned long addr,=
 pte_t *ptep);
+pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long addr, pte=
_t *ptep);
=20
+struct mm_struct;
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long =
addr, pte_t *ptep)
 {
 	set_pte(ptep, pte_wrprotect(*ptep));
@@ -511,7 +507,8 @@ static inline void ptep_set_wrprotect(struct mm_struct =
*mm, unsigned long addr,
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
=20
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
-#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+#define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
+#define __HAVE_ARCH_PTEP_CLEAR_FLUSH
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 #define __HAVE_ARCH_PTE_SAME
=20
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 422f3e1e6d9c..090dbc2b49fe 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -31,20 +31,31 @@
 #include <asm/mmu_context.h>
 #include <asm/cachectl.h>
=20
+#define PTR_PAGE_ALIGN_DOWN(addr) PTR_ALIGN_DOWN(addr, PAGE_SIZE)
+
+/*
+ * When nonzero, use _PAGE_ACCESSED bit to try to reduce the number
+ * of page flushes done flush_cache_page_if_present. There are some
+ * pros and cons in using this option. It may increase the risk of
+ * random segmentation faults.
+ */
+#define CONFIG_FLUSH_PAGE_ACCESSED	0
+
 int split_tlb __ro_after_init;
 int dcache_stride __ro_after_init;
 int icache_stride __ro_after_init;
 EXPORT_SYMBOL(dcache_stride);
=20
+/* Internal implementation in arch/parisc/kernel/pacache.S */
 void flush_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
 EXPORT_SYMBOL(flush_dcache_page_asm);
 void purge_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
 void flush_icache_page_asm(unsigned long phys_addr, unsigned long vaddr);
-
-/* Internal implementation in arch/parisc/kernel/pacache.S */
 void flush_data_cache_local(void *);  /* flushes local data-cache only */
 void flush_instruction_cache_local(void); /* flushes local code-cache only=
 */
=20
+static void flush_kernel_dcache_page_addr(const void *addr);
+
 /* On some machines (i.e., ones with the Merced bus), there can be
  * only a single PxTLB broadcast at a time; this must be guaranteed
  * by software. We need a spinlock around all TLB flushes to ensure
@@ -321,6 +332,18 @@ __flush_cache_page(struct vm_area_struct *vma, unsigne=
d long vmaddr,
 {
 	if (!static_branch_likely(&parisc_has_cache))
 		return;
+
+	/*
+	 * The TLB is the engine of coherence on parisc.  The CPU is
+	 * entitled to speculate any page with a TLB mapping, so here
+	 * we kill the mapping then flush the page along a special flush
+	 * only alias mapping. This guarantees that the page is no-longer
+	 * in the cache for any process and nor may it be speculatively
+	 * read in (until the user or kernel specifically accesses it,
+	 * of course).
+	 */
+	flush_tlb_page(vma, vmaddr);
+
 	preempt_disable();
 	flush_dcache_page_asm(physaddr, vmaddr);
 	if (vma->vm_flags & VM_EXEC)
@@ -328,46 +351,44 @@ __flush_cache_page(struct vm_area_struct *vma, unsign=
ed long vmaddr,
 	preempt_enable();
 }
=20
-static void flush_user_cache_page(struct vm_area_struct *vma, unsigned lon=
g vmaddr)
+static void flush_kernel_dcache_page_addr(const void *addr)
 {
-	unsigned long flags, space, pgd, prot;
-#ifdef CONFIG_TLB_PTLOCK
-	unsigned long pgd_lock;
-#endif
+	unsigned long vaddr =3D (unsigned long)addr;
+	unsigned long flags;
=20
-	vmaddr &=3D PAGE_MASK;
+	/* Purge TLB entry to remove translation on all CPUs */
+	purge_tlb_start(flags);
+	pdtlb(SR_KERNEL, addr);
+	purge_tlb_end(flags);
=20
+	/* Use tmpalias flush to prevent data cache move-in */
 	preempt_disable();
+	flush_dcache_page_asm(__pa(vaddr), vaddr);
+	preempt_enable();
+}
=20
-	/* Set context for flush */
-	local_irq_save(flags);
-	prot =3D mfctl(8);
-	space =3D mfsp(SR_USER);
-	pgd =3D mfctl(25);
-#ifdef CONFIG_TLB_PTLOCK
-	pgd_lock =3D mfctl(28);
-#endif
-	switch_mm_irqs_off(NULL, vma->vm_mm, NULL);
-	local_irq_restore(flags);
-
-	flush_user_dcache_range_asm(vmaddr, vmaddr + PAGE_SIZE);
-	if (vma->vm_flags & VM_EXEC)
-		flush_user_icache_range_asm(vmaddr, vmaddr + PAGE_SIZE);
-	flush_tlb_page(vma, vmaddr);
+static void flush_kernel_icache_page_addr(const void *addr)
+{
+	unsigned long vaddr =3D (unsigned long)addr;
+	unsigned long flags;
=20
-	/* Restore previous context */
-	local_irq_save(flags);
-#ifdef CONFIG_TLB_PTLOCK
-	mtctl(pgd_lock, 28);
-#endif
-	mtctl(pgd, 25);
-	mtsp(space, SR_USER);
-	mtctl(prot, 8);
-	local_irq_restore(flags);
+	/* Purge TLB entry to remove translation on all CPUs */
+	purge_tlb_start(flags);
+	pdtlb(SR_KERNEL, addr);
+	purge_tlb_end(flags);
=20
+	/* Use tmpalias flush to prevent instruction cache move-in */
+	preempt_disable();
+	flush_icache_page_asm(__pa(vaddr), vaddr);
 	preempt_enable();
 }
=20
+void kunmap_flush_on_unmap(const void *addr)
+{
+	flush_kernel_dcache_page_addr(addr);
+}
+EXPORT_SYMBOL(kunmap_flush_on_unmap);
+
 void flush_icache_pages(struct vm_area_struct *vma, struct page *page,
 		unsigned int nr)
 {
@@ -375,13 +396,16 @@ void flush_icache_pages(struct vm_area_struct *vma, s=
truct page *page,
=20
 	for (;;) {
 		flush_kernel_dcache_page_addr(kaddr);
-		flush_kernel_icache_page(kaddr);
+		flush_kernel_icache_page_addr(kaddr);
 		if (--nr =3D=3D 0)
 			break;
 		kaddr +=3D PAGE_SIZE;
 	}
 }
=20
+/*
+ * Walk page directory for MM to find PTEP pointer for address ADDR.
+ */
 static inline pte_t *get_ptep(struct mm_struct *mm, unsigned long addr)
 {
 	pte_t *ptep =3D NULL;
@@ -410,6 +434,41 @@ static inline bool pte_needs_flush(pte_t pte)
 		=3D=3D (_PAGE_PRESENT | _PAGE_ACCESSED);
 }
=20
+/*
+ * Return user physical address. Returns 0 if page is not present.
+ */
+static inline unsigned long get_upa(struct mm_struct *mm, unsigned long ad=
dr)
+{
+	unsigned long flags, space, pgd, prot, pa;
+#ifdef CONFIG_TLB_PTLOCK
+	unsigned long pgd_lock;
+#endif
+
+	/* Save context */
+	local_irq_save(flags);
+	prot =3D mfctl(8);
+	space =3D mfsp(SR_USER);
+	pgd =3D mfctl(25);
+#ifdef CONFIG_TLB_PTLOCK
+	pgd_lock =3D mfctl(28);
+#endif
+
+	/* Set context for lpa_user */
+	switch_mm_irqs_off(NULL, mm, NULL);
+	pa =3D lpa_user(addr);
+
+	/* Restore previous context */
+#ifdef CONFIG_TLB_PTLOCK
+	mtctl(pgd_lock, 28);
+#endif
+	mtctl(pgd, 25);
+	mtsp(space, SR_USER);
+	mtctl(prot, 8);
+	local_irq_restore(flags);
+
+	return pa;
+}
+
 void flush_dcache_folio(struct folio *folio)
 {
 	struct address_space *mapping =3D folio_flush_mapping(folio);
@@ -458,50 +517,23 @@ void flush_dcache_folio(struct folio *folio)
 		if (addr + nr * PAGE_SIZE > vma->vm_end)
 			nr =3D (vma->vm_end - addr) / PAGE_SIZE;
=20
-		if (parisc_requires_coherency()) {
-			for (i =3D 0; i < nr; i++) {
-				pte_t *ptep =3D get_ptep(vma->vm_mm,
-							addr + i * PAGE_SIZE);
-				if (!ptep)
-					continue;
-				if (pte_needs_flush(*ptep))
-					flush_user_cache_page(vma,
-							addr + i * PAGE_SIZE);
-				/* Optimise accesses to the same table? */
-				pte_unmap(ptep);
-			}
-		} else {
+		if (old_addr =3D=3D 0 || (old_addr & (SHM_COLOUR - 1))
+					!=3D (addr & (SHM_COLOUR - 1))) {
+			for (i =3D 0; i < nr; i++)
+				__flush_cache_page(vma,
+					addr + i * PAGE_SIZE,
+					(pfn + i) * PAGE_SIZE);
 			/*
-			 * The TLB is the engine of coherence on parisc:
-			 * The CPU is entitled to speculate any page
-			 * with a TLB mapping, so here we kill the
-			 * mapping then flush the page along a special
-			 * flush only alias mapping. This guarantees that
-			 * the page is no-longer in the cache for any
-			 * process and nor may it be speculatively read
-			 * in (until the user or kernel specifically
-			 * accesses it, of course)
+			 * Software is allowed to have any number
+			 * of private mappings to a page.
 			 */
-			for (i =3D 0; i < nr; i++)
-				flush_tlb_page(vma, addr + i * PAGE_SIZE);
-			if (old_addr =3D=3D 0 || (old_addr & (SHM_COLOUR - 1))
-					!=3D (addr & (SHM_COLOUR - 1))) {
-				for (i =3D 0; i < nr; i++)
-					__flush_cache_page(vma,
-						addr + i * PAGE_SIZE,
-						(pfn + i) * PAGE_SIZE);
-				/*
-				 * Software is allowed to have any number
-				 * of private mappings to a page.
-				 */
-				if (!(vma->vm_flags & VM_SHARED))
-					continue;
-				if (old_addr)
-					pr_err("INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %pD\n",
-						old_addr, addr, vma->vm_file);
-				if (nr =3D=3D folio_nr_pages(folio))
-					old_addr =3D addr;
-			}
+			if (!(vma->vm_flags & VM_SHARED))
+				continue;
+			if (old_addr)
+				pr_err("INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %pD\n",
+					old_addr, addr, vma->vm_file);
+			if (nr =3D=3D folio_nr_pages(folio))
+				old_addr =3D addr;
 		}
 		WARN_ON(++count =3D=3D 4096);
 	}
@@ -591,35 +623,28 @@ extern void purge_kernel_dcache_page_asm(unsigned lon=
g);
 extern void clear_user_page_asm(void *, unsigned long);
 extern void copy_user_page_asm(void *, void *, unsigned long);
=20
-void flush_kernel_dcache_page_addr(const void *addr)
-{
-	unsigned long flags;
-
-	flush_kernel_dcache_page_asm(addr);
-	purge_tlb_start(flags);
-	pdtlb(SR_KERNEL, addr);
-	purge_tlb_end(flags);
-}
-EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
-
 static void flush_cache_page_if_present(struct vm_area_struct *vma,
-	unsigned long vmaddr, unsigned long pfn)
+	unsigned long vmaddr)
 {
+#if CONFIG_FLUSH_PAGE_ACCESSED
 	bool needs_flush =3D false;
-	pte_t *ptep;
+	pte_t *ptep, pte;
=20
-	/*
-	 * The pte check is racy and sometimes the flush will trigger
-	 * a non-access TLB miss. Hopefully, the page has already been
-	 * flushed.
-	 */
 	ptep =3D get_ptep(vma->vm_mm, vmaddr);
 	if (ptep) {
-		needs_flush =3D pte_needs_flush(*ptep);
+		pte =3D ptep_get(ptep);
+		needs_flush =3D pte_needs_flush(pte);
 		pte_unmap(ptep);
 	}
 	if (needs_flush)
-		flush_cache_page(vma, vmaddr, pfn);
+		__flush_cache_page(vma, vmaddr, PFN_PHYS(pte_pfn(pte)));
+#else
+	struct mm_struct *mm =3D vma->vm_mm;
+	unsigned long physaddr =3D get_upa(mm, vmaddr);
+
+	if (physaddr)
+		__flush_cache_page(vma, vmaddr, PAGE_ALIGN_DOWN(physaddr));
+#endif
 }
=20
 void copy_user_highpage(struct page *to, struct page *from,
@@ -629,7 +654,7 @@ void copy_user_highpage(struct page *to, struct page *f=
rom,
=20
 	kfrom =3D kmap_local_page(from);
 	kto =3D kmap_local_page(to);
-	flush_cache_page_if_present(vma, vaddr, page_to_pfn(from));
+	__flush_cache_page(vma, vaddr, PFN_PHYS(page_to_pfn(from)));
 	copy_page_asm(kto, kfrom);
 	kunmap_local(kto);
 	kunmap_local(kfrom);
@@ -638,16 +663,17 @@ void copy_user_highpage(struct page *to, struct page =
*from,
 void copy_to_user_page(struct vm_area_struct *vma, struct page *page,
 		unsigned long user_vaddr, void *dst, void *src, int len)
 {
-	flush_cache_page_if_present(vma, user_vaddr, page_to_pfn(page));
+	__flush_cache_page(vma, user_vaddr, PFN_PHYS(page_to_pfn(page)));
 	memcpy(dst, src, len);
-	flush_kernel_dcache_range_asm((unsigned long)dst, (unsigned long)dst + le=
n);
+	flush_kernel_dcache_page_addr(PTR_PAGE_ALIGN_DOWN(dst));
 }
=20
 void copy_from_user_page(struct vm_area_struct *vma, struct page *page,
 		unsigned long user_vaddr, void *dst, void *src, int len)
 {
-	flush_cache_page_if_present(vma, user_vaddr, page_to_pfn(page));
+	__flush_cache_page(vma, user_vaddr, PFN_PHYS(page_to_pfn(page)));
 	memcpy(dst, src, len);
+	flush_kernel_dcache_page_addr(PTR_PAGE_ALIGN_DOWN(src));
 }
=20
 /* __flush_tlb_range()
@@ -681,32 +707,10 @@ int __flush_tlb_range(unsigned long sid, unsigned lon=
g start,
=20
 static void flush_cache_pages(struct vm_area_struct *vma, unsigned long st=
art, unsigned long end)
 {
-	unsigned long addr, pfn;
-	pte_t *ptep;
-
-	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE) {
-		bool needs_flush =3D false;
-		/*
-		 * The vma can contain pages that aren't present. Although
-		 * the pte search is expensive, we need the pte to find the
-		 * page pfn and to check whether the page should be flushed.
-		 */
-		ptep =3D get_ptep(vma->vm_mm, addr);
-		if (ptep) {
-			needs_flush =3D pte_needs_flush(*ptep);
-			pfn =3D pte_pfn(*ptep);
-			pte_unmap(ptep);
-		}
-		if (needs_flush) {
-			if (parisc_requires_coherency()) {
-				flush_user_cache_page(vma, addr);
-			} else {
-				if (WARN_ON(!pfn_valid(pfn)))
-					return;
-				__flush_cache_page(vma, addr, PFN_PHYS(pfn));
-			}
-		}
-	}
+	unsigned long addr;
+
+	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE)
+		flush_cache_page_if_present(vma, addr);
 }
=20
 static inline unsigned long mm_total_size(struct mm_struct *mm)
@@ -757,21 +761,19 @@ void flush_cache_range(struct vm_area_struct *vma, un=
signed long start, unsigned
 		if (WARN_ON(IS_ENABLED(CONFIG_SMP) && arch_irqs_disabled()))
 			return;
 		flush_tlb_range(vma, start, end);
-		flush_cache_all();
+		if (vma->vm_flags & VM_EXEC)
+			flush_cache_all();
+		else
+			flush_data_cache();
 		return;
 	}
=20
-	flush_cache_pages(vma, start, end);
+	flush_cache_pages(vma, start & PAGE_MASK, end);
 }
=20
 void flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, un=
signed long pfn)
 {
-	if (WARN_ON(!pfn_valid(pfn)))
-		return;
-	if (parisc_requires_coherency())
-		flush_user_cache_page(vma, vmaddr);
-	else
-		__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
+	__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
 }
=20
 void flush_anon_page(struct vm_area_struct *vma, struct page *page, unsign=
ed long vmaddr)
@@ -779,34 +781,125 @@ void flush_anon_page(struct vm_area_struct *vma, str=
uct page *page, unsigned lon
 	if (!PageAnon(page))
 		return;
=20
-	if (parisc_requires_coherency()) {
-		if (vma->vm_flags & VM_SHARED)
-			flush_data_cache();
-		else
-			flush_user_cache_page(vma, vmaddr);
+	__flush_cache_page(vma, vmaddr, PFN_PHYS(page_to_pfn(page)));
+}
+
+int ptep_clear_flush_young(struct vm_area_struct *vma, unsigned long addr,
+			   pte_t *ptep)
+{
+	pte_t pte =3D ptep_get(ptep);
+
+	if (!pte_young(pte))
+		return 0;
+	set_pte(ptep, pte_mkold(pte));
+#if CONFIG_FLUSH_PAGE_ACCESSED
+	__flush_cache_page(vma, addr, PFN_PHYS(pte_pfn(pte)));
+#endif
+	return 1;
+}
+
+/*
+ * After a PTE is cleared, we have no way to flush the cache for
+ * the physical page. On PA8800 and PA8900 processors, these lines
+ * can cause random cache corruption. Thus, we must flush the cache
+ * as well as the TLB when clearing a PTE that's valid.
+ */
+pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long addr,
+		       pte_t *ptep)
+{
+	struct mm_struct *mm =3D (vma)->vm_mm;
+	pte_t pte =3D ptep_get_and_clear(mm, addr, ptep);
+	unsigned long pfn =3D pte_pfn(pte);
+
+	if (pfn_valid(pfn))
+		__flush_cache_page(vma, addr, PFN_PHYS(pfn));
+	else if (pte_accessible(mm, pte))
+		flush_tlb_page(vma, addr);
+
+	return pte;
+}
+
+/*
+ * The physical address for pages in the ioremap case can be obtained
+ * from the vm_struct struct. I wasn't able to successfully handle the
+ * vmalloc and vmap cases. We have an array of struct page pointers in
+ * the uninitialized vmalloc case but the flush failed using page_to_pfn.
+ */
+void flush_cache_vmap(unsigned long start, unsigned long end)
+{
+	unsigned long addr, physaddr;
+	struct vm_struct *vm;
+
+	/* Prevent cache move-in */
+	flush_tlb_kernel_range(start, end);
+
+	if (end - start >=3D parisc_cache_flush_threshold) {
+		flush_cache_all();
 		return;
 	}
=20
-	flush_tlb_page(vma, vmaddr);
-	preempt_disable();
-	flush_dcache_page_asm(page_to_phys(page), vmaddr);
-	preempt_enable();
+	if (WARN_ON_ONCE(!is_vmalloc_addr((void *)start))) {
+		flush_cache_all();
+		return;
+	}
+
+	vm =3D find_vm_area((void *)start);
+	if (WARN_ON_ONCE(!vm)) {
+		flush_cache_all();
+		return;
+	}
+
+	/* The physical addresses of IOREMAP regions are contiguous */
+	if (vm->flags & VM_IOREMAP) {
+		physaddr =3D vm->phys_addr;
+		for (addr =3D start; addr < end; addr +=3D PAGE_SIZE) {
+			preempt_disable();
+			flush_dcache_page_asm(physaddr, start);
+			flush_icache_page_asm(physaddr, start);
+			preempt_enable();
+			physaddr +=3D PAGE_SIZE;
+		}
+		return;
+	}
+
+	flush_cache_all();
+}
+EXPORT_SYMBOL(flush_cache_vmap);
+
+/*
+ * The vm_struct has been retired and the page table is set up. The
+ * last page in the range is a guard page. Its physical address can't
+ * be determined using lpa, so there is no way to flush the range
+ * using flush_dcache_page_asm.
+ */
+void flush_cache_vunmap(unsigned long start, unsigned long end)
+{
+	/* Prevent cache move-in */
+	flush_tlb_kernel_range(start, end);
+	flush_data_cache();
 }
+EXPORT_SYMBOL(flush_cache_vunmap);
=20
+/*
+ * On systems with PA8800/PA8900 processors, there is no way to flush
+ * a vmap range other than using the architected loop to flush the
+ * entire cache. The page directory is not set up, so we can't use
+ * fdc, etc. FDCE/FICE don't work to flush a portion of the cache.
+ * L2 is physically indexed but FDCE/FICE instructions in virtual
+ * mode output their virtual address on the core bus, not their
+ * real address. As a result, the L2 cache index formed from the
+ * virtual address will most likely not be the same as the L2 index
+ * formed from the real address.
+ */
 void flush_kernel_vmap_range(void *vaddr, int size)
 {
 	unsigned long start =3D (unsigned long)vaddr;
 	unsigned long end =3D start + size;
=20
-	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
-	    (unsigned long)size >=3D parisc_cache_flush_threshold) {
-		flush_tlb_kernel_range(start, end);
-		flush_data_cache();
-		return;
-	}
+	BUG_ON(IS_ENABLED(CONFIG_SMP) && arch_irqs_disabled());
=20
-	flush_kernel_dcache_range_asm(start, end);
 	flush_tlb_kernel_range(start, end);
+	flush_data_cache();
 }
 EXPORT_SYMBOL(flush_kernel_vmap_range);
=20
@@ -818,15 +911,10 @@ void invalidate_kernel_vmap_range(void *vaddr, int si=
ze)
 	/* Ensure DMA is complete */
 	asm_syncdma();
=20
-	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
-	    (unsigned long)size >=3D parisc_cache_flush_threshold) {
-		flush_tlb_kernel_range(start, end);
-		flush_data_cache();
-		return;
-	}
+	BUG_ON(IS_ENABLED(CONFIG_SMP) && arch_irqs_disabled());
=20
-	purge_kernel_dcache_range_asm(start, end);
 	flush_tlb_kernel_range(start, end);
+	flush_data_cache();
 }
 EXPORT_SYMBOL(invalidate_kernel_vmap_range);
=20

--podLECar2ai/EDgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmZnSiQACgkQXb/Nrl8Z
TfEisA//WuENrGkM9NKUCO7nh8eF69JPZajEBwAEC0fKWt9ZLXj9Oddy19cjJecN
dj6knnFuamf3JZo5aJkr6x2BJMAwh1OTenDL0UpZfsLxZEHXB+2Yh3ezR3v1FtJF
NJB0YREZPhm36A8uKxsnzPxpj2V+N5+y95Kb9GWswEBjVkeQTaVw2JvnvxjwhwjP
FxAQtdhCBM7+5DxSxp2JxJ1ML2GZQBE+L/0LAv7uppd6w9C8bkADVTiUmjjoJRJT
P34UDFfvZmxtiw5jumZmF0qn98/3Duq7CmuQN8p/d2v9jaj/T9OierjBntTar9GT
AyTNWLPOesKgrOIMwZF4MEFWhaiFpqOZcA80RNaWPgdPfQwjlzwDCEMb98xm3srP
uMOWbqDRWnjf23IYfKMAgA0ZX1HQICIXjBQTKhW6E3FlF7fLqciB50ceWAQ5gAwZ
jlKsEwwh39XjT01kR+zR245cu/qF8hPjr8Eb9as64ETsuo5JNR4O2mDre90UeI1H
XQ6GBk3TCrm6Yqxk4ydu7iqyvydC5mZE/KDn5w75lOj1PXZr4tmg1La028SWBA4M
hFUjAMMfbH57Fm8MnRAZ9cSRo50+sGMXbNVvBLRiCjl8pCe/FkKBPLy2aDpbWUMY
bZ1Wr78xNyYJQsxKcWjfs9teBsD34+72DbpxWLMeaLDoKiazvgs=
=nvLZ
-----END PGP SIGNATURE-----

--podLECar2ai/EDgO--


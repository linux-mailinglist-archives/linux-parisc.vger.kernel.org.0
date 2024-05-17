Return-Path: <linux-parisc+bounces-1427-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CB98C8C86
	for <lists+linux-parisc@lfdr.de>; Fri, 17 May 2024 21:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA5BDB23048
	for <lists+linux-parisc@lfdr.de>; Fri, 17 May 2024 19:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5046213E41B;
	Fri, 17 May 2024 19:04:32 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from dellerweb.de (dellerweb.de [173.249.48.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BC046430
	for <linux-parisc@vger.kernel.org>; Fri, 17 May 2024 19:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.48.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715972672; cv=none; b=eIL1JB3jT4+brjwBY6GpEJVZSg02P/lnOvGTIvroHXzkJ8+lNA2971GmSno/dhMXspIMy20f7OVhwP9lFHSKtk9PYah94uznYsbnfWMcLuaXI2ccuGULoK1HrDpcPrMC2mcxFCEa51dSHhPLRgW5p4a6ejri0c9ivRyH0BcdLnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715972672; c=relaxed/simple;
	bh=e4Ymu2PNaFqYchlR9CAMbe0A9aD3hgOuC8u+bVxf3os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MolzAoJRmmUBPqo4HaY/ezEDINEg7Li+gHvmZmi+YOKAE/YVPLHgZGwEBVmWtzG68Ve+hhqYC66Rj2KLCuejJ/Mejg21gNQLpwVJWQw5W/PsvATDZ4plXKUkkpYT6SaS++AC3diKcyaK47E6FWAepAtbRzCBwUhI9sZoKikN2hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=parisc-linux.org; spf=pass smtp.mailfrom=parisc-linux.org; arc=none smtp.client-ip=173.249.48.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=parisc-linux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parisc-linux.org
Received: from atlas.localdomain (unknown [142.126.188.251])
	by dellerweb.de (Postfix) with ESMTPSA id 37FB716000A6;
	Fri, 17 May 2024 20:58:52 +0200 (CEST)
Received: by atlas.localdomain (Postfix, from userid 1000)
	id D56A83501F4; Fri, 17 May 2024 18:58:29 +0000 (GMT)
Date: Fri, 17 May 2024 18:58:29 +0000
From: John David Anglin <dave@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH v2] parisc: Try to fix random segmentation faults in package
 builds
Message-ID: <Zkeo1UxDTcJtBZTl@atlas>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j/KKSZiNq/9kp796"
Content-Disposition: inline


--j/KKSZiNq/9kp796
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

Base for patch is 6.8.9.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm=
/cacheflush.h
index ba4c05bc24d6..dd8a29aaff60 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -31,8 +31,6 @@ void flush_cache_all_local(void);
 void flush_cache_all(void);
 void flush_cache_mm(struct mm_struct *mm);
=20
-void flush_kernel_dcache_page_addr(const void *addr);
-
 #define flush_kernel_dcache_range(start,size) \
 	flush_kernel_dcache_range_asm((start), (start)+(size));
=20
@@ -77,17 +75,11 @@ void flush_cache_page(struct vm_area_struct *vma, unsig=
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
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 422f3e1e6d9c..0aa99c9d7cc3 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -36,15 +36,16 @@ int dcache_stride __ro_after_init;
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
@@ -321,6 +322,18 @@ __flush_cache_page(struct vm_area_struct *vma, unsigne=
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
@@ -328,46 +341,44 @@ __flush_cache_page(struct vm_area_struct *vma, unsign=
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
@@ -375,7 +386,7 @@ void flush_icache_pages(struct vm_area_struct *vma, str=
uct page *page,
=20
 	for (;;) {
 		flush_kernel_dcache_page_addr(kaddr);
-		flush_kernel_icache_page(kaddr);
+		flush_kernel_icache_page_addr(kaddr);
 		if (--nr =3D=3D 0)
 			break;
 		kaddr +=3D PAGE_SIZE;
@@ -404,12 +415,6 @@ static inline pte_t *get_ptep(struct mm_struct *mm, un=
signed long addr)
 	return ptep;
 }
=20
-static inline bool pte_needs_flush(pte_t pte)
-{
-	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_NO_CACHE))
-		=3D=3D (_PAGE_PRESENT | _PAGE_ACCESSED);
-}
-
 void flush_dcache_folio(struct folio *folio)
 {
 	struct address_space *mapping =3D folio_flush_mapping(folio);
@@ -458,50 +463,23 @@ void flush_dcache_folio(struct folio *folio)
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
@@ -591,35 +569,22 @@ extern void purge_kernel_dcache_page_asm(unsigned lon=
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
-	bool needs_flush =3D false;
 	pte_t *ptep;
+	unsigned long pfn;
=20
-	/*
-	 * The pte check is racy and sometimes the flush will trigger
-	 * a non-access TLB miss. Hopefully, the page has already been
-	 * flushed.
-	 */
 	ptep =3D get_ptep(vma->vm_mm, vmaddr);
-	if (ptep) {
-		needs_flush =3D pte_needs_flush(*ptep);
-		pte_unmap(ptep);
-	}
-	if (needs_flush)
-		flush_cache_page(vma, vmaddr, pfn);
+	if (!ptep)
+		return;
+
+	pfn =3D pte_pfn(*ptep);
+	if (WARN_ON(!pfn_valid(pfn)))
+		return;
+
+	__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
+	pte_unmap(ptep);
 }
=20
 void copy_user_highpage(struct page *to, struct page *from,
@@ -629,7 +594,7 @@ void copy_user_highpage(struct page *to, struct page *f=
rom,
=20
 	kfrom =3D kmap_local_page(from);
 	kto =3D kmap_local_page(to);
-	flush_cache_page_if_present(vma, vaddr, page_to_pfn(from));
+	__flush_cache_page(vma, vaddr, PFN_PHYS(page_to_pfn(from)));
 	copy_page_asm(kto, kfrom);
 	kunmap_local(kto);
 	kunmap_local(kfrom);
@@ -638,7 +603,7 @@ void copy_user_highpage(struct page *to, struct page *f=
rom,
 void copy_to_user_page(struct vm_area_struct *vma, struct page *page,
 		unsigned long user_vaddr, void *dst, void *src, int len)
 {
-	flush_cache_page_if_present(vma, user_vaddr, page_to_pfn(page));
+	__flush_cache_page(vma, user_vaddr, PFN_PHYS(page_to_pfn(page)));
 	memcpy(dst, src, len);
 	flush_kernel_dcache_range_asm((unsigned long)dst, (unsigned long)dst + le=
n);
 }
@@ -646,7 +611,7 @@ void copy_to_user_page(struct vm_area_struct *vma, stru=
ct page *page,
 void copy_from_user_page(struct vm_area_struct *vma, struct page *page,
 		unsigned long user_vaddr, void *dst, void *src, int len)
 {
-	flush_cache_page_if_present(vma, user_vaddr, page_to_pfn(page));
+	__flush_cache_page(vma, user_vaddr, PFN_PHYS(page_to_pfn(page)));
 	memcpy(dst, src, len);
 }
=20
@@ -681,32 +646,10 @@ int __flush_tlb_range(unsigned long sid, unsigned lon=
g start,
=20
 static void flush_cache_pages(struct vm_area_struct *vma, unsigned long st=
art, unsigned long end)
 {
-	unsigned long addr, pfn;
-	pte_t *ptep;
+	unsigned long addr;
=20
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
+	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE)
+		flush_cache_page_if_present(vma, addr);
 }
=20
 static inline unsigned long mm_total_size(struct mm_struct *mm)
@@ -766,12 +709,7 @@ void flush_cache_range(struct vm_area_struct *vma, uns=
igned long start, unsigned
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
@@ -779,34 +717,29 @@ void flush_anon_page(struct vm_area_struct *vma, stru=
ct page *page, unsigned lon
 	if (!PageAnon(page))
 		return;
=20
-	if (parisc_requires_coherency()) {
-		if (vma->vm_flags & VM_SHARED)
-			flush_data_cache();
-		else
-			flush_user_cache_page(vma, vmaddr);
-		return;
-	}
-
-	flush_tlb_page(vma, vmaddr);
-	preempt_disable();
-	flush_dcache_page_asm(page_to_phys(page), vmaddr);
-	preempt_enable();
+	__flush_cache_page(vma, vmaddr, PFN_PHYS(page_to_pfn(page)));
 }
=20
 void flush_kernel_vmap_range(void *vaddr, int size)
 {
 	unsigned long start =3D (unsigned long)vaddr;
 	unsigned long end =3D start + size;
+	unsigned long addr;
+
+	/* Remove TLB entries for range */
+	flush_tlb_kernel_range(start, end);
=20
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    (unsigned long)size >=3D parisc_cache_flush_threshold) {
-		flush_tlb_kernel_range(start, end);
 		flush_data_cache();
 		return;
 	}
=20
-	flush_kernel_dcache_range_asm(start, end);
-	flush_tlb_kernel_range(start, end);
+	/* Use tmpalias flush to ensure no lines remain in data cache */
+	preempt_disable();
+	for (addr =3D start & PAGE_MASK; addr < end; addr +=3D PAGE_SIZE)
+		flush_dcache_page_asm(__pa(addr), addr);
+	preempt_enable();
 }
 EXPORT_SYMBOL(flush_kernel_vmap_range);
=20
@@ -814,19 +747,25 @@ void invalidate_kernel_vmap_range(void *vaddr, int si=
ze)
 {
 	unsigned long start =3D (unsigned long)vaddr;
 	unsigned long end =3D start + size;
+	unsigned long addr;
=20
 	/* Ensure DMA is complete */
 	asm_syncdma();
=20
+	/* Remove TLB entries for range */
+	flush_tlb_kernel_range(start, end);
+
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    (unsigned long)size >=3D parisc_cache_flush_threshold) {
-		flush_tlb_kernel_range(start, end);
 		flush_data_cache();
 		return;
 	}
=20
-	purge_kernel_dcache_range_asm(start, end);
-	flush_tlb_kernel_range(start, end);
+	/* Use tmpalias purge to ensure no lines remain in data cache */
+	preempt_disable();
+	for (addr =3D start & PAGE_MASK; addr < end; addr +=3D PAGE_SIZE)
+		purge_dcache_page_asm(__pa(addr), addr);
+	preempt_enable();
 }
 EXPORT_SYMBOL(invalidate_kernel_vmap_range);
=20

--j/KKSZiNq/9kp796
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmZHqM8ACgkQXb/Nrl8Z
TfFD2RAAlqqJmvFYOso/jphNuFkTAWuHVKZBcWiEN9k/MSugas3XGNDoePO8ilV/
3XNsCfPeATX0XejQc2uxSTwiJAVmG67HOJRT3HRY+e95orNRqkSuLw6LWWFaRn0D
XhKua6TNCVpHkEroBlfs3HzL+vR2+pZkGRvXtt/4N0hLlj/E6XqAgnPCLRDECTzw
LNRWFZTfMorzzKKgG7OziAArpVPW97gdlcsKYxNZ2qdY2Kp9fK0Pjs/GzJYZNs6w
dHAae5AtyRobg+jV73Rnbs0JVKH6w5b4s1GQIG3sd6gRBTLg4qfr42OtizUKJnVh
uvfMh312sVxYfn1ore4uTx/bXJFxKnUqO9CL332JKgOM9PFqEDWPs/Lp5F3wJQgo
7hQMG4dGXp0h8TZMlWf6dM3JHucz5SN1zk896dbAIPTDZ+4VFa8yHwuxNPb2WRgY
ZkAth5olSB6g8aM6k35MV6OPSJ05hDnN+ANL+QF/C2W/ihGQBB5hGj7nUVfZv5Wj
od74VbSplypywHGqZT7I48n5O7Pqx8Z5/BI4AB5QTpzaauaD0Uwn/YtEybgabqW/
2jpWfqKcPPX4Q2cUqTnVzw4L3p9sa7Sv6121ZzSd62cBp+gjnSs82L2NOUBfzuR1
nn5+Ofi5inmhzgeiLxCj00RC8EZ04C7H4CRVfp4Log9VcDL0hYQ=
=kY9C
-----END PGP SIGNATURE-----

--j/KKSZiNq/9kp796--


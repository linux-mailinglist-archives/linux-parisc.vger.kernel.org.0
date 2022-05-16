Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F009528840
	for <lists+linux-parisc@lfdr.de>; Mon, 16 May 2022 17:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241555AbiEPPP2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 May 2022 11:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbiEPPPZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 May 2022 11:15:25 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 591293BBDE
        for <linux-parisc@vger.kernel.org>; Mon, 16 May 2022 08:15:17 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 627B9E56010C7727
X-CM-Envelope: MS4xfJ34MY9Ub6o52tjLGD07vpqROIjhL7BK8MwilVgIEACnsUimnfhOGZhR7r1Cs9rklL1I5n3502OU/D4m3mCutHSNC88qwue6UIRMf8Lzd/SoQ6lw4BQJ
 ZuPLl/ggr72ILOJJLHswDtVxHmsc+uzd2dob9A4r1YnukkwOn0gMtAwKQ0/3oMDBHoLvGOqLL702YccEu3WziwN5y4jKToT2g3DdcGTKumicYzL8EMTK2aSU
 iTfdxveJxuGF78RqHv4z8MDBZIRE3nZCQlWzONMf0pMusFIbr9KL88lZuA5MII46hm296j8tB2eOhHjogy2p99zhGgZIQrxRxHk80BEjf5z4UrNlM7DAVZbw
 h3WhfgjNhf9NSJXz0pCZ26QjwXsQ8yCwEy2gq/hl2uiO40rOMc1oPSedRwgehwVVlua5X1Thr7fAR5NEhqPPUde4kqflUuW7yiVt95B19RbX9HyaEDf+ekiM
 /J2tXpGqcOmnOJvToGLXhlzGxHYBycviNLCPvwyijpIG3b36J+I2eN5sQ8K7M0BGRFWWNKP7iz4JgxbTgglpXOLTgyQALZUjpaWzHaWXLBsx0RSFEsq87C8U
 i63M9P+6JAMYStVbm/RJCVxW0HZA8Tr/bTbV+1A3ruZghw==
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=62826a69
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=oZkIemNP1mAA:10 a=FBHGMhGWAAAA:8 a=pW4FqtQuzCdA2SmXqPgA:9 a=CjuIK1q_8ugA:10
 a=FDO7BsGK1_90p_UZdnIA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 627B9E56010C7727; Mon, 16 May 2022 11:14:49 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 85C8D220115; Mon, 16 May 2022 15:14:48 +0000 (UTC)
Date:   Mon, 16 May 2022 15:14:47 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Message-ID: <YoJqZ2rUA25360Ld@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IEeCgUwxdhPggHCt"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--IEeCgUwxdhPggHCt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Originally, I was convinced that we needed to use tmpalias flushes
everwhere, for both user and kernel flushes. However, when I modified
flush_kernel_dcache_page_addr, to use a tmpalias flush, my c8000
would crash quite early when booting.

The PDC returns alias values of 0 for the icache and dcache. This
indicates that either the alias boundary is greater than 16MB or
equivalent aliasing doesn't work. I modified the tmpalias code to
make it easy to try alternate boundaries. I tried boundaries up to
128MB but still kernel tmpalias flushes didn't work on c8000.

This led me to conclude that tmpalias flushes don't work on PA8800
and PA8900 machines, and that we needed to flush directly using the
virtual address of user and kernel pages. This is likely the major
cause of instability on the c8000 and rp34xx machines.

Flushing user pages requires doing a temporary context switch as we
have to flush pages that don't belong to the current context. Further,
we have to deal with pages that aren't present. If a page isn't
present, the flush instructions fault on every line.

Other code has been rearranged and simplified based on testing. For
example, I introduced a flush_cache_dup_mm routine. flush_cache_mm
and flush_cache_dup_mm differ in that flush_cache_mm calls
purge_cache_pages and flush_cache_dup_mm calls flush_cache_pages.
In some implementations, pdc is more efficient than fdc. Based on
my testing, I don't believe there's any performance benefit on the
c8000.

V2:
1) Add flush_cache_page_check_pte routine.
2) Use it in copy_to_user_page and copy_from_user_page.
3) flush_anon_page moved to cache.c and updated.
4) Changed alias boundary to 64 MB for 64-bit kernels. Revised comment
   regarding alias boundary for PA8800/PA8900 processors.
5) Removed struct mm_struct * argument from flush_cache_pages.
6) Fixed thinko in flush_cache_range. It increased the number of pages
   flushed and slowed performance.
7) Removed sync changes from pacache.S.

V3:
1) copy_to_user_page and copy_from_user_page moved to cache.c to
   improve inlining.
2) Replaced copy_user_page with copy_user_highpage.
3) Fixed cache threshold calculation on 32-bit kernels.
4) Don't warn on inequivalent private mappings in flush_dcache_page.
5) Return early from mm_total_size if size exceeds
   parisc_cache_flush_threshold.
6) Disable non-access TLB warning in handle_nadtlb_fault. Warning
   happens occassionally handling flushes for COW faults.
7) Remove flush_cache_dup_mm.
8) Flush entire cache in flush_cache_mm and flush_cache_range on
   processors with aliasing caches. Only flush small cache ranges
   on machines with PA8800/PA8900 processors.
9) Tested on rp3440, c8000 and c3750.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm=
/cacheflush.h
index e8b4a03343d3..8331930ac695 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -59,19 +59,8 @@ void flush_dcache_page(struct page *page);
 	flush_kernel_icache_range_asm(s,e); 		\
 } while (0)
=20
-#define copy_to_user_page(vma, page, vaddr, dst, src, len) \
-do { \
-	flush_cache_page(vma, vaddr, page_to_pfn(page)); \
-	memcpy(dst, src, len); \
-	flush_kernel_dcache_range_asm((unsigned long)dst, (unsigned long)dst + le=
n); \
-} while (0)
-
-#define copy_from_user_page(vma, page, vaddr, dst, src, len) \
-do { \
-	flush_cache_page(vma, vaddr, page_to_pfn(page)); \
-	memcpy(dst, src, len); \
-} while (0)
-
+void copy_to_user_page(struct vm_area_struct *vma, struct page *page, unsi=
gned long user_vaddr, void *dst, void *src, int len);
+void copy_from_user_page(struct vm_area_struct *vma, struct page *page, un=
signed long user_vaddr, void *dst, void *src, int len);
 void flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, un=
signed long pfn);
 void flush_cache_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end);
@@ -80,16 +69,7 @@ void flush_cache_range(struct vm_area_struct *vma,
 void flush_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
=20
 #define ARCH_HAS_FLUSH_ANON_PAGE
-static inline void
-flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned lo=
ng vmaddr)
-{
-	if (PageAnon(page)) {
-		flush_tlb_page(vma, vmaddr);
-		preempt_disable();
-		flush_dcache_page_asm(page_to_phys(page), vmaddr);
-		preempt_enable();
-	}
-}
+void flush_anon_page(struct vm_area_struct *vma, struct page *page, unsign=
ed long vmaddr);
=20
 #define ARCH_HAS_FLUSH_ON_KUNMAP
 static inline void kunmap_flush_on_unmap(void *addr)
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index 0561568f7b48..20c89ed9d7da 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -26,12 +26,13 @@
 #define copy_page(to, from)	copy_page_asm((void *)(to), (void *)(from))
=20
 struct page;
+struct vm_area_struct;
=20
 void clear_page_asm(void *page);
 void copy_page_asm(void *to, void *from);
 #define clear_user_page(vto, vaddr, page) clear_page_asm(vto)
-void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
-			struct page *pg);
+void copy_user_highpage(struct page *to, struct page *from, unsigned long =
vaddr, struct vm_area_struct *vma);
+#define __HAVE_ARCH_COPY_USER_HIGHPAGE
=20
 /*
  * These are used to make use of C type-checking..
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index ee637c55f2b1..618dfda3549e 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -27,6 +27,7 @@
 #include <asm/processor.h>
 #include <asm/sections.h>
 #include <asm/shmparam.h>
+#include <asm/mmu_context.h>
=20
 int split_tlb __ro_after_init;
 int dcache_stride __ro_after_init;
@@ -91,7 +92,7 @@ static inline void flush_data_cache(void)
 }
=20
=20
-/* Virtual address of pfn.  */
+/* Kernel virtual address of pfn.  */
 #define pfn_va(pfn)	__va(PFN_PHYS(pfn))
=20
 void
@@ -124,11 +125,13 @@ show_cache_info(struct seq_file *m)
 		cache_info.ic_size/1024 );
 	if (cache_info.dc_loop !=3D 1)
 		snprintf(buf, 32, "%lu-way associative", cache_info.dc_loop);
-	seq_printf(m, "D-cache\t\t: %ld KB (%s%s, %s)\n",
+	seq_printf(m, "D-cache\t\t: %ld KB (%s%s, %s, alias=3D%d)\n",
 		cache_info.dc_size/1024,
 		(cache_info.dc_conf.cc_wt ? "WT":"WB"),
 		(cache_info.dc_conf.cc_sh ? ", shared I/D":""),
-		((cache_info.dc_loop =3D=3D 1) ? "direct mapped" : buf));
+		((cache_info.dc_loop =3D=3D 1) ? "direct mapped" : buf),
+		cache_info.dc_conf.cc_alias
+	);
 	seq_printf(m, "ITLB entries\t: %ld\n" "DTLB entries\t: %ld%s\n",
 		cache_info.it_size,
 		cache_info.dt_size,
@@ -324,25 +327,77 @@ __flush_cache_page(struct vm_area_struct *vma, unsign=
ed long vmaddr,
 	preempt_enable();
 }
=20
-static inline void
-__purge_cache_page(struct vm_area_struct *vma, unsigned long vmaddr,
-		   unsigned long physaddr)
+static void flush_user_cache_page(struct vm_area_struct *vma, unsigned lon=
g vmaddr)
 {
-	if (!static_branch_likely(&parisc_has_cache))
-		return;
+	unsigned long flags, space, pgd, prot;
+#ifdef CONFIG_TLB_PTLOCK
+	unsigned long pgd_lock;
+#endif
+
+	vmaddr &=3D PAGE_MASK;
+
 	preempt_disable();
-	purge_dcache_page_asm(physaddr, vmaddr);
+
+	/* Set context for flush */
+	local_irq_save(flags);
+	prot =3D mfctl(8);
+	space =3D mfsp(SR_USER);
+	pgd =3D mfctl(25);
+#ifdef CONFIG_TLB_PTLOCK
+	pgd_lock =3D mfctl(28);
+#endif
+	switch_mm_irqs_off(NULL, vma->vm_mm, NULL);
+	local_irq_restore(flags);
+
+	flush_user_dcache_range_asm(vmaddr, vmaddr + PAGE_SIZE);
 	if (vma->vm_flags & VM_EXEC)
-		flush_icache_page_asm(physaddr, vmaddr);
+		flush_user_icache_range_asm(vmaddr, vmaddr + PAGE_SIZE);
+	flush_tlb_page(vma, vmaddr);
+
+	/* Restore previous context */
+	local_irq_save(flags);
+#ifdef CONFIG_TLB_PTLOCK
+	mtctl(pgd_lock, 28);
+#endif
+	mtctl(pgd, 25);
+	mtsp(space, SR_USER);
+	mtctl(prot, 8);
+	local_irq_restore(flags);
+
 	preempt_enable();
 }
=20
+static inline pte_t *get_ptep(struct mm_struct *mm, unsigned long addr)
+{
+	pte_t *ptep =3D NULL;
+	pgd_t *pgd =3D mm->pgd;
+
+	if (!pgd_none(*pgd)) {
+		p4d_t *p4d =3D p4d_offset(pgd, addr);
+		if (!p4d_none(*p4d)) {
+			pud_t *pud =3D pud_offset(p4d, addr);
+			if (!pud_none(*pud)) {
+				pmd_t *pmd =3D pmd_offset(pud, addr);
+				if (!pmd_none(*pmd))
+					ptep =3D pte_offset_map(pmd, addr);
+			}
+		}
+	}
+	return ptep;
+}
+
+static inline bool pte_flush(pte_t pte)
+{
+	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_NO_CACHE))=
 =3D=3D (_PAGE_PRESENT | _PAGE_ACCESSED);
+}
+
 void flush_dcache_page(struct page *page)
 {
 	struct address_space *mapping =3D page_mapping_file(page);
 	struct vm_area_struct *mpnt;
 	unsigned long offset;
 	unsigned long addr, old_addr =3D 0;
+	unsigned long count =3D 0;
 	pgoff_t pgoff;
=20
 	if (mapping && !mapping_mapped(mapping)) {
@@ -357,33 +412,48 @@ void flush_dcache_page(struct page *page)
=20
 	pgoff =3D page->index;
=20
-	/* We have carefully arranged in arch_get_unmapped_area() that
+	/*
+	 * We have carefully arranged in arch_get_unmapped_area() that
 	 * *any* mappings of a file are always congruently mapped (whether
 	 * declared as MAP_PRIVATE or MAP_SHARED), so we only need
-	 * to flush one address here for them all to become coherent */
-
+	 * to flush one address here for them all to become coherent
+	 * on machines that support equivalent aliasing
+	 */
 	flush_dcache_mmap_lock(mapping);
 	vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
 		offset =3D (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
 		addr =3D mpnt->vm_start + offset;
-
-		/* The TLB is the engine of coherence on parisc: The
-		 * CPU is entitled to speculate any page with a TLB
-		 * mapping, so here we kill the mapping then flush the
-		 * page along a special flush only alias mapping.
-		 * This guarantees that the page is no-longer in the
-		 * cache for any process and nor may it be
-		 * speculatively read in (until the user or kernel
-		 * specifically accesses it, of course) */
-
-		flush_tlb_page(mpnt, addr);
-		if (old_addr =3D=3D 0 || (old_addr & (SHM_COLOUR - 1))
-				      !=3D (addr & (SHM_COLOUR - 1))) {
-			__flush_cache_page(mpnt, addr, page_to_phys(page));
-			if (parisc_requires_coherency() && old_addr)
-				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %pD\n", =
old_addr, addr, mpnt->vm_file);
-			old_addr =3D addr;
+		if (parisc_requires_coherency()) {
+			pte_t *ptep =3D get_ptep(mpnt->vm_mm, addr);
+			if (ptep && pte_flush(*ptep))
+				flush_user_cache_page(mpnt, addr);
+		} else {
+			/*
+			 * The TLB is the engine of coherence on parisc:
+			 * The CPU is entitled to speculate any page
+			 * with a TLB mapping, so here we kill the
+			 * mapping then flush the page along a special
+			 * flush only alias mapping. This guarantees that
+			 * the page is no-longer in the cache for any
+			 * process and nor may it be speculatively read
+			 * in (until the user or kernel specifically
+			 * accesses it, of course)
+			 */
+			flush_tlb_page(mpnt, addr);
+			if (old_addr =3D=3D 0 || (old_addr & (SHM_COLOUR - 1)) !=3D (addr & (SH=
M_COLOUR - 1))) {
+				__flush_cache_page(mpnt, addr, page_to_phys(page));
+				/*
+				 * Software is allowed to have any number
+				 * of private mappings to a page.
+				 */
+				if (!(mpnt->vm_flags & VM_SHARED))
+					continue;
+				if (old_addr)
+					printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %pD\n",=
 old_addr, addr, mpnt->vm_file);
+				old_addr =3D addr;
+			}
 		}
+		BUG_ON(++count > 4096);
 	}
 	flush_dcache_mmap_unlock(mapping);
 }
@@ -403,7 +473,7 @@ void __init parisc_setup_cache_timing(void)
 {
 	unsigned long rangetime, alltime;
 	unsigned long size;
-	unsigned long threshold;
+	unsigned long threshold, threshold2;
=20
 	alltime =3D mfctl(16);
 	flush_data_cache();
@@ -417,11 +487,16 @@ void __init parisc_setup_cache_timing(void)
 	printk(KERN_DEBUG "Whole cache flush %lu cycles, flushing %lu bytes %lu c=
ycles\n",
 		alltime, size, rangetime);
=20
-	threshold =3D L1_CACHE_ALIGN(size * alltime / rangetime);
-	if (threshold > cache_info.dc_size)
-		threshold =3D cache_info.dc_size;
-	if (threshold)
-		parisc_cache_flush_threshold =3D threshold;
+	threshold =3D L1_CACHE_ALIGN((unsigned long)((uint64_t)size * alltime / r=
angetime));
+	printk(KERN_INFO "Calculated flush threshold is %lu KiB\n",
+		threshold/1024);
+
+	/*
+	 * The threshold computed above isn't very reliable. The following
+	 * heuristic works reasonably well on c8000/rp3440.
+	 */
+	threshold2 =3D cache_info.dc_size * num_online_cpus();
+	parisc_cache_flush_threshold =3D threshold2;
 	printk(KERN_INFO "Cache flush threshold set to %lu KiB\n",
 		parisc_cache_flush_threshold/1024);
=20
@@ -477,19 +552,44 @@ void flush_kernel_dcache_page_addr(void *addr)
 }
 EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
=20
-void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
-	struct page *pg)
+static void flush_cache_page_if_present(struct vm_area_struct *vma, unsign=
ed long vmaddr, unsigned long pfn)
 {
-       /* Copy using kernel mapping.  No coherency is needed (all in
-	  kunmap) for the `to' page.  However, the `from' page needs to
-	  be flushed through a mapping equivalent to the user mapping
-	  before it can be accessed through the kernel mapping. */
-	preempt_disable();
-	flush_dcache_page_asm(__pa(vfrom), vaddr);
-	copy_page_asm(vto, vfrom);
-	preempt_enable();
+	pte_t *ptep =3D get_ptep(vma->vm_mm, vmaddr);
+
+	/*
+	 * The pte check is racy and sometimes the flush will trigger
+	 * a non-access TLB miss. Hopefully, the page has already been
+	 * flushed.
+	 */
+	if (ptep && pte_flush(*ptep))
+		flush_cache_page(vma, vmaddr, pfn);
+}
+
+void copy_user_highpage(struct page *to, struct page *from,
+	unsigned long vaddr, struct vm_area_struct *vma)
+{
+	void *kto, *kfrom;
+
+	kfrom =3D kmap_local_page(from);
+	kto =3D kmap_local_page(to);
+	flush_cache_page_if_present(vma, vaddr, page_to_pfn(from));
+	copy_page_asm(kto, kfrom);
+	kunmap_local(kto);
+	kunmap_local(kfrom);
+}
+
+void copy_to_user_page(struct vm_area_struct *vma, struct page *page, unsi=
gned long user_vaddr, void *dst, void *src, int len)
+{
+	flush_cache_page_if_present(vma, user_vaddr, page_to_pfn(page));
+	memcpy(dst, src, len);
+	flush_kernel_dcache_range_asm((unsigned long)dst, (unsigned long)dst + le=
n);
+}
+
+void copy_from_user_page(struct vm_area_struct *vma, struct page *page, un=
signed long user_vaddr, void *dst, void *src, int len)
+{
+	flush_cache_page_if_present(vma, user_vaddr, page_to_pfn(page));
+	memcpy(dst, src, len);
 }
-EXPORT_SYMBOL(copy_user_page);
=20
 /* __flush_tlb_range()
  *
@@ -520,91 +620,99 @@ int __flush_tlb_range(unsigned long sid, unsigned lon=
g start,
 	return 0;
 }
=20
-static inline unsigned long mm_total_size(struct mm_struct *mm)
+static void flush_cache_pages(struct vm_area_struct *vma, unsigned long st=
art, unsigned long end)
 {
-	struct vm_area_struct *vma;
-	unsigned long usize =3D 0;
-
-	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
-		usize +=3D vma->vm_end - vma->vm_start;
-	return usize;
-}
-
-static inline pte_t *get_ptep(pgd_t *pgd, unsigned long addr)
-{
-	pte_t *ptep =3D NULL;
+	unsigned long addr, pfn;
+	pte_t *ptep;
=20
-	if (!pgd_none(*pgd)) {
-		p4d_t *p4d =3D p4d_offset(pgd, addr);
-		if (!p4d_none(*p4d)) {
-			pud_t *pud =3D pud_offset(p4d, addr);
-			if (!pud_none(*pud)) {
-				pmd_t *pmd =3D pmd_offset(pud, addr);
-				if (!pmd_none(*pmd))
-					ptep =3D pte_offset_map(pmd, addr);
+	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE) {
+		/*
+		 * The vma can contain pages that aren't present. Although
+		 * the pte search is expensive, we need the pte to find the
+		 * page pfn and to check whether the page should be flushed.
+		 */
+		ptep =3D get_ptep(vma->vm_mm, addr);
+		if (ptep && pte_flush(*ptep)) {
+			if (parisc_requires_coherency()) {
+				flush_user_cache_page(vma, addr);
+			} else {
+				pfn =3D pte_pfn(*ptep);
+				BUG_ON(!pfn_valid(pfn));
+				__flush_cache_page(vma, addr, PFN_PHYS(pfn));
 			}
 		}
 	}
-	return ptep;
 }
=20
-static void flush_cache_pages(struct vm_area_struct *vma, struct mm_struct=
 *mm,
-			      unsigned long start, unsigned long end)
+static inline unsigned long mm_total_size(struct mm_struct *mm)
 {
-	unsigned long addr, pfn;
-	pte_t *ptep;
+	struct vm_area_struct *vma;
+	unsigned long usize =3D 0;
=20
-	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE) {
-		ptep =3D get_ptep(mm->pgd, addr);
-		if (ptep) {
-			pfn =3D pte_pfn(*ptep);
-			flush_cache_page(vma, addr, pfn);
-		}
-	}
+	for (vma =3D mm->mmap; vma && usize < parisc_cache_flush_threshold; vma =
=3D vma->vm_next)
+		usize +=3D vma->vm_end - vma->vm_start;
+	return usize;
 }
=20
 void flush_cache_mm(struct mm_struct *mm)
 {
 	struct vm_area_struct *vma;
=20
-	/* Flushing the whole cache on each cpu takes forever on
-	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
-	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
-	    mm_total_size(mm) >=3D parisc_cache_flush_threshold) {
-		if (mm->context.space_id)
-			flush_tlb_all();
+	/*
+	 * Flushing the whole cache on each cpu takes forever on
+	 * rp3440, etc. So, avoid it if the mm isn't too big.
+	 *
+	 * Note that we must flush the entire cache on machines
+	 * with aliasing caches to prevent random segmentation
+	 * faults.
+	 */
+	if (!parisc_requires_coherency()
+	    ||  mm_total_size(mm) >=3D parisc_cache_flush_threshold) {
+		BUG_ON(IS_ENABLED(CONFIG_SMP) && arch_irqs_disabled());
+		flush_tlb_all();
 		flush_cache_all();
 		return;
 	}
=20
+	/* Flush mm */
 	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
-		flush_cache_pages(vma, mm, vma->vm_start, vma->vm_end);
+		flush_cache_pages(vma, vma->vm_start, vma->vm_end);
 }
=20
-void flush_cache_range(struct vm_area_struct *vma,
-		unsigned long start, unsigned long end)
+void flush_cache_range(struct vm_area_struct *vma, unsigned long start, un=
signed long end)
 {
-	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
-	    end - start >=3D parisc_cache_flush_threshold) {
-		if (vma->vm_mm->context.space_id)
-			flush_tlb_range(vma, start, end);
+	if (!parisc_requires_coherency()
+	    || end - start >=3D parisc_cache_flush_threshold) {
+		BUG_ON(IS_ENABLED(CONFIG_SMP) && arch_irqs_disabled());
+		flush_tlb_range(vma, start, end);
 		flush_cache_all();
 		return;
 	}
=20
-	flush_cache_pages(vma, vma->vm_mm, start, end);
+	flush_cache_pages(vma, start, end);
 }
=20
-void
-flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigne=
d long pfn)
+void flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, un=
signed long pfn)
 {
-	if (pfn_valid(pfn)) {
-		if (likely(vma->vm_mm->context.space_id)) {
-			flush_tlb_page(vma, vmaddr);
-			__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
-		} else {
-			__purge_cache_page(vma, vmaddr, PFN_PHYS(pfn));
+	BUG_ON(!pfn_valid(pfn));
+	if (parisc_requires_coherency())
+		flush_user_cache_page(vma, vmaddr);
+	else
+		__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
+}
+
+void flush_anon_page(struct vm_area_struct *vma, struct page *page, unsign=
ed long vmaddr)
+{
+	if (PageAnon(page)) {
+		if (parisc_requires_coherency()) {
+			flush_user_cache_page(vma, vmaddr);
+			return;
 		}
+
+		flush_tlb_page(vma, vmaddr);
+		preempt_disable();
+		flush_dcache_page_asm(page_to_phys(page), vmaddr);
+		preempt_enable();
 	}
 }
=20
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index f114e102aaf2..ca49765784fc 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -22,6 +22,8 @@
=20
 #include <asm/traps.h>
=20
+/* #define DEBUG_NATLB 1 */
+
 /* Various important other fields */
 #define bit22set(x)		(x & 0x00000200)
 #define bits23_25set(x)		(x & 0x000001c0)
@@ -450,10 +452,12 @@ handle_nadtlb_fault(struct pt_regs *regs)
 		fallthrough;
 	case 0x380:
 		/* PDC and FIC instructions */
+#ifdef DEBUG_NATLB
 		if (printk_ratelimit()) {
-			pr_warn("BUG: nullifying cache flush/purge instruction\n");
+			pr_warn("WARNING: nullifying cache flush/purge instruction\n");
 			show_regs(regs);
 		}
+#endif
 		if (insn & 0x20) {
 			/* Base modification */
 			breg =3D (insn >> 21) & 0x1f;


--IEeCgUwxdhPggHCt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmKCal8ACgkQXb/Nrl8Z
TfGDpxAAkOlsq+05FFrLQFONCc/0+8DQz3PutAhCZEYppz2yzWLMF7j1dwTX+68H
Dx1k16R4ezrijm2UW1iikIO7oiLVAgZ3eEiwNJ0zRpoHvCODsDuSKMjy+QslIDK0
36eFQAKO14jvXSSSvvIBo5+wy04IUtfkD4M61Hu9R6qVnizQ0FNwzmhdc0OFrPA6
fRYDCEHZ7MC8Dskn/30MLR8BjESx4lwY8ohMer8tNtfZVGl7l5q/79VYjlTKeNz8
ry+bT1jWvuyvTnBRhHKKPww0nazLEeO4eNGYm+QqkBj63S9k2dDwu9dKGO8qBEUH
MAq8++U0SPjwXHRfbPfH/CeoyOqUc/E68LsXoAuD7JJlvVJiovCR1ajHa6j0axhF
AWkHwB5NfsNKmNvIb1q5qjgDwBXR9ODXp58hudiwisCzwQEgHkjThqgb8CiUgh9t
BmVdrOmo56iXBtbxVzzt2OZznFX3K2YLSU7hXdmaABflLI2HwvJ6SDJJEG/nJ93g
6BhFenOq3O2kLwr3yAMClR3XtouQRR0MR0SahI/I72A8fq3LqR1TL17AuasdotX2
lp/CGHjzpKHJXRwGFqX7oNv2GnPvtSO7o7exl/Qqsi0FcdUXHOp6mELD1IU0Z3GT
jVNjfpbKHefdh+HYwMXwWMH0WvZipBzEyQRo3sH52dfCsPIx8s8=
=eoIa
-----END PGP SIGNATURE-----

--IEeCgUwxdhPggHCt--

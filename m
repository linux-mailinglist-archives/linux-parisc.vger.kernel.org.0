Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5C64FB102
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Apr 2022 02:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235710AbiDKA1v (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 10 Apr 2022 20:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbiDKA1v (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 10 Apr 2022 20:27:51 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-003.bell.net [209.71.208.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 68D2D47575
        for <linux-parisc@vger.kernel.org>; Sun, 10 Apr 2022 17:25:36 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 624D96FC006DFC7F
X-CM-Envelope: MS4xfEcpzUooSWAnsmujYwY+lUV9XtwqITY7pIOytpVf1ITjRQCo49ljMjTXUxxHNIZZgN5N0AIXyW8RKF07+Gn2HYMDOTPAU/cN9B/BpCRcxsUXNcoqlVah
 F+jOlFXQwE6lTImOGpTxN6ALaaVsIggwH3uBKvBwvIraFb/V3PkQVfbpBQFSIddnOWWAjzhBKSfNSVLjwIi7/yaVgmlmQmxlq8aCVt77iJqi1qelR/uhyrpP
 ujf9brBPrxLp18e4lEAAGDfnF1ckQjv4NjBfpKwOxme+Ayqm2Wiy/PxTQvRtU+OJQ42+lcVrVOgtmHehbEDdratsDLKVutl+X7MCju+5UPCMXN88CUDgTm+5
 PPDOdNBX+9vDVqlMOzIekhqTAmKKn9FZDHPramxVMnILcbRZbEh2yf74viVw/emJjeQffv9tyLq75rpJQBnTC7HLhRGb4z1Bm/AdUl0Ot2PL6ur9WWGuL2bd
 IIxI/wig2Or2ii8I2i1jn54YfzjwiksQbSDntLV/66Z+ywg6Gttd1JWdhDEdMobrtOqOYMWlY0+hFt94bpSr/pGcOSuOB4yMrTLjRecJegiBCc+87cLgohH8
 lDjW55LXiKOXXTagGVsuSzaqGJvo72BOLiMs27xeilxE+Q==
X-CM-Analysis: v=2.4 cv=aKWTFZxm c=1 sm=1 tr=0 ts=625370f3
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=z0gMJWrwH1QA:10 a=FBHGMhGWAAAA:8 a=3-6FuNHJe2SChWMw7LEA:9
 a=6YUzwSbsjhaq5CWR:21 a=CjuIK1q_8ugA:10 a=bkMm0uODGDjLvCsmizIA:9
 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 624D96FC006DFC7F; Sun, 10 Apr 2022 20:06:11 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 31B40220115; Mon, 11 Apr 2022 00:06:11 +0000 (UTC)
Date:   Mon, 11 Apr 2022 00:06:10 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH, RFC] parisc: Rewrite cache flush code for PA8800/PA8900
Message-ID: <YlNw8jzP9OQRKvlV@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="S+eTw4/KSrE9e1sO"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--S+eTw4/KSrE9e1sO
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

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm=
/cacheflush.h
index bfce4faa1437..bcdb584daea5 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -15,8 +15,6 @@ DECLARE_STATIC_KEY_TRUE(parisc_has_cache);
 DECLARE_STATIC_KEY_TRUE(parisc_has_dcache);
 DECLARE_STATIC_KEY_TRUE(parisc_has_icache);
=20
-#define flush_cache_dup_mm(mm) flush_cache_mm(mm)
-
 void flush_user_icache_range_asm(unsigned long, unsigned long);
 void flush_kernel_icache_range_asm(unsigned long, unsigned long);
 void flush_user_dcache_range_asm(unsigned long, unsigned long);
@@ -30,6 +28,7 @@ void flush_kernel_icache_page(void *);
 void flush_cache_all_local(void);
 void flush_cache_all(void);
 void flush_cache_mm(struct mm_struct *mm);
+void flush_cache_dup_mm(struct mm_struct *mm);
=20
 void flush_kernel_dcache_page_addr(void *addr);
=20
diff --git a/arch/parisc/include/asm/fixmap.h b/arch/parisc/include/asm/fix=
map.h
index e480b2c05407..ec2b205ff058 100644
--- a/arch/parisc/include/asm/fixmap.h
+++ b/arch/parisc/include/asm/fixmap.h
@@ -11,10 +11,15 @@
  * loading restrictions).  If you place this region anywhere above
  * __PAGE_OFFSET, you must adjust the memory map accordingly */
=20
-/* The alias region is used in kernel space to do copy/clear to or
- * from areas congruently mapped with user space.  It is 8MB large
- * and must be 16MB aligned */
-#define TMPALIAS_MAP_START	((__PAGE_OFFSET) - 16*1024*1024)
+/* The alias region is used in kernel space to copy/clear/flush data
+ * from pages congruently mapped with user space. It is comprised of a
+ * pair of 4 MB regions aligned on a 8 MB boundary. The size of
+ * these regions is determined by the largest cache aliasing boundary
+ * for machines that support equivalent aliasing. As far as I can tell,
+ * machines with PA8800/PA8900 processors do not support equivalent
+ * aliasing for cache flushes. I tried boundaries up to 128 MB. */
+#define TMPALIAS_MAP_START	((__PAGE_OFFSET) - 8*1024*1024)
+#define TMPALIAS_SIZE_BITS	22	/* 4 MB */
=20
 #define FIXMAP_SIZE		(FIX_BITMAP_COUNT << PAGE_SHIFT)
 #define FIXMAP_START		(TMPALIAS_MAP_START - FIXMAP_SIZE)
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index e4851b3e631f..6c255d8d419d 100644
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
@@ -317,6 +320,7 @@ __flush_cache_page(struct vm_area_struct *vma, unsigned=
 long vmaddr,
 {
 	if (!static_branch_likely(&parisc_has_cache))
 		return;
+
 	preempt_disable();
 	flush_dcache_page_asm(physaddr, vmaddr);
 	if (vma->vm_flags & VM_EXEC)
@@ -337,6 +341,70 @@ __purge_cache_page(struct vm_area_struct *vma, unsigne=
d long vmaddr,
 	preempt_enable();
 }
=20
+static void flush_user_cache_page(struct vm_area_struct *vma, unsigned lon=
g vmaddr)
+{
+	unsigned long flags, space, pgd, prot;
+#ifdef CONFIG_TLB_PTLOCK
+	unsigned long pgd_lock;
+#endif
+
+	vmaddr &=3D PAGE_MASK;
+
+	preempt_disable();
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
+	if (vma->vm_flags & VM_EXEC)
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
+	preempt_enable();
+}
+
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
 =3D=3D (_PAGE_PRESENT | _PAGE_ACCESSED );
+}
+
 void flush_dcache_page(struct page *page)
 {
 	struct address_space *mapping =3D page_mapping_file(page);
@@ -357,31 +425,43 @@ void flush_dcache_page(struct page *page)
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
=20
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
+		/* PA8800/PA8900 don't support equivalent aliasing */
+		if (parisc_requires_coherency()) {
+			pte_t *ptep;
+
+			ptep =3D get_ptep(mpnt->vm_mm, addr);
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
+				if (old_addr)
+					printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %pD\n",=
 old_addr, addr, mpnt->vm_file);
+			}
 			old_addr =3D addr;
 		}
 	}
@@ -542,35 +622,54 @@ static inline unsigned long mm_total_size(struct mm_s=
truct *mm)
 	return usize;
 }
=20
-static inline pte_t *get_ptep(pgd_t *pgd, unsigned long addr)
+static void flush_cache_pages(struct vm_area_struct *vma, struct mm_struct=
 *mm,
+			      unsigned long start, unsigned long end)
 {
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
+		 * page pfn. We also need to check it to avoid faulting
+		 * when we call flush_user_cache_page()
+		 */
+		ptep =3D get_ptep(mm, addr);
+		if (ptep && pte_flush(*ptep)) {
+			if (parisc_requires_coherency()) {
+				flush_user_cache_page(vma, addr);
+			} else {
+				pfn =3D pte_pfn(*ptep);
+				if (pfn_valid(pfn))
+					__flush_cache_page(vma, addr, PFN_PHYS(pfn));
 			}
 		}
 	}
-	return ptep;
 }
=20
-static void flush_cache_pages(struct vm_area_struct *vma, struct mm_struct=
 *mm,
+static void purge_cache_pages(struct vm_area_struct *vma, struct mm_struct=
 *mm,
 			      unsigned long start, unsigned long end)
 {
 	unsigned long addr, pfn;
 	pte_t *ptep;
=20
 	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE) {
-		ptep =3D get_ptep(mm->pgd, addr);
-		if (ptep) {
-			pfn =3D pte_pfn(*ptep);
-			flush_cache_page(vma, addr, pfn);
+		/*
+		 * The vma can contain pages that aren't present. Although
+		 * the pte search is expensive, we need the pte to find the
+		 * page pfn. We also need to check it to avoid faulting
+		 * when we call flush_user_cache_page()
+		 */
+		ptep =3D get_ptep(mm, addr);
+		if (ptep && pte_flush(*ptep)) {
+			if (parisc_requires_coherency()) {
+				flush_user_cache_page(vma, addr);
+			} else {
+				pfn =3D pte_pfn(*ptep);
+				if (pfn_valid(pfn))
+					__purge_cache_page(vma, addr, PFN_PHYS(pfn));
+			}
 		}
 	}
 }
@@ -583,12 +682,30 @@ void flush_cache_mm(struct mm_struct *mm)
 	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    mm_total_size(mm) >=3D parisc_cache_flush_threshold) {
-		if (mm->context.space_id)
-			flush_tlb_all();
+		flush_tlb_all();
+		flush_cache_all();
+		return;
+	}
+
+	/* Purge mm */
+	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
+		purge_cache_pages(vma, mm, vma->vm_start, vma->vm_end);
+}
+
+void flush_cache_dup_mm(struct mm_struct *mm)
+{
+	struct vm_area_struct *vma;
+
+	/* Flushing the whole cache on each cpu takes forever on
+	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
+	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
+	    mm_total_size(mm) >=3D parisc_cache_flush_threshold) {
+		flush_tlb_all();
 		flush_cache_all();
 		return;
 	}
=20
+	/* Flush mm */
 	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
 		flush_cache_pages(vma, mm, vma->vm_start, vma->vm_end);
 }
@@ -596,10 +713,11 @@ void flush_cache_mm(struct mm_struct *mm)
 void flush_cache_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end)
 {
+	struct mm_struct *mm =3D vma->vm_mm;
+
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
-	    end - start >=3D parisc_cache_flush_threshold) {
-		if (vma->vm_mm->context.space_id)
-			flush_tlb_range(vma, start, end);
+	    mm_total_size(mm) >=3D parisc_cache_flush_threshold) {
+		flush_tlb_range(vma, start, end);
 		flush_cache_all();
 		return;
 	}
@@ -607,17 +725,17 @@ void flush_cache_range(struct vm_area_struct *vma,
 	flush_cache_pages(vma, vma->vm_mm, start, end);
 }
=20
-void
-flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigne=
d long pfn)
+void flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, un=
signed long pfn)
 {
-	if (pfn_valid(pfn)) {
-		flush_tlb_page(vma, vmaddr);
-		if (likely(vma->vm_mm->context.space_id)) {
-			__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
-		} else {
-			__purge_cache_page(vma, vmaddr, PFN_PHYS(pfn));
-		}
+	if (parisc_requires_coherency()) {
+
+		/* So far, we don't need to check pte */
+		flush_user_cache_page(vma, vmaddr);
+		return;
 	}
+
+	if (pfn_valid(pfn))
+		__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
 }
=20
 void flush_kernel_vmap_range(void *vaddr, int size)
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index ecf50159359e..c2fe9bfd6e57 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -554,9 +554,9 @@
 	extrd,s		\pte,63,25,\pte
 	.endm
=20
-	/* The alias region is an 8MB aligned 16MB to do clear and
-	 * copy user pages at addresses congruent with the user
-	 * virtual address.
+	/* The alias region is 8MB aligned to 8MB to do clear and
+	 * copy user page at addresses congruent with the user
+	 * virtual address. It is comprised of a pair of 4MB regions.
 	 *
 	 * To use the alias page, you set %r26 up with the to TLB
 	 * entry (identifying the physical page) and %r23 up with
@@ -571,7 +571,7 @@
 	depdi		0,31,32,\tmp
 #endif
 	copy		\va,\tmp1
-	depi		0,31,23,\tmp1
+	depi_safe	0,31,TMPALIAS_SIZE_BITS+1,\tmp1
 	cmpb,COND(<>),n	\tmp,\tmp1,\fault
 	mfctl		%cr19,\tmp	/* iir */
 	/* get the opcode (first six bits) into \tmp */
@@ -605,9 +605,9 @@
 	 * Check "subtle" note in pacache.S re: r23/r26.
 	 */
 #ifdef CONFIG_64BIT
-	extrd,u,*=3D	\va,41,1,%r0
+	extrd,u,*=3D	\va,63-TMPALIAS_SIZE_BITS,1,%r0
 #else
-	extrw,u,=3D	\va,9,1,%r0
+	extrw,u,=3D	\va,31-TMPALIAS_SIZE_BITS,1,%r0
 #endif
 	or,COND(tr)	%r23,%r0,\pte
 	or		%r26,%r0,\pte
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 8569141e3e67..ff10df19a1c1 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -366,6 +366,7 @@ ENTRY_CFI(clear_page_asm)
 	addib,COND(>),n	-1, %r1, 1b
 	ldo		64(%r26), %r26
 #endif
+	sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(clear_page_asm)
@@ -477,6 +478,7 @@ ENTRY_CFI(copy_page_asm)
 	addib,COND(>),n	-1, %r1, 1b
 	ldw		0(%r25), %r19
 #endif
+	sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(copy_page_asm)
@@ -487,6 +489,8 @@ ENDPROC_CFI(copy_page_asm)
  *       parisc chip designers that there will not ever be a parisc
  *       chip with a larger alias boundary (Never say never :-) ).
  *
+ *	 Yah, what about the PA8800 and PA8900?
+ *
  *       Subtle: the dtlb miss handlers support the temp alias region by
  *       "knowing" that if a dtlb miss happens within the temp alias
  *       region it must have occurred while in clear_user_page. Since
@@ -545,17 +549,17 @@ ENTRY_CFI(copy_user_page_asm)
 #endif
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert for=
mat */
 	convert_phys_for_tlb_insert20 %r23	/* convert phys addr to tlb insert for=
mat */
-	depd		%r24,63,22, %r28	/* Form aliased virtual address 'to' */
+	depd		%r24,63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address 't=
o' */
 	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 	copy		%r28, %r29
-	depdi		1, 41,1, %r29		/* Form aliased virtual address 'from' */
+	depdi		1, 63-TMPALIAS_SIZE_BITS,1, %r29	/* Form aliased virtual address '=
=66rom' */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
 	extrw,u		%r23, 24,25, %r23	/* convert phys addr to tlb insert format */
-	depw		%r24, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depw		%r24, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 	copy		%r28, %r29
-	depwi		1, 9,1, %r29		/* Form aliased virtual address 'from' */
+	depwi		1, 31-TMPALIAS_SIZE_BITS,1, %r29	/* Form aliased virtual address '=
=66rom' */
 #endif
=20
 	/* Purge any old translations */
@@ -678,6 +682,7 @@ ENTRY_CFI(copy_user_page_asm)
 	ldo		64(%r29), %r29
 #endif
=20
+	sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(copy_user_page_asm)
@@ -691,11 +696,11 @@ ENTRY_CFI(clear_user_page_asm)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
 #endif
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert for=
mat */
-	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
+	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
=20
@@ -756,6 +761,7 @@ ENTRY_CFI(clear_user_page_asm)
 	ldo		64(%r28), %r28
 #endif	/* CONFIG_64BIT */
=20
+	sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(clear_user_page_asm)
@@ -767,11 +773,11 @@ ENTRY_CFI(flush_dcache_page_asm)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
 #endif
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert for=
mat */
-	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
+	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
=20
@@ -826,11 +832,11 @@ ENTRY_CFI(purge_dcache_page_asm)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
 #endif
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert for=
mat */
-	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
+	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
=20
@@ -885,11 +891,11 @@ ENTRY_CFI(flush_icache_page_asm)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
 #endif
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert for=
mat */
-	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
+	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
=20

--S+eTw4/KSrE9e1sO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmJTcOsACgkQXb/Nrl8Z
TfFwdg//WIzyolvYUxo8EyqmiFLiKTdKjhvH0WwylLWXeOU9A9BkVS4jwAVpei1j
ACC8qUcArzHz7aF3u5iemjXJeSV29yv/fP4KoQEm4ssObcMMdYJDe9jL2JYvrFmT
48su7HUf6PAeRnldhlqLCOeHc9bfGLWb3v7Xip71lc8eR1UPTeXKZbVBjdC3lML8
q8lc1C0cEx5Cy2l5C8g2dmobUWurfPmV+2/pnv1zKrZ45Oe8NHQohHGx2e1VQNkw
iTiNUSrvu1Fj3WXOTIOeTi86+TAuN4v5/GURN/8uveHOnOn0a89Hfk53u8sDM1iF
JGRmNq5WZL7mfnmXMANNsnIk7/LcOnWSf05LSuTZLSv3TJ01MBoPf8fhRH10EO9J
PTTbt4ABH8D02o1k5xO9qOLpg8HBawszMTmKZd6NuM1PJce/kg0zq5QqwNev6Am4
yH3rXvNM6txwbk3nKWYUZNoHraDPBzZsvD1DUB0twQz38eBPXcOQXRCK3D8RdYuQ
jLDjbBSeB2eWr1dysw9DFR4dJvVIj0S6wKTiAKE0kzRD47mIgo2BkIvLz6hMPEMX
gnminyROt1T0eZMYpGehay4BoodUKNBCOs2yazcJO6tRA2X7tYdOOdUer5N0rWEz
mjstkapLehuQt1LAuh5hOpouHFuSRmmYQprlvh4ok/tzrG944p4=
=j5gh
-----END PGP SIGNATURE-----

--S+eTw4/KSrE9e1sO--

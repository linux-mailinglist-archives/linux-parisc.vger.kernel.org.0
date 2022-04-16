Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946E35037C9
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Apr 2022 20:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbiDPSD1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Apr 2022 14:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbiDPSD0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Apr 2022 14:03:26 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 71F0F3EBB9
        for <linux-parisc@vger.kernel.org>; Sat, 16 Apr 2022 11:00:52 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 624AF58701482A16
X-CM-Envelope: MS4xfDZgpwizs59eZO8ImAL7Eg5NcSb9a9pJNToG7W5gxUXnLzzC9jB5FqCn+mA9r8alUS73m7KVmylI1OxOhBFEfjT1pTHQEE0SJR8+i63W3yP6BAIgPy95
 n1D7dgODpWuxKrrrsfKLrc96J9o8xZdSzFkOSoLwhdosBry6Ub5RxkusFOjqXHiAS0nLNbU6aGELrytWf5YMS2VUJ3mu0iSd6jpH7heX2cBcNXTxafmkaafR
 7uWWx7V+VReLljzhKWmYTlhpK2bmrftm4Jz4tNeRbM6HFvv0KpY69iBrWBzlRRsJOEFca3TWdBRGo42x1SnnoljRgBg5GclxePJh824t3+/F0iJZT3E6JoPN
 0QkD00MCemY2MYPTM/3MbdhqMkYxo5KUTRNCai7dTLEyINq2gheys7fWe/N2Y4WT7NRwDGj0u9kaFmi28RNf7y+LhgeTVUtZUQJMy6H5YLTYhnAOz56CEjGo
 5LdrFfAbyN/ujgF1wIpQcGtnO4PRsQRC0aBUeJiENhkSdoIvM1aB5zTvWMiuQj0TMW0OQv8fqmqEzzBpW4NdOdb/fPkJXOWqXkFja7YoB+5S0ozZdLSbp5fY
 JPtZiDZjgWzOauve8qyUiuK6KO+M+srKF+lz11zEtjAqZQ==
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=625b0444
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=z0gMJWrwH1QA:10 a=FBHGMhGWAAAA:8 a=4NZWPnLhZ11UNaESLT4A:9
 a=FctyXx01XI0O8tT4:21 a=CjuIK1q_8ugA:10 a=AeX2DGtkCNUnk1vzSnsA:9
 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 624AF58701482A16; Sat, 16 Apr 2022 14:00:36 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 48119220115; Sat, 16 Apr 2022 18:00:35 +0000 (UTC)
Date:   Sat, 16 Apr 2022 18:00:35 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH, V2] parisc: Rewrite cache flush code for PA8800/PA8900
Message-ID: <YlsEQ4yZo1ycYg9F@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KYoMV1i855zC8Err"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--KYoMV1i855zC8Err
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

V2 adds the following changes:
1) Add flush_cache_page_check_pte routine.
2) Use it in copy_to_user_page and copy_from_user_page.
3) flush_anon_page moved to cache.c and updated.
4) Changed alias boundary to 64 MB for 64-bit kernels. Revised comment
   regarding alias boundary for PA8800/PA8900 processors.
5) Removed struct mm_struct * argument from flush_cache_pages.
6) Fixed thinko in flush_cache_range. It increased the number of pages
   flushed and slowed performance.
7) Removed sync changes from pacache.S.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm=
/cacheflush.h
index bfce4faa1437..93652fefcf78 100644
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
@@ -62,18 +61,19 @@ void flush_dcache_page(struct page *page);
=20
 #define copy_to_user_page(vma, page, vaddr, dst, src, len) \
 do { \
-	flush_cache_page(vma, vaddr, page_to_pfn(page)); \
+	flush_cache_page_check_pte(vma, vaddr, page_to_pfn(page)); \
 	memcpy(dst, src, len); \
 	flush_kernel_dcache_range_asm((unsigned long)dst, (unsigned long)dst + le=
n); \
 } while (0)
=20
 #define copy_from_user_page(vma, page, vaddr, dst, src, len) \
 do { \
-	flush_cache_page(vma, vaddr, page_to_pfn(page)); \
+	flush_cache_page_check_pte(vma, vaddr, page_to_pfn(page)); \
 	memcpy(dst, src, len); \
 } while (0)
=20
 void flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, un=
signed long pfn);
+void flush_cache_page_check_pte(struct vm_area_struct *vma, unsigned long =
vmaddr, unsigned long pfn);
 void flush_cache_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end);
=20
@@ -81,16 +81,7 @@ void flush_cache_range(struct vm_area_struct *vma,
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
diff --git a/arch/parisc/include/asm/fixmap.h b/arch/parisc/include/asm/fix=
map.h
index e480b2c05407..e83db982bf87 100644
--- a/arch/parisc/include/asm/fixmap.h
+++ b/arch/parisc/include/asm/fixmap.h
@@ -9,12 +9,27 @@
  *
  * All of the values in this file must be <4GB (because of assembly
  * loading restrictions).  If you place this region anywhere above
- * __PAGE_OFFSET, you must adjust the memory map accordingly */
+ * __PAGE_OFFSET, you must adjust the memory map accordingly
+ */
=20
-/* The alias region is used in kernel space to do copy/clear to or
- * from areas congruently mapped with user space.  It is 8MB large
- * and must be 16MB aligned */
-#define TMPALIAS_MAP_START	((__PAGE_OFFSET) - 16*1024*1024)
+/*
+ * The tmpalias region is used in kernel space to copy/clear/flush data
+ * from pages congruently mapped with user space. It is comprised of
+ * a pair regions. The size of these regions is determined by the largest
+ * cache aliasing boundary for machines that support equivalent aliasing.
+ *
+ * Machines with PA8800/PA8900 processors either do not support equivalent
+ * aliasing or their aliasing boundary is larger than 16 MB. Further, they
+ * do not support equivalent aliasing of kernel addresses. This suggests
+ * the low order space register bits affect aliasing.
+ */
+#ifdef CONFIG_64BIT
+#define TMPALIAS_MAP_START	((__PAGE_OFFSET) - 128*1024*1024)
+#define TMPALIAS_SIZE_BITS	26	/* 64 MB */
+#else
+#define TMPALIAS_MAP_START	((__PAGE_OFFSET) - 8*1024*1024)
+#define TMPALIAS_SIZE_BITS	22	/* 4 MB */
+#endif
=20
 #define FIXMAP_SIZE		(FIX_BITMAP_COUNT << PAGE_SHIFT)
 #define FIXMAP_START		(TMPALIAS_MAP_START - FIXMAP_SIZE)
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index e4851b3e631f..d8bbcefc1a3c 100644
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
@@ -337,6 +340,70 @@ __purge_cache_page(struct vm_area_struct *vma, unsigne=
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
@@ -357,31 +424,43 @@ void flush_dcache_page(struct page *page)
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
@@ -542,35 +621,51 @@ static inline unsigned long mm_total_size(struct mm_s=
truct *mm)
 	return usize;
 }
=20
-static inline pte_t *get_ptep(pgd_t *pgd, unsigned long addr)
+static void flush_cache_pages(struct vm_area_struct *vma, unsigned long st=
art, unsigned long end)
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
+		 * page pfn and to check whether the page should be flushed.
+		 */
+		ptep =3D get_ptep(vma->vm_mm, addr);
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
-			      unsigned long start, unsigned long end)
+static void purge_cache_pages(struct vm_area_struct *vma, unsigned long st=
art, unsigned long end)
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
+		 * page pfn and to check whether the page should be flushed.
+		 */
+		ptep =3D get_ptep(vma->vm_mm, addr);
+		if (ptep && pte_flush(*ptep)) {
+			if (parisc_requires_coherency()) {
+				/* pdc is implemented as flush */
+				flush_user_cache_page(vma, addr);
+			} else {
+				pfn =3D pte_pfn(*ptep);
+				if (pfn_valid(pfn))
+					__purge_cache_page(vma, addr, PFN_PHYS(pfn));
+			}
 		}
 	}
 }
@@ -583,40 +678,84 @@ void flush_cache_mm(struct mm_struct *mm)
 	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    mm_total_size(mm) >=3D parisc_cache_flush_threshold) {
-		if (mm->context.space_id)
-			flush_tlb_all();
+		flush_tlb_all();
 		flush_cache_all();
 		return;
 	}
=20
+	/* Purge mm */
 	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
-		flush_cache_pages(vma, mm, vma->vm_start, vma->vm_end);
+		purge_cache_pages(vma, vma->vm_start, vma->vm_end);
 }
=20
-void flush_cache_range(struct vm_area_struct *vma,
-		unsigned long start, unsigned long end)
+void flush_cache_dup_mm(struct mm_struct *mm)
+{
+	struct vm_area_struct *vma;
+
+	/* Flushing the whole cache on each cpu takes forever on
+	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
+	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
+	    mm_total_size(mm) >=3D parisc_cache_flush_threshold) {
+		flush_tlb_all();
+		flush_cache_all();
+		return;
+	}
+
+	/* Flush mm */
+	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
+		flush_cache_pages(vma, vma->vm_start, vma->vm_end);
+}
+
+void flush_cache_range(struct vm_area_struct *vma, unsigned long start, un=
signed long end)
 {
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    end - start >=3D parisc_cache_flush_threshold) {
-		if (vma->vm_mm->context.space_id)
-			flush_tlb_range(vma, start, end);
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
-		flush_tlb_page(vma, vmaddr);
-		if (likely(vma->vm_mm->context.space_id)) {
-			__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
-		} else {
-			__purge_cache_page(vma, vmaddr, PFN_PHYS(pfn));
+	if (parisc_requires_coherency()) {
+		flush_user_cache_page(vma, vmaddr);
+		return;
+	}
+
+	if (pfn_valid(pfn))
+		__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
+}
+
+void flush_cache_page_check_pte(struct vm_area_struct *vma, unsigned long =
vmaddr, unsigned long pfn)
+{
+	if (parisc_requires_coherency()) {
+		pte_t *ptep;
+
+		ptep =3D get_ptep(vma->vm_mm, vmaddr);
+		if (ptep && pte_flush(*ptep))
+			flush_user_cache_page(vma, vmaddr);
+		return;
+	}
+
+	if (pfn_valid(pfn))
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
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index ecf50159359e..d30e3b885678 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -554,14 +554,17 @@
 	extrd,s		\pte,63,25,\pte
 	.endm
=20
-	/* The alias region is an 8MB aligned 16MB to do clear and
-	 * copy user pages at addresses congruent with the user
-	 * virtual address.
+	/*
+	 * The kernel alias region is aligned to 8MB or 128MB. It is
+	 * used to clear/copy/flush user pages using a kernel address
+	 * congruent with the user virtual address. It is comprised
+	 * of a pair of 4MB or 64MB regions.
 	 *
 	 * To use the alias page, you set %r26 up with the to TLB
 	 * entry (identifying the physical page) and %r23 up with
 	 * the from tlb entry (or nothing if only a to entry---for
-	 * clear_user_page_asm) */
+	 * clear_user_page_asm)
+	 */
 	.macro		do_alias	spc,tmp,tmp1,va,pte,prot,fault,patype
 	cmpib,COND(<>),n 0,\spc,\fault
 	ldil		L%(TMPALIAS_MAP_START),\tmp
@@ -571,7 +574,7 @@
 	depdi		0,31,32,\tmp
 #endif
 	copy		\va,\tmp1
-	depi		0,31,23,\tmp1
+	depi_safe	0,31,TMPALIAS_SIZE_BITS+1,\tmp1
 	cmpb,COND(<>),n	\tmp,\tmp1,\fault
 	mfctl		%cr19,\tmp	/* iir */
 	/* get the opcode (first six bits) into \tmp */
@@ -605,9 +608,9 @@
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
index 8569141e3e67..45762a9ca064 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -487,6 +487,8 @@ ENDPROC_CFI(copy_page_asm)
  *       parisc chip designers that there will not ever be a parisc
  *       chip with a larger alias boundary (Never say never :-) ).
  *
+ *       Yah, what about the PA8800 and PA8900 processors?
+ *
  *       Subtle: the dtlb miss handlers support the temp alias region by
  *       "knowing" that if a dtlb miss happens within the temp alias
  *       region it must have occurred while in clear_user_page. Since
@@ -545,17 +547,17 @@ ENTRY_CFI(copy_user_page_asm)
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
@@ -691,11 +693,11 @@ ENTRY_CFI(clear_user_page_asm)
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
@@ -767,11 +769,11 @@ ENTRY_CFI(flush_dcache_page_asm)
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
@@ -826,11 +828,11 @@ ENTRY_CFI(purge_dcache_page_asm)
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
@@ -885,11 +887,11 @@ ENTRY_CFI(flush_icache_page_asm)
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

--KYoMV1i855zC8Err
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmJbBDsACgkQXb/Nrl8Z
TfFvNBAAj+HudfsJY+772rgjTOnZPJeY4xT4zE0kzzWev7XDvF6uEJOTaxAZxiyl
GC+7YXxzsh4OUdRZoBYsWBHvXbr6DrS4WGUsFDOBfpbTn0epan+NZP13be11GI+f
oevNaI1wc93oFz1hou+KdSnQ3SFLVNT1G+RRQajFU41h7cjknxcw0dwOFrcpNmP3
VicAP8qrvPzMLQqk+8lJLsTqK1lWEkZCjtDKCCWBaj8JiHrSlqBtIJpEYEOG2E9b
Cl8Bn/Jif0XhXSjpBmjoEQ7p+r7h6lK4gekgidJCERvsXnHei4UkoQFUXcTwj0K7
89zj2L72OtU6jSbdT2k5ypbrMQM6vwAZnENIl/H1gw+I4e+7nP8CX/sliMCyPhiR
8t7z6qa5e0/CL+xwDA5gnQhwsYdfez4CD1Td9V3feldoylfe4PgXn3c5S9F4sedr
dn6ug/0ZWtzRjds0WEdhC0jP1BHTV+sVHi3K8QZY572E3/q8/sH1imTCI1HO8sh1
sOZ0C5V0EHuKF4W3ONbo8ai2siXJwKM23JG1Bw8PxmkS5wVT1USBGb84xeRur2v5
YYkw4s8EoKQ5chV1M8T8yc100RRReEPuf2eJMJxQgWD3a+rb5t+PGw+im/YcgicU
xfzzh6LOBJmZRLcVNYELqJx7Mz37H9ltWF8N3sMARKHjCvymI8U=
=9A9A
-----END PGP SIGNATURE-----

--KYoMV1i855zC8Err--

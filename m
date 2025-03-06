Return-Path: <linux-parisc+bounces-3372-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B95A555D1
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Mar 2025 19:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27A8616336C
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Mar 2025 18:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222F826D5D4;
	Thu,  6 Mar 2025 18:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sjo2a54H"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E0B25C702;
	Thu,  6 Mar 2025 18:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741287224; cv=none; b=ujioBY5F2ildsLJMcH8E7WisKsf7B9MEueHJeaDkWUsH2Tg8fFat/enkpJ+6XbuImjskrGlpY8uH7PvsnG3lfa7UJS3Ebk7BgL+RXj/KZy0alwadX0IUovU+EfOY8rec9vUtPKsircX9Gjqu+xQ1Eam49FXvnJi50Mab+HSbHc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741287224; c=relaxed/simple;
	bh=GWhAi3dGAk2czZZlfNlnCeLY0kz6EzDfRxHcBCJ65pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CylRjFDg5OKgFGVx/WZQVnHCqwMf/u/UVR8s/VR2RjFJaNuypcqvp+nn16rxvPSRC71yoWJAO+5ll2RIMynjzVBpLbGEztGLEUq4cDI6V2y2ap6bD8Wb0TLQDB0FVVVjcLvP0TX/3ZiOD5c6fz+JRVkdlOoriJ8je6g7IAUaF0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sjo2a54H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C878CC4CEEB;
	Thu,  6 Mar 2025 18:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741287223;
	bh=GWhAi3dGAk2czZZlfNlnCeLY0kz6EzDfRxHcBCJ65pw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sjo2a54HfhylNrI9szawcN/hFY9v9LkhuO3hGt+/XZFGhe6zgylMcCb+JP4zXVy+l
	 oY1w36YFnS+uiYpXV50mQ9r3KV7Wig7OJ53EwaIzzgxZKFR7pIuucwJUy+6+QwJ2yl
	 j7aksWYDkwdSyu/N5Wtt0+3RjpPmUTCWp/GkxFN83BeMGCgoSbGOUFUTq9dOW6nh8p
	 2DqUe8gaglnTA45JXqLd5S0Nel1Bf+qtQH44yp0Uz+SaXxK1irZurJQEA2+qdlGsR6
	 SQ/ny1xFkoNAxWXJ0VT+vsx6cMk9bJFNgkjkK4UaCh672uWftBY+eZOUrK9Ln7Yoll
	 BImA1J/mIS4gA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH 09/13] arch, mm: set max_mapnr when allocating memory map for FLATMEM
Date: Thu,  6 Mar 2025 20:51:19 +0200
Message-ID: <20250306185124.3147510-10-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250306185124.3147510-1-rppt@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

max_mapnr is essentially the size of the memory map for systems that use
FLATMEM. There is no reason to calculate it in each and every architecture
when it's anyway calculated in alloc_node_mem_map().

Drop setting of max_mapnr from architecture code and set it once in
alloc_node_mem_map().

While on it, move definition of mem_map and max_mapnr to mm/mm_init.c so
there won't be two copies for MMU and !MMU variants.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/alpha/mm/init.c               |  1 -
 arch/arc/mm/init.c                 |  5 -----
 arch/arm/mm/init.c                 |  2 --
 arch/csky/mm/init.c                |  4 ----
 arch/loongarch/mm/init.c           |  1 -
 arch/microblaze/mm/init.c          |  4 ----
 arch/mips/mm/init.c                |  8 --------
 arch/nios2/kernel/setup.c          |  1 -
 arch/nios2/mm/init.c               |  2 +-
 arch/openrisc/mm/init.c            |  1 -
 arch/parisc/mm/init.c              |  1 -
 arch/powerpc/kernel/setup-common.c |  2 --
 arch/riscv/mm/init.c               |  1 -
 arch/s390/mm/init.c                |  1 -
 arch/sh/mm/init.c                  |  1 -
 arch/sparc/mm/init_32.c            |  1 -
 arch/um/include/shared/mem_user.h  |  1 -
 arch/um/kernel/physmem.c           | 12 ------------
 arch/um/kernel/um_arch.c           |  1 -
 arch/x86/mm/init_32.c              |  3 ---
 arch/xtensa/mm/init.c              |  1 -
 include/asm-generic/memory_model.h |  5 +++--
 include/linux/mm.h                 | 11 -----------
 mm/memory.c                        |  8 --------
 mm/mm_init.c                       | 25 +++++++++++++++++--------
 mm/nommu.c                         |  4 ----
 26 files changed, 21 insertions(+), 86 deletions(-)

diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 61c2198b1359..ec0eeae9c653 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -276,7 +276,6 @@ srm_paging_stop (void)
 void __init
 mem_init(void)
 {
-	set_max_mapnr(max_low_pfn);
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
 	memblock_free_all();
 }
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 6a71b23f1383..7ef883d58dc1 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -154,11 +154,6 @@ void __init setup_arch_memory(void)
 
 	arch_pfn_offset = min(min_low_pfn, min_high_pfn);
 	kmap_init();
-
-#else /* CONFIG_HIGHMEM */
-	/* pfn_valid() uses this when FLATMEM=y and HIGHMEM=n */
-	max_mapnr = max_low_pfn - min_low_pfn;
-
 #endif /* CONFIG_HIGHMEM */
 
 	free_area_init(max_zone_pfn);
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 9aec1cb2386f..d4bcc745a044 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -275,8 +275,6 @@ void __init mem_init(void)
 	swiotlb_init(max_pfn > arm_dma_pfn_limit, SWIOTLB_VERBOSE);
 #endif
 
-	set_max_mapnr(pfn_to_page(max_pfn) - mem_map);
-
 #ifdef CONFIG_SA1111
 	/* now that our DMA memory is actually so designated, we can free it */
 	memblock_phys_free(PHYS_OFFSET, __pa(swapper_pg_dir) - PHYS_OFFSET);
diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
index ab51acbc19b2..ba6694d6170a 100644
--- a/arch/csky/mm/init.c
+++ b/arch/csky/mm/init.c
@@ -46,10 +46,6 @@ void __init mem_init(void)
 {
 #ifdef CONFIG_HIGHMEM
 	unsigned long tmp;
-
-	set_max_mapnr(highend_pfn - ARCH_PFN_OFFSET);
-#else
-	set_max_mapnr(max_low_pfn - ARCH_PFN_OFFSET);
 #endif
 	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
 
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index ca5aa5f46a9f..00449df50db1 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -78,7 +78,6 @@ void __init paging_init(void)
 
 void __init mem_init(void)
 {
-	max_mapnr = max_low_pfn;
 	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
 
 	memblock_free_all();
diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index 4520c5741579..857cd2b44bcf 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -104,17 +104,13 @@ void __init setup_memory(void)
 	 *
 	 * min_low_pfn - the first page (mm/bootmem.c - node_boot_start)
 	 * max_low_pfn
-	 * max_mapnr - the first unused page (mm/bootmem.c - node_low_pfn)
 	 */
 
 	/* memory start is from the kernel end (aligned) to higher addr */
 	min_low_pfn = memory_start >> PAGE_SHIFT; /* minimum for allocation */
-	/* RAM is assumed contiguous */
-	max_mapnr = memory_size >> PAGE_SHIFT;
 	max_low_pfn = ((u64)memory_start + (u64)lowmem_size) >> PAGE_SHIFT;
 	max_pfn = ((u64)memory_start + (u64)memory_size) >> PAGE_SHIFT;
 
-	pr_info("%s: max_mapnr: %#lx\n", __func__, max_mapnr);
 	pr_info("%s: min_low_pfn: %#lx\n", __func__, min_low_pfn);
 	pr_info("%s: max_low_pfn: %#lx\n", __func__, max_low_pfn);
 	pr_info("%s: max_pfn: %#lx\n", __func__, max_pfn);
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index f51cd97376df..338b3c9fc5bc 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -417,15 +417,7 @@ void __init paging_init(void)
 		       " %ldk highmem ignored\n",
 		       (highend_pfn - max_low_pfn) << (PAGE_SHIFT - 10));
 		max_zone_pfns[ZONE_HIGHMEM] = max_low_pfn;
-
-		max_mapnr = max_low_pfn;
-	} else if (highend_pfn) {
-		max_mapnr = highend_pfn;
-	} else {
-		max_mapnr = max_low_pfn;
 	}
-#else
-	max_mapnr = max_low_pfn;
 #endif
 	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
 
diff --git a/arch/nios2/kernel/setup.c b/arch/nios2/kernel/setup.c
index a4cffbfc1399..2a40150142c3 100644
--- a/arch/nios2/kernel/setup.c
+++ b/arch/nios2/kernel/setup.c
@@ -158,7 +158,6 @@ void __init setup_arch(char **cmdline_p)
 	*cmdline_p = boot_command_line;
 
 	find_limits(&min_low_pfn, &max_low_pfn, &max_pfn);
-	max_mapnr = max_low_pfn;
 
 	memblock_reserve(__pa_symbol(_stext), _end - _stext);
 #ifdef CONFIG_BLK_DEV_INITRD
diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
index aa692ad30044..3cafa87ead9e 100644
--- a/arch/nios2/mm/init.c
+++ b/arch/nios2/mm/init.c
@@ -51,7 +51,7 @@ void __init paging_init(void)
 	pagetable_init();
 	pgd_current = swapper_pg_dir;
 
-	max_zone_pfn[ZONE_NORMAL] = max_mapnr;
+	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
 
 	/* pass the memory from the bootmem allocator to the main allocator */
 	free_area_init(max_zone_pfn);
diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
index d0cb1a0126f9..9093c336e158 100644
--- a/arch/openrisc/mm/init.c
+++ b/arch/openrisc/mm/init.c
@@ -193,7 +193,6 @@ void __init mem_init(void)
 {
 	BUG_ON(!mem_map);
 
-	max_mapnr = max_low_pfn;
 	high_memory = (void *)__va(max_low_pfn * PAGE_SIZE);
 
 	/* clear the zero-page */
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 61c0a2477072..2cdfc0b1195c 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -563,7 +563,6 @@ void __init mem_init(void)
 #endif
 
 	high_memory = __va((max_pfn << PAGE_SHIFT));
-	set_max_mapnr(max_low_pfn);
 	memblock_free_all();
 
 #ifdef CONFIG_PA11
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index a08b0ede4e64..68d47c53876c 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -957,8 +957,6 @@ void __init setup_arch(char **cmdline_p)
 
 	/* Parse memory topology */
 	mem_topology_setup();
-	/* Set max_mapnr before paging_init() */
-	set_max_mapnr(max_pfn);
 	high_memory = (void *)__va(max_low_pfn * PAGE_SIZE);
 
 	/*
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 15b2eda4c364..157c9ca51541 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -298,7 +298,6 @@ static void __init setup_bootmem(void)
 	high_memory = (void *)(__va(PFN_PHYS(max_low_pfn)));
 
 	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
-	set_max_mapnr(max_low_pfn - ARCH_PFN_OFFSET);
 
 	reserve_initrd_mem();
 
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 020aa2f78d01..7e64243693c9 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -161,7 +161,6 @@ void __init mem_init(void)
 	cpumask_set_cpu(0, &init_mm.context.cpu_attach_mask);
 	cpumask_set_cpu(0, mm_cpumask(&init_mm));
 
-	set_max_mapnr(max_low_pfn);
         high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
 
 	pv_init();
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index 289a2fecebef..72aea5cd1b85 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -290,7 +290,6 @@ void __init paging_init(void)
 	 */
 	max_low_pfn = max_pfn = memblock_end_of_DRAM() >> PAGE_SHIFT;
 	min_low_pfn = __MEMORY_START >> PAGE_SHIFT;
-	set_max_mapnr(max_low_pfn - min_low_pfn);
 
 	nodes_clear(node_online_map);
 
diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index d96a14ffceeb..6b58da14edc6 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -275,7 +275,6 @@ void __init mem_init(void)
 
 	taint_real_pages();
 
-	max_mapnr = last_valid_pfn - pfn_base;
 	high_memory = __va(max_low_pfn << PAGE_SHIFT);
 	memblock_free_all();
 
diff --git a/arch/um/include/shared/mem_user.h b/arch/um/include/shared/mem_user.h
index adfa08062f88..d4727efcf23d 100644
--- a/arch/um/include/shared/mem_user.h
+++ b/arch/um/include/shared/mem_user.h
@@ -47,7 +47,6 @@ extern int iomem_size;
 #define ROUND_4M(n) ((((unsigned long) (n)) + (1 << 22)) & ~((1 << 22) - 1))
 
 extern unsigned long find_iomem(char *driver, unsigned long *len_out);
-extern void mem_total_pages(unsigned long physmem, unsigned long iomem);
 extern void setup_physmem(unsigned long start, unsigned long usable,
 			  unsigned long len);
 extern void map_memory(unsigned long virt, unsigned long phys,
diff --git a/arch/um/kernel/physmem.c b/arch/um/kernel/physmem.c
index a74f17b033c4..af02b5f9911d 100644
--- a/arch/um/kernel/physmem.c
+++ b/arch/um/kernel/physmem.c
@@ -22,18 +22,6 @@ static int physmem_fd = -1;
 unsigned long high_physmem;
 EXPORT_SYMBOL(high_physmem);
 
-void __init mem_total_pages(unsigned long physmem, unsigned long iomem)
-{
-	unsigned long phys_pages, iomem_pages, total_pages;
-
-	phys_pages  = physmem >> PAGE_SHIFT;
-	iomem_pages = iomem   >> PAGE_SHIFT;
-
-	total_pages = phys_pages + iomem_pages;
-
-	max_mapnr = total_pages;
-}
-
 void map_memory(unsigned long virt, unsigned long phys, unsigned long len,
 		int r, int w, int x)
 {
diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index 79ea97d4797e..6414cbf00572 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -419,7 +419,6 @@ void __init setup_arch(char **cmdline_p)
 
 	stack_protections((unsigned long) init_task.stack);
 	setup_physmem(uml_physmem, uml_reserved, physmem_size);
-	mem_total_pages(physmem_size, iomem_size);
 	uml_dtb_init();
 	read_initrd();
 
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index ac41b1e0940d..6d2f8cb9451e 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -650,9 +650,6 @@ void __init initmem_init(void)
 
 	memblock_set_node(0, PHYS_ADDR_MAX, &memblock.memory, 0);
 
-#ifdef CONFIG_FLATMEM
-	max_mapnr = IS_ENABLED(CONFIG_HIGHMEM) ? highend_pfn : max_low_pfn;
-#endif
 	__vmalloc_start_set = true;
 
 	printk(KERN_NOTICE "%ldMB LOWMEM available.\n",
diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index 01577d33e602..9f1b0d5fccc7 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -164,7 +164,6 @@ void __init mem_init(void)
 {
 	free_highpages();
 
-	max_mapnr = max_pfn - ARCH_PFN_OFFSET;
 	high_memory = (void *)__va(max_low_pfn << PAGE_SHIFT);
 
 	memblock_free_all();
diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index 6d1fb6162ac1..a3b5029aebbd 100644
--- a/include/asm-generic/memory_model.h
+++ b/include/asm-generic/memory_model.h
@@ -19,11 +19,12 @@
 #define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
 				 ARCH_PFN_OFFSET)
 
+/* avoid <linux/mm.h> include hell */
+extern unsigned long max_mapnr;
+
 #ifndef pfn_valid
 static inline int pfn_valid(unsigned long pfn)
 {
-	/* avoid <linux/mm.h> include hell */
-	extern unsigned long max_mapnr;
 	unsigned long pfn_offset = ARCH_PFN_OFFSET;
 
 	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb7..fdf20503850e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -45,17 +45,6 @@ extern int sysctl_page_lock_unfairness;
 void mm_core_init(void);
 void init_mm_internals(void);
 
-#ifndef CONFIG_NUMA		/* Don't use mapnrs, do it properly */
-extern unsigned long max_mapnr;
-
-static inline void set_max_mapnr(unsigned long limit)
-{
-	max_mapnr = limit;
-}
-#else
-static inline void set_max_mapnr(unsigned long limit) { }
-#endif
-
 extern atomic_long_t _totalram_pages;
 static inline unsigned long totalram_pages(void)
 {
diff --git a/mm/memory.c b/mm/memory.c
index b4d3d4893267..126fdd3001e3 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -95,14 +95,6 @@
 #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid.
 #endif
 
-#ifndef CONFIG_NUMA
-unsigned long max_mapnr;
-EXPORT_SYMBOL(max_mapnr);
-
-struct page *mem_map;
-EXPORT_SYMBOL(mem_map);
-#endif
-
 static vm_fault_t do_fault(struct vm_fault *vmf);
 static vm_fault_t do_anonymous_page(struct vm_fault *vmf);
 static bool vmf_pte_changed(struct vm_fault *vmf);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2630cc30147e..50a93714e1c6 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -36,6 +36,14 @@
 
 #include <asm/setup.h>
 
+#ifndef CONFIG_NUMA
+unsigned long max_mapnr;
+EXPORT_SYMBOL(max_mapnr);
+
+struct page *mem_map;
+EXPORT_SYMBOL(mem_map);
+#endif
+
 #ifdef CONFIG_DEBUG_MEMORY_INIT
 int __meminitdata mminit_loglevel;
 
@@ -1617,7 +1625,7 @@ static void __init alloc_node_mem_map(struct pglist_data *pgdat)
 	start = pgdat->node_start_pfn & ~(MAX_ORDER_NR_PAGES - 1);
 	offset = pgdat->node_start_pfn - start;
 	/*
-		 * The zone's endpoints aren't required to be MAX_PAGE_ORDER
+	 * The zone's endpoints aren't required to be MAX_PAGE_ORDER
 	 * aligned but the node_mem_map endpoints must be in order
 	 * for the buddy allocator to function correctly.
 	 */
@@ -1633,14 +1641,15 @@ static void __init alloc_node_mem_map(struct pglist_data *pgdat)
 	pr_debug("%s: node %d, pgdat %08lx, node_mem_map %08lx\n",
 		 __func__, pgdat->node_id, (unsigned long)pgdat,
 		 (unsigned long)pgdat->node_mem_map);
-#ifndef CONFIG_NUMA
+
 	/* the global mem_map is just set as node 0's */
-	if (pgdat == NODE_DATA(0)) {
-		mem_map = NODE_DATA(0)->node_mem_map;
-		if (page_to_pfn(mem_map) != pgdat->node_start_pfn)
-			mem_map -= offset;
-	}
-#endif
+	WARN_ON(pgdat != NODE_DATA(0));
+
+	mem_map = pgdat->node_mem_map;
+	if (page_to_pfn(mem_map) != pgdat->node_start_pfn)
+		mem_map -= offset;
+
+	max_mapnr = end - start;
 }
 #else
 static inline void alloc_node_mem_map(struct pglist_data *pgdat) { }
diff --git a/mm/nommu.c b/mm/nommu.c
index baa79abdaf03..f0209dd26dfa 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -44,16 +44,12 @@
 
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
-struct page *mem_map;
-unsigned long max_mapnr;
-EXPORT_SYMBOL(max_mapnr);
 unsigned long highest_memmap_pfn;
 int sysctl_nr_trim_pages = CONFIG_NOMMU_INITIAL_TRIM_EXCESS;
 int heap_stack_gap = 0;
 
 atomic_long_t mmap_pages_allocated;
 
-EXPORT_SYMBOL(mem_map);
 
 /* list of mapped, potentially shareable regions */
 static struct kmem_cache *vm_region_jar;
-- 
2.47.2



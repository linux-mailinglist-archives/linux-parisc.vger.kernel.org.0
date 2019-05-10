Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3661A223
	for <lists+linux-parisc@lfdr.de>; Fri, 10 May 2019 19:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfEJRMx (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 May 2019 13:12:53 -0400
Received: from mout.gmx.net ([212.227.17.21]:41479 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727453AbfEJRMx (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 May 2019 13:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557508364;
        bh=/facGOGlHvCTmfoGTb66QL6TEoiU2BxXd45ZjLzWdUw=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=Cx1+yFxVWPk57mRYBtn06I8VRLhAQeb/sljMykoHKkmYaxt6uWOlxEVaMihqDU11L
         ZNzZaA37XB8Clvhu9+BEZRTrXwfD+deaQ2ezDuIdKSXzQSzPClA4MoDGRa18SAndy3
         l5y5bmkDlAiXoJ/E/T0YFwUjQpQoDR2kUuVvjTfc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.146.113]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MrhQC-1gt3zU1G20-00nl7S; Fri, 10 May 2019 19:12:44 +0200
Date:   Fri, 10 May 2019 19:12:41 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Enable __ro_after_init feature
Message-ID: <20190510171241.GA20053@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:rQpe0rz+MjOexWmJ++8lsl6sNo4Nq9UBHXGnxw+z6VJeev1MQH7
 tUUvZOn0kBp2dLBgLphRonmLDF7eDJ+X4K5NheG2qNoKfGKSK7mA/HAWJERJhanb9RLpOgH
 DKuw5t0q6xCagzfUiQmFkp/83yVZGCulNhVbpeMOYHyDjVUZhsxT2/A3XFNTtsSJHDVw+2F
 i9uQVOen9YtFy/eIE6OHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:V4+I+823kF4=:BSFhLOOUU0fSiB8hAMWGZI
 6L5CYOEkSh9htJBqc+VFiQXBvF5JzfiPNc+8UbLxUAFk08rebuAv8UGvqzbVFCQtfm6LTzwZV
 Sa8rTp9tI4g8RorLBSAgxyWlE0OfKr3H1/EkSIKFlQUsRseTpNVHBCDWpbA1/VMRZVq79hRjL
 E8I1D7wrPL4UtPmx6OTiP241MCLjfqm7FpkW2hSgA3pIhB1QQjQObI6N/SoY/sGOMreYJvECe
 WNfvEJPjvvXUKPSdyYpxGk1+clfnccqvkKWaZ6v3you1PXEh+GQ8NayIS3kUYsbj3G78QCV/I
 tYN272I6yUHUiOIBxVDL/pUzXUUTTFXr/q1xca51PwLhowkkE6PLsJDrGboe53dAjL24MuYzn
 xnws/39jEyZHgflVreDeODySJ1s2HSDfKg88U/kM86z7rCHEaePs7ZIgFdVoUD9igOCmVLME8
 WHWwFyBI5w2gt2pzBdCAhUcQU4nm5zjHxDjukehp+wiEC3FzsfhltZEYVjQtH0iIVv7wxLDrK
 toMUXVeVljaEl0T9OMckZXqrro9p2Nu395UCY7HKuelXTTvMQEP+mNQHB1UgVywL1y2eLRlk4
 2Cfp2qJyzUAlTl2ct+MSF83oqi+ij5djwBJMKUhultC321dLBPmrsz5o1a3k7fAlo8ix4K483
 HJhuT3KlIILGnLvp7F1WMybERa1rXd3/2+peecqpq9rIkx0zAS3WbzOdor1YDuANJ6tSWNxHb
 oz2IfU4cJyOJIlvgLUi29SYUn2EnmOiiEB0NbfQhbbKjWnagn4upteHCEWnKJC1Uj5zpCqksh
 yssmNNG5LHO8NI5rT+v2GXdC1/Zakcc0cI7SqyFv7i8+pUYV4oU4WDArnBBpGT4pgOYonOQp1
 9RqvtoF/tMJ0g+AlJgfT9aCT6sZPG28pOrGxpaBhu6VCwq6CrSOqMS7h/tQwPV
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This patch modifies the initial page mapping functions in the following wa=
y:

During bootup the init, text and data pages will be mapped RWX and if
supported, with huge pages.

At final stage of the bootup, the kernel calls free_initmem() and then all
pages will be remapped either R-X (for text and read-only data) or RW- (fo=
r
data). The __init pages will be dropped.

This reflects the behaviour of the x86 platform.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cac=
he.h
index 4016fe1c65a9..73ca89a47f49 100644
=2D-- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -24,9 +24,6 @@

 #define __read_mostly __attribute__((__section__(".data..read_mostly")))

-/* Read-only memory is marked before mark_rodata_ro() is called. */
-#define __ro_after_init	__read_mostly
-
 void parisc_cache_init(void);	/* initializes cache-flushing */
 void disable_sr_hashing_asm(int); /* low level support for above */
 void disable_sr_hashing(void);   /* turns off space register hashing */
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux=
.lds.S
index a8be7a47fcc0..c3b1b9c24ede 100644
=2D-- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -18,9 +18,6 @@
 				*(.data..vm0.pgd) \
 				*(.data..vm0.pte)

-/* No __ro_after_init data in the .rodata section - which will always be =
ro */
-#define RO_AFTER_INIT_DATA
-
 #include <asm-generic/vmlinux.lds.h>

 /* needed for the processor specific cache alignment size */
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 3b0f9eab7f2c..b99bcbf1ecdb 100644
=2D-- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -345,16 +345,7 @@ static void __init setup_bootmem(void)
 	memblock_dump_all();
 }

-static int __init parisc_text_address(unsigned long vaddr)
-{
-	static unsigned long head_ptr __initdata;
-
-	if (!head_ptr)
-		head_ptr =3D PAGE_MASK & (unsigned long)
-			dereference_function_descriptor(&parisc_kernel_start);
-
-	return core_kernel_text(vaddr) || vaddr =3D=3D head_ptr;
-}
+static bool kernel_set_to_readonly;

 static void __init map_pages(unsigned long start_vaddr,
 			     unsigned long start_paddr, unsigned long size,
@@ -372,10 +363,11 @@ static void __init map_pages(unsigned long start_vad=
dr,
 	unsigned long vaddr;
 	unsigned long ro_start;
 	unsigned long ro_end;
-	unsigned long kernel_end;
+	unsigned long kernel_start, kernel_end;

 	ro_start =3D __pa((unsigned long)_text);
 	ro_end   =3D __pa((unsigned long)&data_start);
+	kernel_start =3D __pa((unsigned long)&__init_begin);
 	kernel_end  =3D __pa((unsigned long)&_end);

 	end_paddr =3D start_paddr + size;
@@ -438,26 +430,30 @@ static void __init map_pages(unsigned long start_vad=
dr,
 			pg_table =3D (pte_t *) __va(pg_table) + start_pte;
 			for (tmp2 =3D start_pte; tmp2 < PTRS_PER_PTE; tmp2++, pg_table++) {
 				pte_t pte;
-
-				if (force)
-					pte =3D  __mk_pte(address, pgprot);
-				else if (parisc_text_address(vaddr)) {
-					pte =3D __mk_pte(address, PAGE_KERNEL_EXEC);
-					if (address >=3D ro_start && address < kernel_end)
-						pte =3D pte_mkhuge(pte);
+				pgprot_t prot;
+				bool huge =3D false;
+
+				if (force) {
+					prot =3D pgprot;
+				} else if (address < kernel_start || address >=3D kernel_end) {
+					/* outside kernel memory */
+					prot =3D PAGE_KERNEL;
+				} else if (!kernel_set_to_readonly) {
+					/* still initializing, allow writing to RO memory */
+					prot =3D PAGE_KERNEL_RWX;
+					huge =3D true;
+				} else if (address >=3D ro_start) {
+					/* Code (ro) and Data areas */
+					prot =3D (address < ro_end) ?
+						PAGE_KERNEL_EXEC : PAGE_KERNEL;
+					huge =3D true;
+				} else {
+					prot =3D PAGE_KERNEL;
 				}
-				else
-#if defined(CONFIG_PARISC_PAGE_SIZE_4KB)
-				if (address >=3D ro_start && address < ro_end) {
-					pte =3D __mk_pte(address, PAGE_KERNEL_EXEC);
+
+				pte =3D __mk_pte(address, prot);
+				if (huge)
 					pte =3D pte_mkhuge(pte);
-				} else
-#endif
-				{
-					pte =3D __mk_pte(address, pgprot);
-					if (address >=3D ro_start && address < kernel_end)
-						pte =3D pte_mkhuge(pte);
-				}

 				if (address >=3D end_paddr)
 					break;
@@ -493,6 +489,12 @@ void __ref free_initmem(void)
 {
 	unsigned long init_begin =3D (unsigned long)__init_begin;
 	unsigned long init_end =3D (unsigned long)__init_end;
+	unsigned long kernel_end  =3D (unsigned long)&_end;
+
+	/* Remap kernel text and data, but do not touch init section yet. */
+	kernel_set_to_readonly =3D true;
+	map_pages(init_end, __pa(init_end), kernel_end - init_end,
+		  PAGE_KERNEL, 0);

 	/* The init text pages are marked R-X.  We have to
 	 * flush the icache and mark them RW-
@@ -509,7 +511,7 @@ void __ref free_initmem(void)
 		  PAGE_KERNEL, 1);

 	/* force the kernel to see the new TLB entries */
-	__flush_tlb_range(0, init_begin, init_end);
+	__flush_tlb_range(0, init_begin, kernel_end);

 	/* finally dump all the instructions which were cached, since the
 	 * pages are no-longer executable */
@@ -527,8 +529,9 @@ void mark_rodata_ro(void)
 {
 	/* rodata memory was already mapped with KERNEL_RO access rights by
            pagetable_init() and map_pages(). No need to do additional stu=
ff here */
-	printk (KERN_INFO "Write protecting the kernel read-only data: %luk\n",
-		(unsigned long)(__end_rodata - __start_rodata) >> 10);
+	unsigned long roai_size =3D __end_ro_after_init - __start_ro_after_init;
+
+	pr_info("Write protected read-only-after-init data: %luk\n", roai_size >=
> 10);
 }
 #endif


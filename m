Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 435E876C9F3
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Aug 2023 11:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbjHBJ5H (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 2 Aug 2023 05:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbjHBJ5G (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 2 Aug 2023 05:57:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3AD3171B
        for <linux-parisc@vger.kernel.org>; Wed,  2 Aug 2023 02:57:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 37FC96189D
        for <linux-parisc@vger.kernel.org>; Wed,  2 Aug 2023 09:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79595C433C8;
        Wed,  2 Aug 2023 09:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690970223;
        bh=wT3/f0P3TKgf+URsIV3yt7UqPGyDgMw9sdP9z9CIXQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XkXhbuTP+UK/7UoU3k2ult6S4ED4XETCxdLXWpdkA7fiteYMoVleBg2e1BnMDcEK5
         Z63Gk7JgVxrTnXxJIQv6kKo374DICKIC+V5q3hdi4Lb3fVVANjJXB9w8DbuQjHD2vs
         IcBP9uxBWTJXxhx7pORzgPZNkdAUrt0nRoeVNs+mRS3j/OCopInkrhaG5rv5F44S1A
         yNG07D5ObT8jDfggWRG4MaW2PSNJ3rl7hjBSeKe/nClm+0B6yq9F9HyIasjla6iCO9
         YgFDNR4o2+1AEV6bBFX3CuyHz3J2vrqN78cEhBnVQOCnOpcpOs4YzbZ071q6b4xdSE
         TJ6QuzXS+E9Ow==
Date:   Wed, 2 Aug 2023 12:56:52 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Cc:     linux-parisc@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: Regression with kernel 6.4 "swapper: page allocation failure:
 order:0, mode:0x100(__GFP_ZERO)
Message-ID: <ZMooZAKcm8OtKIfx@kernel.org>
References: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Christoph,

On Tue, Aug 01, 2023 at 09:37:11PM +0200, Christoph Biedl wrote:
> 
> Greetings,
> 
> it took a while to find some time for bisecting, but finally:
> 
> after upgrading from 6.3 to 6.4, my old HPPA/PA-RISC box started
> throwing traces and became unusable, details below. I'm a little
> surprised apparently nobody else got bitten by this.
> 
> This still happens with 6.5-rc4, bisecting led to:
> 
>     700d2e9a36b93601270c1e15550acde2521386c5 is the first bad commit
>     commit 700d2e9a36b93601270c1e15550acde2521386c5
>     Author: Vlastimil Babka <vbabka@suse.cz>
>     Date:   Thu Feb 16 10:51:31 2023 +0100
> 
>         mm, page_alloc: reduce page alloc/free sanity checks
> 
> Does this make sense? Anything I could try out?

Looks like this commit somehow exposed that if static keys are
enabled/disabled before page allocator is initialized, the set_fixmap()
fails to allocate a page for pte. I'm still not sure why bisect pointed to
this commit because it does not really change the order in which static
keys are set up.

Can you check if the patch helps:

diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
index cc15d737fda6..ae3493dae9dc 100644
--- a/arch/parisc/mm/fixmap.c
+++ b/arch/parisc/mm/fixmap.c
@@ -19,9 +19,6 @@ void notrace set_fixmap(enum fixed_addresses idx, phys_addr_t phys)
 	pmd_t *pmd = pmd_offset(pud, vaddr);
 	pte_t *pte;
 
-	if (pmd_none(*pmd))
-		pte = pte_alloc_kernel(pmd, vaddr);
-
 	pte = pte_offset_kernel(pmd, vaddr);
 	set_pte_at(&init_mm, vaddr, pte, __mk_pte(phys, PAGE_KERNEL_RWX));
 	flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE);
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index b0c43f3b0a5f..2d5916018c71 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -610,6 +610,26 @@ void __init mem_init(void)
 unsigned long *empty_zero_page __ro_after_init;
 EXPORT_SYMBOL(empty_zero_page);
 
+static void __init early_fixmap_init(void)
+{
+	unsigned long addr = FIXMAP_START;
+	unsigned long end = FIXMAP_START + FIXMAP_SIZE;
+	pgd_t *pgd = pgd_offset_k(addr);
+	p4d_t *p4d = p4d_offset(pgd, addr);
+	pud_t *pud = pud_offset(p4d, addr);
+	pmd_t *pmd = pmd_offset(pud, addr);
+
+	do {
+		pte_t *pte = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+		if (!pte)
+			panic("fixmap: failed to allocate pte\n");
+
+		pmd_populate_kernel(&init_mm, pmd, pte);
+
+		addr += PAGE_SIZE;
+	} while (addr < end);
+}
+
 /*
  * pagetable_init() sets up the page tables
  *
@@ -649,6 +669,7 @@ static void __init pagetable_init(void)
 	if (!empty_zero_page)
 		panic("zero page allocation failed.\n");
 
+	early_fixmap_init();
 }
 
 static void __init gateway_init(void)
 
>     Christoph
> 
> 
>     Linux version 6.3.0-rc4+ (linux@localhost) (hppa-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #16 Tue Aug  1 21:11:13 CEST 2023
>     FP[0] enabled: Rev 1 Model 16
>     The 32-bit Kernel has started...
>     Kernel default page size is 4 KB. Huge pages enabled with 4 MB physical and 4 MB virtual size.
>     Determining PDC firmware type: System Map.
>     model 00005cf0 00000481 00000000 00000002 776d19ff 100000f0 00000008 000000b2 000000b2
>     vers  00000300
>     CPUID vers 17 rev 10 (0x0000022a)
>     capabilities 0x3
>     HP-UX model name: 9000/785/C3600
>     Memory Ranges:
>      0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
>     Total Memory: 1024 MB
>     initrd: 4f4a1000-4ffedd01
>     initrd: reserving 3f4a1000-3ffedd01 (mem_max 40000000)
>     PDT: type PDT_PDC, size 50, entries 0, status 2, dbe_loc 0xffffffff, good_mem 8 MB
>     PDT: Firmware reports all memory OK.
>     Zone ranges:
>       Normal   [mem 0x0000000000000000-0x000003ffffffffff]
>     Movable zone start for each node
>     Early memory node ranges
>       node   0: [mem 0x0000000000000000-0x000000003fffffff]
>     Initmem setup node 0 [mem 0x0000000000000000-0x000000003fffffff]
>     LCD display at f05d0008,f05d0000 registered
>     Built 1 zonelists, mobility grouping on.  Total pages: 259840
>     Kernel command line:  (...)
>     earlycon: pdc0 at MMIO32be 0x00000000 (options '')
>     printk: bootconsole [pdc0] enabled
>     Unknown kernel command line parameters "palo_kernel=2/vmlinuz.bisect", will be passed to user space.
>     Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
>     Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
>     swapper: page allocation failure: order:0, mode:0x100(__GFP_ZERO), nodemask=(null)
>     CPU: 0 PID: 0 Comm: swapper Not tainted 6.3.0-rc4+ #16
>     Hardware name: 9000/785/C3600
>     Backtrace:
>      [<10408594>] show_stack+0x48/0x5c
>      [<10e152d8>] dump_stack_lvl+0x48/0x64
>      [<10e15318>] dump_stack+0x24/0x34
>      [<105cf7f8>] warn_alloc+0x10c/0x1c8
>      [<105d068c>] __alloc_pages+0xbbc/0xcf8
>      [<105d0e4c>] __get_free_pages+0x28/0x78
>      [<105ad10c>] __pte_alloc_kernel+0x30/0x98
>      [<10406934>] set_fixmap+0xec/0xf4
>      [<10411ad4>] patch_map.constprop.0+0xa8/0xdc
>      [<10411bb0>] __patch_text_multiple+0xa8/0x208
>      [<10411d78>] patch_text+0x30/0x48
>      [<1041246c>] arch_jump_label_transform+0x90/0xcc
>      [<1056f734>] jump_label_update+0xd4/0x184
>      [<1056fc9c>] static_key_enable_cpuslocked+0xc0/0x110
>      [<1056fd08>] static_key_enable+0x1c/0x2c
>      [<1011362c>] init_mem_debugging_and_hardening+0xdc/0xf8
>      [<1010141c>] start_kernel+0x5f0/0xa98
>      [<10105da8>] start_parisc+0xb8/0xe4
> 
>     Mem-Info:
>     active_anon:0 inactive_anon:0 isolated_anon:0
>      active_file:0 inactive_file:0 isolated_file:0
>      unevictable:0 dirty:0 writeback:0
>      slab_reclaimable:0 slab_unreclaimable:0
>      mapped:0 shmem:0 pagetables:0
>      sec_pagetables:0 bounce:0
>      kernel_misc_reclaimable:0
>      free:0 free_pcp:0 free_cma:0
>     Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB writeback_tmp:0kB kernel_stack:0kB pagetables:0kB sec_pagetables:0kB all_unreclaimable? no
>     Normal free:0kB boost:0kB min:0kB low:0kB high:0kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:1048576kB managed:1039360kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
>     lowmem_reserve[]: 0 0
>     Normal: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 0kB
>     0 total pagecache pages
>     0 pages in swap cache
>     Free swap  = 0kB
>     Total swap = 0kB
>     262144 pages RAM
>     0 pages HighMem/MovableOnly
>     2304 pages reserved
>     Backtrace:
>      [<10411d78>] patch_text+0x30/0x48
>      [<1041246c>] arch_jump_label_transform+0x90/0xcc
>      [<1056f734>] jump_label_update+0xd4/0x184
>      [<1056fc9c>] static_key_enable_cpuslocked+0xc0/0x110
>      [<1056fd08>] static_key_enable+0x1c/0x2c
>      [<1011362c>] init_mem_debugging_and_hardening+0xdc/0xf8
>      [<1010141c>] start_kernel+0x5f0/0xa98
>      [<10105da8>] start_parisc+0xb8/0xe4
> 
>     Kernel Fault: Code=15 (Data TLB miss fault) at addr 0f7fe3c0
>     CPU: 0 PID: 0 Comm: swapper Not tainted 6.3.0-rc4+ #16
>     Hardware name: 9000/785/C3600
>     
>          YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>     PSW: 00000000000001000000000000001110 Not tainted
>     r00-03  0004000e 10ff31b0 10411bb0 11400300
>     r04-07  00000004 0f7fe3c0 105cb3c0 10ff6794
>     r08-11  1140029c 0f7fe3c0 10f43000 10f43000
>     r12-15  1160e9b0 00000000 10f3f000 10f3f000
>     r16-19  f00008c4 f000017c f0000174 00001000
>     r20-23  00000045 3fffbfff 10407794 fffffffe
>     r24-27  0f7ff000 0f7ff000 00000000 10ff31b0
>     r28-31  e80002a2 11583c78 11400380 00013ffb
>     sr00-03  00000000 00000000 00000000 00000000
>     sr04-07  00000000 00000000 00000000 00000000
>     
>     IASQ: 00000000 00000000 IAOQ: 10411bcc 10411bd0
>      IIR: 0cbc1280    ISR: 00000000  IOR: 0f7fe3c0
>      CPU:        0   CR30: 1140d510 CR31: 11111111
>      ORIG_R28: 00000000
>      IAOQ[0]: __patch_text_multiple+0xc4/0x208
>      IAOQ[1]: __patch_text_multiple+0xc8/0x208
>      RP(r2): __patch_text_multiple+0xa8/0x208
>     Backtrace:
>      [<10411d78>] patch_text+0x30/0x48
>      [<1041246c>] arch_jump_label_transform+0x90/0xcc
>      [<1056f734>] jump_label_update+0xd4/0x184
>      [<1056fc9c>] static_key_enable_cpuslocked+0xc0/0x110
>      [<1056fd08>] static_key_enable+0x1c/0x2c
>      [<1011362c>] init_mem_debugging_and_hardening+0xdc/0xf8
>      [<1010141c>] start_kernel+0x5f0/0xa98
>      [<10105da8>] start_parisc+0xb8/0xe4
>     
>     Kernel panic - not syncing: Kernel Fault
>     Rebooting in 60 seconds..
> 



-- 
Sincerely yours,
Mike.

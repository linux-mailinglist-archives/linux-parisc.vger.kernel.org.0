Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5A676BE0B
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Aug 2023 21:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjHATq5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 1 Aug 2023 15:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjHATq4 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 1 Aug 2023 15:46:56 -0400
X-Greylist: delayed 580 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 01 Aug 2023 12:46:55 PDT
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A0219AA
        for <linux-parisc@vger.kernel.org>; Tue,  1 Aug 2023 12:46:55 -0700 (PDT)
Date:   Tue, 1 Aug 2023 21:37:11 +0200
From:   Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To:     linux-parisc@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Regression with kernel 6.4 "swapper: page allocation failure:
 order:0, mode:0x100(__GFP_ZERO)
Message-ID: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1SKT+jp6GPffWmSZ"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--1SKT+jp6GPffWmSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

, nodemask=3D(null)"
Reply-To:=20
Message-ID: <1690917866@msgid.manchmal.in-ulm.de>

Greetings,

it took a while to find some time for bisecting, but finally:

after upgrading from 6.3 to 6.4, my old HPPA/PA-RISC box started
throwing traces and became unusable, details below. I'm a little
surprised apparently nobody else got bitten by this.

This still happens with 6.5-rc4, bisecting led to:

    700d2e9a36b93601270c1e15550acde2521386c5 is the first bad commit
    commit 700d2e9a36b93601270c1e15550acde2521386c5
    Author: Vlastimil Babka <vbabka@suse.cz>
    Date:   Thu Feb 16 10:51:31 2023 +0100

        mm, page_alloc: reduce page alloc/free sanity checks

Does this make sense? Anything I could try out?

    Christoph


    Linux version 6.3.0-rc4+ (linux@localhost) (hppa-linux-gnu-gcc (Debian =
12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #16 Tue Aug  1 21=
:11:13 CEST 2023
    FP[0] enabled: Rev 1 Model 16
    The 32-bit Kernel has started...
    Kernel default page size is 4 KB. Huge pages enabled with 4 MB physical=
 and 4 MB virtual size.
    Determining PDC firmware type: System Map.
    model 00005cf0 00000481 00000000 00000002 776d19ff 100000f0 00000008 00=
0000b2 000000b2
    vers  00000300
    CPUID vers 17 rev 10 (0x0000022a)
    capabilities 0x3
    HP-UX model name: 9000/785/C3600
    Memory Ranges:
     0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
    Total Memory: 1024 MB
    initrd: 4f4a1000-4ffedd01
    initrd: reserving 3f4a1000-3ffedd01 (mem_max 40000000)
    PDT: type PDT_PDC, size 50, entries 0, status 2, dbe_loc 0xffffffff, go=
od_mem 8 MB
    PDT: Firmware reports all memory OK.
    Zone ranges:
      Normal   [mem 0x0000000000000000-0x000003ffffffffff]
    Movable zone start for each node
    Early memory node ranges
      node   0: [mem 0x0000000000000000-0x000000003fffffff]
    Initmem setup node 0 [mem 0x0000000000000000-0x000000003fffffff]
    LCD display at f05d0008,f05d0000 registered
    Built 1 zonelists, mobility grouping on.  Total pages: 259840
    Kernel command line:  (...)
    earlycon: pdc0 at MMIO32be 0x00000000 (options '')
    printk: bootconsole [pdc0] enabled
    Unknown kernel command line parameters "palo_kernel=3D2/vmlinuz.bisect"=
, will be passed to user space.
    Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
    Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
    swapper: page allocation failure: order:0, mode:0x100(__GFP_ZERO), node=
mask=3D(null)
    CPU: 0 PID: 0 Comm: swapper Not tainted 6.3.0-rc4+ #16
    Hardware name: 9000/785/C3600
    Backtrace:
     [<10408594>] show_stack+0x48/0x5c
     [<10e152d8>] dump_stack_lvl+0x48/0x64
     [<10e15318>] dump_stack+0x24/0x34
     [<105cf7f8>] warn_alloc+0x10c/0x1c8
     [<105d068c>] __alloc_pages+0xbbc/0xcf8
     [<105d0e4c>] __get_free_pages+0x28/0x78
     [<105ad10c>] __pte_alloc_kernel+0x30/0x98
     [<10406934>] set_fixmap+0xec/0xf4
     [<10411ad4>] patch_map.constprop.0+0xa8/0xdc
     [<10411bb0>] __patch_text_multiple+0xa8/0x208
     [<10411d78>] patch_text+0x30/0x48
     [<1041246c>] arch_jump_label_transform+0x90/0xcc
     [<1056f734>] jump_label_update+0xd4/0x184
     [<1056fc9c>] static_key_enable_cpuslocked+0xc0/0x110
     [<1056fd08>] static_key_enable+0x1c/0x2c
     [<1011362c>] init_mem_debugging_and_hardening+0xdc/0xf8
     [<1010141c>] start_kernel+0x5f0/0xa98
     [<10105da8>] start_parisc+0xb8/0xe4

    Mem-Info:
    active_anon:0 inactive_anon:0 isolated_anon:0
     active_file:0 inactive_file:0 isolated_file:0
     unevictable:0 dirty:0 writeback:0
     slab_reclaimable:0 slab_unreclaimable:0
     mapped:0 shmem:0 pagetables:0
     sec_pagetables:0 bounce:0
     kernel_misc_reclaimable:0
     free:0 free_pcp:0 free_cma:0
    Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:=
0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:0kB writeback_tmp:0kB kernel_stack:0kB pagetables:0=
kB sec_pagetables:0kB all_unreclaimable? no
    Normal free:0kB boost:0kB min:0kB low:0kB high:0kB reserved_highatomic:=
0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB une=
victable:0kB writepending:0kB present:1048576kB managed:1039360kB mlocked:0=
kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
    lowmem_reserve[]: 0 0
    Normal: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024=
kB 0*2048kB 0*4096kB =3D 0kB
    0 total pagecache pages
    0 pages in swap cache
    Free swap  =3D 0kB
    Total swap =3D 0kB
    262144 pages RAM
    0 pages HighMem/MovableOnly
    2304 pages reserved
    Backtrace:
     [<10411d78>] patch_text+0x30/0x48
     [<1041246c>] arch_jump_label_transform+0x90/0xcc
     [<1056f734>] jump_label_update+0xd4/0x184
     [<1056fc9c>] static_key_enable_cpuslocked+0xc0/0x110
     [<1056fd08>] static_key_enable+0x1c/0x2c
     [<1011362c>] init_mem_debugging_and_hardening+0xdc/0xf8
     [<1010141c>] start_kernel+0x5f0/0xa98
     [<10105da8>] start_parisc+0xb8/0xe4

    Kernel Fault: Code=3D15 (Data TLB miss fault) at addr 0f7fe3c0
    CPU: 0 PID: 0 Comm: swapper Not tainted 6.3.0-rc4+ #16
    Hardware name: 9000/785/C3600
   =20
         YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
    PSW: 00000000000001000000000000001110 Not tainted
    r00-03  0004000e 10ff31b0 10411bb0 11400300
    r04-07  00000004 0f7fe3c0 105cb3c0 10ff6794
    r08-11  1140029c 0f7fe3c0 10f43000 10f43000
    r12-15  1160e9b0 00000000 10f3f000 10f3f000
    r16-19  f00008c4 f000017c f0000174 00001000
    r20-23  00000045 3fffbfff 10407794 fffffffe
    r24-27  0f7ff000 0f7ff000 00000000 10ff31b0
    r28-31  e80002a2 11583c78 11400380 00013ffb
    sr00-03  00000000 00000000 00000000 00000000
    sr04-07  00000000 00000000 00000000 00000000
   =20
    IASQ: 00000000 00000000 IAOQ: 10411bcc 10411bd0
     IIR: 0cbc1280    ISR: 00000000  IOR: 0f7fe3c0
     CPU:        0   CR30: 1140d510 CR31: 11111111
     ORIG_R28: 00000000
     IAOQ[0]: __patch_text_multiple+0xc4/0x208
     IAOQ[1]: __patch_text_multiple+0xc8/0x208
     RP(r2): __patch_text_multiple+0xa8/0x208
    Backtrace:
     [<10411d78>] patch_text+0x30/0x48
     [<1041246c>] arch_jump_label_transform+0x90/0xcc
     [<1056f734>] jump_label_update+0xd4/0x184
     [<1056fc9c>] static_key_enable_cpuslocked+0xc0/0x110
     [<1056fd08>] static_key_enable+0x1c/0x2c
     [<1011362c>] init_mem_debugging_and_hardening+0xdc/0xf8
     [<1010141c>] start_kernel+0x5f0/0xa98
     [<10105da8>] start_parisc+0xb8/0xe4
   =20
    Kernel panic - not syncing: Kernel Fault
    Rebooting in 60 seconds..


--1SKT+jp6GPffWmSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWXMI+726A12MfJXdxCxY61kUkv0FAmTJXuMACgkQxCxY61kU
kv1FCBAApynJac7fGgHu2d3HMmZWMOvDwuR/pbba8nE3BkX77HwdAtDetg+MiKBu
C8oC4kIGghDu7bAC1TZ5LXpqLX3jW/emg4Bc6yGNMVYn/VU9ht8phDxxXOXJFDsh
FyhtNIQumFiVwtYKCafCzyXmpUx7gKQRVH7E9FhjOZmg4Av/lGFtD4kJ/lyxz8S+
5sfSQFpmAxU23v1gVr/rZ5bk9fbi8Yu4VjKvr+Y5tcKNc442kAasFlSh1Ew/NxTw
26NeAqMusOLLqTAw5bjeppPBW+6erEnOS9WEpUK2bgI6uy30BukmZLYmnPfgpckq
nzEKbAno+OFZDzIg3gsccEaM/K92uMklOEMW01LJgiVvPXob5RJw5XQQiJrdcKN/
IsGgnrZ7ZM/UfiL/rzM3ppSHFucOvqpoNTI163ON/GqwGPCxl9YXR4Pxcqvzq8Hx
KBKUKCuMiqttn7XxExzsj1IJFtHQAZflzbDT+Tk4jU3A4+0xB9Z8FwCNVGmb7J1o
JB1NXVLO/sOx3Nb5F5dNFXCXcGRld61BL+XoGzvQBdDNrRrC9KiVJ9gjddshNjAc
W9p616MqY18YKqaZ0efJGAITtMFY8fsTA1OLes7ZJqW1nryH4l802cc7KpE2lIPi
AcXtNuExx4kroxPjzGRReAAJxeyRjp7W5hTFaWjqiQC7ROMUl6Q=
=jQ2Z
-----END PGP SIGNATURE-----

--1SKT+jp6GPffWmSZ--

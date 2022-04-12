Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5BA94FCEE2
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Apr 2022 07:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbiDLFV1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Apr 2022 01:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbiDLFV0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Apr 2022 01:21:26 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9D6F08
        for <linux-parisc@vger.kernel.org>; Mon, 11 Apr 2022 22:19:06 -0700 (PDT)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_64F264CD-8B8E-4CB6-92AA-2CFC07EA0DAD";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
From:   Sam James <sam@gentoo.org>
In-Reply-To: <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
Date:   Tue, 12 Apr 2022 06:18:57 +0100
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
Message-Id: <94439119-D2B6-4961-B61D-95784E09798D@gentoo.org>
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
To:     John David Anglin <dave.anglin@bell.net>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Apple-Mail=_64F264CD-8B8E-4CB6-92AA-2CFC07EA0DAD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 5 Apr 2022, at 22:13, John David Anglin <dave.anglin@bell.net> =
wrote:
>=20
> On 2022-03-22 1:52 p.m., Sam James wrote:
>> In Gentoo, we've just got our hands on an RP3440 (PA8800) which seems =
to quite easily hit inequivalent aliasing issues.
>>=20
>> We've found that under some workloads, the machine copes fine, none =
of that appears in dmesg, and all is well - even for
>> over a week. But as soon as we start other workloads (the problematic =
one is building "stages" -- release media for Gentoo),
>> within 30m or so, the machine is in a broken state, with these =
messages flooding dmesg:
>> ```
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x42994000 and 0x426e1000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x426e1000 and 0x41b56000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41b56000 and 0x41aae000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41aae000 and 0x42774000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x42774000 and 0x41202000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41202000 and 0x428dd000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41e2c000 and 0x418f6000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x418f6000 and 0x42980000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x42980000 and 0x426cd000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x426cd000 and 0x41b42000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41b42000 and 0x41a9a000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41a9a000 and 0x42760000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x42760000 and 0x411ee000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x411ee000 and 0x428c9000 in file bash
>> ```
> It seems all these messages result from a single call to =
flush_dcache_page.  Note the sequential behavior of old_addr
> and addr, and message times.

FWIW, from Helge's config on 5.10.108 (config changes on my end: just =
disabling unneeded devices to speed up build), I have the same
horrible wall:
[...]
[909453.077034] INEQUIVALENT ALIASES 0x41e26000 and 0x42ae2000 in file =
gmake
[909453.079829] INEQUIVALENT ALIASES 0x428a7000 and 0x41971000 in file =
python3.9
[909453.084697] INEQUIVALENT ALIASES 0x41d11000 and 0x41add000 in file =
gmake
[909453.084934] INEQUIVALENT ALIASES 0x41add000 and 0x418f4000 in file =
gmake
[909453.085426] INEQUIVALENT ALIASES 0x418f4000 and 0x41ded000 in file =
gmake
[909453.085658] INEQUIVALENT ALIASES 0x41ded000 and 0x42aa9000 in file =
gmake
[909453.093396] INEQUIVALENT ALIASES 0x41d2c000 and 0x41af8000 in file =
gmake
[909453.093630] INEQUIVALENT ALIASES 0x41af8000 and 0x4190f000 in file =
gmake
[909453.094390] INEQUIVALENT ALIASES 0x4190f000 and 0x41e08000 in file =
gmake
[909453.094621] INEQUIVALENT ALIASES 0x41e08000 and 0x42ac4000 in file =
gmake
[909453.096778] INEQUIVALENT ALIASES 0x41d2d000 and 0x41af9000 in file =
gmake
[909453.098128] INEQUIVALENT ALIASES 0x41af9000 and 0x41910000 in file =
gmake
[909453.098361] INEQUIVALENT ALIASES 0x41910000 and 0x41e09000 in file =
gmake
[909453.099649] INEQUIVALENT ALIASES 0x41e09000 and 0x42ac5000 in file =
gmake
[909453.099897] INEQUIVALENT ALIASES 0x41d2a000 and 0x41af6000 in file =
gmake
[909453.102098] INEQUIVALENT ALIASES 0x41af6000 and 0x4190d000 in file =
gmake
[909453.103649] INEQUIVALENT ALIASES 0x4190d000 and 0x41e06000 in file =
gmake
[909453.103649] INEQUIVALENT ALIASES 0x41e06000 and 0x42ac2000 in file =
gmake
[909453.176099] INEQUIVALENT ALIASES 0x41d26000 and 0x41af2000 in file =
gmake
[909453.176332] INEQUIVALENT ALIASES 0x41af2000 and 0x41909000 in file =
gmake
[909453.176781] INEQUIVALENT ALIASES 0x41909000 and 0x41e02000 in file =
gmake
[909453.177011] INEQUIVALENT ALIASES 0x41e02000 and 0x42abe000 in file =
gmake
[909453.179720] INEQUIVALENT ALIASES 0x41d4c000 and 0x41b18000 in file =
gmake
[909453.182175] INEQUIVALENT ALIASES 0x41b18000 and 0x4192f000 in file =
gmake
[...]
[a while later]

[965092.169806] do_page_fault() command=3D'conftest' type=3D15 =
address=3D0x00000000 in libc-2.33.so[f8418000+17b000]
                trap #15: Data TLB miss fault
[965092.170490] CPU: 0 PID: 1786 Comm: conftest Tainted: G            E  =
   5.10.108 #1
[965092.170498] Hardware name: 9000/800/rp3440

[965092.170514]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[965092.170524] PSW: 00000000000001001111111100001111 Tainted: G         =
   E
[965092.170535] r00-03  000000ff0004ff0f 00000000f8597400 =
00000000f84a9e73 0000000000000003
[965092.170567] r04-07  00000000f8597c00 000000004249cd10 =
0000000000000010 0000000000000038
[965092.170577] r08-11  00000000f90e3be0 00000000f90e3bc8 =
000000004249cd10 0000000000000002
[965092.170588] r12-15  00000000f90e39c8 000000004249c5e0 =
0000000000000007 00000000f90e3a2c
[965092.170599] r16-19  0000000000000002 00000000f90e3a24 =
0000000000000000 00000000f8597c00
[965092.170610] r20-23  0000000000000003 0000000000000000 =
00000000f90e3be0 000000004249cd10
[965092.170621] r24-27  0000000000000004 0000000000000018 =
000000004249cd10 0000000041d34000
[965092.170632] r28-31  000000004249cd10 0000000000000000 =
00000000f90e3d80 0000000000000000
[965092.170642] sr00-03  000000000ed70800 0000000000000000 =
0000000000000000 000000000ed70800
[965092.170653] sr04-07  000000000ed70800 000000000ed70800 =
000000000ed70800 000000000ed70800

[965092.170668]       VZOUICununcqcqcqcqcqcrmunTDVZOUI
[965092.170677] FPSR: 00000000000000000000000000000000
[965092.170685] FPER1: 00000000
[965092.170696] fr00-03  0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
[965092.170707] fr04-07  bff0000000000000 41d88c07fdc00000 =
3fe999999959554e 4001c28f5c28f5c3
[965092.170718] fr08-11  0000000000000000 8000000000000000 =
bfe5555555555560 bfe5555555555560
[965092.170729] fr12-15  0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
[965092.170740] fr16-19  0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
[965092.170751] fr20-23  0000000000000000 0000000000000000 =
0000000000000038 00002c6300000032
[965092.170762] fr24-27  0000008000000000 0000000000000000 =
3fd56217fdb2473a 3fdffffffffffdbd
[965092.170773] fr28-31  bfe0000000000001 3d2ef35793c76730 =
3fd555555551305b 8000000000000000

[965092.170790] IASQ: 000000000ed70800 000000000ed70800 IAOQ: =
00000000f84aa023 00000000f84aa027
[965092.170799]  IIR: 0ea810b4    ISR: 000000000ed70800  IOR: =
0000000000000000
[965092.170809]  CPU:        0   CR30: 000000017655c000 CR31: =
ffffffffdbfbffff
[965092.170817]  ORIG_R28: 0000000000000000
[965092.170825]  IAOQ[0]: 00000000f84aa023
[965092.170834]  IAOQ[1]: 00000000f84aa027
[965092.170842]  RP(r2): 00000000f84a9e73
[967521.206030] INEQUIVALENT ALIASES 0x4124f000 and 0x41f24000 in file =
ccache
[967521.206325] INEQUIVALENT ALIASES 0x4124e000 and 0x41f23000 in file =
ccache
[967553.003301] conftest(27686): unaligned access to 0x00000000f9bc7755 =
at ip=3D0x000000004243b7fb
[967553.003639] conftest(27686): unaligned access to 0x00000000f9bc7756 =
at ip=3D0x000000004243b807
[967830.349792] INEQUIVALENT ALIASES 0x84000 and 0xf6783000 in file cc1
[967830.350074] INEQUIVALENT ALIASES 0x83000 and 0xf6782000 in file cc1
[967830.365661] INEQUIVALENT ALIASES 0x10d000 and 0xf680c000 in file cc1
[967830.366026] INEQUIVALENT ALIASES 0x10c000 and 0xf680b000 in file cc1
[967830.366538] INEQUIVALENT ALIASES 0xfd000 and 0xf67fc000 in file cc1
[...]

I see the TLB miss faults occasionally but not always with the big =
ALIASES wall.

>=20
> Possibly, the VMA interval tree is corrupt, so the loop doesn't =
terminate properly.
>=20
>         vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, =
pgoff) {
>                 offset =3D (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
>                 addr =3D mpnt->vm_start + offset;
>=20
>                 /* The TLB is the engine of coherence on parisc: The
>                  * CPU is entitled to speculate any page with a TLB
>                  * mapping, so here we kill the mapping then flush the
>                  * page along a special flush only alias mapping.
>                  * This guarantees that the page is no-longer in the
>                  * cache for any process and nor may it be
>                  * speculatively read in (until the user or kernel
>                  * specifically accesses it, of course) */
>=20
>                 flush_tlb_page(mpnt, addr);
>                 if (old_addr =3D=3D 0 || (old_addr & (SHM_COLOUR - 1))
>                                       !=3D (addr & (SHM_COLOUR - 1))) =
{
>                         __flush_cache_page(mpnt, addr, =
page_to_phys(page));
>                         if (parisc_requires_coherency() && old_addr)
>                                 printk(KERN_ERR "INEQUIVALENT ALIASES =
0x%lx and 0x%lx in file %pD\n", old_addr, addr, mpnt->vm_file);
>                         old_addr =3D addr;
>                 }
>         }
>=20
> I see arm skips some VMAs:
>=20
>         vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, =
pgoff) {
>                 unsigned long offset;
>=20
>                 /*
>                  * If this VMA is not in our MM, we can ignore it.
>                  */
>                 if (mpnt->vm_mm !=3D mm)
>                         continue;
>                 if (!(mpnt->vm_flags & VM_MAYSHARE))
>                         continue;
>                 offset =3D (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
>                 flush_cache_page(mpnt, mpnt->vm_start + offset, =
page_to_pfn(page));
>         }
>=20

Is there anything I can do to confirm your suspicion?

> Dave
>=20
> --
> John David Anglin  dave.anglin@bell.net

best,
sam


--Apple-Mail=_64F264CD-8B8E-4CB6-92AA-2CFC07EA0DAD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYOpPv/uDUzOcqtTy9JIoEO6gSDsFAmJVC8FfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYw
RUE0RkJGRkI4MzUzMzM5Q0FBRDRGMkY0OTIyODEwRUVBMDQ4M0IACgkQ9JIoEO6g
SDvsHgf+NsocTNzlW43RREr3/j71pvnn/7bCOZq11St20F+LWl5ygbgsf5vTw65J
59XNDWDfdQ5YWiTVAPdFk3YHwyLqnicV9cpIm8z+ROCeb5hWE9HXishqen9E3ok0
WX3P1OoWlzKfxSc6zhfcBYGWRB7vT6vtffdRKQoOA5fWBlX9/B1cneGVxJf5HyUz
vvJanI+U8q515pYwttaB7CiH5bmd1aLAeSDJo9DR1kuT8v+wlLzykPTI2ymVk7ru
4J1g7D3yZ0Ee72hfekPX3s1vNUE8VLuNrPoy7qi9Smf+HO7WayWvYZ83Rt+GLRc+
iVQ/Gp3O42gUc47jd2zJO/elydbsvA==
=CNjx
-----END PGP SIGNATURE-----

--Apple-Mail=_64F264CD-8B8E-4CB6-92AA-2CFC07EA0DAD--

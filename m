Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8821E507A85
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Apr 2022 21:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352598AbiDSTzQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 Apr 2022 15:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344535AbiDSTzP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Apr 2022 15:55:15 -0400
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764903631B
        for <linux-parisc@vger.kernel.org>; Tue, 19 Apr 2022 12:52:31 -0700 (PDT)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_78754CCD-969C-40EB-9D6F-87E0F68B8D6A";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
From:   Sam James <sam@gentoo.org>
In-Reply-To: <93BE3A28-6EBE-4DC4-92BE-867E7ACB255B@gentoo.org>
Date:   Tue, 19 Apr 2022 20:52:24 +0100
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
Message-Id: <FD03A5C5-9B87-4117-9FFF-545E31668AD0@gentoo.org>
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
 <94439119-D2B6-4961-B61D-95784E09798D@gentoo.org>
 <cb19a0a0-69b2-ab14-7767-a0cd7bd671b0@bell.net>
 <383d6dfa-bef1-e56f-8f82-dfc0682cdacc@bell.net>
 <93BE3A28-6EBE-4DC4-92BE-867E7ACB255B@gentoo.org>
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


--Apple-Mail=_78754CCD-969C-40EB-9D6F-87E0F68B8D6A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 13 Apr 2022, at 00:45, Sam James <sam@gentoo.org> wrote:
>=20
>=20
>=20
>> On 12 Apr 2022, at 14:20, John David Anglin <dave.anglin@bell.net> =
wrote:
>>=20
>> On 2022-04-12 8:27 a.m., John David Anglin wrote:
>>> On 2022-04-12 1:18 a.m., Sam James wrote:
>>>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x411ee000 and 0x428c9000 in file bash
>>>>>> ```
>>>>> It seems all these messages result from a single call to =
flush_dcache_page. Note the sequential behavior of old_addr
>>>>> and addr, and message times.
>>>> FWIW, from Helge's config on 5.10.108 (config changes on my end: =
just disabling unneeded devices to speed up build), I have the same
>>>> horrible wall:
>>> This change might help:
>>> =
https://lore.kernel.org/linux-parisc/YlNw8jzP9OQRKvlV@mx3210.localdomain/T=
/#u
>>>=20
>>> It applies on top of Helge's current for-next tree which is based on =
5.18.0-rc1+.
>>>=20
>>> The messages will no longer appear with this patch on c8000/rp34xx. =
However, the loop corruption
>>> might still occur. If that happens, I think the stall detector will =
trigger, or maybe some other crash.
>>>=20
>>> The loop is changed to flush all mount points on machines with =
PA8800 or PA8900 processors as I
>>> believe these CPUs don't support equivalent aliases.
>>=20
>> Thousands of messages aren't useful. I would suggest adding a BUG_ON =
statement in the loop that
>> triggers on the first message. That might help find the circumstances =
that cause the problem.
>>=20
>=20
> Your change *seems* to have prevented the "bad wall"! But now we get =
some silent runtime corruption
> and binaries crashing (5.18.0_rc2 + for-next + your patch).
>=20
> So this seems like a good improvement given those crashes happened =
previously too, although maybe
> less often.
>=20
> Not sure how to get more debugging info yet, there is nothing helpful =
in dmesg (no messages at all when
> it happens). Suggestions (given it is not hitting that loop)?

Spoke slightly too soon: processes dying / corruption happened with v1, =
and we maybe got a bit longer out of v2,
but then issues started again (processes dying, nothing in dmesg).

Once the "bad state" happens, the system is generally unreliable. I =
tried to upgrade man-db and then I got
a gcc ICE:
```
/bin/sh ../../libtool  --tag=3DCC   --mode=3Dcompile =
hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../..  =
-DDEFAULT_TEXT_DOMAIN=3D\"man-db-gnulib\"   -Wno-cast-qual =
-Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef =
-Wno-unused-function -Wno-unused-parameter -Wno-float-conversion =
-Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion =
-Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=3D2.0 =
-Wall -c -o glthread/libgnu_la-threadlib.lo `test -f =
'glthread/threadlib.c' || echo './'`glthread/threadlib.c
/bin/sh ../../libtool  --tag=3DCC   --mode=3Dcompile =
hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../..  =
-DDEFAULT_TEXT_DOMAIN=3D\"man-db-gnulib\"   -Wno-cast-qual =
-Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef =
-Wno-unused-function -Wno-unused-parameter -Wno-float-conversion =
-Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion =
-Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=3D2.0 =
-Wall -c -o libgnu_la-timespec.lo `test -f 'timespec.c' || echo =
'./'`timespec.c
during RTL pass: reload
In file included from regex.c:74:
regcomp.c: In function =E2=80=98parse_expression=E2=80=99:
regcomp.c:2421:1: internal compiler error: Segmentation fault
 2421 | }
      | ^
libtool: compile:  hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. =
-I../.. -DDEFAULT_TEXT_DOMAIN=3D\"man-db-gnulib\" -Wno-cast-qual =
-Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef =
-Wno-unused-function -Wno-unused-parameter -Wno-float-conversion =
-Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion =
-Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=3D2.0 =
-Wall -c glthread/threadlib.c  -fPIC -DPIC -o =
glthread/.libs/libgnu_la-threadlib.o
libtool: compile:  hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. =
-I../.. -DDEFAULT_TEXT_DOMAIN=3D\"man-db-gnulib\" -Wno-cast-qual =
-Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef =
-Wno-unused-function -Wno-unused-parameter -Wno-float-conversion =
-Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion =
-Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=3D2.0 =
-Wall -c timespec.c  -fPIC -DPIC -o .libs/libgnu_la-timespec.o
/bin/sh ../../libtool  --tag=3DCC   --mode=3Dcompile =
hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../..  =
-DDEFAULT_TEXT_DOMAIN=3D\"man-db-gnulib\"   -Wno-cast-qual =
-Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef =
-Wno-unused-function -Wno-unused-parameter -Wno-float-conversion =
-Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion =
-Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=3D2.0 =
-Wall -c -o libgnu_la-unistd.lo `test -f 'unistd.c' || echo =
'./'`unistd.c
/bin/sh ../../libtool  --tag=3DCC   --mode=3Dcompile =
hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../..  =
-DDEFAULT_TEXT_DOMAIN=3D\"man-db-gnulib\"   -Wno-cast-qual =
-Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef =
-Wno-unused-function -Wno-unused-parameter -Wno-float-conversion =
-Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion =
-Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=3D2.0 =
-Wall -c -o libgnu_la-dup-safer.lo `test -f 'dup-safer.c' || echo =
'./'`dup-safer.c
0xf61f7313 __libc_start_call_main
        ../sysdeps/nptl/libc_start_call_main.h:58
0xf61f746f __libc_start_main_impl
        =
/var/tmp/portage/sys-libs/glibc-2.34-r11/work/glibc-2.34/csu/libc-start.c:=
409
Please submit a full bug report,
with preprocessed source if appropriate.
Please include the complete backtrace with any bug report.
See <https://bugs.gentoo.org/> for instructions.
make[4]: *** [Makefile:3664: libgnu_la-regex.lo] Error 1
make[4]: *** Waiting for unfinished jobs....
```

(I don't anticipate this being a genuine ICE, as it only happens when =
the system becomes "tainted", and is not reproducible after reboots =
during normal activity.)

Best,
sam

--Apple-Mail=_78754CCD-969C-40EB-9D6F-87E0F68B8D6A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYOpPv/uDUzOcqtTy9JIoEO6gSDsFAmJfEvhfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYw
RUE0RkJGRkI4MzUzMzM5Q0FBRDRGMkY0OTIyODEwRUVBMDQ4M0IACgkQ9JIoEO6g
SDtadAgAnN+ljoLHmckC6+amSSrbIzJZ2Snjps2hZmDrSZxBrsbkyApBYKhyZA+k
LseLclik2WsT9kFs4XeT9dCsZSjNkzFADA8e5nH9y99yAIgDO59HuJEO+iegZw57
IdNJO3Yzaz6WPQO1LF12WWyURvOFlk2gKeBx4xtM27yVJepYcPVb75++GrUWE5RM
/75pol6Jb/ijZ7di+IuyiGsWGJ70TefdgY1tzo7MjBX0usuOT0evtCA3AHK9lNx5
GeXy5Cxxdf5bpcSx6fZ87vRs+wxQ9OTuiuUC44GMrOxjeldyxZt4c0XrJGw1+ikJ
kxRO7xTT6YWWS+nEUdMnzD9Okaw7gQ==
=VdJ+
-----END PGP SIGNATURE-----

--Apple-Mail=_78754CCD-969C-40EB-9D6F-87E0F68B8D6A--

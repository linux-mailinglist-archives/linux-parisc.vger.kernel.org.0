Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728074E47AD
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Mar 2022 21:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbiCVUoJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Mar 2022 16:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbiCVUoJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Mar 2022 16:44:09 -0400
Received: from smtp.gentoo.org (dev.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7287523E
        for <linux-parisc@vger.kernel.org>; Tue, 22 Mar 2022 13:42:40 -0700 (PDT)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_38D68CAC-A2E1-460C-ACB5-78CFA796CA52";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
From:   Sam James <sam@gentoo.org>
In-Reply-To: <a8756bee-e149-c03c-36cd-6842eb12d2de@gmx.de>
Date:   Tue, 22 Mar 2022 20:42:34 +0000
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, hppa@gentoo.org
Message-Id: <FBC408F2-F3D7-4148-8006-DC6189DC78CB@gentoo.org>
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <b84f1c67-eea7-f07a-0163-6e06b0f5f650@bell.net>
 <309C1399-6AA2-44BD-8EB9-FDB66F5D972E@gentoo.org>
 <a8756bee-e149-c03c-36cd-6842eb12d2de@gmx.de>
To:     Helge Deller <deller@gmx.de>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Apple-Mail=_38D68CAC-A2E1-460C-ACB5-78CFA796CA52
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 22 Mar 2022, at 19:52, Helge Deller <deller@gmx.de> wrote:
>=20
> On 3/22/22 20:37, Sam James wrote:
>>> On 22 Mar 2022, at 18:19, John David Anglin <dave.anglin@bell.net> =
wrote:
>>>=20
>>> On 2022-03-22 1:52 p.m., Sam James wrote:
>>>> Hi all,
>>>>=20
>>>> In Gentoo, we've just got our hands on an RP3440 (PA8800) which =
seems to quite easily hit inequivalent aliasing issues.
>>>>=20
>>>> We've found that under some workloads, the machine copes fine, none =
of that appears in dmesg, and all is well - even for
>>>> over a week. But as soon as we start other workloads (the =
problematic one is building "stages" -- release media for Gentoo),
>>>> within 30m or so, the machine is in a broken state, with these =
messages flooding dmesg:
>>>> ```
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x42994000 and 0x426e1000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x426e1000 and 0x41b56000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x41b56000 and 0x41aae000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x41aae000 and 0x42774000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x42774000 and 0x41202000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x41202000 and 0x428dd000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x41e2c000 and 0x418f6000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x418f6000 and 0x42980000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x42980000 and 0x426cd000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x426cd000 and 0x41b42000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x41b42000 and 0x41a9a000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x41a9a000 and 0x42760000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x42760000 and 0x411ee000 in file bash
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x411ee000 and 0x428c9000 in file bash
>>> I don't think this is new. There are no changes to the code that =
detects INEQUIVALENT ALIASES in the latest pull.
>>>=20
>>=20
>> Sorry, to be clear: I wasn't trying to suggest the issue is new -- =
just saying that we've been trying 5.10, 5.15+ to
>> see if latest changes helped at all, but they haven't.
>>=20
>> In our experience so far, there has been no good kernel version for =
us on this hardware.
>=20
> One of the debian buildd servers I mentioned earlier is a 4-way =
rp3440, and 5.10 runs stable on it for me.
> Did you tried plain 5.10.0, or including all patches from the stable =
branches?

It was ~5.10.90.

> This is the kernel config I used:
> http://backup.parisc-linux.org/kernel/STABLE/debian-config

I'm going to try latest 5.10.x along with your config, then try Dave's =
config with 5.16.x, and report back.

Thanks for sharing it!

>=20
>>> I've seen this before but it's not occurring in my current builds =
for rp3440 and c8000. I've been running for-next
>>> changes on c8000 for several weeks.
>>>=20
>>=20
>> Yeah, I haven't seen this at all on my C8000 (or Gentoo's other HW, a =
C3600).
>>=20
>>> I suspect a problem with shmat but I'm not sure.
>=20
> I suspected that as well, because I had the impression we still carry =
a patch in
> debian's glibc. But I checked debian glibc sources again, and I think =
all such
> relevant patches are now upstreamed.

Yeah, I had a rough look at Debian's toolchain bits and didn't see any =
patches
which might be relevant. But of course I could have missed something as =
I'm
not super familiar with Debian's development processes etc.

Best,
sam


--Apple-Mail=_38D68CAC-A2E1-460C-ACB5-78CFA796CA52
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYOpPv/uDUzOcqtTy9JIoEO6gSDsFAmI6NLpfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYw
RUE0RkJGRkI4MzUzMzM5Q0FBRDRGMkY0OTIyODEwRUVBMDQ4M0IACgkQ9JIoEO6g
SDshQQf/bniP3xTcW8rmFajfDx0R/szBZxz+fSxpPyEriLXh8yyVcIwIB2mR98+e
cBvuI7EkeeBkVnIoaO2CIWSwtTNxVdxJkq/SGvzsBLGHsaS3+cianFrY0BAqk+zO
IfUSTgkYc6Zxq2+6dZQKnK9awJWZXshxEyFyPk8zGXfPg7oKEqMe5lp8CTdMlp/F
ndCAK8q0yzrvXJnMHbqHYhpZPHQaDuZ3kfndIC7udJI9IA1aLGs6kY/fOVcQ9BlX
yF92hLkiE1Zuf/Sf4MWC1bQBZITXJVfqR7orbSQxYq6DtDyL4CcaLArIrNS563QS
UNuPKm+ulWClodqd9mF8dMa1Iz7Awg==
=J7Ei
-----END PGP SIGNATURE-----

--Apple-Mail=_38D68CAC-A2E1-460C-ACB5-78CFA796CA52--

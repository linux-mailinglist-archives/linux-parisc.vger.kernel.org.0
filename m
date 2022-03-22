Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC434E46E5
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Mar 2022 20:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbiCVTsi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Mar 2022 15:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiCVTsh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Mar 2022 15:48:37 -0400
Received: from smtp.gentoo.org (dev.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E734B5FBA
        for <linux-parisc@vger.kernel.org>; Tue, 22 Mar 2022 12:47:09 -0700 (PDT)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_3F977408-67D8-4AB4-BF49-F1839F09FDD8";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
From:   Sam James <sam@gentoo.org>
In-Reply-To: <23931882-c00e-79b1-09ed-91c8799d0aa7@gmx.de>
Date:   Tue, 22 Mar 2022 19:47:04 +0000
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
Message-Id: <28923936-B22C-4CC9-818B-FBC674DBF0DB@gentoo.org>
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <23931882-c00e-79b1-09ed-91c8799d0aa7@gmx.de>
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


--Apple-Mail=_3F977408-67D8-4AB4-BF49-F1839F09FDD8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 22 Mar 2022, at 18:14, Helge Deller <deller@gmx.de> wrote:
>=20
> Hi Sam,
>=20

Hi Helge!

> On 3/22/22 18:52, Sam James wrote:
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
>>=20
>> When it's in this state, GCC ends up ICEing at some point and other =
userland command fails too (e.g. last night
>> I tried unpacking a kernel and 'xz' failed the first time, but worked =
the second). It might be of note that I think
>> the failures end up happening during a HPPA 1.1 build.
>>=20
>> I appreciate this isn't really enough information to solve the =
problem, but I'm not sure what I need to obtain:
>> any suggestions for how to debug this further & get more information =
to better receive assistance would be most welcome.
>>=20
>> The machine is currently running 5.17.0 along with Helge's tree up to =
(and including) Linus's pull for 5.18.0
>> =
(https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/c=
ommit/?h=3Dfor-next&id=3Da04b1bf574e1f4875ea91f5c62ca051666443200).
>=20
> The INEQUIVALENT ALIASES messages are most likely not related to the =
instability
> of your machine. I see them randomly on the debian buildd servers as =
well.
>=20

Understood. The weird thing is, they only happen when the "bad things" =
start, but
I understand it may be unrelated or just a side-effect of the real =
issue.

When we see a handful of them, things are usually fine, but when the =
"issues start",
there's 100s of lines of this in dmesg for all sorts of processes (but =
mainly bash).

> Instead of using the latest (development) kernels, I'd suggest that =
you
> first try with a "stable" kernel.
> On the debian buildd servers I'm currently running Kernel 5.10.106+, =
which is pretty stable.
> I think Dave is running 5.16.x quite ok.

I've been trying 5.10.x (5.10.88, 5.10.93), 5.16.x (5.16.5), 5.17.x =
(rc2, rc7, rc8), and some others.

All of them are OK until we start doing more work on the machine. :(

Then all break in the same way.

>=20
>> We're also using GCC 11.2 (but a snapshot from their stable 11 =
branch), glibc 2.34 (with latest patches), and latest
>> Binutils 2.37 (with patches from upstream again).
>>=20
>> I've also attached the running kernel config in case any suggestions =
can be made there to either aid debugging or
>> reduce the chances of this issue occurring.
>>=20
>> TL:DR: Lots of inequivalent aliases issues when running certain =
intensive workloads (but not others?), system ends up
>> in a bad state and needs a reboot to function correctly (otherwise =
userland may misbehave/crash), need more help
>> with how to debug/get more information out of it/narrow it down.
>>=20
>> Of course, if needed, we can provide access to the machine for kernel =
maintainers and show them how to induce a broken
>> State (or do it for them repeatedly) if we can't find a smaller test =
case.
>=20
> Is there any other output in dmesg which is not INEQUIVALENT ALIASES?
> E.g. "stuck processes" messages?
>=20

Just checked: nothing else :(

Here it is though (I only grepped out sshd to avoid showing user IPs): =
https://dev.gentoo.org/~sam/bugs/linux-parisc/2022-03-22-dmesg-muta.txt

Best,
sam


--Apple-Mail=_3F977408-67D8-4AB4-BF49-F1839F09FDD8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYOpPv/uDUzOcqtTy9JIoEO6gSDsFAmI6J7hfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYw
RUE0RkJGRkI4MzUzMzM5Q0FBRDRGMkY0OTIyODEwRUVBMDQ4M0IACgkQ9JIoEO6g
SDt0wQgAgAAo5sZzp9eVXv+cIRi/Lz1EzIKEAqiIWt2WlCOqkgeY/ADdeEtaAH5+
TxA4++cy+5KuGoO6WkV6m8enh1KDeSpiGGXO+2bt4oKmxC2xOdV1i7U7N3eJvuA4
0JSNxUug1bjEZk0x/lNIozWXOE5+hpKZeeT+x6LX7AeAIxkUAJM5vGfX0kZ2w8ZD
42VxymdY4YHfZGWkgcA1eoetWIjU7K5wlI0MDBQFRguZDriVSbHD4c8a4IkZve89
4zUNk/xFfSpnr0Ey3g9B4N8+VLagcpD4lDH7EoBD7n7n8GYiLxz+eGUrOUeO2usX
rBPn1GkGKuAVaaeV0dgR8F2JWbqs7Q==
=cQmz
-----END PGP SIGNATURE-----

--Apple-Mail=_3F977408-67D8-4AB4-BF49-F1839F09FDD8--

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7D414E46CF
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Mar 2022 20:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbiCVTjW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Mar 2022 15:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231753AbiCVTjV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Mar 2022 15:39:21 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B038A6D0
        for <linux-parisc@vger.kernel.org>; Tue, 22 Mar 2022 12:37:52 -0700 (PDT)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_48C75D20-0E4C-4889-BB10-3534A371C6B7";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
From:   Sam James <sam@gentoo.org>
In-Reply-To: <b84f1c67-eea7-f07a-0163-6e06b0f5f650@bell.net>
Date:   Tue, 22 Mar 2022 19:37:46 +0000
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
Message-Id: <309C1399-6AA2-44BD-8EB9-FDB66F5D972E@gentoo.org>
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <b84f1c67-eea7-f07a-0163-6e06b0f5f650@bell.net>
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


--Apple-Mail=_48C75D20-0E4C-4889-BB10-3534A371C6B7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 22 Mar 2022, at 18:19, John David Anglin <dave.anglin@bell.net> =
wrote:
>=20
> On 2022-03-22 1:52 p.m., Sam James wrote:
>> Hi all,
>>=20
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
> I don't think this is new.  There are no changes to the code that =
detects INEQUIVALENT ALIASES in the latest pull.
>=20

Sorry, to be clear: I wasn't trying to suggest the issue is new -- just =
saying that we've been trying 5.10, 5.15+ to
see if latest changes helped at all, but they haven't.

In our experience so far, there has been no good kernel version for us =
on this hardware.

> I've seen this before but it's not occurring in my current builds for =
rp3440 and c8000.  I've been running for-next
> changes on c8000 for several weeks.
>=20

Yeah, I haven't seen this at all on my C8000 (or Gentoo's other HW, a =
C3600).

> I suspect a problem with shmat but I'm not sure.
>> [snip]

best,
sam


--Apple-Mail=_48C75D20-0E4C-4889-BB10-3534A371C6B7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYOpPv/uDUzOcqtTy9JIoEO6gSDsFAmI6JYpfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYw
RUE0RkJGRkI4MzUzMzM5Q0FBRDRGMkY0OTIyODEwRUVBMDQ4M0IACgkQ9JIoEO6g
SDvgvQgAqYLRjtSsuDV+hIgiXLzx3JPGMUd3rv+zxEhpSfFRoQ5cpJvViqRL5IYV
0W0h6Llc0t9cFy6dMMvBQ6Z1KK3DnpYb9TUkybOAtBeRPptH4ZwpwhDvlqMDDfYU
1OxbZP7iDtSBr2m1lG6PARJI4Dr6VSCh88090uoEMF4N/Nmg+zEC/tcKFuNi9bYA
jkHbYzKSwQIzm200qJupowb6qnTu/jicp57Z1cNfxbdWRVH/2FhrlDgYGV/b91nB
a7MFaTdCa23OX9vH123VgppC0GuEDFEWMq+CjSvlY/VReC/T6UBB+Me2SbBphWlb
Kw6DpbexuoxCiKK42OW0qAz9nhK06g==
=Q9xE
-----END PGP SIGNATURE-----

--Apple-Mail=_48C75D20-0E4C-4889-BB10-3534A371C6B7--

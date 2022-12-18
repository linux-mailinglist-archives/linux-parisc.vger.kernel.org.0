Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1E464FEC9
	for <lists+linux-parisc@lfdr.de>; Sun, 18 Dec 2022 12:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiLRLmF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 18 Dec 2022 06:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLRLmE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 18 Dec 2022 06:42:04 -0500
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BEEBE26
        for <linux-parisc@vger.kernel.org>; Sun, 18 Dec 2022 03:42:03 -0800 (PST)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_C3396E74-3636-47F3-AEAA-D90CC32CCC55";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: Way to kill processes with unaligned access?
From:   Sam James <sam@gentoo.org>
In-Reply-To: <1Mf07E-1oQMEy3JxS-00gYTD@mail.gmx.net>
Date:   Sun, 18 Dec 2022 11:41:11 +0000
Cc:     linux-parisc@vger.kernel.org
Message-Id: <2407F312-9FFD-4872-B172-405787E99C1E@gentoo.org>
References: <1Mf07E-1oQMEy3JxS-00gYTD@mail.gmx.net>
To:     Helge Deller <deller@gmx.de>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Apple-Mail=_C3396E74-3636-47F3-AEAA-D90CC32CCC55
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 18 Dec 2022, at 11:25, Helge Deller <deller@gmx.de> wrote:
>=20
> https://manpages.ubuntu.com/manpages/focal/man1/prctl.1.html
>=20

Thanks, this looks perfect!

> -------- Urspr=C3=BCngliche Nachricht --------
> Von: Helge Deller <deller@gmx.de>
> Datum: 18.12.22 12:23 (GMT+01:00)
> An: Sam James <sam@gentoo.org>, linux-parisc@vger.kernel.org
> Betreff: RE: Way to kill processes with unaligned access?
>=20
> See prctl manpage, PR_SET_UNALIGN.
> -------- Urspr=C3=BCngliche Nachricht --------
> Von: Sam James <sam@gentoo.org>
> Datum: 18.12.22 10:14 (GMT+01:00)
> An: linux-parisc@vger.kernel.org
> Betreff: Way to kill processes with unaligned access?
>=20
> Hi all,
>=20
> I'm wondering if there's a way to configure the kernel such that
> it kills processes when an unaligned access occurs.
>=20
> I often get messages like:
> ```
> [18531.277742] conftest(4066): unaligned access to 0xf7fa1715 at ip =
0x426cb787 (iir 0xf801094)
> [18531.487681] conftest(4066): unaligned access to 0xf7fa1716 at ip =
0x426cb793 (iir 0xf80109c)
> ```
>=20
> I know what they are, but it's a real pain to figure out *which* =
configure test in a given
> case is causing the problem. If there's some way to make the kernel =
kill such naughty processes,
> it'd make it way easier for me to locate.
>=20
> (Sometimes when I've built hundreds of packages, I have a lot of these =
I want to go investigate
> after a week or two, but it's hard to track it down afterwards because =
of this.)
>=20
> Any ideas?
>=20
> Thanks!
>=20


--Apple-Mail=_C3396E74-3636-47F3-AEAA-D90CC32CCC55
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iNUEARYKAH0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCY578WF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MAAKCRBzhAn1IN+R
kABCAQCtoAP3P/uR6XFgYdqgjJBRkTaDXcaFlXRbrQGKWpQjSQEA+dhSI0xlz7Yz
EblXcRI+5SGNw8VHMqxKm1INENSjfwU=
=hwBE
-----END PGP SIGNATURE-----

--Apple-Mail=_C3396E74-3636-47F3-AEAA-D90CC32CCC55--

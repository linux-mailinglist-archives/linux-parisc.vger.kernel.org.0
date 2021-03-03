Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F7832C5D2
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Mar 2021 02:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbhCDAYZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 Mar 2021 19:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238195AbhCCOxX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Mar 2021 09:53:23 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830F2C06178C
        for <linux-parisc@vger.kernel.org>; Wed,  3 Mar 2021 06:43:27 -0800 (PST)
Received: (qmail 12710 invoked from network); 3 Mar 2021 14:43:18 -0000
Received: from p548d4a84.dip0.t-ipconnect.de ([::ffff:84.141.74.132]:36130 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Wed, 03 Mar 2021 15:43:18 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: Cycle offset is larger than allowed by the 'jiffies' clock's max_cycles value
Date:   Wed, 03 Mar 2021 15:43:15 +0100
Message-ID: <2573053.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <69833c49-2eb4-5f6c-fdb6-a1e01d105a8c@gmx.de>
References: <11708426.O9o76ZdvQC@eto.sf-tec.de> <2570738.mvXUDI8C0e@daneel.sf-tec.de> <69833c49-2eb4-5f6c-fdb6-a1e01d105a8c@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11707155.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart11707155.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Mittwoch, 3. M=E4rz 2021, 15:29:42 CET schrieb Helge Deller:
> On 3/1/21 7:44 PM, Rolf Eike Beer wrote:
> > Am Montag, 1. M=E4rz 2021, 17:49:42 CET schrieb Rolf Eike Beer:
> >> Am Montag, 1. M=E4rz 2021, 17:25:18 CET schrieb Rolf Eike Beer:
> >>> After upgrade to 5.11 get this multiple times per second on my C8000:
> >>>=20
> >>> [   36.998702] WARNING: timekeeping: Cycle offset (29) is larger than
> >>> allowed by the 'jiffies' clock's max_cycles value (10): time overflow
> >>> danger [   36.998705]          timekeeping: Your kernel is sick, but
> >>> tries
> >>> to cope by capping time updates
>=20
> I know I have seen this at least once with a 32-bit kernel in qemu as
> well....
> >> Not 5.11, but 5.10.11. 5.10.4 is fine. It could be a bad upgrade attem=
pt,
> >> I'll retry once I have built a proper 5.11 kernel.
> >=20
> > Ok, it's there also in 5.11.2:
> You don't see it in 5.11, but in 5.11.2.
> Sadly none of the changes between those versions seem related
> to this problem.
>=20
> Do you still see this?
> I'd like to get it anaylzed/fixed.

I don't see it in 5.10.4, but in 5.11.2. I have not tried 5.11.0.

Eike
--nextPart11707155.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYD+ggwAKCRBcpIk+abn8
Ti9NAJ9Ex/FY7tiAM4Jkk4+dIQmddFMNLgCfTKiJv/4MirHCdC6xyoJLssqTLx8=
=Kfel
-----END PGP SIGNATURE-----

--nextPart11707155.O9o76ZdvQC--




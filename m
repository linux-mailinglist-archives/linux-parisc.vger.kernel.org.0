Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD7133A4A5
	for <lists+linux-parisc@lfdr.de>; Sun, 14 Mar 2021 13:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235181AbhCNMJ2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 14 Mar 2021 08:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235205AbhCNMJK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 14 Mar 2021 08:09:10 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B47C061574
        for <linux-parisc@vger.kernel.org>; Sun, 14 Mar 2021 05:09:09 -0700 (PDT)
Received: (qmail 18938 invoked from network); 14 Mar 2021 12:08:25 -0000
Received: from p548d5418.dip0.t-ipconnect.de ([::ffff:84.141.84.24]:60756 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sun, 14 Mar 2021 13:08:25 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: Cycle offset is larger than allowed by the 'jiffies' clock's max_cycles value
Date:   Sun, 14 Mar 2021 13:08:54 +0100
Message-ID: <2191464.ElGaqSPkdT@daneel.sf-tec.de>
In-Reply-To: <dc93df38-d2c4-362e-0e22-b8885509c2ea@gmx.de>
References: <11708426.O9o76ZdvQC@eto.sf-tec.de> <2573804.mvXUDI8C0e@daneel.sf-tec.de> <dc93df38-d2c4-362e-0e22-b8885509c2ea@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4608301.GXAFRqVoOG"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart4608301.GXAFRqVoOG
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Sonntag, 14. M=E4rz 2021, 12:16:11 CET schrieben Sie:
> On 3/14/21 10:47 AM, Rolf Eike Beer wrote:
> > Am Mittwoch, 3. M=E4rz 2021, 15:29:42 CET schrieb Helge Deller:
> >> On 3/1/21 7:44 PM, Rolf Eike Beer wrote:
> >>> Am Montag, 1. M=E4rz 2021, 17:49:42 CET schrieb Rolf Eike Beer:
> >>>> Am Montag, 1. M=E4rz 2021, 17:25:18 CET schrieb Rolf Eike Beer:
> >>>>> After upgrade to 5.11 get this multiple times per second on my C800=
0:
> >>>>>=20
> >>>>> [   36.998702] WARNING: timekeeping: Cycle offset (29) is larger th=
an
> >>>>> allowed by the 'jiffies' clock's max_cycles value (10): time overfl=
ow
> >>>>> danger [   36.998705]          timekeeping: Your kernel is sick, but
> >>>>> tries
> >>>>> to cope by capping time updates
> >>=20
> >> I know I have seen this at least once with a 32-bit kernel in qemu as
> >> well....
> >>=20
> >>>> Not 5.11, but 5.10.11. 5.10.4 is fine. It could be a bad upgrade
> >>>> attempt,
> >>>> I'll retry once I have built a proper 5.11 kernel.
> >>>=20
> >>> Ok, it's there also in 5.11.2:
> >> You don't see it in 5.11, but in 5.11.2.
> >> Sadly none of the changes between those versions seem related
> >> to this problem.
> >>=20
> >> Do you still see this?
> >> I'd like to get it anaylzed/fixed.
> >=20
> > Me too. What do you need?
>=20
> I actually don't know.
> First of all it would be great if we could reproduce it.
> Right now I don't see this issue any longer, so I have nowhere to start
> from.

I get it every time if I boot that kernel.

Eike
--nextPart4608301.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYE381gAKCRBcpIk+abn8
ToK/AJ9lWg0Y5mkvP6mAZBgUaBY8mOW0vwCffBHNcCe+IpNRf5vK+TN3M9T79lE=
=c7w6
-----END PGP SIGNATURE-----

--nextPart4608301.GXAFRqVoOG--




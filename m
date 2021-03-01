Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F060B328C55
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Mar 2021 19:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbhCAStl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 1 Mar 2021 13:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240320AbhCASpz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Mar 2021 13:45:55 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386DFC061794
        for <linux-parisc@vger.kernel.org>; Mon,  1 Mar 2021 10:45:12 -0800 (PST)
Received: (qmail 19567 invoked from network); 1 Mar 2021 18:45:08 -0000
Received: from p548d494d.dip0.t-ipconnect.de ([::ffff:84.141.73.77]:33936 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Mon, 01 Mar 2021 19:45:08 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: Cycle offset is larger than allowed by the 'jiffies' clock's max_cycles value
Date:   Mon, 01 Mar 2021 19:44:58 +0100
Message-ID: <2570738.mvXUDI8C0e@daneel.sf-tec.de>
In-Reply-To: <5693583.lOV4Wx5bFT@eto.sf-tec.de>
References: <11708426.O9o76ZdvQC@eto.sf-tec.de> <5693583.lOV4Wx5bFT@eto.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11703944.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart11703944.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Montag, 1. M=E4rz 2021, 17:49:42 CET schrieb Rolf Eike Beer:
> Am Montag, 1. M=E4rz 2021, 17:25:18 CET schrieb Rolf Eike Beer:
> > After upgrade to 5.11 get this multiple times per second on my C8000:
> >=20
> > [   36.998702] WARNING: timekeeping: Cycle offset (29) is larger than
> > allowed by the 'jiffies' clock's max_cycles value (10): time overflow
> > danger [   36.998705]          timekeeping: Your kernel is sick, but tr=
ies
> > to cope by capping time updates
>=20
> Not 5.11, but 5.10.11. 5.10.4 is fine. It could be a bad upgrade attempt,
> I'll retry once I have built a proper 5.11 kernel.

Ok, it's there also in 5.11.2:

[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5=20
jiffies.
[    0.000000] NR_IRQS: 128
[    0.000003] sched_clock: 64 bits at 1000MHz, resolution 1ns, wraps every=
=20
4398046511103ns
[    0.106687] WARNING: timekeeping: Cycle offset (26) is larger than allow=
ed=20
by the 'jiffies' clock's max_cycles value (10): time overflow danger
[    0.106698]          timekeeping: Your kernel is sick, but tries to cope=
 by=20
capping time updates


--nextPart11703944.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYD02KgAKCRBcpIk+abn8
TrnZAJ4kBKgk7yMow4Ok9EkadL9pesbbiQCghOWrvuw3lExTB6hYvpWwxX1MN4c=
=+bCZ
-----END PGP SIGNATURE-----

--nextPart11703944.O9o76ZdvQC--




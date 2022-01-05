Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED14484ED0
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jan 2022 08:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238182AbiAEHmP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jan 2022 02:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238168AbiAEHmO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jan 2022 02:42:14 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C5AC061761
        for <linux-parisc@vger.kernel.org>; Tue,  4 Jan 2022 23:42:13 -0800 (PST)
Received: (qmail 30447 invoked from network); 5 Jan 2022 07:42:00 -0000
Received: from p200300cf07141800183e67d29ced1f8c.dip0.t-ipconnect.de ([2003:cf:714:1800:183e:67d2:9ced:1f8c]:43466 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Wed, 05 Jan 2022 08:42:00 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: pagefaults and hang with 5.15.11
Date:   Wed, 05 Jan 2022 08:42:05 +0100
Message-ID: <2089338.irdbgypaU6@daneel.sf-tec.de>
In-Reply-To: <87pmpbds1r.fsf@x1.stackframe.org>
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de> <3407744.iIbC2pHGDl@daneel.sf-tec.de> <87pmpbds1r.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12927898.uLZWGnKmhe"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart12927898.uLZWGnKmhe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Samstag, 1. Januar 2022, 23:12:16 CET schrieb Sven Schnelle:

> Looks like you have a serial console connected? If yes, could you trigger=
 a
> 'TOC s' from the BMC, and post the output from 'ser x 0 toc', where x is
> the processer number? This could help debugging this.

It locked up again, but the important part is not in the mail or the wiki:=
=20
clear the error log before :/ And even worse, the C8000 does not seem to=20
support "ser clearpim". You can see the firmware commands of a C8000 here:=
=20
https://parisc.wiki.kernel.org/index.php/BMC.

=46un fact: when doing a command in firmware that prints a lot of stuff, li=
ke=20
"se", and then switching back to the normal system console via ESC-) seems =
not=20
to stop the firmware from printing more of it's stuff, so you get junk on t=
he=20
serial line until the firmware is eventually finished. Is there a way to=20
switch the C8000 firmware to more than 9600 baud?

Sorry for the bad mood, but if that is what you first find after wakeup=E2=
=80=A6

Eike
--nextPart12927898.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYdVLzQAKCRBcpIk+abn8
TvC+AJ4mq56D5+o/zpd7HI0OOcfTGrZi7gCfW8YVTSiNISfMKOodUmdwRwgvTJc=
=aUIS
-----END PGP SIGNATURE-----

--nextPart12927898.uLZWGnKmhe--




Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C56A4828B7
	for <lists+linux-parisc@lfdr.de>; Sat,  1 Jan 2022 23:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbiAAW2l (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 1 Jan 2022 17:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231607AbiAAW2l (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 1 Jan 2022 17:28:41 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75DA1C061574
        for <linux-parisc@vger.kernel.org>; Sat,  1 Jan 2022 14:28:40 -0800 (PST)
Received: (qmail 24519 invoked from network); 1 Jan 2022 22:28:41 -0000
Received: from p200300cf074da500183e67d29ced1f8c.dip0.t-ipconnect.de ([2003:cf:74d:a500:183e:67d2:9ced:1f8c]:56496 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sat, 01 Jan 2022 23:28:41 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: pagefaults and hang with 5.15.11
Date:   Sat, 01 Jan 2022 23:28:30 +0100
Message-ID: <2612761.mvXUDI8C0e@daneel.sf-tec.de>
In-Reply-To: <87pmpbds1r.fsf@x1.stackframe.org>
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de> <3407744.iIbC2pHGDl@daneel.sf-tec.de> <87pmpbds1r.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11895592.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart11895592.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 1. Januar 2022, 23:12:16 CET schrieb Sven Schnelle:
> Hi Eike,
> 
> Rolf Eike Beer <eike-kernel@sf-tec.de> writes:
> > Am Montag, 27. Dezember 2021, 15:30:10 CET schrieb Rolf Eike Beer:
> >> Am Sonntag, 26. Dezember 2021, 18:22:12 CET schrieb John David Anglin:
> >> > On 2021-12-26 11:21 a.m., Rolf Eike Beer wrote:
> >> > > [139181.966881] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613
> >> > > rcu_eqs_enter.constprop.0+0x8c/0x98
> >> > 
> >> > This is probably not reproducible. You might try this change from Sven
> >> 
> >> At least this time the git testsuite has finished, but with some errors
> >> as
> >> usual.
> > The machine locked up again, but without many output:
> > 
> > [13093.642353] INEQUIVALENT ALIASES 0x96000 and 0xf5bba000 in file xargs
> > [13094.122900] INEQUIVALENT ALIASES 0x110000 and 0xf5a63000 in file find
> > [13260.968430] INEQUIVALENT ALIASES 0x96000 and 0xf5bba000 in file xargs
> > [16995.351108] ttyS ttyS1:[17649.655079] t[17650.739194] t[17658.174951]
> > t[17659.307044] t[24039.432030] INEQUIVALENT ALIASES 0x113000 and
> > 0xf5a66000 in file find
> 
> Looks like you have a serial console connected? If yes, could you trigger a
> 'TOC s' from the BMC, and post the output from 'ser x 0 toc', where x is
> the processer number? This could help debugging this.

Yes, this is all from serial. I guess this only works during the hang? That 
means I have to boot into the bad kernel again and wait until it breaks. 

Eike
--nextPart11895592.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYdDVjgAKCRBcpIk+abn8
Tr9FAJ40dHKSG0visCceanP4HLn+dVYzHACffu9+pqk6qUJRfkO5lU7pu3sECTY=
=fRRq
-----END PGP SIGNATURE-----

--nextPart11895592.O9o76ZdvQC--




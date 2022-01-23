Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5128449715D
	for <lists+linux-parisc@lfdr.de>; Sun, 23 Jan 2022 12:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236269AbiAWLxd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 23 Jan 2022 06:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236266AbiAWLxd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 23 Jan 2022 06:53:33 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2780EC06173B
        for <linux-parisc@vger.kernel.org>; Sun, 23 Jan 2022 03:53:31 -0800 (PST)
Received: (qmail 32515 invoked from network); 23 Jan 2022 11:52:27 -0000
Received: from p200300cf072d56003c93ebfffef41c54.dip0.t-ipconnect.de ([2003:cf:72d:5600:3c93:ebff:fef4:1c54]:57744 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sun, 23 Jan 2022 12:52:27 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: pagefaults and hang with 5.15.11
Date:   Sun, 23 Jan 2022 12:53:22 +0100
Message-ID: <4372681.LvFx2qVVIh@eto.sf-tec.de>
In-Reply-To: <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net>
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de> <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2226354.ElGaqSPkdT"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2226354.ElGaqSPkdT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 26. Dezember 2021, 18:22:12 CET schrieb John David Anglin:
> On 2021-12-26 11:21 a.m., Rolf Eike Beer wrote:
> > [139181.966881] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613
> > rcu_eqs_enter.constprop.0+0x8c/0x98
> This is probably not reproducible. You might try this change from Sven

> I haven't found 5.15.11 to be stable.

When I was running 5.15.0 I had uptimes of 21 and 29 days before crashes, and 
then 5 days before I rebooted into 5.15.11 to test that.

With 5.15.11 my longest uptime was 5 days.

I have switched to 5.15.4 afterwards, which is now already up for 2 weeks. I 
see regular userspace crashes with that, usually gcc or ld as the machine is 
mainly building things, which seems to happen way more often than it has 
happened with 5.15.0 for me.

So much for the moment.
--nextPart2226354.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYe1BsgAKCRBcpIk+abn8
TpL2AJwJmPgqtHod7X8SVnhbNxw6FhEE+gCfcw3W8uSZSAshCWwfUVLIdGKg48Q=
=3lyE
-----END PGP SIGNATURE-----

--nextPart2226354.ElGaqSPkdT--




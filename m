Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52E2C2A6CD
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 21:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfEYTrM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 15:47:12 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:60749 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbfEYTrM (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 15:47:12 -0400
Received: (qmail 15161 invoked from network); 25 May 2019 19:46:44 -0000
Received: from dslb-178-011-219-221.178.011.pools.vodafone-ip.de ([::ffff:178.11.219.221]:48732 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sat, 25 May 2019 21:46:44 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: HPPA problems with the PCI
Date:   Sat, 25 May 2019 21:46:57 +0200
Message-ID: <3718087.X2R3MUVaEu@daneel.sf-tec.de>
In-Reply-To: <CA+QBN9AMfD_uB2+9HaOy8-NcHOwttNiLWA-DZWnRrfZkeyzeZg@mail.gmail.com>
References: <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com> <1a4a708b-09a0-cb46-1491-554df106967a@gmx.de> <CA+QBN9AMfD_uB2+9HaOy8-NcHOwttNiLWA-DZWnRrfZkeyzeZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2098994.xfn6LVfIqv"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2098994.xfn6LVfIqv
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Carlo Pisani wrote:
> > Carlo & Sven, do you run 32- or 64-bit kernel?
> 
> 8Gbyte of ram, I am on 64-bit kernel.

What have you done with the 2GB that were in the machine before? And what 
should have happen to them?

> > Maybe the 32-bit PDC does not return the NP (iopdir_fdc) while the 64-bit
> > PDC does? Otherwise we maybe should only trust this bit, if it's a
> > "PA8700 (PCX-W2)" or higher CPU ?
> Good question. I do not know. But, maybe it's related to the firmware?
> C3750 seems to have an updated one.

I have a C3600 with only 1GB of RAM, and my /proc/cpuinfo is exactly the same. 
So at least what is in that output does not depend on the kernel bitsize.

Eike
--nextPart2098994.xfn6LVfIqv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXOmbsgAKCRBcpIk+abn8
TjhYAJ9mnssaOwpTW/hX9FjtlQPtaOiurwCdFYkQP4qAPHXhn6XWzKyTW5FVMnE=
=fcAo
-----END PGP SIGNATURE-----

--nextPart2098994.xfn6LVfIqv--




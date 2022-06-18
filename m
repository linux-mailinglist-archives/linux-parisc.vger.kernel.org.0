Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC784550645
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Jun 2022 19:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236755AbiFRRJB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 18 Jun 2022 13:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236999AbiFRRJB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Jun 2022 13:09:01 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B537513DCE
        for <linux-parisc@vger.kernel.org>; Sat, 18 Jun 2022 10:08:58 -0700 (PDT)
Received: (qmail 22599 invoked from network); 18 Jun 2022 17:08:30 -0000
Received: from dyn.ipv6.net-htp.de ([2a02:560:5617:1b00:ee9d:72e0:dc98:f7e7]:38320 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sat, 18 Jun 2022 19:08:30 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH] parisc: Fix flush_anon_page on PA8800/PA8900
Date:   Sat, 18 Jun 2022 19:08:43 +0200
Message-ID: <12000710.O9o76ZdvQC@daneel.sf-tec.de>
In-Reply-To: <Yq3r2qO//NzJGVlO@mx3210.localdomain>
References: <Yq3r2qO//NzJGVlO@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5578127.DvuYhMxLoT"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart5578127.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: Fix flush_anon_page on PA8800/PA8900
Date: Sat, 18 Jun 2022 19:08:43 +0200
Message-ID: <12000710.O9o76ZdvQC@daneel.sf-tec.de>
In-Reply-To: <Yq3r2qO//NzJGVlO@mx3210.localdomain>
References: <Yq3r2qO//NzJGVlO@mx3210.localdomain>

Am Samstag, 18. Juni 2022, 17:14:34 CEST schrieb John David Anglin:
> Anonymous pages are allocated with the shared mappings colouring,
> SHM_COLOUR. Since the alias boundary on machines with PA8800 and
> PA8900 processors is unknown, flush_user_cache_page() might not
> flush all mappings of a shared anonymous page. Flushing the whole
> data cache flushes all mappings.
> 
> This won't fix all coherency issues with shared mappings but it
> seems to work well in practice.  I haven't seen any random memory
> faults in almost a month on a rp3440 running as a debian buildd
> machine.
> 
> There is a small preformance hit.

Is there a limit we can limit this to the given CPU types? And given that this 
seems to be a best effort workaround I would suggest adding a comment in the 
code as explaining why this happens, otherwise someone looking at the code in 
3 years may not get the point of it and a quick test will just show "oh, it 
works without that".

Eike
--nextPart5578127.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYq4GmwAKCRBcpIk+abn8
ThoEAJ4wuzx9Xja/Dlt8hIi5UZF68Kf+xQCeNwvxBPycIUTihm08KAqFHLtGMD4=
=2Dou
-----END PGP SIGNATURE-----

--nextPart5578127.DvuYhMxLoT--




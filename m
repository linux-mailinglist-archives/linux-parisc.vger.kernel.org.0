Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34EF72CD8F
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 19:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfE1RYh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 13:24:37 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:51517 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbfE1RYh (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 13:24:37 -0400
Received: (qmail 31837 invoked from network); 28 May 2019 17:24:00 -0000
Received: from dslb-092-076-161-009.092.076.pools.vodafone-ip.de ([::ffff:92.76.161.9]:50432 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <dave.anglin@bell.net>; Tue, 28 May 2019 19:24:00 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
        Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP iopdir_fdc bit
Date:   Tue, 28 May 2019 19:24:29 +0200
Message-ID: <1943613.tnj53yOHQY@daneel.sf-tec.de>
In-Reply-To: <674f8b61-e897-f657-68a2-648babca00be@bell.net>
References: <20190527192000.GA17551@ls3530.dellerweb.de> <20190528153815.GB16860@t470p.stackframe.org> <674f8b61-e897-f657-68a2-648babca00be@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4644551.2ANk47IAMf"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart4644551.2ANk47IAMf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 28. Mai 2019, 19:06:48 CEST schrieb John David Anglin:
> On 2019-05-28 11:38 a.m., Sven Schnelle wrote:
> > Interesting. Now that you mention it i see that my C3750 reports the same.
> > Google returned the following page
> > https://support.hpe.com/hpsc/swd/public/detail?swItemId=PF_CCJ70020
> > 
> > Which is 2.0, and only mentions "C3650/C3700/C3750/J6700/J6750 firmware"
> > So maybe these machines have NP set, and machines "below" (like C3600)
> > don't have it set.
> > 
> > I wonder what happens if you try to flash a 5.0 firmware to such a box.
> 
> From what I see, the "C3650/C3700/C3750/J6700/J6750" and "HP 9000 Model
> B1000/C3000/J5000/J7000" use different firmware.

Which makes sense as the former have use a 8600 CPU, while the latter have 
8700 ones.

Eike

--nextPart4644551.2ANk47IAMf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXO1uzQAKCRBcpIk+abn8
TgvRAJ9NMm0+K56n0Uq5JhWowF1WEz97jgCdFFswsjKUyI6J/KVWyXXb5Sz7GqQ=
=JS50
-----END PGP SIGNATURE-----

--nextPart4644551.2ANk47IAMf--




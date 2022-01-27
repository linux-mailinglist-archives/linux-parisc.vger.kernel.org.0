Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850A449E776
	for <lists+linux-parisc@lfdr.de>; Thu, 27 Jan 2022 17:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238443AbiA0Q0d (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 27 Jan 2022 11:26:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiA0Q0c (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 27 Jan 2022 11:26:32 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A8BC061714
        for <linux-parisc@vger.kernel.org>; Thu, 27 Jan 2022 08:26:31 -0800 (PST)
Received: (qmail 1988 invoked from network); 27 Jan 2022 16:25:14 -0000
Received: from p200300cf0710410038a5bdfffef1938d.dip0.t-ipconnect.de ([2003:cf:710:4100:38a5:bdff:fef1:938d]:47774 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <deller@gmx.de>; Thu, 27 Jan 2022 17:25:14 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
Cc:     Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH] parisc: Fix data TLB miss in sba_unmap_sg
Date:   Thu, 27 Jan 2022 17:26:24 +0100
Message-ID: <2812072.e9J7NaK4W3@eto.sf-tec.de>
In-Reply-To: <9cec8558-1b49-5f78-6424-2dd7daa408b7@bell.net>
References: <YfGxafKxQdw8GhMc@mx3210.localdomain> <09ccdfeb-f76b-41c8-a461-549314463f77@gmx.de> <9cec8558-1b49-5f78-6424-2dd7daa408b7@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3151096.aeNJFYEL58"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart3151096.aeNJFYEL58
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 27. Januar 2022, 17:16:35 CET schrieb John David Anglin:
> On 2022-01-27 1:58 a.m., Helge Deller wrote:
> >>> diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
> >>> index e60690d38d67..374b9199878d 100644
> >>> --- a/drivers/parisc/sba_iommu.c
> >>> +++ b/drivers/parisc/sba_iommu.c
> >>> @@ -1047,7 +1047,7 @@ sba_unmap_sg(struct device *dev, struct
> >>> scatterlist
> >>> *sglist, int nents, spin_unlock_irqrestore(&ioc->res_lock, flags);
> >>> 
> >>>   #endif
> >>> 
> >>> -	while (sg_dma_len(sglist) && nents--) {
> >>> +	while (nents && sg_dma_len(sglist)) {
> >> 
> >> What about:
> >> 	for (; nents && sg_dma_len(sglist); nents--) {
> > 
> > The way how Dave wrote it is more clean, IMHO.
> 
> I'm going to leave the change to sba_iommu.c as proposed.  While i'm sure
> the suggested for statement would be fine, I looked at how gcc handled the
> while loop.  It is quite subtle. Except for an initial test and decrement,
> the iteration of nents is replaced by a calculation of the the final value
> for sglist.
> 
> Regarding the newline, the file has several places where newlines precede
> #ifdef statements. I think the current style is okay and checkpatch.pl
> doesn't object to that format.

It was not about the #ifdef, it was the line immediately following the opening 
brace of the loop.

Eike
--nextPart3151096.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYfLHsAAKCRBcpIk+abn8
Tq4DAJ0UAZm8QMpzvMzVhQ0w8Hbud2N3vQCffpzJCxIIuil9W9zrLBJaSOtNi+A=
=0S/e
-----END PGP SIGNATURE-----

--nextPart3151096.aeNJFYEL58--




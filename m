Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C53C49DB3D
	for <lists+linux-parisc@lfdr.de>; Thu, 27 Jan 2022 08:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237110AbiA0HMS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 27 Jan 2022 02:12:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiA0HMR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 27 Jan 2022 02:12:17 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F42FC061714
        for <linux-parisc@vger.kernel.org>; Wed, 26 Jan 2022 23:12:17 -0800 (PST)
Received: (qmail 13192 invoked from network); 27 Jan 2022 07:11:01 -0000
Received: from p200300cf0710410038a5bdfffef1938d.dip0.t-ipconnect.de ([2003:cf:710:4100:38a5:bdff:fef1:938d]:47748 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Thu, 27 Jan 2022 08:11:01 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>
Cc:     Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH] parisc: Fix data TLB miss in sba_unmap_sg
Date:   Thu, 27 Jan 2022 08:12:10 +0100
Message-ID: <1806817.tdWV9SEqCh@eto.sf-tec.de>
In-Reply-To: <09ccdfeb-f76b-41c8-a461-549314463f77@gmx.de>
References: <YfGxafKxQdw8GhMc@mx3210.localdomain> <11910725.O9o76ZdvQC@eto.sf-tec.de> <09ccdfeb-f76b-41c8-a461-549314463f77@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2091025.irdbgypaU6"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2091025.irdbgypaU6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 27. Januar 2022, 07:58:19 CET schrieb Helge Deller:
> On 1/27/22 07:22, Rolf Eike Beer wrote:
> > Am Mittwoch, 26. Januar 2022, 21:39:05 CET schrieb John David Anglin:

> >> The bug is caused by overrunning the sglist and incorrectly testing
> >> sg_dma_len(sglist) before nents. Normally this doesn't cause a crash,
> >> but in this case sglist crossed a page boundary. This occurs in the
> >> 
> >> following code:
> >> 	while (sg_dma_len(sglist) && nents--) {
> >> 
> >> The fix is simply to test nents first and move the decrement of nents
> >> into the loop.
> >> 
> >> Reported-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
> >> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> >> ---
> >> 
> >> diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
> >> index e60690d38d67..374b9199878d 100644
> >> --- a/drivers/parisc/sba_iommu.c
> >> +++ b/drivers/parisc/sba_iommu.c
> >> @@ -1047,7 +1047,7 @@ sba_unmap_sg(struct device *dev, struct scatterlist
> >> *sglist, int nents, spin_unlock_irqrestore(&ioc->res_lock, flags);
> >> 
> >>  #endif
> >> 
> >> -	while (sg_dma_len(sglist) && nents--) {
> >> +	while (nents && sg_dma_len(sglist)) {
> > 
> > What about:
> > 	for (; nents && sg_dma_len(sglist); nents--) {
> 
> The way how Dave wrote it is more clean, IMHO.

YMMV :P

> By the way, since you ran into this issue, did you tested it,
> if it really solves the problem you see?
> If so, do you want to add a Tested-by: tag ?

No, I'm glad the machine is up and only crashing userspace processes atm. I 
can't remember seeing this before, so I guess it was pure luck.

Eike
--nextPart2091025.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYfJFygAKCRBcpIk+abn8
TjhcAJ0dTqc84hgZN69tLfWQsbF+skic7QCfZt83eMLzLOXLzOAWmtI/mQM38EU=
=XMkQ
-----END PGP SIGNATURE-----

--nextPart2091025.irdbgypaU6--




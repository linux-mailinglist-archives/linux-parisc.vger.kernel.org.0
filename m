Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC9A70182C
	for <lists+linux-parisc@lfdr.de>; Sat, 13 May 2023 18:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjEMQYP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 13 May 2023 12:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjEMQYO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 May 2023 12:24:14 -0400
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E03E2689
        for <linux-parisc@vger.kernel.org>; Sat, 13 May 2023 09:24:13 -0700 (PDT)
Date:   Sat, 13 May 2023 18:24:10 +0200
From:   Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, David Hildenbrand <david@redhat.com>
Subject: Re: Regression with kernel 6.3 "kernel BUG at
 include/linux/swapops.h:472!"
Message-ID: <1683994966@msgid.manchmal.in-ulm.de>
References: <1683740497@msgid.manchmal.in-ulm.de>
 <8889a75f-1a81-905e-8bc4-a733de32985f@gmx.de>
 <1683825030@msgid.manchmal.in-ulm.de>
 <85aef102-8407-68c7-2dc2-87e5a866906b@gmx.de>
 <1683928214@msgid.manchmal.in-ulm.de>
 <ZF9+OYqQS/vy7Oq5@p100>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QIYgpTqHFcJVbM9I"
Content-Disposition: inline
In-Reply-To: <ZF9+OYqQS/vy7Oq5@p100>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--QIYgpTqHFcJVbM9I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Helge Deller wrote...

> Thanks for bisecting and coming up with a testcase!

Well, thanks for all the advice, and the switft responses as well.

> Could you try the patch below?

Can confirm: Works very well here.

    Christoph

--QIYgpTqHFcJVbM9I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWXMI+726A12MfJXdxCxY61kUkv0FAmRfuacACgkQxCxY61kU
kv0izBAAnJB0teiFSZjNnP7gUNWgYIVQD1XglSVAigaC7nuQeY9uT6LqK+ktSIbY
Gb94ej8OMRkFqfaTHYPN7Zru6RdFjYOsczoL1wTvv9U4uXP2OxrcTjM+SBSkNEP5
1w2R5+jgK1Psr5ZN1/jFp08+InPAsQ3UTag7csTRP2pFBZiVSuHWiC3EHkMYnFc4
NcXs+WM1ss3Fu2cNMUWYktYSDA4ULL+vB6fl0stCNal2cRs6AHs9znTkzhS0CmAN
9e9FySG14pfO+hKtazSd6mV3K/n4dUe99wO6s67W27YnCExIOPOEfK4FVmutt+JD
5FRa23r0wilIQMVtyEHR4fW4w6QeCHNq9DL/0u/r/BjZlrtqULSXmSFNAk5feWTT
6wRDfLo1WCOds0ysxxrJesaeEtT1gIXVoMvuVg/xXxt+DvcafcKhf7rzipZ3LuIs
6jt6kQmE0nfJERjHixOxQRb0j6X/eyJoYN6GO4rXSBzsX2VhhtY91FV44F3bpY56
OkbbSQPv577tVAKj6267px4dDJHIvIpV31o6dvgxOLruaVlxlrkxdJoGTAHEeAV1
Jz88l1Q8Q+9eY8UZp5q74zIRY87XtoFTVJ6B8vsW0Q6PD9cb3asVAaRCoKgPRRYA
b6x2tMJU+cT7AGM+m3b9D44tGlvsWgg6IICJ75DLNN7elqb710Q=
=70Nc
-----END PGP SIGNATURE-----

--QIYgpTqHFcJVbM9I--

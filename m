Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9814A771677
	for <lists+linux-parisc@lfdr.de>; Sun,  6 Aug 2023 21:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjHFTVb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 6 Aug 2023 15:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHFTVa (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 6 Aug 2023 15:21:30 -0400
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7EB01712
        for <linux-parisc@vger.kernel.org>; Sun,  6 Aug 2023 12:21:28 -0700 (PDT)
Date:   Sun, 6 Aug 2023 21:21:23 +0200
From:   Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To:     Mike Rapoport <rppt@kernel.org>, linux-parisc@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: Regression with kernel 6.4 "swapper: page allocation failure:
 order:0, mode:0x100(__GFP_ZERO)
Message-ID: <1691349294@msgid.manchmal.in-ulm.de>
References: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
 <ZMooZAKcm8OtKIfx@kernel.org>
 <1691003952@msgid.manchmal.in-ulm.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QxRs3x1Ac4siP+PP"
Content-Disposition: inline
In-Reply-To: <1691003952@msgid.manchmal.in-ulm.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--QxRs3x1Ac4siP+PP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Christoph Biedl wrote...

> Mike Rapoport wrote...
>=20
> > Can you check if the patch helps:
> >=20
> > diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
> > index cc15d737fda6..ae3493dae9dc 100644
> (...)
>=20
> Yes, everything's fine now. Applied on top of v6.5-rc4, there
> were some offsets.

Now confirmed on top of 6.4.8 as well.

However, there's now an issue when reconfiguring the locales package in
Debian:

    Setting up locales (2.37-7) ...
    Generating locales (this might take a while)...
      C.UTF-8...cannot map archive header: Invalid argument
     done

Using 6.3.13, everything is fine.

There a Debian bug report #552233 from very old ages about this, the
solution suggests this is related to memory management so it might apply
here, too.

Unfortunately, I'll very *very* limited time to test things in the next
weeks.

    Christoph

=C2=B9 https://bugs.debian.org/552233

--QxRs3x1Ac4siP+PP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWXMI+726A12MfJXdxCxY61kUkv0FAmTP8rAACgkQxCxY61kU
kv3Mxw/9E1QaYaa18OMHqVwKfPkGX1cBOZWdmAI07z5BDDC3la5RJKGGzmrkMX6Q
xaM5i+z7X6L0FKCkqwLnyi28fJnVZ2kQaEox/0WzLMuiaBmqhQ0+4Ul8835t9GLc
qV0uM07+BSv4XbiKldVF4UJ90EqKfrojEJQR239AqdpwKaZpwjYBDuvoS5OlzWMM
M0+4BGCbC+k4b11QX4c4G4fWcVZoz8sZK2hU89vmislT3+GPD/3xvrPUiPoF3riw
dPB7Bin8cwTSP9nuhKDgdZoIHitGA9mlJa8OPI75tiUrKqUln0qjqIqNiT9Kj9Ti
g2ViSGnLkI1k0qmAFaLGQYN+Q9tFC1DS+pbo8Rdg81rbMMkWcrp+0vAqvgnjw3VT
XwzK33wTV7U12MBwSlf7XOjWDt2/R011Ol6lJMt+yHG7UZHrd7KFD1iIMiQiX1aD
OVhFKwjufKtOLKD4SPv4Nkji6yyKMKcvC0T/bVY368GblSQhWRDM0HzQGiWlg5nY
o3tJBTTnYcK14gnKnes1dxcEX4aVPYJ6KeP+kBbKOHWW6K78+oEK3fIvQaCZM11Q
NeEjrpRJvYpB5wNH4GpSzwpcrkgS0tri6DHGgsH9RDvqsUFB4KgFkcHvAQQ5jMh9
77lvbIZnOK4O4p3RUGoSjA96iJVA033a0DezR5s9/tOAvJrTvtU=
=eHD7
-----END PGP SIGNATURE-----

--QxRs3x1Ac4siP+PP--

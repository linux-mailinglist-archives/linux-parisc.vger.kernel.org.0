Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72CEE76D79D
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Aug 2023 21:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbjHBTUl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 2 Aug 2023 15:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjHBTUk (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 2 Aug 2023 15:20:40 -0400
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3811B6
        for <linux-parisc@vger.kernel.org>; Wed,  2 Aug 2023 12:20:38 -0700 (PDT)
Date:   Wed, 2 Aug 2023 21:20:35 +0200
From:   Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-parisc@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: Regression with kernel 6.4 "swapper: page allocation failure:
 order:0, mode:0x100(__GFP_ZERO)
Message-ID: <1691003952@msgid.manchmal.in-ulm.de>
References: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
 <ZMooZAKcm8OtKIfx@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eHn4uyPvGLYZTyHi"
Content-Disposition: inline
In-Reply-To: <ZMooZAKcm8OtKIfx@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--eHn4uyPvGLYZTyHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Mike Rapoport wrote...

> Can you check if the patch helps:
>=20
> diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
> index cc15d737fda6..ae3493dae9dc 100644
(...)

Yes, everything's fine now. Applied on top of v6.5-rc4, there
were some offsets.

    Christoph

--eHn4uyPvGLYZTyHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWXMI+726A12MfJXdxCxY61kUkv0FAmTKrIAACgkQxCxY61kU
kv1HUxAAz+9ft7Yx1qcsHarYh8T+UkEzl2gI2Cs5sm4tMJGKUkbUhQ1+yoevfq0R
FLVe7m6HzfRGlDxW/rM3+DYkXbE5VI4wGNZ3ZLDu3+XOgQEwsS+cABNSJ856gTTI
qRMau63juqV6dJzhsv2JAVsLO5hGx4aAF1V3I6+ikS8nct9K1R3rZd2IxmCWrYPX
v6S6Mfg8+jjM84UqcdVQElb/Pv1a5Ph3/JZ+/THErQ7TKh/6LcSz8kwhOaTa3Z92
iLFUSxfLqEspRCJlLGgc2qVBZavk3wWElA2gfEz1cVRcOkHLXd1+gEG/C9i8A52p
qh3OtJefc7Wi7ju10A1p0ctVyDgtx0xNXO4sgzjpiexg9cH6LcATPtJQzYiyaR+r
AKIQ0IHeqjdVBMJMxgsJkkSEdXutr5MrRbEGHrMyhIF6+IbIFLW8veYhXDpGupNc
crf2jQe8ZLKpcFJqRx8hk95IRpjTksZ2DZQxfST0mGs7zowP9Z6H1Hn7/qkFJOhh
bW5b6OckSdYGRipdeTfTGQhnGo7eoM1nGayTdTnxXACvpl3G+kK2LuWt0epfOqf7
xlYmMQ90T61WGjqqOnoVhAl7dHX/awHQzcyfIfoW+fT5wuvOi0fVFfgMDfdyFDdW
MRlPnV9lGfoAYeVcSRUkLTUh2W43UesRMxLYP3yHptBMtEBEWGk=
=ftWI
-----END PGP SIGNATURE-----

--eHn4uyPvGLYZTyHi--

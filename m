Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02DF56FF852
	for <lists+linux-parisc@lfdr.de>; Thu, 11 May 2023 19:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238865AbjEKRWh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 11 May 2023 13:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238459AbjEKRWg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 May 2023 13:22:36 -0400
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46596188
        for <linux-parisc@vger.kernel.org>; Thu, 11 May 2023 10:22:11 -0700 (PDT)
Date:   Thu, 11 May 2023 19:22:08 +0200
From:   Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: Regression with kernel 6.3 "kernel BUG at
 include/linux/swapops.h:472!"
Message-ID: <1683825030@msgid.manchmal.in-ulm.de>
References: <1683740497@msgid.manchmal.in-ulm.de>
 <8889a75f-1a81-905e-8bc4-a733de32985f@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vSsAMgRNL5A/QJBa"
Content-Disposition: inline
In-Reply-To: <8889a75f-1a81-905e-8bc4-a733de32985f@gmx.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--vSsAMgRNL5A/QJBa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Helge Deller wrote...

> I haven't used kernel 6.3 much yet, but the kernel BUG below seems
> to be triggered by CONFIG_MIGRATION.
> You could try to disable that config option first to verify if
> it fixes your crash.
> This might help to narrow down the problem....

Looks good, still have a running system after 45 minutes, never got that
far with the initial kernel configuration.

In the meantime I realized only some 16 commits between v6.2 and v6.3
affect arch/parisc. Do you think it's worth check right around those?
Also, if you can think of a way to trigger the crashes, that would ease
the testing a lot.

Regards,

    Christoph

--vSsAMgRNL5A/QJBa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWXMI+726A12MfJXdxCxY61kUkv0FAmRdJD0ACgkQxCxY61kU
kv13ew//RNHYjWjamS6Romf11mhxNkE98u4Qbtp+obenvK3F9j+rqbetjA03HDig
cTXaiijZ3DY4YNK6cP8rld0CWhjNSbh1489XdJzbtemiwRjz/Ax9gzmx0Ozc+Ero
DE/lqnhjMiqlBHSTesDmfFE0FohN8/MasLO3qvXf6HmEHy5Rp2QxF4QZhvN7cM7M
9FAs9Lg3to5HX3zZxDreZ67/LOBjUVf0qKwYE0TvQ6hyl37asueMo5x3/Ycw4C7S
N/KKyVDpxsi+FYgArfBk6eolF6Y61nVVF/ZrF7hoVrdtDvlA+OQxrKq/zkXgV+BK
CbKJgBYimVUI5EfasLYU1M0ex2WnqEsXEOIQdrYFaGHCHQxXuUngBZmeA78/TDo3
iOghpYZagyc6EitNJquPSUig+rDoX5BiVznvTshsOvOFmzyf0Oq68h3on8mDk7Zw
LA5EfpHY8H0hHsqyY1c4DQU/9nTCB3SxtdtXxqkE2RwT5S2nIfJ73RYqeJA9ZSQ5
fjoaa4QK8ErXuhI8HS42sNUqijx0aRv3rHvRaqhIth1sn0A0z1XDi//CV9CtyEH1
Tt87GPxUvjYAo5Sk3l/lMHnikcG6zXhwGp+j2Ji6GjE7behP/jItCir1yVSkYL+o
gznRskfNXZfDPdzl+KMC4MlxqYzgybH8kkv134kSItkSWdZL8Fw=
=5h41
-----END PGP SIGNATURE-----

--vSsAMgRNL5A/QJBa--

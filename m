Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69195529360
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 00:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236251AbiEPWJg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 May 2022 18:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238227AbiEPWJg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 May 2022 18:09:36 -0400
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE613FD93
        for <linux-parisc@vger.kernel.org>; Mon, 16 May 2022 15:09:34 -0700 (PDT)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_63173D25-290B-4F09-B2B1-C9A8676B5F52";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
From:   Sam James <sam@gentoo.org>
In-Reply-To: <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
Date:   Mon, 16 May 2022 23:09:26 +0100
Cc:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Message-Id: <0E5A13A5-8210-4E86-A8D1-4B056062BAF9@gentoo.org>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <5568470.DvuYhMxLoT@daneel.sf-tec.de>
 <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
To:     Helge Deller <deller@gmx.de>
X-Mailer: Apple Mail (2.3696.100.31)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Apple-Mail=_63173D25-290B-4F09-B2B1-C9A8676B5F52
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On 16 May 2022, at 22:49, Helge Deller <deller@gmx.de> wrote:
>=20
> [snip]
Hi Helge,

> FWIW, I've done some cleanups to this patch and committed it to my =
for-next tree.
> In case it's split up, please use the revised version.
>=20

Should I be testing with for-next (which contains this patch) or =
for-next-next (which has some smaller bits)?

best,
sam

> Helge


--Apple-Mail=_63173D25-290B-4F09-B2B1-C9A8676B5F52
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYOpPv/uDUzOcqtTy9JIoEO6gSDsFAmKCy5ZfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYw
RUE0RkJGRkI4MzUzMzM5Q0FBRDRGMkY0OTIyODEwRUVBMDQ4M0IACgkQ9JIoEO6g
SDtgRwgAmmkwGM/N2AJO6a4pLaRxGXlprNlGfSkE98kCaHe3w6A/OIxMDh7+6JvP
/ehoHWjEAN8iZD4xo8nH83Y6AG0ID5ML7KOUbQOv5KnzRrGu9bxC1k1FEDak8hUp
A3WhMhAFLjqU1dS3A/N4RXBK3rHwk4BObY+3jIUB1EbaVKrT8WOJw/Fptc+rhk9f
Wc1G7ew8vzSEIaAzwx0yN5SHsbt3u7umVa7xRAOsytybl10qFXkVaACFJDNtBgWm
KU8eCC7N3AtTCy21OH+ylxKphByLlXy3LPY0aD+eUjPW3sjKAg8tDdih3s+Dw1Op
X23WOo5Fz41kUgS8/NI0JvaTd7GQXw==
=D2+S
-----END PGP SIGNATURE-----

--Apple-Mail=_63173D25-290B-4F09-B2B1-C9A8676B5F52--

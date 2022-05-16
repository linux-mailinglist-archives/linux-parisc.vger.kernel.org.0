Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E4C5293DD
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 00:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233809AbiEPWy4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 May 2022 18:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349806AbiEPWyz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 May 2022 18:54:55 -0400
X-Greylist: delayed 2722 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 16 May 2022 15:54:55 PDT
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF2B419AE
        for <linux-parisc@vger.kernel.org>; Mon, 16 May 2022 15:54:55 -0700 (PDT)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_D2F55E12-0882-4041-BC45-6AF20112F08F";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
From:   Sam James <sam@gentoo.org>
In-Reply-To: <2df8c4f1-f93d-8ef0-3bfd-9249d43953fc@gmx.de>
Date:   Mon, 16 May 2022 23:54:44 +0100
Cc:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Message-Id: <F63F43FC-D3BA-4477-B4F0-B4BCABA61878@gentoo.org>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <5568470.DvuYhMxLoT@daneel.sf-tec.de>
 <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
 <0E5A13A5-8210-4E86-A8D1-4B056062BAF9@gentoo.org>
 <2df8c4f1-f93d-8ef0-3bfd-9249d43953fc@gmx.de>
To:     Helge Deller <deller@gmx.de>
X-Mailer: Apple Mail (2.3696.100.31)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Apple-Mail=_D2F55E12-0882-4041-BC45-6AF20112F08F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 16 May 2022, at 23:24, Helge Deller <deller@gmx.de> wrote:
>=20
> On 5/17/22 00:09, Sam James wrote:
>>> On 16 May 2022, at 22:49, Helge Deller <deller@gmx.de> wrote:
>>>=20
>>> [snip]
>> Hi Helge,
>>=20
>>> FWIW, I've done some cleanups to this patch and committed it to my =
for-next tree.
>>> In case it's split up, please use the revised version.
>>>=20
>>=20
>> Should I be testing with for-next (which contains this patch) or =
for-next-next (which has some smaller bits)?
>=20
> for-next is for v5.18.
>=20
> for-next-next is planed to for v5.19
>=20
> so, please use for-next, since we want to get 5.18 finally fixed.
>=20

Got it, thanks to both you and Dave!

I'll be testing it on RP3440 (PA8800) and C8000 (PA8900). If you need =
it, I can test on C3600 (PA8600) too.

Best,
sam

> Thanks!
> Helge


--Apple-Mail=_D2F55E12-0882-4041-BC45-6AF20112F08F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYOpPv/uDUzOcqtTy9JIoEO6gSDsFAmKC1jRfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYw
RUE0RkJGRkI4MzUzMzM5Q0FBRDRGMkY0OTIyODEwRUVBMDQ4M0IACgkQ9JIoEO6g
SDug7Af9HRnzhPkf3qCd7rOnWKHiY3Wzoc0Q6n3hzXQGum093g/yP3ypwg9SKigG
gIqLToWzxgyWrKLJnTVSoJb6tWkGVO7cIQxivwKz8DGpIju85yKF8cux3M2Vtykg
+poPyQdQI0XVUYkGr60cgVuPgOFVIVIg6YrFSkMM2p537AMfvDesNq/f/Kxmimsj
FVD8q42W0ZeiKe4PuvScfP8ofxGsUpsWTPozciSLavAWQlSQguXC6ArYo6vXFKxg
RwBIa/ZFuH6927gzhGr5Fzou76RUdXl/pilUyzTijQIgf55L2qK/LnvkjH7nIu8K
awRV11ULrlphjz2nwmtLELFnrDUOWQ==
=XBz9
-----END PGP SIGNATURE-----

--Apple-Mail=_D2F55E12-0882-4041-BC45-6AF20112F08F--

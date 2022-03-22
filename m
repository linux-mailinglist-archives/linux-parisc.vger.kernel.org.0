Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25E9A4E47B2
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Mar 2022 21:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbiCVUpR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Mar 2022 16:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbiCVUpR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Mar 2022 16:45:17 -0400
Received: from smtp.gentoo.org (dev.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD8B6C913
        for <linux-parisc@vger.kernel.org>; Tue, 22 Mar 2022 13:43:49 -0700 (PDT)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_D494EB0E-1A60-4E9C-9933-060DDD6AA675";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
From:   Sam James <sam@gentoo.org>
In-Reply-To: <f7a714d9-b620-5100-a0e7-51360419eeda@bell.net>
Date:   Tue, 22 Mar 2022 20:43:44 +0000
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
Message-Id: <17C0A3CF-01B8-4457-B040-8E96A10AE2DF@gentoo.org>
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <b84f1c67-eea7-f07a-0163-6e06b0f5f650@bell.net>
 <309C1399-6AA2-44BD-8EB9-FDB66F5D972E@gentoo.org>
 <73bf3336-9207-ba0e-1950-8cb1b7d6adc3@bell.net>
 <f7a714d9-b620-5100-a0e7-51360419eeda@bell.net>
To:     John David Anglin <dave.anglin@bell.net>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Apple-Mail=_D494EB0E-1A60-4E9C-9933-060DDD6AA675
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 22 Mar 2022, at 20:29, John David Anglin <dave.anglin@bell.net> =
wrote:
>=20
> On 2022-03-22 4:04 p.m., John David Anglin wrote:
>> On 2022-03-22 3:37 p.m., Sam James wrote:
>>> In our experience so far, there has been no good kernel version for =
us on this hardware.
>> What happens with the attached config?  My rp3440 runs okay with this =
config.
>>>=20
>>>> I've seen this before but it's not occurring in my current builds =
for rp3440 and c8000.  I've been running for-next
>>>> changes on c8000 for several weeks.
>>>>=20
>>> Yeah, I haven't seen this at all on my C8000 (or Gentoo's other HW, =
a C3600).
>> Architecturally, there is no difference between rp3440 and c8000 with =
respect to the cache and TLB.
>>=20

Ah, thanks, I didn't realise this.

>> As I said, the inequivalent alias are a memory mapping issue. This =
might vary depending on memory size.
>=20
> Config might make a difference as well.
>=20
> In order to debug, one needs to find the circumstances that cause it.
>=20

Understood & agreed. I'm going to try Helge's config w/ 5.10.x, then =
yours with 5.16.x, and try get some
more information on how to reproduce too. I'll report back.

Thanks for sharing your config. I can see how it might easily make a =
significant difference, especially
given it can even on x86/other more-popular platforms, let alone on =
PARISC where we can only test
far smaller combinations.

> Dave
>=20
> --
> John David Anglin  dave.anglin@bell.net
> <config-5.16.16+.gz>

Best,
sam

--Apple-Mail=_D494EB0E-1A60-4E9C-9933-060DDD6AA675
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYOpPv/uDUzOcqtTy9JIoEO6gSDsFAmI6NQBfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYw
RUE0RkJGRkI4MzUzMzM5Q0FBRDRGMkY0OTIyODEwRUVBMDQ4M0IACgkQ9JIoEO6g
SDswbAf+PWJaM0da7HedT3VxgpUmC/CpLQ4s6khVQ6BEeA9y3Dlyj0ZLnqcf5a3O
d6ZRYGN6GEqKDIJ2arxdwsvXGt/XylY45fai86sGtnIUeoM/nArdAG4hViGWcMAM
7sXxaVcID+1Ob/yCl2ERFjXERnNIcNhqbTEfcviqtGsQ0/oPca87ufAUOECZn+/E
h/WWhJnHfytUaQ6cBqaxp/2IBs92i4ewfYG9K1uLG6wX+copATLE2NUvM7vuZg+Z
v8Xc9IkZA+9KxcFcGQkNL9Hy9W+m+Xej4E898FuXK8DVcuQ3Fd7vYWUsTEh5eili
o2NYQAsreMxzVebeQh5vv4F7/hDLoQ==
=hRUV
-----END PGP SIGNATURE-----

--Apple-Mail=_D494EB0E-1A60-4E9C-9933-060DDD6AA675--

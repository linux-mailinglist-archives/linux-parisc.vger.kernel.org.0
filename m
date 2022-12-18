Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDE364FE21
	for <lists+linux-parisc@lfdr.de>; Sun, 18 Dec 2022 10:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiLRJOn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 18 Dec 2022 04:14:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLRJOm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 18 Dec 2022 04:14:42 -0500
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77ACBBC12
        for <linux-parisc@vger.kernel.org>; Sun, 18 Dec 2022 01:14:40 -0800 (PST)
From:   Sam James <sam@gentoo.org>
Content-Type: multipart/signed;
        boundary="Apple-Mail=_D6368855-D0C2-4256-804E-A53DE5B87066";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Way to kill processes with unaligned access?
Message-Id: <F60E5BD6-DC45-4810-8B40-EBB41E3EB109@gentoo.org>
Date:   Sun, 18 Dec 2022 09:14:23 +0000
To:     linux-parisc@vger.kernel.org
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Apple-Mail=_D6368855-D0C2-4256-804E-A53DE5B87066
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all,

I'm wondering if there's a way to configure the kernel such that
it kills processes when an unaligned access occurs.

I often get messages like:
```
[18531.277742] conftest(4066): unaligned access to 0xf7fa1715 at ip =
0x426cb787 (iir 0xf801094)
[18531.487681] conftest(4066): unaligned access to 0xf7fa1716 at ip =
0x426cb793 (iir 0xf80109c)
```

I know what they are, but it's a real pain to figure out *which* =
configure test in a given
case is causing the problem. If there's some way to make the kernel kill =
such naughty processes,
it'd make it way easier for me to locate.

(Sometimes when I've built hundreds of packages, I have a lot of these I =
want to go investigate
after a week or two, but it's hard to track it down afterwards because =
of this.)

Any ideas?

Thanks!

--Apple-Mail=_D6368855-D0C2-4256-804E-A53DE5B87066
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iNUEARYKAH0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCY57Z8F8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MAAKCRBzhAn1IN+R
kPUdAQC4D4whcaHjDgoVQaWbSlGEJBSmBbftfBQlQXeDlsuTSAD/RuKXRlqQUugU
XLgN2dbPodtscxgymypaU8Qd6M/PbgE=
=1e6q
-----END PGP SIGNATURE-----

--Apple-Mail=_D6368855-D0C2-4256-804E-A53DE5B87066--

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B18730A24
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Jun 2023 00:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235550AbjFNWAI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 14 Jun 2023 18:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbjFNWAH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 14 Jun 2023 18:00:07 -0400
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [95.217.213.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41D8268F
        for <linux-parisc@vger.kernel.org>; Wed, 14 Jun 2023 15:00:05 -0700 (PDT)
Received: from [213.219.167.32] (helo=deadeye)
        by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ben@decadent.org.uk>)
        id 1q9YX5-0003Mk-3s; Thu, 15 Jun 2023 00:00:03 +0200
Received: from ben by deadeye with local (Exim 4.96)
        (envelope-from <ben@decadent.org.uk>)
        id 1q9YX4-005HRq-1z;
        Thu, 15 Jun 2023 00:00:02 +0200
Date:   Thu, 15 Jun 2023 00:00:02 +0200
From:   Ben Hutchings <ben@decadent.org.uk>
To:     "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Delete redundant register definitions in
 <asm/assembly.h>
Message-ID: <ZIo4Yg+XszzDZCy5@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7IITmSszEPoAQCJI"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 213.219.167.32
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--7IITmSszEPoAQCJI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Ben Hutchings <benh@debian.org>

We define sp and ipsw in <asm/asmregs.h> using ".reg", and when using
current binutils (snapshot 2.40.50.20230611) the definitions in
<asm/assembly.h> using "=3D" conflict with those:

arch/parisc/include/asm/assembly.h: Assembler messages:
arch/parisc/include/asm/assembly.h:93: Error: symbol `sp' is already defined
arch/parisc/include/asm/assembly.h:95: Error: symbol `ipsw' is already defi=
ned

Delete the duplicate definitions in <asm/assembly.h>.

Also delete the definition of gp, which isn't used anywhere.

Signed-off-by: Ben Hutchings <benh@debian.org>
---
 arch/parisc/include/asm/assembly.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/a=
ssembly.h
index 0f0d4a496fef..75677b526b2b 100644
--- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -90,10 +90,6 @@
 #include <asm/asmregs.h>
 #include <asm/psw.h>
=20
-	sp	=3D	30
-	gp	=3D	27
-	ipsw	=3D	22
-
 	/*
 	 * We provide two versions of each macro to convert from physical
 	 * to virtual and vice versa. The "_r1" versions take one argument

--7IITmSszEPoAQCJI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmSKOFwACgkQ57/I7JWG
EQnnGQ/9GZInlqGoNMYaLEsYasQTHEL7wBIteeAdvXfxH/Zf6ponVN/3fdOPIimZ
SryU9sq1xWalF9dLKgTHk6TpaUCfFtdBBCAglE7DVu8k3GxODbJ3MDVG85lhdgqu
YuxurOOojhf1ehKRbGruBozb9j9FQrPwO9QzzAuJ85CGR4RwLHpPCMl+EgXQfrvl
HXhfU5l1zgA7juuTHvN0iHGgJoWX/bMyxMAJdj/3A281sGbmdUCyTRF4DykgFOls
gITtajtKsvVWhpyoy4SJ7Y3Aoq0UAVO4eNGeujeq4PU9btvLWqujfFLtnT5TdRsM
YVtGimwbnQO62hvfyKvqwUBnLaIfBlUCS6CXfaEBqIOXNYnwMdIMqvFuHJXSFmfq
PfCXyY3IldB4ZQkFv6nC0kFvDGmASph452TmePHPmKUiesf1q3sgUcDEU1pHaagP
foa6w9wsIUrYHtSXkMBKwM3FphKkCRXWFsu8zpYVVBp9PcLcOr/yMXVETNDSKtbs
/B6+d46frBgsMdb5c0m4Ct/N4NX6Bg4Qb5MBxQze1vugSE6sLrPEAZg0N6/0APPa
HnKzZTo2I5e6x//rgqsbSgohb5YegOBTvVvuIzQcp6fIW8fK192o0iw4UsPitVZD
NYEPdBvLf4mHMRp432h4tCypF9LDsvsYOOS9yePHNZWvgg/4jF8=
=mpwc
-----END PGP SIGNATURE-----

--7IITmSszEPoAQCJI--

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E52B7CC844
	for <lists+linux-parisc@lfdr.de>; Tue, 17 Oct 2023 18:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235082AbjJQQBa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 Oct 2023 12:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbjJQQB3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 Oct 2023 12:01:29 -0400
Received: from dellerweb.de (dellerweb.de [173.249.48.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70C69E
        for <linux-parisc@vger.kernel.org>; Tue, 17 Oct 2023 09:01:25 -0700 (PDT)
Received: from mx3210.localdomain (unknown [142.126.114.79])
        by dellerweb.de (Postfix) with ESMTPSA id 672D116002C7;
        Tue, 17 Oct 2023 18:01:21 +0200 (CEST)
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 4529E22012C; Tue, 17 Oct 2023 16:01:09 +0000 (UTC)
Date:   Tue, 17 Oct 2023 16:01:08 +0000
From:   John David Anglin <dave@parisc-linux.org>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Add nop instructions after TLB inserts
Message-ID: <ZS6vxJ7ASP7B1pVN@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FodII4iIBgyytGuQ"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--FodII4iIBgyytGuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Helge wrote recently:
In some document I read that newer PA2.0 CPUs had a pipeline of up to 12
instructions (instead of 8?).

Could it be that we need to change our code to cope with that, e.g.
while switching to/from virt/phys mode, or enabling/disabling IRQs ?

Looking up the actual reference, I found this statement:
o The PA8800 violates the seven instruction pipeline rule when performing
  TLB inserts or PxTLBE instructions with the PSW C bit on. The instruction
  will take effect by the 12th instruction after the insert or purge.

While I don't believe we have an issue with the code mentioned by
Helge, I believe we have a problem with handling TLB misses. We don't
fill the pipeline following TLB inserts. As a result, we likely fault
again after returning from the interruption.

The above statement indicates that we need at least seven instructions
after the insert on pre PA8800 processors and we need 12 instructions
on PA8800/PA8900 processors.

Here we add macros and code to provide the required number of nop
instructions.

Tested on c8000.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 0e5ebfe8d9d2..3412e57dc7b4 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -437,6 +437,64 @@
 #endif
 	.endm
=20
+/*
+ * We need seven instructions after a TLB insert for it to take effect.
+ * The PA8800/PA8900 processors are an exception and need 12 instructions.
+ * The RFI changes both IAOQ_Back and IAOQ_Front, so it counts as one.
+ * We need these nops to avoid faulting again after the RFI.
+ */
+	.macro		ptl_unlock0_nops
+#ifndef CONFIG_TLB_PTLOCK
+	nop
+	nop
+#endif
+#ifdef CONFIG_64BIT
+	nop
+	nop
+	nop
+	nop
+	nop
+#endif
+	nop
+	nop
+	nop
+	nop
+	.endm
+
+	.macro		ptl_unlock1_nops
+#ifndef CONFIG_TLB_PTLOCK
+	nop
+	nop
+	nop
+#endif
+#ifdef CONFIG_64BIT
+	nop
+	nop
+	nop
+	nop
+	nop
+#endif
+	nop
+	nop
+	nop
+	.endm
+
+	.macro		nops
+#ifdef CONFIG_64BIT
+	nop
+	nop
+	nop
+	nop
+	nop
+#endif
+	nop
+	nop
+	nop
+	nop
+	nop
+	nop
+	.endm
+
 	/* Set the _PAGE_ACCESSED bit of the PTE.  Be clever and
 	 * don't needlessly dirty the cache line if it was already set */
 	.macro		update_accessed	ptp,pte,tmp,tmp1
@@ -1126,6 +1184,7 @@ dtlb_miss_20w:
 	idtlbt          pte,prot
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1134,6 +1193,7 @@ dtlb_check_alias_20w:
=20
 	idtlbt          pte,prot
=20
+	nops
 	rfir
 	nop
=20
@@ -1152,6 +1212,7 @@ nadtlb_miss_20w:
 	idtlbt          pte,prot
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1160,6 +1221,7 @@ nadtlb_check_alias_20w:
=20
 	idtlbt          pte,prot
=20
+	nops
 	rfir
 	nop
=20
@@ -1186,6 +1248,7 @@ dtlb_miss_11:
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1195,6 +1258,7 @@ dtlb_check_alias_11:
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
=20
+	nops
 	rfir
 	nop
=20
@@ -1219,6 +1283,7 @@ nadtlb_miss_11:
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1228,6 +1293,7 @@ nadtlb_check_alias_11:
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
=20
+	nops
 	rfir
 	nop
=20
@@ -1248,6 +1314,7 @@ dtlb_miss_20:
 	idtlbt          pte,prot
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1256,6 +1323,7 @@ dtlb_check_alias_20:
 =09
 	idtlbt          pte,prot
=20
+	nops
 	rfir
 	nop
=20
@@ -1276,6 +1344,7 @@ nadtlb_miss_20:
 	idtlbt		pte,prot
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1284,6 +1353,7 @@ nadtlb_check_alias_20:
=20
 	idtlbt          pte,prot
=20
+	nops
 	rfir
 	nop
=20
@@ -1321,6 +1391,7 @@ itlb_miss_20w:
 	iitlbt          pte,prot
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1345,6 +1416,7 @@ naitlb_miss_20w:
 	iitlbt          pte,prot
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1353,6 +1425,7 @@ naitlb_check_alias_20w:
=20
 	iitlbt		pte,prot
=20
+	nops
 	rfir
 	nop
=20
@@ -1379,6 +1452,7 @@ itlb_miss_11:
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1403,6 +1477,7 @@ naitlb_miss_11:
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1412,6 +1487,7 @@ naitlb_check_alias_11:
 	iitlba          pte,(%sr0, va)
 	iitlbp          prot,(%sr0, va)
=20
+	nops
 	rfir
 	nop
=20
@@ -1433,6 +1509,7 @@ itlb_miss_20:
 	iitlbt          pte,prot
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1453,6 +1530,7 @@ naitlb_miss_20:
 	iitlbt          pte,prot
=20
 	ptl_unlock1	spc,t0
+	ptl_unlock1_nops
 	rfir
 	nop
=20
@@ -1461,6 +1539,7 @@ naitlb_check_alias_20:
=20
 	iitlbt          pte,prot
=20
+	nops
 	rfir
 	nop
=20
@@ -1483,6 +1562,7 @@ dbit_trap_20w:
 	idtlbt          pte,prot
=20
 	ptl_unlock0	spc,t0
+	ptl_unlock0_nops
 	rfir
 	nop
 #else
@@ -1509,6 +1589,7 @@ dbit_trap_11:
 	mtsp            t1, %sr1     /* Restore sr1 */
=20
 	ptl_unlock0	spc,t0
+	ptl_unlock0_nops
 	rfir
 	nop
=20
@@ -1529,6 +1610,7 @@ dbit_trap_20:
 	idtlbt		pte,prot
=20
 	ptl_unlock0	spc,t0
+	ptl_unlock0_nops
 	rfir
 	nop
 #endif

--FodII4iIBgyytGuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmUur7oACgkQXb/Nrl8Z
TfHmKg/9HmF72ykKw2NWDXN4sPBwWXq9QQAsJuZ8KRUi4l+HYQ1g/6iYVzO1kMTY
Q1Y1l0m6gXNyAbFmH6vhdXsV/adELPomDb2PiBJK9fmTqf28N7+7JeZssuL3jYZO
bxrC49zVAMmjry06w3X9A4PQ3LBP1I2F9rO6E+PyGpaNQT66eyCSFgaR3JJW3+/7
33xdlhTOWaD1DQ6X8ze3z/hoUnRKscfXUHY3gGJz/jonhHA1cdjyBGpeOQOxWb0F
hdNJW6oqcwmqoV2U8+c26fwYTyoG3pTlBq/xyczPnQXh2j2TcXhI0umlDrjx/0xf
2mHW5CdAsBd6aM14B7dMmM1yyKkoWCaKD5P/W2NYnIKg4nTrxHE3vx+bmFvyd36i
vXrufCdkVye3gJDaVhikL9IXjeoQtA4Xrk3pxS766bt4VMG12kmbu5eFCf3h87UE
ybKmmk6qBqih6HiTIeKQSUIbDzLwpEiSxazJeJZoxA0gvPQXPIErosmXGqqlamuM
VEU/Ln+OZeTUcC1cycCiTKDzuQKwBPsJuSVAiUggOqxKboAH4SqRjX/nY4mKJh4f
o9vZkyj4/1mvhZKKrYHlhgD+urxEWXd9iujOWgLABLFN8GeZuirHYRW0lzDtznb1
nBMjiOvztOxEC+sTBwyswHov3/RSsDSBvezFxfhUVzr8isze/Uw=
=3jdC
-----END PGP SIGNATURE-----

--FodII4iIBgyytGuQ--

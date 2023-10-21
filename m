Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6E87D1F89
	for <lists+linux-parisc@lfdr.de>; Sat, 21 Oct 2023 22:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbjJUUcz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 21 Oct 2023 16:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjJUUcy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 21 Oct 2023 16:32:54 -0400
Received: from dellerweb.de (dellerweb.de [173.249.48.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDCAC9
        for <linux-parisc@vger.kernel.org>; Sat, 21 Oct 2023 13:32:51 -0700 (PDT)
Received: from mx3210.localdomain (unknown [142.126.114.79])
        by dellerweb.de (Postfix) with ESMTPSA id 3F32C1600195;
        Sat, 21 Oct 2023 22:32:46 +0200 (CEST)
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id ED43522011C; Sat, 21 Oct 2023 20:32:43 +0000 (UTC)
Date:   Sat, 21 Oct 2023 20:32:43 +0000
From:   John David Anglin <dave@parisc-linux.org>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v3] parisc: Add nop instructions after TLB inserts
Message-ID: <ZTQ1a22wN0BPulfE@mx3210.localdomain>
References: <ZTLnw6cIVbPovI5l@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wZbC24IxgILFtDcJ"
Content-Disposition: inline
In-Reply-To: <ZTLnw6cIVbPovI5l@mx3210.localdomain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--wZbC24IxgILFtDcJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Backport for v6.1.59.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 0e5ebfe8d9d2..4e4787a73b65 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -35,6 +35,24 @@
 	.level 2.0
 #endif
=20
+/*
+ * We need seven instructions after a TLB insert for it to take effect.
+ * The PA8800/PA8900 processors are an exception and need 12 instructions.
+ * The RFI changes both IAOQ_Back and IAOQ_Front, so it counts as one.
+ */
+#ifdef CONFIG_64BIT
+#define NUM_PIPELINE_INSNS    12
+#else
+#define NUM_PIPELINE_INSNS    7
+#endif
+
+	/* Insert num nops */
+	.macro	insert_nops num
+	.rept \num
+	nop
+	.endr
+	.endm
+
 	/* Get aligned page_table_lock address for this mm from cr28/tr4 */
 	.macro  get_ptl reg
 	mfctl	%cr28,\reg
@@ -414,26 +432,23 @@
 3:
 	.endm
=20
-	/* Release page_table_lock without reloading lock address.
+	/* Release page_table_lock if for user space.
 	   Note that the values in the register spc are limited to
 	   NR_SPACE_IDS (262144). Thus, the stw instruction always
 	   stores a nonzero value even when register spc is 64 bits.
 	   We use an ordered store to ensure all prior accesses are
-	   performed prior to releasing the lock. */
-	.macro		ptl_unlock0	spc,tmp
-#ifdef CONFIG_TLB_PTLOCK
-98:	or,COND(=3D)	%r0,\spc,%r0
-	stw,ma		\spc,0(\tmp)
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
-#endif
-	.endm
-
-	/* Release page_table_lock. */
-	.macro		ptl_unlock1	spc,tmp
+	   performed prior to releasing the lock. Note stw may not
+	   be executed, so we provide one extra nop when
+	   CONFIG_TLB_PTLOCK is defined.*/
+	.macro		ptl_unlock	spc,tmp
 #ifdef CONFIG_TLB_PTLOCK
 98:	get_ptl		\tmp
-	ptl_unlock0	\spc,\tmp
+	or,COND(=3D)	%r0,\spc,%r0
+	stw,ma		\spc,0(\tmp)
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
+	insert_nops	NUM_PIPELINE_INSNS - 3
+#else
+	insert_nops	NUM_PIPELINE_INSNS - 1
 #endif
 	.endm
=20
@@ -1125,7 +1140,7 @@ dtlb_miss_20w:
 =09
 	idtlbt          pte,prot
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1134,6 +1149,7 @@ dtlb_check_alias_20w:
=20
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1151,7 +1167,7 @@ nadtlb_miss_20w:
=20
 	idtlbt          pte,prot
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1160,6 +1176,7 @@ nadtlb_check_alias_20w:
=20
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1185,7 +1202,7 @@ dtlb_miss_11:
=20
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1195,6 +1212,7 @@ dtlb_check_alias_11:
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1218,7 +1236,7 @@ nadtlb_miss_11:
=20
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1228,6 +1246,7 @@ nadtlb_check_alias_11:
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1247,7 +1266,7 @@ dtlb_miss_20:
=20
 	idtlbt          pte,prot
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1256,6 +1275,7 @@ dtlb_check_alias_20:
 =09
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1275,7 +1295,7 @@ nadtlb_miss_20:
 =09
 	idtlbt		pte,prot
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1284,6 +1304,7 @@ nadtlb_check_alias_20:
=20
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1320,7 +1341,7 @@ itlb_miss_20w:
 =09
 	iitlbt          pte,prot
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1344,7 +1365,7 @@ naitlb_miss_20w:
=20
 	iitlbt          pte,prot
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1353,6 +1374,7 @@ naitlb_check_alias_20w:
=20
 	iitlbt		pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1378,7 +1400,7 @@ itlb_miss_11:
=20
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1402,7 +1424,7 @@ naitlb_miss_11:
=20
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1412,6 +1434,7 @@ naitlb_check_alias_11:
 	iitlba          pte,(%sr0, va)
 	iitlbp          prot,(%sr0, va)
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1432,7 +1455,7 @@ itlb_miss_20:
=20
 	iitlbt          pte,prot
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1452,7 +1475,7 @@ naitlb_miss_20:
=20
 	iitlbt          pte,prot
=20
-	ptl_unlock1	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1461,6 +1484,7 @@ naitlb_check_alias_20:
=20
 	iitlbt          pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1482,7 +1506,7 @@ dbit_trap_20w:
 	=09
 	idtlbt          pte,prot
=20
-	ptl_unlock0	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
 #else
@@ -1508,7 +1532,7 @@ dbit_trap_11:
=20
 	mtsp            t1, %sr1     /* Restore sr1 */
=20
-	ptl_unlock0	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
=20
@@ -1528,7 +1552,7 @@ dbit_trap_20:
 =09
 	idtlbt		pte,prot
=20
-	ptl_unlock0	spc,t0
+	ptl_unlock	spc,t0
 	rfir
 	nop
 #endif

--wZbC24IxgILFtDcJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmU0NWMACgkQXb/Nrl8Z
TfHf8A/8C6zR86r81qOPNVzOey8L/Dx6ExW9suLs7u07m1iMJziIstmIImGVB8nS
fD97DJDCxiDu7kkddtVbqq18vl5ZxGMRWzTvq8TU6cbsSEBtr9baBKiBmi/6w3gF
hS8+GIMl4mr066SBGe1v49KK8G29lBPgtOeT8UP4giOXxpIQ1p1fQlRsSk3abBUA
nocf49anTBPpRmBXiXd5PjiO/2tm/owQbABiQcKNWV/i7y/R8cf1ebyZVpfmRzbM
V77+C7xIV2mngAJptnPS7iTnHihxveO45WjZikxgVX6JjNYO1/VsYD2mNENvOWmR
TpXKWyaNjyYLyNscHEtCxsT7rwH6iloIQxbJoVbOTtbPNzFjKiMisOC26QCWwSue
KtgeaRSDppo/B+psngw7ZNmJF5oRmGG5iirIIXDZSDTsm8wC8C3BiMoDLbEzqEN0
0HwWd+wur+SRc+DV8Jlyb5d40v+ifxcUxrvbaKknTP7PPu6ozmM8gKZW9Kc9LBkK
/Qkxga/KVPbMnuljTMJTRYpvnwbweD5BwDDujx6yevVI3XHFSGf0EOpgCTwhfYmJ
SPdFe2dEdsDh5qYHJ4gT6fHHTLdXTW7sV2tNQopTtLWgjUc0wBcBPMvgNUidCFEe
/3e4O8fpMlye1NesVRs5aytJ9q0r7I1BFBrnhlyo2kq99hEJG9o=
=Ug95
-----END PGP SIGNATURE-----

--wZbC24IxgILFtDcJ--

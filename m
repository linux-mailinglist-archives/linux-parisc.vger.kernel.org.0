Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F30EC7CEB5C
	for <lists+linux-parisc@lfdr.de>; Thu, 19 Oct 2023 00:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjJRWel (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 18 Oct 2023 18:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjJRWel (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 18 Oct 2023 18:34:41 -0400
Received: from dellerweb.de (dellerweb.de [173.249.48.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E79AAB
        for <linux-parisc@vger.kernel.org>; Wed, 18 Oct 2023 15:34:33 -0700 (PDT)
Received: from mx3210.localdomain (unknown [142.126.114.79])
        by dellerweb.de (Postfix) with ESMTPSA id C641916002AE;
        Thu, 19 Oct 2023 00:34:28 +0200 (CEST)
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id B6DC622012C; Wed, 18 Oct 2023 22:34:14 +0000 (UTC)
Date:   Wed, 18 Oct 2023 22:34:14 +0000
From:   John David Anglin <dave@parisc-linux.org>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH v2] parisc: Add nop instructions after TLB inserts
Message-ID: <ZTBdZt01UgujpG2h@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9x/gikE9zR58fSm1"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--9x/gikE9zR58fSm1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

An excerpt from the PA8800 ERS states:

o The PA8800 violates the seven instruction pipeline rule when performing
  TLB inserts or PxTLBE instructions with the PSW C bit on. The instruction
  will take effect by the 12th instruction after the insert or purge.

I believe we have a problem with handling TLB misses. We don't fill
the pipeline following TLB inserts. As a result, we likely fault again
after returning from the interruption.

The above statement indicates that we need at least seven instructions
after the insert on pre PA8800 processors and we need 12 instructions
on PA8800/PA8900 processors.

Here we add macros and code to provide the required number instructions
after a TLB insert.

Tested on c8000.

v2: Revise per Helge's suggestions. Applies to master 6.6.0-rc6.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Suggested-by: Helge Deller <deller@gmx.de>
---

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index ae03b8679696..4a848a928238 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -36,6 +36,24 @@
 	.level 2.0
 #endif
=20
+/*
+ * We need seven instructions after a TLB insert for it to take effect.
+ * The PA8800/PA8900 processors are an exception and need 12 instructions.
+ * The RFI changes both IAOQ_Back and IAOQ_Front, so it counts as one.
+ */
+#ifdef CONFIG_64BIT
+#define NUM_INSNS    12
+#else
+#define NUM_INSNS    7
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
@@ -415,25 +433,38 @@
 3:
 	.endm
=20
-	/* Release page_table_lock without reloading lock address.
-	   We use an ordered store to ensure all prior accesses are
-	   performed prior to releasing the lock. */
-	.macro		ptl_unlock0	spc,tmp,tmp2
-#ifdef CONFIG_TLB_PTLOCK
-98:	ldi		__ARCH_SPIN_LOCK_UNLOCKED_VAL, \tmp2
+	/* Release page_table_lock if for user space. We use an ordered
+	   store to ensure all prior accesses are performed prior to
+	   releasing the lock. */
+	.macro		ptl_unlock	spc,tmp,tmp2
+	ldi		__ARCH_SPIN_LOCK_UNLOCKED_VAL, \tmp2
 	or,COND(=3D)	%r0,\spc,%r0
 	stw,ma		\tmp2,0(\tmp)
+	.endm
+
+	/* Release page_table_lock without reloading lock address. */
+	.macro		ptl_unlock0	spc,tmp,tmp2
+#ifdef CONFIG_TLB_PTLOCK
+98:	ptl_unlock	\spc,\tmp,\tmp2
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
+#else
+	insert_nops	3
 #endif
+	/* Insert nops so we don't return before TLB insert takes effect. */
+	insert_nops	NUM_INSNS - 4
 	.endm
=20
-	/* Release page_table_lock. */
+	/* Reload lock address and release page_table_lock. */
 	.macro		ptl_unlock1	spc,tmp,tmp2
 #ifdef CONFIG_TLB_PTLOCK
 98:	get_ptl		\tmp
-	ptl_unlock0	\spc,\tmp,\tmp2
+	ptl_unlock	\spc,\tmp,\tmp2
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
+#else
+	insert_nops	4
 #endif
+	/* Insert nops so we don't return before TLB insert takes effect. */
+	insert_nops	NUM_INSNS - 5
 	.endm
=20
 	/* Set the _PAGE_ACCESSED bit of the PTE.  Be clever and
@@ -1133,6 +1164,7 @@ dtlb_check_alias_20w:
=20
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_INSNS - 1
 	rfir
 	nop
=20
@@ -1159,6 +1191,7 @@ nadtlb_check_alias_20w:
=20
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_INSNS - 1
 	rfir
 	nop
=20
@@ -1194,6 +1227,7 @@ dtlb_check_alias_11:
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
=20
+	insert_nops	NUM_INSNS - 1
 	rfir
 	nop
=20
@@ -1227,6 +1261,7 @@ nadtlb_check_alias_11:
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
=20
+	insert_nops	NUM_INSNS - 1
 	rfir
 	nop
=20
@@ -1255,6 +1290,7 @@ dtlb_check_alias_20:
 =09
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_INSNS - 1
 	rfir
 	nop
=20
@@ -1283,6 +1319,7 @@ nadtlb_check_alias_20:
=20
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_INSNS - 1
 	rfir
 	nop
=20
@@ -1352,6 +1389,7 @@ naitlb_check_alias_20w:
=20
 	iitlbt		pte,prot
=20
+	insert_nops	NUM_INSNS - 1
 	rfir
 	nop
=20
@@ -1411,6 +1449,7 @@ naitlb_check_alias_11:
 	iitlba          pte,(%sr0, va)
 	iitlbp          prot,(%sr0, va)
=20
+	insert_nops	NUM_INSNS - 1
 	rfir
 	nop
=20
@@ -1460,6 +1499,7 @@ naitlb_check_alias_20:
=20
 	iitlbt          pte,prot
=20
+	insert_nops	NUM_INSNS - 1
 	rfir
 	nop
=20

--9x/gikE9zR58fSm1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmUwXVwACgkQXb/Nrl8Z
TfEVTA//Sn01UjMfPOhQfDN8+Etzwvwq7T+xtJSzVf03DT9Nxn04S7uEzLELyfJy
Zozp60K+JJfQ08TY9ryoEtInapY1wYsMK2GlVZKdyaFnx7M9YIIcfUyRjyaOtD0K
fBY3DACeL4eXx6Ghv98Bp8kYZjzoOvB7+wR4FYRV7pT4MDKNqvZQcW8DD9vXuqM4
YWQQ81lx7kISXfhmgXYPyhlHfNGA276k1zeQ4fNFQQsY77Pg6W//NB1HuZ7CyskS
ns7Aj/G5b+7x4Ag4WjRyJ2DbiDNYnGCqTVvl269CIzw/1RncVEKOTWpoHEJbXq0N
lH6NRk2Q8HHlZgCBBiKFLx1vBhZJ1d/Y+urej62winqEpndYO7Ost/H7YjlLnQD/
0tpU8Zv5c+OswHA63mIto94ZRS3uglxf58A0xePypj6KEAiwgmebYgdiKrFM9FCe
r0Jx+DFNDl10g4TIM+SDQDJMFwi+4R1D4M512icesUURUBp7F1TEgkLHcKyULdFM
bVnnb1ZwiRmcHyAtyqNzNhWG7nV+DZoQ97gC6GAWb3NQ4Y/etleSWuS4kH3b+9KQ
JdhzASbd957mly84cJuqpoFMvX87zeG1wmVMNKulJsQtwJ+LLqIXlLvSqLZ1ShGQ
YHPPnnPOxMujvSTPPWqZaiHzqDUzMgw4O4Bc4GXK+1FqcsHa0xY=
=IoAB
-----END PGP SIGNATURE-----

--9x/gikE9zR58fSm1--

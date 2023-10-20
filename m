Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 475C17D176E
	for <lists+linux-parisc@lfdr.de>; Fri, 20 Oct 2023 22:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjJTUtQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 20 Oct 2023 16:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjJTUtP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 20 Oct 2023 16:49:15 -0400
Received: from dellerweb.de (dellerweb.de [173.249.48.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9182AB3
        for <linux-parisc@vger.kernel.org>; Fri, 20 Oct 2023 13:49:12 -0700 (PDT)
Received: from mx3210.localdomain (unknown [142.126.114.79])
        by dellerweb.de (Postfix) with ESMTPSA id 3730D16002AE;
        Fri, 20 Oct 2023 22:49:10 +0200 (CEST)
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id B9C0F22012C; Fri, 20 Oct 2023 20:49:07 +0000 (UTC)
Date:   Fri, 20 Oct 2023 20:49:07 +0000
From:   John David Anglin <dave@parisc-linux.org>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH v3] parisc: Add nop instructions after TLB inserts
Message-ID: <ZTLnw6cIVbPovI5l@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+O6m/qU1zdc4EX11"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--+O6m/qU1zdc4EX11
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
v3: Rename NUM_INSNS to NUM_PIPELINE_INSNS. Simply PTL unlock code.
    Add one extra nop when CONFIG_TLB_PTLOCK isdefined.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Suggested-by: Helge Deller <deller@gmx.de>
---

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index ae03b8679696..cab1ec23e0d7 100644
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
@@ -415,24 +433,20 @@
 3:
 	.endm
=20
-	/* Release page_table_lock without reloading lock address.
-	   We use an ordered store to ensure all prior accesses are
-	   performed prior to releasing the lock. */
-	.macro		ptl_unlock0	spc,tmp,tmp2
+	/* Release page_table_lock if for user space. We use an ordered
+	   store to ensure all prior accesses are performed prior to
+	   releasing the lock. Note stw may not be executed, so we
+	   provide one extra nop when CONFIG_TLB_PTLOCK is defined. */
+	.macro		ptl_unlock	spc,tmp,tmp2
 #ifdef CONFIG_TLB_PTLOCK
-98:	ldi		__ARCH_SPIN_LOCK_UNLOCKED_VAL, \tmp2
+98:	get_ptl		\tmp
+	ldi		__ARCH_SPIN_LOCK_UNLOCKED_VAL, \tmp2
 	or,COND(=3D)	%r0,\spc,%r0
 	stw,ma		\tmp2,0(\tmp)
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
-#endif
-	.endm
-
-	/* Release page_table_lock. */
-	.macro		ptl_unlock1	spc,tmp,tmp2
-#ifdef CONFIG_TLB_PTLOCK
-98:	get_ptl		\tmp
-	ptl_unlock0	\spc,\tmp,\tmp2
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
+	insert_nops	NUM_PIPELINE_INSNS - 4
+#else
+	insert_nops	NUM_PIPELINE_INSNS - 1
 #endif
 	.endm
=20
@@ -1124,7 +1138,7 @@ dtlb_miss_20w:
 =09
 	idtlbt          pte,prot
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1133,6 +1147,7 @@ dtlb_check_alias_20w:
=20
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1150,7 +1165,7 @@ nadtlb_miss_20w:
=20
 	idtlbt          pte,prot
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1159,6 +1174,7 @@ nadtlb_check_alias_20w:
=20
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1184,7 +1200,7 @@ dtlb_miss_11:
=20
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1194,6 +1210,7 @@ dtlb_check_alias_11:
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1217,7 +1234,7 @@ nadtlb_miss_11:
=20
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1227,6 +1244,7 @@ nadtlb_check_alias_11:
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1246,7 +1264,7 @@ dtlb_miss_20:
=20
 	idtlbt          pte,prot
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1255,6 +1273,7 @@ dtlb_check_alias_20:
 =09
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1274,7 +1293,7 @@ nadtlb_miss_20:
 =09
 	idtlbt		pte,prot
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1283,6 +1302,7 @@ nadtlb_check_alias_20:
=20
 	idtlbt          pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1319,7 +1339,7 @@ itlb_miss_20w:
 =09
 	iitlbt          pte,prot
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1343,7 +1363,7 @@ naitlb_miss_20w:
=20
 	iitlbt          pte,prot
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1352,6 +1372,7 @@ naitlb_check_alias_20w:
=20
 	iitlbt		pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1377,7 +1398,7 @@ itlb_miss_11:
=20
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1401,7 +1422,7 @@ naitlb_miss_11:
=20
 	mtsp		t1, %sr1	/* Restore sr1 */
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1411,6 +1432,7 @@ naitlb_check_alias_11:
 	iitlba          pte,(%sr0, va)
 	iitlbp          prot,(%sr0, va)
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1431,7 +1453,7 @@ itlb_miss_20:
=20
 	iitlbt          pte,prot
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1451,7 +1473,7 @@ naitlb_miss_20:
=20
 	iitlbt          pte,prot
=20
-	ptl_unlock1	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1460,6 +1482,7 @@ naitlb_check_alias_20:
=20
 	iitlbt          pte,prot
=20
+	insert_nops	NUM_PIPELINE_INSNS - 1
 	rfir
 	nop
=20
@@ -1481,7 +1504,7 @@ dbit_trap_20w:
 	=09
 	idtlbt          pte,prot
=20
-	ptl_unlock0	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
 #else
@@ -1507,7 +1530,7 @@ dbit_trap_11:
=20
 	mtsp            t1, %sr1     /* Restore sr1 */
=20
-	ptl_unlock0	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
=20
@@ -1527,7 +1550,7 @@ dbit_trap_20:
 =09
 	idtlbt		pte,prot
=20
-	ptl_unlock0	spc,t0,t1
+	ptl_unlock	spc,t0,t1
 	rfir
 	nop
 #endif

--+O6m/qU1zdc4EX11
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmUy57cACgkQXb/Nrl8Z
TfGEgA//b4XpBXxXrwz1f257dwrx17BuhPyE6I8DI+QSHppz6NoeS2ha5csm0sYc
Nb6E95SpEZfb7jjUgB7bYZCuBaYEMds2E49vhptBWsTX5vt3HM+pioJfIOy6OcPg
8ZDRbI0JzHNf4lCUldMiGLSYaZg0rhuQeMbwOqDYkzAqR1fVt8e6kQjzvvGPdoxB
Ben9+HZdfBEqYhq2+rSLw36138MHJ0qdMeGW7Ou59nwq3PF153D5lXvMyjWudoor
VTUuYHL1YSPE1VCC2fksPhZd21Bl4ZYACsjMX6662S92wVwt5KeOzwN0cYFcoTGX
CbOuVkH5oXSgEcP4dsM6E9F55q0gJG3s6srUcbVinDlrgWlNhDI6hbWAZm/jbZdV
kw2mqreHeH7+cbtdFZR6R3q1DKYa+/CbP36DBzr4ZGgpdR9WCRrDnGrRP41I8VsD
KrWFTC0OEf1imIvFnAG9Gtpblmry/jtGYvT0Tm7wugCuszOAvp2UfhvPGpyOs3g4
3IfrJ0EM3IJhx54RBl4O1mx2MEI0V09ahF0ELtq7D/tQTcGeu2gxbhcYQ67x4h0t
itCYUNoPrdyJhw5Y1KTRFsKPorXKNcSftcjrae/XZxHYScf756UWb+AzP72C9DWI
GLl4jbnG0A/GTz/y2S2izyuaLaWAMh6bcblK+wwGcxG01VmQ6jQ=
=AJYD
-----END PGP SIGNATURE-----

--+O6m/qU1zdc4EX11--

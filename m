Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F21E52A692
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 17:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348825AbiEQP37 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 11:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbiEQP37 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 11:29:59 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01904F9C7
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652801388;
        bh=iIVB+hrru/oy4IYiyGN+pLm4Cy/9LJ+xUoIumTDXfVQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=bJ33LtUY1AQsx7J7pScUOgIvlOX6/HnpjuuE7iQAWTOQmYH54l8bsMmc3f2x/iXzJ
         e4nzCdnQhrRrEk9+TucgR28HIjQz1crf9HD2MCVr6EJNil3Sv4393ksK10WLc/qtyy
         NSJ0YytcEAlfIL4fdJ3apcTd9UxtgeP19VNF8FH8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.173.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpOT-1nNwqz0eSn-00gGGP; Tue, 17
 May 2022 17:29:48 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 4/4] parisc: Optimize tmpalias function calls
Date:   Tue, 17 May 2022 17:29:46 +0200
Message-Id: <20220517152946.187638-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517152946.187638-1-deller@gmx.de>
References: <20220517152946.187638-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c++TCu6ejDZUq6bFWXk9VKabhNGhgiU2ytse4928Uxu7sh198GT
 4WnYMICNyVQIzHNl0vSoV0dBRIpsjXcFBm/1pIhZKtc+V3Xpz3RYswIB0Lr7IQmBrZzY5SB
 XFgg0d3bFJ2cPPvrKdxHoW2aPMpH+C9/KYXNdJSYpTvmJCeh0oOhwqhO4l856m9QWG1ALub
 AfX8St4iiY2KOct574wWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nmWk8QNt0ng=:Fr93QSywCqvBuYGER98UPC
 6ru6tLGNnIgX4ol8Y1yOzq0ruXOa6g5LW/5jojywit3J7wAl5jfELtj4EGaa+2Nq/ak2tJPyl
 TRosXO+BPrw8+6VX/hLWJ+FqdSiyM2D84Gj2BMUE+HOBH0bptNOZKSOVze3DJhYVz+EWpsMqp
 3h5l/t7LlMnhVbotwHLZ3xitwAmA30CE+iJCPqQASWeUnXBtbaOWjpMT1y+LsD4ZOrk5rVwMI
 F0wz6iqlF+WPFo3t1lkDF2v5mE1fOvweytUelp9CTID4RJfxxd1f9uy6/053EjdYSWamk2VRm
 puD0pv79EmAF8a54b/tvQgHm4QweLgbb57vvEOdSVP1to4GzXc9yJ6+qpbge+BN/5jeyzbtwu
 DDzin8Wf4bilXofponTaPBreGM7cF2C1CkpZGfHWqJkhjPkaVebIU7Ddogx8g+FbqwuChyw3h
 BoElYRNrV6inTElGjtRfXVxPWM55v/gXwXpUWeNd4dMxB2VdEzYTYaZVEr9erZfeMP3bDHUT6
 tDIFs0yfo49LnaKErPM96Nl5J3pPPJM6M+zuHFbB4WNwiT9fzcVJ6zmgKsKek7bUarKL/wUFT
 dVleknYA8oSpKQ0FyUz5bOa2i4r7qwaQ4C2oiCSNJGUsKhdBWEVf3OzqR5+O/oM9e4CBt1/xC
 y5ILPBbc3sj24TEsUgUny/y+CkrCT0O3lFMsQoGQyv3DXv/x//ye0SDPyOlvfyAKGQqgo19GL
 eizVgw6dAvzg77Qvul/5reWDCpmMg5IPSKmuY8O/CCYDXw3pHfSd5UZ/xAGOkyZwQqlWaOTuc
 ijxkvz+IaNYR3m4UXCMD4XQTakzyiuIMz+AybWBQSc17DZBtlc3TKrECl+Usrk76fQfNvLY5k
 naoVgW1VcC55VDXdmWiXLA2sj0+tQPdMqHC/OvxST1fXJPgP6CIjBuesgHrmMzPbohUxcTxVC
 94EKpFMLKBusyOI/x895/Rt7VxAA7ukLUlC9ot17z9yLCpFBRRfGhqUT29akAEP8a3+KEgtIp
 0+bV/AvIS6xYrG2iAEsW7zJOhF7bNdjIQZCZZTk9A/g/54UtTWo4gq9BiYngg3OJOuvyM8sop
 IHvCsAOfoCu/7hvVhucAU07xqsguDf+Igt1J7V/qzidmsUGbAYVXA/Aew==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Instead of converting the physical address of the mapping to the tlb
insert format inside all the various tmpalias functions, move this
conversion over to the DTLB miss handler. The physical address is
already in %r26 (or will be calculated into %r32), so there are no
additional steps needed.

Additionally we can now use the dep_safe() and depi_safe() macros to
avoid differentiating between 32- and 64-bit builds and as such make the
code much more readable.

The check if "ldil L%(TMPALIAS_MAP_START)" would sign extend into the
upper 32 bits can be dropped, because we added a compile time check in
an earlier patch.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/entry.S   | 13 ++----
 arch/parisc/kernel/pacache.S | 89 ++++++------------------------------
 2 files changed, 17 insertions(+), 85 deletions(-)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 2af27c8b4aa6..df8102fb435f 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -566,11 +566,6 @@
 	.macro		do_alias	spc,tmp,tmp1,va,pte,prot,fault,patype
 	cmpib,COND(<>),n 0,\spc,\fault
 	ldil		L%(TMPALIAS_MAP_START),\tmp
-#if defined(CONFIG_64BIT) && (TMPALIAS_MAP_START >=3D 0x80000000)
-	/* on LP64, ldi will sign extend into the upper 32 bits,
-	 * which is behaviour we don't want */
-	depdi		0,31,32,\tmp
-#endif
 	copy		\va,\tmp1
 	depi_safe	0,31,TMPALIAS_SIZE_BITS+1,\tmp1
 	cmpb,COND(<>),n	\tmp,\tmp1,\fault
@@ -605,13 +600,13 @@
 	 * OK, it is in the temp alias region, check whether "from" or "to".
 	 * Check "subtle" note in pacache.S re: r23/r26.
 	 */
-#ifdef CONFIG_64BIT
-	extrd,u,*=3D	\va,63-TMPALIAS_SIZE_BITS,1,%r0
-#else
 	extrw,u,=3D	\va,31-TMPALIAS_SIZE_BITS,1,%r0
-#endif
 	or,COND(tr)	%r23,%r0,\pte
 	or		%r26,%r0,\pte
+
+	/* convert phys addr in \pte (from r23 or r26) to tlb insert format */
+	SHRREG		\pte,PAGE_SHIFT+PAGE_ADD_SHIFT-5, \pte
+	depi_safe	_PAGE_SIZE_ENCODING_DEFAULT, 31,5, \pte
 	.endm


diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 45762a9ca064..9a0018f1f42c 100644
=2D-- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -500,19 +500,10 @@ ENDPROC_CFI(copy_page_asm)
  *       miss on the translation, the dtlb miss handler inserts the
  *       translation into the tlb using these values:
  *
- *          %r26 physical page (shifted for tlb insert) of "to" translati=
on
- *          %r23 physical page (shifted for tlb insert) of "from" transla=
tion
+ *          %r26 physical address of "to" translation
+ *          %r23 physical address of "from" translation
  */

-        /* Drop prot bits and convert to page addr for iitlbt and idtlbt =
*/
-        #define PAGE_ADD_SHIFT  (PAGE_SHIFT-12)
-        .macro          convert_phys_for_tlb_insert20  phys
-        extrd,u         \phys, 56-PAGE_ADD_SHIFT, 32-PAGE_ADD_SHIFT, \phy=
s
-#if _PAGE_SIZE_ENCODING_DEFAULT
-        depdi           _PAGE_SIZE_ENCODING_DEFAULT, 63, (63-58), \phys
-#endif
-	.endm
-
 	/*
 	 * copy_user_page_asm() performs a page copy using mappings
 	 * equivalent to the user page mappings.  It can be used to
@@ -541,24 +532,10 @@ ENTRY_CFI(copy_user_page_asm)
 	sub		%r25, %r1, %r23

 	ldil		L%(TMPALIAS_MAP_START), %r28
-#ifdef CONFIG_64BIT
-#if (TMPALIAS_MAP_START >=3D 0x80000000)
-	depdi		0, 31,32, %r28		/* clear any sign extension */
-#endif
-	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert fo=
rmat */
-	convert_phys_for_tlb_insert20 %r23	/* convert phys addr to tlb insert fo=
rmat */
-	depd		%r24,63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
-	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
-	copy		%r28, %r29
-	depdi		1, 63-TMPALIAS_SIZE_BITS,1, %r29	/* Form aliased virtual address =
'from' */
-#else
-	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	extrw,u		%r23, 24,25, %r23	/* convert phys addr to tlb insert format */
-	depw		%r24, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address =
'to' */
-	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
+	dep_safe	%r24, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual addre=
ss 'to' */
+	depi_safe	0, 31,PAGE_SHIFT, %r28			/* Clear any offset bits */
 	copy		%r28, %r29
-	depwi		1, 31-TMPALIAS_SIZE_BITS,1, %r29	/* Form aliased virtual address =
'from' */
-#endif
+	depi_safe	1, 31-TMPALIAS_SIZE_BITS,1, %r29	/* Form aliased virtual addre=
ss 'from' */

 	/* Purge any old translations */

@@ -688,18 +665,8 @@ ENTRY_CFI(clear_user_page_asm)
 	tophys_r1	%r26

 	ldil		L%(TMPALIAS_MAP_START), %r28
-#ifdef CONFIG_64BIT
-#if (TMPALIAS_MAP_START >=3D 0x80000000)
-	depdi		0, 31,32, %r28		/* clear any sign extension */
-#endif
-	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert fo=
rmat */
-	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address =
'to' */
-	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
-#else
-	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address =
'to' */
-	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
-#endif
+	dep_safe	%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual addre=
ss 'to' */
+	depi_safe	0, 31,PAGE_SHIFT, %r28			/* Clear any offset bits */

 	/* Purge any old translation */

@@ -764,18 +731,8 @@ ENDPROC_CFI(clear_user_page_asm)

 ENTRY_CFI(flush_dcache_page_asm)
 	ldil		L%(TMPALIAS_MAP_START), %r28
-#ifdef CONFIG_64BIT
-#if (TMPALIAS_MAP_START >=3D 0x80000000)
-	depdi		0, 31,32, %r28		/* clear any sign extension */
-#endif
-	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert fo=
rmat */
-	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address =
'to' */
-	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
-#else
-	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address =
'to' */
-	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
-#endif
+	dep_safe	%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual addre=
ss 'to' */
+	depi_safe	0, 31,PAGE_SHIFT, %r28			/* Clear any offset bits */

 	/* Purge any old translation */

@@ -823,18 +780,8 @@ ENDPROC_CFI(flush_dcache_page_asm)

 ENTRY_CFI(purge_dcache_page_asm)
 	ldil		L%(TMPALIAS_MAP_START), %r28
-#ifdef CONFIG_64BIT
-#if (TMPALIAS_MAP_START >=3D 0x80000000)
-	depdi		0, 31,32, %r28		/* clear any sign extension */
-#endif
-	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert fo=
rmat */
-	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address =
'to' */
-	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
-#else
-	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address =
'to' */
-	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
-#endif
+	dep_safe	%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual addre=
ss 'to' */
+	depi_safe	0, 31,PAGE_SHIFT, %r28			/* Clear any offset bits */

 	/* Purge any old translation */

@@ -882,18 +829,8 @@ ENDPROC_CFI(purge_dcache_page_asm)

 ENTRY_CFI(flush_icache_page_asm)
 	ldil		L%(TMPALIAS_MAP_START), %r28
-#ifdef CONFIG_64BIT
-#if (TMPALIAS_MAP_START >=3D 0x80000000)
-	depdi		0, 31,32, %r28		/* clear any sign extension */
-#endif
-	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert fo=
rmat */
-	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address =
'to' */
-	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
-#else
-	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address =
'to' */
-	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
-#endif
+	dep_safe	%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual addre=
ss 'to' */
+	depi_safe	0, 31,PAGE_SHIFT, %r28			/* Clear any offset bits */

 	/* Purge any old translation.  Note that the FIC instruction
 	 * may use either the instruction or data TLB.  Given that we
=2D-
2.35.3


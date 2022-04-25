Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBBF50EC58
	for <lists+linux-parisc@lfdr.de>; Tue, 26 Apr 2022 00:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbiDYXCh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 25 Apr 2022 19:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235918AbiDYXCg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 25 Apr 2022 19:02:36 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-001.bell.net [209.71.212.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D5CAC3A5F5
        for <linux-parisc@vger.kernel.org>; Mon, 25 Apr 2022 15:59:29 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 625E3E3F00ABA3B9
X-CM-Envelope: MS4xfGQB2yC5dWF2sZH0nTUwTYyup/SwLIlx942Ebpd5HZ9brptvv28wZIxySaykYXW37eBgCRHHtZUFq9aW8AtU82CvUM9npiBuFjoHqPdJ+9YGcfur3+l1
 Pcx4K9iZOHSLNFeAk58ZOBQLfgv+dn7I8zA+WxEBbMc+YUHdjAmbmka3ZsDFCni/Ksn607myyEMkTBFoHq+iO6togzpnWS0CTI9PItLSm2V0gVe0dYjY9kD8
 EqCHdv+LMwzWtWXJmp7DLqwopx1sYzc97HUyiOEjlOA7TJo2y2BJb+fNVWNocx875xDRaEKuA3MsZv0SKIlfJpUqaQ3JBhlhms19kdziFMVTZ7Kt5iIiEAHa
 7kYqF0Cc0NHWDweZ/Ppk4ZjOb3iQBL+M6Yfgp03tgQFI285Ne6IAvYECG3O9Bao9Tqbnf4NATIWoqia6/K0NWlhInv+9xxCkqrYeKWRefsBWBZ1VJi5tfAd6
 /a6vfAFyNDIqFVJbb3Yz9ZyLeu9j2NvLOG/o6av6uNxTSTry4mfJOZmpidvgS8gae2gPIkZuXwKXXS8oCm81Bm1b7BeladnOCrmObcqEwsj95Ev082nbd/XI
 rff1WJIW/I1booWA55VJXR9JzVvzs7NhJor4++T4FWPiyw==
X-CM-Analysis: v=2.4 cv=G99/r/o5 c=1 sm=1 tr=0 ts=62671c30
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=z0gMJWrwH1QA:10 a=FBHGMhGWAAAA:8 a=GhmPXVJ66nKjZJ6kmfYA:9
 a=pwvGW-Ypp_HDPceq:21 a=CjuIK1q_8ugA:10 a=KNAKltQrHSywft33S5YA:9
 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 625E3E3F00ABA3B9; Mon, 25 Apr 2022 18:09:52 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 3D0DA220115; Mon, 25 Apr 2022 22:09:52 +0000 (UTC)
Date:   Mon, 25 Apr 2022 22:09:52 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [Patch] parisc: Don't hardcode assembler bit definitions in tmpalias
 code
Message-ID: <YmccMPPKlERMLE4+@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PoyuuePkE/7oyePq"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--PoyuuePkE/7oyePq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This change removes the hardcoded bit definitions in the tmpalias
assembly code. This makes it easy to change the size of the tmpalias
region.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/fixmap.h b/arch/parisc/include/asm/fix=
map.h
index e480b2c05407..5cd80ce1163a 100644
--- a/arch/parisc/include/asm/fixmap.h
+++ b/arch/parisc/include/asm/fixmap.h
@@ -9,12 +9,27 @@
  *
  * All of the values in this file must be <4GB (because of assembly
  * loading restrictions).  If you place this region anywhere above
- * __PAGE_OFFSET, you must adjust the memory map accordingly */
+ * __PAGE_OFFSET, you must adjust the memory map accordingly
+ */
=20
-/* The alias region is used in kernel space to do copy/clear to or
- * from areas congruently mapped with user space.  It is 8MB large
- * and must be 16MB aligned */
-#define TMPALIAS_MAP_START	((__PAGE_OFFSET) - 16*1024*1024)
+/*
+ * The tmpalias region is used in kernel space to copy/clear/flush data
+ * from pages congruently mapped with user space. It is comprised of
+ * a pair regions. The size of these regions is determined by the largest
+ * cache aliasing boundary for machines that support equivalent aliasing.
+ *
+ * The c3750 with PA8700 processor returns an alias value of 11. This
+ * indicates that it has an alias boundary of 4 MB. It also supports
+ * non-equivalent aliasing without a performance penalty.
+ *
+ * Machines with PA8800/PA8900 processors return an alias value of 0.
+ * This indicates the alias boundary is unknown and may be larger than
+ * 16 MB. Non-equivalent aliasing is not supported.
+ *
+ * Here we assume the maximum alias boundary is 4 MB.
+ */
+#define TMPALIAS_SIZE_BITS	22	/* 4 MB */
+#define TMPALIAS_MAP_START	((__PAGE_OFFSET) - (2 << TMPALIAS_SIZE_BITS))
=20
 #define FIXMAP_SIZE		(FIX_BITMAP_COUNT << PAGE_SHIFT)
 #define FIXMAP_START		(TMPALIAS_MAP_START - FIXMAP_SIZE)
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index ecf50159359e..2af27c8b4aa6 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -554,8 +554,9 @@
 	extrd,s		\pte,63,25,\pte
 	.endm
=20
-	/* The alias region is an 8MB aligned 16MB to do clear and
-	 * copy user pages at addresses congruent with the user
+	/* The alias region is comprised of a pair of 4 MB regions
+	 * aligned to 8 MB. It is used to clear/copy/flush user pages
+	 * using kernel virtual addresses congruent with the user
 	 * virtual address.
 	 *
 	 * To use the alias page, you set %r26 up with the to TLB
@@ -571,7 +572,7 @@
 	depdi		0,31,32,\tmp
 #endif
 	copy		\va,\tmp1
-	depi		0,31,23,\tmp1
+	depi_safe	0,31,TMPALIAS_SIZE_BITS+1,\tmp1
 	cmpb,COND(<>),n	\tmp,\tmp1,\fault
 	mfctl		%cr19,\tmp	/* iir */
 	/* get the opcode (first six bits) into \tmp */
@@ -605,9 +606,9 @@
 	 * Check "subtle" note in pacache.S re: r23/r26.
 	 */
 #ifdef CONFIG_64BIT
-	extrd,u,*=3D	\va,41,1,%r0
+	extrd,u,*=3D	\va,63-TMPALIAS_SIZE_BITS,1,%r0
 #else
-	extrw,u,=3D	\va,9,1,%r0
+	extrw,u,=3D	\va,31-TMPALIAS_SIZE_BITS,1,%r0
 #endif
 	or,COND(tr)	%r23,%r0,\pte
 	or		%r26,%r0,\pte
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 8569141e3e67..45762a9ca064 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -487,6 +487,8 @@ ENDPROC_CFI(copy_page_asm)
  *       parisc chip designers that there will not ever be a parisc
  *       chip with a larger alias boundary (Never say never :-) ).
  *
+ *       Yah, what about the PA8800 and PA8900 processors?
+ *
  *       Subtle: the dtlb miss handlers support the temp alias region by
  *       "knowing" that if a dtlb miss happens within the temp alias
  *       region it must have occurred while in clear_user_page. Since
@@ -545,17 +547,17 @@ ENTRY_CFI(copy_user_page_asm)
 #endif
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert for=
mat */
 	convert_phys_for_tlb_insert20 %r23	/* convert phys addr to tlb insert for=
mat */
-	depd		%r24,63,22, %r28	/* Form aliased virtual address 'to' */
+	depd		%r24,63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address 't=
o' */
 	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 	copy		%r28, %r29
-	depdi		1, 41,1, %r29		/* Form aliased virtual address 'from' */
+	depdi		1, 63-TMPALIAS_SIZE_BITS,1, %r29	/* Form aliased virtual address '=
=66rom' */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
 	extrw,u		%r23, 24,25, %r23	/* convert phys addr to tlb insert format */
-	depw		%r24, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depw		%r24, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 	copy		%r28, %r29
-	depwi		1, 9,1, %r29		/* Form aliased virtual address 'from' */
+	depwi		1, 31-TMPALIAS_SIZE_BITS,1, %r29	/* Form aliased virtual address '=
=66rom' */
 #endif
=20
 	/* Purge any old translations */
@@ -691,11 +693,11 @@ ENTRY_CFI(clear_user_page_asm)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
 #endif
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert for=
mat */
-	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
+	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
=20
@@ -767,11 +769,11 @@ ENTRY_CFI(flush_dcache_page_asm)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
 #endif
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert for=
mat */
-	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
+	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
=20
@@ -826,11 +828,11 @@ ENTRY_CFI(purge_dcache_page_asm)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
 #endif
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert for=
mat */
-	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
+	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
=20
@@ -885,11 +887,11 @@ ENTRY_CFI(flush_icache_page_asm)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
 #endif
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert for=
mat */
-	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
+	depd		%r25, 63,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depw		%r25, 31,TMPALIAS_SIZE_BITS, %r28	/* Form aliased virtual address '=
to' */
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
=20

--PoyuuePkE/7oyePq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmJnHCgACgkQXb/Nrl8Z
TfHWYQ//aRUGJZIgYwbL2m/1R67ED1iF4CCWYtcWhNKHPITpo9SjnyFTMEQPvw1R
ZgyQAYXPneGTgvmlijcbZsQ2UXEr5k5g7MwU8r4vMil2ieiExEyZl0Eq6ns07BK3
UrPoVcwKEyo3joUr6rtaufNb2bRalED1x53u5V2dksIwxumvbVlX4vvOyw3svOIF
EFxmFY89+jkJgsm5WqvDALDWfoQntM7dIJ+TarcbHAvcpGBeLEKYTP55u0dVPGzz
Cq+js0elySDQemEIub4/4/A3TIgVwn7ElrjIqRwCCbDhvH+fjqYkQu9ZwxNTrh9q
nMwjGcODI8U6mYTBF21nu4T4K7S+2ma7RoCssXkNbaZA4dXGrtC4WmeZu0Ah2Vlj
WRNgqQLdGyyLJ9oyK7JmszhunO2rJOxUL41hEJy3bzlBSAf9f1+A0z6+bp0NhYFX
K+8eiXiB4+HRjQpUrOQuOvop+OT6gVwn7yXNPtBkFNn2C3/OwzrBkJ9BnKfxsIDr
g12FM+XQxq2D3Ioc7LDEBBUsCXEKy3w/se4gmVTDqsxuxoL6G22QHPa4yHUDrVR8
DhTAg/r/poPqWW/Gls31xczmAyfghYL8YvJj5KqnthgKwOaf4GLZyx5SNK40OsBw
Pcr1j0+OqLRPzOYXet7pJW270RZ8VBeUzbsZawZiObgaVcwwqj8=
=FevS
-----END PGP SIGNATURE-----

--PoyuuePkE/7oyePq--

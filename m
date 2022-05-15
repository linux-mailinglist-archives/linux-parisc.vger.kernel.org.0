Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE00527ABB
	for <lists+linux-parisc@lfdr.de>; Mon, 16 May 2022 00:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235663AbiEOWrb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 15 May 2022 18:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234031AbiEOWrb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 15 May 2022 18:47:31 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-003.bell.net [209.71.208.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 598C5E0E6
        for <linux-parisc@vger.kernel.org>; Sun, 15 May 2022 15:47:28 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 627CF32E00BA25F2
X-CM-Envelope: MS4xfPiCmSsWVot8O5r0ovH/lukNx2e0uaUgApT5eCTjDf0qMyvd4OJPAjUU8gpNPRZFToqakdIB6sWXeKdjFcwVltj/5nIYj6etE8cf9daA5wyBsOWIdtZr
 PiU+w0Lq4KMevamaQkUzYdoWtlyfTEi4/t0nYlNx4L52PeOvw05YAx0bUHqeOvSSu/Ad4XdR0A/a42fiw4A/hbO/rHBFHy/7jZsFJ5/jAeIhZeEBy5H/0IBf
 1NmKxTErNvthzXFoc8XJJeA0sJjeGSk8Ysg7NnO+AQkN+pkeIi6IJDIeG/GwfIJVWrzwpOEysrXsSQbjSVdrrK8KmkDkqZ0UoGKAyS8SOcm7Nf/689J7aXqR
 88bk8M6yPkyew2nXejH5gLJ3zp3dID9cBXyt0uHrUUa/FprfBOl3MmegC6ML+qEhBF5nfA2n6eN9hdKYPZ5vA+QH75g9ZnuCHLVi0w3Ic1aAZGl6lih1i3qK
 Jdz9YWMqlenmU3p5R8GW0UIxAyVKQ5WGi0ea0p7mL/BHT7ck6hGdpDxCRUUldB/BmoKlZsHZYusvrjroj50dcU7MwnMvo0FPq4sP65PJxISnEci17JnP87aJ
 slx6Lwmkwb9ldFpi0pYNYR2p2GJr/yO5s0wiSg586T+A7A==
X-CM-Analysis: v=2.4 cv=YYreWydf c=1 sm=1 tr=0 ts=628182ea
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=oZkIemNP1mAA:10 a=FBHGMhGWAAAA:8 a=GhmPXVJ66nKjZJ6kmfYA:9
 a=pwvGW-Ypp_HDPceq:21 a=CjuIK1q_8ugA:10 a=IH1k14TQIPjdsj6B5VcA:9
 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 627CF32E00BA25F2; Sun, 15 May 2022 18:47:06 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id B7A8E220115; Sun, 15 May 2022 22:47:04 +0000 (UTC)
Date:   Sun, 15 May 2022 22:47:04 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH, resend] parisc: Don't hardcode assembler bit definitions in
 tmpalias code
Message-ID: <YoGC6PhtBMnfGA/O@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="C0OGa6+AxQ/OXSrj"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--C0OGa6+AxQ/OXSrj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Remove the hardcoded bit definitions in the tmpalias assembly code.
This makes it easy to change the size of the tmpalias region.

The alignment of the tmpalias region is reduced from 16 MB to 8 MB.

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

--C0OGa6+AxQ/OXSrj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmKBguAACgkQXb/Nrl8Z
TfEN8w/9HXo7MejLw2eTDwQX4VhjiWenfnZImZ+qyOsQ7Tc2wCj3djrAM+8/4Coe
EQ1QZhUnmd2Xw7YnvpRRpViWajsjvsSU+yBmWPkU/qeV0Vnbs6vWXor2g+gOkiVQ
YtMvIw7cCc2kG7UnbiKGvxABVwYTQ3ANYR3tJMLpGSjnp34VsHtADvLPKeohNtIC
7Q+sG3XUBKlRHAYs0t4lnydRHBjjgPLqUoDYiQZHN+Hms6fruqS0NHdaPrDL+ZPn
wedp+CUBZYptMcASwq0nS7xtO9gKQjEyF7Dayoa52rk4yB4XN+jY5i3tWM6x/Xc7
r81i1tpljjaleGP/BHW3e7jje6FUX1CaPYNt9RIcdRRE16AsY4MjI0kOuR0RGXSr
MjdgZvZCqHaOnIVYcgH76ZJEjOHqmKe7DIEJ5ShWy7XmXdKuvEbCPbB0bcofkrRT
w4E09o3GnIBOfGsuJ2S2JxUujrSYY3RBYRFtFt7H+mzN3tGjmTNG/+DQ/mWb1pQ2
bliqBhLshcP+nX1vmn6k4Yu5ufCItJFLrEskP0NoghZeJP5VQGsdpV6Vdgpm2Omx
wioiHDDoG3O4pT8Unecju+FIih9fQW7KXzvlUcnEbw0qtLx9E1Dpu0IxU7JjWJSH
hmSLZLMOnXZstbDN2uHfhTKQWQnx2BtQaNTrxWvHr9IECJFXZik=
=J5QK
-----END PGP SIGNATURE-----

--C0OGa6+AxQ/OXSrj--

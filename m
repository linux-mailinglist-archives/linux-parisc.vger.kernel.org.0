Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FABD496D43
	for <lists+linux-parisc@lfdr.de>; Sat, 22 Jan 2022 19:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbiAVSUG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 22 Jan 2022 13:20:06 -0500
Received: from mta-tor-003.bell.net ([209.71.212.30]:35232 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231531AbiAVSUG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 22 Jan 2022 13:20:06 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61E5E7EC0077E7E2
X-CM-Envelope: MS4xfCCNgz7+6EWnfVHWAenGPEGQjOH0X+2zGWZwxk7gbD9yEza4LtQU7cRaF2BfVSbXzfF3PH+FDUeIlADJobLJL7nz5UdWeglqlIfyqXQfwUvFIWL1z5UK
 z8C+LWKKMVLtXPq3KdGhsu1xPxviGI6RXYDqJszOD25CxBoOIP76aMVjQBttGwWyrGC3jmkXqs38bYqcTTyAvrD0TW3IYe09JqNs/xGZV01woefwHZfDeaPN
 fl/tkJpVwfJeUpCGM/KvrAmFutRQfd8XlUXBFUP8mmbT2tuMNhANh+4i7/8JZF9ZsZkhkRsSGckdn3Ay9at35J+ZmLpkY08W6q7ryCnCe/mHLW0zY0+K/I1U
 1Ulb6MejDwAGZYMU7aTe4ZipEu17CE8+sI5hYUH0do/dq6mNWzAGicycuFjmuJIBpbJMasPcWW9tH3M7Q4WeAuw4Qfr3cHyKRw1kmpFRvyM9eh5rmpl+so7Q
 BOI1cNr8WTtNSt9LPwTNe/JC5HZZShD83Vp0qN4ZQz74bhb+E3OrJoUv4Au7hqsgyjM7i3H/7CYfssGJ9esq5I4/UqYmk+WgrtPo36Xhp+udKRvJ+AJYTkoh
 Kz2iGbkS/aL3eMpSVhR3f3jgz5qqcXmNX3C901lQAsg7Pw==
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61ec4ac7
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=DghFqjY3_ZEA:10 a=FBHGMhGWAAAA:8 a=t3h-8DwepNj2SFmvIFAA:9 a=CjuIK1q_8ugA:10
 a=MT9cF_eFEDWFK0Py4Y4A:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61E5E7EC0077E7E2; Sat, 22 Jan 2022 13:19:51 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id BAD12220116; Sat, 22 Jan 2022 18:19:49 +0000 (UTC)
Date:   Sat, 22 Jan 2022 18:19:49 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH v2] parisc: Drop __init from map_pages declaration
Message-ID: <YexKxTIx/kOCHxCv@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Psw4O43/efSB3dBz"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Psw4O43/efSB3dBz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

With huge kernel pages, we randomly eat a SPARC in map_pages(). This
is fixed by dropping __init from the declaration.

However, map_pages references the __init routine memblock_alloc_try_nid
via memblock_alloc.  Thus, it needs to be marked with __ref.

memblock_alloc is only called before the kernel text is set to readonly.
In v2, I added BUG_ON statements to ensure memblock_alloc is not called
when init memory is being freed.

The __ref on free_initmem is no longer needed.

Comment regarding map_pages being in the init section is removed.
=20
Signed-off-by: John David Anglin <dave.anglin@bell.net>
---
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 1ae31db9988f..454c7618ab38 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -337,9 +337,9 @@ static void __init setup_bootmem(void)
=20
 static bool kernel_set_to_readonly;
=20
-static void __init map_pages(unsigned long start_vaddr,
-			     unsigned long start_paddr, unsigned long size,
-			     pgprot_t pgprot, int force)
+static void __ref map_pages(unsigned long start_vaddr,
+			    unsigned long start_paddr, unsigned long size,
+			    pgprot_t pgprot, int force)
 {
 	pmd_t *pmd;
 	pte_t *pg_table;
@@ -374,6 +374,7 @@ static void __init map_pages(unsigned long start_vaddr,
=20
 #if CONFIG_PGTABLE_LEVELS =3D=3D 3
 		if (pud_none(*pud)) {
+			BUG_ON(kernel_set_to_readonly);
 			pmd =3D memblock_alloc(PAGE_SIZE << PMD_TABLE_ORDER,
 					     PAGE_SIZE << PMD_TABLE_ORDER);
 			if (!pmd)
@@ -385,6 +386,7 @@ static void __init map_pages(unsigned long start_vaddr,
 		pmd =3D pmd_offset(pud, vaddr);
 		for (tmp1 =3D start_pmd; tmp1 < PTRS_PER_PMD; tmp1++, pmd++) {
 			if (pmd_none(*pmd)) {
+				BUG_ON(kernel_set_to_readonly);
 				pg_table =3D memblock_alloc(PAGE_SIZE, PAGE_SIZE);
 				if (!pg_table)
 					panic("page table allocation failed\n");
@@ -449,7 +451,7 @@ void __init set_kernel_text_rw(int enable_read_write)
 	flush_tlb_all();
 }
=20
-void __ref free_initmem(void)
+void free_initmem(void)
 {
 	unsigned long init_begin =3D (unsigned long)__init_begin;
 	unsigned long init_end =3D (unsigned long)__init_end;
@@ -463,7 +465,6 @@ void __ref free_initmem(void)
 	/* The init text pages are marked R-X.  We have to
 	 * flush the icache and mark them RW-
 	 *
-	 * This is tricky, because map_pages is in the init section.
 	 * Do a dummy remap of the data section first (the data
 	 * section is already PAGE_KERNEL) to pull in the TLB entries
 	 * for map_kernel */

--Psw4O43/efSB3dBz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmHsSrkACgkQXb/Nrl8Z
TfGhWA/7Bo4iLi/JzcCsk5eIeJRzbxSG1CXCXuyDUFpTVSpPAfBIHfcMjsCRhslE
8iaY9rva4yBG7skh9376FPkmBiGPJJU9+atrEcSUjlZ8Xm07zjoN5NwMQvUcjkbT
ZzdkPLiUNKf6iqZXJyTH3u1iLn2mNL9CsjbtRSFnNO5Mtf8S8OUDhMlSQx78lr51
fX7vaxESVRgH51i8ZemNkAYk//VaP6bcfWb8mjy+oKuj0DGE22i2JK80wcNtaMbx
MpJE5AqMK5pmWLki1Cd0hksDqKnumq6VT37uThSde0A3w7R+SRUgL/fpnevT6SiP
AsAONIXm/btDydzLgyk7hZw5XNMBTy1tLDw7UuR2VC5e3MAVCI/P6TVZpKg1cgJM
VUg7CULGG72HU22H7sXeyK59j+9EIpJEAt1efFWnexRaaXi0DtQNzjfzlMbMG9Fq
0LufweeIOJ3yBHiXbnOLJjwg4MjzQuVWImhFDC6xmy/BUnRU5Yc8GieoqyZsXph0
AXMvbpcd4qVtnAtFi1JcUW/cvGz1b5KYKP8HH1VIZnqfJF1eT27toNAwsxmpv7mS
1U4opyiHEvoSIFniq7eQd+ZVkzQ7v5SXysd2vfc67/C14jc1TXKi5gmzebU1c3RY
qpaApaDwIwgvkGOK/eYFngAKGwEG7TkXxW1GGin3jpXNPqxafZM=
=/LKT
-----END PGP SIGNATURE-----

--Psw4O43/efSB3dBz--

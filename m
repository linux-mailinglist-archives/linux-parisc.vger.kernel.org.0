Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D862A4D677D
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Mar 2022 18:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbiCKRYU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 11 Mar 2022 12:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbiCKRYT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 11 Mar 2022 12:24:19 -0500
Received: from cmx-torrgo002.bell.net (mta-tor-003.bell.net [209.71.212.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9280F17583C
        for <linux-parisc@vger.kernel.org>; Fri, 11 Mar 2022 09:23:14 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 621B302201902389
X-CM-Envelope: MS4xfGRoxFTha/0o2E6OzK3pQi+FDFs7PZnAAcHtsm324Dg8OD9nWqF6JehAr7b37zh1vV43h5bb+KRxYojPhuhotjI2GySKmu1jMSRBnDU5Bdnjhe282HbV
 HcrhI9hhW572kP4TYu/2q6ygC5WNzJ8NFTaf5x5a3A+/i4lEeVjvwD1TcGilwNGId4W3KGMJ5W9wQqcdEwgq9yNe66LwYMEz6jEHOd/IthOvnOch613iLjJV
 EMTaBmsdXH71rV/qGs/VkmnRvsXYu2qRM+kH35wDXjwPWC548OB3D9zMnXB3jzkyGOz/fAHSyhoaJVETBHNHCtFzNP8BWFINxW1SUMNYuFcfgIHOfkRU3Rg8
 uI8f0/IGxIOLE4+GsLT2LOyQntQ8Ev58cy0a6xl61caKprT52L/MmsZ2f0wQq5JtvD6JMxvno8fdTmj7831i+qxhjg2+iB4WBbCX2YMEiKuXfSO1i7Z6J0vv
 furmBnoKMUwA6yUkwBlkc3olsNZS8qivNl86Uwy7008O5f/4kPcpU/Q1SjAM/qsZc1T5j8L0EBvjf2FOr7kKMJZ0KRImLLtnjbTR++a2JXTGnnmy6260yTx/
 UoUO2oBz4Cy6TskeZ3l/CitXA6YnVrmiUvgfsODO8eTVFg==
X-CM-Analysis: v=2.4 cv=G99/r/o5 c=1 sm=1 tr=0 ts=622b856f
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=09Z3r5wWumTcMglGAEoA:9 a=CjuIK1q_8ugA:10
 a=P0Oa5fZYFp60OIx1HroA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 621B302201902389; Fri, 11 Mar 2022 12:22:55 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id BE145220116; Fri, 11 Mar 2022 17:22:54 +0000 (UTC)
Date:   Fri, 11 Mar 2022 17:22:54 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH V2] parisc: Fix non-access data TLB cache flush faults
Message-ID: <YiuFbh1OUxn+cgnI@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r+iy+X6bd4MCUd6y"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--r+iy+X6bd4MCUd6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When a page is not present, we get non-access data TLB faults from
the fdc and fic instructions in flush_user_dcache_range_asm and
flush_user_icache_range_asm. When these occur, the cache line is
not invalidated and potentially we get memory corruption. The
problem was hidden by the nullification of the flush instructions.

These faults also affect performance. With pa8800/pa8900 processors,
there will be 32 faults per 4 KB page since the cache line is 128
bytes.  There will be more faults with earlier processors.

The problem is fixed by using flush_cache_pages(). It does the flush
using a tmp alias mapping.

The flush_cache_pages() call in flush_cache_range() flushed too
large a range.

V2: Remove unnecessary preempt_disable() and preempt_enable() calls.
=20
Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 94150b91c96f..55b83261b5bd 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -558,15 +571,6 @@ static void flush_cache_pages(struct vm_area_struct *v=
ma, struct mm_struct *mm,
 	}
 }
=20
-static void flush_user_cache_tlb(struct vm_area_struct *vma,
-				 unsigned long start, unsigned long end)
-{
-	flush_user_dcache_range_asm(start, end);
-	if (vma->vm_flags & VM_EXEC)
-		flush_user_icache_range_asm(start, end);
-	flush_tlb_range(vma, start, end);
-}
-
 void flush_cache_mm(struct mm_struct *mm)
 {
 	struct vm_area_struct *vma;
@@ -581,17 +585,8 @@ void flush_cache_mm(struct mm_struct *mm)
 		return;
 	}
=20
-	preempt_disable();
-	if (mm->context =3D=3D mfsp(3)) {
-		for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
-			flush_user_cache_tlb(vma, vma->vm_start, vma->vm_end);
-		preempt_enable();
-		return;
-	}
-
 	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
 		flush_cache_pages(vma, mm, vma->vm_start, vma->vm_end);
-	preempt_enable();
 }
=20
 void flush_cache_range(struct vm_area_struct *vma,
@@ -605,15 +600,7 @@ void flush_cache_range(struct vm_area_struct *vma,
 		return;
 	}
=20
-	preempt_disable();
-	if (vma->vm_mm->context =3D=3D mfsp(3)) {
-		flush_user_cache_tlb(vma, start, end);
-		preempt_enable();
-		return;
-	}
-
-	flush_cache_pages(vma, vma->vm_mm, vma->vm_start, vma->vm_end);
-	preempt_enable();
+	flush_cache_pages(vma, vma->vm_mm, start, end);
 }
=20
 void

--r+iy+X6bd4MCUd6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmIrhWYACgkQXb/Nrl8Z
TfGywA/9Ef5p0Mefrou7wUxotbBYBicm7ZLmeG47XEzRj+9AcyQzad1H3YU36hA7
QcRNtAo6DC3nz3SxonZ2kOImJBmGgazL/GT3BUsxF6fEawXcEtY7Hwi6VSfO1W1I
3cx1FLI/pdrOoC2Y8iQy4464mLgneOAiLxMgtLBsjOlHcIrutKPRXK0E4KJEB90T
tams0jlNaB0haVGvGnfQu5TikCQL+Lcs6lQg9xX3ecBKIz7b+/KIeSrH8UR6BJcc
hWUImSVVyTsBkUaCVWdzU08s0hoI5997K7ehcKZ+z2NaVHXQaP9ZcIwTZKcDXdfc
qvpWZrMXKVBW7u50yonm66E0qCYyU4Y6AmckXU4loCnzFenbWof6XT0LCJbsJq6W
pcTxLZADdLKN0uy0snvA/3iBcbFi5qIiW1wIkiAhZot8GuTlcOy7z8vnPv2KbTnI
dpOwoKEJc5IiPin87fDFqbi2e5MD4yhom5cfWHMXMdJc+MhEjsn4yC9fP4ddYgqc
bpU196OKYLHUkyX1Ef2uDLu0ErbBhQavSrtCjfY/TP1zeUysiVNHW8QhQemK+LNZ
sscSxJ885vioVi49DAZ7yPrVon5eUQcFAFaqAlEo5QCNAKW/ddWsUShEhVUyl32N
SeE8PBzJuTEG7q4o1c4r8ADYgcRJh/+jmuXkRz60jy0zQyWjSwQ=
=ZpT+
-----END PGP SIGNATURE-----

--r+iy+X6bd4MCUd6y--

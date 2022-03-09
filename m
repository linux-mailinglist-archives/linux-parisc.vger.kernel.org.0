Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2454D3954
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Mar 2022 19:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237054AbiCIS7C (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 9 Mar 2022 13:59:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237053AbiCIS7C (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 9 Mar 2022 13:59:02 -0500
Received: from cmx-torrgo002.bell.net (mta-tor-001.bell.net [209.71.212.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D94DF6E36B
        for <linux-parisc@vger.kernel.org>; Wed,  9 Mar 2022 10:58:02 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 621B302201689B02
X-CM-Envelope: MS4xfD8YsllY3LU6pcHne1zXaY0hDJha/sqfx7JobINpMzgOwaiH7AasMIEKgzeeKWm9kUKUvd+DnaRCSNxZoZmkif5XyU+mSW4kNwcseoE7I69n5IrDC5ls
 ZhkS4WcW+9C2ROivYT6svz+eIa+CxptxTLlNFIFq+trb2HbfdEsRqpB9Ycmpmw/Ju2ryNmL26VH82BIoDKXcrq2oE0WimpBnoYZwXs16P/AzBeWNxkWxWyuW
 r44ky2ASWfhlRG8AcLEuPUw9tDeB8r0BalGQWrqNypyNkgBOeiF6gGrHLw9eeTGfax8u8BiRB3emN0PDmPKCSwoBFy6B1nuaCLkeWikoTgb5opD2B6cgqJ4u
 To71sKRIBdWXcjD7ffMskGwY7ny0Yan0VfN7GATMraAcZ9wzVH11OS5wVNJfFcN1qmVZF3RVWUxNDAO5cWu0yLPrkQPzUsZ/+DEY59ElOAZhWMCKTPrV+loH
 hfGKEvvrdBGgqIV37a49PC9Ay9AC56o7TBGkYMspisr303FwaTZjU7rc0zAcGFIZystIdD0MTFM/4gE7V026w6fdHbq31cczxDYCSiz6B21wfgWv+nts/EbN
 ijN65/bdYfREs6oBx41n+wL3IKciTybeVtleR2gAojPKUw==
X-CM-Analysis: v=2.4 cv=G99/r/o5 c=1 sm=1 tr=0 ts=6228f8a8
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=QZozLSPx_OGRL9lEm4oA:9 a=CjuIK1q_8ugA:10
 a=u7UErd8vtoRDAQF8IyoA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 621B302201689B02; Wed, 9 Mar 2022 13:57:44 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 49DA8220115; Wed,  9 Mar 2022 18:57:43 +0000 (UTC)
Date:   Wed, 9 Mar 2022 18:57:42 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Fix non-access data TLB cache flush faults
Message-ID: <Yij4pmK8Yjt7Wh1A@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="900DhIxZwgzZQdLz"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--900DhIxZwgzZQdLz
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
bytes.  The will be more faults with earlier processors.

The problem is fixed by using flush_cache_pages(). It does the flush
using a tmp alias mapping.

The flush_cache_pages() call in flush_cache_range() flushed too
large a range.
=20
Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 94150b91c96f..e439b53b0f62 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -558,15 +558,6 @@ static void flush_cache_pages(struct vm_area_struct *v=
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
@@ -582,13 +573,6 @@ void flush_cache_mm(struct mm_struct *mm)
 	}
=20
 	preempt_disable();
-	if (mm->context =3D=3D mfsp(3)) {
-		for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
-			flush_user_cache_tlb(vma, vma->vm_start, vma->vm_end);
-		preempt_enable();
-		return;
-	}
-
 	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
 		flush_cache_pages(vma, mm, vma->vm_start, vma->vm_end);
 	preempt_enable();
@@ -606,13 +590,7 @@ void flush_cache_range(struct vm_area_struct *vma,
 	}
=20
 	preempt_disable();
-	if (vma->vm_mm->context =3D=3D mfsp(3)) {
-		flush_user_cache_tlb(vma, start, end);
-		preempt_enable();
-		return;
-	}
-
-	flush_cache_pages(vma, vma->vm_mm, vma->vm_start, vma->vm_end);
+	flush_cache_pages(vma, vma->vm_mm, start, end);
 	preempt_enable();
 }
=20

--900DhIxZwgzZQdLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmIo+J8ACgkQXb/Nrl8Z
TfGaBA/9H3m5ix14m3YFoLbxD/lJ09+Cvm9t0h6GrV8L42E7k57qUmwJRaV9EVw4
pD1hYRxDi//j+F3s5WDKP1CB2iUDIit20FWMo47ZRNNqzuI07B9/NCm0Z2rGZYzE
BEL2YGXd1rwjjsjO1ZixTkSZ4m8Yg2iC7qUsAPBG7i9JWdW5yIENXMPVO5pfX60v
vUgJanVT6/SwlIO/e3henQaZc7hMfA/tAbVRjbOxSD26KaPe3opxK94Cp6Nt/qmL
v+GDM2o5A11sgNXLkjnGbkwiwIR10t0It8WrW+hkz/2YCRvvnUioVmo5S2nTtNBx
E+KpwCJxYGZu0ki5Sx6PCSz+Z1u8vJFkXA/04PSEZcsL/1cDRh/NWSWDOsz1erk2
Qs1h9bt3xICAOomjgiOAV+3JbAdYbWrcvUxkPsY7C6TJFuw6evIzpZosojPdzuFf
ToMhbhzRmQGIHen6sxar8y2rK+3aJtnQPr3veVXY+LQrFzLJ2S8FTv9e28Gqi5gd
s9MOcUuPgrMU1zrC/sTlKhxWf7egF0zpD/B94rXjddGuWknbn7vDRCeOZAY+fqWo
Eoz7WOeO6dLjPKcx97SLI/+XnuRc3m0BhtAhH1p6sR6ETxn4u6Df+y67BhzyNsOf
oQnNog2+lQ5cNVVlw6TgZOQasUKSd7wqpqb0rzGDQ3a2t6272yc=
=bRq9
-----END PGP SIGNATURE-----

--900DhIxZwgzZQdLz--

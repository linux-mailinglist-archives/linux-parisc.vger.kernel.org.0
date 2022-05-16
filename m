Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5B45288EC
	for <lists+linux-parisc@lfdr.de>; Mon, 16 May 2022 17:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245175AbiEPPcW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 May 2022 11:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245358AbiEPPcS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 May 2022 11:32:18 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-003.bell.net [209.71.208.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 290F41CFC3
        for <linux-parisc@vger.kernel.org>; Mon, 16 May 2022 08:32:17 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 627B9EAF010B432F
X-CM-Envelope: MS4xfEkb0I/M+4xn+09xrvxspck4mvdQJl7BE1APDC7pY4NYxBkSqCyxgT4WOcIkP01b/lpnYIjvoIBOGvLYkPS6rJUoYlk4sQRvpyErQ0/ko5gC7rE46bqU
 V8hbmr+I+CvWF3ObfR80KgCkHkiXmF5Ak+LHLT3iAnvVMpCvFNZPkau1dTmnPnMDDe0iztbXv/qDfpZa5O4g1Z7nrANQk+AAGF8R1vXg2h3z5hbFx8slG4hd
 EPRuHO68qQWYuc/I4OqF8QTtftglwwFS8o/71mVI0DLzVXvErE7nX2V5rRATEo8E2R1GivQCkeB7HFE6ykvuhNvprO700XXah87PO42cLqwAJAvIw8EyfPH/
 aIzWiV9N4FO6P8C/JkzxxPircPUP3i/I+LAOnWuZQNiTEY8ff6NpE2On8nzFXnummAQnSORizt04UyU+/3MPQLpt7wQzh6gzWkto48P8vC3sY/KwvXYQbe0n
 XDTFDkm2kS890mK4pmR+QhmrZwF9urDmgtTcR659+D/2N08RXLryVpvRaS0u3qmSLbG10BXXYeKHDN+PgzOKnARqDUUI1Tqbnkt0Mmw8quGbbyyRTgpR1ibo
 Mc2f0z3ahpj8+CIgfli/94s9vVeUxGSe6LaZFV2H3s8BnQ==
X-CM-Analysis: v=2.4 cv=aKWTFZxm c=1 sm=1 tr=0 ts=62826e72
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=oZkIemNP1mAA:10 a=FBHGMhGWAAAA:8 a=Nk2dSr2Pk589_36mt_kA:9 a=CjuIK1q_8ugA:10
 a=lYunwYPgJkivqHgAo2sA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 627B9EAF010B432F; Mon, 16 May 2022 11:32:02 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id A4B2F220115; Mon, 16 May 2022 15:32:00 +0000 (UTC)
Date:   Mon, 16 May 2022 15:32:00 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH, resend] parisc: Fix patch code locking and flushing
Message-ID: <YoJucETadOQh4knf@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2Seqj9gfhcDwHBCp"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--2Seqj9gfhcDwHBCp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This change fixes the following:

1) The flags variable is not initialized. Always use raw_spin_lock_irqsave
and raw_spin_unlock_irqrestore to serialize patching.

2) flush_kernel_vmap_range is primarily intended for DMA flushes.
The whole cache flush in flush_kernel_vmap_range is only possible
when interrupts are enabled on SMP machines. Since __patch_text_multiple
calls flush_kernel_vmap_range with interrupts disabled, it is better
to directly call flush_kernel_dcache_range_asm and
flush_kernel_icache_range_asm.

3) The final call to flush_icache_range is unnecessary.

Tested with `[PATCH, V3] parisc: Rewrite cache flush code for
PA8800/PA8900' change on rp3440, c8000 and c3750 (32 and 64-bit).

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
index 80a0ab372802..e59574f65e64 100644
--- a/arch/parisc/kernel/patch.c
+++ b/arch/parisc/kernel/patch.c
@@ -40,10 +40,7 @@ static void __kprobes *patch_map(void *addr, int fixmap,=
 unsigned long *flags,
=20
 	*need_unmap =3D 1;
 	set_fixmap(fixmap, page_to_phys(page));
-	if (flags)
-		raw_spin_lock_irqsave(&patch_lock, *flags);
-	else
-		__acquire(&patch_lock);
+	raw_spin_lock_irqsave(&patch_lock, *flags);
=20
 	return (void *) (__fix_to_virt(fixmap) + (uintaddr & ~PAGE_MASK));
 }
@@ -52,10 +49,7 @@ static void __kprobes patch_unmap(int fixmap, unsigned l=
ong *flags)
 {
 	clear_fixmap(fixmap);
=20
-	if (flags)
-		raw_spin_unlock_irqrestore(&patch_lock, *flags);
-	else
-		__release(&patch_lock);
+	raw_spin_unlock_irqrestore(&patch_lock, *flags);
 }
=20
 void __kprobes __patch_text_multiple(void *addr, u32 *insn, unsigned int l=
en)
@@ -67,8 +61,9 @@ void __kprobes __patch_text_multiple(void *addr, u32 *ins=
n, unsigned int len)
 	int mapped;
=20
 	/* Make sure we don't have any aliases in cache */
-	flush_kernel_vmap_range(addr, len);
-	flush_icache_range(start, end);
+	flush_kernel_dcache_range_asm(start, end);
+	flush_kernel_icache_range_asm(start, end);
+	flush_tlb_kernel_range(start, end);
=20
 	p =3D fixmap =3D patch_map(addr, FIX_TEXT_POKE0, &flags, &mapped);
=20
@@ -81,8 +76,10 @@ void __kprobes __patch_text_multiple(void *addr, u32 *in=
sn, unsigned int len)
 			 * We're crossing a page boundary, so
 			 * need to remap
 			 */
-			flush_kernel_vmap_range((void *)fixmap,
-						(p-fixmap) * sizeof(*p));
+			flush_kernel_dcache_range_asm((unsigned long)fixmap,
+						      (unsigned long)p);
+			flush_tlb_kernel_range((unsigned long)fixmap,
+					       (unsigned long)p);
 			if (mapped)
 				patch_unmap(FIX_TEXT_POKE0, &flags);
 			p =3D fixmap =3D patch_map(addr, FIX_TEXT_POKE0, &flags,
@@ -90,10 +87,10 @@ void __kprobes __patch_text_multiple(void *addr, u32 *i=
nsn, unsigned int len)
 		}
 	}
=20
-	flush_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
+	flush_kernel_dcache_range_asm((unsigned long)fixmap, (unsigned long)p);
+	flush_tlb_kernel_range((unsigned long)fixmap, (unsigned long)p);
 	if (mapped)
 		patch_unmap(FIX_TEXT_POKE0, &flags);
-	flush_icache_range(start, end);
 }
=20
 void __kprobes __patch_text(void *addr, u32 insn)

--2Seqj9gfhcDwHBCp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmKCbmkACgkQXb/Nrl8Z
TfF6Ww/+KG/1OxMkBYo7fEE2rITjihNVQoACRpaNvcRcsY5D9Gm94PXcS6jKle9w
X4ISWR/oETn9fkb07xCQpLseGR+UgtG8FyGC1pyj/5unxoE3E5vyOkvBN+6OXr/r
s0xjWZm9vTGKE29B/owBCZGGY4SPuW0NUEGGyTzDwask0r1oQlszsX8BPcH3Bg8+
3fs+R0mdtxRr6iA/qWJBeay92yr6H25LrBb75svFSnK4iB2OUPM+OXxk4dBIh+2R
ij7Y9vtvyimrrIXmXgc3rngKth4S6jiAQJBzvAf1S8tsMpuVHohFCamz3Z0IJ/8x
F6RRz/qroyoqwxSAs+bU6JTESwUQ+ke6YtDVIqMOrT7m4RljZlPZOAQqXzcQDgtQ
pFgbAUaniXkUpeE5O/vx6dWE1se2bJot2s2OrWgv5qfTo9NMNxxgbOFkJ9FMd2KY
54gZ1KLcMKMoxBhQVpzqYdyAEdguoxp+B+4wBeu5I1lIkWo29mlx//zoppszw2d4
OWukyFW+yjE0EW1u31eEMkwPRH4iDA/xIoS3dHEFBRb8NscS7VP7V7Xcsa0c/tI3
DsDDjB1e8USN8K1vmkYxfcblBKFpe43Hn8jUyY6JdL8LeN/JycrdRISEaZrjSS8G
8Dxtb98Z5u8y9otHJfMeLnxKc572ElK5wLGkjfX6RafOqE8x1Lc=
=1U6t
-----END PGP SIGNATURE-----

--2Seqj9gfhcDwHBCp--

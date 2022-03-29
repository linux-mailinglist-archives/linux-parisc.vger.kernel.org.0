Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2B7E4EB3BC
	for <lists+linux-parisc@lfdr.de>; Tue, 29 Mar 2022 20:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239585AbiC2S4a (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 29 Mar 2022 14:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237828AbiC2S43 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 29 Mar 2022 14:56:29 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 95F5622E953
        for <linux-parisc@vger.kernel.org>; Tue, 29 Mar 2022 11:54:45 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6243254D0005D102
X-CM-Envelope: MS4xfBllL5ENdj3dX0GR9RQ383zqxCETF66gPrNeYcPx+XCDfQLXlS5VH2mOXkAndvArpuIVVChsaWwv0eAk1/L/PnJCuL8iBVsIMyxeFYUNGGy/OHRD9H9x
 2ZKL83gHj2OGxthEZMGJcRstSSpyXQraYVUx0L+B3LEHUNBEoFvLl1o8HLoZ0Yej5asK8yC9ICyC3o0MMzGsbgUDf06BqWFHZDBKo0vz7KEc1GG0kQ/bymPd
 UVCsA0DtDmpJbCi6ybvWkmnUsZ0eb2N1xoohR6mJcwPAAJkY084vx4gvwhd4oqCfAGD4AEbeLFHL71KMMWo1Nl76pkz5I1KKGbRy5iBrcvjL5Q9gWoDZrjso
 96PRyzc6HUH42mZ5w255f5/UchIyMsFQrkyK7O8FLnk9jYHv44CUxxzfJEysFOuufAeBtWHVXgJJXSYY1nBluZQKMME/sd2g0w8OiNeXt+TVO2/GmOAjHT6u
 BGfGrvZssdgSoBHGWvhXYq4NJeJVEEs1oJfg/hIY8asKx2dO0MIxj8dD9dJ7n1q1n8z+zwIzrYXeV78w00FvPilpCqdHQLsjwPG5uJOWJTQf3yW0s90LtQIG
 v+cy/p3qsf5qV+Sf0X8aRYHPr2YUsSAQKZij256bcJ7D+w==
X-CM-Analysis: v=2.4 cv=G99/r/o5 c=1 sm=1 tr=0 ts=624355ed
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=Fe-wxvhmr2ytpZrFxScA:9 a=CjuIK1q_8ugA:10
 a=LX2NGLxKwRSNBg788TcA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6243254D0005D102; Tue, 29 Mar 2022 14:54:37 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 1D431220115; Tue, 29 Mar 2022 18:54:36 +0000 (UTC)
Date:   Tue, 29 Mar 2022 18:54:36 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Fix patch code locking and flushing
Message-ID: <YkNV7FZMUsvlPiRe@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="j4827DxhtXJW81e+"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--j4827DxhtXJW81e+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This change fixes the following:

1) The flags variable is not initialized. Always use raw_spin_lock_irqsave
and raw_spin_unlock_irqrestore to serialize patching.

2) flush_kernel_vmap_range is primarily intended for DMA flushes. Since
__patch_text_multiple is often called with interrupts disabled, it is
better to directly call flush_kernel_dcache_range_asm and
flush_kernel_icache_range_asm. This avoids an extra call.

3) The final call to flush_icache_range is unnecessary.

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

--j4827DxhtXJW81e+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmJDVeUACgkQXb/Nrl8Z
TfGLbQ//XyJoB2e4QUvyYpOT5Cev+QIUt/s2ZeHu/coDqz6xLnjW2YUAVuyTpjSY
Fbqz8efzniWNMWeMUonOMI1iDy5GKm08RzQvc1dYza1W1HgTTknZR4QRMud0n3pF
kc9gFVr7PzMTjT1zkv/b+2eR2IecnhSD9D/3Cfitm+EKk7p0pteQiPPyOcOc1iSs
aa7SFaUKeCuduDy4gVp3u0iWvFSOBy7oajuH3qRCoeKEzkn7dUZ38JcUJSJBlhut
fYqqLkB2H/AA1OSLQO6WiEV75LRDWepGrJ4R+ulkwr85vBekgal9CyE0S8fymBNK
965papiKxLhv3nr6IJi2SPsIwMkqv9OxyM+8hDYOn/2i0hsBRgkn5SXpmL4Omdn+
xKZ6qDQUDYibRAiT/tK5zM+tVdJBEYsQf1p/ETD/+4xtJkEmFnzwmJFbZAxIzgGZ
HHmIC3r72wzmEkcWMNAw2OPsxgHufIzxq6IuwE0VgMW2qCKkIzSgJf/9PHwscqq4
iLgSZzSsqyZZjkcbbD1cEc8yjoRLPBTQk/0g/BjtKJuVz0cfh8+yGXmiWBwjJV4+
/RhZQtWcAAvVZKup2Cm/UIjybXn5M2ecLDVcQhMwUZ+JAJmOLLmgemRbmuOaLnad
EGmIDmU2LuQPM0n/Rqxk8nuJBs9BQUrKpcYMW00DHEq0KOTtwUo=
=CQ8r
-----END PGP SIGNATURE-----

--j4827DxhtXJW81e+--

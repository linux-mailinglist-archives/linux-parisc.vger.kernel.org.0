Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBDF24EC748
	for <lists+linux-parisc@lfdr.de>; Wed, 30 Mar 2022 16:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347306AbiC3OwJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 30 Mar 2022 10:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347335AbiC3OwH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:52:07 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-002.bell.net [209.71.212.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 672754925A
        for <linux-parisc@vger.kernel.org>; Wed, 30 Mar 2022 07:50:19 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6243254D001A98F7
X-CM-Envelope: MS4xfKx8NLN/vGmdja8UPnP5wD84gt6EL7BcKPYYzRkDv55YiYklMbvWis6f3lI29zCUQFWwwpZPrDid2UUnhKUv3J5ldNfokxtqgRpdoDEDVr6whzl6BS7f
 2u85Dh2hRsLvYn5puQVRhLWdrM9qUziwoturLi6QviWDG7ZyQlbyeqxiQnOoBVw1ifPOVcyilXYsJ+mIQqj9DAU4GWNZ2VnTEsqF4+NJYEqnSLDDQc+dC6Wu
 YKSY8tuaUjRxx8TN+R6jIJjSkbT3xXNtJxr5ECvRYiUbQpvlPy3zk60vdcqQHN/oldBuiVHfThLADl9GQTG0x2mCpXSQsrFhK6Nm+qvNf0Wbbh+YRi1RcUcO
 y/lw+yPologkewJGRQi+Ky4/HUYqbxa/iy9DBdE+UFwzCiU1ul9YnWDc8OaZdxHHgZmlCxBNCddjhGegTTrEwPGv3+lUYEo4EWUTtpn63HsfkvhnYclpFd2N
 5LvYGX/3xL3u56sEdt7j6PMfJ769AYsdeeiIVQjmHP55yV6hqdV+ESoC/ZY4YGLhlPThrlWCrFyCtEOek9Toa1htwwEmoIjwAMORdS9ogQ4npVITIqUbtTI9
 OiGEgWztBkObKf68o6Go/TEeDAggqAsxzAVtxZ5e0T2O9w==
X-CM-Analysis: v=2.4 cv=G99/r/o5 c=1 sm=1 tr=0 ts=62446c57
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=pwD9VVs-Zs8JKL4LVKUA:9 a=CjuIK1q_8ugA:10
 a=96wnEI4cIE8GtJseiSoA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6243254D001A98F7; Wed, 30 Mar 2022 10:42:31 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 7E5C7220116; Wed, 30 Mar 2022 14:42:30 +0000 (UTC)
Date:   Wed, 30 Mar 2022 14:42:30 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Don't enforce DMA completion order in cache flushes
Message-ID: <YkRsVukdryZ2isYA@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="W8TQcDmBNHPs11YM"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--W8TQcDmBNHPs11YM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The only place we need to ensure all outstanding cache coherence
operations are complete is in invalidate_kernel_vmap_range. All
parisc drivers synchronize DMA operations internally and do not
call invalidate_kernel_vmap_range. We only need this for non-coherent
I/O operations.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cach=
e.h
index 5032e758594e..e23d06b51a20 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -54,6 +54,7 @@ void parisc_setup_cache_timing(void);
 #define asm_io_sync()	asm volatile("sync" \
 			ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
 			ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) :::"memory")
+#define asm_syncdma()	asm volatile("syncdma" :::"memory")
=20
 #endif /* ! __ASSEMBLY__ */
=20
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 533c5643c3fe..7eb3467a0432 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -642,6 +642,9 @@ void invalidate_kernel_vmap_range(void *vaddr, int size)
 	unsigned long start =3D (unsigned long)vaddr;
 	unsigned long end =3D start + size;
=20
+	/* Ensure DMA is complete */
+	asm_syncdma();
+
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    (unsigned long)size >=3D parisc_cache_flush_threshold) {
 		flush_tlb_kernel_range(start, end);
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index b4c3f01e2399..8569141e3e67 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -300,7 +300,6 @@ fdoneloop2:
 	fdce,m		%arg1(%sr1, %arg0)	/* Fdce for one loop */
=20
 fdsync:
-	syncdma
 	sync
 	mtsm		%r22			/* restore I-bit */
 89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
@@ -1098,7 +1097,6 @@ ENTRY_CFI(flush_kernel_dcache_range_asm)
=20
 	sync
 89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
-	syncdma
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_kernel_dcache_range_asm)
@@ -1140,7 +1138,6 @@ ENTRY_CFI(purge_kernel_dcache_range_asm)
=20
 	sync
 89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
-	syncdma
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(purge_kernel_dcache_range_asm)


--W8TQcDmBNHPs11YM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmJEbFUACgkQXb/Nrl8Z
TfEfDhAAo28GHDACm+N/TvSa49LSTszaAcMPsjnMmXTWEt1Gku250JfPFYB5wswX
2qSNqrw1k8BaqVGnSkYOrWLGSAgyc/wbMoIQiEdhHaBbJ74C47TYhNAC55x5rxEr
Ih78r1fg9VJFE2dr00ufLzCkOxUFA+fZxGBNsSA2xwRergpJspAb5vli9oKonGdk
w7sX5pIJqoETGTf4mWn9z4fDLbDl4sGrydGmwK9d4+H4obX0QgHeA3hs4QoY8Gfj
Lu5vRB2iGSUejqpkgRjf9OlFp1sDF0V0gxdIVsV/k0gCoZ5RAcmyG6g/qBmRK7ag
0Vu4IibJTWsJxql9/wB0/4KZ0Ch2eQ6nsteaAm2JGNPIK+rWw6pSl2fxQ7BH1kIM
4MxzrGa7xlKZgWk7sCdio+uvUIqSlmkwNFjmnC7WQ6RsyjHNc1dCbaxkwT/ohFhV
tuByNXtKjl8ZjFQlfH3YbxscQDIYiOtqczsUmF28bjq/8PmdZ85yLb4BzO2b4jsr
bGVnko5h1d/2K9SevrNB2nzGXSCVyKBZvUBJ9xIaXFo8mSuW2pcU5Jsr+NwXgPV0
q5XWj84FS7EJJSOqvF0L/nGfRv/GsRExsQnfKzZIO6Inou5WWYy/bcQgJHXhFb4e
Jk916Qwkd2K3i2uyqFv20K2iD5xvrXJuM9FOW/ZijyfitEjCg2Y=
=Uf5w
-----END PGP SIGNATURE-----

--W8TQcDmBNHPs11YM--

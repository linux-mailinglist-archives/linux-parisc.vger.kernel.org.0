Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3401F4DEA1F
	for <lists+linux-parisc@lfdr.de>; Sat, 19 Mar 2022 19:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbiCSSdw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 19 Mar 2022 14:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243914AbiCSSdw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 19 Mar 2022 14:33:52 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1C53E2986E4
        for <linux-parisc@vger.kernel.org>; Sat, 19 Mar 2022 11:32:30 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 621D9CE90223DE7D
X-CM-Envelope: MS4xfCwiulEylI4fF4Jm5Z46wc6uBWlPmDzMyEO2+sNYcuHbDHsD7L4cCX6lcm7qYXK6WiiR0rLUCVZ9yQeKt41laxOghYrEHbkl0FwlJQkHh1Nerlu3vgez
 G3NCOvB+JxRqc9ek56xAnhw6gBn2v+LjKjomSFW6EYjeKz4YlFER6N/Tsh0I4+szXxdEtpotFxQQMxGD5KtuGh2vFHSvfU5ubsMvCbHDJ7hRChggX/7zwcN2
 E1YHJb+Pbh/Ifz5Vuz4x36FTwScGrVbR6v4kCUbnt84=
X-CM-Analysis: v=2.4 cv=aKWTFZxm c=1 sm=1 tr=0 ts=623621bc
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=8L605btn6AFxFWT6bJQA:9 a=CjuIK1q_8ugA:10
 a=WTCC5yyBUKLpJdeAgWIA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 621D9CE90223DE7D for linux-parisc@vger.kernel.org; Sat, 19 Mar 2022 14:32:28 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 2EC41220115; Sat, 19 Mar 2022 18:32:28 +0000 (UTC)
Date:   Sat, 19 Mar 2022 18:32:27 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH v2] parisc: Fix invalidate/flush vmap routines
Message-ID: <YjYhu2/7qA/pV2Ub@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TgfbZ/CkXt4NV41x"
Content-Disposition: inline
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--TgfbZ/CkXt4NV41x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Cache move-in for virtual accesses is controlled by the TLB.  Thus,
we must generally purge TLB entries before flushing.  The flush routines
must use TLB entries that inhibit cache move-in.

V2: Load physical address prior to flushing TLB.  In flush_cache_page,
flush TLB when flushing and purging.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 231cebb3fc0d..5b11b350397e 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -607,8 +607,8 @@ void
 flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigne=
d long pfn)
 {
 	if (pfn_valid(pfn)) {
+		flush_tlb_page(vma, vmaddr);
 		if (likely(vma->vm_mm->context.space_id)) {
-			flush_tlb_page(vma, vmaddr);
 			__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
 		} else {
 			__purge_cache_page(vma, vmaddr, PFN_PHYS(pfn));
@@ -620,6 +620,7 @@ void flush_kernel_vmap_range(void *vaddr, int size)
 {
 	unsigned long start =3D (unsigned long)vaddr;
 	unsigned long end =3D start + size;
+	unsigned long flags, physaddr;
=20
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    (unsigned long)size >=3D parisc_cache_flush_threshold) {
@@ -628,8 +629,14 @@ void flush_kernel_vmap_range(void *vaddr, int size)
 		return;
 	}
=20
-	flush_kernel_dcache_range_asm(start, end);
-	flush_tlb_kernel_range(start, end);
+	while (start <=3D end) {
+		physaddr =3D lpa(start);
+		purge_tlb_start(flags);
+		pdtlb(SR_KERNEL, start);
+		purge_tlb_end(flags);
+		flush_dcache_page_asm(physaddr, start);
+		start +=3D PAGE_SIZE;
+	}
 }
 EXPORT_SYMBOL(flush_kernel_vmap_range);
=20
@@ -637,6 +644,7 @@ void invalidate_kernel_vmap_range(void *vaddr, int size)
 {
 	unsigned long start =3D (unsigned long)vaddr;
 	unsigned long end =3D start + size;
+	unsigned long flags, physaddr;
=20
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    (unsigned long)size >=3D parisc_cache_flush_threshold) {
@@ -645,7 +653,13 @@ void invalidate_kernel_vmap_range(void *vaddr, int siz=
e)
 		return;
 	}
=20
-	purge_kernel_dcache_range_asm(start, end);
-	flush_tlb_kernel_range(start, end);
+	while (start <=3D end) {
+		physaddr =3D lpa(start);
+		purge_tlb_start(flags);
+		pdtlb(SR_KERNEL, start);
+		purge_tlb_end(flags);
+		purge_dcache_page_asm(physaddr, start);
+		start +=3D PAGE_SIZE;
+	}
 }
 EXPORT_SYMBOL(invalidate_kernel_vmap_range);

--TgfbZ/CkXt4NV41x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmI2IbQACgkQXb/Nrl8Z
TfEctRAAmK+6ov3HFMwtvE7r4ND/cL7+dxbNr66Zz8WXCaxfrpsqBocdsjZ103sr
/CMXjr8EclFRR0r2Xbt/KpAHs+VjIDKrjfQIsJnlI/SGBg/yYJEewJHRj6ezKUOe
b5YdfdQSNY+uImj9T8JE/5RulWZ/OAIgO2+uEJmqqmk0evT1oSmzrTQOnlmtqIlm
N8HTNC3tLvaBHWwEDXDpShWVs3sGaA/kHrpU3sZorUxhVmxgVxWEV84ScNYIYg4O
pssqTC2G489ts9GS1ZZkh8z0cNW9zRTMMSSDkQr12MaknjQJkVoiee9QKyYhKIOk
k9LkBLW79HsZ/Qdw1YqbwbIjWJkfQzspmirPnB4c/zZoi7U43ANG7duHU0/0dr27
mJEbxxE1gLtWnAfhpOJOSyq8bDYbJL+av10syeXKTN6lDPpJGrjj3oHoAQ8JWv84
uRpRpyz61j6JEa1VdV3VYpJmT3pCnW6bGr1uH4WKHinXzS6S9mxGVLrtCwp5cBQJ
G25QnmqUZalfHEXGiG2vTO/t2hupxyBKolW8aai33oSkXtQk1tNuvXR9l7/+kG9F
iOpN+yJ6v0hOlldzsbGUvRsNkW4vxcHfqotdUPQhkcFQ8UBRErGnImSw/lHMUwFE
meHqEq99xYwwbuMNzfeCdKQ6OA1pWykmFPnHvSBlwPTV20O+RlU=
=yyNk
-----END PGP SIGNATURE-----

--TgfbZ/CkXt4NV41x--

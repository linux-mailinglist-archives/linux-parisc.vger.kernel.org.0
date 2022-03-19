Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844204DEA49
	for <lists+linux-parisc@lfdr.de>; Sat, 19 Mar 2022 20:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240856AbiCSTF5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 19 Mar 2022 15:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235662AbiCSTF4 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 19 Mar 2022 15:05:56 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-002.bell.net [209.71.208.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB4B9FD0D
        for <linux-parisc@vger.kernel.org>; Sat, 19 Mar 2022 12:04:33 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 621D9CE902246668
X-CM-Envelope: MS4xfGaFxEocuT9wBOAQpCFYdnJAntkSSTW/8UQw2WTQT4jkCz0X2yFtkUBIeQCsiv+dQbSYZcccM2Mm6E2K5Hj9fVWoNP9OnYJaeaysAm8r0c8ZbTin8Z+4
 VFOnBRTb5Z1mbF/OscNdpB0j/SHwSRbEWyeLOJMp/Jdm3cdtBsBrKey4jd0X/G8oTEkxzfzujTr/4tnDdeGxFAyEbVxHFe3MXgorZqrtVgflHa2q3tlZ28On
 i+nkCVTkkGDrs5r8Eb0IcGJogBKWXUFpL+WttMCzIF/DamqLuNF3sQxP1vogEp1S1Wb62pBiq+lLQIwvL1g5aIkVwHPnb2xRykRdUOMr/XMEO6onrCQFelCl
 Lgf2Uh77uBTgxMSMYRkjyKC1vSp7seXOwL9Bp7uQ3qiwKI+u5CBQgtlw+1+Yo7PO8sqGOiDFC0dMfjsMvHvzcTyhFThmC8I482YmtcPV3UpUYPiIdNbp96fV
 6wPgZuIrRkqC6JYGiNh4dXG0DPvyzf/WN7AgTF0yro20Vl6GYDD/hociqwIUwTIEcc7tvNBfE1aZkTll8XB5N9u6kMHL+zyErokn+3QB2ICGmSfwBMJdTpG/
 Etq0Fm9r5D317aT3U5uWmH0slNxA5ERKhb4+q6mq159AWw==
X-CM-Analysis: v=2.4 cv=aKWTFZxm c=1 sm=1 tr=0 ts=62362931
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=8L605btn6AFxFWT6bJQA:9 a=CjuIK1q_8ugA:10
 a=3Dc4TvUQF3CNNRbq9nQA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 621D9CE902246668; Sat, 19 Mar 2022 15:04:17 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 3C09C220116; Sat, 19 Mar 2022 19:04:16 +0000 (UTC)
Date:   Sat, 19 Mar 2022 19:04:15 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH v3] parisc: Fix invalidate/flush vmap routines
Message-ID: <YjYpL/67UBzHGhuB@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uJCCahXmDDsNiAVT"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--uJCCahXmDDsNiAVT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Cache move-in for virtual accesses is controlled by the TLB.  Thus,
we must generally purge TLB entries before flushing.  The flush routines
must use TLB entries that inhibit cache move-in.

V2: Load physical address prior to flushing TLB.  In flush_cache_page,
flush TLB when flushing and purging.

V3: Don't flush when start equals end.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 231cebb3fc0d..c7da11a278b5 100644
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
+	while (start < end) {
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
+	while (start < end) {
+		physaddr =3D lpa(start);
+		purge_tlb_start(flags);
+		pdtlb(SR_KERNEL, start);
+		purge_tlb_end(flags);
+		purge_dcache_page_asm(physaddr, start);
+		start +=3D PAGE_SIZE;
+	}
 }
 EXPORT_SYMBOL(invalidate_kernel_vmap_range);

--uJCCahXmDDsNiAVT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmI2KSgACgkQXb/Nrl8Z
TfH/dA//Q8C9I5Xq3kVHYOhQNy9Hszht/Y9q00jRi/mH7fQkyOgPY4rirPV3LVYF
NnqwAvOoiLHsSQnkg1fMSsbysNIltWkGzKB1K/tyBOH7WUabDn7RhXzYExbfURcJ
a0RS0KLEixXoHnRR7K8ttzeyoJV7VCOs1rAWHKHVr0KYx1YehhWaudZa9BH0gnic
YPACU0/VPPtdVSbRd9+Oo9aU4rqqnK4gU7tGqJAaNS1+5aXsMHkrUSNYlLApBxFE
DpMF3VgoTlFcMPc7iqZcwl0byz918McM9eNGUAhisrBsn0pbHldrKluRIPXSdNvU
EriRNzxDJRXSxcsTvE43rllKVLRVg/PNbQ+G5N8C9g+WEWHjy0gkB2mj5Mc5X9dD
jAhve4YDG9z6ceqIRqZVw1O8A4m7MfdmocLRKN5LN79hDhwawUhJ4vXugHY2lLIF
65tgyEzcglFVfGfLn69L5VOPb5COXbxJJWbtia9DW3aqvocquwpQ2Q2CZ8oHeoce
POikJ7Jd2R6xfiMtFDjD/GcAZ21LHbLO7nHqp5D9uvLQK2o7qShYzg7B9DZR+rg4
xLzV7t0WReDHJkgvbaWGWkLNqz7JtK032whaUkhV7q9Cu/gIqNGxCaoSZiLtInm9
PQm9jnjnMmEsBc6E5xcEMtysHNacr2rtb4fyfGqdaKmlzgvdu7w=
=OUKi
-----END PGP SIGNATURE-----

--uJCCahXmDDsNiAVT--

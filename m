Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93C84DE3F7
	for <lists+linux-parisc@lfdr.de>; Fri, 18 Mar 2022 23:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241270AbiCRW0H (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 18 Mar 2022 18:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233444AbiCRW0H (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 18 Mar 2022 18:26:07 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-001.bell.net [209.71.208.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5CCDBFD6DC
        for <linux-parisc@vger.kernel.org>; Fri, 18 Mar 2022 15:24:47 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 621D9CE9021538AA
X-CM-Envelope: MS4xfKRyiWJQs/uLHIaIUXFmci40jaAveJqv8gLHfXObwX3FoGdRuTcGKe64tNV6wmloCupub7OqQJQPsKY2EaY/kUEkxskCLJbpGFNFzZ7iNJ1boRopI16z
 r+h6FvzmcEMzKvQG494eb8hSZYGonOnr8Zg4Zky2+ru7ImCtxsRhG51nY+CVL7GdLiyOrN8dJCYOChgPvffKEmzQmxGin1TR4sQwJE6Ny3w/4v76zk4JlBLo
 RghwKStVt4mZZfmhTbHHCqIenyinklHlbU106/JJYX9oDo5Gr3GsnQ2SdzVFYWa9idaz/FaxR4lU6WYjHe7VopLD/qijA54Ly9bbjBcgW8/X/OlYKlU54djY
 o7BHpO5tnAkOz7KuFYBrbghWUm2Ki9+0Y3KAs4hFdqZErnQnwNioDPXPri7Y+Xv5Wh3v40dOm9MoE7UU1HIT4w1oTvW+mzrLe5hthVWlpRux0QjzZgxjBtJ4
 anxtU9Pqzx0ZRirYOowKskmqf0kEynDjkfjEIlTw+G+1k/pP+p280kqXzI6DoNXe0AWh2pwAg6KlF2W2aVRY80UirYcWl2jN8OHdCbGCDUNHe9E/ak4+E64J
 5xOfkxiL+7wh/rbOst2UWpxqHxS5SBTooBBmGtjdkIV8Tw==
X-CM-Analysis: v=2.4 cv=aKWTFZxm c=1 sm=1 tr=0 ts=62350697
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=Q2245be5OrS5l0onsbsA:9 a=CjuIK1q_8ugA:10
 a=TU7ha1VK5XSi81ZK5zAA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 621D9CE9021538AA; Fri, 18 Mar 2022 18:24:23 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 72D02220115; Fri, 18 Mar 2022 22:24:22 +0000 (UTC)
Date:   Fri, 18 Mar 2022 22:24:22 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Fix invalidate/flush vmap routines
Message-ID: <YjUGloM6ji+4Ii9k@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="clxxys8PpSMiMKDs"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--clxxys8PpSMiMKDs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Cache move-in for virtual accesses is controlled by the TLB.  Thus,
we must generally purge TLB entries before flushing.  The flush routines
must use TLB entries that inhibit cache move-in.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 94150b91c96f..a7c68d14ba94 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -633,16 +619,23 @@ void flush_kernel_vmap_range(void *vaddr, int size)
 {
 	unsigned long start =3D (unsigned long)vaddr;
 	unsigned long end =3D start + size;
+	unsigned long physaddr;
=20
+	flush_tlb_kernel_range(start, end);
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    (unsigned long)size >=3D parisc_cache_flush_threshold) {
-		flush_tlb_kernel_range(start, end);
 		flush_data_cache();
 		return;
 	}
=20
-	flush_kernel_dcache_range_asm(start, end);
-	flush_tlb_kernel_range(start, end);
+	preempt_disable();
+	while (start <=3D end) {
+		physaddr =3D lpa(start);
+		if (physaddr)
+			flush_dcache_page_asm(physaddr, start);
+		start +=3D PAGE_SIZE;
+	}
+	preempt_enable();
 }
 EXPORT_SYMBOL(flush_kernel_vmap_range);
=20
@@ -650,15 +643,22 @@ void invalidate_kernel_vmap_range(void *vaddr, int si=
ze)
 {
 	unsigned long start =3D (unsigned long)vaddr;
 	unsigned long end =3D start + size;
+	unsigned long physaddr;
=20
+	flush_tlb_kernel_range(start, end);
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    (unsigned long)size >=3D parisc_cache_flush_threshold) {
-		flush_tlb_kernel_range(start, end);
 		flush_data_cache();
 		return;
 	}
=20
-	purge_kernel_dcache_range_asm(start, end);
-	flush_tlb_kernel_range(start, end);
+	preempt_disable();
+	while (start <=3D end) {
+		physaddr =3D lpa(start);
+		if (physaddr)
+			purge_dcache_page_asm(physaddr, start);
+		start +=3D PAGE_SIZE;
+	}
+	preempt_enable();
 }
 EXPORT_SYMBOL(invalidate_kernel_vmap_range);


--clxxys8PpSMiMKDs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmI1Bo4ACgkQXb/Nrl8Z
TfGDJw/+Ns8WUOwvrp1sMoG0p95LG2gG6VVhxukUCi+9HHWTzM8oij+yfO5+rzHF
UrlWaYaXxVgJZ1gpKHmzeJFhwFRDUvjm3ZFrNcHhEOOd32K4UDi31v3gRxt8QZ9T
7zVERdRdzVnUIHafhq/l4TciKKLaEcQzcvaqaFzzk+7iE3ef6IOPX/O9Idj7T7Uf
WZEzAPqtNMRB//0mNbCUqZr/n8MpNGw9AjgQGo/RfGxANTOrUGxgJEreN+ZQj5ay
+Sjh/hmRKLgsxA7uugEGX005LY6p6XUW6C+Mv9DTenJ4L7bc2LlbeLkgcu7giXqb
ZMTT1l5ZH35qxS2JJtAfyCiS82nsbOUmFbGqPhNI6S2sMBLbfcn4CnWOVV2vI+iH
x2FGeCX+t/Py5VidezJywT24wTpESzLbYJT101tnF8OAO9hyYLRB8LDaU/6pFha3
UFjSQ3cCAC4BUrSJ+Ni562XOTNeWr1eOh5zQGQpkcMZqlsOX4tyJ+PTd3YVgrsq1
1VFSnOMwp5h8AtR2DmzCcFl1gid1feNaZQKfSM8vcKe8bu+ezj3JB4lcB8ed/lFg
ZntORlDxB9O0K8ZnUi9kH64cdq0eFFwiIWUMjku2tr/9WQrLkiMfeiQ/E4BcVe1Q
7Nta0142GLcd2ka/NbnJo68ucRozyQpBeINnCNLBkGgXx1Kjcms=
=zaMe
-----END PGP SIGNATURE-----

--clxxys8PpSMiMKDs--

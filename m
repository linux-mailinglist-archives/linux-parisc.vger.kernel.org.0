Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9408A70591B
	for <lists+linux-parisc@lfdr.de>; Tue, 16 May 2023 22:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjEPUs5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 May 2023 16:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjEPUs5 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 May 2023 16:48:57 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2C455AF
        for <linux-parisc@vger.kernel.org>; Tue, 16 May 2023 13:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684270130; i=deller@gmx.de;
        bh=gsQSGCjlCzILLSL0xl63ZWz2bv2ReC+wzjf6kLLRkXk=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=ibbrLvnDC27kf3oisRAQdBSzSz8Al0/ecCC8lTjAI8Kl7yPuRhPB+KxFtHHUeYnlK
         FHDgNqMfhZKkWUWdsPxRSIY43FCk/51YERQ6C4JY9LQ45W2M0Q6uH4WO79AjGQueis
         Y1/p5JiWjiBDjWp2/z/g7LBVWRjRKWt8Q+5hLunxynF4TduKSHP419O7/bWg+XH+75
         LODWv7ePtE1/Fv7RcKa6eFex+STH+ujS8bUSIsbFdF+HbB43mRpbUNctBewa1F7DOW
         t6TDzGAkb2KWesKj+iBE9HRZvQeQ1GEWqdfJE3otOmoYfPnn2DKozxTWGbv+EwO5Ij
         yYySM5d0FVAdQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.150.20]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QsO-1q88Fr3o0s-011Q0c; Tue, 16
 May 2023 22:48:49 +0200
Date:   Tue, 16 May 2023 22:48:48 +0200
From:   Helge Deller <deller@gmx.de>
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH RFC] more progress with radeon on C8000
Message-ID: <ZGPsMKZQCdu5+c59@p100>
References: <ZGJ7bTYEBGtYMNiA@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGJ7bTYEBGtYMNiA@p100>
X-Provags-ID: V03:K1:dvyGJTanH3AbejiKtnXIkvZj+GUc9kQ5KXhFzrnBgUCbfObheei
 3Ds34UFrq/eXmiLpqRieQLU6D9B42EtkJBNoGneMW+I6ZL3T6D/vA95gTN3cORaMX46Uhy5
 6uu0GDq+UUVXH23mOecP457aYbCIfGdPlL+0iwEjobrNZCs2p/Ypvc2DcNOz0yg9dvDypR+
 bQlNQmbW8LKepNNgEKrAg==
UI-OutboundReport: notjunk:1;M01:P0:OZyKTxusQ0I=;cPfJDCd8ZUzyzPUna1p/n47zTKl
 7b4My9tLSRZFq9Af2b4fYuou8l92gQPQenmot+hAFLOrqDX7kyelXSqamy/cCniXSZpPZnZfe
 qa45QWbPYKh7BWGooV6EKkEBMxLGwIBrUgGkHkH/tMhxAYsaIDVMP4Ap9I40lNSkxu/xKqwl+
 VdvTAvXMaKpML4QCp+lQDEgqLHJwKJNuXdZLVTHKUCNhrtX1kz+GneezUC3l/ZntTqWqgnLlM
 ezN9UJJNJgqL87KAJ0W1vnswk+lBhD/L/EiYqf/rxSYUgI9r3nZQtrO7XlS+KNF9o84omENlG
 VTRxl5B50Hp7EXzx+dQF7zFKyiOIWVWqfAm8KJkVKXyFhZzIKzPen6iowYrhW3ra5hygsjS3S
 FmL3dLOJgbuvECYbP0jLiRr+NqimWKd/KiL77v3sTQusOIQ5j06U0hkI4faiAxmvbqFaDF975
 q9hCscvWY14JOXEAJEalc+v1Qcv/0n1/pqtQA2AMewm1j38lC+2RaAh1R+utjTrOUjaI1qzXo
 9rhVdtMfUHuq8v8ggOE/AEUnjxwLIT5PbUBlOzKA8qlrsdwV/TyjbNCyEXelzatViGodv6Ik/
 dU3mrNql0SPP1Qjz4lXafDJm4MMsql3AZcR5qUFZs6P6y7MO3szefxOIBxdshcWfleQ7jGVbF
 u//TPkfZMQdG9A/RU1i9DvGyQQKGSRWLCVTM7rnavDfASpLibs0YIx/oqWZ9Wix7qqsF8+Pta
 BCjulUvGUGAMPJN1mmaJS3kNuq8ZDM1mdsOyKqEsxnG5QOzggC2tNKe6MNlthsM6oZ6q4ASek
 Wvq8DJUazoQG3ADSg1Vye7+vBkJ2uXsvPAGLi3ENeNnf08vlU7dcRb5RD6O2Gzxj+H9mogg12
 tEzkzi8BQSZWfiVmpCkt8xXbMCzClMScaOlus9yrkZjQHRs4l6dPLvzuI3tv9KfyZWCL4R7JY
 UkxieQ==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* Helge Deller <deller@gmx.de>:
> There have been various approaches to fix the radeon graphic cards
> on C8000 workstations, e.g. this is the last thread:
> https://marc.info/?l=3Dlinux-parisc&m=3D156971832128700&w=3D2
>
> With the patch below the radeon ring and ib tests don't fail any longer.
> It uses (relatively) lightweight pdc/fdc instructions.
>
> The patch below
> - uses the pdc instruction (purge data cache) before reading back the
>   ring test result from memory.
> - modifies the parisc-agp code, based on Thomas patch
>
> The patch is not intended to by applied as-is.

attached is a cleaned up version of the patch.
With that a Radeon PCI card successfully initializes the rings.
ATI FireGL X1 AGP card doesn't work yet, although I start to believe
it's a problem with the card in general (R300), e.g. it reports
"Generation 1 PCI interface in multifunction mode"


diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-agp.c
index d68d05d5d383..4d644c267d3f 100644
=2D-- a/drivers/char/agp/parisc-agp.c
+++ b/drivers/char/agp/parisc-agp.c
@@ -90,6 +90,9 @@ parisc_agp_tlbflush(struct agp_memory *mem)
 {
 	struct _parisc_agp_info *info =3D &parisc_agp_info;

+	/* force fdc ops to be visible to IOMMU */
+	asm_io_sync();
+
 	writeq(info->gart_base | ilog2(info->gart_size), info->ioc_regs+IOC_PCOM=
);
 	readq(info->ioc_regs+IOC_PCOM);	/* flush */
 }
@@ -158,6 +161,7 @@ parisc_agp_insert_memory(struct agp_memory *mem, off_t=
 pg_start, int type)
 			info->gatt[j] =3D
 				parisc_agp_mask_memory(agp_bridge,
 					paddr, type);
+			asm_io_fdc(&info->gatt[j]);
 		}
 	}

@@ -191,7 +195,16 @@ static unsigned long
 parisc_agp_mask_memory(struct agp_bridge_data *bridge, dma_addr_t addr,
 		       int type)
 {
-	return SBA_PDIR_VALID_BIT | addr;
+	unsigned ci;			/* coherent index */
+	dma_addr_t pa;
+
+	pa =3D addr & IOVP_MASK;
+	asm("lci 0(%1), %0" : "=3Dr" (ci) : "r" (phys_to_virt(pa)));
+
+	pa |=3D (ci >> PAGE_SHIFT) & 0xff;/* move CI (8 bits) into lowest byte *=
/
+	pa |=3D SBA_PDIR_VALID_BIT;	/* set "valid" bit */
+
+	return cpu_to_le64(pa);
 }

 static void
diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 7051c9c909c2..a84eba2fb429 100644
=2D-- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -174,6 +174,8 @@ drm_clflush_virt_range(void *addr, unsigned long lengt=
h)

 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
+#elif defined(CONFIG_PARISC)
+	flush_kernel_dcache_range((unsigned long) addr, length);
 #else
 	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
 #endif
diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index d4f09ecc3d22..45711c9b7cfe 100644
=2D-- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -642,6 +642,10 @@ void r100_hpd_fini(struct radeon_device *rdev)
  */
 void r100_pci_gart_tlb_flush(struct radeon_device *rdev)
 {
+	/* flush gtt[] gart table entries from r100_pci_gart_set_page() */
+	dma_sync_single_for_device(&rdev->pdev->dev, rdev->gart.table_addr,
+		rdev->gart.table_size, DMA_TO_DEVICE);
+
 	/* TODO: can we do somethings here ? */
 	/* It seems hw only cache one entry so we should discard this
 	 * entry otherwise if first GPU GART read hit this entry it
diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeon=
/radeon_ring.c
index 7e207276df37..35652286244d 100644
=2D-- a/drivers/gpu/drm/radeon/radeon_ring.c
+++ b/drivers/gpu/drm/radeon/radeon_ring.c
@@ -29,6 +29,7 @@

 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_cache.h>

 #include "radeon.h"

@@ -177,6 +178,9 @@ void radeon_ring_commit(struct radeon_device *rdev, st=
ruct radeon_ring *ring,
 		radeon_ring_write(ring, ring->nop);
 	}
 	mb();
+	if (IS_ENABLED(CONFIG_PARISC))
+		drm_clflush_virt_range((void *)&ring->ring[0], ring->wptr * sizeof(uint=
32_t));
+
 	/* If we are emitting the HDP flush via MMIO, we need to do it after
 	 * all CPU writes to VRAM finished.
 	 */

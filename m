Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F62A703CC0
	for <lists+linux-parisc@lfdr.de>; Mon, 15 May 2023 20:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243697AbjEOSfm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 15 May 2023 14:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243766AbjEOSfd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 May 2023 14:35:33 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA69314E43
        for <linux-parisc@vger.kernel.org>; Mon, 15 May 2023 11:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684175727; i=deller@gmx.de;
        bh=FilAF4BzAsRUp1chzaM369jziAbhL0c7pO9OSjGiOgk=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=hMy/gKZNqqx7pLnJVDgEerGrIeDDGiNbgWJuzkqsTXYjJu2/HEyeZ7836ZxGUBQB3
         omQ5DmbomegilBd6J/waJuoLxCMo0Grc7IuOc921Y3P0BADeVRVxoY6htJd9JwPWiv
         W03LkPRhc+oUh3eYV0JQjORbjzwyiD4hLveVIBYyAXYot5FlLr3kujQFx8Uhi1T3Dn
         HMFQ1B2MMfKZIm5cUaQT83WGQdG9RvOh9MSw/8hNfxOO89Ez0Avgrp8fYf/uhEFCfT
         QmtooFGllyPYuc5tWdcM7yueiJozP2zUtL8tkoWIzTfvi4JYZ1SuMl/Z6jWCMKXGao
         lGdyrvmDZATNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.155.144]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17YY-1q96N30YDy-012YOo; Mon, 15
 May 2023 20:35:27 +0200
Date:   Mon, 15 May 2023 20:35:25 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH RFC] more progress with radeon on C8000
Message-ID: <ZGJ7bTYEBGtYMNiA@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:i6fl3+vZI3m7Fjxe2V/rYJBaMvnLNTNcWeeEY2jIVpuMZjtOKcl
 7DiT42C7Db5j9qys4F3mmLzpYMRQM0sjy1jPKPPzXXbliwBKDuZtDowVC+U6TOOlY8jb+3u
 BTVLpr6bcyKAlRoLAOqdcDyjnu442v5bCHfT0UwKITEY6h7JiCFmKNQJCpwSOcr/vGyB/z0
 ENg+QfVxATKcPcuuiTOmA==
UI-OutboundReport: notjunk:1;M01:P0:R7OOJWHGcWc=;CoD4F6C6aUyPPXx2WkKTsW/TqJx
 fXbsn2Fhh1kNBh9W9xDxZKi2bB1IErRrCGQXfDRFlNtZJjRUwgWIUbMGVQsLdlmLFV5UBwNwu
 CPa13zj6XhCtegRckfWTbQRM1jXosC60fsXOvCbpvXtG7LgX/3TbfN108cFObVlZfrR4aTmRE
 ghp/qYrdWqOG+FjihqpD899p3MgK7zh9ih9cQ9y1UxiMWnuo8CvefndSDZXT7E2sV+/pN0zSA
 UpLQzyF09EvRDviaoSqGRXe4C0djevSSYZ8deOqyppvXfgXbyg5IrQ0898NpTYm6ObvBUPPE9
 2fprA5PoseHGSBKY8i2miyywCEv7qoBtlWM4unKdWzQXxJd24xQfzN/XX/H6xQSbuRJu+56Xm
 2My3usWKsa8LOdrNzA+j5ymZMpZ3NZtjt5uC/CIG7Mg94IKOzb52E1vlPy9ytNFc+K4kEe1xt
 DDatQz2FI9p3mpTUXbtrRMpOuptGwASVhOr94BxF/rfk30etSxRdUbLZwhdF43UzzKHSFNyCr
 XFNnGZhRslHs3oVc6hk7p8/bBUhag2HP/QVEz9yt8nS6ywVs24UT1fodFw3AeIMyX+I2XFgBR
 IRFp8/nCikIZhEdktZpojqH+wlfTFVHw6AIdOPWXpfwzxADEWRlr616DYwoXLaj9sW19x6/Wv
 WjPimp8ke7Qc4yHyDQFAbb4vf6tFwiarZzx8G/P4Rl3sRZo7KUg/T0ANbQt9GHHmI0lZ84NmF
 hscUdOatHfZHDPttuOnMYZwjfT3eCdP2D4g21BoBnjQYgIfDNHDr3nwCoy0i6xv9iBOQfgbnw
 2EGrXAN4EFLXeUIE0IdUt8d73dBnjS7myakf/tZ4SKdD+7aS8bVXl0k6FFAfcCGbrpAp8txia
 w+mvUzW6Bwt10l3RgAZyAx1YiQrA3f+xJsLHKoOWfSV5fjm9/S9giiB98X1d8bOZXBsIPBGET
 r9C7Gw==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

There have been various approaches to fix the radeon graphic cards
on C8000 workstations, e.g. this is the last thread:
https://marc.info/?l=3Dlinux-parisc&m=3D156971832128700&w=3D2

With the patch below the radeon ring and ib tests don't fail any longer.
It uses (relatively) lightweight pdc/fdc instructions.

The patch below
- uses the pdc instruction (purge data cache) before reading back the
  ring test result from memory.
- modifies the parisc-agp code, based on Thomas patch

The patch is not intended to by applied as-is.

The log below is from an ATI radeon PCI card, so the AGP patch isn't used =
here.

I wonder if there is a simple testcase available to check if everything
works?

[  104.571313] [drm] radeon kernel modesetting enabled.
[  104.643912] radeon 0000:60:04.0: enabling SERR and PARITY (0107 -> 0147=
)
[  104.737658] [drm] initializing kernel modesetting (RV280 0x1002:0x5965 =
0x1002:0x2002 0x01).
[  104.950370] [drm] GPU not posted. posting now...
[  105.031735] [drm] Generation 2 PCI interface, using max accessible memo=
ry
[  105.111315] radeon 0000:60:04.0: VRAM: 64M 0xFFFFFFFFB4000000 - 0xFFFFF=
FFFB7FFFFFF (64M used)
[  105.216120] radeon 0000:60:04.0: GTT: 512M 0xFFFFFFFF94000000 - 0xFFFFF=
FFFB3FFFFFF
[  105.304810] [drm] Detected VRAM RAM=3D64M, BAR=3D64M
[  105.361061] [drm] RAM width 64bits DDR
[  105.410312] [drm] radeon: 64M of VRAM memory ready
[  105.465816] [drm] radeon: 512M of GTT memory ready.
[  105.526336] [drm] GART: num cpu pages 131072, num gpu pages 131072
[  105.628966] [drm] PCI GART of 512M enabled (table at 0x000000004B2C0000=
).
[  105.707636] radeon 0000:60:04.0: WB disabled
[  105.759884] radeon 0000:60:04.0: fence driver on ring 0 use gpu addr 0x=
ffffffff94000000
[  105.864222] [drm] radeon: irq initialized.
[  105.912906] [drm] Loading R200 Microcode
[  105.997513] [drm] radeon: ring at 0xFFFFFFFF94001000
[  106.057793] [drm] ring test succeeded in 0 usecs
[  106.126386] [drm] ib test succeeded in 0 usecs
[  106.183780] [drm] Radeon Display Connectors
[  106.230816] [drm] Connector 0:
[  106.271052] [drm]   DVI-I-1
[  106.303247] [drm]   HPD2
[  106.335433] [drm]   DDC: 0x60 0x60 0x60 0x60 0x60 0x60 0x60 0x60
[  106.407906] [drm]   Encoders:
[  106.440118] [drm]     CRT1: INTERNAL_DAC1
[  106.488393] [drm]     DFP2: INTERNAL_DVO1
[  106.540706] [drm] Connector 1:
[  106.577071] [drm]   DVI-I-2
[  106.609150] [drm]   HPD1
[  106.641325] [drm]   DDC: 0x64 0x64 0x64 0x64 0x64 0x64 0x64 0x64
[  106.713770] [drm]   Encoders:
[  106.749996] [drm]     CRT2: INTERNAL_DAC2
[  106.798295] [drm]     DFP1: INTERNAL_TMDS1
[  106.846639] [drm] Initialized radeon 2.50.0 20080528 for 0000:60:04.0 o=
n minor 0
[  107.482694] [drm] fb mappable at 0xFFFFFFFFB4040000
[  107.538318] [drm] vram apper at 0xFFFFFFFFB4000000
[  107.598634] [drm] size 9216000
[  107.634831] [drm] fb depth is 24
[  107.675046] [drm]    pitch is 7680
[  108.042812] Console: switching to colour frame buffer device 240x67
[  108.531201] radeon 0000:60:04.0: [drm] fb0: radeondrmfb frame buffer de=
vice


Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-agp.c
index d68d05d5d383..1b1bea33c767 100644
=2D-- a/drivers/char/agp/parisc-agp.c
+++ b/drivers/char/agp/parisc-agp.c
@@ -158,6 +158,7 @@ parisc_agp_insert_memory(struct agp_memory *mem, off_t=
 pg_start, int type)
 			info->gatt[j] =3D
 				parisc_agp_mask_memory(agp_bridge,
 					paddr, type);
+			asm_io_fdc(&info->gatt[j]);
 		}
 	}

@@ -191,7 +192,16 @@ static unsigned long
 parisc_agp_mask_memory(struct agp_bridge_data *bridge, dma_addr_t addr,
 		       int type)
 {
-	return SBA_PDIR_VALID_BIT | addr;
+	unsigned ci; /* coherent index */
+	u64 pa;
+
+	pa =3D addr & IOVP_MASK;
+	asm("lci 0(%1), %0" : "=3Dr" (ci) : "r" (__va(pa)));
+
+	pa |=3D (ci >> PAGE_SHIFT) & 0xff;/* move CI (8 bits) into lowest byte *=
/
+	pa |=3D SBA_PDIR_VALID_BIT;	/* set "valid" bit */
+
+	return cpu_to_le64(pa);
 }

 static void
diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index d4f09ecc3d22..c4a73a5a3651 100644
=2D-- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -710,6 +710,7 @@ void r100_pci_gart_set_page(struct radeon_device *rdev=
, unsigned i,
 {
 	u32 *gtt =3D rdev->gart.ptr;
 	gtt[i] =3D cpu_to_le32(lower_32_bits(entry));
+	asm_io_fdc(&gtt[i]);
 }

 void r100_pci_gart_fini(struct radeon_device *rdev)
@@ -3689,6 +3690,16 @@ void r100_ring_ib_execute(struct radeon_device *rde=
v, struct radeon_ib *ib)
 {
 	struct radeon_ring *ring =3D &rdev->ring[RADEON_RING_TYPE_GFX_INDEX];

+	u32 *ptr;
+	int len;
+	ptr =3D ib->ptr;
+	len =3D ib->length_dw;
+	while (len >=3D 0) {
+		asm_io_fdc(ptr);
+		ptr++;
+		len--;
+	}
+
 	if (ring->rptr_save_reg) {
 		u32 next_rptr =3D ring->wptr + 2 + 3;
 		radeon_ring_write(ring, PACKET0(ring->rptr_save_reg, 0));
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/rade=
on.h
index 8afb03bbce29..45991d26be6a 100644
=2D-- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2463,16 +2463,20 @@ static inline uint32_t r100_mm_rreg(struct radeon_=
device *rdev, uint32_t reg,
 				    bool always_indirect)
 {
 	/* The mmio size is 64kb at minimum. Allows the if to be optimized out. =
*/
-	if ((reg < rdev->rmmio_size || reg < RADEON_MIN_MMIO_SIZE) && !always_in=
direct)
+	if ((reg < rdev->rmmio_size || reg < RADEON_MIN_MMIO_SIZE) && !always_in=
direct) {
+		asm volatile("pdc %%r0(%0)" : : "r" (((void __iomem *)rdev->rmmio) + re=
g) : "memory");
 		return readl(((void __iomem *)rdev->rmmio) + reg);
+	}
 	else
 		return r100_mm_rreg_slow(rdev, reg);
 }
 static inline void r100_mm_wreg(struct radeon_device *rdev, uint32_t reg,=
 uint32_t v,
 				bool always_indirect)
 {
-	if ((reg < rdev->rmmio_size || reg < RADEON_MIN_MMIO_SIZE) && !always_in=
direct)
+	if ((reg < rdev->rmmio_size || reg < RADEON_MIN_MMIO_SIZE) && !always_in=
direct) {
 		writel(v, ((void __iomem *)rdev->rmmio) + reg);
+		asm_io_fdc(((void __iomem *)rdev->rmmio) + reg);
+	}
 	else
 		r100_mm_wreg_slow(rdev, reg, v);
 }
@@ -2683,7 +2687,9 @@ static inline void radeon_ring_write(struct radeon_r=
ing *ring, uint32_t v)
 	if (ring->count_dw <=3D 0)
 		DRM_ERROR("radeon: writing more dwords to the ring than expected!\n");

-	ring->ring[ring->wptr++] =3D v;
+	ring->ring[ring->wptr] =3D v;
+	asm_io_fdc(&ring->ring[ring->wptr]);
+	ring->wptr++;
 	ring->wptr &=3D ring->ptr_mask;
 	ring->count_dw--;
 	ring->ring_free_dw--;

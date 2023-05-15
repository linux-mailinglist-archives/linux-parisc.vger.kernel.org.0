Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C12703CDA
	for <lists+linux-parisc@lfdr.de>; Mon, 15 May 2023 20:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244343AbjEOSji (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 15 May 2023 14:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244225AbjEOSjh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 May 2023 14:39:37 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A05446B2
        for <linux-parisc@vger.kernel.org>; Mon, 15 May 2023 11:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684175974; i=deller@gmx.de;
        bh=ogVJgMcsHmRzazCQYeUi56cS8088BBJ04HFt8AfJvGc=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=MiwORGnhWG+0rx1GfRGu3THCMBUHmESwuvGZkdtUW5dgUYo7lvZEJh4fv5H6RU6/K
         j/gb1IRKncsF6usV1YT9hnw2RY6lngNJonqF+GU6MpW3E8puZfp1+QAlkERJnz7Fw+
         KqDui5yw6lPBBPDEPqZMfZ5zLSLn3vNFLIhaZ23ktl+NbV0qb8xhB+erU6gSzlCIy9
         ybKSqY3B/yVFmoe/E1cpaI5IQJyAodWV+5xwSPKYINZpyi2pSLullMAgOFXMzLhyri
         I4rafpxvH2+aEO2Zpzoq1buTiJWH8e4hKMvfr/Vrs/lRNCJQGUvqn5OwemfZtbujrN
         8sFlt/Hsy6JHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.155.144]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlf0K-1qOaFo3PDm-00in9x; Mon, 15
 May 2023 20:39:34 +0200
Date:   Mon, 15 May 2023 20:39:33 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: improve cach flushing in arch_sync_dma_for_cpu()
Message-ID: <ZGJ8ZcPZbckX7VNB@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:UA9XT5+4OA2gvqGzj8QYdojUZXc8IxJOFfDo1+sekNAUQ6rvHFg
 pprHjjMDdoHy+XiLR//8v71gMkEev+qF7bKeqc1SxMzlmPtaZyJPI0EuhzQIxxzIPCgVs9S
 tZM840/1UN4+9b+tAbYC/JEDBIZTOeaxqwL99kw/2c3XKD9e7pjRAeLIGdFYQsI7tZbnEBK
 cdB/IPH7ePHGM/Qfonogg==
UI-OutboundReport: notjunk:1;M01:P0:ljIVd04DUBw=;i0tfkNXEMcAYZIQV47oDAl4K1Eu
 IFUAy5+Yy4UEcul5ONRk12pOGkjJ8H08TQC+A7dZaMeQtKvIYilEmRvlm13Jb6HNwkRI1tL1z
 x5wFREvke7GR299am0ELy7ze6CgpWIBFNdfEUJ+t0bghrzFuFz2E7gI0UF5a6QFrxMB491T8+
 HjOjXdylEYLqC++L5DNM16qIhkwql+rL4ijKOwVN4ssbCaE1xn3isr6sIHL1Njr/qOsM8ANYw
 RsgnWNWj8jrDuCFp8km3JkttaMVestlpMo16BbIcb/I/8yv8Ya5qITD9amT/Jj9qmjaR0C7NO
 1f3TziY3C9c+ibg6OOqhfrf7HY4lmHAEV2H8DyvM4vzYZX+g6xFP+VqQ/zao2V4ryl4GY1Ct6
 yCqItY7SfelESnsuQo89Y+we27Qf+Cp/cwp01QCnAo74PVglWEXGtv5FENCi/glhCqPFbrjeh
 vcsRQdAbn8LH77PyD5cGlZ49sq6aK78QhLf60GHdYD5pHhqrpZCfCW+hw5xtFdOHVyPW4mqLF
 M5/Ph4XDTl+3t578NjTXWFAaFACvVXBcmXN8v3M8k1xmay45KtkeCuu4u6M2slP8vNP9EDYOD
 1c0hQgSHepH9yiA4c+Q5cv34YrNaRf1AN2xI2V5vzILZXjHbZ00PLqq/C++EAv2qanuh+FLfv
 bOFi0UK6S7ZKY4VTbdqu4A6LqmRw2nqfJTO1E5JssDHVsgcI9ueICBab9Ghz+Oi84q//Ffgz2
 DatdUHfr+jD2vaFtt+OzIwlL0J/nuQGoD26s6LIKS/6iuVtD07wPcXk5vGNSXjyYQK7mDhjHB
 djkwaWiIjchYiJlz27Nhn1kIe1arOeuEWWupcOlj1ed7lJk4CLJsXCN+LPn31+/2RijowpycK
 nONBKjhr9lNBpJeQ8D6Z6eLBZOCCtttu7GWSLK4iG8z2LFOeD6i2FQdY5w3vWq+K1e05u02EK
 7Cmakm2Yfw3RUpCv2PmV76dNdeg=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Handle the direction flag in arch_sync_dma_for_device() and
arch_sync_dma_for_cpu().

When receiving data from the device (DMA_FROM_DEVICE and DMA_BIDIRECTIONAL=
)
purge the data cache in arch_sync_dma_for_cpu().

Run-tested on C8000 workstation.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index ba87f791323b..f8337c1820fc 100644
=2D-- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -446,11 +446,36 @@ void arch_dma_free(struct device *dev, size_t size, =
void *vaddr,
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	flush_kernel_dcache_range((unsigned long)phys_to_virt(paddr), size);
+	unsigned long addr =3D (unsigned long) phys_to_virt(paddr);
+
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		flush_kernel_dcache_range(addr, size);
+		break;
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		flush_kernel_dcache_range(addr, size);
+		purge_kernel_dcache_range_asm(addr, addr + size);
+		break;
+	default:
+		BUG();
+	}
 }

 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	flush_kernel_dcache_range((unsigned long)phys_to_virt(paddr), size);
+	unsigned long addr =3D (unsigned long) phys_to_virt(paddr);
+
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		flush_kernel_dcache_range(addr, size);
+		return;
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		purge_kernel_dcache_range_asm(addr, addr + size);
+		break;
+	default:
+		BUG();
+	}
 }

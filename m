Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87D3705591
	for <lists+linux-parisc@lfdr.de>; Tue, 16 May 2023 20:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjEPSAm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 May 2023 14:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjEPSAl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 May 2023 14:00:41 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C56125
        for <linux-parisc@vger.kernel.org>; Tue, 16 May 2023 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684260036; i=deller@gmx.de;
        bh=ybu4wYDXh6IWaTtVbh25Id03CdnaY6PkcTEnk+uVBS4=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=ttFiaeY4GCHYAcejlCRTEnuIjjXQyOiffrIyTJKB22UjCsHyAQEdiYDoBpA8Qdxlb
         cqEPhHzNQNtzM/wCVsY5m6f20k1f1n5TxIEEvxVXAhAYOj+b2cwnODCRLCpADz28mB
         bBq/P1UoymR7eObmoc0SRbUzw1Xl8dmBk5FW16a2TjGlYllGUCNOJvVJQ2CDIMb6Zs
         mAVXXUpjtOmLAJ/Vf/GJjGG7CnBu+uzEw+xbxoszD6/AMlwbY3duMRipchHvqA6OFM
         jbK7DAVE5x2+a5BaBiBQXEHRvxCKZunR/IS4Uwl+B40b76zaufW1+D3HPwdM04c+58
         0ZzPmLScaROhw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.150.20]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTiPl-1pba0n1mFJ-00U353; Tue, 16
 May 2023 20:00:36 +0200
Date:   Tue, 16 May 2023 20:00:34 +0200
From:   Helge Deller <deller@gmx.de>
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: improve cach flushing in arch_sync_dma_for_cpu()
Message-ID: <ZGPEwk3JEc/skrBx@p100>
References: <ZGJ8ZcPZbckX7VNB@p100>
 <4664024c-1312-64b5-5150-e60bf3fc49bb@bell.net>
 <7bcc14b4-408a-d884-a78c-b0436789e58d@gmx.de>
 <0c0a6071-d518-4d6c-17be-934e5f1a1199@bell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0c0a6071-d518-4d6c-17be-934e5f1a1199@bell.net>
X-Provags-ID: V03:K1:7q96l7VKq3knhFgl7o22PnA71Gx48aqKHMWi/7BLbURir+t1v+T
 bc2lN/Pkh7OBLA8YUxwUmdc7SmTnte7hQ/eovKEq/yE1y2vHn/GiP826lEIDB8/3Xn+Wu0x
 K/VAzk2QFKdb5aw9uJeYrdqT3+bhQYxu9j7c381N7FgoixyGrl3YWCCzDxUNp1dod4CPjFi
 Dh//hWU9N0OLmVGfO5uQg==
UI-OutboundReport: notjunk:1;M01:P0:6joGECT6jqs=;pfceW/eR2jqSkcUKJOR+qEsNrwF
 wYG4DF7WcjKguequJjCtwE1qOtzD6+i6UJfR66Klht/+w9b2JBvJnsxU8sTvZjpqa9pgJtO60
 tqiMx+hw3pa8Qh8oBcbSOt9tm9ZkLkVkHINqmflXMZYSdee22Z5FwN3jEEWUoXKB90r4rq0rw
 QCPlMkEeB2CmrrSUvhOhWWfuS37cB0HQMLSedDtD0rdwRCT4/4zcITE7ccHcdnzL5UMqm+zlf
 9PVbm6gsFtjh95LjDU+bZdEtni4QTq6411Pkgc2uarqiHfLv3I/x9fHBHUWeR8RUlEGfjFqXa
 1uBFj5yvjOmOjK5vKfnB/Zoo8rL1EWUipPpFCk3+gy+Fa5GlM/hDzUosk+BXtt21HRoLFna1k
 ZZ0y0APSyJQf2jkLFhmVkxuSGBK1nwi28k0DGjxK3fcdyPXkCgnHoKRwr10M5wpa08vff6Bsw
 TLBcWTcRrm7wWaSf7t85z7z02XftNkf78t25trBxz0rf5RCm5HXiz0/qVxBU+QAk2I7Y2jxiS
 hvcDJfRUuJ66IzfPEwQJg19JFaSQFnGfgtAVJxnsGnZSODjEFSxyPEplVx+xoHS6sdiWFH4rc
 mfnzVIexjxb7npsZCpM7LTqbbhGaHXjQ1dIuOn6+7jekyqebQZIVFB2+V8sTu8N13DYCnlx1e
 kJsCntfR4ADlfqb4B7d+IspueXsRKza9W4cZSUomdqR9/Sy6pa6V3PWYk2smHGNYuQz7zkM6I
 X9CcB7ev8OQns9kaGyEgE88g3bocndLweHwCC4QmomEej8cIhqLCwyCG5Ai0hvkRVktz8vF7t
 uebADHRgL2WNnFJ73O6DBU0DD6YJPPJzXkVMhqUF2quk9GfSS7w86cTSULtJP2x5h9jnRqEuR
 BYA790Mex1LhP0OaqNzgyMDkA+ciKdKyd+rN2qUOGUEot4PZ9KwVvqFc/Aqnf60ev3FoX3f2R
 Ul6VcQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* John David Anglin <dave.anglin@bell.net>:
> On 2023-05-16 3:09 a.m., Helge Deller wrote:
> > On 5/16/23 00:28, John David Anglin wrote:
> > > On 2023-05-15 2:39 p.m., Helge Deller wrote:
> > > > +=A0=A0=A0 case DMA_BIDIRECTIONAL:
> > > > +=A0=A0=A0=A0=A0=A0=A0 flush_kernel_dcache_range(addr, size);
> > > > +=A0=A0=A0=A0=A0=A0=A0 purge_kernel_dcache_range_asm(addr, addr + =
size);
> > > I don't think flush and purge are both needed.
> >
> > I'm not sure...
> >
> > Just to fully understand it. Is this short summary correct: ?
> > - flush_kernel_dcache_range: flush cache back to memory, but keep data=
 in cache.
> No.=A0 If present, fdc writes addressed cache line to memory if and only=
 if line is dirty.=A0 It
> then invalidates line.=A0 It does not keep data in cache.
>
> Next read loads from memory.
> > =A0=A0=A0=A0Next read fetches the data which is still in the cache, th=
us the next
> > =A0=A0=A0=A0read doesn't checks if data in memory has been modified in=
 the meantime (e.g. via DMA).
> > - purge_kernel_dcache_range_asm: ignore currently cached data & drop a=
ny cached data in that range.
> > =A0=A0=A0=A0Even if cache has dirty memory which hasn't been written b=
ack yet, drop it and don't write back.
> if present, pdc invalidates line.=A0 At privilege level zero, an impleme=
ntation may optionally write
> back a dirty line to memory.=A0 At non-zero privilege levels, fdc and pd=
c are effectively the same.
>
> I don't know how to determine whether pdc does write back or not. It wou=
ld be specified in processor
> ERS.

Thanks for the explanation!
With that, I've attached an updated (untested) patch below.

Helge

[PATCH v2] parisc: improve cach flushing in arch_sync_dma_for_cpu()

Add comment in arch_sync_dma_for_device() and handle the direction flag in
arch_sync_dma_for_cpu().

When receiving data from the device (DMA_FROM_DEVICE) unconditionally
purge the data cache in arch_sync_dma_for_cpu().

Signed-off-by: Helge Deller <deller@gmx.de>
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index ba87f791323b..71ed5391f29d 100644
=2D-- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -446,11 +446,27 @@ void arch_dma_free(struct device *dev, size_t size, =
void *vaddr,
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
+	/*
+	 * fdc: The data cache line is written back to memory, if and only if
+	 * it is dirty, and then invalidated from the data cache.
+	 */
 	flush_kernel_dcache_range((unsigned long)phys_to_virt(paddr), size);
 }

 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	flush_kernel_dcache_range((unsigned long)phys_to_virt(paddr), size);
+	unsigned long addr =3D (unsigned long) phys_to_virt(paddr);
+
+	switch (dir) {
+	case DMA_TO_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		flush_kernel_dcache_range(addr, size);
+		return;
+	case DMA_FROM_DEVICE:
+		purge_kernel_dcache_range_asm(addr, addr + size);
+		return;
+	default:
+		BUG();
+	}
 }

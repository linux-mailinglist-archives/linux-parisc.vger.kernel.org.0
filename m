Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFC52BC71
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 02:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfE1APR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 20:15:17 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:53816 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726979AbfE1APR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 20:15:17 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190528001516.YZWE4684.torfep02.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 27 May 2019 20:15:16 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm01.bell.net
          with ESMTP
          id <20190528001516.XEOC39285.torspm01.bell.net@[192.168.2.49]>;
          Mon, 27 May 2019 20:15:16 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Use implicit space register selection for loading the
 coherence index of I/O pdirs
Openpgp: preference=signencrypt
Message-ID: <f267f3ce-9baa-5e2f-1f0a-c08e59a53a7a@bell.net>
Date:   Mon, 27 May 2019 20:15:14 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=RV4OE50Q5uv1swCxaxAA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfGZe1+b1s0kIzpsgTbteeZ9R1mUfxmi6kKiPJIi3L8LtyILRifBmFNBKzIx49GXXhVg57YMvE0u2m7cBh5KCFx2I6JhV02iWBMQWJEO60viUPAKcrZpt m/YtTB6nXHeYcyPB1gEffLpnWpGS0+eX9wXGptrhA/aYkQEsoVDzvHlPE8t1GviERKUyggiC6r+lZQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

We only support I/O to kernel space.  Using %sr1 to load the coherence index
may be racy unless interrupts are disabled.  This patch changes the code used
to load the coherence index to use implicit space register selection.  This saves
one instruction and eliminates the race.

Tested on rp3440, c8000 and c3750.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index acba1f56af3e..d7649a70a0c4 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -565,8 +565,6 @@ ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
 	/* We currently only support kernel addresses */
 	BUG_ON(sid != KERNEL_SPACE);

-	mtsp(sid,1);
-
 	/*
 	** WORD 1 - low order word
 	** "hints" parm includes the VALID bit!
@@ -597,7 +595,7 @@ ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
 	** Grab virtual index [0:11]
 	** Deposit virt_idx bits into I/O PDIR word
 	*/
-	asm volatile ("lci %%r0(%%sr1, %1), %0" : "=r" (ci) : "r" (vba));
+	asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (vba));
 	asm volatile ("extru %1,19,12,%0" : "+r" (ci) : "r" (ci));
 	asm volatile ("depw  %1,15,12,%0" : "+r" (pa) : "r" (ci));

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 0a9c762a70fa..5468490d2298 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -575,8 +575,7 @@ sba_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
 	pa = virt_to_phys(vba);
 	pa &= IOVP_MASK;

-	mtsp(sid,1);
-	asm("lci 0(%%sr1, %1), %0" : "=r" (ci) : "r" (vba));
+	asm("lci 0(%1), %0" : "=r" (ci) : "r" (vba));
 	pa |= (ci >> PAGE_SHIFT) & 0xff;  /* move CI (8 bits) into lowest byte */

 	pa |= SBA_PDIR_VALID_BIT;	/* set "valid" bit */

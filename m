Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5C932598
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jun 2019 01:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfFBXMm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jun 2019 19:12:42 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:40806 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726305AbfFBXMm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jun 2019 19:12:42 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20190602231240.RBRN4947.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 2 Jun 2019 19:12:40 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm02.bell.net
          with ESMTP
          id <20190602231240.LGU21689.mtlspm02.bell.net@[192.168.2.49]>;
          Sun, 2 Jun 2019 19:12:40 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Use lpa instruction to load physical addresses in
 driver code
Openpgp: preference=signencrypt
Message-ID: <5d53371f-d918-0333-08a7-ad0d04eb3b26@bell.net>
Date:   Sun, 2 Jun 2019 19:12:40 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=bJBo382Z c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=dq6fvYVFJ5YA:10 a=FBHGMhGWAAAA:8 a=raJY2-ovtCgriJaM__YA:9 a=J1lKKBVD1BWXfK9K:21 a=LwO4_kJJOxJrn29I:21 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfGNGlKFV47CE67Vp+9DLO/4ACy5LXTibzrapPwSq2mOcyQ3Zy/SIkxc2bJtq55cChip9TqsQnNdp4O/o74pjJnLcAQI+fEi7JRVn0PLmIRipqo/A67eF uzS6YiGwlooVttwz7Vq9SEHTL//bhDJ2rz/u0yXT7wp88mWBa2DN2gXA8gQBU9RuKtTtBhmfKUlGXQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Most I/O in the kernel is done using the kernel offset mapping.  However, there
is one API that uses aliased kernel address ranges:

> The final category of APIs is for I/O to deliberately aliased address
> ranges inside the kernel.  Such aliases are set up by use of the
> vmap/vmalloc API.  Since kernel I/O goes via physical pages, the I/O
> subsystem assumes that the user mapping and kernel offset mapping are
> the only aliases.  This isn't true for vmap aliases, so anything in
> the kernel trying to do I/O to vmap areas must manually manage
> coherency.  It must do this by flushing the vmap range before doing
> I/O and invalidating it after the I/O returns.

For this reason, we should use the hardware lpa instruction to load the physical address
of kernel virtual addresses in the driver code.

I believe we only use the vmap/vmalloc API with old PA 1.x processors which don't have
a sba, so we don't hit this problem.

Tested on c3750, c8000 and rp3440.

This patch includes the previous change to use implicit space register access in loading
the coherence index as the two changes conflict.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---
diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/include/asm/special_insns.h
index 3d4dd68e181b..a303ae9a77f4 100644
--- a/arch/parisc/include/asm/special_insns.h
+++ b/arch/parisc/include/asm/special_insns.h
@@ -2,6 +2,30 @@
 #ifndef __PARISC_SPECIAL_INSNS_H
 #define __PARISC_SPECIAL_INSNS_H

+#define lpa(va)	({			\
+	unsigned long pa;		\
+	__asm__ __volatile__(		\
+		"copy %%r0,%0\n\t"	\
+		"lpa %%r0(%1),%0"	\
+		: "=r" (pa)		\
+		: "r" (va)		\
+		: "memory"		\
+	);				\
+	pa;				\
+})
+
+#define lpa_user(va)	({		\
+	unsigned long pa;		\
+	__asm__ __volatile__(		\
+		"copy %%r0,%0\n\t"	\
+		"lpa %%r0(%%sr3,%1),%0"	\
+		: "=r" (pa)		\
+		: "r" (va)		\
+		: "memory"		\
+	);				\
+	pa;				\
+})
+
 #define mfctl(reg)	({		\
 	unsigned long cr;		\
 	__asm__ __volatile__(		\
diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 121f7603a595..217f15aafa4a 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -562,14 +562,12 @@ ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
 	/* We currently only support kernel addresses */
 	BUG_ON(sid != KERNEL_SPACE);

-	mtsp(sid,1);
-
 	/*
 	** WORD 1 - low order word
 	** "hints" parm includes the VALID bit!
 	** "dep" clobbers the physical address offset bits as well.
 	*/
-	pa = virt_to_phys(vba);
+	pa = lpa(vba);
 	asm volatile("depw  %1,31,12,%0" : "+r" (pa) : "r" (hints));
 	((u32 *)pdir_ptr)[1] = (u32) pa;

@@ -594,7 +592,7 @@ ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
 	** Grab virtual index [0:11]
 	** Deposit virt_idx bits into I/O PDIR word
 	*/
-	asm volatile ("lci %%r0(%%sr1, %1), %0" : "=r" (ci) : "r" (vba));
+	asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (vba));
 	asm volatile ("extru %1,19,12,%0" : "+r" (ci) : "r" (ci));
 	asm volatile ("depw  %1,15,12,%0" : "+r" (pa) : "r" (ci));

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 8a9ea9bd050c..296668caf7e5 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -569,11 +569,10 @@ sba_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
 	u64 pa; /* physical address */
 	register unsigned ci; /* coherent index */

-	pa = virt_to_phys(vba);
+	pa = lpa(vba);
 	pa &= IOVP_MASK;

-	mtsp(sid,1);
-	asm("lci 0(%%sr1, %1), %0" : "=r" (ci) : "r" (vba));
+	asm("lci 0(%1), %0" : "=r" (ci) : "r" (vba));
 	pa |= (ci >> PAGE_SHIFT) & 0xff;  /* move CI (8 bits) into lowest byte */

 	pa |= SBA_PDIR_VALID_BIT;	/* set "valid" bit */

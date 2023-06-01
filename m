Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B35371F237
	for <lists+linux-parisc@lfdr.de>; Thu,  1 Jun 2023 20:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjFASlU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 1 Jun 2023 14:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjFASlU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 1 Jun 2023 14:41:20 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0A6C0
        for <linux-parisc@vger.kernel.org>; Thu,  1 Jun 2023 11:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1685644870; x=1686249670; i=deller@gmx.de;
 bh=9XoSowSVnnW5WJ6/EkdaQn+qof2fdYU8NxT0v9lch9s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=EKj8uAzIlEbB5NhvKNhWrofEMPLyce/u3yBDM2bVKhUt2oCH8rvfpXFOM5iWTM106Fyq3jo
 cF4DTJyGBn9UA18WVozS8PiMvlDsM/y3Otfs89Fg/6TaIHqnWML8hVubIWl72G/BsVbN6Jleq
 OuM0GKDl2YtpIWEfWpSJEjrYuTvd+CoaB/l63XlJ67T6e4oO4gF/FNOCml6vk+OTxTpqsTIUf
 suZx/38cb7wjJZ+TBLwxPIlvEvN8LMIkj8Se2zwIXO9b90NTsbvh1hlJuE5VKnAjx2pJuLn3+
 53Ymz4BGfT/jN4FzGSpUkQbwRLMouonS16EcV4JVkXDlIyPm+xBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([109.43.49.30]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC34h-1pv8jT0BOn-00CUN6; Thu, 01
 Jun 2023 20:41:10 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add cacheflush() syscall
Date:   Thu,  1 Jun 2023 20:41:05 +0200
Message-Id: <20230601184105.678864-1-deller@gmx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZXDUjdumit+g7Faljt5VqAmc5KSzuBVt4kLWJoBmr0Y8a3ADA32
 Cat2OBqIqqGXL1p/aO7Nb4IQ9s3hjOguMfkVdP49VYfxMsm0Yo0oAeDD7TZwk+3ZzqJEEru
 h9+LIWhIuqfni7aNVua/wv/p52UdXhhz2jSbVeQ2JueUoAF72tQZcfqG196npYvAQqt+wyd
 e1cBpUrh7l5g602zRqFZg==
UI-OutboundReport: notjunk:1;M01:P0:saNNDbkQaAM=;WihDR03pqY6LQmbSMqFNs8bpV3y
 0Ol3zNfKW9bOhkmEhHN/LeK8CzEZ2cmXlV2GAdOvlB9Sa5CUAX+TL/ysDPMHSdVq4iJ9WgMdA
 QfYwQDACeRZ50I2gK0KDluGwb/tqRyJtwd746sqZApBH8aaQlA1MCjjhYEgDvTlUb0nILcNJP
 AZ+hbbPr/2u+vxno7ldIPuNXrgk4Q8kSeMrp0pW9xj6mWB63wXqJrhmJRdS6xJ8Oxc+QubRk2
 5G+aV0yZ8DrbsvutefTHmT+Ses/FSQ7UsgZHJZcc38EFVxDF0ZjxB27SsUv3MNcOuXliFp9Og
 oNN5WbazyNxO7bOkZ8SOVOI5Kor3f3PBL5xMmEPL8iyuvP7BqLHSJSUR7yXUAY3OTUOSLY6VI
 U5mwk56R21k92JuBeWw13H1CiAdvCUGoKc3OqgzieAh12NybUk3ZHJTZOAnWzPsJUUcVX5xOm
 kvp1xCPkhj7DSHi+cjhh4sEWHROnxLFyejY2OGbgtUog9iXp5r+ubKn5O74B22Um7IhXjW/EL
 L/Yi8xcGqJwSNHY798jh+JK9K2ytHnR5ALtEHeecNOjY4cwaDS9CuHem26sSmokVlHPGcGP++
 t+/STJkXAbVx8FvqioqxoR92VRmVPGJjiFdXHt7jC/JrsOza2HwbeLBDIVa27dupsSdr2MBjh
 LO47feOPDtH1iu+9PfhjaScaAQzjL4l/XMb0QbKIvIm1rdREpuW5BLOImUP53M1j93Q4kbb22
 LIXUb44d/EuqICOmFUGvjVnC1k6kUIuO0edDYw/iR9PoI/9q2SJ4wlFATpg5+iRIe6MtzNWAz
 JyPo/rG8gQ1rmL4KGXfXOP/01eGD3kS9VxiHlryj76dkXM1I/6MQIXTzwjVaf2+S+/BWJaT4g
 accLCEH3InwO7dRHbk0oMs4YuFNkcs2QMJ8eulRHoy0peCM+wVSHDNYyOizK2H6cx1H5mBc2V
 y/kSKm0/HxEmcaN2VvGBC9eQLls=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Implement the missing cacheflush() syscall.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/assembly.h      |  7 ++++
 arch/parisc/include/uapi/asm/cachectl.h | 12 +++++++
 arch/parisc/kernel/cache.c              | 46 +++++++++++++++++++++++++
 arch/parisc/kernel/syscalls/syscall.tbl |  1 +
 4 files changed, 66 insertions(+)
 create mode 100644 arch/parisc/include/uapi/asm/cachectl.h

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/=
assembly.h
index 0f0d4a496fef..286fea9b6372 100644
=2D-- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -581,6 +581,13 @@
 	.word (fault_addr - .), (except_addr - .)	!	\
 	.previous

+#else /* __ASSEMBLY__ */
+
+#ifdef CONFIG_64BIT
+# define COND(x)	"*" __stringify(x)
+#else
+# define COND(x)	__stringify(x)
+#endif

 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/parisc/include/uapi/asm/cachectl.h b/arch/parisc/include=
/uapi/asm/cachectl.h
new file mode 100644
index 000000000000..68d6b455498b
=2D-- /dev/null
+++ b/arch/parisc/include/uapi/asm/cachectl.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _ASM_CACHECTL
+#define _ASM_CACHECTL
+
+/*
+ * Options for cacheflush system call
+ */
+#define ICACHE	(1<<0)		/* flush instruction cache	  */
+#define DCACHE	(1<<1)		/* writeback and flush data cache */
+#define BCACHE	(ICACHE|DCACHE) /* flush both caches		  */
+
+#endif	/* _ASM_CACHECTL */
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index ca4a302d4365..b2c6da38a61c 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -19,6 +19,7 @@
 #include <linux/pagemap.h>
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
+#include <linux/syscalls.h>
 #include <asm/pdc.h>
 #include <asm/cache.h>
 #include <asm/cacheflush.h>
@@ -28,6 +29,7 @@
 #include <asm/sections.h>
 #include <asm/shmparam.h>
 #include <asm/mmu_context.h>
+#include <asm/cachectl.h>

 int split_tlb __ro_after_init;
 int dcache_stride __ro_after_init;
@@ -774,3 +776,47 @@ void invalidate_kernel_vmap_range(void *vaddr, int si=
ze)
 	flush_tlb_kernel_range(start, end);
 }
 EXPORT_SYMBOL(invalidate_kernel_vmap_range);
+
+SYSCALL_DEFINE3(cacheflush, unsigned long, addr, unsigned long, bytes,
+	unsigned int, cache)
+{
+	unsigned long start, end;
+	ASM_EXCEPTIONTABLE_VAR(error);
+
+	if (bytes =3D=3D 0)
+		return 0;
+	if (cache & ~BCACHE)
+		return -EINVAL;
+	if (!access_ok((void __user *) addr, bytes))
+		return -EFAULT;
+	if ((cache_info.dc_size =3D=3D 0) && (cache_info.ic_size =3D=3D 0))
+		return 0;
+
+	end =3D addr + bytes;
+	if (end < addr)
+		return -EINVAL;	/* wrap-around */
+
+	if (cache & ICACHE) {
+		start =3D addr;
+		__asm__ __volatile__ (
+			"1: cmpb," COND(<<) ",n	%0,%2,1b\n"
+			"   fic,m	%3(%4,%0)\n"
+			"2:\n"
+			ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 2b)
+			: "+r" (start), "+r" (error)
+			: "r" (end), "r" (icache_stride), "i" (SR_USER));
+	}
+
+	if (cache & DCACHE && error =3D=3D 0) {
+		start =3D addr;
+		__asm__ __volatile__ (
+			"1: cmpb," COND(<<) ",n	%0,%2,1b\n"
+			"   fdc,m	%3(%4,%0)\n"
+			"2:\n"
+			ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 2b)
+			: "+r" (start), "+r" (error)
+			: "r" (end), "r" (dcache_stride), "i" (SR_USER));
+	}
+
+	return error;
+}
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/=
syscalls/syscall.tbl
index 0e42fceb2d5e..293c0484447b 100644
=2D-- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -400,6 +400,7 @@
 353	common	pkey_free		sys_pkey_free
 354	common	rseq			sys_rseq
 355	common	kexec_file_load		sys_kexec_file_load		sys_kexec_file_load
+356	common	cacheflush		sys_cacheflush
 # up to 402 is unassigned and reserved for arch specific syscalls
 403	32	clock_gettime64			sys_clock_gettime		sys_clock_gettime
 404	32	clock_settime64			sys_clock_settime		sys_clock_settime
=2D-
2.40.1


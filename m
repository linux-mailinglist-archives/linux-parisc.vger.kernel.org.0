Return-Path: <linux-parisc+bounces-1590-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3197890E041
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Jun 2024 01:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A89D91F22D6D
	for <lists+linux-parisc@lfdr.de>; Tue, 18 Jun 2024 23:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC22517BB00;
	Tue, 18 Jun 2024 23:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5mo66Qc"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C884717A92C
	for <linux-parisc@vger.kernel.org>; Tue, 18 Jun 2024 23:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718754951; cv=none; b=sFfKXMiHojAFoke4tvsQntfgTxKL4ipEwyXnLvG6dmjD58YpshAJeutKexHSCkC/uIsRNlk/Y/txbb1et7Ufx4qWFcj0lv9/1Ih5wqVtLlFR+fH281c6daJs6fA+ICwLbCChv5+Vdw73/xaYpIyv9i4obu4FKRH8hW3YYAQMuok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718754951; c=relaxed/simple;
	bh=a4W0DsoZVBIhZK7pX/q1lgVXh3ZO4Y84AOpnmkNRY1M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AbT0FKJ+eMnr9l9aSI2/ZzTOJK7gYj4zbcWm21xaM6wnlHtdmrhvfpFS4iNjtVLXLzqHbNzoCsV3uemW2bhPYCz+GcnM2Inr22vnWJYISPv6ceszLcKRPMLGFGPCQX7i8ievN29tDCtt6SCGbRHAAMIp7SgZZCWyitcuG+afDjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5mo66Qc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA869C3277B;
	Tue, 18 Jun 2024 23:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718754951;
	bh=a4W0DsoZVBIhZK7pX/q1lgVXh3ZO4Y84AOpnmkNRY1M=;
	h=Date:From:To:Subject:From;
	b=t5mo66Qct/pL0DSZ7hg9OzwdheWsIogeFW7Ibouj7fNUKyRGth7x2WK0BvdCPvfAQ
	 S2kjruOsK2HLDittYfXxGKHNHMfh3baXUsOwNmejip6B6/Ad1X6LQx9sCmfuSDiZWs
	 o4z6/G5yAB7XuNf01ZyImekYA4qFsllpKWZgskCov3SQJ9lpKFjHRTEivJbSN4WYf3
	 XKdTKuFGCo0VKpooKCHCKisw2khC7Q/3o0LNTDGGTFXJnrszWNYpHoNlTmY02uUQ1I
	 wmUevyRCqAMRax6MyMQQVpxRFxQyrCpHF3eOXfbKSWGJ0AYrJJ4yBC2gRCz+Q23Yu5
	 JiYkpLkEtM4Jg==
Date: Wed, 19 Jun 2024 01:55:48 +0200
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Add basic gettimeofday vDSO functions
Message-ID: <ZnIehJ_n458_qYON@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add basic functions which simply call the kernel syscall.
This patch needs a correspondig glibc patch.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index e38f9a90ac15..9906e11e3f74 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -43,7 +43,7 @@
    across the syscall. */
 
 #define K_CALL_CLOB_REGS "%r1", "%r2", K_USING_GR4 \
-	        	 "%r20", "%r29", "%r31"
+			 "%r20", "%r29", "%r31"
 
 #undef K_INLINE_SYSCALL
 #define K_INLINE_SYSCALL(name, nr, args...)	({			\
@@ -58,7 +58,7 @@
 			"	ldi %1, %%r20\n"			\
 			K_LDW_ASM_PIC					\
 			: "=r" (__res)					\
-			: "i" (SYS_ify(name)) K_ASM_ARGS_##nr   	\
+			: "i" (name) K_ASM_ARGS_##nr			\
 			: "memory", K_CALL_CLOB_REGS K_CLOB_ARGS_##nr	\
 		);							\
 		__sys_res = (long)__res;				\
@@ -104,42 +104,18 @@
 #define K_CLOB_ARGS_1 K_CLOB_ARGS_2, "%r25"
 #define K_CLOB_ARGS_0 K_CLOB_ARGS_1, "%r26"
 
-#define _syscall0(type,name)						\
-type name(void)								\
-{									\
-    return K_INLINE_SYSCALL(name, 0);	                                \
-}
-
-#define _syscall1(type,name,type1,arg1)					\
-type name(type1 arg1)							\
-{									\
-    return K_INLINE_SYSCALL(name, 1, arg1);	                        \
-}
-
-#define _syscall2(type,name,type1,arg1,type2,arg2)			\
-type name(type1 arg1, type2 arg2)					\
-{									\
-    return K_INLINE_SYSCALL(name, 2, arg1, arg2);	                \
-}
-
-#define _syscall3(type,name,type1,arg1,type2,arg2,type3,arg3)		\
-type name(type1 arg1, type2 arg2, type3 arg3)				\
-{									\
-    return K_INLINE_SYSCALL(name, 3, arg1, arg2, arg3);	                \
-}
-
-#define _syscall4(type,name,type1,arg1,type2,arg2,type3,arg3,type4,arg4) \
-type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4)		\
-{									\
-    return K_INLINE_SYSCALL(name, 4, arg1, arg2, arg3, arg4);	        \
-}
-
-/* select takes 5 arguments */
-#define _syscall5(type,name,type1,arg1,type2,arg2,type3,arg3,type4,arg4,type5,arg5) \
-type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5)	\
-{									\
-    return K_INLINE_SYSCALL(name, 5, arg1, arg2, arg3, arg4, arg5);	\
-}
+#define syscall0(name)						\
+	K_INLINE_SYSCALL(name, 0)
+#define syscall1(name, arg1)					\
+	K_INLINE_SYSCALL(name, 1, arg1)
+#define syscall2(name, arg1, arg2)				\
+	K_INLINE_SYSCALL(name, 2, arg1, arg2)
+#define syscall3(name, arg1, arg2, arg3)			\
+	K_INLINE_SYSCALL(name, 3, arg1, arg2, arg3)
+#define syscall4(name, arg1, arg2, arg3, arg4)			\
+	K_INLINE_SYSCALL(name, 4, arg1, arg2, arg3, arg4)
+#define syscall5(name, arg1, arg2, arg3, arg4, arg5)		\
+	K_INLINE_SYSCALL(name, 5, arg1, arg2, arg3, arg4, arg5)
 
 #define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_STAT64
diff --git a/arch/parisc/kernel/vdso32/Makefile b/arch/parisc/kernel/vdso32/Makefile
index 4459a48d2303..ef177c15d9ff 100644
--- a/arch/parisc/kernel/vdso32/Makefile
+++ b/arch/parisc/kernel/vdso32/Makefile
@@ -1,11 +1,25 @@
-# List of files in the vdso, has to be asm only for now
+# Include the generic Makefile to check the built vdso.
+include $(srctree)/lib/vdso/Makefile
+
+KCOV_INSTRUMENT := n
+
+# Disable gcov profiling, ubsan and kasan for VDSO code
+GCOV_PROFILE := n
+UBSAN_SANITIZE := n
+KASAN_SANITIZE := n
+KCSAN_SANITIZE := n
 
 obj-vdso32 = note.o sigtramp.o restart_syscall.o
+obj-cvdso32 = vdso32_generic.o
 
 # Build rules
 
-targets := $(obj-vdso32) vdso32.so
+targets := $(obj-vdso32) $(obj-cvdso32) vdso32.so
 obj-vdso32 := $(addprefix $(obj)/, $(obj-vdso32))
+obj-cvdso32 := $(addprefix $(obj)/, $(obj-cvdso32))
+
+VDSO_CFLAGS_REMOVE := -pg $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_vdso32_generic.o = $(VDSO_CFLAGS_REMOVE)
 
 ccflags-y := -shared -fno-common -fbuiltin -mno-fast-indirect-calls -O2 -mno-long-calls
 #  -march=1.1 -mschedule=7100LC
diff --git a/arch/parisc/kernel/vdso32/vdso32.lds.S b/arch/parisc/kernel/vdso32/vdso32.lds.S
index d4aff3af5262..66a5a0d78cdb 100644
--- a/arch/parisc/kernel/vdso32/vdso32.lds.S
+++ b/arch/parisc/kernel/vdso32/vdso32.lds.S
@@ -106,6 +106,9 @@ VERSION
     global:
 	__kernel_sigtramp_rt32;
 	__kernel_restart_syscall32;
+	__vdso_gettimeofday;
+	__vdso_clock_gettime32;
+	__vdso_clock_gettime64;
     local: *;
   };
 }
diff --git a/arch/parisc/kernel/vdso32/vdso32_generic.c b/arch/parisc/kernel/vdso32/vdso32_generic.c
new file mode 100644
index 000000000000..6dbe242db88a
--- /dev/null
+++ b/arch/parisc/kernel/vdso32/vdso32_generic.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* need to save GR4 across syscall */
+#define PIC
+#include "asm/unistd.h"
+#include <linux/types.h>
+
+struct timezone;
+struct old_timespec32;
+struct __kernel_timespec;
+struct __kernel_old_timeval;
+
+/* forward declarations */
+int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
+int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts);
+int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts);
+
+
+int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
+			struct timezone *tz)
+{
+	return syscall2(__NR_gettimeofday, (long)tv, (long)tz);
+}
+
+int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
+{
+	return syscall2(__NR_clock_gettime, (long)clock, (long)ts);
+}
+
+int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts)
+{
+	return syscall2(__NR_clock_gettime64, (long)clock, (long)ts);
+}


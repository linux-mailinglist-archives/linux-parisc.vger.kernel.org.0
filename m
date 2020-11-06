Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5FA62A9C92
	for <lists+linux-parisc@lfdr.de>; Fri,  6 Nov 2020 19:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgKFSlq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 6 Nov 2020 13:41:46 -0500
Received: from mout.gmx.net ([212.227.17.22]:49775 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727765AbgKFSlp (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 6 Nov 2020 13:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1604688098;
        bh=kkHkcwfLqvEV2bHYOHcMWNJ/zNeFuUzS88Et2USxHw0=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=QgjyiB78fOmXGiqRz2okhfXEmfM17D7jxTKnquQwNH9tuD3ddzvx5CIgayJtyqo33
         0Q/j+jKwNFK9PO/nSBdEeUiila+nFB9cBVi2ElbkUg1Q65dD8AXbkkhMAe99PSHPaN
         LeSV5CagzZxFx8SkkXiruDb7aXoTGXPS2LqA1/hY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.154.21]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCpb-1k0xBF0PsF-00bIGs; Fri, 06
 Nov 2020 19:41:38 +0100
Date:   Fri, 6 Nov 2020 19:41:36 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Make user stack size configurable
Message-ID: <20201106184136.GA12452@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Ckbq+vMhKVN590fZsJPmJCyt14c1kRkNjVTt2ME4B70KcZ1Oo51
 EYSC7gimP9rPb6YPbqVnUsBFPPToU7l92h3F66EyoeEG5jSLx/LatUGJmTyW4zDVT7ao6px
 0VohicnjLoLe2x1LanxJEYTBSXcSMDKTNMfC/GDEkuEywn+4xEzbPhc/PR5/bmo1EK6s1ll
 E2uAyniNB87D6DBLYJjWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jeMT5KUX1sA=:ZmGJUE3ijRB2sNtuG6wj4V
 Ksapz4VrI/gQDCiTp8uGDLq00dxQv+Hvfhdbx1Q2cM5yISZeJdi+ZWMTinXclmlmCpXI1BbZH
 nxkbdO2fPJN74/eADXanPGQI5G274ZhuWiLq5ezM0FOJgIvZRsXuS/DYjFTegua9iTx4KQzMS
 laIwWUD6L+u6HxBXXvRHxVQSrzD67gQK7vnuRrNranA7Tx0Yqas/aYUSgn+ksfLrlIlgeldMg
 rE5Lnhp5Wa++SxM9eXsEGQQaR7ReBnZzuFhqS/tKzuYX7IbLYOirO3PpajNuLjIO7nekZyTb9
 Q298vUeurTUkow8k8ZhuJmxlohUbJK3iRNO7Va4T+mEkyQrVG2IQLHHYRMjOc7jQ6D/8qjyNs
 gNa3wHgH25NhEcJH+Si53d82i5xseIutmeubZvgT+QQ7Bwmg2vzLezKLk5bi19jf8tbXbaxP8
 En7G8Q/PfAwRWPL/9c8Ec8FGx6LgBRzp7+gTndtpCgCYt6uYkfmEVdGXC6zYoNdbaKe1Rp0h4
 x2fz+19BYdqjOxbJAHHTxMwX8A0uZ65QPtkmS20O7qYK8OfzXID7fhBzav37y2ibDHDzydYXp
 sGKo/MwK9Rngzl2HudR1M0Ocx6MXQVtZHErH6CTxhXgt2MGUCTtT3vUJH8ziB+62Q4VVac+y9
 P91nTJ2RzEqWcNvMH53RRZ3B/a8U1Jr1pW0BP7sVXu8yzBJ+4Ipqf0sPFOwucawnyd9pKIbNq
 yQVSQEes0cMDiW0GNN74oZX/VG9mfh1zypyg3JCPJ/zya2UdlDD35d0MDVCE5QQecMJHTcdSf
 2qNlCqBxRckLCpruwwnA1b67frOJXIAQjk7S0JeF1ZUTU/SEdDzRrzTee2FpgyOFCba5+35CC
 hmiKFBuGDqXuFxd7P79A==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On parisc we need to initialize the memory layout for the user stack at
process start time to a fixed size, which up until now was limited to
the size as given by CONFIG_MAX_STACK_SIZE_MB at compile time.

This hard limit was too small and showed problems when compiling
ruby2.7, qmlcachegen and some Qt packages.

This patch changes two things:
a) It increases the default maximum stack size to 100MB.
b) Users can modify the stack hard limit size with ulimit and then newly
   forked processes will use the given stack size which can even be bigger
   than the default 100MB.

Reported-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm=
/processor.h
index 0f7e30547dab..a5702b05cc49 100644
=2D-- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -45,15 +45,12 @@
 #define STACK_TOP	TASK_SIZE
 #define STACK_TOP_MAX	DEFAULT_TASK_SIZE

-/* Allow bigger stacks for 64-bit processes */
-#define STACK_SIZE_MAX	(USER_WIDE_MODE					\
-			 ? (1 << 30)	/* 1 GB */			\
-			 : (CONFIG_MAX_STACK_SIZE_MB*1024*1024))
-
 #endif

 #ifndef __ASSEMBLY__

+unsigned long calc_max_stack_size(unsigned long stack_max);
+
 /*
  * Data detected about CPUs at boot time which is the same for all CPU's.
  * HP boxes are SMP - ie identical processors.
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_pari=
sc.c
index 9549496f5523..5f12537318ab 100644
=2D-- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -53,6 +53,25 @@ static inline unsigned long COLOR_ALIGN(unsigned long a=
ddr,
 	return base + off;
 }

+
+#define STACK_SIZE_DEFAULT (USER_WIDE_MODE			\
+			? (1 << 30)	/* 1 GB */		\
+			: (CONFIG_STACK_MAX_DEFAULT_SIZE_MB*1024*1024))
+
+unsigned long calc_max_stack_size(unsigned long stack_max)
+{
+#ifdef CONFIG_COMPAT
+	if (!USER_WIDE_MODE && (stack_max =3D=3D COMPAT_RLIM_INFINITY))
+		stack_max =3D STACK_SIZE_DEFAULT;
+	else
+#endif
+	if (stack_max =3D=3D RLIM_INFINITY)
+		stack_max =3D STACK_SIZE_DEFAULT;
+
+	return stack_max;
+}
+
+
 /*
  * Top of mmap area (just below the process stack).
  */
@@ -69,8 +88,8 @@ static unsigned long mmap_upper_limit(struct rlimit *rli=
m_stack)
 	/* Limit stack size - see setup_arg_pages() in fs/exec.c */
 	stack_base =3D rlim_stack ? rlim_stack->rlim_max
 				: rlimit_max(RLIMIT_STACK);
-	if (stack_base > STACK_SIZE_MAX)
-		stack_base =3D STACK_SIZE_MAX;
+
+	stack_base =3D calc_max_stack_size(stack_base);

 	/* Add space for stack randomization. */
 	if (current->flags & PF_RANDOMIZE)
diff --git a/fs/exec.c b/fs/exec.c
index 547a2390baf5..a6f2c27f875b 100644
=2D-- a/fs/exec.c
+++ b/fs/exec.c
@@ -756,8 +756,8 @@ int setup_arg_pages(struct linux_binprm *bprm,
 #ifdef CONFIG_STACK_GROWSUP
 	/* Limit stack size */
 	stack_base =3D bprm->rlim_stack.rlim_max;
-	if (stack_base > STACK_SIZE_MAX)
-		stack_base =3D STACK_SIZE_MAX;
+
+	stack_base =3D calc_max_stack_size(stack_base);

 	/* Add space for stack randomization. */
 	stack_base +=3D (STACK_RND_MASK << PAGE_SHIFT);
diff --git a/mm/Kconfig b/mm/Kconfig
index d42423f884a7..4ec0f3dbfb11 100644
=2D-- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -733,19 +733,17 @@ config ZSMALLOC_STAT
 config GENERIC_EARLY_IOREMAP
 	bool

-config MAX_STACK_SIZE_MB
-	int "Maximum user stack size for 32-bit processes (MB)"
-	default 80
+config STACK_MAX_DEFAULT_SIZE_MB
+	int "Default maximum user stack size for 32-bit processes (MB)"
+	default 100
 	range 8 2048
 	depends on STACK_GROWSUP && (!64BIT || COMPAT)
 	help
 	  This is the maximum stack size in Megabytes in the VM layout of 32-bit
 	  user processes when the stack grows upwards (currently only on parisc
-	  arch). The stack will be located at the highest memory address minus
-	  the given value, unless the RLIMIT_STACK hard limit is changed to a
-	  smaller value in which case that is used.
+	  arch) when the RLIMIT_STACK hard limit is unlimited.

-	  A sane initial value is 80 MB.
+	  A sane initial value is 100 MB.

 config DEFERRED_STRUCT_PAGE_INIT
 	bool "Defer initialisation of struct pages to kthreads"

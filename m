Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387CF42979D
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Oct 2021 21:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231826AbhJKTjR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 11 Oct 2021 15:39:17 -0400
Received: from mout.gmx.net ([212.227.15.19]:41039 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232027AbhJKTjQ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 11 Oct 2021 15:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633981030;
        bh=QAkYHO75qRUyyJ9BCPtblE2RXcsN0DoL47tsTxmF9/8=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=EYeHTj6npTEvNKfIxAJQtWYH7K1hYDI8zHqtZ/l4MyztgXNt4Gve/sUF3+L6yp7v5
         14b5uh33qZf9sNT2yGhFxxEOOji4Q9xzAlcnYAgQRgF0szsRUni05lEoXh5pph3HTH
         9m801wl7jKerEPhStukvyYiOlCaO/BVTEcWOBdQI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.151.125]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MybGh-1mxJpA3Jdt-00yuiX; Mon, 11
 Oct 2021 21:37:09 +0200
Date:   Mon, 11 Oct 2021 21:36:55 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix xmpyu usage in 32-bit kernel
Message-ID: <YWSSVwQ9tc9YaC+f@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:ehVbgEKzW9qjQ17X3SaaVcoRdvMbY/3lXHbTW35oV/G7DtMSipv
 pLsF8bO8YwnlDqCY2P6jEiAvlQYqjziUliFEm8slzq1Ao9UVW51ARRFMCtv3Kh3zlpnWIVl
 qPpSosQQs53yO5eQz7cysjbrZi8pr+NTW1ffF8g0jARVeAWm5CNuisC6xbxbqLWXbv6ixlk
 RPRnik+7u3CUHaZPJR1FQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wgAn/1oGs/k=:YJ/CXv3H1MUP453nBkeXU5
 92udgJ5ibWyA0zoc++fD6cmEAVLXFZR+bJDAb0Nud3XHrbIlDuPVW0eOc9ICzCjRwXPQ5wVRs
 /Y9SPNghAdsQKv18lvZSBYIySD1tgmiDTmvbgDnwFcbVKbbMI1izLRkYHqPGp+p/7xiekKPZL
 FqqnzG/rS0eoamzcjRO1ktpZnodQjalREhfJZzTigLJBzkdvHcTX+WAZKWIv6EYJeA/bwuyle
 8elxLd7y/2vN7EIjVVAweo9hg0Ik+G1Us9gCtGIqeT5jwq6cVFVQ/QC+gKoIn5mT4k/zeMNkn
 6hZb8LNCsHtOfsrCxInppHfdU28iCy2sMvpYx1KCXm/XlQoiIJgo8nyCWeCOrCL5x5tTO7nro
 Lv6aTEWxl7vq08YkRh9UGCWR1ohqTm1d9sqzRQ3mTtnSZmed5vKF7/rzINbfqhJT9kTVJICsU
 f/1fJDNELZaHbZ0VvgdKANqrXxztb519jD4Le+Qfsw/hgi1OBRPQgE003gGnaPUpVbiFApqAU
 JFtois2BuBKaVfP9wp5cU4aaaNZC1MgMl8tzgQ1aS77zj+tDo5CH/khENyGWuelz+LZwJLDZs
 Vd8iXDa9foHBlL3ZANw3nn29IZU0DKjH6Ra0qhOmxyMMagMOGPQeuaHs6M87E75uVfAsHSnG8
 FWz418Z4E+/g7G7sXw+N4tTqHnBt/v7ekW8kCbZq1FzFZEIResfEmF6DI3gN8WMCipr343JbH
 SU28TTIo5RSNAsjS1NQ64WsUuyv3V6uBoXM/x2r6y4Qg6ObcLpyOsU0RzCFtc2BVVLvGz67OM
 BnzfGXlGPih1vdUkBqn3kFyR8U8C3HrOpfAmrGdgvXBzHjAEZyrxrzZ60VvNRkeZskfJiKNa1
 Cf3xkGnuttAvF6uTeSfwl6708m0QQhKU2xkntYyauzNaJIJ8w8JuEa0nbJ92f0/SVOURABplN
 /SHREG920/rUT5oXz4wmPoH9aMsdvkqLRag0zWGUwGZpb+rDUBLvwT3HgXhDYxi8m9+uK+yEv
 fx5sDk4NfyQaYOvcS68Mt/umoTJ5noUxTDnFmjC7tjBGwCo3ZSzHdEpoQMpuCxwfP8e3kgQNv
 RHASYpbnyrva4U=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Dave noticed that the libgcc.a which is linked into the kernel binary
uses the xmpyu assembler statement. This asm statement uses floating
point registers which are forbidden in the kernel, because we don't save
the FP regs at kernel entry.

Switch the parisc kernel to use the already existing shared copies of
some GCC library routines instead of linking in those from libgcc.

This patch avoids all uses of xmpyu in the 32-bit kernel, but the 64-bit
kernel still needs fixing.

Reported-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index fc17285f4da1..e412d5c6c64f 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -36,6 +36,12 @@ config PARISC
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_CPU_DEVICES
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_LIB_ASHLDI3
+	select GENERIC_LIB_ASHRDI3
+	select GENERIC_LIB_LSHRDI3
+	select GENERIC_LIB_MULDI3
+	select GENERIC_LIB_CMPDI2
+	select GENERIC_LIB_UCMPDI2
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	select SYSCTL_EXCEPTION_TRACE
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc=
_ksyms.c
index 00297e8e1c88..da8c99c5a8c6 100644
=2D-- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -92,18 +92,6 @@ EXPORT_SYMBOL($$divI_12);
 EXPORT_SYMBOL($$divI_14);
 EXPORT_SYMBOL($$divI_15);

-extern void __ashrdi3(void);
-extern void __ashldi3(void);
-extern void __lshrdi3(void);
-extern void __muldi3(void);
-extern void __ucmpdi2(void);
-
-EXPORT_SYMBOL(__ashrdi3);
-EXPORT_SYMBOL(__ashldi3);
-EXPORT_SYMBOL(__lshrdi3);
-EXPORT_SYMBOL(__muldi3);
-EXPORT_SYMBOL(__ucmpdi2);
-
 asmlinkage void * __canonicalize_funcptr_for_compare(void *);
 EXPORT_SYMBOL(__canonicalize_funcptr_for_compare);

diff --git a/arch/parisc/lib/Makefile b/arch/parisc/lib/Makefile
index 7b197667faf6..2bfafb3c9ae0 100644
=2D-- a/arch/parisc/lib/Makefile
+++ b/arch/parisc/lib/Makefile
@@ -4,6 +4,6 @@
 #

 lib-y	:=3D lusercopy.o bitops.o checksum.o io.o memset.o memcpy.o \
-	   ucmpdi2.o delay.o
+	   delay.o

 obj-y	:=3D iomap.o
diff --git a/arch/parisc/lib/ucmpdi2.c b/arch/parisc/lib/ucmpdi2.c
deleted file mode 100644
index 8e6014a142ef..000000000000
=2D-- a/arch/parisc/lib/ucmpdi2.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/module.h>
-
-union ull_union {
-	unsigned long long ull;
-	struct {
-		unsigned int high;
-		unsigned int low;
-	} ui;
-};
-
-int __ucmpdi2(unsigned long long a, unsigned long long b)
-{
-	union ull_union au =3D {.ull =3D a};
-	union ull_union bu =3D {.ull =3D b};
-
-	if (au.ui.high < bu.ui.high)
-		return 0;
-	else if (au.ui.high > bu.ui.high)
-		return 2;
-	if (au.ui.low < bu.ui.low)
-		return 0;
-	else if (au.ui.low > bu.ui.low)
-		return 2;
-	return 1;
-}

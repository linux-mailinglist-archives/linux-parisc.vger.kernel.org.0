Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0130B2962DE
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Oct 2020 18:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2444575AbgJVQke (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 22 Oct 2020 12:40:34 -0400
Received: from mout.gmx.net ([212.227.17.22]:51659 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2897418AbgJVQke (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Oct 2020 12:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603384810;
        bh=VfqWNjbzfIucn48vaNQ714VtNlxCJdB+NtrusuLsn1A=;
        h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
        b=G1Fa9FOxHvaryY9BxI6QAjNGfGLg+vD2U717ombRVmR0EbUbfHMcayUCK+lLqQSt2
         qjDgGblADPyIKXbFSlvETxXsqtzfzSFrekc1GIHJyZPYcbUEeDyESaaA1Ho+uEk998
         jbG0GPguXOxpCWo0iKTk9irA7OH+58GddEvmrp7o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.134.214]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MplXp-1k3g8N2mT7-00qCSL; Thu, 22
 Oct 2020 18:40:10 +0200
Date:   Thu, 22 Oct 2020 18:40:07 +0200
From:   Helge Deller <deller@gmx.de>
To:     Jeroen Roovers <jer@xs4all.nl>, linux-parisc@vger.kernel.org,
        Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [RFC PATCH] parisc: Add wrapper syscalls to fix O_NONBLOCK flag usage
Message-ID: <20201022164007.GA10653@ls3530.fritz.box>
References: <20200829122017.GA3988@ls3530.fritz.box>
 <20201020192101.772bedd5@wim.jer>
 <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
 <20201022173824.49b6b7f5@wim.jer>
 <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
X-Provags-ID: V03:K1:6vas5xcBHIDnpk26tvNZzCOen5WOnj5x8W5QCRvXZvL44ZdepD1
 gGN6wNM50Tm0OPTgMNqwfRN5TwF8kadkcLvhVTOZfGNOLVP7wPmn/RiaMEEjNaws1NksaYS
 1LqG7eoX7v5lTK9yIzBj146Eu/RNfeJCR8MiBQJA1NR3iOERydSjVcSZSP8hT1OziEvZMXz
 VYv7dHhgIk2g044ck3PjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0Uyxu5bsmI8=:o2anHqQaHlNBDEGhCE3IPP
 P455sY2kRaUiI7SXyxdahP55+UhlyGx+yTmzUpZZAP4boLn+3N3JGqu+yCUi/psE0Sb0/8FKk
 Sxq8XfZ03KpH6iASGVfwhhvR4oCcG6RaggbETT0u0kEoEMtfaz/puhN6FGUqi8zmXDUWKVNG9
 YIZd82xjUv3g7O8crkhr8msiQ5BOmtMuZxgiCy6W3+5KP4S60HxSiLeFFKpLRg++ILjjA3tQk
 lmoWOgo38JkXM1UFwL2IswIJPYvVFZL5SypwjGVhonxDC5SdNmHKHEN7NeLPCpBKWyT3dfdPq
 Uh/UHgQ3MbE7C+FH8SvXWQGJCNkXEw0HZAXfY8syQweivQoz53QdhIkmGpWA6IpXrVvOWx9pU
 Kb8YbGON06HkjGRj51JitOEk9sTQDsUmOKu7sIucXeabCP3NV4wahhyt3n1FtlYoB6utpNxKf
 7EY/OGWI63tGxEIAwvEfwQQLv1vOO0vtCF5ngstky8Pz4aObjbZxH+82iCl1uU/YXc3Rd66Lk
 QBDr1MxsVuP6hUAIp5DeJEeOxiPYGGDBEpGBppErn8s4yb0+lynoG1ltPJ/jhEnsVkmRGrZu/
 pxy6VeVWuBZaEVKogqooVS4d6LFZtFvx5h9VPJB4C3oSEdvY65hFlw/melWSQlCfbnXg/Os8s
 IoRIjDGdDIeMUWCIwOp65llTY/0ORQYN6EfVW1aLWTKXfItS0GliAgEjKCGuisw1KDakSeKpX
 SwoqhO9II2B1tVW1QR60b1Dact00Q1v0lH6qPCk6il4rAWWKWQMVcsz7cUjP7hP1MqrFrmKaK
 Ya6id8J8T5Vb/UU373fPkoERRfe0hTT/7GYgdtDCSkeH/z4nGw7Ti3xw/S4oXRXLwPtpGlGN9
 wT2i9W/WkLaYcdKVkEWg==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The commit 75ae04206a4d ("parisc: Define O_NONBLOCK to become
000200000") changed the O_NONBLOCK constant to have only one bit set
(like all other architectures). This change broke some existing
userspace code (e.g.  udevadm, systemd-udevd, elogind) which called
specific syscalls which do strict value checking on their flag
parameter.

This patch adds wrapper functions for the relevant syscalls. The
wrappers masks out any old invalid O_NONBLOCK flags, reports in the
syslog if the old O_NONBLOCK value was used and then calls the target
syscall with the new O_NONBLOCK value.

Fixes: 75ae04206a4d ("parisc: Define O_NONBLOCK to become 000200000")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_pari=
sc.c
index 5d458a44b09c..6dbb2315a80d 100644
=2D-- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -6,7 +6,7 @@
  *    Copyright (C) 1999-2003 Matthew Wilcox <willy at parisc-linux.org>
  *    Copyright (C) 2000-2003 Paul Bame <bame at parisc-linux.org>
  *    Copyright (C) 2001 Thomas Bogendoerfer <tsbogend at parisc-linux.or=
g>
- *    Copyright (C) 1999-2014 Helge Deller <deller@gmx.de>
+ *    Copyright (C) 1999-2020 Helge Deller <deller@gmx.de>
  */

 #include <linux/uaccess.h>
@@ -23,6 +23,8 @@
 #include <linux/utsname.h>
 #include <linux/personality.h>
 #include <linux/random.h>
+#include <linux/compat.h>
+#include <linux/version.h>

 /* we construct an artificial offset for the mapping based on the physica=
l
  * address of the kernel mapping variable */
@@ -373,3 +375,69 @@ long parisc_personality(unsigned long personality)

 	return err;
 }
+
+/*
+ * Up to kernel v5.9 we defined O_NONBLOCK as 000200004,
+ * since then O_NONBLOCK is defined as 000200000.
+ *
+ * The following wrapper functions mask out the old
+ * O_NDELAY bit from calls which use O_NONBLOCK.
+ */
+
+#if ((LINUX_VERSION_CODE >> 16) & 0x0ff) > 5
+#warning "Remove O_NONBLOCK compatibility wrappers now?"
+#endif
+
+#define O_NONBLOCK_OLD		000200004
+#define O_NONBLOCK_MASK_OUT	(O_NONBLOCK_OLD & ~O_NONBLOCK)
+static int FIX_O_NONBLOCK(int flags)
+{
+	if (flags & O_NONBLOCK_MASK_OUT) {
+		struct task_struct *tsk =3D current;
+		pr_warn("%s(%d) uses old O_NONBLOCK value. "
+			"Please recompile the application.\n",
+			tsk->comm, tsk->pid);
+	}
+	return flags & ~O_NONBLOCK_MASK_OUT;
+}
+
+asmlinkage long parisc_timerfd_create(int clockid, int flags)
+{
+	flags =3D FIX_O_NONBLOCK(flags);
+	return sys_timerfd_create(clockid, flags);
+}
+
+asmlinkage long parisc_signalfd4(int ufd, sigset_t __user *user_mask,
+	size_t sizemask, int flags)
+{
+	flags =3D FIX_O_NONBLOCK(flags);
+	return sys_signalfd4(ufd, user_mask, sizemask, flags);
+}
+
+#ifdef CONFIG_COMPAT
+asmlinkage long parisc_compat_signalfd4(int ufd,
+	compat_sigset_t __user *user_mask,
+	compat_size_t sizemask, int flags)
+{
+	flags =3D FIX_O_NONBLOCK(flags);
+	return compat_sys_signalfd4(ufd, user_mask, sizemask, flags);
+}
+#endif
+
+asmlinkage long parisc_eventfd2(unsigned int count, int flags)
+{
+	flags =3D FIX_O_NONBLOCK(flags);
+	return sys_eventfd2(count, flags);
+}
+
+asmlinkage long parisc_userfaultfd(int flags)
+{
+	flags =3D FIX_O_NONBLOCK(flags);
+	return sys_userfaultfd(flags);
+}
+
+asmlinkage long parisc_pipe2(int __user *fildes, int flags)
+{
+	flags =3D FIX_O_NONBLOCK(flags);
+	return sys_pipe2(fildes, flags);
+}
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/=
syscalls/syscall.tbl
index def64d221cd4..20ad16e762a1 100644
=2D-- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -344,16 +344,16 @@
 304	common	eventfd			sys_eventfd
 305	32	fallocate		parisc_fallocate
 305	64	fallocate		sys_fallocate
-306	common	timerfd_create		sys_timerfd_create
+306	common	timerfd_create		parisc_timerfd_create
 307	32	timerfd_settime		sys_timerfd_settime32
 307	64	timerfd_settime		sys_timerfd_settime
 308	32	timerfd_gettime		sys_timerfd_gettime32
 308	64	timerfd_gettime		sys_timerfd_gettime
-309	common	signalfd4		sys_signalfd4			compat_sys_signalfd4
-310	common	eventfd2		sys_eventfd2
+309	common	signalfd4		parisc_signalfd4		parisc_compat_signalfd4
+310	common	eventfd2		parisc_eventfd2
 311	common	epoll_create1		sys_epoll_create1
 312	common	dup3			sys_dup3
-313	common	pipe2			sys_pipe2
+313	common	pipe2			parisc_pipe2
 314	common	inotify_init1		sys_inotify_init1
 315	common	preadv	sys_preadv	compat_sys_preadv
 316	common	pwritev	sys_pwritev	compat_sys_pwritev
@@ -387,7 +387,7 @@
 341	common	bpf			sys_bpf
 342	common	execveat		sys_execveat			compat_sys_execveat
 343	common	membarrier		sys_membarrier
-344	common	userfaultfd		sys_userfaultfd
+344	common	userfaultfd		parisc_userfaultfd
 345	common	mlock2			sys_mlock2
 346	common	copy_file_range		sys_copy_file_range
 347	common	preadv2			sys_preadv2			compat_sys_preadv2

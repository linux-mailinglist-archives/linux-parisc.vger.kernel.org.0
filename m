Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53AC42976C2
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Oct 2020 20:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465252AbgJWSTD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Oct 2020 14:19:03 -0400
Received: from mout.gmx.net ([212.227.15.15]:58865 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S460259AbgJWSTD (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 14:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603477132;
        bh=trlhyNEc7Y4eITCg8+SIPYMEYO/JLfoelsqVZF4GrTo=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=ILEs4mQvx9576gTaTSGWzkY/gniyxW/O1sSk0sItOfXTW6ZFEumOZTBQPZoD2rSNh
         3h6+rU2QjCdtZclUn0ilxi2Y/4GB0qXuULPKAVq38HEm0LrCNxM+kpanWZLcECdMAB
         98MpRgr1d5ggRbmdt8tqavbp8aPT2iS16ojdXSqc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.145.200]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKFk-1keJ7m1FGE-009Q0e; Fri, 23
 Oct 2020 20:18:52 +0200
Date:   Fri, 23 Oct 2020 20:18:47 +0200
From:   Helge Deller <deller@gmx.de>
To:     Helge Deller <deller@gmx.de>
Cc:     Jeroen Roovers <jer@xs4all.nl>, linux-parisc@vger.kernel.org,
        Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [RFC PATCH v3] parisc: Add wrapper syscalls to fix O_NONBLOCK flag
 usage
Message-ID: <20201023181847.GA6776@ls3530.fritz.box>
References: <20200829122017.GA3988@ls3530.fritz.box>
 <20201020192101.772bedd5@wim.jer>
 <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
 <20201022173824.49b6b7f5@wim.jer>
 <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
 <20201022164007.GA10653@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022164007.GA10653@ls3530.fritz.box>
X-Provags-ID: V03:K1:x8iZnN9k77FjhtIx4CuWF2TAGm796qasS3rHzQPCZN9dZX/am/h
 /RL3CR9LW/H09RC3G4uitUKGAny/KVf3k+eZMHJGJKQn8MGWhfD5kXpGruVdRvAOIkR5FQt
 4suifdtLFbguY8HXuRwkXQd9oAE+Y/Aqc8+JuwXs4Q5bIkrO6GZX0Syn4vingYKv8yDlVQ1
 oq27f6gzO2k37ugbi6+og==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PJYuV2Au5KI=:YQIzkjYGjje1Sk/cWPyQaC
 S4GARboPsw4nCMEviulYBFxvS/g9NaLMPB2VHTr/ekHucCZGY/VOQv4K90Pt05b6Hg6OKWxUY
 2RD3Aav448ZwCRrLyFaCLxbZwaYDvuXFe9TmlQwWEyJdOPs6izv9HVAXzDK7T12Vn3/JNGZ6F
 eMM8REZl/GofaQXPK3BiprvE62Pz4sYo1vTvcCOsgA68rz/lUsea9Ya72b9qvLTwm6ACfDGc8
 k1yBS4eChYlfaKPcg7ASryqxwY2qHGD225YtDF3Pb1n40cwwNGVk49nXUVSu+8rnAksHvZC6q
 3vb88t4P/uU+MT88hRq9ThjoTFQDy/07AyR+7iH34no25O1/lSclSm7PhkEQgPUHY3MrI1X8L
 J38anjiAaEqek2jTqQqs+NUWbBBBJPUOXQICwwLgztTYCU+S3VvoXUtZIXJzJCInS53YxTEZN
 qoysypqIrooyxq8CrlCL6HbkbOURdKeSZ9tgoeRE4VmUlwXTK3ILxedU4IYzcB3hefcrWEJ0w
 3gOBK7+4e8T7Hqn7KoweMxhJEBRu0s0Dvrt4mIqqKhTDn7Tyt3e1c2xJDtTGiC2b/j5pXn2Le
 JPM5mhWgoWnwcx2HzYEvmU2zyHfCHVRrpU3GHCV83I/8dpbItCU8pxO+yIXE8BrW38RE6sgpj
 uxxQYjc8EuZrQC28WZjVRYRAAFJ4sbiotqlRHnWcGb1PSDa4QxjuUhrwb0Vrm65cfol5et6R2
 oSafQBddh2StBTivx+FbLt8iPzFez8NjC4/spL8wSKV5stEdTQLjzG8AG8Y5O2sps1AUVkhqs
 BmTvNNRlQpFeYa+mDwSHQPDl1rvGqCq5XgVYuZuwiUo0lOa/chAYdyM+tzWCpF+0eRHk0ETk/
 n17gPO4Swewygrn2LxOw==
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
Tested-by: Meelis Roos <mroos@linux.ee>
Tested-by: Jeroen Roovers <jer@xs4all.nl>

=2D-
v3: Added inotify_init1() syscall wrapper
    Changed warning to pr_warn_once()

diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_pari=
sc.c
index 5d458a44b09c..9549496f5523 100644
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
@@ -23,6 +23,7 @@
 #include <linux/utsname.h>
 #include <linux/personality.h>
 #include <linux/random.h>
+#include <linux/compat.h>

 /* we construct an artificial offset for the mapping based on the physica=
l
  * address of the kernel mapping variable */
@@ -373,3 +374,73 @@ long parisc_personality(unsigned long personality)

 	return err;
 }
+
+/*
+ * Up to kernel v5.9 we defined O_NONBLOCK as 000200004,
+ * since then O_NONBLOCK is defined as 000200000.
+ *
+ * The following wrapper functions mask out the old
+ * O_NDELAY bit from calls which use O_NONBLOCK.
+ *
+ * XXX: Remove those in year 2022 (or later)?
+ */
+
+#define O_NONBLOCK_OLD		000200004
+#define O_NONBLOCK_MASK_OUT	(O_NONBLOCK_OLD & ~O_NONBLOCK)
+
+static int FIX_O_NONBLOCK(int flags)
+{
+	if (flags & O_NONBLOCK_MASK_OUT) {
+		struct task_struct *tsk =3D current;
+		pr_warn_once("%s(%d) uses a deprecated O_NONBLOCK value.\n",
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
+
+asmlinkage long parisc_inotify_init1(int flags)
+{
+	flags =3D FIX_O_NONBLOCK(flags);
+	return sys_inotify_init1(flags);
+}
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/=
syscalls/syscall.tbl
index 38c63e5404bc..f375ea528e59 100644
=2D-- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -344,17 +344,17 @@
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
-314	common	inotify_init1		sys_inotify_init1
+313	common	pipe2			parisc_pipe2
+314	common	inotify_init1		parisc_inotify_init1
 315	common	preadv	sys_preadv	compat_sys_preadv
 316	common	pwritev	sys_pwritev	compat_sys_pwritev
 317	common	rt_tgsigqueueinfo	sys_rt_tgsigqueueinfo		compat_sys_rt_tgsigqu=
eueinfo
@@ -387,7 +387,7 @@
 341	common	bpf			sys_bpf
 342	common	execveat		sys_execveat			compat_sys_execveat
 343	common	membarrier		sys_membarrier
-344	common	userfaultfd		sys_userfaultfd
+344	common	userfaultfd		parisc_userfaultfd
 345	common	mlock2			sys_mlock2
 346	common	copy_file_range		sys_copy_file_range
 347	common	preadv2			sys_preadv2			compat_sys_preadv2

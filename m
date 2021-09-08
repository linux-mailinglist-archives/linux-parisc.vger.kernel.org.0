Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF622404040
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Sep 2021 22:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhIHUq5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Sep 2021 16:46:57 -0400
Received: from mout.gmx.net ([212.227.15.18]:47541 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350500AbhIHUq5 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Sep 2021 16:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1631133944;
        bh=oleUJEp3qwab6kRV5fWkcTrpoVJGGEVmRhHvZ9xHLy8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=GnkCTkkH99M7B0/lUInkoOMkJrXpg/hhsEFWb6XHgXvPjaLFySnTyUjVdfFqjT6Cl
         /iDOCVL5J6T7gazZft3L7XaJFu52kBNQZ5ziux0gIOyozh6QK6fDu2nJK6UMfNWbty
         HQJVhZJTmZIHGNXms6D9FJDotWACcHq6GHSjFl3k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.187.121.129]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1My32L-1n9si02yfH-00zSto; Wed, 08 Sep 2021 22:45:43 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 3/4] parisc: Check user signal stack trampoline is inside TASK_SIZE
Date:   Wed,  8 Sep 2021 22:44:04 +0200
Message-Id: <20210908204405.127665-3-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908204405.127665-1-deller@gmx.de>
References: <20210908204405.127665-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V/1VhKY3haZBsyg+3kJn3NEcEkH4SgUd/crT/BAwgZAfZIHiGLd
 O45lkSMVq6zxvh+VPiE8NPXsbGN2H+DwLhYUIRLhi1iqRqLH3uOD6L+5dfUn5M94i6DHHqt
 mAho32TTKR+eRW5bYdyiZKYBRLWOA8ZQAgnMk97vvSfcjo7Lzi/K/7dT8LQsNeWpZdVUaLQ
 fuGDBTLBIBndUMzIWlZGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:28bvDR+vy7A=:mvXKwy+u1U/4mFs0d1P/sp
 FqUZwfxt1WLYfLosiLFQrHiLi0den7jAW88pHHT4AXHdRHJiYOdb4p++zajpmmPmF6m7wXN62
 5Eh65aK1ztbr+VOhqw5F87pl9BRujIrw9OlJCAYTFI4wsR1B4oeOjv3yBjmg3K49lQCtRisfF
 I+14Wf0T7DF4WiGalnzrxu7+eUpxDeQdfhGLYMjlddEn5PW4KW9pjmv78GPTJLiDbFcsaQ6zY
 mkwN5mGtdDhUHQCSyD76Ow+M3aIwKSG3ZPrErSWCXcXGXmbMP61S7dHwA/zyrIr1FJxtd96LQ
 GqUz/VkiDhvEAYch6byw1+0cNfPO8qErL4WfOqEN3/PIYnWjOGELewYHJcerV/4ddIcwH1Bp/
 vNfV7PKO9fVQ84CBnd0wGP2aIaUzIUHU9JsXEgVRz7XtmIM/nVwT31HJREYY3GRZ5U46xnSSY
 lwUFsR6870UMAuAO7XlJJvBHfFnnSR4EUpxwwxIXBMUhDloSwpBeMemn2w1dzr7/xn+jyhqrA
 8/GS8KLZ4g8yGhjD6ldAtUhePpRlZbXxzLsQCaNa1qNaT4JokgBKWVSH9DdzhnOO7bGjp/NGW
 tm9Mhm6ltL8T6D1NwG1Yv742Z67LQZBm0QcubkOvnrQEBFJSMDCEEKrKyLdDzgC3gsJI038v6
 SGgvuL193YglPQ1lsLMabhWunlrLJDbLR6gzn2cCcFzSbWkL7A5oGMn88F4XodvrsB+KPQIgh
 Eh4lBG87DiB/Vt0vKz2JXoUv1qn4ZyOwgNQtz41tY1QGjqZ9rplnl5eWGvac7Ihiyaldaskt8
 9VjEuG+EliSu2OVjN5Nq97JykQPYgqwTOQWA+HGRyBqBSDkYv/HF2Qr89x2ceMe1GPfDP4zK5
 RSKbTQpDYtSB4xrN77EiVn1QGrk3mWWrMwDVGqJ+HyLdwW9Zcdoon1Fc5OzRpmpckEmoLrNwp
 mFH2iaP9FQKFx/qFZAXgP62dSiS0NGLIqdN85ziARosWx3ah4i/WUVuQeTI2kwB2fhITPY3i1
 d+03tKdsMH8crqSUZ14nG5lj4JDvswe5v/0RosAQOLVW9F4um+OaC+7ZP26EMJ6uugj+IpA7t
 32B8nhI3/ebXHs=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add some additional checks to ensure the signal stack is inside
userspace bounds.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/signal.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 77db707ce391..46b1050640b8 100644
=2D-- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -237,18 +237,22 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, =
struct pt_regs *regs,
 #endif

 	usp =3D (regs->gr[30] & ~(0x01UL));
+	sigframe_size =3D PARISC_RT_SIGFRAME_SIZE;
 #ifdef CONFIG_64BIT
 	if (is_compat_task()) {
 		/* The gcc alloca implementation leaves garbage in the upper 32 bits of=
 sp */
 		usp =3D (compat_uint_t)usp;
+		sigframe_size =3D PARISC_RT_SIGFRAME_SIZE32;
 	}
 #endif
-	/*FIXME: frame_size parameter is unused, remove it. */
-	frame =3D get_sigframe(&ksig->ka, usp, sizeof(*frame));
+	frame =3D get_sigframe(&ksig->ka, usp, sigframe_size);

 	DBG(1,"SETUP_RT_FRAME: START\n");
 	DBG(1,"setup_rt_frame: frame %p info %p\n", frame, ksig->info);

+	start =3D (unsigned long) frame;
+	if (start >=3D user_addr_max() - sigframe_size)
+		return -EFAULT;

 #ifdef CONFIG_64BIT

@@ -343,11 +347,6 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, s=
truct pt_regs *regs,

 	/* The syscall return path will create IAOQ values from r31.
 	 */
-	sigframe_size =3D PARISC_RT_SIGFRAME_SIZE;
-#ifdef CONFIG_64BIT
-	if (is_compat_task())
-		sigframe_size =3D PARISC_RT_SIGFRAME_SIZE32;
-#endif
 	if (in_syscall) {
 		regs->gr[31] =3D haddr;
 #ifdef CONFIG_64BIT
@@ -518,6 +517,10 @@ insert_restart_trampoline(struct pt_regs *regs)
 		unsigned long end  =3D (unsigned long) &usp[5];
 		long err =3D 0;

+		/* check that we don't exceed the stack */
+		if (A(&usp[0]) >=3D user_addr_max() - 5 * sizeof(int))
+			return;
+
 		/* Setup a trampoline to restart the syscall
 		 * with __NR_restart_syscall
 		 *
=2D-
2.31.1


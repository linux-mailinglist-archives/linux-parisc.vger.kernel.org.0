Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A04570BF48
	for <lists+linux-parisc@lfdr.de>; Mon, 22 May 2023 15:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbjEVNLW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 May 2023 09:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbjEVNLV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 May 2023 09:11:21 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D0392
        for <linux-parisc@vger.kernel.org>; Mon, 22 May 2023 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684761078; i=deller@gmx.de;
        bh=kCRol9G5oAq45+YSUHA2VKI90syCaD3clXbsvy8OsqU=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=PrkSzMjcrftG/fCY0Sct8qpuL5WJgDmSeTigbE6eyAJp0tk8hTqfcWSo40Uy5HY1h
         jycuEANoMXg+bbbkLmnjdI0KCec81Xr91QS3Jryv1xjUH/smuV79nGJWyAdApw3Gvr
         VUIj228mJK6CylODi2yRoJQS0Zd9o36s5lsFrqz4IIy+F6fAdNN3sRKA/sgeoD389C
         uKOjmzMzj0KVntdrMOqzAW5ToiPhUSBmIc9lVFpod0hPdFasqtNh0nKNK4uyllaBuo
         qeFM+NaOGXV4cqr6EywVG0qbfoaOghScNYAbLWipxvWUy9hbSBUduvlSOpxUJIb+w9
         Kxq/uPQiLLiTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.144.112]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBDnC-1pqbBj3R3W-00CeeM; Mon, 22
 May 2023 15:11:17 +0200
Date:   Mon, 22 May 2023 15:11:16 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Add lightweight spinlock checks
Message-ID: <ZGtp9PdK1/ANsNLY@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:HxEAEMRdZPchRucbtaxKnInFTYdtd3xYO6Cb6ADbx9Qp5LAnmVc
 SaC/9yEAXvvm0Nm6VIQQ0VBKQscQXo2fw85Jdcv4FXiAOCUnh1h308AxeT9UAyASclyeH8k
 n3d/HvD44anJAMZtrpfTUydR/3JoV28WqzzcQRYImcnumDJFWKpWm5LtutZQREwYbmSWh4+
 re4/vUF1TqyJMzpfphTZQ==
UI-OutboundReport: notjunk:1;M01:P0:SwPomBXXVFg=;MW9srb2RVCBmFXsUzcS42M+Vikp
 OnedMUg+1t5OY2ffb/IfimdQomUoLMWRl7EdJUyZ2xLTcONUSCSSQvX+W+J4uxYfnp1s7rpkM
 Kg9MrFhyxzH/f4/y3AppF4bGux+n68BmhX7xlSbuq8yz0+6J4PxtlOONONAjyG1whYKpUUApD
 qouV6eyYnjk5rMwtjDfSs/8oucvg3FkTr4Cs4Ret5LMvGxWTbQ6LFG8/lmHhUNm73AfrxO+Sa
 Wf7o3ukcs6VGa2kb04kubBlieCvM8GI9h3aIgrVZTDt2cWoqwMrOX2VOIB42kIybVDCJQEnJ1
 DaV//szayy4ceTzEyLcAR303iMZ4kO9XSeSMYbn0eoJ0yHAwd+RIsdN/s3BAlZk40evtdOgED
 xkjp+iroRwlPRffWF5Lvmuyxs+iYysoQDiKTGNpmtwWfVaJyKc6aSABC4tYMJOaYk0Kba9Pyx
 ioUdSKKw2+cs9pGembhwzMpReeo3DJYAjZzl3135wpafeyUeIewSklPYshsz9mzoSdQGs3+yE
 E7f/jLQabYF4hEINeYP12MOMFm5jQWYmvbNFjW09il2vg3kDbmf/QIyHTpQxTY0JVXCKbTdzg
 P0eN/Tn0W+nPofb7pGdToSwztRrcKfEZQzF7m0doqL2yHXu9f0z5CvTnjPymtmWrhe2KK2OOC
 HNqKFpME4Dh3mYHt48jM3crnqpij9nDqQg9NLuh4OG900LroYYMiR4PKyieIEf2N16Alskux/
 3IYBKHd+3MO44KGAuMbqBlQByifP1wyosbawdOaUXLyUGyd3H1A8iNINRvH3qK0mOwMmI3pbP
 QEYBMRobKW41+HZDdr61MTUZDjon9ruX9/Yb6e6+rbihpNp/kncGfmxjGng4fZ9xxoHsvUKwJ
 l7+7Sh0DY1TK6Mp4z8LP2jUxODOojag9e63C1ZZznm5Hz2IIb3sizbTyLtDlHfaJSUvyjvf2W
 j4QaIw==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add a lightweight spinlock check which uses only two instructions
per spinlock call. It detects if a spinlock has been trashed by
some memory corruption and then halts the kernel. It will not detect
uninitialized spinlocks, for which CONFIG_DEBUG_SPINLOCK needs to
be enabled.

This lightweight spinlock check shouldn't influence runtime, so it's
safe to enable it by default.

The __ARCH_SPIN_LOCK_UNLOCKED_VAL constant has been choosen small enough
to be able to be loaded by one LDI assembler statement.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/spinlock_types.h b/arch/parisc/includ=
e/asm/spinlock_types.h
index ca39ee350c3f..d65934079ebd 100644
=2D-- a/arch/parisc/include/asm/spinlock_types.h
+++ b/arch/parisc/include/asm/spinlock_types.h
@@ -2,13 +2,17 @@
 #ifndef __ASM_SPINLOCK_TYPES_H
 #define __ASM_SPINLOCK_TYPES_H

+#define __ARCH_SPIN_LOCK_UNLOCKED_VAL	0x1a46
+
 typedef struct {
 #ifdef CONFIG_PA20
 	volatile unsigned int slock;
-# define __ARCH_SPIN_LOCK_UNLOCKED { 1 }
+# define __ARCH_SPIN_LOCK_UNLOCKED { __ARCH_SPIN_LOCK_UNLOCKED_VAL }
 #else
 	volatile unsigned int lock[4];
-# define __ARCH_SPIN_LOCK_UNLOCKED	{ { 1, 1, 1, 1 } }
+# define __ARCH_SPIN_LOCK_UNLOCKED	\
+	{ { __ARCH_SPIN_LOCK_UNLOCKED_VAL, __ARCH_SPIN_LOCK_UNLOCKED_VAL, \
+	    __ARCH_SPIN_LOCK_UNLOCKED_VAL, __ARCH_SPIN_LOCK_UNLOCKED_VAL } }
 #endif
 } arch_spinlock_t;

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index a98940e64243..f7018a564f1d 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -308,6 +308,14 @@ config TLB_PTLOCK
 	  updated consistently on SMP machines at the expense of some
 	  loss in performance.

+config LIGHTWEIGHT_SPINLOCK_CHECK
+	bool "Add lightweight spinlock checks"
+	default y
+	help
+	  Add lightweight checks to the spinlock functions to catch
+	  memory overwrites at runtime. Those checks will not detect
+	  uninitialized spinlocks.
+
 config HOTPLUG_CPU
 	bool
 	default y if SMP
diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/=
spinlock.h
index a6e5d66a7656..edfcb9858bcb 100644
=2D-- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -7,10 +7,26 @@
 #include <asm/processor.h>
 #include <asm/spinlock_types.h>

+#define SPINLOCK_BREAK_INSN	0x0000c006	/* break 6,6 */
+
+static inline void arch_spin_val_check(int lock_val)
+{
+	if (IS_ENABLED(CONFIG_LIGHTWEIGHT_SPINLOCK_CHECK))
+		asm volatile(	"andcm,=3D %0,%1,%%r0\n"
+				".word %2\n"
+		: : "r" (lock_val), "r" (__ARCH_SPIN_LOCK_UNLOCKED_VAL),
+			"i" (SPINLOCK_BREAK_INSN));
+}
+
 static inline int arch_spin_is_locked(arch_spinlock_t *x)
 {
-	volatile unsigned int *a =3D __ldcw_align(x);
-	return READ_ONCE(*a) =3D=3D 0;
+	volatile unsigned int *a;
+	int lock_val;
+
+	a =3D __ldcw_align(x);
+	lock_val =3D READ_ONCE(*a);
+	arch_spin_val_check(lock_val);
+	return (lock_val =3D=3D 0);
 }

 static inline void arch_spin_lock(arch_spinlock_t *x)
@@ -18,9 +34,18 @@ static inline void arch_spin_lock(arch_spinlock_t *x)
 	volatile unsigned int *a;

 	a =3D __ldcw_align(x);
-	while (__ldcw(a) =3D=3D 0)
+	do {
+		int lock_val_old;
+
+		lock_val_old =3D __ldcw(a);
+		arch_spin_val_check(lock_val_old);
+		if (lock_val_old)
+			return;	/* got lock */
+
+		/* wait until we should try to get lock again */
 		while (*a =3D=3D 0)
 			continue;
+	} while (1);
 }

 static inline void arch_spin_unlock(arch_spinlock_t *x)
@@ -29,15 +54,19 @@ static inline void arch_spin_unlock(arch_spinlock_t *x=
)

 	a =3D __ldcw_align(x);
 	/* Release with ordered store. */
-	__asm__ __volatile__("stw,ma %0,0(%1)" : : "r"(1), "r"(a) : "memory");
+	__asm__ __volatile__("stw,ma %0,0(%1)"
+		: : "r"(__ARCH_SPIN_LOCK_UNLOCKED_VAL), "r"(a) : "memory");
 }

 static inline int arch_spin_trylock(arch_spinlock_t *x)
 {
 	volatile unsigned int *a;
+	int lock_val;

 	a =3D __ldcw_align(x);
-	return __ldcw(a) !=3D 0;
+	lock_val =3D __ldcw(a);
+	arch_spin_val_check(lock_val);
+	return lock_val !=3D 0;
 }

 /*
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index f9696fbf646c..861cb19eb12c 100644
=2D-- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -308,6 +308,11 @@ static void handle_break(struct pt_regs *regs)
 		return;
 	}
 #endif
+        if (IS_ENABLED(CONFIG_LIGHTWEIGHT_SPINLOCK_CHECK) &&
+		(iir =3D=3D SPINLOCK_BREAK_INSN) &&
+		!user_mode(regs)) {
+		die_if_kernel("Spinlock was trashed", regs, 1);
+	}

 	if (unlikely(iir !=3D GDB_BREAK_INSN))
 		parisc_printk_ratelimited(0, regs,

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968637753BE
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Aug 2023 09:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjHIHMM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 9 Aug 2023 03:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjHIHML (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 9 Aug 2023 03:12:11 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E691724
        for <linux-parisc@vger.kernel.org>; Wed,  9 Aug 2023 00:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691565128; x=1692169928; i=deller@gmx.de;
 bh=8QsLbMI7E1M1o+5gWmmrYSqnI0ZND9NZizwh1E+LVq0=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=F5MaIf2hul8Vu3POXZ7c+VLV7g6pJECZPdoHrjQXAqewpB/ZBp2QGbHBzQJbuNhj4pGQSRx
 3KekesGGfMma5bq3jzAw49dv/U9lWZ9JqOlefGrfuIOgM0Y9ED0GHuIOE999loDUmvCf2Km/B
 Pj7UvrdPqOHVz6NSfDDBA8EWWeOFIoykEc2XsK8dhyLDVukDveMHWn3r6Gt5+VucMsOeWzjzd
 38P9qGR306F3F8UrgvyGcjE2jS/Qd1tZdlbaUSWGlZJY0XSKc40uAzEx3iM7bmvVE7LloN8ZD
 SrWmYXTiYYkDCRGxJAauDWXVEglQCl+CoZt48RR9s1NAvxYiFcbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.156.76]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE6L-1qDTO721cZ-00Kjn2; Wed, 09
 Aug 2023 09:12:08 +0200
Date:   Wed, 9 Aug 2023 09:12:07 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Fix lightweight spinlock checks to not break futexes
Message-ID: <ZNM8Rz5f5/d/ZAI8@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:pwBx392Zp3UmhRGHLeCEYL9862ze7CdzG3x2z1TwfG6CFgdi6/P
 f/TS8VaaQy/TGiw3tEfdUpyvs+NQrZbe5GFnAGtQgA/dtcprPL5T7CV2PnbLjPFefhsPEue
 RJs0YIcZ5047po8yWaH57V1uo9lAJdKhMU1jCG2dN4le9EKL19ZLqg9HfQ6946TsQMikcRB
 1VPhCTefrATHUdIhYRi1Q==
UI-OutboundReport: notjunk:1;M01:P0:ZplXPjBF0f0=;5SyzG07FX4zhae7DHGpeMNh5u6g
 sG1vz9xjBAYqVLBVMG0h7Aomh0TudHJEXe1y4KZFmJpHb3bBnVo0Q4A3501qBSy1UAYyN70b7
 ZiZH2Gav0XaYXmlEE3bnGFM0oEe2iwMURy7jKPGiYen4DgdJ+LYlqgmJxYSftmkkdpXCEEJsW
 HX26mUK5RMP8vi/uu07BRdifVRAB9BBTsZyn0Ge2im7da9D3k56xi5PZLWi4drqKAa1NtepT2
 xp2ZSBbWvDJqhE6Pmfl/3j8W4KPQyv/da+gp+xWoqWiP2zYKRvnu9nR6MINhLFkPiNWp70bPV
 Ijn8HxQ/PLhjtqcA9jWfBPK5zyBTsiTRrjrfGHMlCiBpVF4epm2NE6bMGiVinq9+R1Xh8gKth
 23dxlfccEdxbNhqoucjDmCEmdWyp0Ttsb08R5aK19fg/ifiCo6gf5YFo5WqvVsjUnL6eYuBGf
 plnoDAb5vxR2iZmfjy63ElIURf5llkzfkWJsS+Pe9wj/o84qQOxlm0fxz3gt+0VGNxWf4vdTk
 DD5GsyVIb+TgT/jpWUs+u55ctYZPdEWrz9RSIeG1VwY4S1AHJ+aHWUVCDA/TMGVamURHVEHWh
 ZnD+wW5JwY+r3FqEtGLKk+2eLSC6kjU+mC9hZ95QjrlX2UwGnWFpsaG6DWQdPrx4P7HxB7AeR
 vvOcMmtr4yIMWRG2VVSmX/m7tH2srxHCmtlA7WNQvDQ4K6tPfySix5YHVBGyVlcLqjS0OSXPN
 D+tR42wOV1nWsJcFzXnMyMtHHVCP+mkKUz1JbLznnsTMJ9Esgjonu6LRsqlveawLBhUlE/3E2
 hdxMAF0fWgf5Vp5bSbA74wLjrIDc2i6Igrbj3Qnx0Fr6MAlawItgwLflwN5F1FmbjYQ6w8/Mz
 ixjXu5YVzSUV3TDmCJngf81KV50DX2HU8ibweMdxuX9IgJ3hLLTHs5TJ4yciJZbANB2q1LEbR
 /c0L1zSZsa/McdJ0iTHvYCL2hnA=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The lightweight spinlock checks verify that a spinlock has either value
0 (spinlock locked) and that not any other bits than in
__ARCH_SPIN_LOCK_UNLOCKED_VAL is set.

This breaks the current LWS code, which writes the address of the lock
into the lock word to unlock it, which was an optimization to save one
assembler instruction.

Fix it by making spinlock_types.h accessible for asm code, change the
LWS spinlock-unlocking code to write __ARCH_SPIN_LOCK_UNLOCKED_VAL into
the lock word, and add some missing lightweight spinlock checks to the
LWS path. Finally, make the spinlock checks dependend on DEBUG_KERNEL.

Noticed-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v6.4+
Fixes: 15e64ef6520e ("parisc: Add lightweight spinlock checks")

diff --git a/arch/parisc/Kconfig.debug b/arch/parisc/Kconfig.debug
index 1401e4c5fe5f..bf2b21b96f0b 100644
=2D-- a/arch/parisc/Kconfig.debug
+++ b/arch/parisc/Kconfig.debug
@@ -2,7 +2,7 @@
 #
 config LIGHTWEIGHT_SPINLOCK_CHECK
 	bool "Enable lightweight spinlock checks"
-	depends on SMP && !DEBUG_SPINLOCK
+	depends on DEBUG_KERNEL && SMP && !DEBUG_SPINLOCK
 	default y
 	help
 	  Add checks with low performance impact to the spinlock functions
diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/=
spinlock.h
index edfcb9858bcb..0b326e52255e 100644
=2D-- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -7,8 +7,6 @@
 #include <asm/processor.h>
 #include <asm/spinlock_types.h>

-#define SPINLOCK_BREAK_INSN	0x0000c006	/* break 6,6 */
-
 static inline void arch_spin_val_check(int lock_val)
 {
 	if (IS_ENABLED(CONFIG_LIGHTWEIGHT_SPINLOCK_CHECK))
diff --git a/arch/parisc/include/asm/spinlock_types.h b/arch/parisc/includ=
e/asm/spinlock_types.h
index d65934079ebd..efd06a897c6a 100644
=2D-- a/arch/parisc/include/asm/spinlock_types.h
+++ b/arch/parisc/include/asm/spinlock_types.h
@@ -4,6 +4,10 @@

 #define __ARCH_SPIN_LOCK_UNLOCKED_VAL	0x1a46

+#define SPINLOCK_BREAK_INSN	0x0000c006	/* break 6,6 */
+
+#ifndef __ASSEMBLY__
+
 typedef struct {
 #ifdef CONFIG_PA20
 	volatile unsigned int slock;
@@ -27,6 +31,8 @@ typedef struct {
 	volatile unsigned int	counter;
 } arch_rwlock_t;

+#endif /* __ASSEMBLY__ */
+
 #define __ARCH_RW_LOCK_UNLOCKED__       0x01000000
 #define __ARCH_RW_LOCK_UNLOCKED         { .lock_mutex =3D __ARCH_SPIN_LOC=
K_UNLOCKED, \
 					.counter =3D __ARCH_RW_LOCK_UNLOCKED__ }
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 1373e5129868..1f51aa9c8230 100644
=2D-- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -39,6 +39,7 @@ registers).
 #include <asm/assembly.h>
 #include <asm/processor.h>
 #include <asm/cache.h>
+#include <asm/spinlock_types.h>

 #include <linux/linkage.h>

@@ -66,6 +67,16 @@ registers).
 	stw	\reg1, 0(%sr2,\reg2)
 	.endm

+	/* raise exception if spinlock content is not zero or
+	 * __ARCH_SPIN_LOCK_UNLOCKED_VAL */
+	.macro	spinlock_check spin_val,tmpreg
+#ifdef CONFIG_LIGHTWEIGHT_SPINLOCK_CHECK
+	ldi	__ARCH_SPIN_LOCK_UNLOCKED_VAL, \tmpreg
+	andcm,=3D	\spin_val, \tmpreg, %r0
+	.word	SPINLOCK_BREAK_INSN
+#endif
+	.endm
+
 	.text

 	.import syscall_exit,code
@@ -508,7 +519,8 @@ lws_start:

 lws_exit_noerror:
 	lws_pagefault_enable	%r1,%r21
-	stw,ma	%r20, 0(%sr2,%r20)
+	ldi	__ARCH_SPIN_LOCK_UNLOCKED_VAL, %r21
+	stw,ma	%r21, 0(%sr2,%r20)
 	ssm	PSW_SM_I, %r0
 	b	lws_exit
 	copy	%r0, %r21
@@ -521,7 +533,8 @@ lws_wouldblock:

 lws_pagefault:
 	lws_pagefault_enable	%r1,%r21
-	stw,ma	%r20, 0(%sr2,%r20)
+	ldi	__ARCH_SPIN_LOCK_UNLOCKED_VAL, %r21
+	stw,ma	%r21, 0(%sr2,%r20)
 	ssm	PSW_SM_I, %r0
 	ldo	3(%r0),%r28
 	b	lws_exit
@@ -619,6 +632,7 @@ lws_compare_and_swap:

 	/* Try to acquire the lock */
 	LDCW	0(%sr2,%r20), %r28
+	spinlock_check	%r28, %r21
 	comclr,<>	%r0, %r28, %r0
 	b,n	lws_wouldblock

@@ -772,6 +786,7 @@ cas2_lock_start:

 	/* Try to acquire the lock */
 	LDCW	0(%sr2,%r20), %r28
+	spinlock_check	%r28, %r21
 	comclr,<>	%r0, %r28, %r0
 	b,n	lws_wouldblock

@@ -1001,6 +1016,7 @@ atomic_xchg_start:

 	/* Try to acquire the lock */
 	LDCW	0(%sr2,%r20), %r28
+	spinlock_check	%r28, %r21
 	comclr,<>	%r0, %r28, %r0
 	b,n	lws_wouldblock

@@ -1199,6 +1215,7 @@ atomic_store_start:

 	/* Try to acquire the lock */
 	LDCW	0(%sr2,%r20), %r28
+	spinlock_check	%r28, %r21
 	comclr,<>	%r0, %r28, %r0
 	b,n	lws_wouldblock

@@ -1330,7 +1347,7 @@ ENTRY(lws_lock_start)
 	/* lws locks */
 	.rept 256
 	/* Keep locks aligned at 16-bytes */
-	.word 1
+	.word __ARCH_SPIN_LOCK_UNLOCKED_VAL
 	.word 0
 	.word 0
 	.word 0

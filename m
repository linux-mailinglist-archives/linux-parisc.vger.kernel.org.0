Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1013F42FD13
	for <lists+linux-parisc@lfdr.de>; Fri, 15 Oct 2021 22:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242999AbhJOUn7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 15 Oct 2021 16:43:59 -0400
Received: from mout.gmx.net ([212.227.15.15]:52877 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238675AbhJOUn6 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 15 Oct 2021 16:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634330504;
        bh=DNag6ZTMoCHtfr/niQghlA4IYidy8xgdnH7lqmdHJbA=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=a7LCwSPspR3P2oFdb2D6FQ2rJaJWX9nQ/kSPdXPkIvOL3zGA1hTMY5VJA0bzciLLP
         mG6HlMWVemxZkju6niVqQ4E5JQPzeQ0f6HPl/u22OLVVTSo5TlsYiQDAW5Sqs63r6B
         ZJOH30WKyrG/NIHryCTNVyVpLT6hOBTWmT1CrVp4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.148.109]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mulm5-1mt9CN0BN5-00rm8Y; Fri, 15
 Oct 2021 22:41:44 +0200
Date:   Fri, 15 Oct 2021 22:41:26 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Move thread_info into task struct
Message-ID: <YWnndgjK6s7sqwBU@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:X3W22LwE3wqNuN0m0bJKohs+fowUurVSKeHTrji/B9sKZSeMXib
 VeDs21TZeVma+OzNWWPdovLnLuD1EegjxEudL8A8bAhB6D6vdW1WHEAK+7jtZ71aKO8MWJJ
 2wyn95e3PFy+e0whxbKwRBTAbnq+GFwRFvimhCKYh6lGHP7f5nmzSva0Q8LsQ+z+tN/FnCR
 gbkH6XDUFSAo1PcH7ItYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2ROOHteVZA8=:hsn4ICm2/k97TaG5TI4aQX
 FpxxVUrdQXCcnJi7lUD2o1+5iU4xAvcLuISSf8ct0lhENJuD6g6X+VB0EmV7FQ8XSEkj+6vMp
 v2YwdBKDNQmrnQ1LChcEpjnaVmQDEA1bUV65fDEP/l+Uvi5YVKWbCNn8y9bE3gJpnIUY+qboe
 SGItkWUpSqiNIxO8COPz7GUwGwhY5djwU4uM9dtRN9gyE8mRvrvyESoZK8tbW5AZDe4yo9qTE
 A1zRq01rpA2+muP6Uo/hZcPeIp10UD7gynH8AoVQJfndXlsl4AEL/NAAlymZncK75WMUvR90s
 LBvgNMO4RbtlOymtO/jpUPRN0BlOSlTI0vnYQw9BWKhDy3Dw1obaSgSPWRU9kqp10XT2t/uWI
 kks28pVfv9OMb6aFugjYd0+lz5L634u5Kx53L15ijw397/HLL3P4PZ77HATCX8ZKaPZoMrM+S
 1bCjZ25/BzkUcjUc2sdtiuwRGPEtq6S87ArnPjwJrm66lVfnWF8gd2t6LrkzTGnOov3uH7hoc
 AS9kaKzXbBKZfF92ZY1ZMCmvfN2MD1mcMZwEhb9mClXx05kBRJtKy2nkA4+krM4kNum1NmlF3
 KNcWbVoIxmxuEjH5HPRILtb3nqdVXmBdkXEnGOv75sjEG+rvoPtsFIdHTMCZVBU/G+c+qXq2/
 nd2bcu/UIsbR3LCTxpZBCBp26mEyWPru42w460o3NJ46KTeDq7LEEYQp85Bh01T7x6m6rtDMN
 tDgqZx8CZ1VGmWjWxF4pBYN3XCVKe+ET5giNNjLYKQ2zNGgceelhWxpW9d+aLJh5w6Acu2eON
 r/R4i/3q/3RxuNsnArwxtLWtuntR3aVpbOnDQZqJM7Ykc/8q+oOt3UVRNDBOAt2CV2+cF6cI8
 4b1tTMK/JtVYM1zULsCgxI9l+SCSRsK3T2ZcvrcmYfUG4rgFf7CFkW3pTHXT6i3RzAjzQVX0+
 mKpKeNrWDB+8bj9UNMpM2DS7uc75GNqKeEdxAhxmDn4C3NiQ2whPW/oH9lK3SQLd8TnxrKErL
 bJOmktCHomkZoGQPECczVYEsFX8OQfE3ha92fZv3hQtFuR7BoAISv6rTmI82BWTqHzQvQ8HuN
 Ml/MSKjz+I9CUM=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This implements the CONFIG_THREAD_INFO_IN_TASK option.

With this change:
- before thread_info was part of the stack and located at the beginning of=
 the stack
- now the thread_info struct is moved and located inside the task_struct s=
tructure
- the stack is allocated and handled like the major other platforms
- drop the cpu field of thread_info and use instead the one in task_struct

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sven Schnelle <svens@stackframe.org>

diff --git a/Documentation/features/core/thread-info-in-task/arch-support.=
txt b/Documentation/features/core/thread-info-in-task/arch-support.txt
index 9f0259bbd7df..3361e86b0958 100644
=2D-- a/Documentation/features/core/thread-info-in-task/arch-support.txt
+++ b/Documentation/features/core/thread-info-in-task/arch-support.txt
@@ -20,7 +20,7 @@
     |       nds32: |  ok  |
     |       nios2: | TODO |
     |    openrisc: | TODO |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: |  ok  |
     |        s390: |  ok  |
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 3296fcb90019..b2188da09c73 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -56,6 +56,7 @@ config PARISC
 	select HAVE_UNSTABLE_SCHED_CLOCK if SMP
 	select LEGACY_TIMER_TICK
 	select CPU_NO_EFFICIENT_FFS
+	select THREAD_INFO_IN_TASK
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
 	select HAVE_ARCH_KGDB
diff --git a/arch/parisc/include/asm/current.h b/arch/parisc/include/asm/c=
urrent.h
new file mode 100644
index 000000000000..568b739e42af
=2D-- /dev/null
+++ b/arch/parisc/include/asm/current.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_PARISC_CURRENT_H
+#define _ASM_PARISC_CURRENT_H
+
+#include <asm/special_insns.h>
+
+#ifndef __ASSEMBLY__
+struct task_struct;
+
+static __always_inline struct task_struct *get_current(void)
+{
+	return (struct task_struct *) mfctl(30);
+}
+
+#define current get_current()
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_PARISC_CURRENT_H */
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm=
/processor.h
index f57944d3284b..0d567774f506 100644
=2D-- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -102,8 +102,6 @@ DECLARE_PER_CPU(struct cpuinfo_parisc, cpu_data);

 #define CPU_HVERSION ((boot_cpu_data.hversion >> 4) & 0x0FFF)

-#define ARCH_MIN_TASKALIGN	FRAME_ALIGN
-
 struct thread_struct {
 	struct pt_regs regs;
 	unsigned long  task_size;
diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/smp.h
index b9a18db4b05a..16d41127500e 100644
=2D-- a/arch/parisc/include/asm/smp.h
+++ b/arch/parisc/include/asm/smp.h
@@ -34,8 +34,23 @@ extern void arch_send_call_function_ipi_mask(const stru=
ct cpumask *mask);

 #endif /* !ASSEMBLY */

-#define raw_smp_processor_id()	(current_thread_info()->cpu)
-
+/*
+ * This is particularly ugly: it appears we can't actually get the defini=
tion
+ * of task_struct here, but we need access to the CPU this task is runnin=
g on.
+ * Instead of using task_struct we're using TASK_CPU which is extracted f=
rom
+ * asm-offsets.h by kbuild to get the current processor ID.
+ *
+ * This also needs to be safeguarded when building asm-offsets.s because =
at
+ * that time TASK_CPU is not defined yet. It could have been guarded by
+ * TASK_CPU itself, but we want the build to fail if TASK_CPU is missing
+ * when building something else than asm-offsets.s
+ */
+#ifdef GENERATING_ASM_OFFSETS
+#define raw_smp_processor_id()		(0)
+#else
+#include <asm/asm-offsets.h>
+#define raw_smp_processor_id()		(*(unsigned int *)((void *)current + TASK=
_CPU))
+#endif
 #else /* CONFIG_SMP */

 static inline void smp_send_all_nop(void) { return; }
diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/a=
sm/thread_info.h
index 00ad50fef769..4617303e0620 100644
=2D-- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -9,23 +9,16 @@
 #include <asm/special_insns.h>

 struct thread_info {
-	struct task_struct *task;	/* main task structure */
 	unsigned long flags;		/* thread_info flags (see TIF_*) */
-	__u32 cpu;			/* current CPU */
 	int preempt_count;		/* 0=3Dpremptable, <0=3DBUG; will also serve as bh-c=
ounter */
 };

 #define INIT_THREAD_INFO(tsk)			\
 {						\
-	.task		=3D &tsk,			\
 	.flags		=3D 0,			\
-	.cpu		=3D 0,			\
 	.preempt_count	=3D INIT_PREEMPT_COUNT,	\
 }

-/* how to get the thread information struct from C */
-#define current_thread_info()	((struct thread_info *)mfctl(30))
-
 #endif /* !__ASSEMBLY */

 /* thread information allocation */
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-off=
sets.c
index 276c67ea7fd2..5d84b0f78c2a 100644
=2D-- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -14,6 +14,8 @@
  *    Copyright (C) 2003 James Bottomley <jejb at parisc-linux.org>
  */

+#define GENERATING_ASM_OFFSETS /* asm/smp.h */
+
 #include <linux/types.h>
 #include <linux/sched.h>
 #include <linux/thread_info.h>
@@ -35,13 +37,16 @@

 int main(void)
 {
-	DEFINE(TASK_THREAD_INFO, offsetof(struct task_struct, stack));
-	DEFINE(TASK_FLAGS, offsetof(struct task_struct, flags));
+	DEFINE(TASK_TI_FLAGS, offsetof(struct task_struct, thread_info.flags));
 	DEFINE(TASK_SIGPENDING, offsetof(struct task_struct, pending));
 	DEFINE(TASK_PTRACE, offsetof(struct task_struct, ptrace));
 	DEFINE(TASK_MM, offsetof(struct task_struct, mm));
 	DEFINE(TASK_PERSONALITY, offsetof(struct task_struct, personality));
 	DEFINE(TASK_PID, offsetof(struct task_struct, pid));
+	DEFINE(TASK_STACK, offsetof(struct task_struct, stack));
+#ifdef CONFIG_SMP
+	DEFINE(TASK_CPU, offsetof(struct task_struct, cpu));
+#endif
 	BLANK();
 	DEFINE(TASK_REGS, offsetof(struct task_struct, thread.regs));
 	DEFINE(TASK_PT_PSW, offsetof(struct task_struct, thread.regs.gr[ 0]));
@@ -129,10 +134,6 @@ int main(void)
 	DEFINE(TASK_PT_ISR, offsetof(struct task_struct, thread.regs.isr));
 	DEFINE(TASK_PT_IOR, offsetof(struct task_struct, thread.regs.ior));
 	BLANK();
-	DEFINE(TASK_SZ, sizeof(struct task_struct));
-	/* TASK_SZ_ALGN includes space for a stack frame. */
-	DEFINE(TASK_SZ_ALGN, align_frame(sizeof(struct task_struct), FRAME_ALIGN=
));
-	BLANK();
 	DEFINE(PT_PSW, offsetof(struct pt_regs, gr[ 0]));
 	DEFINE(PT_GR1, offsetof(struct pt_regs, gr[ 1]));
 	DEFINE(PT_GR2, offsetof(struct pt_regs, gr[ 2]));
@@ -217,17 +218,11 @@ int main(void)
 	DEFINE(PT_IIR, offsetof(struct pt_regs, iir));
 	DEFINE(PT_ISR, offsetof(struct pt_regs, isr));
 	DEFINE(PT_IOR, offsetof(struct pt_regs, ior));
-	DEFINE(PT_SIZE, sizeof(struct pt_regs));
 	/* PT_SZ_ALGN includes space for a stack frame. */
 	DEFINE(PT_SZ_ALGN, align_frame(sizeof(struct pt_regs), FRAME_ALIGN));
 	BLANK();
-	DEFINE(TI_TASK, offsetof(struct thread_info, task));
 	DEFINE(TI_FLAGS, offsetof(struct thread_info, flags));
-	DEFINE(TI_CPU, offsetof(struct thread_info, cpu));
-	DEFINE(TI_PRE_COUNT, offsetof(struct thread_info, preempt_count));
-	DEFINE(THREAD_SZ, sizeof(struct thread_info));
-	/* THREAD_SZ_ALGN includes space for a stack frame. */
-	DEFINE(THREAD_SZ_ALGN, align_frame(sizeof(struct thread_info), FRAME_ALI=
GN));
+	DEFINE(TI_PRE_COUNT, offsetof(struct task_struct, thread_info.preempt_co=
unt));
 	BLANK();
 	DEFINE(ICACHE_BASE, offsetof(struct pdc_cache_info, ic_base));
 	DEFINE(ICACHE_STRIDE, offsetof(struct pdc_cache_info, ic_stride));
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index b7108d5da644..57944d6f9ebb 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -63,8 +63,8 @@
 	 *          Need to set up a kernel stack, so call the
 	 *          get_stack_use_cr30 macro to set up a pointer
 	 *          to the pt_regs structure contained within the
-	 *          task pointer pointed to by cr30. Set the stack
-	 *          pointer to point to the end of the task structure.
+	 *          task pointer pointed to by cr30. Load the stack
+	 *          pointer from the task structure.
 	 *
 	 * Note that we use shadowed registers for temps until
 	 * we can save %r26 and %r29. %r26 is used to preserve
@@ -76,8 +76,6 @@
 	 * or handle_interruption. %r29 is used to hold a pointer
 	 * the register save area, and once again, it needs to
 	 * be a non-shadowed register so that it survives the rfir.
-	 *
-	 * N.B. TASK_SZ_ALGN and PT_SZ_ALGN include space for a stack frame.
 	 */

 	.macro  get_stack_use_cr30
@@ -86,12 +84,11 @@

 	copy	%r30, %r17
 	mfctl   %cr30, %r1
-	ldo	THREAD_SZ_ALGN(%r1), %r30
-	mtsp	%r0,%sr7
+	tophys  %r1,%r9		/* task_struct */
+	LDREG	TASK_STACK(%r9),%r30
+	ldo	PT_SZ_ALGN(%r30),%r30
+	mtsp	%r0,%sr7	/* clear sr7 after kernel stack was set! */
 	mtsp	%r16,%sr3
-	tophys  %r1,%r9
-	LDREG	TI_TASK(%r9), %r1	/* thread_info -> task_struct */
-	tophys  %r1,%r9
 	ldo     TASK_REGS(%r9),%r9
 	STREG   %r17,PT_GR30(%r9)
 	STREG   %r29,PT_GR29(%r9)
@@ -733,7 +730,7 @@ ENTRY(ret_from_kernel_thread)
 	BL	schedule_tail, %r2
 	nop

-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30), %r1
+	mfctl	%cr30,%r1	/* task_struct */
 	LDREG	TASK_PT_GR25(%r1), %r26
 #ifdef CONFIG_64BIT
 	LDREG	TASK_PT_GR27(%r1), %r27
@@ -764,7 +761,6 @@ ENTRY_CFI(_switch_to)

 	STREG	%r30, TASK_PT_KSP(%r26)
 	LDREG	TASK_PT_KSP(%r25), %r30
-	LDREG	TASK_THREAD_INFO(%r25), %r25
 	bv	%r0(%r2)
 	mtctl   %r25,%cr30

@@ -795,8 +791,7 @@ ENDPROC_CFI(_switch_to)
 	.align	PAGE_SIZE

 ENTRY_CFI(syscall_exit_rfi)
-	mfctl   %cr30,%r16
-	LDREG	TI_TASK(%r16), %r16	/* thread_info -> task_struct */
+	mfctl	%cr30,%r16		/* task_struct */
 	ldo	TASK_REGS(%r16),%r16
 	/* Force iaoq to userspace, as the user has had access to our current
 	 * context via sigcontext. Also Filter the PSW for the same reason.
@@ -841,14 +836,14 @@ ENTRY_CFI(syscall_exit_rfi)
 ENTRY(intr_return)
 	/* check for reschedule */
 	mfctl   %cr30,%r1
-	LDREG   TI_FLAGS(%r1),%r19	/* sched.h: TIF_NEED_RESCHED */
+	LDREG   TASK_TI_FLAGS(%r1),%r19	/* sched.h: TIF_NEED_RESCHED */
 	bb,<,n	%r19,31-TIF_NEED_RESCHED,intr_do_resched /* forward */

 	.import do_notify_resume,code
 intr_check_sig:
 	/* As above */
 	mfctl   %cr30,%r1
-	LDREG	TI_FLAGS(%r1),%r19
+	LDREG	TASK_TI_FLAGS(%r1),%r19
 	ldi	(_TIF_USER_WORK_MASK & ~_TIF_NEED_RESCHED), %r20
 	and,COND(<>)	%r19, %r20, %r0
 	b,n	intr_restore	/* skip past if we've nothing to do */
@@ -1692,7 +1687,7 @@ dtlb_fault:

 	.macro	fork_like name
 ENTRY_CFI(sys_\name\()_wrapper)
-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30), %r1
+	mfctl	%cr30,%r1
 	ldo	TASK_REGS(%r1),%r1
 	reg_save %r1
 	mfctl	%cr27, %r28
@@ -1712,7 +1707,7 @@ ENTRY(child_return)
 	BL	schedule_tail, %r2
 	nop
 finish_child_return:
-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30), %r1
+	mfctl	%cr30,%r1
 	ldo	TASK_REGS(%r1),%r1	 /* get pt regs */

 	LDREG	PT_CR27(%r1), %r3
@@ -1723,7 +1718,7 @@ finish_child_return:
 END(child_return)

 ENTRY_CFI(sys_rt_sigreturn_wrapper)
-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r26
+	mfctl	%cr30,%r26
 	ldo	TASK_REGS(%r26),%r26	/* get pt regs */
 	/* Don't save regs, we are going to restore them from sigcontext. */
 	STREG	%r2, -RP_OFFSET(%r30)
@@ -1740,7 +1735,7 @@ ENTRY_CFI(sys_rt_sigreturn_wrapper)
 	LDREG	-RP_OFFSET(%r30), %r2

 	/* FIXME: I think we need to restore a few more things here. */
-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
+	mfctl	%cr30,%r1
 	ldo	TASK_REGS(%r1),%r1	/* get pt regs */
 	reg_restore %r1

@@ -1759,9 +1754,7 @@ ENTRY(syscall_exit)
 	 */

 	/* save return value now */
-
 	mfctl     %cr30, %r1
-	LDREG     TI_TASK(%r1),%r1
 	STREG     %r28,TASK_PT_GR28(%r1)

 	/* Seems to me that dp could be wrong here, if the syscall involved
@@ -1772,13 +1765,14 @@ ENTRY(syscall_exit)
 syscall_check_resched:

 	/* check for reschedule */
-
-	LDREG	TI_FLAGS-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r19	/* long */
+	mfctl	%cr30,%r19
+	LDREG	TASK_TI_FLAGS(%r19),%r19	/* long */
 	bb,<,n	%r19, 31-TIF_NEED_RESCHED, syscall_do_resched /* forward */

 	.import do_signal,code
 syscall_check_sig:
-	LDREG	TI_FLAGS-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r19
+	mfctl	%cr30,%r19
+	LDREG	TASK_TI_FLAGS(%r19),%r19
 	ldi	(_TIF_USER_WORK_MASK & ~_TIF_NEED_RESCHED), %r26
 	and,COND(<>)	%r19, %r26, %r0
 	b,n	syscall_restore	/* skip past if we've nothing to do */
@@ -1789,7 +1783,7 @@ syscall_do_signal:
 	 * consistent with all the relevant state of the process
 	 * before the syscall.  We need to verify this.
 	 */
-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
+	mfctl	%cr30,%r1
 	ldo	TASK_REGS(%r1), %r26		/* struct pt_regs *regs */
 	reg_save %r26

@@ -1800,17 +1794,17 @@ syscall_do_signal:
 	BL	do_notify_resume,%r2
 	ldi	1, %r25				/* long in_syscall =3D 1 */

-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
+	mfctl	%cr30,%r1
 	ldo	TASK_REGS(%r1), %r20		/* reload pt_regs */
 	reg_restore %r20

 	b,n     syscall_check_sig

 syscall_restore:
-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
+	mfctl	%cr30,%r1

 	/* Are we being ptraced? */
-	LDREG	TI_FLAGS-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r19
+	LDREG	TASK_TI_FLAGS(%r1),%r19
 	ldi	_TIF_SYSCALL_TRACE_MASK,%r2
 	and,COND(=3D)	%r19,%r2,%r0
 	b,n	syscall_restore_rfi
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index aa93d775c34d..b24f77748c22 100644
=2D-- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -35,7 +35,8 @@ END(boot_args)
 	__HEAD

 	.align	4
-	.import init_thread_union,data
+	.import init_task,data
+	.import init_stack,data
 	.import fault_vector_20,code    /* IVA parisc 2.0 32 bit */
 #ifndef CONFIG_64BIT
         .import fault_vector_11,code    /* IVA parisc 1.1 32 bit */
@@ -123,12 +124,12 @@ $pgt_fill_loop:
 	load32		start_parisc,%r11

 	/* And the initial task pointer */
-	load32		init_thread_union,%r6
+	load32		init_task,%r6
 	mtctl           %r6,%cr30

 	/* And the stack pointer too */
-	ldo             THREAD_SZ_ALGN(%r6),%sp
-
+	load32		init_stack,%sp
+	tophys_r1	%sp
 #if defined(CONFIG_64BIT) && defined(CONFIG_FUNCTION_TRACER)
 	.import _mcount,data
 	/* initialize mcount FPTR */
@@ -186,12 +187,11 @@ common_stext:
 #endif /*CONFIG_SMP*/

 #ifdef CONFIG_64BIT
-	tophys_r1	%sp
+	mfctl		%cr30,%r6		/* PCX-W2 firmware bug */
+	tophys_r1	%r6

 	/* Save the rfi target address */
-	ldd             TI_TASK-THREAD_SZ_ALGN(%sp), %r10
-	tophys_r1       %r10
-	std             %r11,  TASK_PT_GR11(%r10)
+	STREG		%r11,  TASK_PT_GR11(%r6)
 	/* Switch to wide mode Superdome doesn't support narrow PDC
 	** calls.
 	*/
@@ -206,7 +206,6 @@ common_stext:
         ** Someday, palo might not do this for the Monarch either.
         */
 2:
-	mfctl		%cr30,%r6		/* PCX-W2 firmware bug */

 	ldo             PDC_PSW(%r0),%arg0              /* 21 */
 	ldo             PDC_PSW_SET_DEFAULTS(%r0),%arg1 /* 2 */
@@ -216,13 +215,9 @@ common_stext:
 	copy            %r0,%arg3

 stext_pdc_ret:
+	LDREG		TASK_PT_GR11(%r6), %r11
+	tovirt_r1	%r6
 	mtctl		%r6,%cr30		/* restore task thread info */
-
-	/* restore rfi target address*/
-	ldd             TI_TASK-THREAD_SZ_ALGN(%sp), %r10
-	tophys_r1       %r10
-	ldd             TASK_PT_GR11(%r10), %r11
-	tovirt_r1       %sp
 #endif

 	/* PARANOID: clear user scratch/user space SR's */
@@ -287,7 +282,9 @@ aligned_rfi:

 	load32		KERNEL_PSW,%r10
 	mtctl		%r10,%ipsw
-
+
+	tovirt_r1	%sp
+
 	/* Jump through hyperspace to Virt Mode */
 	rfi
 	nop
@@ -343,12 +340,13 @@ smp_slave_stext:
 #endif

 	/*  Initialize the SP - monarch sets up smp_init_current_idle_task */
-	load32		PA(smp_init_current_idle_task),%sp
-	LDREG		0(%sp),%sp	/* load task address */
+	load32		PA(smp_init_current_idle_task),%r6
+	LDREG		0(%r6),%r6
+	mtctl		%r6,%cr30
+	tophys_r1	%r6
+	LDREG           TASK_STACK(%r6),%sp
 	tophys_r1	%sp
-	LDREG		TASK_THREAD_INFO(%sp),%sp
-	mtctl           %sp,%cr30       /* store in cr30 */
-	ldo             THREAD_SZ_ALGN(%sp),%sp
+	ldo		FRAME_SIZE(%sp),%sp

 	/* point CPU to kernel page tables */
 	load32		PA(swapper_pg_dir),%r4
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 0d46b19dc4d3..eb18e16362f6 100644
=2D-- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -15,6 +15,7 @@
 #include <linux/kernel_stat.h>
 #include <linux/seq_file.h>
 #include <linux/types.h>
+#include <linux/sched/task_stack.h>
 #include <asm/io.h>

 #include <asm/softirq_stack.h>
@@ -399,8 +400,7 @@ static inline void stack_overflow_check(struct pt_regs=
 *regs)
 #ifdef CONFIG_DEBUG_STACKOVERFLOW
 	#define STACK_MARGIN	(256*6)

-	/* Our stack starts directly behind the thread_info struct. */
-	unsigned long stack_start =3D (unsigned long) current_thread_info();
+	unsigned long stack_start =3D (unsigned long) task_stack_page(current);
 	unsigned long sp =3D regs->gr[30];
 	unsigned long stack_usage;
 	unsigned int *last_usage;
@@ -476,7 +476,7 @@ static void execute_on_irq_stack(void *func, unsigned =
long param1)
 	union_ptr =3D &per_cpu(irq_stack_union, smp_processor_id());
 	irq_stack =3D (unsigned long) &union_ptr->stack;
 	irq_stack =3D ALIGN(irq_stack + sizeof(irq_stack_union.slock),
-			 64); /* align for stack frame usage */
+			FRAME_ALIGN); /* align for stack frame usage */

 	/* We may be called recursive. If we are already using the irq stack,
 	 * just continue to use it. Use spinlocks to serialize
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 38ec4ae81239..cd749bf3d70d 100644
=2D-- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -205,7 +205,7 @@ copy_thread(unsigned long clone_flags, unsigned long u=
sp,
 		/* Must exit via ret_from_kernel_thread in order
 		 * to call schedule_tail()
 		 */
-		cregs->ksp =3D (unsigned long)stack + THREAD_SZ_ALGN + FRAME_SIZE;
+		cregs->ksp =3D (unsigned long) stack + FRAME_SIZE + PT_SZ_ALGN;
 		cregs->kpc =3D (unsigned long) &ret_from_kernel_thread;
 		/*
 		 * Copy function and argument to be called from
@@ -228,7 +228,7 @@ copy_thread(unsigned long clone_flags, unsigned long u=
sp,
 			if (likely(usp))
 				cregs->gr[30] =3D usp;
 		}
-		cregs->ksp =3D (unsigned long)stack + THREAD_SZ_ALGN + FRAME_SIZE;
+		cregs->ksp =3D (unsigned long) stack + FRAME_SIZE;
 		cregs->kpc =3D (unsigned long) &child_return;

 		/* Setup thread TLS area */
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 3413e6949c87..b282c1ce00c8 100644
=2D-- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -324,7 +324,7 @@ int smp_boot_one_cpu(int cpuid, struct task_struct *id=
le)
 	const struct cpuinfo_parisc *p =3D &per_cpu(cpu_data, cpuid);
 	long timeout;

-	task_thread_info(idle)->cpu =3D cpuid;
+	idle->cpu =3D cpuid;

 	/* Let _start know what logical CPU we're booting
 	** (offset into init_tasks[],cpu_data[])
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 3f24a0af1e04..c396853184d8 100644
=2D-- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -139,9 +139,9 @@ linux_gateway_entry:
 	xor     %r1,%r30,%r30                   /* ye olde xor trick */
 	xor     %r1,%r30,%r1
 	xor     %r1,%r30,%r30
-
-	ldo     THREAD_SZ_ALGN+FRAME_SIZE(%r30),%r30  /* set up kernel stack */

+	LDREG	TASK_STACK(%r30),%r30		/* set up kernel stack */
+	ldo	FRAME_SIZE(%r30),%r30
 	/* N.B.: It is critical that we don't set sr7 to 0 until r30
 	 *       contains a valid kernel stack pointer. It is also
 	 *       critical that we don't start using the kernel stack
@@ -152,7 +152,6 @@ linux_gateway_entry:
 	ssm	PSW_SM_I, %r0			/* enable interrupts */
 	STREGM	%r1,FRAME_SIZE(%r30)		/* save r1 (usp) here for now */
 	mfctl	%cr30,%r1			/* get task ptr in %r1 */
-	LDREG	TI_TASK(%r1),%r1

 	/* Save some registers for sigcontext and potential task
 	   switch (see entry.S for the details of which ones are
@@ -207,7 +206,7 @@ linux_gateway_entry:

 	/* Are we being ptraced? */
 	mfctl	%cr30, %r1
-	LDREG	TI_FLAGS(%r1),%r1
+	LDREG	TASK_TI_FLAGS(%r1),%r1
 	ldi	_TIF_SYSCALL_TRACE_MASK, %r19
 	and,COND(=3D) %r1, %r19, %r0
 	b,n	.Ltracesys
@@ -272,8 +271,7 @@ tracesys:
 	 * C bit set, a non-straced syscall entry results in C and D clear
 	 * in the saved PSW.
 	 */
-	ldo     -THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
-	LDREG	TI_TASK(%r1), %r1
+	mfctl	%cr30,%r1			/* get task ptr */
 	ssm	0,%r2
 	STREG	%r2,TASK_PT_PSW(%r1)		/* Lower 8 bits only!! */
 	mfsp	%sr0,%r2
@@ -327,8 +325,7 @@ tracesys_next:
 	 */
 	copy	%ret0,%r20

-	ldo     -THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
-	LDREG	TI_TASK(%r1), %r1
+	mfctl	%cr30,%r1			/* get task ptr */
 	LDREG   TASK_PT_GR28(%r1), %r28		/* Restore return value */
 	LDREG   TASK_PT_GR26(%r1), %r26		/* Restore the users args */
 	LDREG   TASK_PT_GR25(%r1), %r25
@@ -385,16 +382,14 @@ tracesys_next:
 	makes a direct call to syscall_trace. */

 tracesys_exit:
-	ldo     -THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
-	LDREG	TI_TASK(%r1), %r1
+	mfctl	%cr30,%r1			/* get task ptr */
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif
 	ldo	TASK_REGS(%r1),%r26
 	BL	do_syscall_trace_exit,%r2
 	STREG   %r28,TASK_PT_GR28(%r1)          /* save return value now */
-	ldo     -THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
-	LDREG	TI_TASK(%r1), %r1
+	mfctl	%cr30,%r1			/* get task ptr */
 	LDREG   TASK_PT_GR28(%r1), %r28		/* Restore return val. */

 	ldil	L%syscall_exit,%r1
@@ -407,8 +402,7 @@ tracesys_exit:
 	ldo	R%tracesys_sigexit(%r2),%r2

 tracesys_sigexit:
-	ldo     -THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
-	LDREG	TI_TASK(%r1), %r1
+	mfctl	%cr30,%r1			/* get task ptr */
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 524781eae4dd..690e6abcaf22 100644
=2D-- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -144,7 +144,7 @@ void show_regs(struct pt_regs *regs)
 	printk("%s IIR: %08lx    ISR: " RFMT "  IOR: " RFMT "\n",
 	       level, regs->iir, regs->isr, regs->ior);
 	printk("%s CPU: %8d   CR30: " RFMT " CR31: " RFMT "\n",
-	       level, current_thread_info()->cpu, cr30, cr31);
+	       level, task_cpu(current), cr30, cr31);
 	printk("%s ORIG_R28: " RFMT "\n", level, regs->orig_r28);

 	if (user) {
diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 34676658c040..42acc3b52017 100644
=2D-- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -14,6 +14,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
+#include <linux/sched/task_stack.h>

 #include <linux/uaccess.h>
 #include <asm/assembly.h>
@@ -299,12 +300,9 @@ static void unwind_frame_regs(struct unwind_frame_inf=
o *info)
 			info->prev_sp =3D sp - 64;
 			info->prev_ip =3D 0;

-			/* The stack is at the end inside the thread_union
-			 * struct. If we reach data, we have reached the
-			 * beginning of the stack and should stop unwinding. */
-			if (info->prev_sp >=3D (unsigned long) task_thread_info(info->t) &&
-			    info->prev_sp < ((unsigned long) task_thread_info(info->t)
-						+ THREAD_SZ_ALGN)) {
+			/* Check if stack is inside kernel stack area */
+			if ((info->prev_sp - (unsigned long) task_stack_page(info->t))
+					>=3D THREAD_SIZE) {
 				info->prev_sp =3D 0;
 				break;
 			}

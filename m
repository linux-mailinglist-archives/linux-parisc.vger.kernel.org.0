Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776BA445038
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 09:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhKDI3Q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 04:29:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:49372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230401AbhKDI3P (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 04:29:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3937960240;
        Thu,  4 Nov 2021 08:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636014397;
        bh=YyeOm5kZOrBmmv6LuMqY0lf2xQl2ONizflEadane9M8=;
        h=From:To:Cc:Subject:Date:From;
        b=vQbJEVqrlNbL+qjgFx+2UWM/XMczydwqy0CoSSYJclwgdTOxtLU8z6/ffUeGUDH2D
         IFI1/TwJSBknDRiSNdF5FGLPyJZIgj7O6rQe0+c84oWN6m5envDymT/XMXtH+Hlj6Y
         f6hdBhdiNUJm3PYDl45P+k0lXwt+q2+8IhDUTBobKH5iwcqH6gFZ2Ip2h02vnhjXSj
         arrUpEls2H1TerxJugM2ImxUB8OX6t1SpiRTXCj//EcXVoXiyMmKodViGJhtz8vyBc
         1xReZSU7bINUDY8cu4kY5IrviD1zBDPkj5b/YDuAiiu75aCpY0gSGuU1Xu54vvWBK1
         4R79dgvPgZmgg==
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-parisc@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com, deller@gmx.de,
        linux@roeck-us.net, torvalds@linux-foundation.org,
        Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] parisc: move CPU field back into thread_info
Date:   Thu,  4 Nov 2021 09:26:28 +0100
Message-Id: <20211104082628.2793555-1-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4201; h=from:subject; bh=YyeOm5kZOrBmmv6LuMqY0lf2xQl2ONizflEadane9M8=; b=owEB7QES/pANAwAKAcNPIjmS2Y8kAcsmYgBhg5kzxrQnrER4hlnelk7Gz0T4Fs6wGiMc5m4R9BZK QdJsAGqJAbMEAAEKAB0WIQT72WJ8QGnJQhU3VynDTyI5ktmPJAUCYYOZMwAKCRDDTyI5ktmPJEfAC/ 4zRzvNEiDN7slhxi7dlY3oR5Gb77duk9QKQbPabwheWlVzY+shWYKM4YJUSFUoA6MoI7yLCh/n9jMh FRkre18dDQwXkROyBdNRTUefC4wl2QNnOIWIkoJGz7FoOIlnWzR6W5Iltt4uuKT6UVqeC2On9lVZY9 c4dyXoMnTWHz9o5ALCs9oz5f6xu0LKMUsSUf2DG7tPxsLTtc5bGJe6j5BU432pPeKBeIztcP7jwx6b fuJtwiMWbuYQLCV8JZj66gy4bJ0iLKjBzvgE6qQWj+zpdjr+r1EE163b8NHYd8gex4Y5rf9k68/GGO PUhkAxBG8lga2oGUTVCOFUbYqZ7louBH7Ute1FC+2itIJxNfa4SFQ93viCq80Bza9V/NVL+qRhKEdy VXjTQFTEXaFaTF4d7RvQIJ7R4JaJ31/BPLPrRR6sLT1/PS73BYcOSU0p6kj8Nz4NvvQ6Z3v1ucUXhu oH/263FFfnPcvo/ufpaecUEgWaLlr0SUkxsEnVCu3173Y=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

In commit 2214c0e77259 ("parisc: Move thread_info into task struct")
PA-RISC gained support for THREAD_INFO_IN_TASK while changes were
already underway to keep the CPU field in thread_info rather than move
it into task_struct when THREAD_INFO_IN_TASK is enabled. The result is a
broken build for all PA-RISC configs that enable SMP.

So let's partially revert that commit, and get rid of the ugly hack to
get at the offset of task_struct::cpu without having to include
linux/sched.h, and put the CPU field back where it was before.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: bcf9033e5449 ("sched: move CPU field back into thread_info if THREAD_INFO_IN_TASK=y")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/parisc/include/asm/smp.h         | 19 ++-----------------
 arch/parisc/include/asm/thread_info.h |  2 ++
 arch/parisc/kernel/asm-offsets.c      |  4 +---
 arch/parisc/kernel/smp.c              |  2 +-
 4 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/smp.h
index 16d41127500e..cba55abf7bac 100644
--- a/arch/parisc/include/asm/smp.h
+++ b/arch/parisc/include/asm/smp.h
@@ -34,23 +34,8 @@ extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
 
 #endif /* !ASSEMBLY */
 
-/*
- * This is particularly ugly: it appears we can't actually get the definition
- * of task_struct here, but we need access to the CPU this task is running on.
- * Instead of using task_struct we're using TASK_CPU which is extracted from
- * asm-offsets.h by kbuild to get the current processor ID.
- *
- * This also needs to be safeguarded when building asm-offsets.s because at
- * that time TASK_CPU is not defined yet. It could have been guarded by
- * TASK_CPU itself, but we want the build to fail if TASK_CPU is missing
- * when building something else than asm-offsets.s
- */
-#ifdef GENERATING_ASM_OFFSETS
-#define raw_smp_processor_id()		(0)
-#else
-#include <asm/asm-offsets.h>
-#define raw_smp_processor_id()		(*(unsigned int *)((void *)current + TASK_CPU))
-#endif
+#define raw_smp_processor_id() (current_thread_info()->cpu)
+
 #else /* CONFIG_SMP */
 
 static inline void smp_send_all_nop(void) { return; }
diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index 75657c2c54e1..d6268834bfa5 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -8,12 +8,14 @@
 
 struct thread_info {
 	unsigned long flags;		/* thread_info flags (see TIF_*) */
+	__u32 cpu;			/* current CPU */
 	int preempt_count;		/* 0=premptable, <0=BUG; will also serve as bh-counter */
 };
 
 #define INIT_THREAD_INFO(tsk)			\
 {						\
 	.flags		= 0,			\
+	.cpu		= 0,			\
 	.preempt_count	= INIT_PREEMPT_COUNT,	\
 }
 
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index e35154035441..629d38e36e22 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -14,8 +14,6 @@
  *    Copyright (C) 2003 James Bottomley <jejb at parisc-linux.org>
  */
 
-#define GENERATING_ASM_OFFSETS /* asm/smp.h */
-
 #include <linux/types.h>
 #include <linux/sched.h>
 #include <linux/thread_info.h>
@@ -40,7 +38,7 @@ int main(void)
 	DEFINE(TASK_TI_FLAGS, offsetof(struct task_struct, thread_info.flags));
 	DEFINE(TASK_STACK, offsetof(struct task_struct, stack));
 #ifdef CONFIG_SMP
-	DEFINE(TASK_CPU, offsetof(struct task_struct, cpu));
+	DEFINE(TASK_CPU, offsetof(struct task_struct, thread_info.cpu));
 #endif
 	BLANK();
 	DEFINE(TASK_REGS, offsetof(struct task_struct, thread.regs));
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 171925285f3e..0cd97fa004c5 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -339,7 +339,7 @@ int smp_boot_one_cpu(int cpuid, struct task_struct *idle)
 	const struct cpuinfo_parisc *p = &per_cpu(cpu_data, cpuid);
 	long timeout;
 
-	idle->cpu = cpuid;
+	task_thread_info(idle)->cpu = cpuid;
 
 	/* Let _start know what logical CPU we're booting
 	** (offset into init_tasks[],cpu_data[])
-- 
2.30.2


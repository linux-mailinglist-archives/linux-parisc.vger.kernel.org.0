Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F223487815
	for <lists+linux-parisc@lfdr.de>; Fri,  7 Jan 2022 14:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238787AbiAGNT6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 7 Jan 2022 08:19:58 -0500
Received: from mout.gmx.net ([212.227.15.15]:35085 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347519AbiAGNT5 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 7 Jan 2022 08:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641561589;
        bh=nx3cFJx4nMNvG/nHyI2Z83+zth/KFuD56T7+AzR1q8I=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=lu4qUHupehKcc03PTOZO8Gw9IALMZG/bLjmqW6E6BaTS2+r4vNycV/YmpMWhjG6dS
         X6mUqSBlEHqGU4zhNjJIEEi/3JTrw7smUKKRm5eVzlIRGwEsulJNixpgEq4d6pSdpI
         aL3YMcFF31k+PSLCKwgba5soErqwNt+RMRKQW5Eo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.182.203]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3siA-1mNzvh2EBE-00zntw; Fri, 07
 Jan 2022 14:19:49 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 1/2] parisc: Enable TOC (transfer of contents) feature unconditionally
Date:   Fri,  7 Jan 2022 14:18:49 +0100
Message-Id: <20220107131850.737880-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fVljG9FtskRVehTjsRb+zmr+Ous1nMjPtBi/FYgbH6V3++qr2r4
 vUMCIhNh4idzkioka/5jToOjDBETV002vZosJFOPDimS1MZjZVKlwCJKtcjq+9yQu4it74v
 lXwzA8+Ke7yBXm3iCS181s2PHLl58Y/tUkXVycCqIhQCoUNpW7NCf1uQuPem62EjkuHJTzi
 B1Oev7n4J4QJ/lHYnglzA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:h1ZmFGDe77Q=:iFNaHBuBVIiX+otlkWvFF3
 FnQsFXehVrkOhzvIqUGSXY4Zg3mrETheqnbjD4R9ooOpGi8zmvaGEk0FBsaGcbpG7Jnmrlt2S
 mYe8Rwn3TCDrUtQzNikiSZEduWwCJLSnMHnbktbo6M3xeH3y8ne5wUY0glauRUnDDQl0JZiSG
 z+NBdDJnFzG4uzufSxK1/YNGUFGgJEyHFvxkEIQOERKUhyAOusATlATkX/wbt66hrfG86P8N0
 Gh3o93/G1Gwoh++3nWojdqUdsbd0y6L9u5DEx6dS/vLukuW5KNqGdu4TtFHzW0PTItffaRrd3
 p3gXtJmzCI31UOIVPns4HDx/trRTuweLZLjgpysCCqv4WSiQitnpMdENb88uKAl4PU0TGIUUe
 sXSVswtJvxdwjrToGH5PCy79si1MqqYPkYmUNXQoU0l3UOYasXa+w5Mj2JOWSu36VbPD89rag
 yZH6WmABqKfI6vVnF8//nr55lYeYFA8I3NpTtGuXpBokiuwJQSTsHOInVrqG/u+t6Wk8a9PSs
 norghJN5iBlj9D5X73onwC9zdf4Z/P3NHogtk8W7+sQutjpR9XlCPGIgQv0vIvxLUuoILCPnE
 S2Yurc9XCgTLQYCJSxIX7FLg/ViWL9uS9It8UybFiBUPTS2sYqpwsYmzFb+Yv7sY+kpsVFuSw
 1/Z6t9j0c893dOo9TWn1XlHWq2yA5238SXPj9BUb+WnCfm6u2KkW3oMiYluAbR8c1zvgZNOBs
 5T0mz3QKZZmz/Ca2BejopSQc5rpNQ1Rdyici7vMSuj4rv5kUHH5emVwQWD85Jq42P+GMejBTv
 hwdCMcOTr5+/ydCsUObID6Tux8adRaErFFnJ6gHIC/1bsEqd39INBzp5nWR0sMMiHUb1AGfuH
 XS52LCURxR0CaniJAY7ITCbjJASXr45pbM4y/ZApCugPmPZexA1i0E0dnXQvfpwc6bOhPKcbn
 PJuHqz8Ua+HfJvV4VfE2qVdtY0JNINaeK37STWkIoEJOGkiIxqFsdmVQXUaAFPBAl/rJPwnkh
 +/w3P2XCFfIWkqjDyN+dG+hifv8Wc/p5H7F9SIsLXhAi9s1T6VgO46yaLqjT8BG1nKs42c8bE
 i6mbp3/PNyd4TM=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Before this patch, the TOC code used a pre-allocated stack of 16kb for
each possible CPU. That space overhead was the reason why the TOC
feature wasn't enabled by default for 32-bit kernels.

This patch rewrites the TOC code to use a per-cpu stack. That way we use
much less memory now and as such we enable the TOC feature by default on
all kernels.

Additionally the dump of the registers and the stacktrace wasn't
serialized, which led to multiple CPUs printing the stack backtrace at
once which rendered the output unreadable.
Now the backtraces are nicely serialized by a lock.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Kconfig              | 14 --------------
 arch/parisc/kernel/Makefile      |  3 +--
 arch/parisc/kernel/asm-offsets.c |  1 +
 arch/parisc/kernel/toc.c         | 19 ++++++++++++++++---
 arch/parisc/kernel/toc_asm.S     | 29 +++++++----------------------
 5 files changed, 25 insertions(+), 41 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 011dc32fdb4d..f55ccd1161f3 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -287,20 +287,6 @@ config SMP

 	  If you don't know what to do here, say N.

-config TOC
-	bool "Support TOC switch"
-	default y if 64BIT || !SMP
-	help
-	  Most PA-RISC machines have either a switch at the back of the machine
-	  or a command in BMC to trigger a TOC interrupt. If you say Y here a
-	  handler will be installed which will either show a backtrace on all
-	  CPUs, or enter a possible configured debugger like kgdb/kdb.
-
-	  Note that with this option enabled, the kernel will use an additional =
16KB
-	  per possible CPU as a special stack for the TOC handler.
-
-	  If you don't want to debug the Kernel, say N.
-
 config PARISC_CPU_TOPOLOGY
 	bool "Support cpu topology definition"
 	depends on SMP
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index ed0b87908d71..8fb819bbbb17 100644
=2D-- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -10,7 +10,7 @@ obj-y	     	:=3D cache.o pacache.o setup.o pdt.o traps.o=
 time.o irq.o \
 		   ptrace.o hardware.o inventory.o drivers.o alternative.o \
 		   signal.o hpmc.o real2.o parisc_ksyms.o unaligned.o \
 		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o \
-		   patch.o
+		   patch.o toc.o toc_asm.o

 ifdef CONFIG_FUNCTION_TRACER
 # Do not profile debug and lowlevel utilities
@@ -39,4 +39,3 @@ obj-$(CONFIG_KGDB)			+=3D kgdb.o
 obj-$(CONFIG_KPROBES)			+=3D kprobes.o
 obj-$(CONFIG_KEXEC_CORE)		+=3D kexec.o relocate_kernel.o
 obj-$(CONFIG_KEXEC_FILE)		+=3D kexec_file.o
-obj-$(CONFIG_TOC)			+=3D toc.o toc_asm.o
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-off=
sets.c
index 396aa3b47712..68b9dbd0c30b 100644
=2D-- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -36,6 +36,7 @@
 int main(void)
 {
 	DEFINE(TASK_TI_FLAGS, offsetof(struct task_struct, thread_info.flags));
+	DEFINE(TASK_TI_CPU, offsetof(struct task_struct, thread_info.cpu));
 	DEFINE(TASK_STACK, offsetof(struct task_struct, stack));
 	DEFINE(TASK_PAGEFAULT_DISABLED, offsetof(struct task_struct, pagefault_d=
isabled));
 	BLANK();
diff --git a/arch/parisc/kernel/toc.c b/arch/parisc/kernel/toc.c
index 18327611cf8f..dce20a54b21f 100644
=2D-- a/arch/parisc/kernel/toc.c
+++ b/arch/parisc/kernel/toc.c
@@ -9,8 +9,10 @@

 #include <asm/pdc.h>
 #include <asm/pdc_chassis.h>
+#include <asm/ldcw.h>

-unsigned int __aligned(16) toc_lock =3D 1;
+static unsigned int __aligned(16) toc_lock =3D 1;
+DEFINE_PER_CPU_PAGE_ALIGNED(char [16384], toc_stack);

 static void toc20_to_pt_regs(struct pt_regs *regs, struct pdc_toc_pim_20 =
*toc)
 {
@@ -63,7 +65,8 @@ void notrace __noreturn __cold toc_intr(struct pt_regs *=
regs)
 	struct pdc_toc_pim_20 pim_data20;
 	struct pdc_toc_pim_11 pim_data11;

-	nmi_enter();
+	/* verify we wrote regs to the correct stack */
+	BUG_ON(regs !=3D (struct pt_regs *)&per_cpu(toc_stack, raw_smp_processor=
_id()));

 	if (boot_cpu_data.cpu_type >=3D pcxu) {
 		if (pdc_pim_toc20(&pim_data20))
@@ -76,14 +79,24 @@ void notrace __noreturn __cold toc_intr(struct pt_regs=
 *regs)
 	}

 #ifdef CONFIG_KGDB
+	nmi_enter();
+
 	if (atomic_read(&kgdb_active) !=3D -1)
 		kgdb_nmicallback(raw_smp_processor_id(), regs);
 	kgdb_handle_exception(9, SIGTRAP, 0, regs);
-#endif
+#else
+	/* serialize output, otherwise all CPUs write backtrace at once */
+	while (__ldcw(&toc_lock) =3D=3D 0)
+		; /* wait */
 	show_regs(regs);
+	toc_lock =3D 1;	 /* release lock for next CPU */
+
+	if (raw_smp_processor_id() !=3D 0)
+		while (1) ; /* all but monarch CPU will wait endless. */

 	/* give other CPUs time to show their backtrace */
 	mdelay(2000);
+#endif
 	machine_restart("TOC");

 	/* should never reach this */
diff --git a/arch/parisc/kernel/toc_asm.S b/arch/parisc/kernel/toc_asm.S
index e94ba8044190..a04545289ce9 100644
=2D-- a/arch/parisc/kernel/toc_asm.S
+++ b/arch/parisc/kernel/toc_asm.S
@@ -5,33 +5,22 @@
 	.level 1.1

 #include <asm/assembly.h>
-#include <asm/psw.h>
 #include <linux/threads.h>
 #include <linux/linkage.h>

 	.text
 	.import toc_intr,code
-	.import toc_lock,data
+	.import toc_stack,data
 	.align 16
 ENTRY_CFI(toc_handler)
-	/*
-	 * synchronize CPUs and obtain offset
-	 * for stack setup.
-	 */
-	load32		PA(toc_lock),%r1
-0:	ldcw,co		0(%r1),%r2
-	cmpib,=3D		0,%r2,0b
-	nop
-	addi		1,%r2,%r4
-	stw		%r4,0(%r1)
-	addi		-1,%r2,%r4
+	mfctl   %cr30, %r1
+	tophys  %r1,%r2			/* task_struct */
+	LDREG   TASK_TI_CPU(%r2),%r4	/* cpu */

+	/* get per-cpu toc_stack address. */
 	load32	PA(toc_stack),%sp
-	/*
-	 * deposit CPU number into stack address,
-	 * so every CPU will have its own stack.
-	 */
-	SHLREG	%r4,14,%r4
+	load32	PA(__per_cpu_offset),%r1
+	LDREGX  %r4(%r1),%r4
 	add	%r4,%sp,%sp

 	/*
@@ -82,7 +71,3 @@ ENDPROC_CFI(toc_handler)
 	 */
 SYM_DATA(toc_handler_csum, .long 0)
 SYM_DATA(toc_handler_size, .long . - toc_handler)
-
-	__PAGE_ALIGNED_BSS
-	.align 64
-SYM_DATA(toc_stack, .block 16384*NR_CPUS)
=2D-
2.31.1


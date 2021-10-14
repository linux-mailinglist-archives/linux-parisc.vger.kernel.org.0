Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6787642E231
	for <lists+linux-parisc@lfdr.de>; Thu, 14 Oct 2021 21:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbhJNTva (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 14 Oct 2021 15:51:30 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:52120 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233675AbhJNTva (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 14 Oct 2021 15:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=iYy90R/CroxRfq8ApIxl9I7pvWa10YlREHXgHrywTgc=; b=Blo7UcUsDnr9uCoGHZBa1Sekty
        ZJ4BPBPmj0+vVbXAvla11gKhkuv77/kqZBMmiP0InG1rA4PMcxs7Uiapm9WI+CO4xUHnc5Wtg++FY
        MNeWR8ER6iscdO2PCXeOegei7apvk6DCDVcRJi8IjsAuawMSFlE6lEDYO9aAWuG0Edz0=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mb6jD-0006Sn-IL; Thu, 14 Oct 2021 21:49:23 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v3 4/4] parisc: add support for TOC (transfer of control)
Date:   Thu, 14 Oct 2021 21:49:16 +0200
Message-Id: <20211014194916.13901-5-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014194916.13901-1-svens@stackframe.org>
References: <20211014194916.13901-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Almost all PA-RISC machines have either a button that
is labeled with 'TOC' or a BMC function to trigger a TOC.
TOC is a non-maskable interrupt that is sent to the processor.
This can be used for diagnostic purposes like obtaining a
stack trace/register dump or to enter KDB/KGDB.

As an example, on my c8000, TOC can be used with:

CONFIG_KGDB=y
CONFIG_KGDB_KDB=y

and the 'kgdboc=ttyS0,115200' appended to the command line.

Press ^[( on serial console, which will enter the BMC command line,
and enter 'TOC s':

root@(none):/# (
cli>TOC s
Sending TOC/INIT.
<Cpu3> 2800035d03e00000  0000000040c21ac8  CC_ERR_CHECK_TOC
<Cpu0> 2800035d00e00000  0000000040c21ad0  CC_ERR_CHECK_TOC
<Cpu2> 2800035d02e00000  0000000040c21ac8  CC_ERR_CHECK_TOC
<Cpu1> 2800035d01e00000  0000000040c21ad0  CC_ERR_CHECK_TOC
<Cpu3> 37000f7303e00000  2000000000000000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu0> 37000f7300e00000  2000000000000000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu2> 37000f7302e00000  2000000000000000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu1> 37000f7301e00000  2000000000000000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu3> 4300100803e00000  c0000000001d26cc  CC_MC_BR_TO_OS_TOC
<Cpu0> 4300100800e00000  c0000000001d26cc  CC_MC_BR_TO_OS_TOC
<Cpu2> 4300100802e00000  c0000000001d26cc  CC_MC_BR_TO_OS_TOC
<Cpu1> 4300100801e00000  c0000000001d26cc  CC_MC_BR_TO_OS_TOC

Entering kdb (current=0x00000000411cef80, pid 0) on processor 0 due to NonMaskable Interrupt @ 0x40c21ad0
[0]kdb>

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/Kconfig                 |  14 ++++
 arch/parisc/include/asm/processor.h |   4 +
 arch/parisc/include/uapi/asm/pdc.h  |   6 +-
 arch/parisc/kernel/Makefile         |   1 +
 arch/parisc/kernel/toc.c            | 111 ++++++++++++++++++++++++++++
 arch/parisc/kernel/toc_asm.S        |  88 ++++++++++++++++++++++
 6 files changed, 222 insertions(+), 2 deletions(-)
 create mode 100644 arch/parisc/kernel/toc.c
 create mode 100644 arch/parisc/kernel/toc_asm.S

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 27a8b49af11f..97a889eaffe1 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -288,6 +288,20 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
+config TOC
+	bool "Support TOC switch"
+	default y if 64BIT || !SMP
+	help
+	  Most PA-RISC machines have either a switch at the back of the machine
+	  or a command in BMC to trigger a TOC interrupt. If you say Y here a
+	  handler will be installed which will either show a backtrace on all
+	  CPUs, or enter a possible configured debugger like kgdb/kdb.
+
+	  Note that with this option enabled, the kernel will use an additional 16KB
+	  per possible CPU as a special stack for the TOC handler.
+
+	  If you don't want to debug the Kernel, so N.
+
 config PARISC_CPU_TOPOLOGY
 	bool "Support cpu topology definition"
 	depends on SMP
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index eeb7da064289..1e9a4c986921 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -294,6 +294,10 @@ extern int _parisc_requires_coherency;
 
 extern int running_on_qemu;
 
+extern void toc_handler(void);
+extern unsigned int toc_handler_size;
+extern unsigned int toc_handler_csum;
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_PARISC_PROCESSOR_H */
diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi/asm/pdc.h
index ad51df8ba952..acc633c15722 100644
--- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -398,8 +398,10 @@ struct zeropage {
 	/* int	(*vec_rendz)(void); */
 	unsigned int vec_rendz;
 	int	vec_pow_fail_flen;
-	int	vec_pad[10];		
-	
+	int	vec_pad0[3];
+	unsigned int vec_toc_hi;
+	int	vec_pad1[6];
+
 	/* [0x040] reserved processor dependent */
 	int	pad0[112];
 
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 068d90950d93..ed0b87908d71 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -39,3 +39,4 @@ obj-$(CONFIG_KGDB)			+= kgdb.o
 obj-$(CONFIG_KPROBES)			+= kprobes.o
 obj-$(CONFIG_KEXEC_CORE)		+= kexec.o relocate_kernel.o
 obj-$(CONFIG_KEXEC_FILE)		+= kexec_file.o
+obj-$(CONFIG_TOC)			+= toc.o toc_asm.o
diff --git a/arch/parisc/kernel/toc.c b/arch/parisc/kernel/toc.c
new file mode 100644
index 000000000000..18327611cf8f
--- /dev/null
+++ b/arch/parisc/kernel/toc.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kernel.h>
+#include <linux/kgdb.h>
+#include <linux/printk.h>
+#include <linux/sched/debug.h>
+#include <linux/delay.h>
+#include <linux/reboot.h>
+
+#include <asm/pdc.h>
+#include <asm/pdc_chassis.h>
+
+unsigned int __aligned(16) toc_lock = 1;
+
+static void toc20_to_pt_regs(struct pt_regs *regs, struct pdc_toc_pim_20 *toc)
+{
+	int i;
+
+	regs->gr[0] = (unsigned long)toc->cr[22];
+
+	for (i = 1; i < 32; i++)
+		regs->gr[i] = (unsigned long)toc->gr[i];
+
+	for (i = 0; i < 8; i++)
+		regs->sr[i] = (unsigned long)toc->sr[i];
+
+	regs->iasq[0] = (unsigned long)toc->cr[17];
+	regs->iasq[1] = (unsigned long)toc->iasq_back;
+	regs->iaoq[0] = (unsigned long)toc->cr[18];
+	regs->iaoq[1] = (unsigned long)toc->iaoq_back;
+
+	regs->sar = (unsigned long)toc->cr[11];
+	regs->iir = (unsigned long)toc->cr[19];
+	regs->isr = (unsigned long)toc->cr[20];
+	regs->ior = (unsigned long)toc->cr[21];
+}
+
+static void toc11_to_pt_regs(struct pt_regs *regs, struct pdc_toc_pim_11 *toc)
+{
+	int i;
+
+	regs->gr[0] = toc->cr[22];
+
+	for (i = 1; i < 32; i++)
+		regs->gr[i] = toc->gr[i];
+
+	for (i = 0; i < 8; i++)
+		regs->sr[i] = toc->sr[i];
+
+	regs->iasq[0] = toc->cr[17];
+	regs->iasq[1] = toc->iasq_back;
+	regs->iaoq[0] = toc->cr[18];
+	regs->iaoq[1] = toc->iaoq_back;
+
+	regs->sar  = toc->cr[11];
+	regs->iir  = toc->cr[19];
+	regs->isr  = toc->cr[20];
+	regs->ior  = toc->cr[21];
+}
+
+void notrace __noreturn __cold toc_intr(struct pt_regs *regs)
+{
+	struct pdc_toc_pim_20 pim_data20;
+	struct pdc_toc_pim_11 pim_data11;
+
+	nmi_enter();
+
+	if (boot_cpu_data.cpu_type >= pcxu) {
+		if (pdc_pim_toc20(&pim_data20))
+			panic("Failed to get PIM data");
+		toc20_to_pt_regs(regs, &pim_data20);
+	} else {
+		if (pdc_pim_toc11(&pim_data11))
+			panic("Failed to get PIM data");
+		toc11_to_pt_regs(regs, &pim_data11);
+	}
+
+#ifdef CONFIG_KGDB
+	if (atomic_read(&kgdb_active) != -1)
+		kgdb_nmicallback(raw_smp_processor_id(), regs);
+	kgdb_handle_exception(9, SIGTRAP, 0, regs);
+#endif
+	show_regs(regs);
+
+	/* give other CPUs time to show their backtrace */
+	mdelay(2000);
+	machine_restart("TOC");
+
+	/* should never reach this */
+	panic("TOC");
+}
+
+static __init int setup_toc(void)
+{
+	unsigned int csum = 0;
+	unsigned long toc_code = (unsigned long)dereference_function_descriptor(toc_handler);
+	int i;
+
+	PAGE0->vec_toc = __pa(toc_code) & 0xffffffff;
+#ifdef CONFIG_64BIT
+	PAGE0->vec_toc_hi = __pa(toc_code) >> 32;
+#endif
+	PAGE0->vec_toclen = toc_handler_size;
+
+	for (i = 0; i < toc_handler_size/4; i++)
+		csum += ((u32 *)toc_code)[i];
+	toc_handler_csum = -csum;
+	pr_info("TOC handler registered\n");
+	return 0;
+}
+early_initcall(setup_toc);
diff --git a/arch/parisc/kernel/toc_asm.S b/arch/parisc/kernel/toc_asm.S
new file mode 100644
index 000000000000..e94ba8044190
--- /dev/null
+++ b/arch/parisc/kernel/toc_asm.S
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* TOC (Transfer of Control) handler. */
+
+	.level 1.1
+
+#include <asm/assembly.h>
+#include <asm/psw.h>
+#include <linux/threads.h>
+#include <linux/linkage.h>
+
+	.text
+	.import toc_intr,code
+	.import toc_lock,data
+	.align 16
+ENTRY_CFI(toc_handler)
+	/*
+	 * synchronize CPUs and obtain offset
+	 * for stack setup.
+	 */
+	load32		PA(toc_lock),%r1
+0:	ldcw,co		0(%r1),%r2
+	cmpib,=		0,%r2,0b
+	nop
+	addi		1,%r2,%r4
+	stw		%r4,0(%r1)
+	addi		-1,%r2,%r4
+
+	load32	PA(toc_stack),%sp
+	/*
+	 * deposit CPU number into stack address,
+	 * so every CPU will have its own stack.
+	 */
+	SHLREG	%r4,14,%r4
+	add	%r4,%sp,%sp
+
+	/*
+	 * setup pt_regs on stack and save the
+	 * floating point registers. PIM_TOC doesn't
+	 * save fp registers, so we're doing it here.
+	 */
+	copy	%sp,%arg0
+	ldo	PT_SZ_ALGN(%sp), %sp
+
+	/* clear pt_regs */
+	copy	%arg0,%r1
+0:	cmpb,<<,n %r1,%sp,0b
+	stw,ma	%r0,4(%r1)
+
+	ldo	PT_FR0(%arg0),%r25
+	save_fp	%r25
+
+	/* go virtual */
+	load32	PA(swapper_pg_dir),%r4
+	mtctl	%r4,%cr24
+	mtctl	%r4,%cr25
+
+	/* Clear sr4-sr7 */
+	mtsp	%r0, %sr4
+	mtsp	%r0, %sr5
+	mtsp	%r0, %sr6
+	mtsp	%r0, %sr7
+
+	tovirt_r1 %sp
+	tovirt_r1 %arg0
+	virt_map
+
+	loadgp
+
+#ifdef CONFIG_64BIT
+	ldo	-16(%sp),%r29
+#endif
+	load32	toc_intr,%r1
+	be	0(%sr7,%r1)
+	nop
+ENDPROC_CFI(toc_handler)
+
+	/*
+	 * keep this checksum here, as it is part of the toc_handler
+	 * spanned by toc_handler_size (all words in toc_handler are
+	 * added in PDC and the sum must equal to zero.
+	 */
+SYM_DATA(toc_handler_csum, .long 0)
+SYM_DATA(toc_handler_size, .long . - toc_handler)
+
+	__PAGE_ALIGNED_BSS
+	.align 64
+SYM_DATA(toc_stack, .block 16384*NR_CPUS)
-- 
2.33.0


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171F24282F6
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Oct 2021 20:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbhJJSkU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 10 Oct 2021 14:40:20 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:55042 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbhJJSkU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 10 Oct 2021 14:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hze5LWquRZknChAR2N6PrJ6Tv50xGaeCmOdFQe9mw/k=; b=NmbWyL4ZxFNbFshsL9k8Rgb/tp
        QoGyYqhI63vDAFomq5QIP6Xr13o4sveVzbrqK2cYt719siPBCO61P0cCzRzcwC5vYrNxUFdXqcKDH
        S867YgIfDEOjW3bg4BM1cBhhAQcQDXF3+KgqBXjKu8goIV/XmF1GLNGUFayc7nZ6rkIk=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZdiG-000661-3i; Sun, 10 Oct 2021 20:38:20 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH 2/2] parisc: add support for TOC (transfer of control)
Date:   Sun, 10 Oct 2021 20:38:15 +0200
Message-Id: <20211010183815.5780-3-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211010183815.5780-1-svens@stackframe.org>
References: <20211010183815.5780-1-svens@stackframe.org>
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

Press ^( on serial console, which will enter the BMC command line,
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
 arch/parisc/include/asm/processor.h |  4 ++
 arch/parisc/include/uapi/asm/pdc.h  |  6 ++-
 arch/parisc/kernel/entry.S          | 74 +++++++++++++++++++++++++++
 arch/parisc/kernel/processor.c      | 22 ++++++++
 arch/parisc/kernel/traps.c          | 79 +++++++++++++++++++++++++++++
 5 files changed, 183 insertions(+), 2 deletions(-)

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
 
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 9f939afe6b88..25ec47e9ae24 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -28,6 +28,7 @@
 
 #include <linux/linkage.h>
 #include <linux/pgtable.h>
+#include <linux/threads.h>
 
 #ifdef CONFIG_64BIT
 	.level 2.0w
@@ -2414,3 +2415,76 @@ ENTRY_CFI(set_register)
 	copy    %r1,%r31
 ENDPROC_CFI(set_register)
 
+	.import toc_intr,code
+	.import toc_lock,data
+	ENTRY_CFI(toc_handler)
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
+	/* setup pt_regs on stack and save the
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
+#ifdef CONFIG_64BIT
+	ldo	-16(%sp),%r29
+#endif
+	b,l	toc_intr,%r2
+	nop
+0:	b	0b
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
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 1b6129e7d776..c6e4fee79f30 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -28,6 +28,7 @@
 #include <asm/pdcpat.h>
 #include <asm/irq.h>		/* for struct irq_region */
 #include <asm/parisc-device.h>
+#include <asm/sections.h>
 
 struct system_cpuinfo_parisc boot_cpu_data __ro_after_init;
 EXPORT_SYMBOL(boot_cpu_data);
@@ -37,6 +38,7 @@ EXPORT_SYMBOL(_parisc_requires_coherency);
 #endif
 
 DEFINE_PER_CPU(struct cpuinfo_parisc, cpu_data);
+unsigned int __aligned(16) toc_lock = 1;
 
 /*
 **  	PARISC CPU driver - claim "device" and initialize CPU data structures.
@@ -453,6 +455,25 @@ static struct parisc_driver cpu_driver __refdata = {
 	.probe		= processor_probe
 };
 
+static __init void setup_toc(void)
+{
+	unsigned int csum = 0;
+	unsigned long toc_code = (unsigned long)dereference_function_descriptor(toc_handler);
+	int i;
+
+	PAGE0->vec_toc = __pa(toc_code) & 0xffffffff;
+#ifdef CONFIG_64BIT
+	PAGE0->vec_toc_hi = __pa(toc_code) >> 32;
+#else
+	PAGE0->vec_toc_hi = 0;
+#endif
+	PAGE0->vec_toclen = toc_handler_size;
+
+	for (i = 0; i < toc_handler_size/4; i++)
+		csum += ((u32 *)toc_code)[i];
+	toc_handler_csum = -csum;
+}
+
 /**
  * processor_init - Processor initialization procedure.
  *
@@ -460,5 +481,6 @@ static struct parisc_driver cpu_driver __refdata = {
  */
 void __init processor_init(void)
 {
+	setup_toc();
 	register_parisc_driver(&cpu_driver);
 }
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 747c328fb886..e847d37eda3a 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -30,6 +30,8 @@
 #include <linux/ratelimit.h>
 #include <linux/uaccess.h>
 #include <linux/kdebug.h>
+#include <linux/kdb.h>
+#include <linux/reboot.h>
 
 #include <asm/assembly.h>
 #include <asm/io.h>
@@ -472,6 +474,83 @@ void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long o
 	panic(msg);
 }
 
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
+void notrace toc_intr(struct pt_regs *regs)
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
+	kgdb_handle_exception(KDB_REASON_SYSTEM_NMI, SIGTRAP, 0, regs);
+#endif
+	show_regs(regs);
+
+	/* give other CPUs time to show their backtrace */
+	mdelay(2000);
+	machine_restart("TOC");
+
+	nmi_exit();
+}
+
 void notrace handle_interruption(int code, struct pt_regs *regs)
 {
 	unsigned long fault_address = 0;
-- 
2.33.0


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95DDF720EE
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jul 2019 22:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389153AbfGWUiB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 Jul 2019 16:38:01 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:44434 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389119AbfGWUiA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 Jul 2019 16:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=r+pOu4JhNcuLHAjSoU7EGPn3OF9ZU7z7MwJqSoQuifQ=; b=AVe/U2ZXcrBlndFuZRXC1j3DGS
        WJ3eenQX1HF22YsrDrAfb1SVcFZ06MHF3tLGvP2h12sYt3glbaiZEaaNkhSv3nQIgiXdXh1DjuA3+
        vkNCfechucfjeBVd6Z+5U0zUqwRhlHPS7CkMLiTIUdWAWUYvBGO/DDeyP2SyYzeD7Zz8=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hq1Xq-0002i7-H8; Tue, 23 Jul 2019 22:37:58 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 2/4] parisc/ftrace: Add KPROBES_ON_FTRACE
Date:   Tue, 23 Jul 2019 22:37:52 +0200
Message-Id: <20190723203754.7126-3-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723203754.7126-1-svens@stackframe.org>
References: <20190723203754.7126-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Allow KPROBES to use the ftrace infrastructure on PA-RISC.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 .../debug/kprobes-on-ftrace/arch-support.txt  |  2 +-
 arch/parisc/Kconfig                           |  2 +
 arch/parisc/kernel/entry.S                    | 99 +++++++++++++++++++
 arch/parisc/kernel/ftrace.c                   | 58 ++++++++++-
 4 files changed, 157 insertions(+), 4 deletions(-)

diff --git a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
index 68f266944d5f..4fae0464ddff 100644
--- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
+++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
@@ -21,7 +21,7 @@
     |       nds32: | TODO |
     |       nios2: | TODO |
     |    openrisc: | TODO |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: | TODO |
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 6d732e451071..ee59171edffe 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -61,6 +61,8 @@ config PARISC
 	select HAVE_KRETPROBES
 	select HAVE_DYNAMIC_FTRACE if $(cc-option,-fpatchable-function-entry=1,1)
 	select HAVE_FTRACE_MCOUNT_RECORD if HAVE_DYNAMIC_FTRACE
+	select HAVE_KPROBES_ON_FTRACE
+	select HAVE_DYNAMIC_FTRACE_WITH_REGS
 
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index d9d3387f7c47..1d1d748c227f 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1996,6 +1996,7 @@ _mcount:
 	 * calling mcount(), and 2 instructions for ftrace_stub().  That way we
 	 * have all on one L1 cacheline.
 	 */
+	ldi	0, %arg3
 	b	ftrace_function_trampoline
 	copy	%r3, %arg2	/* caller original %sp */
 ftrace_stub:
@@ -2048,6 +2049,7 @@ ftrace_caller:
 	LDREG	0(%r3), %r25
 	copy	%rp, %r26
 	ldo	-8(%r25), %r25
+	ldi	0, %r23		/* no pt_regs */
 	b,l	ftrace_function_trampoline, %rp
 	copy	%r3, %r24
 
@@ -2075,6 +2077,103 @@ ftrace_caller:
 
 ENDPROC_CFI(ftrace_caller)
 
+#ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS
+ENTRY_CFI(ftrace_regs_caller,caller,frame=FTRACE_FRAME_SIZE+PT_SZ_ALGN,
+	CALLS,SAVE_RP,SAVE_SP)
+ftrace_regs_caller:
+	.global ftrace_regs_caller
+
+	ldo	-FTRACE_FRAME_SIZE(%sp), %r1
+	STREG	%rp, -RP_OFFSET(%r1)
+
+	copy	%sp, %r1
+	ldo	PT_SZ_ALGN(%sp), %sp
+
+	STREG	%rp, PT_GR2(%r1)
+	STREG	%r3, PT_GR3(%r1)
+	STREG	%r4, PT_GR4(%r1)
+	STREG	%r5, PT_GR5(%r1)
+	STREG	%r6, PT_GR6(%r1)
+	STREG	%r7, PT_GR7(%r1)
+	STREG	%r8, PT_GR8(%r1)
+	STREG	%r9, PT_GR9(%r1)
+	STREG   %r10, PT_GR10(%r1)
+	STREG   %r11, PT_GR11(%r1)
+	STREG   %r12, PT_GR12(%r1)
+	STREG   %r13, PT_GR13(%r1)
+	STREG   %r14, PT_GR14(%r1)
+	STREG   %r15, PT_GR15(%r1)
+	STREG   %r16, PT_GR16(%r1)
+	STREG   %r17, PT_GR17(%r1)
+	STREG   %r18, PT_GR18(%r1)
+	STREG	%r19, PT_GR19(%r1)
+	STREG	%r20, PT_GR20(%r1)
+	STREG	%r21, PT_GR21(%r1)
+	STREG	%r22, PT_GR22(%r1)
+	STREG	%r23, PT_GR23(%r1)
+	STREG	%r24, PT_GR24(%r1)
+	STREG	%r25, PT_GR25(%r1)
+	STREG	%r26, PT_GR26(%r1)
+	STREG	%r27, PT_GR27(%r1)
+	STREG	%r28, PT_GR28(%r1)
+	STREG	%r29, PT_GR29(%r1)
+	STREG	%r30, PT_GR30(%r1)
+	STREG	%r31, PT_GR31(%r1)
+	mfctl	%cr11, %r26
+	STREG	%r26, PT_SAR(%r1)
+
+	copy	%rp, %r26
+	LDREG	-FTRACE_FRAME_SIZE-PT_SZ_ALGN(%sp), %r25
+	ldo	-8(%r25), %r25
+	copy	%r3, %arg2
+	b,l	ftrace_function_trampoline, %rp
+	copy	%r1, %arg3 /* struct pt_regs */
+
+	ldo	-PT_SZ_ALGN(%sp), %r1
+
+	LDREG	PT_SAR(%r1), %rp
+	mtctl	%rp, %cr11
+
+	LDREG	PT_GR2(%r1), %rp
+	LDREG	PT_GR3(%r1), %r3
+	LDREG	PT_GR4(%r1), %r4
+	LDREG	PT_GR5(%r1), %r5
+	LDREG	PT_GR6(%r1), %r6
+	LDREG	PT_GR7(%r1), %r7
+	LDREG	PT_GR8(%r1), %r8
+	LDREG	PT_GR9(%r1), %r9
+	LDREG   PT_GR10(%r1),%r10
+	LDREG   PT_GR11(%r1),%r11
+	LDREG   PT_GR12(%r1),%r12
+	LDREG   PT_GR13(%r1),%r13
+	LDREG   PT_GR14(%r1),%r14
+	LDREG   PT_GR15(%r1),%r15
+	LDREG   PT_GR16(%r1),%r16
+	LDREG   PT_GR17(%r1),%r17
+	LDREG   PT_GR18(%r1),%r18
+	LDREG   PT_GR19(%r1),%r19
+	LDREG   PT_GR20(%r1),%r20
+	LDREG   PT_GR21(%r1),%r21
+	LDREG   PT_GR22(%r1),%r22
+	LDREG   PT_GR23(%r1),%r23
+	LDREG   PT_GR24(%r1),%r24
+	LDREG   PT_GR25(%r1),%r25
+	LDREG   PT_GR26(%r1),%r26
+	LDREG   PT_GR27(%r1),%r27
+	LDREG   PT_GR28(%r1),%r28
+	LDREG   PT_GR29(%r1),%r29
+	LDREG   PT_GR30(%r1),%r30
+	LDREG   PT_GR31(%r1),%r31
+
+	ldo	-PT_SZ_ALGN(%sp), %sp
+	LDREGM	-FTRACE_FRAME_SIZE(%sp), %r1
+	/* Adjust return point to jump back to beginning of traced function */
+	ldo	-4(%r1), %r1
+	bv,n	(%r1)
+
+ENDPROC_CFI(ftrace_regs_caller)
+
+#endif
 #endif
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index ea5c50de0b65..2c6086dbfe68 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -13,6 +13,8 @@
 #include <linux/init.h>
 #include <linux/ftrace.h>
 #include <linux/uaccess.h>
+#include <linux/kprobes.h>
+#include <linux/ptrace.h>
 
 #include <asm/assembly.h>
 #include <asm/sections.h>
@@ -48,7 +50,8 @@ static void __hot prepare_ftrace_return(unsigned long *parent,
 
 void notrace __hot ftrace_function_trampoline(unsigned long parent,
 				unsigned long self_addr,
-				unsigned long org_sp_gr3)
+				unsigned long org_sp_gr3,
+				struct pt_regs *regs)
 {
 #ifndef CONFIG_DYNAMIC_FTRACE
 	extern ftrace_func_t ftrace_trace_function;
@@ -58,11 +61,11 @@ void notrace __hot ftrace_function_trampoline(unsigned long parent,
 	if (function_trace_op->flags & FTRACE_OPS_FL_ENABLED &&
 	    ftrace_trace_function != ftrace_stub)
 		ftrace_trace_function(self_addr, parent,
-				function_trace_op, NULL);
+				function_trace_op, regs);
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	if (ftrace_graph_return != (trace_func_graph_ret_t) ftrace_stub ||
-		ftrace_graph_entry != ftrace_graph_entry_stub) {
+	    ftrace_graph_entry != ftrace_graph_entry_stub) {
 		unsigned long *parent_rp;
 
 		/* calculate pointer to %rp in stack */
@@ -100,6 +103,12 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	return 0;
 }
 
+int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
+			unsigned long addr)
+{
+	return 0;
+}
+
 unsigned long ftrace_call_adjust(unsigned long addr)
 {
 	return addr+(FTRACE_PATCHABLE_FUNCTION_SIZE-1)*4;
@@ -190,3 +199,46 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 	return 0;
 }
 #endif
+
+#ifdef CONFIG_KPROBES_ON_FTRACE
+void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
+			   struct ftrace_ops *ops, struct pt_regs *regs)
+{
+	struct kprobe_ctlblk *kcb;
+	struct kprobe *p = get_kprobe((kprobe_opcode_t *)ip);
+
+	if (unlikely(!p) || kprobe_disabled(p))
+		return;
+
+	if (kprobe_running()) {
+		kprobes_inc_nmissed_count(p);
+		return;
+	}
+
+	__this_cpu_write(current_kprobe, p);
+
+	kcb = get_kprobe_ctlblk();
+	kcb->kprobe_status = KPROBE_HIT_ACTIVE;
+
+	regs->iaoq[0] = ip;
+	regs->iaoq[1] = ip + 4;
+
+	if (!p->pre_handler || !p->pre_handler(p, regs)) {
+		regs->iaoq[0] = ip + 4;
+		regs->iaoq[1] = ip + 8;
+
+		if (unlikely(p->post_handler)) {
+			kcb->kprobe_status = KPROBE_HIT_SSDONE;
+			p->post_handler(p, regs, 0);
+		}
+	}
+	__this_cpu_write(current_kprobe, NULL);
+}
+NOKPROBE_SYMBOL(kprobe_ftrace_handler);
+
+int arch_prepare_kprobe_ftrace(struct kprobe *p)
+{
+	p->ainsn.insn = NULL;
+	return 0;
+}
+#endif
-- 
2.20.1


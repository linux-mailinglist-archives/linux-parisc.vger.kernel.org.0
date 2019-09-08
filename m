Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C970ACBD2
	for <lists+linux-parisc@lfdr.de>; Sun,  8 Sep 2019 11:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbfIHJdT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 8 Sep 2019 05:33:19 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:47651 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbfIHJdT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 8 Sep 2019 05:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=R69A0rcEra/kjpLvu1UPPKZ72eaRW8bSrjyVMIVNR2I=; b=bcuPU660IQvW/KTLxNvULDnjsR
        9h+go10+xpaRJsFfK3SjYbFy1t3DuVX2TJmotXO/WpJwyQ2cpud7uCJary/5mSqk8sc871O5zlIDW
        0rU1jpQfFswZYZLSYJUJkeOJSzI6joRqNOxYc5UFNsY2g+ig6ftkC9VhW+ps+w3tpg8k=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de ([46.5.233.221] helo=x280.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1i6tZN-0005Ro-0q; Sun, 08 Sep 2019 11:33:17 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 2/4] parisc: add kexec syscall support
Date:   Sun,  8 Sep 2019 11:33:04 +0200
Message-Id: <20190908093306.31455-3-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190908093306.31455-1-svens@stackframe.org>
References: <20190908093306.31455-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

---
 arch/parisc/Kconfig                  |  13 +++
 arch/parisc/include/asm/fixmap.h     |   1 +
 arch/parisc/include/asm/kexec.h      |  37 +++++++
 arch/parisc/kernel/Makefile          |   1 +
 arch/parisc/kernel/kexec.c           | 102 ++++++++++++++++++
 arch/parisc/kernel/relocate_kernel.S | 149 +++++++++++++++++++++++++++
 include/uapi/linux/kexec.h           |   1 +
 7 files changed, 304 insertions(+)
 create mode 100644 arch/parisc/include/asm/kexec.h
 create mode 100644 arch/parisc/kernel/kexec.c
 create mode 100644 arch/parisc/kernel/relocate_kernel.S

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index ee59171edffe..548c767f4358 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -346,6 +346,19 @@ config NR_CPUS
 	depends on SMP
 	default "4"
 
+config KEXEC
+	bool "Kexec system call"
+	select KEXEC_CORE
+	help
+	  kexec is a system call that implements the ability to shutdown your
+	  current kernel, and to start another kernel.  It is like a reboot
+	  but it is independent of the system firmware.   And like a reboot
+	  you can start any kernel with it, not just Linux.
+
+	  It is an ongoing process to be certain the hardware in a machine
+	  shutdown, so do not be surprised if this code does not
+	  initially work for you.
+
 endmenu
 
 
diff --git a/arch/parisc/include/asm/fixmap.h b/arch/parisc/include/asm/fixmap.h
index 288da73d4cc0..e480b2c05407 100644
--- a/arch/parisc/include/asm/fixmap.h
+++ b/arch/parisc/include/asm/fixmap.h
@@ -30,6 +30,7 @@
 enum fixed_addresses {
 	/* Support writing RO kernel text via kprobes, jump labels, etc. */
 	FIX_TEXT_POKE0,
+	FIX_TEXT_KEXEC,
 	FIX_BITMAP_COUNT
 };
 
diff --git a/arch/parisc/include/asm/kexec.h b/arch/parisc/include/asm/kexec.h
new file mode 100644
index 000000000000..a99ea747d7ed
--- /dev/null
+++ b/arch/parisc/include/asm/kexec.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_PARISC_KEXEC_H
+#define _ASM_PARISC_KEXEC_H
+
+#ifdef CONFIG_KEXEC
+
+/* Maximum physical address we can use pages from */
+#define KEXEC_SOURCE_MEMORY_LIMIT (-1UL)
+/* Maximum address we can reach in physical address mode */
+#define KEXEC_DESTINATION_MEMORY_LIMIT (-1UL)
+/* Maximum address we can use for the control code buffer */
+#define KEXEC_CONTROL_MEMORY_LIMIT (-1UL)
+
+#define KEXEC_CONTROL_PAGE_SIZE	4096
+
+#define KEXEC_ARCH KEXEC_ARCH_PARISC
+#define ARCH_HAS_KIMAGE_ARCH
+
+#ifndef __ASSEMBLY__
+
+struct kimage_arch {
+	unsigned long initrd_start;
+	unsigned long initrd_end;
+	unsigned long cmdline;
+};
+
+static inline void crash_setup_regs(struct pt_regs *newregs,
+				    struct pt_regs *oldregs)
+{
+	/* Dummy implementation for now */
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* CONFIG_KEXEC */
+
+#endif /* _ASM_PARISC_KEXEC_H */
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index c232266b517c..487cf88866a8 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
 obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
 obj-$(CONFIG_KGDB)			+= kgdb.o
 obj-$(CONFIG_KPROBES)			+= kprobes.o
+obj-$(CONFIG_KEXEC)			+= kexec.o relocate_kernel.o
diff --git a/arch/parisc/kernel/kexec.c b/arch/parisc/kernel/kexec.c
new file mode 100644
index 000000000000..deeb0466d359
--- /dev/null
+++ b/arch/parisc/kernel/kexec.c
@@ -0,0 +1,102 @@
+#include <linux/kernel.h>
+#include <linux/console.h>
+#include <linux/kexec.h>
+#include <linux/delay.h>
+#include <asm/cacheflush.h>
+#include <asm/sections.h>
+
+extern void relocate_new_kernel(unsigned long head,
+				unsigned long start,
+				unsigned long phys);
+
+extern const unsigned int relocate_new_kernel_size;
+extern unsigned int kexec_initrd_start_offset;
+extern unsigned int kexec_initrd_end_offset;
+extern unsigned int kexec_cmdline_offset;
+extern unsigned int kexec_free_mem_offset;
+
+static void kexec_show_segment_info(const struct kimage *kimage, unsigned long n)
+{
+	pr_debug("    segment[%lu]: %016lx - %016lx, 0x%lx bytes, %lu pages\n",
+			n,
+			kimage->segment[n].mem,
+			kimage->segment[n].mem + kimage->segment[n].memsz,
+			(unsigned long)kimage->segment[n].memsz,
+			(unsigned long)kimage->segment[n].memsz /  PAGE_SIZE);
+}
+
+static void kexec_image_info(const struct kimage *kimage)
+{
+	unsigned long i;
+
+	pr_debug("kexec kimage info:\n");
+	pr_debug("  type:        %d\n", kimage->type);
+	pr_debug("  start:       %lx\n", kimage->start);
+	pr_debug("  head:        %lx\n", kimage->head);
+	pr_debug("  nr_segments: %lu\n", kimage->nr_segments);
+
+	for (i = 0; i < kimage->nr_segments; i++)
+		kexec_show_segment_info(kimage, i);
+}
+
+void machine_kexec_cleanup(struct kimage *kimage)
+{
+}
+
+void machine_crash_shutdown(struct pt_regs *regs)
+{
+}
+
+void machine_shutdown(void)
+{
+	smp_send_stop();
+	while(num_online_cpus() > 1) {
+		cpu_relax();
+		mdelay(1);
+	}
+}
+
+void machine_kexec(struct kimage *image)
+{
+#ifdef CONFIG_64BIT
+	Elf64_Fdesc desc;
+#endif
+	void (*reloc)(unsigned long head,
+		      unsigned long start,
+		      unsigned long phys);
+
+	unsigned long phys = page_to_phys(image->control_code_page);
+	void *virt = (void *)__fix_to_virt(FIX_TEXT_KEXEC);
+	struct kimage_arch *arch = &image->arch;
+
+	set_fixmap(FIX_TEXT_KEXEC, phys);
+
+	flush_cache_all();
+
+#ifdef CONFIG_64BIT
+	reloc = (void *)&desc;
+	desc.addr = (long long)virt;
+#else
+	reloc = (void *)virt;
+#endif
+
+	memcpy(virt, dereference_function_descriptor(relocate_new_kernel),
+		relocate_new_kernel_size);
+
+	*(unsigned long *)(virt + kexec_cmdline_offset) = arch->cmdline;
+	*(unsigned long *)(virt + kexec_initrd_start_offset) = arch->initrd_start;
+	*(unsigned long *)(virt + kexec_initrd_end_offset) = arch->initrd_end;
+	*(unsigned long *)(virt + kexec_free_mem_offset) = PAGE0->mem_free;
+
+	flush_cache_all();
+	flush_tlb_all();
+	local_irq_disable();
+
+	reloc(image->head & PAGE_MASK, image->start, phys);
+}
+
+int machine_kexec_prepare(struct kimage *image)
+{
+	kexec_image_info(image);
+	return 0;
+}
diff --git a/arch/parisc/kernel/relocate_kernel.S b/arch/parisc/kernel/relocate_kernel.S
new file mode 100644
index 000000000000..2561e52b8d9b
--- /dev/null
+++ b/arch/parisc/kernel/relocate_kernel.S
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/linkage.h>
+#include <linux/kexec.h>
+
+#include <asm/assembly.h>
+#include <asm/asm-offsets.h>
+#include <asm/page.h>
+#include <asm/setup.h>
+#include <asm/psw.h>
+
+.level PA_ASM_LEVEL
+
+.macro	kexec_param name
+.align 8
+ENTRY(kexec\()_\name)
+#ifdef CONFIG_64BIT
+	.dword 0
+#else
+	.word 0
+#endif
+
+ENTRY(kexec\()_\name\()_offset)
+	.word kexec\()_\name - relocate_new_kernel
+.endm
+
+.text
+
+/* args:
+ * r26 - kimage->head
+ * r25 - start address of kernel
+ * r24 - physical address of relocate code
+ */
+
+ENTRY_CFI(relocate_new_kernel)
+0:	copy	%arg1, %rp
+	/* disable I and Q bit, so we are allowed to execute RFI */
+	rsm PSW_SM_I, %r0
+	nop
+	nop
+	nop
+	nop
+	nop
+	nop
+	nop
+
+	rsm PSW_SM_Q, %r0
+	nop
+	nop
+	nop
+	nop
+	nop
+	nop
+	nop
+
+	/*
+	 * After return-from-interrupt, we want to run without Code/Data
+	 * translation enabled just like on a normal boot.
+	 */
+
+	/* calculate new physical execution address */
+	ldo	1f-0b(%arg2), %r1
+	mtctl	%r0, %cr17 /* IIASQ */
+	mtctl	%r0, %cr17 /* IIASQ */
+	mtctl	%r1, %cr18 /* IIAOQ */
+	ldo	4(%r1),%r1
+	mtctl	%r1, %cr18 /* IIAOQ */
+#ifdef CONFIG_64BIT
+	depdi,z	1, PSW_W_BIT, 1, %r1
+	mtctl	%r1, %cr22 /* IPSW */
+#else
+	mtctl	%r0, %cr22 /* IPSW */
+#endif
+	/* lets go... */
+	rfi
+1:	nop
+	nop
+
+.Lloop:
+	LDREG,ma	REG_SZ(%arg0), %r3
+	/* If crash kernel, no copy needed */
+	cmpib,COND(=),n 0,%r3,boot
+
+	bb,<,n		%r3, 31 - IND_DONE_BIT, boot
+	bb,>=,n		%r3, 31 - IND_INDIRECTION_BIT, .Lnotind
+	/* indirection, load and restart */
+	movb		%r3, %arg0, .Lloop
+	depi		0, 31, PAGE_SHIFT, %arg0
+
+.Lnotind:
+	bb,>=,n		%r3, 31 - IND_DESTINATION_BIT, .Lnotdest
+	b		.Lloop
+	copy		%r3, %r20
+
+.Lnotdest:
+	bb,>=		%r3, 31 - IND_SOURCE_BIT, .Lloop
+	depi		0, 31, PAGE_SHIFT, %r3
+	copy		%r3, %r21
+
+	/* copy page */
+	copy		%r0, %r18
+	zdepi		1, 31 - PAGE_SHIFT, 1, %r18
+	add		%r20, %r18, %r17
+
+	depi		0, 31, PAGE_SHIFT, %r20
+.Lcopy:
+	copy		%r20, %r12
+	LDREG,ma	REG_SZ(%r21), %r8
+	LDREG,ma	REG_SZ(%r21), %r9
+	LDREG,ma	REG_SZ(%r21), %r10
+	LDREG,ma	REG_SZ(%r21), %r11
+	STREG,ma	%r8, REG_SZ(%r20)
+	STREG,ma	%r9, REG_SZ(%r20)
+	STREG,ma	%r10, REG_SZ(%r20)
+	STREG,ma	%r11, REG_SZ(%r20)
+
+#ifndef CONFIG_64BIT
+	LDREG,ma	REG_SZ(%r21), %r8
+	LDREG,ma	REG_SZ(%r21), %r9
+	LDREG,ma	REG_SZ(%r21), %r10
+	LDREG,ma	REG_SZ(%r21), %r11
+	STREG,ma	%r8, REG_SZ(%r20)
+	STREG,ma	%r9, REG_SZ(%r20)
+	STREG,ma	%r10, REG_SZ(%r20)
+	STREG,ma	%r11, REG_SZ(%r20)
+#endif
+
+	fdc		%r0(%r12)
+	cmpb,COND(<<)	%r20,%r17,.Lcopy
+	fic		(%sr4, %r12)
+	b,n		.Lloop
+
+boot:
+	mtctl	%r0, %cr15
+
+	LDREG	kexec_free_mem-0b(%arg2), %arg0
+	LDREG	kexec_cmdline-0b(%arg2), %arg1
+	LDREG	kexec_initrd_end-0b(%arg2), %arg3
+	LDREG	kexec_initrd_start-0b(%arg2), %arg2
+	bv,n %r0(%rp)
+
+ENDPROC_CFI(relocate_new_kernel);
+
+ENTRY(relocate_new_kernel_size)
+       .word relocate_new_kernel_size - relocate_new_kernel
+
+kexec_param cmdline
+kexec_param initrd_start
+kexec_param initrd_end
+kexec_param free_mem
diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
index 6d112868272d..05669c87a0af 100644
--- a/include/uapi/linux/kexec.h
+++ b/include/uapi/linux/kexec.h
@@ -31,6 +31,7 @@
 #define KEXEC_ARCH_DEFAULT ( 0 << 16)
 #define KEXEC_ARCH_386     ( 3 << 16)
 #define KEXEC_ARCH_68K     ( 4 << 16)
+#define KEXEC_ARCH_PARISC  (15 << 16)
 #define KEXEC_ARCH_X86_64  (62 << 16)
 #define KEXEC_ARCH_PPC     (20 << 16)
 #define KEXEC_ARCH_PPC64   (21 << 16)
-- 
2.23.0.rc1


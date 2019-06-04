Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39B8A34FDC
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jun 2019 20:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfFDSen (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jun 2019 14:34:43 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:52957 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfFDSen (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jun 2019 14:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=n656qGGr5o0fwMwp/EfxFwhNe2evlcskZVXzwibdJl0=; b=TMgi1YMEfUrUSt1VyTT5k3TF/1
        z//L8+cMdNuEo5tMr8NuYVFw6vUpr/mcZ0pLgSWmfPvvvbPqOQOG6ICDxYo4/9LRPDxwcH9d1LWWl
        1syE8Iu1Zki5oS1pFSVTBvXxXWJtlbdpEQtdtidPKzlxsDbAYLRZFAYDOPEXny6vm7RA=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hYEGf-0002tN-BZ; Tue, 04 Jun 2019 20:34:41 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v2 6/6] parisc: add dynamic ftrace
Date:   Tue,  4 Jun 2019 20:34:35 +0200
Message-Id: <20190604183435.20175-7-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604183435.20175-1-svens@stackframe.org>
References: <20190604183435.20175-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This patch implements dynamic ftrace for PA-RISC. The required mcount
call sequences can get pretty long, so instead of patching the
whole call sequence out of the functions, we are using
-fpatchable-function-entry from gcc. This puts a configurable amount of
NOPS before/at the start of the function. Taking do_sys_open() as example,
which would look like this when the call is patched out:

1036b248:       08 00 02 40     nop
1036b24c:       08 00 02 40     nop
1036b250:       08 00 02 40     nop
1036b254:       08 00 02 40     nop

1036b258 <do_sys_open>:
1036b258:       08 00 02 40     nop
1036b25c:       08 03 02 41     copy r3,r1
1036b260:       6b c2 3f d9     stw rp,-14(sp)
1036b264:       08 1e 02 43     copy sp,r3
1036b268:       6f c1 01 00     stw,ma r1,80(sp)

When ftrace gets enabled for this function the kernel will patch these
NOPs to:

1036b248:       10 19 57 20     <address of ftrace>
1036b24c:       6f c1 00 80     stw,ma r1,40(sp)
1036b250:       48 21 3f d1     ldw -18(r1),r1
1036b254:       e8 20 c0 02     bv,n r0(r1)

1036b258 <do_sys_open>:
1036b258:       e8 3f 1f df     b,l,n .-c,r1
1036b25c:       08 03 02 41     copy r3,r1
1036b260:       6b c2 3f d9     stw rp,-14(sp)
1036b264:       08 1e 02 43     copy sp,r3
1036b268:       6f c1 01 00     stw,ma r1,80(sp)

So the first NOP in do_sys_open() will be patched to jump backwards into
some minimal trampoline code which pushes a stackframe, saves r1 which
holds the return address, loads the address of the real ftrace function,
and branches to that location. For 64 Bit things are getting a bit more
complicated (and longer) because we must make sure that the address of
ftrace location is 8 byte aligned, and the offset passed to ldd for
fetching the address is 8 byte aligned as well.

Note that gcc has a bug which misplaces the function label, and needs a
patch to make dynamic ftrace work. See
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90751 for details.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/Kconfig               |   2 +
 arch/parisc/Makefile              |  18 +++++
 arch/parisc/include/asm/ftrace.h  |  15 +++-
 arch/parisc/kernel/Makefile       |   9 ++-
 arch/parisc/kernel/entry.S        |  64 +++++++++++++++
 arch/parisc/kernel/ftrace.c       | 129 +++++++++++++++++++++++++++---
 arch/parisc/kernel/module.c       |  20 ++++-
 arch/parisc/kernel/module.lds     |   7 ++
 arch/parisc/kernel/vmlinux.lds.S  |   2 +
 arch/parisc/mm/fixmap.c           |   4 +-
 include/asm-generic/vmlinux.lds.h |   7 ++
 11 files changed, 259 insertions(+), 18 deletions(-)
 create mode 100644 arch/parisc/kernel/module.lds

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 4860efa91d7b..42875ff15671 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -59,6 +59,8 @@ config PARISC
 	select HAVE_ARCH_KGDB
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
+	select HAVE_DYNAMIC_FTRACE if $(cc-option,-fpatchable-function-entry=1,1)
+	select HAVE_FTRACE_MCOUNT_RECORD if HAVE_DYNAMIC_FTRACE
 
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index c19af26febe6..58d46665cad9 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -47,6 +47,24 @@ ifneq ($(SUBARCH),$(UTS_MACHINE))
 	endif
 endif
 
+ifdef CONFIG_DYNAMIC_FTRACE
+ifdef CONFIG_64BIT
+NOP_COUNT := 8
+else
+NOP_COUNT := 5
+endif
+
+export CC_USING_RECORD_MCOUNT:=1
+export CC_USING_PATCHABLE_FUNCTION_ENTRY:=1
+
+KBUILD_AFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY=1
+KBUILD_CFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY=1 \
+		 -DFTRACE_PATCHABLE_FUNCTION_SIZE=$(NOP_COUNT)
+
+CC_FLAGS_FTRACE := -fpatchable-function-entry=$(NOP_COUNT),$(shell echo $$(($(NOP_COUNT)-1)))
+KBUILD_LDFLAGS_MODULE += -T $(srctree)/arch/parisc/kernel/module.lds
+endif
+
 OBJCOPY_FLAGS =-O binary -R .note -R .comment -S
 
 cflags-y	:= -pipe
diff --git a/arch/parisc/include/asm/ftrace.h b/arch/parisc/include/asm/ftrace.h
index 42b2c75a1645..958c0aa5dbb2 100644
--- a/arch/parisc/include/asm/ftrace.h
+++ b/arch/parisc/include/asm/ftrace.h
@@ -5,12 +5,23 @@
 #ifndef __ASSEMBLY__
 extern void mcount(void);
 
-#define MCOUNT_INSN_SIZE 4
-
+#define MCOUNT_ADDR		((unsigned long)mcount)
+#define MCOUNT_INSN_SIZE	4
+#define CC_USING_NOP_MCOUNT
 extern unsigned long sys_call_table[];
 
 extern unsigned long return_address(unsigned int);
 
+#ifdef CONFIG_DYNAMIC_FTRACE
+extern void ftrace_caller(void);
+
+struct dyn_arch_ftrace {
+};
+
+unsigned long ftrace_call_adjust(unsigned long addr);
+
+#endif
+
 #define ftrace_return_address(n) return_address(n)
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index fc0df5c44468..c232266b517c 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -14,10 +14,11 @@ obj-y	     	:= cache.o pacache.o setup.o pdt.o traps.o time.o irq.o \
 
 ifdef CONFIG_FUNCTION_TRACER
 # Do not profile debug and lowlevel utilities
-CFLAGS_REMOVE_ftrace.o = -pg
-CFLAGS_REMOVE_cache.o = -pg
-CFLAGS_REMOVE_perf.o = -pg
-CFLAGS_REMOVE_unwind.o = -pg
+CFLAGS_REMOVE_ftrace.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_cache.o =  $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_perf.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_unwind.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_patch.o = $(CC_FLAGS_FTRACE)
 endif
 
 obj-$(CONFIG_SMP)	+= smp.o
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index a1fc04570ade..c246cefa0737 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -2025,6 +2025,70 @@ ftrace_stub:
 #endif
 ENDPROC_CFI(mcount)
 
+#ifdef CONFIG_DYNAMIC_FTRACE
+
+#ifdef CONFIG_64BIT
+#define FTRACE_FRAME_SIZE (2*FRAME_SIZE)
+#else
+#define FTRACE_FRAME_SIZE FRAME_SIZE
+#endif
+ENTRY_CFI(ftrace_caller, caller,frame=FTRACE_FRAME_SIZE,CALLS,SAVE_RP,SAVE_SP)
+ftrace_caller:
+	.global ftrace_caller
+
+	STREG	%r3, -FTRACE_FRAME_SIZE+1*REG_SZ(%sp)
+	ldo	-FTRACE_FRAME_SIZE(%sp), %r3
+	STREG	%rp, -RP_OFFSET(%r3)
+
+	/* Offset 0 is already allocated for %r1 */
+	STREG	%r23, 2*REG_SZ(%r3)
+	STREG	%r24, 3*REG_SZ(%r3)
+	STREG	%r25, 4*REG_SZ(%r3)
+	STREG	%r26, 5*REG_SZ(%r3)
+	STREG	%r28, 6*REG_SZ(%r3)
+	STREG	%r29, 7*REG_SZ(%r3)
+#ifdef CONFIG_64BIT
+	STREG	%r19, 8*REG_SZ(%r3)
+	STREG	%r20, 9*REG_SZ(%r3)
+	STREG	%r21, 10*REG_SZ(%r3)
+	STREG	%r22, 11*REG_SZ(%r3)
+	STREG	%r27, 12*REG_SZ(%r3)
+	STREG	%r31, 13*REG_SZ(%r3)
+	loadgp
+	ldo	-16(%sp),%r29
+#endif
+	LDREG	0(%r3), %r25
+	copy	%rp, %r26
+	ldo	-8(%r25), %r25
+	b,l	ftrace_function_trampoline, %rp
+	copy	%r3, %r24
+
+	LDREG	-RP_OFFSET(%r3), %rp
+	LDREG	2*REG_SZ(%r3), %r23
+	LDREG	3*REG_SZ(%r3), %r24
+	LDREG	4*REG_SZ(%r3), %r25
+	LDREG	5*REG_SZ(%r3), %r26
+	LDREG	6*REG_SZ(%r3), %r28
+	LDREG	7*REG_SZ(%r3), %r29
+#ifdef CONFIG_64BIT
+	LDREG	8*REG_SZ(%r3), %r19
+	LDREG	9*REG_SZ(%r3), %r20
+	LDREG	10*REG_SZ(%r3), %r21
+	LDREG	11*REG_SZ(%r3), %r22
+	LDREG	12*REG_SZ(%r3), %r27
+	LDREG	13*REG_SZ(%r3), %r31
+#endif
+	LDREG	1*REG_SZ(%r3), %r3
+
+	LDREGM	-FTRACE_FRAME_SIZE(%sp), %r1
+	/* Adjust return point to jump back to beginning of traced function */
+	ldo	-4(%r1), %r1
+	bv,n	(%r1)
+
+ENDPROC_CFI(ftrace_caller)
+
+#endif
+
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	.align 8
 ENTRY_CFI(return_to_handler, caller,frame=FRAME_SIZE)
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index a28f915993b1..d784ccdd8fef 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -7,17 +7,17 @@
  * Copyright (C) 2007-2008 Steven Rostedt <srostedt@redhat.com>
  *
  * future possible enhancements:
- * 	- add CONFIG_DYNAMIC_FTRACE
  *	- add CONFIG_STACK_TRACER
  */
 
 #include <linux/init.h>
 #include <linux/ftrace.h>
+#include <linux/uaccess.h>
 
 #include <asm/assembly.h>
 #include <asm/sections.h>
 #include <asm/ftrace.h>
-
+#include <asm/patch.h>
 
 #define __hot __attribute__ ((__section__ (".text.hot")))
 
@@ -50,13 +50,11 @@ void notrace __hot ftrace_function_trampoline(unsigned long parent,
 				unsigned long self_addr,
 				unsigned long org_sp_gr3)
 {
-	extern ftrace_func_t ftrace_trace_function;  /* depends on CONFIG_DYNAMIC_FTRACE */
-
-	if (ftrace_trace_function != ftrace_stub) {
-		/* struct ftrace_ops *op, struct pt_regs *regs); */
-		ftrace_trace_function(parent, self_addr, NULL, NULL);
-		return;
-	}
+#ifndef CONFIG_DYNAMIC_FTRACE
+	extern ftrace_func_t ftrace_trace_function;
+#endif
+	if (ftrace_trace_function != ftrace_stub)
+		ftrace_trace_function(self_addr, parent, NULL, NULL);
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	if (ftrace_graph_return != (trace_func_graph_ret_t) ftrace_stub ||
@@ -75,3 +73,116 @@ void notrace __hot ftrace_function_trampoline(unsigned long parent,
 #endif
 }
 
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+int ftrace_enable_ftrace_graph_caller(void)
+{
+	return 0;
+}
+
+int ftrace_disable_ftrace_graph_caller(void)
+{
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_DYNAMIC_FTRACE
+
+int __init ftrace_dyn_arch_init(void)
+{
+	return 0;
+}
+int ftrace_update_ftrace_func(ftrace_func_t func)
+{
+	return 0;
+}
+
+unsigned long ftrace_call_adjust(unsigned long addr)
+{
+	return addr+(FTRACE_PATCHABLE_FUNCTION_SIZE-1)*4;
+}
+
+int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
+{
+	u32 insn[FTRACE_PATCHABLE_FUNCTION_SIZE];
+	u32 *tramp;
+	int size, ret, i;
+	void *ip;
+
+#ifdef CONFIG_64BIT
+	unsigned long addr2 =
+		(unsigned long)dereference_function_descriptor((void *)addr);
+
+	u32 ftrace_trampoline[] = {
+		0x73c10208, /* std,ma r1,100(sp) */
+		0x0c2110c1, /* ldd -10(r1),r1 */
+		0xe820d002, /* bve,n (r1) */
+		addr2 >> 32,
+		addr2 & 0xffffffff,
+		0xe83f1fd7, /* b,l,n .-14,r1 */
+	};
+
+	u32 ftrace_trampoline_unaligned[] = {
+		addr2 >> 32,
+		addr2 & 0xffffffff,
+		0x37de0200, /* ldo 100(sp),sp */
+		0x73c13e01, /* std r1,-100(sp) */
+		0x34213ff9, /* ldo -4(r1),r1 */
+		0x50213fc1, /* ldd -20(r1),r1 */
+		0xe820d002, /* bve,n (r1) */
+		0xe83f1fcf, /* b,l,n .-20,r1 */
+	};
+
+	BUILD_BUG_ON(ARRAY_SIZE(ftrace_trampoline_unaligned) >
+				FTRACE_PATCHABLE_FUNCTION_SIZE);
+#else
+	u32 ftrace_trampoline[] = {
+		(u32)addr,
+		0x6fc10080, /* stw,ma r1,40(sp) */
+		0x48213fd1, /* ldw -18(r1),r1 */
+		0xe820c002, /* bv,n r0(r1) */
+		0xe83f1fdf, /* b,l,n .-c,r1 */
+	};
+#endif
+
+	BUILD_BUG_ON(ARRAY_SIZE(ftrace_trampoline) >
+				FTRACE_PATCHABLE_FUNCTION_SIZE);
+
+	size = sizeof(ftrace_trampoline);
+	tramp = ftrace_trampoline;
+
+#ifdef CONFIG_64BIT
+	if (rec->ip & 0x4) {
+		size = sizeof(ftrace_trampoline_unaligned);
+		tramp = ftrace_trampoline_unaligned;
+	}
+#endif
+
+	ip = (void *)(rec->ip + 4 - size);
+
+	ret = probe_kernel_read(insn, ip, size);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < size / 4; i++) {
+		if (insn[i] != INSN_NOP)
+			return -EINVAL;
+	}
+
+	__patch_text_multiple(ip, tramp, size);
+	return 0;
+}
+
+int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
+		    unsigned long addr)
+{
+	u32 insn[FTRACE_PATCHABLE_FUNCTION_SIZE];
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(insn); i++)
+		insn[i] = INSN_NOP;
+
+	__patch_text_multiple((void *)rec->ip + 4 - sizeof(insn),
+			      insn, sizeof(insn));
+	return 0;
+}
+#endif
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index 3ff3b48df6e6..ed6640527534 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -873,6 +873,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 	const char *strtab = NULL;
 	const Elf_Shdr *s;
 	char *secstrings;
+	int err, symindex = -1;
 	Elf_Sym *newptr, *oldptr;
 	Elf_Shdr *symhdr = NULL;
 #ifdef DEBUG
@@ -899,6 +900,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 		if(sechdrs[i].sh_type == SHT_SYMTAB
 		   && (sechdrs[i].sh_flags & SHF_ALLOC)) {
 			int strindex = sechdrs[i].sh_link;
+			symindex = i;
 			/* FIXME: AWFUL HACK
 			 * The cast is to drop the const from
 			 * the sechdrs pointer */
@@ -954,8 +956,24 @@ int module_finalize(const Elf_Ehdr *hdr,
 		if (!strcmp(".altinstructions", secname))
 			/* patch .altinstructions */
 			apply_alternatives(aseg, aseg + s->sh_size, me->name);
-	}
 
+		/* For 32 bit kernels we're compiling modules with
+		 * -ffunction-sections so we must relocate the addresses in the
+		 *__mcount_loc section.
+		 */
+		if (symindex != -1 && !strcmp(secname, "__mcount_loc")) {
+			if (s->sh_type == SHT_REL)
+				err = apply_relocate((Elf_Shdr *)sechdrs,
+							strtab, symindex,
+							s - sechdrs, me);
+			else if (s->sh_type == SHT_RELA)
+				err = apply_relocate_add((Elf_Shdr *)sechdrs,
+							strtab, symindex,
+							s - sechdrs, me);
+			if (err)
+				return err;
+		}
+	}
 	return 0;
 }
 
diff --git a/arch/parisc/kernel/module.lds b/arch/parisc/kernel/module.lds
new file mode 100644
index 000000000000..1a9a92aca5c8
--- /dev/null
+++ b/arch/parisc/kernel/module.lds
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+SECTIONS {
+	__mcount_loc : {
+		*(__patchable_function_entries)
+	}
+}
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index cd33b4feacb1..99cd24f2ea01 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -18,6 +18,8 @@
 				*(.data..vm0.pgd) \
 				*(.data..vm0.pte)
 
+#define CC_USING_PATCHABLE_FUNCTION_ENTRY
+
 #include <asm-generic/vmlinux.lds.h>
 
 /* needed for the processor specific cache alignment size */	
diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
index 36321bcd75ba..474cd241c150 100644
--- a/arch/parisc/mm/fixmap.c
+++ b/arch/parisc/mm/fixmap.c
@@ -10,7 +10,7 @@
 #include <asm/cacheflush.h>
 #include <asm/fixmap.h>
 
-void set_fixmap(enum fixed_addresses idx, phys_addr_t phys)
+void notrace set_fixmap(enum fixed_addresses idx, phys_addr_t phys)
 {
 	unsigned long vaddr = __fix_to_virt(idx);
 	pgd_t *pgd = pgd_offset_k(vaddr);
@@ -28,7 +28,7 @@ void set_fixmap(enum fixed_addresses idx, phys_addr_t phys)
 	flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE);
 }
 
-void clear_fixmap(enum fixed_addresses idx)
+void notrace clear_fixmap(enum fixed_addresses idx)
 {
 	unsigned long vaddr = __fix_to_virt(idx);
 	pgd_t *pgd = pgd_offset_k(vaddr);
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 088987e9a3ea..ca42182992a5 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -110,10 +110,17 @@
 #endif
 
 #ifdef CONFIG_FTRACE_MCOUNT_RECORD
+#ifdef CC_USING_PATCHABLE_FUNCTION_ENTRY
+#define MCOUNT_REC()	. = ALIGN(8);				\
+			__start_mcount_loc = .;			\
+			KEEP(*(__patchable_function_entries))	\
+			__stop_mcount_loc = .;
+#else
 #define MCOUNT_REC()	. = ALIGN(8);				\
 			__start_mcount_loc = .;			\
 			KEEP(*(__mcount_loc))			\
 			__stop_mcount_loc = .;
+#endif
 #else
 #define MCOUNT_REC()
 #endif
-- 
2.20.1


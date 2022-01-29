Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56184A2E07
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Jan 2022 12:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbiA2LDw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 29 Jan 2022 06:03:52 -0500
Received: from mout.gmx.net ([212.227.15.19]:53663 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233907AbiA2LDv (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 29 Jan 2022 06:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1643454224;
        bh=md9JlZGOXmyPFkDrkOWstmlhvqi3Te6MTJUuAPzlsf0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=GTkCAzgEQpra0rKBGamU3/o3XndVy2QOstQf/RCbsGcnACfQMtvfAcRYFr/LZQZy5
         5m6f9Eq6O5NHoT7d+DmnNBvb+6eT7drm2F1IGbRx1M+uYMTpqBVrQtVIgTkrOGA3gN
         AL+yPy6sNK1YbJ3eM/A/8EmGL6bniO/Hu1xxLWhM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.149.251]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2aD-1mV6m82lSp-00k4K9; Sat, 29
 Jan 2022 12:03:43 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Randolph Chung <randolph@tausq.org>
Subject: [PATCH] parisc: Add initial vDSO support
Date:   Sat, 29 Jan 2022 12:03:42 +0100
Message-Id: <20220129110342.50853-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vUreE1wuP9TOnrNuCWkuNSu6En94g+i84PIP+Y9cSYYQ2ebOnLE
 wLGaHOAoh1RB/Al3APAJezJ/+PvTdRvMvCk5ECM+5EWaENXqEplqKXrhUae44x/F3YxF2VY
 CRYk0os9YfKVQjJXVOrZgqbSubqBFV/QbZWw1n2ag5Kb6H0ityrep/EadtydTWNefmR7al+
 Rs7dXDvd99Zrf3RmwxvTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o45MuHT7Nns=:bru0i12ZFpI+it1R6DQY7f
 ClUNrNXq+EvKLMSmWOaAX30PKdox8DDE7q2cUubZIa0kDIHEWPzI6D/buIhXc6oD6ZhzCdhrz
 +5m2NgWY1d/QQhacL9jWz1gIYMuqvPDYFfCg4sUspPM0rmISb/Llw3uEDEnDg5CM/TfoRp6d7
 mSJEtHUDML9G47ra5wXtJC86dLg4dsBMhQWclVJOGj43Ynv2UUGGYgCes0teqpTK4Jg83jaGG
 EXLqhqinFbr48BlBS9RLtEoqLa88cN5PDVOrUp+4CjL67nC1TRaZ8LmsypAYLrt6NN+G3ecMH
 A6uc0oAVwQwt5U19Z+0h23KlkTo6G/DMQVb/zPDGdzpHLNl/1I78H8uOBBwnlK1hNfObs26Ma
 /WDaibcuYHP6ahlViC+szHav+vKU+75xdaWr5ryA1dfsBJq+ACaxmO8hO7Xtb9e2q5ITuioYB
 LDz+W7q5KLRpoVWB68KiB8wwbDa3y7RN0+X60VKbMWQDNhGw5SjSHIbOTSx/FqjLhiKJhUyCG
 wKA4EUgHtEF15xYMp4fO+Adziz64ZL+A0OnueX+p3MQmEQY3x6jG66Ik+cWPoEgKj8KeVFp1m
 2kqrsmRR4v7vFu6aIgwkgqVbqI6/K7+AKL1j7lQ1KNjRw0VPQ3xn+DytOsrt0Wb6RxLIBIEcI
 YQovmKPCk0momFUABFK2EEbGQr4AxDoy+kx0wLVhFKIn9550gC/noiuzqNT99VuCP08iBUx69
 7GoWdw1lr1e7bQ9kLlAfv/di1QmgBUagSgUcovLNPRaOVGeWxaJzRBqUoBtdx0xpMQMkHoQ2K
 h+1pAeXZhlAchxOjorcpVQLGlsqcw3DZxmbVi4HKg59ylP1eOOkIQ0FnODVRCncJNuThWgiAd
 Y76flbUDhIEUad1+9erc2FqTfa6/1zFRNAho0QXpEbgo0xVEWKhZzjjjaFlvwG6Azd6U9Mh3l
 v/PSvmM4NtQJLEKt5M+1TdbTVhMkWdclLf3EgM/aZGONaz7JTjWGpr+r/ttVDB8OG3yjbRKug
 alcqxky2DRRimVpzFAjSMtnGh7B/WCWD0/ZGii+jmMrEwejEC609aEx/8/4U47xokbaS46qdd
 PAz6QnApS3DbKY=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add minimal vDSO support, which provides the signal trampoline helpers, bu=
t
none of the userspace syscall helpers like time functions.

The big benefit of this vDSO implementation is, that we now don't need an
executeable stack any longer. PA-RISC is one of the last architectures whe=
re an
executeable stack was needed in oder to implement the signal trampolines b=
y putting
assembly instructions on the stack which then gets executed. With this imp=
lementation
the kernel will utilize the assembler statements in the vDSO page which is=
 mapped
into each userspace application instead and just put the pointers to the s=
ignal
information on the stack.
By dropping the need for executable stacks we now avoid running into issue=
s
with various applications in Debian which nowadays want non-executable sta=
cks
for security reasons. Additionally, alternative stacks are supported bette=
r as
well.

This code is based on an initial implementation by Randolph Chung from 200=
6:
https://lore.kernel.org/linux-parisc/4544A34A.6080700@tausq.org/

I did the porting and lifted the code to current code base. Dave fixed the
unwind code so that gdb and glibc are able to backtrace through the code. =
An
additional patch to gdb will be pushed upstream by Dave.

Signed-off-by: Helge Deller <deller@gmx.de>
Dave Anglin <dave.anglin@bell.net>
Cc: Randolph Chung <randolph@tausq.org>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Kconfig                           |   1 +
 arch/parisc/Makefile                          |  32 +++
 arch/parisc/include/asm/elf.h                 |  15 ++
 arch/parisc/include/asm/mmu.h                 |   6 +-
 arch/parisc/include/asm/mmu_context.h         |  16 +-
 arch/parisc/include/asm/page.h                |   2 +
 arch/parisc/include/asm/pgtable.h             |   7 +-
 arch/parisc/include/asm/processor.h           |   2 +-
 arch/parisc/include/asm/rt_sigframe.h         |  10 +-
 arch/parisc/include/asm/tlbflush.h            |   2 +-
 arch/parisc/include/asm/unistd.h              |   4 -
 arch/parisc/include/asm/vdso.h                |  24 ++
 arch/parisc/include/uapi/asm/auxvec.h         |   8 +
 arch/parisc/kernel/Makefile                   |   9 +-
 arch/parisc/kernel/asm-offsets.c              |   9 +
 arch/parisc/kernel/cache.c                    |  10 +-
 arch/parisc/kernel/signal.c                   | 227 +++++++++---------
 arch/parisc/kernel/signal32.h                 |  19 +-
 arch/parisc/kernel/vdso.c                     | 125 ++++++++++
 arch/parisc/kernel/vdso32/Makefile            |  53 ++++
 arch/parisc/kernel/vdso32/gen_vdso_offsets.sh |  15 ++
 arch/parisc/kernel/vdso32/note.S              |  26 ++
 arch/parisc/kernel/vdso32/restart_syscall.S   |  32 +++
 arch/parisc/kernel/vdso32/sigtramp.S          | 195 +++++++++++++++
 arch/parisc/kernel/vdso32/vdso32.lds.S        | 111 +++++++++
 arch/parisc/kernel/vdso32/vdso32_wrapper.S    |  14 ++
 arch/parisc/kernel/vdso64/Makefile            |  48 ++++
 arch/parisc/kernel/vdso64/gen_vdso_offsets.sh |  15 ++
 arch/parisc/kernel/vdso64/note.S              |   2 +
 arch/parisc/kernel/vdso64/restart_syscall.S   |   3 +
 arch/parisc/kernel/vdso64/sigtramp.S          | 166 +++++++++++++
 arch/parisc/kernel/vdso64/vdso64.lds.S        | 109 +++++++++
 arch/parisc/kernel/vdso64/vdso64_wrapper.S    |  14 ++
 33 files changed, 1166 insertions(+), 165 deletions(-)
 create mode 100644 arch/parisc/include/asm/vdso.h
 create mode 100644 arch/parisc/include/uapi/asm/auxvec.h
 create mode 100644 arch/parisc/kernel/vdso.c
 create mode 100644 arch/parisc/kernel/vdso32/Makefile
 create mode 100755 arch/parisc/kernel/vdso32/gen_vdso_offsets.sh
 create mode 100644 arch/parisc/kernel/vdso32/note.S
 create mode 100644 arch/parisc/kernel/vdso32/restart_syscall.S
 create mode 100644 arch/parisc/kernel/vdso32/sigtramp.S
 create mode 100644 arch/parisc/kernel/vdso32/vdso32.lds.S
 create mode 100644 arch/parisc/kernel/vdso32/vdso32_wrapper.S
 create mode 100644 arch/parisc/kernel/vdso64/Makefile
 create mode 100755 arch/parisc/kernel/vdso64/gen_vdso_offsets.sh
 create mode 100644 arch/parisc/kernel/vdso64/note.S
 create mode 100644 arch/parisc/kernel/vdso64/restart_syscall.S
 create mode 100644 arch/parisc/kernel/vdso64/sigtramp.S
 create mode 100644 arch/parisc/kernel/vdso64/vdso64.lds.S
 create mode 100644 arch/parisc/kernel/vdso64/vdso64_wrapper.S

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 43c1c880def6..f65268fd28ca 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -10,6 +10,7 @@ config PARISC
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_HUGETLBFS if PA20
 	select ARCH_SUPPORTS_MEMORY_FAILURE
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 82d77f4b0d08..3a35b5254d51 100644
=2D-- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -44,6 +44,16 @@ endif

 export LD_BFD

+# Set default 32 bits cross compilers for vdso
+CC_ARCHES_32 =3D hppa hppa2.0 hppa1.1
+CC_SUFFIXES  =3D linux linux-gnu unknown-linux-gnu
+CROSS32_COMPILE :=3D $(call cc-cross-prefix, \
+	$(foreach a,$(CC_ARCHES_32), \
+	$(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
+CROSS32CC :=3D $(CROSS32_COMPILE)gcc
+export CROSS32CC
+
+# Set default cross compiler for kernel build
 ifdef cross_compiling
 	ifeq ($(CROSS_COMPILE),)
 		CC_SUFFIXES =3D linux linux-gnu unknown-linux-gnu
@@ -163,6 +173,28 @@ vmlinuz: vmlinux
 	@$(KGZIP) -cf -9 $< > $@
 endif

+ifeq ($(KBUILD_EXTMOD),)
+# We need to generate vdso-offsets.h before compiling certain files in ke=
rnel/.
+# In order to do that, we should use the archprepare target, but we can't=
 since
+# asm-offsets.h is included in some files used to generate vdso-offsets.h=
, and
+# asm-offsets.h is built in prepare0, for which archprepare is a dependen=
cy.
+# Therefore we need to generate the header after prepare0 has been made, =
hence
+# this hack.
+prepare: vdso_prepare
+vdso_prepare: prepare0
+	$(if $(CONFIG_64BIT),$(Q)$(MAKE) \
+		$(build)=3Darch/parisc/kernel/vdso64 include/generated/vdso64-offsets.h=
)
+	$(Q)$(MAKE) $(build)=3Darch/parisc/kernel/vdso32 include/generated/vdso3=
2-offsets.h
+endif
+
+
+
+PHONY +=3D vdso_install
+
+vdso_install:
+	$(Q)$(MAKE) $(build)=3Darch/parisc/kernel/vdso $@
+	$(if $(CONFIG_COMPAT_VDSO), \
+		$(Q)$(MAKE) $(build)=3Darch/parisc/kernel/vdso32 $@)
 install:
 	$(CONFIG_SHELL) $(srctree)/arch/parisc/install.sh \
 			$(KERNELRELEASE) vmlinux System.map "$(INSTALL_PATH)"
diff --git a/arch/parisc/include/asm/elf.h b/arch/parisc/include/asm/elf.h
index 3bd465a27791..cc426d365892 100644
=2D-- a/arch/parisc/include/asm/elf.h
+++ b/arch/parisc/include/asm/elf.h
@@ -359,4 +359,19 @@ struct mm_struct;
 extern unsigned long arch_randomize_brk(struct mm_struct *);
 #define arch_randomize_brk arch_randomize_brk

+
+#define ARCH_HAS_SETUP_ADDITIONAL_PAGES 1
+struct linux_binprm;
+extern int arch_setup_additional_pages(struct linux_binprm *bprm,
+					int executable_stack);
+#define VDSO_AUX_ENT(a, b) NEW_AUX_ENT(a, b)
+#define VDSO_CURRENT_BASE current->mm->context.vdso_base
+
+#define ARCH_DLINFO						\
+do {								\
+	if (VDSO_CURRENT_BASE) {				\
+		NEW_AUX_ENT(AT_SYSINFO_EHDR, VDSO_CURRENT_BASE);\
+	}							\
+} while (0)
+
 #endif
diff --git a/arch/parisc/include/asm/mmu.h b/arch/parisc/include/asm/mmu.h
index 3fb70a601d5c..44fd062b62ed 100644
=2D-- a/arch/parisc/include/asm/mmu.h
+++ b/arch/parisc/include/asm/mmu.h
@@ -2,7 +2,9 @@
 #ifndef _PARISC_MMU_H_
 #define _PARISC_MMU_H_

-/* On parisc, we store the space id here */
-typedef unsigned long mm_context_t;
+typedef struct {
+	unsigned long space_id;
+	unsigned long vdso_base;
+} mm_context_t;

 #endif /* _PARISC_MMU_H_ */
diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/include/a=
sm/mmu_context.h
index 726257648d9f..e788e995bd7a 100644
=2D-- a/arch/parisc/include/asm/mmu_context.h
+++ b/arch/parisc/include/asm/mmu_context.h
@@ -20,7 +20,7 @@ init_new_context(struct task_struct *tsk, struct mm_stru=
ct *mm)
 {
 	BUG_ON(atomic_read(&mm->mm_users) !=3D 1);

-	mm->context =3D alloc_sid();
+	mm->context.space_id =3D alloc_sid();
 	return 0;
 }

@@ -28,22 +28,22 @@ init_new_context(struct task_struct *tsk, struct mm_st=
ruct *mm)
 static inline void
 destroy_context(struct mm_struct *mm)
 {
-	free_sid(mm->context);
-	mm->context =3D 0;
+	free_sid(mm->context.space_id);
+	mm->context.space_id =3D 0;
 }

 static inline unsigned long __space_to_prot(mm_context_t context)
 {
 #if SPACEID_SHIFT =3D=3D 0
-	return context << 1;
+	return context.space_id << 1;
 #else
-	return context >> (SPACEID_SHIFT - 1);
+	return context.space_id >> (SPACEID_SHIFT - 1);
 #endif
 }

 static inline void load_context(mm_context_t context)
 {
-	mtsp(context, 3);
+	mtsp(context.space_id, 3);
 	mtctl(__space_to_prot(context), 8);
 }

@@ -89,8 +89,8 @@ static inline void activate_mm(struct mm_struct *prev, s=
truct mm_struct *next)

 	BUG_ON(next =3D=3D &init_mm); /* Should never happen */

-	if (next->context =3D=3D 0)
-	    next->context =3D alloc_sid();
+	if (next->context.space_id =3D=3D 0)
+		next->context.space_id =3D alloc_sid();

 	switch_mm(prev,next,current);
 }
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page=
.h
index 0561568f7b48..62344df450ff 100644
=2D-- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -179,6 +179,8 @@ extern int npmem_ranges;

 #define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
 #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
+#define virt_to_pfn(kaddr)	(phys_to_pfn(__pa(kaddr)))
+#define phys_to_pfn(paddr)	((paddr) >> PAGE_SHIFT)

 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/p=
gtable.h
index 3e7cf882639f..f0393f00c2ff 100644
=2D-- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -70,7 +70,7 @@ static inline void purge_tlb_entries(struct mm_struct *m=
m, unsigned long addr)
 	unsigned long flags;

 	purge_tlb_start(flags);
-	mtsp(mm->context, 1);
+	mtsp(mm->context.space_id, 1);
 	pdtlb(addr);
 	pitlb(addr);
 	purge_tlb_end(flags);
@@ -219,9 +219,10 @@ extern void __update_cache(pte_t pte);
 #define _PAGE_PRESENT  (1 << xlate_pabit(_PAGE_PRESENT_BIT))
 #define _PAGE_HUGE     (1 << xlate_pabit(_PAGE_HPAGE_BIT))
 #define _PAGE_USER     (1 << xlate_pabit(_PAGE_USER_BIT))
+#define _PAGE_SPECIAL  (_PAGE_DMB)

 #define _PAGE_TABLE	(_PAGE_PRESENT | _PAGE_READ | _PAGE_WRITE | _PAGE_DIR=
TY | _PAGE_ACCESSED)
-#define _PAGE_CHG_MASK	(PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY)
+#define _PAGE_CHG_MASK	(PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_=
SPECIAL)
 #define _PAGE_KERNEL_RO	(_PAGE_PRESENT | _PAGE_READ | _PAGE_DIRTY | _PAGE=
_ACCESSED)
 #define _PAGE_KERNEL_EXEC	(_PAGE_KERNEL_RO | _PAGE_EXEC)
 #define _PAGE_KERNEL_RWX	(_PAGE_KERNEL_EXEC | _PAGE_WRITE)
@@ -348,6 +349,7 @@ static inline void pud_clear(pud_t *pud) {
 static inline int pte_dirty(pte_t pte)		{ return pte_val(pte) & _PAGE_DIR=
TY; }
 static inline int pte_young(pte_t pte)		{ return pte_val(pte) & _PAGE_ACC=
ESSED; }
 static inline int pte_write(pte_t pte)		{ return pte_val(pte) & _PAGE_WRI=
TE; }
+static inline int pte_special(pte_t pte)	{ return pte_val(pte) & _PAGE_SP=
ECIAL; }

 static inline pte_t pte_mkclean(pte_t pte)	{ pte_val(pte) &=3D ~_PAGE_DIR=
TY; return pte; }
 static inline pte_t pte_mkold(pte_t pte)	{ pte_val(pte) &=3D ~_PAGE_ACCES=
SED; return pte; }
@@ -355,6 +357,7 @@ static inline pte_t pte_wrprotect(pte_t pte)	{ pte_val=
(pte) &=3D ~_PAGE_WRITE; ret
 static inline pte_t pte_mkdirty(pte_t pte)	{ pte_val(pte) |=3D _PAGE_DIRT=
Y; return pte; }
 static inline pte_t pte_mkyoung(pte_t pte)	{ pte_val(pte) |=3D _PAGE_ACCE=
SSED; return pte; }
 static inline pte_t pte_mkwrite(pte_t pte)	{ pte_val(pte) |=3D _PAGE_WRIT=
E; return pte; }
+static inline pte_t pte_mkspecial(pte_t pte)	{ pte_val(pte) |=3D _PAGE_SP=
ECIAL; return pte; }

 /*
  * Huge pte definitions.
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm=
/processor.h
index 3a3d05438408..006364212795 100644
=2D-- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -236,7 +236,7 @@ on downward growing arches, it looks like this:

 #define start_thread(regs, new_pc, new_sp) do {		\
 	elf_addr_t *sp =3D (elf_addr_t *)new_sp;		\
-	__u32 spaceid =3D (__u32)current->mm->context;	\
+	__u32 spaceid =3D (__u32)current->mm->context.space_id;	\
 	elf_addr_t pc =3D (elf_addr_t)new_pc | 3;		\
 	elf_caddr_t *argv =3D (elf_caddr_t *)bprm->exec + 1;	\
 							\
diff --git a/arch/parisc/include/asm/rt_sigframe.h b/arch/parisc/include/a=
sm/rt_sigframe.h
index 2b3010ade00e..bb7fb4153327 100644
=2D-- a/arch/parisc/include/asm/rt_sigframe.h
+++ b/arch/parisc/include/asm/rt_sigframe.h
@@ -2,16 +2,8 @@
 #ifndef _ASM_PARISC_RT_SIGFRAME_H
 #define _ASM_PARISC_RT_SIGFRAME_H

-#define SIGRETURN_TRAMP 4
-#define SIGRESTARTBLOCK_TRAMP 5
-#define TRAMP_SIZE (SIGRETURN_TRAMP + SIGRESTARTBLOCK_TRAMP)
-
 struct rt_sigframe {
-	/* XXX: Must match trampoline size in arch/parisc/kernel/signal.c
-	        Secondary to that it must protect the ERESTART_RESTARTBLOCK
-		trampoline we left on the stack (we were bad and didn't
-		change sp so we could run really fast.) */
-	unsigned int tramp[TRAMP_SIZE];
+	unsigned int tramp[2]; /* holds original return address */
 	struct siginfo info;
 	struct ucontext uc;
 };
diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/=
tlbflush.h
index c5ded01d45be..5ffd7c17f593 100644
=2D-- a/arch/parisc/include/asm/tlbflush.h
+++ b/arch/parisc/include/asm/tlbflush.h
@@ -17,7 +17,7 @@ int __flush_tlb_range(unsigned long sid,
 	unsigned long start, unsigned long end);

 #define flush_tlb_range(vma, start, end) \
-	__flush_tlb_range((vma)->vm_mm->context, start, end)
+	__flush_tlb_range((vma)->vm_mm->context.space_id, start, end)

 #define flush_tlb_kernel_range(start, end) \
 	__flush_tlb_range(0, start, end)
diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/un=
istd.h
index cd438e4150f6..7708a5806f09 100644
=2D-- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -63,10 +63,6 @@
 		);							\
 		__sys_res =3D (long)__res;				\
 	}								\
-	if ( (unsigned long)__sys_res >=3D (unsigned long)-4095 ){	\
-		errno =3D -__sys_res;		        		\
-		__sys_res =3D -1;						\
-	}								\
 	__sys_res;							\
 })

diff --git a/arch/parisc/include/asm/vdso.h b/arch/parisc/include/asm/vdso=
.h
new file mode 100644
index 000000000000..ef8206193f82
=2D-- /dev/null
+++ b/arch/parisc/include/asm/vdso.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PARISC_VDSO_H__
+#define __PARISC_VDSO_H__
+
+#ifndef __ASSEMBLY__
+
+#ifdef CONFIG_64BIT
+#include <generated/vdso64-offsets.h>
+#endif
+#include <generated/vdso32-offsets.h>
+
+#define VDSO64_SYMBOL(tsk, name) ((tsk)->mm->context.vdso_base + (vdso64_=
offset_##name))
+#define VDSO32_SYMBOL(tsk, name) ((tsk)->mm->context.vdso_base + (vdso32_=
offset_##name))
+
+extern struct vdso_data *vdso_data;
+
+#endif /* __ASSEMBLY __ */
+
+/* Default link addresses for the vDSOs */
+#define VDSO_LBASE	0
+
+#define VDSO_VERSION_STRING	LINUX_5.18
+
+#endif /* __PARISC_VDSO_H__ */
diff --git a/arch/parisc/include/uapi/asm/auxvec.h b/arch/parisc/include/u=
api/asm/auxvec.h
new file mode 100644
index 000000000000..90d2aa699cf3
=2D-- /dev/null
+++ b/arch/parisc/include/uapi/asm/auxvec.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_PARISC_AUXVEC_H
+#define _UAPI_PARISC_AUXVEC_H
+
+/* The vDSO location. */
+#define AT_SYSINFO_EHDR		33
+
+#endif /* _UAPI_PARISC_AUXVEC_H */
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 8fb819bbbb17..3ae9c8d28997 100644
=2D-- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -10,7 +10,7 @@ obj-y	     	:=3D cache.o pacache.o setup.o pdt.o traps.o=
 time.o irq.o \
 		   ptrace.o hardware.o inventory.o drivers.o alternative.o \
 		   signal.o hpmc.o real2.o parisc_ksyms.o unaligned.o \
 		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o \
-		   patch.o toc.o toc_asm.o
+		   patch.o toc.o toc_asm.o vdso.o

 ifdef CONFIG_FUNCTION_TRACER
 # Do not profile debug and lowlevel utilities
@@ -30,7 +30,7 @@ obj-$(CONFIG_STACKTRACE)+=3D stacktrace.o
 obj-$(CONFIG_AUDIT)	+=3D audit.o
 obj64-$(CONFIG_AUDIT)	+=3D compat_audit.o
 # only supported for PCX-W/U in 64-bit mode at the moment
-obj-$(CONFIG_64BIT)	+=3D perf.o perf_asm.o $(obj64-y)
+obj-$(CONFIG_64BIT)	+=3D perf.o perf_asm.o $(obj64-y) vdso64/
 obj-$(CONFIG_PARISC_CPU_TOPOLOGY)	+=3D topology.o
 obj-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+=3D ftrace.o
@@ -39,3 +39,8 @@ obj-$(CONFIG_KGDB)			+=3D kgdb.o
 obj-$(CONFIG_KPROBES)			+=3D kprobes.o
 obj-$(CONFIG_KEXEC_CORE)		+=3D kexec.o relocate_kernel.o
 obj-$(CONFIG_KEXEC_FILE)		+=3D kexec_file.o
+obj-$(CONFIG_TOC)			+=3D toc.o toc_asm.o
+
+# vdso
+obj-$(CONFIG_64BIT)	+=3D vdso64/
+obj-y			+=3D vdso32/
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-off=
sets.c
index 2a83ef36d216..2673d57eeb00 100644
=2D-- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -26,7 +26,11 @@
 #include <asm/ptrace.h>
 #include <asm/processor.h>
 #include <asm/pdc.h>
+#include <uapi/asm/sigcontext.h>
+#include <asm/ucontext.h>
+#include <asm/rt_sigframe.h>
 #include <linux/uaccess.h>
+#include "signal32.h"

 /* Add FRAME_SIZE to the size x and align it to y. All definitions
  * that use align_frame will include space for a frame.
@@ -218,6 +222,11 @@ int main(void)
 	DEFINE(TI_FLAGS, offsetof(struct thread_info, flags));
 	DEFINE(TI_PRE_COUNT, offsetof(struct task_struct, thread_info.preempt_co=
unt));
 	BLANK();
+	DEFINE(ASM_SIGFRAME_SIZE, PARISC_RT_SIGFRAME_SIZE);
+	DEFINE(SIGFRAME_CONTEXT_REGS, offsetof(struct rt_sigframe, uc.uc_mcontex=
t) - PARISC_RT_SIGFRAME_SIZE);
+	DEFINE(ASM_SIGFRAME_SIZE32, PARISC_RT_SIGFRAME_SIZE32);
+	DEFINE(SIGFRAME_CONTEXT_REGS32, offsetof(struct compat_rt_sigframe, uc.u=
c_mcontext) - PARISC_RT_SIGFRAME_SIZE32);
+	BLANK();
 	DEFINE(ICACHE_BASE, offsetof(struct pdc_cache_info, ic_base));
 	DEFINE(ICACHE_STRIDE, offsetof(struct pdc_cache_info, ic_stride));
 	DEFINE(ICACHE_COUNT, offsetof(struct pdc_cache_info, ic_count));
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 94150b91c96f..a08f8499b720 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -575,14 +575,14 @@ void flush_cache_mm(struct mm_struct *mm)
 	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    mm_total_size(mm) >=3D parisc_cache_flush_threshold) {
-		if (mm->context)
+		if (mm->context.space_id)
 			flush_tlb_all();
 		flush_cache_all();
 		return;
 	}

 	preempt_disable();
-	if (mm->context =3D=3D mfsp(3)) {
+	if (mm->context.space_id =3D=3D mfsp(3)) {
 		for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
 			flush_user_cache_tlb(vma, vma->vm_start, vma->vm_end);
 		preempt_enable();
@@ -599,14 +599,14 @@ void flush_cache_range(struct vm_area_struct *vma,
 {
 	if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
 	    end - start >=3D parisc_cache_flush_threshold) {
-		if (vma->vm_mm->context)
+		if (vma->vm_mm->context.space_id)
 			flush_tlb_range(vma, start, end);
 		flush_cache_all();
 		return;
 	}

 	preempt_disable();
-	if (vma->vm_mm->context =3D=3D mfsp(3)) {
+	if (vma->vm_mm->context.space_id =3D=3D mfsp(3)) {
 		flush_user_cache_tlb(vma, start, end);
 		preempt_enable();
 		return;
@@ -620,7 +620,7 @@ void
 flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsign=
ed long pfn)
 {
 	if (pfn_valid(pfn)) {
-		if (likely(vma->vm_mm->context)) {
+		if (likely(vma->vm_mm->context.space_id)) {
 			flush_tlb_page(vma, vmaddr);
 			__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
 		} else {
diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 46b1050640b8..e982afe79865 100644
=2D-- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -1,16 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- *  linux/arch/parisc/kernel/signal.c: Architecture-specific signal
- *  handling support.
+ *  PA-RISC architecture-specific signal handling support.
  *
  *  Copyright (C) 2000 David Huggins-Daines <dhd@debian.org>
  *  Copyright (C) 2000 Linuxcare, Inc.
+ *  Copyright (C) 2000-2022 Helge Deller <deller@gmx.de>
+ *  Copyright (C) 2022 John David Anglin <dave.anglin@bell.net>
  *
  *  Based on the ia64, i386, and alpha versions.
- *
- *  Like the IA-64, we are a recent enough port (we are *starting*
- *  with glibc2.2) that we do not need to support the old non-realtime
- *  Linux signals.  Therefore we don't.
  */

 #include <linux/sched.h>
@@ -32,6 +29,7 @@
 #include <linux/uaccess.h>
 #include <asm/cacheflush.h>
 #include <asm/asm-offsets.h>
+#include <asm/vdso.h>

 #ifdef CONFIG_COMPAT
 #include "signal32.h"
@@ -59,14 +57,6 @@
  * Do a signal return - restore sigcontext.
  */

-/* Trampoline for calling rt_sigreturn() */
-#define INSN_LDI_R25_0	 0x34190000 /* ldi  0,%r25 (in_syscall=3D0) */
-#define INSN_LDI_R25_1	 0x34190002 /* ldi  1,%r25 (in_syscall=3D1) */
-#define INSN_LDI_R20	 0x3414015a /* ldi  __NR_rt_sigreturn,%r20 */
-#define INSN_BLE_SR2_R0  0xe4008200 /* be,l 0x100(%sr2,%r0),%sr0,%r31 */
-/* For debugging */
-#define INSN_DIE_HORRIBLY 0x68000ccc /* stw %r0,0x666(%sr0,%r0) */
-
 static long
 restore_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs)
 {
@@ -77,9 +67,9 @@ restore_sigcontext(struct sigcontext __user *sc, struct =
pt_regs *regs)
 	err |=3D __copy_from_user(regs->iaoq, sc->sc_iaoq, sizeof(regs->iaoq));
 	err |=3D __copy_from_user(regs->iasq, sc->sc_iasq, sizeof(regs->iasq));
 	err |=3D __get_user(regs->sar, &sc->sc_sar);
-	DBG(2,"restore_sigcontext: iaoq is %#lx / %#lx\n",
-			regs->iaoq[0],regs->iaoq[1]);
-	DBG(2,"restore_sigcontext: r28 is %ld\n", regs->gr[28]);
+	DBG(2, "%s: iaoq is %#lx / %#lx\n",
+			__func__, regs->iaoq[0], regs->iaoq[1]);
+	DBG(2, "%s: r28 is %ld\n", __func__, regs->gr[28]);
 	return err;
 }

@@ -102,7 +92,7 @@ sys_rt_sigreturn(struct pt_regs *regs, int in_syscall)
 	/* Unwind the user stack to get the rt_sigframe structure. */
 	frame =3D (struct rt_sigframe __user *)
 		(usp - sigframe_size);
-	DBG(2,"sys_rt_sigreturn: frame is %p\n", frame);
+	DBG(2, "%s: frame is %p pid %d\n", __func__, frame, task_pid_nr(current)=
);

 	regs->orig_r28 =3D 1; /* no restarts for sigreturn */

@@ -110,7 +100,6 @@ sys_rt_sigreturn(struct pt_regs *regs, int in_syscall)
 	compat_frame =3D (struct compat_rt_sigframe __user *)frame;

 	if (is_compat_task()) {
-		DBG(2,"sys_rt_sigreturn: ELF32 process.\n");
 		if (get_compat_sigset(&set, &compat_frame->uc.uc_sigmask))
 			goto give_sigsegv;
 	} else
@@ -125,25 +114,25 @@ sys_rt_sigreturn(struct pt_regs *regs, int in_syscal=
l)
 	/* Good thing we saved the old gr[30], eh? */
 #ifdef CONFIG_64BIT
 	if (is_compat_task()) {
-		DBG(1,"sys_rt_sigreturn: compat_frame->uc.uc_mcontext 0x%p\n",
-				&compat_frame->uc.uc_mcontext);
+		DBG(1, "%s: compat_frame->uc.uc_mcontext 0x%p\n",
+				__func__, &compat_frame->uc.uc_mcontext);
 // FIXME: Load upper half from register file
 		if (restore_sigcontext32(&compat_frame->uc.uc_mcontext,
 					&compat_frame->regs, regs))
 			goto give_sigsegv;
-		DBG(1,"sys_rt_sigreturn: usp %#08lx stack 0x%p\n",
-				usp, &compat_frame->uc.uc_stack);
+		DBG(1, "%s: usp %#08lx stack 0x%p\n",
+				__func__, usp, &compat_frame->uc.uc_stack);
 		if (compat_restore_altstack(&compat_frame->uc.uc_stack))
 			goto give_sigsegv;
 	} else
 #endif
 	{
-		DBG(1,"sys_rt_sigreturn: frame->uc.uc_mcontext 0x%p\n",
-				&frame->uc.uc_mcontext);
+		DBG(1, "%s: frame->uc.uc_mcontext 0x%p\n",
+				__func__, &frame->uc.uc_mcontext);
 		if (restore_sigcontext(&frame->uc.uc_mcontext, regs))
 			goto give_sigsegv;
-		DBG(1,"sys_rt_sigreturn: usp %#08lx stack 0x%p\n",
-				usp, &frame->uc.uc_stack);
+		DBG(1, "%s: usp %#08lx stack 0x%p\n",
+				__func__, usp, &frame->uc.uc_stack);
 		if (restore_altstack(&frame->uc.uc_stack))
 			goto give_sigsegv;
 	}
@@ -155,14 +144,11 @@ sys_rt_sigreturn(struct pt_regs *regs, int in_syscal=
l)
 	 */
 	if (in_syscall)
 		regs->gr[31] =3D regs->iaoq[0];
-#if DEBUG_SIG
-	DBG(1,"sys_rt_sigreturn: returning to %#lx, DUMPING REGS:\n", regs->iaoq=
[0]);
-	show_regs(regs);
-#endif
+
 	return;

 give_sigsegv:
-	DBG(1,"sys_rt_sigreturn: Sending SIGSEGV\n");
+	DBG(1, "%s: Sending SIGSEGV\n", __func__);
 	force_sig(SIGSEGV);
 	return;
 }
@@ -177,15 +163,15 @@ get_sigframe(struct k_sigaction *ka, unsigned long s=
p, size_t frame_size)
 	/*FIXME: ELF32 vs. ELF64 has different frame_size, but since we
 	  don't use the parameter it doesn't matter */

-	DBG(1,"get_sigframe: ka =3D %#lx, sp =3D %#lx, frame_size =3D %#lx\n",
-			(unsigned long)ka, sp, frame_size);
+	DBG(1, "%s: ka =3D %#lx, sp =3D %#lx, frame_size =3D %zu\n",
+			__func__, (unsigned long)ka, sp, frame_size);

 	/* Align alternate stack and reserve 64 bytes for the signal
 	   handler's frame marker.  */
 	if ((ka->sa.sa_flags & SA_ONSTACK) !=3D 0 && ! sas_ss_flags(sp))
 		sp =3D (current->sas_ss_sp + 0x7f) & ~0x3f; /* Stacks grow up! */

-	DBG(1,"get_sigframe: Returning sp =3D %#lx\n", (unsigned long)sp);
+	DBG(1, "%s: Returning sp =3D %#lx\n", __func__, (unsigned long)sp);
 	return (void __user *) sp; /* Stacks grow up.  Fun. */
 }

@@ -205,20 +191,20 @@ setup_sigcontext(struct sigcontext __user *sc, struc=
t pt_regs *regs, int in_sysc
 		err |=3D __put_user(regs->gr[31]+4, &sc->sc_iaoq[1]);
 		err |=3D __put_user(regs->sr[3], &sc->sc_iasq[0]);
 		err |=3D __put_user(regs->sr[3], &sc->sc_iasq[1]);
-		DBG(1,"setup_sigcontext: iaoq %#lx / %#lx (in syscall)\n",
-			regs->gr[31], regs->gr[31]+4);
+		DBG(1, "%s: iaoq %#lx / %#lx (in syscall)\n",
+			__func__, regs->gr[31], regs->gr[31]+4);
 	} else {
 		err |=3D __copy_to_user(sc->sc_iaoq, regs->iaoq, sizeof(regs->iaoq));
 		err |=3D __copy_to_user(sc->sc_iasq, regs->iasq, sizeof(regs->iasq));
-		DBG(1,"setup_sigcontext: iaoq %#lx / %#lx (not in syscall)\n",
-			regs->iaoq[0], regs->iaoq[1]);
+		DBG(1, "%s: iaoq %#lx / %#lx (not in syscall)\n",
+			__func__, regs->iaoq[0], regs->iaoq[1]);
 	}

 	err |=3D __put_user(flags, &sc->sc_flags);
 	err |=3D __copy_to_user(sc->sc_gr, regs->gr, sizeof(regs->gr));
 	err |=3D __copy_to_user(sc->sc_fr, regs->fr, sizeof(regs->fr));
 	err |=3D __put_user(regs->sar, &sc->sc_sar);
-	DBG(1,"setup_sigcontext: r28 is %ld\n", regs->gr[28]);
+	DBG(1, "%s: r28 is %ld\n", __func__, regs->gr[28]);

 	return err;
 }
@@ -230,7 +216,7 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, st=
ruct pt_regs *regs,
 	struct rt_sigframe __user *frame;
 	unsigned long rp, usp;
 	unsigned long haddr, sigframe_size;
-	unsigned long start, end;
+	unsigned long start;
 	int err =3D 0;
 #ifdef CONFIG_64BIT
 	struct compat_rt_sigframe __user * compat_frame;
@@ -247,8 +233,7 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, st=
ruct pt_regs *regs,
 #endif
 	frame =3D get_sigframe(&ksig->ka, usp, sigframe_size);

-	DBG(1,"SETUP_RT_FRAME: START\n");
-	DBG(1,"setup_rt_frame: frame %p info %p\n", frame, ksig->info);
+	DBG(1, "%s: frame %p info %p\n", __func__, frame, &ksig->info);

 	start =3D (unsigned long) frame;
 	if (start >=3D user_addr_max() - sigframe_size)
@@ -259,11 +244,12 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, =
struct pt_regs *regs,
 	compat_frame =3D (struct compat_rt_sigframe __user *)frame;

 	if (is_compat_task()) {
-		DBG(1,"setup_rt_frame: frame->info =3D 0x%p\n", &compat_frame->info);
+		DBG(1, "%s: frame->info =3D 0x%p\n", __func__, &compat_frame->info);
 		err |=3D copy_siginfo_to_user32(&compat_frame->info, &ksig->info);
 		err |=3D __compat_save_altstack( &compat_frame->uc.uc_stack, regs->gr[3=
0]);
-		DBG(1,"setup_rt_frame: frame->uc =3D 0x%p\n", &compat_frame->uc);
-		DBG(1,"setup_rt_frame: frame->uc.uc_mcontext =3D 0x%p\n", &compat_frame=
->uc.uc_mcontext);
+		DBG(1, "%s: frame->uc =3D 0x%p\n", __func__, &compat_frame->uc);
+		DBG(1, "%s: frame->uc.uc_mcontext =3D 0x%p\n",
+			__func__, &compat_frame->uc.uc_mcontext);
 		err |=3D setup_sigcontext32(&compat_frame->uc.uc_mcontext,
 					&compat_frame->regs, regs, in_syscall);
 		err |=3D put_compat_sigset(&compat_frame->uc.uc_sigmask, set,
@@ -271,11 +257,12 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, =
struct pt_regs *regs,
 	} else
 #endif
 	{
-		DBG(1,"setup_rt_frame: frame->info =3D 0x%p\n", &frame->info);
+		DBG(1, "%s: frame->info =3D 0x%p\n", __func__, &frame->info);
 		err |=3D copy_siginfo_to_user(&frame->info, &ksig->info);
 		err |=3D __save_altstack(&frame->uc.uc_stack, regs->gr[30]);
-		DBG(1,"setup_rt_frame: frame->uc =3D 0x%p\n", &frame->uc);
-		DBG(1,"setup_rt_frame: frame->uc.uc_mcontext =3D 0x%p\n", &frame->uc.uc=
_mcontext);
+		DBG(1, "%s: frame->uc =3D 0x%p\n", __func__, &frame->uc);
+		DBG(1, "%s: frame->uc.uc_mcontext =3D 0x%p\n",
+			__func__, &frame->uc.uc_mcontext);
 		err |=3D setup_sigcontext(&frame->uc.uc_mcontext, regs, in_syscall);
 		/* FIXME: Should probably be converted as well for the compat case */
 		err |=3D __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
@@ -284,32 +271,15 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, =
struct pt_regs *regs,
 	if (err)
 		return -EFAULT;

-	/* Set up to return from userspace.  If provided, use a stub
-	   already in userspace. The first words of tramp are used to
-	   save the previous sigrestartblock trampoline that might be
-	   on the stack. We start the sigreturn trampoline at
-	   SIGRESTARTBLOCK_TRAMP+X. */
-	err |=3D __put_user(in_syscall ? INSN_LDI_R25_1 : INSN_LDI_R25_0,
-			&frame->tramp[SIGRESTARTBLOCK_TRAMP+0]);
-	err |=3D __put_user(INSN_LDI_R20,
-			&frame->tramp[SIGRESTARTBLOCK_TRAMP+1]);
-	err |=3D __put_user(INSN_BLE_SR2_R0,
-			&frame->tramp[SIGRESTARTBLOCK_TRAMP+2]);
-	err |=3D __put_user(INSN_NOP, &frame->tramp[SIGRESTARTBLOCK_TRAMP+3]);
-
-	start =3D (unsigned long) &frame->tramp[0];
-	end =3D (unsigned long) &frame->tramp[TRAMP_SIZE];
-	flush_user_dcache_range_asm(start, end);
-	flush_user_icache_range_asm(start, end);
-
-	/* TRAMP Words 0-4, Length 5 =3D SIGRESTARTBLOCK_TRAMP
-	 * TRAMP Words 5-9, Length 4 =3D SIGRETURN_TRAMP
-	 * So the SIGRETURN_TRAMP is at the end of SIGRESTARTBLOCK_TRAMP
-	 */
-	rp =3D (unsigned long) &frame->tramp[SIGRESTARTBLOCK_TRAMP];
+#ifdef CONFIG_64BIT
+	if (!is_compat_task())
+		rp =3D VDSO64_SYMBOL(current, sigtramp_rt);
+	else
+#endif
+		rp =3D VDSO32_SYMBOL(current, sigtramp_rt);

-	if (err)
-		return -EFAULT;
+	if (in_syscall)
+		rp +=3D 4*4; /* skip 4 instructions and start at ldi 1,%r25 */

 	haddr =3D A(ksig->ka.sa.sa_handler);
 	/* The sa_handler may be a pointer to a function descriptor */
@@ -340,8 +310,8 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, st=
ruct pt_regs *regs,

 		haddr =3D fdesc.addr;
 		regs->gr[19] =3D fdesc.gp;
-		DBG(1,"setup_rt_frame: 64 bit signal, exe=3D%#lx, r19=3D%#lx, in_syscal=
l=3D%d\n",
-		     haddr, regs->gr[19], in_syscall);
+		DBG(1, "%s: 64 bit signal, exe=3D%#lx, r19=3D%#lx, in_syscall=3D%d\n",
+		     __func__, haddr, regs->gr[19], in_syscall);
 	}
 #endif

@@ -351,7 +321,7 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, st=
ruct pt_regs *regs,
 		regs->gr[31] =3D haddr;
 #ifdef CONFIG_64BIT
 		if (!test_thread_flag(TIF_32BIT))
-			sigframe_size |=3D 1;
+			sigframe_size |=3D 1; /* XXX ???? */
 #endif
 	} else {
 		unsigned long psw =3D USER_PSW;
@@ -373,11 +343,11 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, =
struct pt_regs *regs,
 		}

 		regs->gr[0] =3D psw;
-		regs->iaoq[0] =3D haddr | 3;
+		regs->iaoq[0] =3D haddr | PRIV_USER;
 		regs->iaoq[1] =3D regs->iaoq[0] + 4;
 	}

-	regs->gr[2]  =3D rp;                /* userland return pointer */
+	regs->gr[2]  =3D rp;			/* NO PRIV_USER ! userland return pointer */
 	regs->gr[26] =3D ksig->sig;               /* signal number */

 #ifdef CONFIG_64BIT
@@ -391,15 +361,15 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, =
struct pt_regs *regs,
 		regs->gr[24] =3D A(&frame->uc);   /* ucontext pointer */
 	}

-	DBG(1,"setup_rt_frame: making sigreturn frame: %#lx + %#lx =3D %#lx\n",
+	DBG(1, "%s: making sigreturn frame: %#lx + %#lx =3D %#lx\n", __func__,
 	       regs->gr[30], sigframe_size,
 	       regs->gr[30] + sigframe_size);
 	/* Raise the user stack pointer to make a proper call frame. */
 	regs->gr[30] =3D (A(frame) + sigframe_size);


-	DBG(1,"setup_rt_frame: sig deliver (%s,%d) frame=3D0x%p sp=3D%#lx iaoq=
=3D%#lx/%#lx rp=3D%#lx\n",
-	       current->comm, current->pid, frame, regs->gr[30],
+	DBG(1, "%s: sig deliver (%s,%d) frame=3D0x%p sp=3D%#lx iaoq=3D%#lx/%#lx =
rp=3D%#lx\n",
+	       __func__, current->comm, current->pid, frame, regs->gr[30],
 	       regs->iaoq[0], regs->iaoq[1], rp);

 	return 0;
@@ -415,8 +385,8 @@ handle_signal(struct ksignal *ksig, struct pt_regs *re=
gs, int in_syscall)
 	int ret;
 	sigset_t *oldset =3D sigmask_to_save();

-	DBG(1,"handle_signal: sig=3D%ld, ka=3D%p, info=3D%p, oldset=3D%p, regs=
=3D%p\n",
-	       ksig->sig, ksig->ka, ksig->info, oldset, regs);
+	DBG(1, "%s: sig=3D%d, ka=3D%p, info=3D%p, oldset=3D%p, regs=3D%p\n",
+	       __func__, ksig->sig, &ksig->ka, &ksig->info, oldset, regs);

 	/* Set up the stack frame */
 	ret =3D setup_rt_frame(ksig, oldset, regs, in_syscall);
@@ -424,8 +394,8 @@ handle_signal(struct ksignal *ksig, struct pt_regs *re=
gs, int in_syscall)
 	signal_setup_done(ret, ksig, test_thread_flag(TIF_SINGLESTEP) ||
 			  test_thread_flag(TIF_BLOCKSTEP));

-	DBG(1,KERN_DEBUG "do_signal: Exit (success), regs->gr[28] =3D %ld\n",
-		regs->gr[28]);
+	DBG(1, "%s: Exit (success), regs->gr[28] =3D %ld\n",
+		__func__, regs->gr[28]);
 }

 /*
@@ -483,21 +453,27 @@ syscall_restart(struct pt_regs *regs, struct k_sigac=
tion *ka)
 	if (regs->orig_r28)
 		return;
 	regs->orig_r28 =3D 1; /* no more restarts */
+
+	DBG(1, "%s:  orig_r28 =3D %ld  pid %d  r20 %ld\n",
+		__func__, regs->orig_r28, task_pid_nr(current), regs->gr[20]);
+
 	/* Check the return code */
 	switch (regs->gr[28]) {
 	case -ERESTART_RESTARTBLOCK:
 	case -ERESTARTNOHAND:
-		DBG(1,"ERESTARTNOHAND: returning -EINTR\n");
+		DBG(1, "%s: ERESTARTNOHAND: returning -EINTR\n", __func__);
 		regs->gr[28] =3D -EINTR;
 		break;
 	case -ERESTARTSYS:
 		if (!(ka->sa.sa_flags & SA_RESTART)) {
-			DBG(1,"ERESTARTSYS: putting -EINTR\n");
+			DBG(1, "%s: ERESTARTSYS: putting -EINTR pid %d\n",
+				__func__, task_pid_nr(current));
 			regs->gr[28] =3D -EINTR;
 			break;
 		}
 		fallthrough;
 	case -ERESTARTNOINTR:
+		DBG(1, "%s: %ld\n", __func__, regs->gr[28]);
 		check_syscallno_in_delay_branch(regs);
 		break;
 	}
@@ -509,19 +485,22 @@ insert_restart_trampoline(struct pt_regs *regs)
 	if (regs->orig_r28)
 		return;
 	regs->orig_r28 =3D 1; /* no more restarts */
-	switch(regs->gr[28]) {
+
+	DBG(2, "%s: gr28 =3D %ld pid %d\n",
+		__func__, regs->gr[28], task_pid_nr(current));
+
+	switch (regs->gr[28]) {
 	case -ERESTART_RESTARTBLOCK: {
 		/* Restart the system call - no handlers present */
 		unsigned int *usp =3D (unsigned int *)regs->gr[30];
-		unsigned long start =3D (unsigned long) &usp[2];
-		unsigned long end  =3D (unsigned long) &usp[5];
+		unsigned long rp;
 		long err =3D 0;

 		/* check that we don't exceed the stack */
 		if (A(&usp[0]) >=3D user_addr_max() - 5 * sizeof(int))
 			return;

-		/* Setup a trampoline to restart the syscall
+		/* OLD:  Setup a trampoline to restart the syscall
 		 * with __NR_restart_syscall
 		 *
 		 *  0: <return address (orig r31)>
@@ -530,29 +509,38 @@ insert_restart_trampoline(struct pt_regs *regs)
 		 * 12: be 0x100(%sr2, %r0)
 		 * 16: ldi __NR_restart_syscall, %r20
 		 */
+
+		/* Call trampoline in vdso to restart the syscall
+		 * with __NR_restart_syscall.
+		 * Original return addresses are on stack like this:
+		 *
+		 *  0: <return address (orig r31)>
+		 *  4: <2nd half for 64-bit>
+		 */
 #ifdef CONFIG_64BIT
-		err |=3D put_user(regs->gr[31] >> 32, &usp[0]);
-		err |=3D put_user(regs->gr[31] & 0xffffffff, &usp[1]);
-		err |=3D put_user(0x0fc010df, &usp[2]);
-#else
-		err |=3D put_user(regs->gr[31], &usp[0]);
-		err |=3D put_user(0x0fc0109f, &usp[2]);
+		if (!is_compat_task()) {
+			err |=3D put_user(regs->gr[31] >> 32, &usp[0]);
+			err |=3D put_user(regs->gr[31] & 0xffffffff, &usp[1]);
+			rp =3D VDSO64_SYMBOL(current, restart_syscall);
+		} else
 #endif
-		err |=3D put_user(0xe0008200, &usp[3]);
-		err |=3D put_user(0x34140000, &usp[4]);
-
+		{
+			err |=3D put_user(regs->gr[31], &usp[0]);
+			rp =3D VDSO32_SYMBOL(current, restart_syscall);
+		}
 		WARN_ON(err);

-		/* flush data/instruction cache for new insns */
-		flush_user_dcache_range_asm(start, end);
-		flush_user_icache_range_asm(start, end);
-
-		regs->gr[31] =3D regs->gr[30] + 8;
+		regs->gr[31] =3D rp;
+		DBG(1, "%s: ERESTART_RESTARTBLOCK\n", __func__);
 		return;
 	}
+	case -EINTR:
+		/* ok, was handled before and should be returned. */
+		break;
 	case -ERESTARTNOHAND:
 	case -ERESTARTSYS:
 	case -ERESTARTNOINTR:
+		DBG(1, "%s: Type %ld\n", __func__, regs->gr[28]);
 		check_syscallno_in_delay_branch(regs);
 		return;
 	default:
@@ -567,30 +555,35 @@ insert_restart_trampoline(struct pt_regs *regs)
  * registers).  As noted below, the syscall number gets restored for
  * us due to the magic of delayed branching.
  */
-asmlinkage void
-do_signal(struct pt_regs *regs, long in_syscall)
+static void do_signal(struct pt_regs *regs, long in_syscall)
 {
 	struct ksignal ksig;
+	int restart_syscall;
+	bool has_handler;

-	DBG(1,"\ndo_signal: regs=3D0x%p, sr7 %#lx, in_syscall=3D%d\n",
-	       regs, regs->sr[7], in_syscall);
+	has_handler =3D get_signal(&ksig);

-	if (get_signal(&ksig)) {
-		DBG(3,"do_signal: signr =3D %d, regs->gr[28] =3D %ld\n", signr, regs->g=
r[28]);
+	restart_syscall =3D 0;
+	if (in_syscall)
+		restart_syscall =3D 1;
+
+	if (has_handler) {
 		/* Restart a system call if necessary. */
-		if (in_syscall)
+		if (restart_syscall)
 			syscall_restart(regs, &ksig.ka);

 		handle_signal(&ksig, regs, in_syscall);
+		DBG(1, "%s: Handled signal pid %d\n",
+			__func__, task_pid_nr(current));
 		return;
 	}

-	/* Did we come from a system call? */
-	if (in_syscall)
+	/* Do we need to restart the system call? */
+	if (restart_syscall)
 		insert_restart_trampoline(regs);

-	DBG(1,"do_signal: Exit (not delivered), regs->gr[28] =3D %ld\n",
-		regs->gr[28]);
+	DBG(1, "%s: Exit (not delivered), regs->gr[28] =3D %ld  orig_r28 =3D %ld=
  pid %d\n",
+		__func__, regs->gr[28], regs->orig_r28, task_pid_nr(current));

 	restore_saved_sigmask();
 }
diff --git a/arch/parisc/kernel/signal32.h b/arch/parisc/kernel/signal32.h
index f166250f2d06..c03eb1ed4c53 100644
=2D-- a/arch/parisc/kernel/signal32.h
+++ b/arch/parisc/kernel/signal32.h
@@ -36,21 +36,12 @@ struct compat_regfile {
         compat_int_t rf_sar;
 };

-#define COMPAT_SIGRETURN_TRAMP 4
-#define COMPAT_SIGRESTARTBLOCK_TRAMP 5
-#define COMPAT_TRAMP_SIZE (COMPAT_SIGRETURN_TRAMP + \
-				COMPAT_SIGRESTARTBLOCK_TRAMP)
-
 struct compat_rt_sigframe {
-        /* XXX: Must match trampoline size in arch/parisc/kernel/signal.c
-                Secondary to that it must protect the ERESTART_RESTARTBLO=
CK
-                trampoline we left on the stack (we were bad and didn't
-                change sp so we could run really fast.) */
-        compat_uint_t tramp[COMPAT_TRAMP_SIZE];
-        compat_siginfo_t info;
-        struct compat_ucontext uc;
-        /* Hidden location of truncated registers, *must* be last. */
-        struct compat_regfile regs;
+	unsigned int tramp[2]; /* holds original return address */
+	compat_siginfo_t info;
+	struct compat_ucontext uc;
+	/* Hidden location of truncated registers, *must* be last. */
+	struct compat_regfile regs;
 };

 /*
diff --git a/arch/parisc/kernel/vdso.c b/arch/parisc/kernel/vdso.c
new file mode 100644
index 000000000000..82da1aea8c57
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (c) 2021 Helge Deller <deller@gmx.de>
+ *
+ *  based on arch/s390/kernel/vdso.c which is
+ *  Copyright IBM Corp. 2008
+ *  Author(s): Martin Schwidefsky (schwidefsky@de.ibm.com)
+ */
+
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/elf.h>
+#include <linux/timekeeper_internal.h>
+#include <linux/compat.h>
+#include <linux/nsproxy.h>
+#include <linux/time_namespace.h>
+#include <linux/random.h>
+
+#include <asm/pgtable.h>
+#include <asm/page.h>
+#include <asm/sections.h>
+#include <asm/vdso.h>
+#include <asm/cacheflush.h>
+
+extern char vdso32_start, vdso32_end;
+extern char vdso64_start, vdso64_end;
+
+static int vdso_mremap(const struct vm_special_mapping *sm,
+		       struct vm_area_struct *vma)
+{
+	current->mm->context.vdso_base =3D vma->vm_start;
+	return 0;
+}
+
+#ifdef CONFIG_64BIT
+static struct vm_special_mapping vdso64_mapping =3D {
+	.name =3D "[vdso]",
+	.mremap =3D vdso_mremap,
+};
+#endif
+
+static struct vm_special_mapping vdso32_mapping =3D {
+	.name =3D "[vdso]",
+	.mremap =3D vdso_mremap,
+};
+
+/*
+ * This is called from binfmt_elf, we create the special vma for the
+ * vDSO and insert it into the mm struct tree
+ */
+int arch_setup_additional_pages(struct linux_binprm *bprm,
+				int executable_stack)
+{
+
+	unsigned long vdso_text_start, vdso_text_len, map_base;
+	struct vm_special_mapping *vdso_mapping;
+	struct mm_struct *mm =3D current->mm;
+	struct vm_area_struct *vma;
+	int rc;
+
+	if (mmap_write_lock_killable(mm))
+		return -EINTR;
+
+#ifdef CONFIG_64BIT
+	if (!is_compat_task()) {
+		vdso_text_len =3D &vdso64_end - &vdso64_start;
+		vdso_mapping =3D &vdso64_mapping;
+	} else
+#endif
+	{
+		vdso_text_len =3D &vdso32_end - &vdso32_start;
+		vdso_mapping =3D &vdso32_mapping;
+	}
+
+	map_base =3D mm->mmap_base;
+	if (current->flags & PF_RANDOMIZE)
+		map_base -=3D (get_random_int() & 0x1f) * PAGE_SIZE;
+
+	vdso_text_start =3D get_unmapped_area(NULL, map_base, vdso_text_len, 0, =
0);
+	rc =3D vdso_text_start;
+	if (IS_ERR_VALUE(rc))
+		goto out;
+
+	/* VM_MAYWRITE for COW so gdb can set breakpoints */
+	vma =3D _install_special_mapping(mm, vdso_text_start, vdso_text_len,
+				       VM_READ|VM_EXEC|
+				       VM_MAYREAD|VM_MAYWRITE|VM_MAYEXEC,
+				       vdso_mapping);
+	if (IS_ERR(vma)) {
+		do_munmap(mm, vdso_text_start, PAGE_SIZE, NULL);
+		rc =3D PTR_ERR(vma);
+	} else {
+		current->mm->context.vdso_base =3D vdso_text_start;
+		rc =3D 0;
+	}
+out:
+	mmap_write_unlock(mm);
+	return rc;
+}
+
+static struct page ** __init vdso_setup_pages(void *start, void *end)
+{
+	int pages =3D (end - start) >> PAGE_SHIFT;
+	struct page **pagelist;
+	int i;
+
+	pagelist =3D kcalloc(pages + 1, sizeof(struct page *), GFP_KERNEL);
+	if (!pagelist)
+		panic("%s: Cannot allocate page list for VDSO", __func__);
+	for (i =3D 0; i < pages; i++)
+		pagelist[i] =3D virt_to_page(start + i * PAGE_SIZE);
+	return pagelist;
+}
+
+static int __init vdso_init(void)
+{
+#ifdef CONFIG_64BIT
+	vdso64_mapping.pages =3D vdso_setup_pages(&vdso64_start, &vdso64_end);
+#endif
+	if (IS_ENABLED(CONFIG_COMPAT) || !IS_ENABLED(CONFIG_64BIT))
+		vdso32_mapping.pages =3D vdso_setup_pages(&vdso32_start, &vdso32_end);
+	return 0;
+}
+arch_initcall(vdso_init);
diff --git a/arch/parisc/kernel/vdso32/Makefile b/arch/parisc/kernel/vdso3=
2/Makefile
new file mode 100644
index 000000000000..85b1c6d261d1
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso32/Makefile
@@ -0,0 +1,53 @@
+# List of files in the vdso, has to be asm only for now
+
+obj-vdso32 =3D note.o sigtramp.o restart_syscall.o
+
+# Build rules
+
+targets :=3D $(obj-vdso32) vdso32.so
+obj-vdso32 :=3D $(addprefix $(obj)/, $(obj-vdso32))
+
+ccflags-y :=3D -shared -fno-common -fbuiltin -mno-fast-indirect-calls -O2=
 -mno-long-calls
+#  -march=3D1.1 -mschedule=3D7100LC
+ccflags-y +=3D -nostdlib -Wl,-soname=3Dlinux-vdso32.so.1 \
+		$(call ld-option, -Wl$(comma)--hash-style=3Dsysv)
+asflags-y :=3D -D__VDSO32__ -s
+
+KBUILD_AFLAGS +=3D -DBUILD_VDSO
+KBUILD_CFLAGS +=3D -DBUILD_VDSO -DDISABLE_BRANCH_PROFILING
+
+VDSO_LIBGCC :=3D $(shell $(CROSS32CC) -print-libgcc-file-name)
+
+obj-y +=3D vdso32_wrapper.o
+extra-y +=3D vdso32.lds
+CPPFLAGS_vdso32.lds +=3D -P -C  #  -U$(ARCH)
+
+$(obj)/vdso32_wrapper.o : $(obj)/vdso32.so FORCE
+
+# Force dependency (incbin is bad)
+# link rule for the .so file, .lds has to be first
+$(obj)/vdso32.so: $(src)/vdso32.lds $(obj-vdso32) $(obj-cvdso32) $(VDSO_L=
IBGCC)
+	$(call if_changed,vdso32ld)
+
+# assembly rules for the .S files
+$(obj-vdso32): %.o: %.S FORCE
+	$(call if_changed_dep,vdso32as)
+
+$(obj-cvdso32): %.o: %.c FORCE
+	$(call if_changed_dep,vdso32cc)
+
+# actual build commands
+quiet_cmd_vdso32ld =3D VDSO32L $@
+      cmd_vdso32ld =3D $(CROSS32CC) $(c_flags) -Wl,-T $^ -o $@
+quiet_cmd_vdso32as =3D VDSO32A $@
+      cmd_vdso32as =3D $(CROSS32CC) $(a_flags) -c -o $@ $<
+quiet_cmd_vdso32cc =3D VDSO32C $@
+      cmd_vdso32cc =3D $(CROSS32CC) $(c_flags) -c -fPIC -mno-fast-indirec=
t-calls -o $@ $<
+
+# Generate VDSO offsets using helper script
+gen-vdsosym :=3D $(srctree)/$(src)/gen_vdso_offsets.sh
+quiet_cmd_vdsosym =3D VDSOSYM $@
+	cmd_vdsosym =3D $(NM) $< | $(gen-vdsosym) | LC_ALL=3DC sort > $@
+
+include/generated/vdso32-offsets.h: $(obj)/vdso32.so FORCE
+	$(call if_changed,vdsosym)
diff --git a/arch/parisc/kernel/vdso32/gen_vdso_offsets.sh b/arch/parisc/k=
ernel/vdso32/gen_vdso_offsets.sh
new file mode 100755
index 000000000000..da39d6cff7f1
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso32/gen_vdso_offsets.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+#
+# Match symbols in the DSO that look like VDSO_*; produce a header file
+# of constant offsets into the shared object.
+#
+# Doing this inside the Makefile will break the $(filter-out) function,
+# causing Kbuild to rebuild the vdso-offsets header file every time.
+#
+# Inspired by arm64 version.
+#
+
+LC_ALL=3DC
+sed -n 's/\([0-9a-f]*\) . __kernel_\(.*\)/\#define vdso32_offset_\2\t0x\1=
/p'
diff --git a/arch/parisc/kernel/vdso32/note.S b/arch/parisc/kernel/vdso32/=
note.S
new file mode 100644
index 000000000000..bb350918bebd
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso32/note.S
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This supplies .note.* sections to go into the PT_NOTE inside the vDSO =
text.
+ * Here we can supply some information useful to userland.
+ */
+
+#include <linux/uts.h>
+#include <linux/version.h>
+
+#define ASM_ELF_NOTE_BEGIN(name, flags, vendor, type)			      \
+	.section name, flags;						      \
+	.balign 4;							      \
+	.long 1f - 0f;		/* name length */			      \
+	.long 3f - 2f;		/* data length */			      \
+	.long type;		/* note type */				      \
+0:	.asciz vendor;		/* vendor name */			      \
+1:	.balign 4;							      \
+2:
+
+#define ASM_ELF_NOTE_END						      \
+3:	.balign 4;		/* pad out section */			      \
+	.previous
+
+	ASM_ELF_NOTE_BEGIN(".note.kernel-version", "a", UTS_SYSNAME, 0)
+	.long LINUX_VERSION_CODE
+	ASM_ELF_NOTE_END
diff --git a/arch/parisc/kernel/vdso32/restart_syscall.S b/arch/parisc/ker=
nel/vdso32/restart_syscall.S
new file mode 100644
index 000000000000..7e82008d7e40
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso32/restart_syscall.S
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Syscall restart trampoline for 32 and 64 bits processes.
+ *
+ * Copyright (C) 2018-2022 Helge Deller <deller@gmx.de>
+ * Copyright (C) 2022 John David Anglin <dave.anglin@bell.net>
+ */
+
+#include <asm/unistd.h>
+#include <asm/vdso.h>
+
+#include <linux/linkage.h>
+
+	.text
+
+ENTRY_CFI(__kernel_restart_syscall)
+	/*
+	 * Setup a trampoline to restart the syscall
+	 * with __NR_restart_syscall
+	 */
+
+	/* load return pointer */
+#if defined(__VDSO64__)
+	ldd	0(%sp), %r31
+#elif defined(__VDSO32__)
+	ldw	0(%sp), %r31
+#endif
+
+	be	0x100(%sr2, %r0)
+	ldi	__NR_restart_syscall, %r20
+
+ENDPROC_CFI(__kernel_restart_syscall)
diff --git a/arch/parisc/kernel/vdso32/sigtramp.S b/arch/parisc/kernel/vds=
o32/sigtramp.S
new file mode 100644
index 000000000000..fbab9fd92afc
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso32/sigtramp.S
@@ -0,0 +1,195 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Signal trampolines for 32 bit processes.
+ *
+ * Copyright (C) 2006 Randolph Chung <tausq@debian.org>
+ * Copyright (C) 2018-2022 Helge Deller <deller@gmx.de>
+ * Copyright (C) 2022 John David Anglin <dave.anglin@bell.net>
+ */
+#include <asm/unistd.h>
+#include <linux/linkage.h>
+#include <generated/asm-offsets.h>
+
+	.text
+
+/* Gdb expects the trampoline is on the stack and the pc is offset from
+   a 64-byte boundary by 0, 4 or 5 instructions. Since the vdso trampolin=
e
+   is not on the stack, we need a new variant with different offsets and
+   data to tell gdb where to find the signal context on the stack.
+
+   Here we put the offset to the context data at the start of the trampol=
ine
+   region and offset the first trampoline by 2 instructions. Please do
+   not change the trampoline as the code in gdb depends on the following
+   instruction sequence exactly.
+ */
+	.align 64
+	.word SIGFRAME_CONTEXT_REGS32
+
+/* The nop here is a hack.  The dwarf2 unwind routines subtract 1 from
+   the return address to get an address in the middle of the presumed
+   call instruction.  Since we don't have a call here, we artifically
+   extend the range covered by the unwind info by adding a nop before
+   the real start.
+ */
+	nop
+
+	.globl __kernel_sigtramp_rt
+	.type __kernel_sigtramp_rt, @function
+__kernel_sigtramp_rt:
+	.proc
+	.callinfo FRAME=3DASM_SIGFRAME_SIZE32,CALLS,SAVE_RP
+	.entry
+
+.Lsigrt_start =3D . - 4
+0:	ldi	0, %r25			/* (in_syscall=3D0) */
+	ldi  __NR_rt_sigreturn, %r20
+	ble  0x100(%sr2, %r0)
+	nop
+
+1:	ldi	1, %r25			/* (in_syscall=3D1) */
+	ldi  __NR_rt_sigreturn, %r20
+	ble  0x100(%sr2, %r0)
+	nop
+.Lsigrt_end:
+	.exit
+	.procend
+	.size __kernel_sigtramp_rt,.-__kernel_sigtramp_rt
+
+
+	.section .eh_frame,"a",@progbits
+
+/* This is where the mcontext_t struct can be found on the stack.  */
+#define PTREGS SIGFRAME_CONTEXT_REGS32	/* 32-bit process offset is -672 *=
/
+
+/* Register REGNO can be found at offset OFS of the mcontext_t structure.=
 */
+	.macro rsave regno,ofs
+	.byte 0x05		/* DW_CFA_offset_extended */
+	.uleb128 \regno;	/*   regno */
+	.uleb128 \ofs		/*   factored offset */
+	.endm
+
+.Lcie:
+	.long .Lcie_end - .Lcie_start
+.Lcie_start:
+	.long 0			/* CIE ID */
+	.byte 1			/* Version number */
+	.stringz "zRS"		/* NUL-terminated augmentation string */
+	.uleb128 4		/* Code alignment factor */
+	.sleb128 4		/* Data alignment factor */
+	.byte 89		/* Return address register column, iaoq[0] */
+	.uleb128 1		/* Augmentation value length */
+	.byte 0x1b		/* DW_EH_PE_pcrel | DW_EH_PE_sdata4. */
+	.byte 0x0f		/* DW_CFA_def_cfa_expresion */
+	.uleb128 9f - 1f	/*   length */
+1:
+	.byte 0x8e		/*   DW_OP_breg30 */
+	.sleb128 PTREGS
+9:
+	.balign 4
+.Lcie_end:
+
+	.long .Lfde0_end - .Lfde0_start
+.Lfde0_start:
+	.long .Lfde0_start - .Lcie	/* CIE pointer. */
+	.long .Lsigrt_start - .		/* PC start, length */
+	.long .Lsigrt_end - .Lsigrt_start
+	.uleb128 0			/* Augmentation */
+
+	/* General registers */
+	rsave  1,  2
+	rsave  2,  3
+	rsave  3,  4
+	rsave  4,  5
+	rsave  5,  6
+	rsave  6,  7
+	rsave  7,  8
+	rsave  8,  9
+	rsave  9, 10
+	rsave 10, 11
+	rsave 11, 12
+	rsave 12, 13
+	rsave 13, 14
+	rsave 14, 15
+	rsave 15, 16
+	rsave 16, 17
+	rsave 17, 18
+	rsave 18, 19
+	rsave 19, 20
+	rsave 20, 21
+	rsave 21, 22
+	rsave 22, 23
+	rsave 23, 24
+	rsave 24, 25
+	rsave 25, 26
+	rsave 26, 27
+	rsave 27, 28
+	rsave 28, 29
+	rsave 29, 30
+	rsave 30, 31
+	rsave 31, 32
+
+	/* Floating-point registers */
+	rsave 32, 42
+	rsave 33, 43
+	rsave 34, 44
+	rsave 35, 45
+	rsave 36, 46
+	rsave 37, 47
+	rsave 38, 48
+	rsave 39, 49
+	rsave 40, 50
+	rsave 41, 51
+	rsave 42, 52
+	rsave 43, 53
+	rsave 44, 54
+	rsave 45, 55
+	rsave 46, 56
+	rsave 47, 57
+	rsave 48, 58
+	rsave 49, 59
+	rsave 50, 60
+	rsave 51, 61
+	rsave 52, 62
+	rsave 53, 63
+	rsave 54, 64
+	rsave 55, 65
+	rsave 56, 66
+	rsave 57, 67
+	rsave 58, 68
+	rsave 59, 69
+	rsave 60, 70
+	rsave 61, 71
+	rsave 62, 72
+	rsave 63, 73
+	rsave 64, 74
+	rsave 65, 75
+	rsave 66, 76
+	rsave 67, 77
+	rsave 68, 78
+	rsave 69, 79
+	rsave 70, 80
+	rsave 71, 81
+	rsave 72, 82
+	rsave 73, 83
+	rsave 74, 84
+	rsave 75, 85
+	rsave 76, 86
+	rsave 77, 87
+	rsave 78, 88
+	rsave 79, 89
+	rsave 80, 90
+	rsave 81, 91
+	rsave 82, 92
+	rsave 83, 93
+	rsave 84, 94
+	rsave 85, 95
+	rsave 86, 96
+	rsave 87, 97
+
+	/* SAR register */
+	rsave 88, 102
+
+	/* iaoq[0] return address register */
+	rsave 89, 100
+	.balign 4
+.Lfde0_end:
diff --git a/arch/parisc/kernel/vdso32/vdso32.lds.S b/arch/parisc/kernel/v=
dso32/vdso32.lds.S
new file mode 100644
index 000000000000..d4aff3af5262
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso32/vdso32.lds.S
@@ -0,0 +1,111 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This is the infamous ld script for the 32 bits vdso library
+ */
+#include <asm/vdso.h>
+#include <asm/page.h>
+
+/* Default link addresses for the vDSOs */
+OUTPUT_FORMAT("elf32-hppa-linux")
+OUTPUT_ARCH(hppa)
+ENTRY(_start)
+
+SECTIONS
+{
+  . =3D VDSO_LBASE + SIZEOF_HEADERS;
+  .hash           : { *(.hash) }			:text
+  .gnu.hash       : { *(.gnu.hash) }
+  .dynsym         : { *(.dynsym) }
+  .dynstr         : { *(.dynstr) }
+  .gnu.version    : { *(.gnu.version) }
+  .gnu.version_d  : { *(.gnu.version_d) }
+  .gnu.version_r  : { *(.gnu.version_r) }
+
+  .note		  : { *(.note.*) } 			:text	:note
+
+  . =3D ALIGN (16);
+  .text :
+  {
+    *(.text .stub .text.* .gnu.linkonce.t.*)
+  }
+  PROVIDE (__etext =3D .);
+  PROVIDE (_etext =3D .);
+  PROVIDE (etext =3D .);
+
+  /* Other stuff is appended to the text segment: */
+  .rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
+  .rodata1		: { *(.rodata1) }
+  .rodata2		: { *(.data.rel.ro) }
+
+  .eh_frame_hdr		: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
+  .eh_frame		: { KEEP (*(.eh_frame)) }	:text
+  .gcc_except_table	: { *(.gcc_except_table) }
+  .fixup		: { *(.fixup) }
+
+  .dynamic		: { *(.dynamic) }		:text	:dynamic
+  .plt : { *(.plt) }
+  .got : { *(.got) }
+
+  _end =3D .;
+  __end =3D .;
+  PROVIDE (end =3D .);
+
+
+  /* Stabs debugging sections are here too
+   */
+  .stab 0 : { *(.stab) }
+  .stabstr 0 : { *(.stabstr) }
+  .stab.excl 0 : { *(.stab.excl) }
+  .stab.exclstr 0 : { *(.stab.exclstr) }
+  .stab.index 0 : { *(.stab.index) }
+  .stab.indexstr 0 : { *(.stab.indexstr) }
+  .comment 0 : { *(.comment) }
+  .debug 0 : { *(.debug) }
+  .line 0 : { *(.line) }
+
+  .debug_srcinfo 0 : { *(.debug_srcinfo) }
+  .debug_sfnames 0 : { *(.debug_sfnames) }
+
+  .debug_aranges 0 : { *(.debug_aranges) }
+  .debug_pubnames 0 : { *(.debug_pubnames) }
+
+  .debug_info 0 : { *(.debug_info .gnu.linkonce.wi.*) }
+  .debug_abbrev 0 : { *(.debug_abbrev) }
+  .debug_line 0 : { *(.debug_line) }
+  .debug_frame 0 : { *(.debug_frame) }
+  .debug_str 0 : { *(.debug_str) }
+  .debug_loc 0 : { *(.debug_loc) }
+  .debug_macinfo 0 : { *(.debug_macinfo) }
+
+  .debug_weaknames 0 : { *(.debug_weaknames) }
+  .debug_funcnames 0 : { *(.debug_funcnames) }
+  .debug_typenames 0 : { *(.debug_typenames) }
+  .debug_varnames 0 : { *(.debug_varnames) }
+
+  /DISCARD/ : { *(.note.GNU-stack) }
+  /DISCARD/ : { *(.data .data.* .gnu.linkonce.d.* .sdata*) }
+  /DISCARD/ : { *(.bss .sbss .dynbss .dynsbss) }
+}
+
+
+PHDRS
+{
+  text PT_LOAD FILEHDR PHDRS FLAGS(5); /* PF_R|PF_X */
+  note PT_NOTE FLAGS(4); /* PF_R */
+  dynamic PT_DYNAMIC FLAGS(4); /* PF_R */
+  eh_frame_hdr PT_GNU_EH_FRAME;
+}
+
+
+/*
+ * This controls what symbols we export from the DSO.
+ */
+VERSION
+{
+  VDSO_VERSION_STRING {
+    global:
+	__kernel_sigtramp_rt32;
+	__kernel_restart_syscall32;
+    local: *;
+  };
+}
diff --git a/arch/parisc/kernel/vdso32/vdso32_wrapper.S b/arch/parisc/kern=
el/vdso32/vdso32_wrapper.S
new file mode 100644
index 000000000000..5ac06093e8ec
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso32/vdso32_wrapper.S
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/linkage.h>
+#include <asm/page.h>
+
+	__PAGE_ALIGNED_DATA
+
+	.globl vdso32_start, vdso32_end
+	.balign PAGE_SIZE
+vdso32_start:
+	.incbin "arch/parisc/kernel/vdso32/vdso32.so"
+	.balign PAGE_SIZE
+vdso32_end:
+
+	.previous
diff --git a/arch/parisc/kernel/vdso64/Makefile b/arch/parisc/kernel/vdso6=
4/Makefile
new file mode 100644
index 000000000000..a30f5ec5eb4b
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso64/Makefile
@@ -0,0 +1,48 @@
+# List of files in the vdso, has to be asm only for now
+
+obj-vdso64 =3D note.o sigtramp.o restart_syscall.o
+
+# Build rules
+
+targets :=3D $(obj-vdso64) vdso64.so
+obj-vdso64 :=3D $(addprefix $(obj)/, $(obj-vdso64))
+
+
+ccflags-y :=3D -shared -fno-common -fno-builtin
+ccflags-y +=3D -nostdlib -Wl,-soname=3Dlinux-vdso64.so.1 \
+		$(call ld-option, -Wl$(comma)--hash-style=3Dsysv)
+asflags-y :=3D -D__VDSO64__ -s
+
+KBUILD_AFLAGS +=3D -DBUILD_VDSO
+KBUILD_CFLAGS +=3D -DBUILD_VDSO -DDISABLE_BRANCH_PROFILING
+
+VDSO_LIBGCC :=3D $(shell $(CC) -print-libgcc-file-name)
+
+obj-y +=3D vdso64_wrapper.o
+extra-y +=3D vdso64.lds
+CPPFLAGS_vdso64.lds +=3D -P -C -U$(ARCH)
+
+$(obj)/vdso64_wrapper.o : $(obj)/vdso64.so FORCE
+
+# Force dependency (incbin is bad)
+# link rule for the .so file, .lds has to be first
+$(obj)/vdso64.so: $(src)/vdso64.lds $(obj-vdso64) $(VDSO_LIBGCC)
+	$(call if_changed,vdso64ld)
+
+# assembly rules for the .S files
+$(obj-vdso64): %.o: %.S FORCE
+	$(call if_changed_dep,vdso64as)
+
+# actual build commands
+quiet_cmd_vdso64ld =3D VDSO64L $@
+      cmd_vdso64ld =3D $(CC) $(c_flags) -Wl,-T $^ -o $@
+quiet_cmd_vdso64as =3D VDSO64A $@
+      cmd_vdso64as =3D $(CC) $(a_flags) -c -o $@ $<
+
+# Generate VDSO offsets using helper script
+gen-vdsosym :=3D $(srctree)/$(src)/gen_vdso_offsets.sh
+quiet_cmd_vdsosym =3D VDSOSYM $@
+	cmd_vdsosym =3D $(NM) $< | $(gen-vdsosym) | LC_ALL=3DC sort > $@
+
+include/generated/vdso64-offsets.h: $(obj)/vdso64.so FORCE
+	$(call if_changed,vdsosym)
diff --git a/arch/parisc/kernel/vdso64/gen_vdso_offsets.sh b/arch/parisc/k=
ernel/vdso64/gen_vdso_offsets.sh
new file mode 100755
index 000000000000..37f05cb38dad
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso64/gen_vdso_offsets.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+#
+# Match symbols in the DSO that look like VDSO_*; produce a header file
+# of constant offsets into the shared object.
+#
+# Doing this inside the Makefile will break the $(filter-out) function,
+# causing Kbuild to rebuild the vdso-offsets header file every time.
+#
+# Inspired by arm64 version.
+#
+
+LC_ALL=3DC
+sed -n 's/\([0-9a-f]*\) . __kernel_\(.*\)/\#define vdso64_offset_\2\t0x\1=
/p'
diff --git a/arch/parisc/kernel/vdso64/note.S b/arch/parisc/kernel/vdso64/=
note.S
new file mode 100644
index 000000000000..bd1fa23597d6
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso64/note.S
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include "../vdso32/note.S"
diff --git a/arch/parisc/kernel/vdso64/restart_syscall.S b/arch/parisc/ker=
nel/vdso64/restart_syscall.S
new file mode 100644
index 000000000000..83004451f6b1
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso64/restart_syscall.S
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include "../vdso32/restart_syscall.S"
diff --git a/arch/parisc/kernel/vdso64/sigtramp.S b/arch/parisc/kernel/vds=
o64/sigtramp.S
new file mode 100644
index 000000000000..66a6d2b241e1
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso64/sigtramp.S
@@ -0,0 +1,166 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Signal trampolines for 64 bit processes.
+ *
+ * Copyright (C) 2006 Randolph Chung <tausq@debian.org>
+ * Copyright (C) 2018-2022 Helge Deller <deller@gmx.de>
+ * Copyright (C) 2022 John David Anglin <dave.anglin@bell.net>
+ */
+#include <asm/unistd.h>
+#include <linux/linkage.h>
+#include <generated/asm-offsets.h>
+
+	.text
+
+/* Gdb expects the trampoline is on the stack and the pc is offset from
+   a 64-byte boundary by 0, 4 or 5 instructions. Since the vdso trampolin=
e
+   is not on the stack, we need a new variant with different offsets and
+   data to tell gdb where to find the signal context on the stack.
+
+   Here we put the offset to the context data at the start of the trampol=
ine
+   region and offset the first trampoline by 2 instructions. Please do
+   not change the trampoline as the code in gdb depends on the following
+   instruction sequence exactly.
+ */
+	.align 64
+	.word SIGFRAME_CONTEXT_REGS
+
+/* The nop here is a hack. The dwarf2 unwind routines subtract 1 from
+   the return address to get an address in the middle of the presumed
+   call instruction. Since we don't have a call here, we artifically
+   extend the range covered by the unwind info by adding a nop before
+   the real start.
+ */
+	nop
+
+	.globl __kernel_sigtramp_rt
+	.type __kernel_sigtramp_rt, @function
+__kernel_sigtramp_rt:
+	.proc
+	.callinfo FRAME=3DASM_SIGFRAME_SIZE,CALLS,SAVE_RP
+	.entry
+
+.Lsigrt_start =3D . - 4
+0:	ldi	0, %r25			/* (in_syscall=3D0) */
+	ldi  __NR_rt_sigreturn, %r20
+	ble  0x100(%sr2, %r0)
+	nop
+
+1:	ldi	1, %r25			/* (in_syscall=3D1) */
+	ldi  __NR_rt_sigreturn, %r20
+	ble  0x100(%sr2, %r0)
+	nop
+.Lsigrt_end:
+	.exit
+	.procend
+	.size __kernel_sigtramp_rt,.-__kernel_sigtramp_rt
+
+	.section .eh_frame,"a",@progbits
+
+/* This is where the mcontext_t struct can be found on the stack.  */
+#define PTREGS SIGFRAME_CONTEXT_REGS	/* 64-bit process offset is -720 */
+
+/* Register REGNO can be found at offset OFS of the mcontext_t structure.=
 */
+	.macro rsave regno,ofs
+	.byte 0x05		/* DW_CFA_offset_extended */
+	.uleb128 \regno;	/*   regno */
+	.uleb128 \ofs		/*   factored offset */
+	.endm
+
+.Lcie:
+	.long .Lcie_end - .Lcie_start
+.Lcie_start:
+	.long 0			/* CIE ID */
+	.byte 1			/* Version number */
+	.stringz "zRS"		/* NUL-terminated augmentation string */
+	.uleb128 4		/* Code alignment factor */
+	.sleb128 8		/* Data alignment factor */
+	.byte 61		/* Return address register column, iaoq[0] */
+	.uleb128 1		/* Augmentation value length */
+	.byte 0x1b		/* DW_EH_PE_pcrel | DW_EH_PE_sdata4. */
+	.byte 0x0f		/* DW_CFA_def_cfa_expresion */
+	.uleb128 9f - 1f	/*   length */
+1:
+	.byte 0x8e		/*   DW_OP_breg30 */
+	.sleb128 PTREGS
+9:
+	.balign 8
+.Lcie_end:
+
+	.long .Lfde0_end - .Lfde0_start
+.Lfde0_start:
+	.long .Lfde0_start - .Lcie	/* CIE pointer. */
+	.long .Lsigrt_start - .		/* PC start, length */
+	.long .Lsigrt_end - .Lsigrt_start
+	.uleb128 0			/* Augmentation */
+
+	/* General registers */
+	rsave  1,  2
+	rsave  2,  3
+	rsave  3,  4
+	rsave  4,  5
+	rsave  5,  6
+	rsave  6,  7
+	rsave  7,  8
+	rsave  8,  9
+	rsave  9, 10
+	rsave 10, 11
+	rsave 11, 12
+	rsave 12, 13
+	rsave 13, 14
+	rsave 14, 15
+	rsave 15, 16
+	rsave 16, 17
+	rsave 17, 18
+	rsave 18, 19
+	rsave 19, 20
+	rsave 20, 21
+	rsave 21, 22
+	rsave 22, 23
+	rsave 23, 24
+	rsave 24, 25
+	rsave 25, 26
+	rsave 26, 27
+	rsave 27, 28
+	rsave 28, 29
+	rsave 29, 30
+	rsave 30, 31
+	rsave 31, 32
+
+	/* Floating-point registers */
+	rsave 32, 36
+	rsave 33, 37
+	rsave 34, 38
+	rsave 35, 39
+	rsave 36, 40
+	rsave 37, 41
+	rsave 38, 42
+	rsave 39, 43
+	rsave 40, 44
+	rsave 41, 45
+	rsave 42, 46
+	rsave 43, 47
+	rsave 44, 48
+	rsave 45, 49
+	rsave 46, 50
+	rsave 47, 51
+	rsave 48, 52
+	rsave 49, 53
+	rsave 50, 54
+	rsave 51, 55
+	rsave 52, 56
+	rsave 53, 57
+	rsave 54, 58
+	rsave 55, 59
+	rsave 56, 60
+	rsave 57, 61
+	rsave 58, 62
+	rsave 59, 63
+
+	/* SAR register */
+	rsave 60, 67
+
+	/* iaoq[0] return address register */
+	rsave 61, 65
+	.balign 8
+.Lfde0_end:
diff --git a/arch/parisc/kernel/vdso64/vdso64.lds.S b/arch/parisc/kernel/v=
dso64/vdso64.lds.S
new file mode 100644
index 000000000000..de1fb4b19286
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso64/vdso64.lds.S
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This is the infamous ld script for the 64 bits vdso library
+ */
+#include <asm/vdso.h>
+
+/* Default link addresses for the vDSOs */
+OUTPUT_FORMAT("elf64-hppa-linux")
+OUTPUT_ARCH(hppa:hppa2.0w)
+ENTRY(_start)
+
+SECTIONS
+{
+  . =3D VDSO_LBASE + SIZEOF_HEADERS;
+  .hash           : { *(.hash) }			:text
+  .gnu.hash       : { *(.gnu.hash) }
+  .dynsym         : { *(.dynsym) }
+  .dynstr         : { *(.dynstr) }
+  .gnu.version    : { *(.gnu.version) }
+  .gnu.version_d  : { *(.gnu.version_d) }
+  .gnu.version_r  : { *(.gnu.version_r) }
+
+  .note		  : { *(.note.*) } 			:text	:note
+
+  . =3D ALIGN (16);
+  .text :
+  {
+    *(.text .stub .text.* .gnu.linkonce.t.*)
+  }
+  PROVIDE (__etext =3D .);
+  PROVIDE (_etext =3D .);
+  PROVIDE (etext =3D .);
+
+  /* Other stuff is appended to the text segment: */
+  .rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
+  .rodata1		: { *(.rodata1) }
+
+  .eh_frame_hdr		: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
+  .eh_frame		: { KEEP (*(.eh_frame)) }	:text
+  .gcc_except_table	: { *(.gcc_except_table) }
+  .fixup		: { *(.fixup) }
+
+  .dynamic		: { *(.dynamic) }		:text	:dynamic
+  .plt : { *(.plt) }
+  .got : { *(.got) }
+
+  _end =3D .;
+  __end =3D .;
+  PROVIDE (end =3D .);
+
+
+  /* Stabs debugging sections are here too
+   */
+  .stab 0 : { *(.stab) }
+  .stabstr 0 : { *(.stabstr) }
+  .stab.excl 0 : { *(.stab.excl) }
+  .stab.exclstr 0 : { *(.stab.exclstr) }
+  .stab.index 0 : { *(.stab.index) }
+  .stab.indexstr 0 : { *(.stab.indexstr) }
+  .comment 0 : { *(.comment) }
+  .debug 0 : { *(.debug) }
+  .line 0 : { *(.line) }
+
+  .debug_srcinfo 0 : { *(.debug_srcinfo) }
+  .debug_sfnames 0 : { *(.debug_sfnames) }
+
+  .debug_aranges 0 : { *(.debug_aranges) }
+  .debug_pubnames 0 : { *(.debug_pubnames) }
+
+  .debug_info 0 : { *(.debug_info .gnu.linkonce.wi.*) }
+  .debug_abbrev 0 : { *(.debug_abbrev) }
+  .debug_line 0 : { *(.debug_line) }
+  .debug_frame 0 : { *(.debug_frame) }
+  .debug_str 0 : { *(.debug_str) }
+  .debug_loc 0 : { *(.debug_loc) }
+  .debug_macinfo 0 : { *(.debug_macinfo) }
+
+  .debug_weaknames 0 : { *(.debug_weaknames) }
+  .debug_funcnames 0 : { *(.debug_funcnames) }
+  .debug_typenames 0 : { *(.debug_typenames) }
+  .debug_varnames 0 : { *(.debug_varnames) }
+
+  /DISCARD/ : { *(.note.GNU-stack) }
+  /DISCARD/ : { *(.data .data.* .gnu.linkonce.d.* .sdata*) }
+  /DISCARD/ : { *(.bss .sbss .dynbss .dynsbss) }
+}
+
+
+PHDRS
+{
+  text PT_LOAD FILEHDR PHDRS FLAGS(5); /* PF_R|PF_X */
+  note PT_NOTE FLAGS(4); /* PF_R */
+  dynamic PT_DYNAMIC FLAGS(4); /* PF_R */
+  eh_frame_hdr PT_GNU_EH_FRAME;
+}
+
+
+/*
+ * This controls what symbols we export from the DSO.
+ */
+VERSION
+{
+  VDSO_VERSION_STRING {
+    global:
+	__kernel_sigtramp_rt64;
+	__kernel_restart_syscall64;
+    local: *;
+  };
+}
diff --git a/arch/parisc/kernel/vdso64/vdso64_wrapper.S b/arch/parisc/kern=
el/vdso64/vdso64_wrapper.S
new file mode 100644
index 000000000000..66f929482d3d
=2D-- /dev/null
+++ b/arch/parisc/kernel/vdso64/vdso64_wrapper.S
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/linkage.h>
+#include <asm/page.h>
+
+	__PAGE_ALIGNED_DATA
+
+	.globl vdso64_start, vdso64_end
+	.balign PAGE_SIZE
+vdso64_start:
+	.incbin "arch/parisc/kernel/vdso64/vdso64.so"
+	.balign PAGE_SIZE
+vdso64_end:
+
+	.previous
=2D-
2.34.1


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C1C4048A5
	for <lists+linux-parisc@lfdr.de>; Thu,  9 Sep 2021 12:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbhIIKmX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 9 Sep 2021 06:42:23 -0400
Received: from mout.gmx.net ([212.227.15.19]:41791 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233716AbhIIKmW (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 9 Sep 2021 06:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1631184064;
        bh=Bl46ucmEKwKCqBLOJ+TY+sosetkwd4QIh7xIwIGr7YI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=f11GkzLPeQpGZ5ueVi50BADLCM3nI0k+OxfNp9CxoXDndACuSOdiYw6HD2JTrqNPR
         tx9Qz4J050xWDpvi+xqK0bJua/W2tgp7zFsDLkrZfOq3ibhJ1dYxSTGlXD//APf6Wv
         BZ/EgVOU7hrt49Ir/Sl5DxjOdwAIkwhtU4nqe1t0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.187.121.129]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Msq6M-1nCgBc247M-00t9Sq; Thu, 09 Sep 2021 12:41:04 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH] parisc: Implement __get/put_kernel_nofault()
Date:   Thu,  9 Sep 2021 12:39:26 +0200
Message-Id: <20210909103926.305625-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s3q62T7hXv9WcsuQySEjZQKF/+m3MUqOEhfJpyDlE8DTQR/RBcG
 MalRpyOCU0yJi+L3OKtLixYM4ugT32eBeznOUcg+1oZTVXYHdQSEHwthKjuwawzCNchH0oj
 pyvdjykOjKGG/RYgBonrWTcoEsTcYXe0P7VRuRE1F0KEMCGa5sfq4+Rle0rgulmv+8YXHLh
 8FX4ibT3Ia7XTlnpdCyXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AWO7KgHNyXg=:lNDBs3Ty+TGBuZDgChbDTL
 arL5sLQ6z1RGi6IEslTauvpYiQo/ly8QkatWolmSi6l7yjpMpSChwoIoZtV96CMYCNVdMl34g
 2TTKAyeXC11XKZGhONVcGkf2Pj8wYCCj8nR34hPqeto8rPn3qkSVs8rHCIMjXDuoM2ieEU1xd
 uTq5Ks8O/yDf7luzXlx+hamOf8eAGPim9KSDCISwTt5JZQTgQUWDU5IJRhNw3ZKtnF9Hjq3bT
 fH9dD37VNygmN+Tnf1kyXteh25SCks0qlAy+I2LcczRbUHHG2U0qXKtHOFX963yzgQgedUBfm
 1x+5NCHxoJ6iWmVcH9YjFSgnPDHp2EfR/n0z/XKLmiHY5Cf9q5Tg8kJQW0OeDCJzy77IKa2JF
 f50NeXh9iSb69ttbT94EeZaaoarIDpVk07YZ1kgP9s6jkpcEZqiV9ZS0JlCmeyBOz0LWfzIXP
 tR/nKJDUBy1VJXc0pqVwAXojMCV/pktx9S4cr9RIR/GaLPxSUw3Kcn5k9IFiOb/1gHpJzK7b3
 UREn8XhxcJwUpCJx6cjGDOHstE2M45WuvdTAD7u+7LZbupy42KcuenGqbffk+h1aldV3lPLCm
 CrHInY2hZHoNEUNdCJUW8OvT7YML43V4AGgLR9yUt3xxiebwADOfI/qrfqyvcgNsOK71Yun3p
 Recd9D5umZEZA+bdIrJtMaTFQZ3HifZqvKxCzhl5UR8WLxXnEKG21myNlLiHR61za5+syOjsj
 S7wOEC9hPyPssVS6Nj7cnZ4u4lwFp/oYFZEK7PcGx08fyyr0Tl5VVE+KxMerDoNrixJNEwJ5y
 ipw0vtNSw/Skm0c6YkQZieuuD//QXvxuwHHUiTvOyW3YCAaWOvGCdBx8y9lSZ1zHcmMnUhEwU
 hOruqrzOp20bG3T1yxt+l/fnq95qtjSartJewtKuOrtWy4WdfZxDobCfX4t2428FvN8NF2slO
 PH7T3RRHoUlP9hf3UteaJqed3AHaR1cW9oeLhpoAtdsutmBorZn2rXjVBTWRVBXfB+hik/Dby
 hS/5N82jTGIJfZMpFnumulRbA5sjIIGGacsc+yAayWOJZ/M5awGqQO5jpJPhMu/0OyihF3lFw
 H5PZ4t+vDM/zkA=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Remove CONFIG_SET_FS from parisc, so we need to add
__get_kernel_nofault() and __put_kernel_nofault(), define
HAVE_GET_KERNEL_NOFAULT and remove set_fs(), get_fs(), load_sr2(),
thread_info->addr_limit, KERNEL_DS and USER_DS.

The nice side-effect of this patch is that we now can directly access
userspace via sr3 without the need to use a temporary sr2 which is
either copied from sr3 or set to zero (for kernel space).

Signed-off-by: Helge Deller <deller@gmx.de>
Suggested-by: Arnd Bergmann <arnd@kernel.org>
=2D--
 arch/parisc/Kconfig                   |   1 -
 arch/parisc/include/asm/processor.h   |   4 -
 arch/parisc/include/asm/thread_info.h |   2 -
 arch/parisc/include/asm/uaccess.h     | 122 +++++++++++++-------------
 arch/parisc/kernel/asm-offsets.c      |   1 -
 arch/parisc/lib/lusercopy.S           |  18 +---
 6 files changed, 62 insertions(+), 86 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 3ae71994399c..b5bc346d464a 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -64,7 +64,6 @@ config PARISC
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select HAVE_SOFTIRQ_ON_OWN_STACK if IRQSTACKS
-	select SET_FS

 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm=
/processor.h
index b5fbcd2c1780..eeb7da064289 100644
=2D-- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -101,10 +101,6 @@ DECLARE_PER_CPU(struct cpuinfo_parisc, cpu_data);

 #define CPU_HVERSION ((boot_cpu_data.hversion >> 4) & 0x0FFF)

-typedef struct {
-	int seg;
-} mm_segment_t;
-
 #define ARCH_MIN_TASKALIGN	8

 struct thread_struct {
diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/a=
sm/thread_info.h
index 0bd38a972cea..00ad50fef769 100644
=2D-- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -11,7 +11,6 @@
 struct thread_info {
 	struct task_struct *task;	/* main task structure */
 	unsigned long flags;		/* thread_info flags (see TIF_*) */
-	mm_segment_t addr_limit;	/* user-level address space limit */
 	__u32 cpu;			/* current CPU */
 	int preempt_count;		/* 0=3Dpremptable, <0=3DBUG; will also serve as bh-c=
ounter */
 };
@@ -21,7 +20,6 @@ struct thread_info {
 	.task		=3D &tsk,			\
 	.flags		=3D 0,			\
 	.cpu		=3D 0,			\
-	.addr_limit	=3D KERNEL_DS,		\
 	.preempt_count	=3D INIT_PREEMPT_COUNT,	\
 }

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/u=
access.h
index a4368731f2b4..8b965f961eda 100644
=2D-- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -11,14 +11,6 @@
 #include <linux/bug.h>
 #include <linux/string.h>

-#define KERNEL_DS	((mm_segment_t){0})
-#define USER_DS 	((mm_segment_t){1})
-
-#define uaccess_kernel() (get_fs().seg =3D=3D KERNEL_DS.seg)
-
-#define get_fs()	(current_thread_info()->addr_limit)
-#define set_fs(x)	(current_thread_info()->addr_limit =3D (x))
-
 /*
  * Note that since kernel addresses are in a separate address space on
  * parisc, we don't need to do anything for access_ok().
@@ -33,11 +25,11 @@
 #define get_user __get_user

 #if !defined(CONFIG_64BIT)
-#define LDD_USER(val, ptr)	__get_user_asm64(val, ptr)
-#define STD_USER(x, ptr)	__put_user_asm64(x, ptr)
+#define LDD_USER(sr, val, ptr)	__get_user_asm64(sr, val, ptr)
+#define STD_USER(sr, x, ptr)	__put_user_asm64(sr, x, ptr)
 #else
-#define LDD_USER(val, ptr)	__get_user_asm(val, "ldd", ptr)
-#define STD_USER(x, ptr)	__put_user_asm("std", x, ptr)
+#define LDD_USER(sr, val, ptr)	__get_user_asm(sr, val, "ldd", ptr)
+#define STD_USER(sr, x, ptr)	__put_user_asm(sr, "std", x, ptr)
 #endif

 /*
@@ -67,28 +59,15 @@ struct exception_table_entry {
 #define ASM_EXCEPTIONTABLE_ENTRY_EFAULT( fault_addr, except_addr )\
 	ASM_EXCEPTIONTABLE_ENTRY( fault_addr, except_addr + 1)

-/*
- * load_sr2() preloads the space register %%sr2 - based on the value of
- * get_fs() - with either a value of 0 to access kernel space (KERNEL_DS =
which
- * is 0), or with the current value of %%sr3 to access user space (USER_D=
S)
- * memory. The following __get_user_asm() and __put_user_asm() functions =
have
- * %%sr2 hard-coded to access the requested memory.
- */
-#define load_sr2() \
-	__asm__(" or,=3D  %0,%%r0,%%r0\n\t"	\
-		" mfsp %%sr3,%0\n\t"		\
-		" mtsp %0,%%sr2\n\t"		\
-		: : "r"(get_fs()) : )
-
-#define __get_user_internal(val, ptr)			\
+#define __get_user_internal(sr, val, ptr)		\
 ({							\
 	register long __gu_err __asm__ ("r8") =3D 0;	\
 							\
 	switch (sizeof(*(ptr))) {			\
-	case 1: __get_user_asm(val, "ldb", ptr); break;	\
-	case 2: __get_user_asm(val, "ldh", ptr); break; \
-	case 4: __get_user_asm(val, "ldw", ptr); break; \
-	case 8: LDD_USER(val, ptr); break;		\
+	case 1: __get_user_asm(sr, val, "ldb", ptr); break; \
+	case 2: __get_user_asm(sr, val, "ldh", ptr); break; \
+	case 4: __get_user_asm(sr, val, "ldw", ptr); break; \
+	case 8: LDD_USER(sr, val, ptr); break;		\
 	default: BUILD_BUG();				\
 	}						\
 							\
@@ -97,15 +76,14 @@ struct exception_table_entry {

 #define __get_user(val, ptr)				\
 ({							\
-	load_sr2();					\
-	__get_user_internal(val, ptr);			\
+	__get_user_internal("%%sr3,", val, ptr);	\
 })

-#define __get_user_asm(val, ldx, ptr)			\
+#define __get_user_asm(sr, val, ldx, ptr)		\
 {							\
 	register long __gu_val;				\
 							\
-	__asm__("1: " ldx " 0(%%sr2,%2),%0\n"		\
+	__asm__("1: " ldx " 0(" sr "%2),%0\n"		\
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
 		: "=3Dr"(__gu_val), "=3Dr"(__gu_err)        \
@@ -114,9 +92,22 @@ struct exception_table_entry {
 	(val) =3D (__force __typeof__(*(ptr))) __gu_val;	\
 }

+#define HAVE_GET_KERNEL_NOFAULT
+#define __get_kernel_nofault(dst, src, type, err_label)	\
+{							\
+	type __z;					\
+	long __err;					\
+	__err =3D __get_user_internal("", __z, (type *)(src)); \
+	if (unlikely(__err))				\
+		goto err_label;				\
+	else						\
+		*(type *)(dst) =3D __z;			\
+}
+
+
 #if !defined(CONFIG_64BIT)

-#define __get_user_asm64(val, ptr)			\
+#define __get_user_asm64(sr, val, ptr)			\
 {							\
 	union {						\
 		unsigned long long	l;		\
@@ -124,8 +115,8 @@ struct exception_table_entry {
 	} __gu_tmp;					\
 							\
 	__asm__("   copy %%r0,%R0\n"			\
-		"1: ldw 0(%%sr2,%2),%0\n"		\
-		"2: ldw 4(%%sr2,%2),%R0\n"		\
+		"1: ldw 0(" sr "%2),%0\n"		\
+		"2: ldw 4(" sr "%2),%R0\n"		\
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)	\
@@ -138,16 +129,16 @@ struct exception_table_entry {
 #endif /* !defined(CONFIG_64BIT) */


-#define __put_user_internal(x, ptr)				\
+#define __put_user_internal(sr, x, ptr)				\
 ({								\
 	register long __pu_err __asm__ ("r8") =3D 0;      	\
         __typeof__(*(ptr)) __x =3D (__typeof__(*(ptr)))(x);	\
 								\
 	switch (sizeof(*(ptr))) {				\
-	case 1: __put_user_asm("stb", __x, ptr); break;		\
-	case 2: __put_user_asm("sth", __x, ptr); break;		\
-	case 4: __put_user_asm("stw", __x, ptr); break;		\
-	case 8: STD_USER(__x, ptr); break;			\
+	case 1: __put_user_asm(sr, "stb", __x, ptr); break;	\
+	case 2: __put_user_asm(sr, "sth", __x, ptr); break;	\
+	case 4: __put_user_asm(sr, "stw", __x, ptr); break;	\
+	case 8: STD_USER(sr, __x, ptr); break;			\
 	default: BUILD_BUG();					\
 	}							\
 								\
@@ -156,10 +147,20 @@ struct exception_table_entry {

 #define __put_user(x, ptr)					\
 ({								\
-	load_sr2();						\
-	__put_user_internal(x, ptr);				\
+	__put_user_internal("%%sr3,", x, ptr);			\
 })

+#define __put_kernel_nofault(dst, src, type, err_label)		\
+{								\
+	type __z =3D *(type *)(src);				\
+	long __err;						\
+	__err =3D __put_user_internal("", __z, (type *)(dst));	\
+	if (unlikely(__err))					\
+		goto err_label;					\
+}
+
+
+

 /*
  * The "__put_user/kernel_asm()" macros tell gcc they read from memory
@@ -170,26 +171,26 @@ struct exception_table_entry {
  * r8 is already listed as err.
  */

-#define __put_user_asm(stx, x, ptr)                         \
-	__asm__ __volatile__ (                              \
-		"1: " stx " %2,0(%%sr2,%1)\n"		    \
-		"9:\n"					    \
-		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	    \
-		: "=3Dr"(__pu_err)                            \
+#define __put_user_asm(sr, stx, x, ptr)				\
+	__asm__ __volatile__ (					\
+		"1: " stx " %2,0(" sr "%1)\n"			\
+		"9:\n"						\
+		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
+		: "=3Dr"(__pu_err)				\
 		: "r"(ptr), "r"(x), "0"(__pu_err))


 #if !defined(CONFIG_64BIT)

-#define __put_user_asm64(__val, ptr) do {	    	    \
-	__asm__ __volatile__ (				    \
-		"1: stw %2,0(%%sr2,%1)\n"		    \
-		"2: stw %R2,4(%%sr2,%1)\n"		    \
-		"9:\n"					    \
-		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	    \
-		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)	    \
-		: "=3Dr"(__pu_err)                            \
-		: "r"(ptr), "r"(__val), "0"(__pu_err));	    \
+#define __put_user_asm64(sr, __val, ptr) do {			\
+	__asm__ __volatile__ (					\
+		"1: stw %2,0(" sr "%1)\n"			\
+		"2: stw %R2,4(" sr "%1)\n"			\
+		"9:\n"						\
+		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
+		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)		\
+		: "=3Dr"(__pu_err)				\
+		: "r"(ptr), "r"(__val), "0"(__pu_err));		\
 } while (0)

 #endif /* !defined(CONFIG_64BIT) */
@@ -200,12 +201,11 @@ struct exception_table_entry {
  */

 extern long strncpy_from_user(char *, const char __user *, long);
-extern unsigned lclear_user(void __user *, unsigned long);
+extern __must_check unsigned lclear_user(void __user *, unsigned long);
 extern __must_check long strnlen_user(const char __user *src, long n);
 /*
  * Complex access routines -- macros
  */
-#define user_addr_max() (~0UL)

 #define clear_user lclear_user
 #define __clear_user lclear_user
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-off=
sets.c
index 33113ba24054..22924a3f1728 100644
=2D-- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -230,7 +230,6 @@ int main(void)
 	DEFINE(TI_TASK, offsetof(struct thread_info, task));
 	DEFINE(TI_FLAGS, offsetof(struct thread_info, flags));
 	DEFINE(TI_CPU, offsetof(struct thread_info, cpu));
-	DEFINE(TI_SEGMENT, offsetof(struct thread_info, addr_limit));
 	DEFINE(TI_PRE_COUNT, offsetof(struct thread_info, preempt_count));
 	DEFINE(THREAD_SZ, sizeof(struct thread_info));
 	/* THREAD_SZ_ALGN includes space for a stack frame. */
diff --git a/arch/parisc/lib/lusercopy.S b/arch/parisc/lib/lusercopy.S
index 0aad5ce89f4d..b428d29e45fb 100644
=2D-- a/arch/parisc/lib/lusercopy.S
+++ b/arch/parisc/lib/lusercopy.S
@@ -27,21 +27,6 @@
 #include <asm/errno.h>
 #include <linux/linkage.h>

-	/*
-	 * get_sr gets the appropriate space value into
-	 * sr1 for kernel/user space access, depending
-	 * on the flag stored in the task structure.
-	 */
-
-	.macro  get_sr
-	mfctl       %cr30,%r1
-	ldw         TI_SEGMENT(%r1),%r22
-	mfsp        %sr3,%r1
-	or,<>       %r22,%r0,%r0
-	copy        %r0,%r1
-	mtsp        %r1,%sr1
-	.endm
-
 	/*
 	 * unsigned long lclear_user(void *to, unsigned long n)
 	 *
@@ -51,10 +36,9 @@

 ENTRY_CFI(lclear_user)
 	comib,=3D,n   0,%r25,$lclu_done
-	get_sr
 $lclu_loop:
 	addib,<>    -1,%r25,$lclu_loop
-1:      stbs,ma     %r0,1(%sr1,%r26)
+1:	stbs,ma     %r0,1(%sr3,%r26)

 $lclu_done:
 	bv          %r0(%r2)
=2D-
2.31.1


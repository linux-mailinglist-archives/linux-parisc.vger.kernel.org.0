Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150AF40436A
	for <lists+linux-parisc@lfdr.de>; Thu,  9 Sep 2021 04:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349651AbhIICGI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Sep 2021 22:06:08 -0400
Received: from mout.gmx.net ([212.227.17.22]:37021 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236229AbhIICGH (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Sep 2021 22:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1631153084;
        bh=POceC1FTQmESqnUrjAaTs015lLoQrENM3QfVM5zUiEY=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=M17jXpSJbd9tzXyajx/mBRpMIZ185GgGKYsfdzIUaWC4gYkbv0+1ZV488RH3zXEJ+
         F5q3lk4TC/an6KHITQ3vm+ctJgF0PcrqqPxQTj6wGxFAIU1CBMoXbHJ2STX3Yu6HQv
         P2Go81Jw8Cr/AQCUaji3X6H/bgz54EPj1cDB7dt0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([80.187.121.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6Zq-1msXxa1iKU-00hccE; Thu, 09
 Sep 2021 04:04:44 +0200
Date:   Thu, 9 Sep 2021 04:03:06 +0200
From:   Helge Deller <deller@gmx.de>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/4] parisc: Drop strnlen_user() in favour of generic
 version
Message-ID: <YTlrWrItSwR4cN3u@ls3530>
References: <20210908204405.127665-1-deller@gmx.de>
 <CAK8P3a1-ajAFtO5zE396DBPUzssdas5o+adsEDtAK58X1ZAU7w@mail.gmail.com>
 <97d4c69c-59ff-8e28-0cfe-50908b999729@gmx.de>
 <CAK8P3a0wkfWsz7a91Qf--+BDDWKmYyBC4wkBEnbehWu1vGXEZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0wkfWsz7a91Qf--+BDDWKmYyBC4wkBEnbehWu1vGXEZQ@mail.gmail.com>
X-Provags-ID: V03:K1:6HO/VeMvWaAP+To7gHUfXhFaYV4KrZsF9V6IrkQH0eov+8Mf+v1
 FY0CYG4/6MFrgHKZU7gUBfSGViiFQqArcczS4KnmcQNCRKfkxUDX3QvR4elFcCbsN4ac6sS
 o7Cs+CPp+2B0whhIC6w43mQUBHdKiFN/+JvhfyRDNFOoT8tRd+o6PPVyNiFuVv3t1/NgxSL
 TXKEXnEscFDOpTOy2mFVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7rrvBUejlJk=:nZ6p5hJTBSi9MKUpUHOUBS
 XsWhPMO0E8ZoY5h1Lj1ZvdGBtNlTMxq5YHqPBWpGKdgbC2xFt3m8zSBH/oO3UP6kmjr/QGaXQ
 CMmsQEWceepdO7CQFphu4B0CbQsMi2RbYsHOQjffffmnKMjthmIlYagxooI2dv5sU4b194Zax
 yZU5PU7saQAV1Euw4A1GJamIZDtdE+gKH2KFNOqcuQUtbhrNYPwhvPqXf4ZPe7nancEidB8mW
 KBuc0L1bDLlTUOplt5uYQdBlCLn+s1mOQeKQktZ1xIyhtQqm7rbfDlMkymf+KC4LxsWdgF1cQ
 fCTV0/4S/kKbuLuV/bTg9bDEmF/bbNp8acwXN66e/Ca3SzesIwI9KKJYfBWwb/0H2lKnsuMHh
 ZCWXIcGvhEdnAhAZ2w7kj46BOsurPkF0fDi3S7/yODYmpstK53MZGAq3yshDEBG/D7IPNpRBr
 saLiH0htFdTEmPJhlNYS7WFoJxb8t2UcD9LzjfbyvFJukryBq7qr3vefumwuX2o8ueVi9mb7T
 VnQgQ731SNzyZ+hCqSIPSiNY9Uktq0Uk1V4meeOH8zMz9de7QoNWocmE3T3oQh3qthiWOzaSp
 5PER2T3Xsc8OYIprmuc6aAcBUE5zvqHhSBl13KCRdQTzRmE9qp/wn68Yc8NH+BtZLVSoTLpEX
 W8kNzvK8yvV4JkEc8X+tuG/JILk+u0zd+aa/Cwg91cGKM/J7jj22BFDJHO2lHBatpmJcpmEaH
 PyfCzYh04YzWvDty3sYtC4WHAGrMV0HXUnZjpO/37Z0UwVeBTBUwnxIEPzH26rmRkfX1nP6FX
 bvf6fb9a8HWnC2RffVN32l2QtPYlinVbsT11h2YI3KhQrT/TFUkDTMBFlDnXqWuAzWb9Uan+r
 vgk7nfagb5G3RghNZ5GqpM0PxE9dBjnsXo8xIQvGfYNQkGTL6M4tKt5sRUn3brWtRviPGTVlp
 denXMUBLKu1+RfmzL7SDHRDO30OuGK5B6YAN59lSvjWZOUrfbmEbPmofaTXKu/p8VdYioghy/
 xgtu19EomczraNincp4DpPTmy3OYq77I6FP5vEeEsYJyWgqxKgF6qs/NhCyGljw+zJpxcfwd9
 Fotx8R3nB2DAI0=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* Arnd Bergmann <arnd@kernel.org>:
> On Wed, Sep 8, 2021 at 11:40 PM Helge Deller <deller@gmx.de> wrote:
> > On 9/8/21 11:26 PM, Arnd Bergmann wrote:
> > >>   /*
> > >>    * Complex access routines -- macros
> > >>    */
> > >> -#define user_addr_max() (~0UL)
> > >> +#define user_addr_max() (uaccess_kernel() ? ~0UL : TASK_SIZE)
> >
> > I noticed that our user_addr_max() was actually wrong.
> > It's used in the generic strnlen_user() so fixing it seemed appropriat=
e.
>
> The user_addr_max() definition should match what you do in access_ok()
> for USER_DS though, which is a nop on architectures that have split user
> address space, so I think the ~0UL was correct here.
>
> No matter what the arguments are, there is no danger of spilling over
> into kernel space, which is what the user_addr_max() check is trying
> to prevent on other architectures.
>
> > > We are getting very close to completely removing set_fs()/get_fs(),
> > > uaccess_kernel() and some related bits from the kernel, so I think
> > > it would be better to the other way here and finish off removing
> > > CONFIG_SET_FS from parisc.
> > >
> > > I think this will also simplify your asm/uaccess.h a lot, in particu=
lar
> > > since it has separate address spaces for __get_user() and
> > > __get_kernel_nofault(), and without set_fs() you can leave out
> > > the runtime conditional to switch between them.
> >
> > That's a good idea and should probably be done.
> > Do you have some pointers where to start, e.g. initial commits from ot=
her arches ?
>
> Russell just merged my series for arch/arm in linux-5.15, you
> can look at that but it's probably easier for parisc.
>
> I think the only part you need to add is __get_kernel_nofault()
> and __put_kernel_nofault(). You can see in mm/maccess.c
> what the difference between the two versions in there is.
>
> Once you have those, you define HAVE_GET_KERNEL_NOFAULT
> and then remove CONFIG_SET_FS, set_fs(), get_fs(), load_sr2(),
> thread_info->addr_limit, KERNEL_DS, and USER_DS.

Thanks for those hints!
The attached initial patch below seems to work, it boots into systemd.
It needs further cleanups though.

I wonder if you should add a workaround for 32-bit kernels
to not copy 64bit-wise, see my patch below in
copy_from_kernel_nofault():

-       copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
+       /* avoid 64-bit accesses on 32-bit platforms */
+       if (sizeof(unsigned long) > 4)
+               copy_from_kernel_nofault_loop(dst, src, size, u64, Efault)=
;

Helge

=2D--

[PATCH] parisc: Implement __get/put_kernel_nofault()

Add __get_kernel_nofault() and __put_kernel_nofault(), define
HAVE_GET_KERNEL_NOFAULT and remove CONFIG_SET_FS, set_fs(), get_fs(),
load_sr2(), thread_info->addr_limit, KERNEL_DS, and USER_DS.

Signed-off-by: Helge Deller <deller@gmx.de>
Suggested-by: Arnd Bergmann <arnd@kernel.org>

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
index a4368731f2b4..6e0ca7756ceb 100644
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
+#define LDD_USER(sr, val, ptr, err_label)	__get_user_asm64(sr, val, ptr, =
err_label)
+#define STD_USER(sr, x, ptr, err_label)		__put_user_asm64(sr, x, ptr, err=
_label)
 #else
-#define LDD_USER(val, ptr)	__get_user_asm(val, "ldd", ptr)
-#define STD_USER(x, ptr)	__put_user_asm("std", x, ptr)
+#define LDD_USER(sr, val, ptr, err_label)	__get_user_asm(sr, val, "ldd", =
ptr, err_label)
+#define STD_USER(sr, x, ptr, err_label)		__put_user_asm(sr, "std", x, ptr=
, err_label)
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
+#define __get_user_internal(sr, val, ptr, err_label)	\
 ({							\
 	register long __gu_err __asm__ ("r8") =3D 0;	\
 							\
 	switch (sizeof(*(ptr))) {			\
-	case 1: __get_user_asm(val, "ldb", ptr); break;	\
-	case 2: __get_user_asm(val, "ldh", ptr); break; \
-	case 4: __get_user_asm(val, "ldw", ptr); break; \
-	case 8: LDD_USER(val, ptr); break;		\
+	case 1: __get_user_asm(sr, val, "ldb", ptr, err_label); break;	\
+	case 2: __get_user_asm(sr, val, "ldh", ptr, err_label); break;	\
+	case 4: __get_user_asm(sr, val, "ldw", ptr, err_label); break;	\
+	case 8: LDD_USER(sr, val, ptr, err_label); break;		\
 	default: BUILD_BUG();				\
 	}						\
 							\
@@ -97,26 +76,38 @@ struct exception_table_entry {

 #define __get_user(val, ptr)				\
 ({							\
-	load_sr2();					\
-	__get_user_internal(val, ptr);			\
+	__get_user_internal("%%sr3,", val, ptr, 9b);	\
 })

-#define __get_user_asm(val, ldx, ptr)			\
+#define __get_user_asm(sr, val, ldx, ptr, err_label)	\
 {							\
 	register long __gu_val;				\
 							\
-	__asm__("1: " ldx " 0(%%sr2,%2),%0\n"		\
+	__asm__("1: " ldx " 0(" sr "%2),%0\n"		\
 		"9:\n"					\
-		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
+		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, err_label) \
 		: "=3Dr"(__gu_val), "=3Dr"(__gu_err)        \
 		: "r"(ptr), "1"(__gu_err));		\
 							\
 	(val) =3D (__force __typeof__(*(ptr))) __gu_val;	\
 }

+#define HAVE_GET_KERNEL_NOFAULT
+#define __get_kernel_nofault(dst, src, type, err_label)	\
+{							\
+	type __z;					\
+	long __err;					\
+	__err =3D __get_user_internal("", __z, (type *)(src), 9b); \
+	if (unlikely(__err))				\
+		goto err_label;				\
+	else						\
+		*(type *)(dst) =3D __z;			\
+}
+
+
 #if !defined(CONFIG_64BIT)

-#define __get_user_asm64(val, ptr)			\
+#define __get_user_asm64(sr, val, ptr, err_label)		\
 {							\
 	union {						\
 		unsigned long long	l;		\
@@ -124,11 +115,11 @@ struct exception_table_entry {
 	} __gu_tmp;					\
 							\
 	__asm__("   copy %%r0,%R0\n"			\
-		"1: ldw 0(%%sr2,%2),%0\n"		\
-		"2: ldw 4(%%sr2,%2),%R0\n"		\
+		"1: ldw 0(" sr "%2),%0\n"		\
+		"2: ldw 4(" sr "%2),%R0\n"		\
 		"9:\n"					\
-		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
-		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)	\
+		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, err_label) \
+		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, err_label) \
 		: "=3D&r"(__gu_tmp.l), "=3Dr"(__gu_err)	\
 		: "r"(ptr), "1"(__gu_err));		\
 							\
@@ -138,16 +129,16 @@ struct exception_table_entry {
 #endif /* !defined(CONFIG_64BIT) */


-#define __put_user_internal(x, ptr)				\
+#define __put_user_internal(sr, x, ptr, err_label)			\
 ({								\
 	register long __pu_err __asm__ ("r8") =3D 0;      	\
         __typeof__(*(ptr)) __x =3D (__typeof__(*(ptr)))(x);	\
 								\
 	switch (sizeof(*(ptr))) {				\
-	case 1: __put_user_asm("stb", __x, ptr); break;		\
-	case 2: __put_user_asm("sth", __x, ptr); break;		\
-	case 4: __put_user_asm("stw", __x, ptr); break;		\
-	case 8: STD_USER(__x, ptr); break;			\
+	case 1: __put_user_asm(sr, "stb", __x, ptr, err_label); break; \
+	case 2: __put_user_asm(sr, "sth", __x, ptr, err_label); break; \
+	case 4: __put_user_asm(sr, "stw", __x, ptr, err_label); break; \
+	case 8: STD_USER(sr, __x, ptr, err_label); break;		\
 	default: BUILD_BUG();					\
 	}							\
 								\
@@ -156,10 +147,20 @@ struct exception_table_entry {

 #define __put_user(x, ptr)					\
 ({								\
-	load_sr2();						\
-	__put_user_internal(x, ptr);				\
+	__put_user_internal("%%sr3,", x, ptr, 9b);		\
 })

+#define __put_kernel_nofault(dst, src, type, err_label)		\
+{								\
+	type __z =3D *(type *)(src);				\
+	long __err;						\
+	__err =3D __put_user_internal("", __z, (type *)(dst), 9b);\
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
+#define __put_user_asm(sr, stx, x, ptr, err_label)		\
+	__asm__ __volatile__ (					\
+		"1: " stx " %2,0(" sr "%1)\n"			\
+		"9:\n"						\
+		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, err_label)	\
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
+#define __put_user_asm64(sr, __val, ptr, err_label) do {	\
+	__asm__ __volatile__ (					\
+		"1: stw %2,0(" sr "%1)\n"			\
+		"2: stw %R2,4(" sr "%1)\n"			\
+		"9:\n"						\
+		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, err_label)	\
+		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, err_label)	\
+		: "=3Dr"(__pu_err)				\
+		: "r"(ptr), "r"(__val), "0"(__pu_err));		\
 } while (0)

 #endif /* !defined(CONFIG_64BIT) */
@@ -205,7 +206,6 @@ extern __must_check long strnlen_user(const char __use=
r *src, long n);
 /*
  * Complex access routines -- macros
  */
-#define user_addr_max() (~0UL)

 #define clear_user lclear_user
 #define __clear_user lclear_user
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-off=
sets.c
index 33113ba24054..7c83915e4aed 100644
=2D-- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -230,7 +230,7 @@ int main(void)
 	DEFINE(TI_TASK, offsetof(struct thread_info, task));
 	DEFINE(TI_FLAGS, offsetof(struct thread_info, flags));
 	DEFINE(TI_CPU, offsetof(struct thread_info, cpu));
-	DEFINE(TI_SEGMENT, offsetof(struct thread_info, addr_limit));
+//	DEFINE(TI_SEGMENT, offsetof(struct thread_info, addr_limit));
 	DEFINE(TI_PRE_COUNT, offsetof(struct thread_info, preempt_count));
 	DEFINE(THREAD_SZ, sizeof(struct thread_info));
 	/* THREAD_SZ_ALGN includes space for a stack frame. */
diff --git a/arch/parisc/lib/lusercopy.S b/arch/parisc/lib/lusercopy.S
index 0aad5ce89f4d..29eafd963ac0 100644
=2D-- a/arch/parisc/lib/lusercopy.S
+++ b/arch/parisc/lib/lusercopy.S
@@ -34,11 +34,11 @@
 	 */

 	.macro  get_sr
-	mfctl       %cr30,%r1
-	ldw         TI_SEGMENT(%r1),%r22
+//	mfctl       %cr30,%r1
+//	ldw         TI_SEGMENT(%r1),%r22
 	mfsp        %sr3,%r1
-	or,<>       %r22,%r0,%r0
-	copy        %r0,%r1
+//	or,<>       %r22,%r0,%r0
+//	copy        %r0,%r1
 	mtsp        %r1,%sr1
 	.endm

diff --git a/mm/maccess.c b/mm/maccess.c
index 3bd70405f2d8..85eb86d6cab4 100644
=2D-- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -28,7 +28,9 @@ long copy_from_kernel_nofault(void *dst, const void *src=
, size_t size)
 		return -ERANGE;

 	pagefault_disable();
-	copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
+	/* avoid 64-bit accesses on 32-bit platforms */
+	if (sizeof(unsigned long) > 4)
+		copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
 	copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
 	copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
 	copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
@@ -51,7 +53,9 @@ EXPORT_SYMBOL_GPL(copy_from_kernel_nofault);
 long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
 {
 	pagefault_disable();
-	copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
+	/* avoid 64-bit accesses on 32-bit platforms */
+	if (sizeof(unsigned long) > 4)
+		copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
 	copy_to_kernel_nofault_loop(dst, src, size, u32, Efault);
 	copy_to_kernel_nofault_loop(dst, src, size, u16, Efault);
 	copy_to_kernel_nofault_loop(dst, src, size, u8, Efault);


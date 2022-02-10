Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9BD84B1462
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Feb 2022 18:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245238AbiBJRhz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Feb 2022 12:37:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245229AbiBJRhz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Feb 2022 12:37:55 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F12C21B7
        for <linux-parisc@vger.kernel.org>; Thu, 10 Feb 2022 09:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644514668;
        bh=m/JvWINRLpXiPkmSIZsP3KM5BUHSZ9RFbSg4LmkkktE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=GyKkwmovle63BK5VyvYPNVGod6IoaCA7JGqrOeYt8JA4V5i0VhUC43VGFzPtNcL6F
         IuC20RkXXo5OduxwnJ354ke8X4nJc6uVkOS/tOjClzifCfzx7y3MhRMKe0iPxTR2Qn
         5841jShBDrhuZ3kTDvSLzBGimouOThIA/AANPaSo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.179.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIdeX-1nU5Ll2nMj-00Ec3w; Thu, 10
 Feb 2022 18:37:48 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix some apparent put_user() failures
Date:   Thu, 10 Feb 2022 18:37:47 +0100
Message-Id: <20220210173747.217574-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AAEn2+x36D6pMVjU9bZbuBiAUaL7mVsHr1YOkJ7tSM6u57eaHQS
 XS8cf3xgAkhWBulPZYS8VSs5hhVqrgytjSR2QKzAkrJ4s/1Wq4gG3iHp7yDTmPgVa/KHuYv
 udxcrK0OQDCQ+lQZ9ujrqO7OJayleBtZvsyq1q4lvqFYS4wwzjvYhWn83nTOF/c37eNm79P
 TWof4nQmZwEP48LoNzTKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OQDpLH+g8+Q=:MGxg0uMajicqTDhN2n2Lnu
 06ua/mfsdLgzf6qTqCX6kCX7VBNhoDJQYOzqA3f/Ren5McGOfn7XGcW1ChxyvppNBJ/bPIFNP
 06G1IOY7kp9jBgsqJVh45z7BDV6Pw+U9i3NU36rGv4IbP/v7+EWzKAUWkMGKFIzXq2bKMiISC
 ascVzIuZZKzHjdD2cnfFWoNIVz/7wa7kgYPiAcEnKApkaaR4YHbQ7pUWcSTZ9pvVc38yMyfKA
 G0ibQoGap/tmBAQUJPxla/YxWpux87EbJkXTwQm3nzBbcszdHkB+dq+6VsCJHm3EsBs1KvR7+
 AOIQf0kPnmtxFEVi6fQAjK62haCKJXcs45Xn9hRPQqucptTt1vdI1CEUmYGTYQpYnDObTPoLq
 UroeHNb3SCAPwaGu09oF09eE5of3e0yBRFEayYYDx1PK5O1CCjDHMNH7Z20nsI38k0LsenYfm
 WntGFLq+iijZx3nChfTzNxCJferlT5JywMzw3h8fZoA7C+F3VUAov2UvZNDR6JVbU4ZyL7tTl
 alNEf3q1pP8pJUR6yzDUaRMMrjJjv8NH/VmJlbhEn+Mw1ecl8Ay+IpiWcM0wDUabDwbmUoNzY
 qRNqQqXa7QOTZjJ806m32mjsJZFhH05Hq0E3kxSeASTejqzj23zlbgBjdvUXbesYvdWxYCF/N
 8RqqRieOYUBjXqApgm/cCsQItribb1GBop9623fCV/4cQqKfyvqV+gm48TXmgjmZggkq5sKct
 T5aFnAOMCv4960+FRjct0MAStTp5jBb0vRdoBy1863Gcr9mld960GbchLmRluj1AC7bdCxIJ3
 UiYGE0cBZGJqVkXUugsKOQMavZ+N18VPwZbc7ScLRdfNQq/Rzo9E/A9NJsYO1jiWR2XFn2s3+
 K46iHJMzIFwLDCghpneUzfl3ygKhTYxV6Arn+7P6eez08OWrdIzOFq87BPnQVI/vHZeOIoCvM
 KdWBJCgUr/1V2AHHKIcz+YQrj5OJiBWcuXYAMSIQby7gFHLoNJspMO+YVqRJL6pmSqIPZWDxg
 pGIOM9DPhosJuAMcNmHZRaKruwumcMor22lO1pwPWNpB61WdIflU0wer2OoRM+cREvhi/aCMT
 OTVcOdKjkyqDWw=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

After commit 4b9d2a731c3d ("parisc: Switch user access functions
to signal errors in r29 instead of r8") bash suddenly started
to report those warnings after login:

-bash: cannot set terminal process group (-1): Bad file descriptor
-bash: no job control in this shell

It turned out, that a function call inside a put_user(), e.g.:
put_user(vt_do_kdgkbmode(console), (int __user *)arg);
clobbered the error register (r29) and thus the put_user() call itself
seem to have failed. Rearranging the C instructions didn't helped,
because then sometimes the compiler choosed another register which would
break the fault handler.

This patch now takes another and much smarter approach.

Instead of hardcoding a specific register as fault register, leave the
decision up to the compiler. In the load/store assembly we initialize
this register with zero by using "copy %%r0,reg".

In case a fault happens, the fault handler will now read this copy
instruction, extract the used fault register and store the -EFAULT
failure code in it.

Reported-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: 4b9d2a731c3d ("parisc: Switch user access functions to signal error=
s in r29 instead of r8")
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/uaccess.h | 35 ++++++++++++++++---------------
 arch/parisc/mm/fault.c            | 26 ++++++++++++++++++-----
 2 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/u=
access.h
index ebf8a845b017..8254f0f09e2e 100644
=2D-- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -53,18 +53,15 @@ struct exception_table_entry {
 /*
  * ASM_EXCEPTIONTABLE_ENTRY_EFAULT() creates a special exception table en=
try
  * (with lowest bit set) for which the fault handler in fixup_exception()=
 will
- * load -EFAULT into %r29 for a read or write fault, and zeroes the targe=
t
- * register in case of a read fault in get_user().
+ * load -EFAULT into the error register for a read or write fault, and ze=
roes
+ * the target register in case of a read fault in get_user().
  */
-#define ASM_EXCEPTIONTABLE_REG	29
-#define ASM_EXCEPTIONTABLE_VAR(__variable)		\
-	register long __variable __asm__ ("r29") =3D 0
 #define ASM_EXCEPTIONTABLE_ENTRY_EFAULT( fault_addr, except_addr )\
 	ASM_EXCEPTIONTABLE_ENTRY( fault_addr, except_addr + 1)

 #define __get_user_internal(sr, val, ptr)		\
 ({							\
-	ASM_EXCEPTIONTABLE_VAR(__gu_err);		\
+	register long __gu_err;				\
 							\
 	switch (sizeof(*(ptr))) {			\
 	case 1: __get_user_asm(sr, val, "ldb", ptr); break; \
@@ -86,11 +83,12 @@ struct exception_table_entry {
 {							\
 	register long __gu_val;				\
 							\
-	__asm__("1: " ldx " 0(" sr "%2),%0\n"		\
+	__asm__("\tcopy %%r0,%1\n"			\
+		"1: " ldx " 0(" sr "%2),%0\n"		\
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
-		: "=3Dr"(__gu_val), "=3Dr"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err));		\
+		: "=3D&r"(__gu_val), "=3D&r"(__gu_err)	\
+		: "r"(ptr));				\
 							\
 	(val) =3D (__force __typeof__(*(ptr))) __gu_val;	\
 }
@@ -117,14 +115,15 @@ struct exception_table_entry {
 		__typeof__(*(ptr))	t;		\
 	} __gu_tmp;					\
 							\
-	__asm__("   copy %%r0,%R0\n"			\
+	__asm__("\tcopy %%r0,%R0\n"			\
+		"\tcopy %%r0,%1\n"			\
 		"1: ldw 0(" sr "%2),%0\n"		\
 		"2: ldw 4(" sr "%2),%R0\n"		\
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)	\
-		: "=3D&r"(__gu_tmp.l), "=3Dr"(__gu_err)	\
-		: "r"(ptr), "1"(__gu_err));		\
+		: "=3D&r"(__gu_tmp.l), "=3D&r"(__gu_err)	\
+		: "r"(ptr));				\
 							\
 	(val) =3D __gu_tmp.t;				\
 }
@@ -134,8 +133,8 @@ struct exception_table_entry {

 #define __put_user_internal(sr, x, ptr)				\
 ({								\
-	ASM_EXCEPTIONTABLE_VAR(__pu_err);		      	\
         __typeof__(*(ptr)) __x =3D (__typeof__(*(ptr)))(x);	\
+	register long __pu_err;					\
 								\
 	switch (sizeof(*(ptr))) {				\
 	case 1: __put_user_asm(sr, "stb", __x, ptr); break;	\
@@ -177,24 +176,26 @@ struct exception_table_entry {

 #define __put_user_asm(sr, stx, x, ptr)				\
 	__asm__ __volatile__ (					\
+		"\tcopy %%r0,%0\n"				\
 		"1: " stx " %2,0(" sr "%1)\n"			\
 		"9:\n"						\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
-		: "=3Dr"(__pu_err)				\
-		: "r"(ptr), "r"(x), "0"(__pu_err))
+		: "=3D&r"(__pu_err)				\
+		: "r"(ptr), "r"(x))


 #if !defined(CONFIG_64BIT)

 #define __put_user_asm64(sr, __val, ptr) do {			\
 	__asm__ __volatile__ (					\
+		"\tcopy %%r0,%0\n"				\
 		"1: stw %2,0(" sr "%1)\n"			\
 		"2: stw %R2,4(" sr "%1)\n"			\
 		"9:\n"						\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)		\
-		: "=3Dr"(__pu_err)				\
-		: "r"(ptr), "r"(__val), "0"(__pu_err));		\
+		: "=3D&r"(__pu_err)				\
+		: "r"(ptr), "r"(__val));			\
 } while (0)

 #endif /* !defined(CONFIG_64BIT) */
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index e9eabf8f14d7..d8f07d7430b0 100644
=2D-- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -148,18 +148,33 @@ int fixup_exception(struct pt_regs *regs)
 		 * Fix up get_user() and put_user().
 		 * ASM_EXCEPTIONTABLE_ENTRY_EFAULT() sets the least-significant
 		 * bit in the relative address of the fixup routine to indicate
-		 * that gr[ASM_EXCEPTIONTABLE_REG] should be loaded with
-		 * -EFAULT to report a userspace access error.
+		 * that the error register should be loaded with -EFAULT to
+		 * report a userspace access error. The error register is zeroed
+		 * before doing the load or store, so the exception handler can
+		 * read the "copy %%r0,reg" instruction to extract the register.
 		 */
 		if (fix->fixup & 1) {
-			regs->gr[ASM_EXCEPTIONTABLE_REG] =3D -EFAULT;
+			u32 treg;

 			/* zero target register for get_user() */
 			if (parisc_acctyp(0, regs->iir) =3D=3D VM_READ) {
-				int treg =3D regs->iir & 0x1f;
-				BUG_ON(treg =3D=3D 0);
+				treg =3D regs->iir & 0x1f;
+				if (WARN_ON(treg =3D=3D 0))
+					goto wrong_get_put_user;
 				regs->gr[treg] =3D 0;
 			}
+
+			/* get previous assembly statement */
+			__get_kernel_nofault(&treg, (regs->iaoq[0]-4) & ~3,
+				u32, wrong_get_put_user);
+			/* check assembly statement for: copy %r0,%rX */
+			if (WARN_ON((treg & 0xffffff00) !=3D 0x08000200))
+				goto wrong_get_put_user;
+			/* extract error register used for get_user/put_user */
+			treg &=3D 0x1f;
+			if (WARN_ON(treg =3D=3D 0))
+				goto wrong_get_put_user;
+			regs->gr[treg] =3D -EFAULT;
 		}

 		regs->iaoq[0] =3D (unsigned long)&fix->fixup + fix->fixup;
@@ -177,6 +192,7 @@ int fixup_exception(struct pt_regs *regs)
 		return 1;
 	}

+wrong_get_put_user:
 	return 0;
 }

=2D-
2.34.1


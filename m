Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7A04AF9F4
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Feb 2022 19:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239018AbiBIS3c (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 9 Feb 2022 13:29:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238643AbiBIS3b (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 9 Feb 2022 13:29:31 -0500
X-Greylist: delayed 307 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Feb 2022 10:29:33 PST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A07C0613C9
        for <linux-parisc@vger.kernel.org>; Wed,  9 Feb 2022 10:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644431371;
        bh=ePPyxUdSpXBdU1lUC8VwugmMXHs0kd58L1Jyx5STL3U=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=W5cNB6VpB+FFIK/bghcS6cunzPGD2h7PqJF0o2V7LTpvulpZbHvkL5YhEexzc5S3m
         77/jo/KOI/j/XccMIs4zDfaitiXip9Egrcy9to3ZwESVMEIxhHpchG7SKIbZy1dcsb
         7OQew/aRug/5LwAJck2qrm/R6MGedYPKtLxsS2ak=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.150.166]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHMZ-1o2W8O03RJ-00kcYS; Wed, 09
 Feb 2022 19:24:17 +0100
Date:   Wed, 9 Feb 2022 19:24:14 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Fix user access miscompilation
Message-ID: <YgQGzle/mBRK9lBc@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:77g6qerdQU/MP99MdpzgMjrLi03aEuFs6wBUhAujmELNt0z3CNV
 SwyyMLTkTN7uBLzba5V8GuIdCPjtHh396vpt9gA6x/bbRnNQDxdqyOILS4OWR+HDRz8rl/R
 5Fg8sGL15YF4yeZ+YNLIuc/Yt0ghC8DJsGW0fu/T2vM2w2520gtov3wfQgU6dZfEbvXKSpb
 urS0KgUn60749CcwDLyEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JZrR0XcS0cE=:YvbcGV53dgjDiu/ejD58gk
 sYXSKZus/6s3XO71vmWDA0UMi0gaSX0BIOTKvtF0DAZOkOiXIQrFj0HT7/8CFImGXIUXQlkJP
 Pc/7aWOdqH/297kPBjIIrubQP+Wkn4XjXle/pDmURktO+BrX+Ni5m5o7fm1PL+TTigZav5LXw
 pXsXUSGMIDDM4Yl55m/H9XEEZw2WDGyjSZHzhuZBJnsbRrMDlCj65R/4E9tnO0kobaV9HwSxI
 ZATIY/m7aVjU+BFDao4GNs7WfN2zwTnGRGdMpmBmyRXCK7o/EJ3TsJKIqOkpi5im+v6gb8P8p
 Ky8aEPdq+s2cm46w7dz4rLR1NMIOmrOlWzgdsK3iOAMVp7q95i3AVifgwLlkYhoL9PhI4qIiY
 wRHDxvFVW+JEyZxdzF5uKSuBIhXl0wxd3prftBmjZY/kPGyXdBJZ4U/LECxjcgXm2uNHhIVby
 4ZpD2oBBCNr66f8YeKc74OuIGX21QynU66anC2Rup+8PeHouuQAwP5plo58ePPZR5to1PHvXQ
 sdlSsymOYP59kJ2312dHJcf/aiiDKh8WRsBd5TjUm/ivTu5odJVPr9GSpi4I9ByI8bD1+X4Ve
 sbxNJgAowb37HtVDaUDBhF94gFxeHsb12wzq5R7NJJSeq0/1q5O6X++eI49TF941vTgiIhJNy
 Duwk9YNDGkYo9C/xJJzL7g91ki7MrtJh9B0RUabPpBdQlfIryoo3AR5GGq15kbJynSE47Wh1Q
 YfBwhwC21vI3gLgGB/iKp9hBUI5Erp2qGV7DtlhHAX/nK+tgw1fqe3ZMBbjqoshc7PpiVmSpn
 FibJHT8sIJd4w4zwtez5ttiuDm33KmMLYSgzA0PcihOHBXnkhfJG6yjajUXa9pZJdnh7pNTqI
 Om7ZpR5GNYCpFbFt/5xuvpNiCfKb1tnvtcMsEUXVUHygUDcUcjA+EwrpwNSpbSoflfZ710cmD
 gReew+CSGLMgsW2qKYfSHrE4O0iQsmYDGV56Zc1Mk7uSe7AQxzoJsbi0Wu5npkdHIt+wgFgb/
 wLZlZaDiD/PZommarPrcgbK55XUORVJ+PN9ZfC6AaWb/Zh8VQbU+lTkwqC8mtGyTfg==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

It turned out, that another function call inside a put_user(), e.g.:
  put_user(vt_do_kdgkbmode(console), (int __user *)arg);
clobbered the error register (r29) and thus failed.
Avoid this miscompilation by first calculate the value in
__put_user() before calling __put_user_internal() to actually
write the value to user space.

Additionally, prefer the "+" constraint on pu_err and gu_err registers to =
tell
the compiler that those operands are both read and written by the assembly
instruction.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: 4b9d2a731c3d ("parisc: Switch user access functions to signal error=
s in r29 instead of r8")

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/u=
access.h
index ebf8a845b017..68f5c1eaaa6f 100644
=2D-- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -89,7 +89,7 @@ struct exception_table_entry {
 	__asm__("1: " ldx " 0(" sr "%2),%0\n"		\
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
-		: "=3Dr"(__gu_val), "=3Dr"(__gu_err)        \
+		: "=3D&r"(__gu_val), "+r"(__gu_err)        \
 		: "r"(ptr), "1"(__gu_err));		\
 							\
 	(val) =3D (__force __typeof__(*(ptr))) __gu_val;	\
@@ -123,7 +123,7 @@ struct exception_table_entry {
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)	\
-		: "=3D&r"(__gu_tmp.l), "=3Dr"(__gu_err)	\
+		: "=3D&r"(__gu_tmp.l), "+r"(__gu_err)	\
 		: "r"(ptr), "1"(__gu_err));		\
 							\
 	(val) =3D __gu_tmp.t;				\
@@ -132,10 +132,9 @@ struct exception_table_entry {
 #endif /* !defined(CONFIG_64BIT) */


-#define __put_user_internal(sr, x, ptr)				\
+#define __put_user_internal(sr, __x, ptr)			\
 ({								\
 	ASM_EXCEPTIONTABLE_VAR(__pu_err);		      	\
-        __typeof__(*(ptr)) __x =3D (__typeof__(*(ptr)))(x);	\
 								\
 	switch (sizeof(*(ptr))) {				\
 	case 1: __put_user_asm(sr, "stb", __x, ptr); break;	\
@@ -150,7 +149,9 @@ struct exception_table_entry {

 #define __put_user(x, ptr)					\
 ({								\
-	__put_user_internal("%%sr3,", x, ptr);			\
+	 __typeof__(*(ptr)) __x =3D (__typeof__(*(ptr)))(x);	\
+								\
+	__put_user_internal("%%sr3,", __x, ptr);		\
 })

 #define __put_kernel_nofault(dst, src, type, err_label)		\
@@ -180,7 +181,7 @@ struct exception_table_entry {
 		"1: " stx " %2,0(" sr "%1)\n"			\
 		"9:\n"						\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
-		: "=3Dr"(__pu_err)				\
+		: "+r"(__pu_err)				\
 		: "r"(ptr), "r"(x), "0"(__pu_err))


@@ -193,7 +194,7 @@ struct exception_table_entry {
 		"9:\n"						\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)		\
-		: "=3Dr"(__pu_err)				\
+		: "+r"(__pu_err)				\
 		: "r"(ptr), "r"(__val), "0"(__pu_err));		\
 } while (0)


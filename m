Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4BB4B3DD7
	for <lists+linux-parisc@lfdr.de>; Sun, 13 Feb 2022 22:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238471AbiBMV4Z (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 13 Feb 2022 16:56:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238448AbiBMV4Z (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 13 Feb 2022 16:56:25 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35EF754192
        for <linux-parisc@vger.kernel.org>; Sun, 13 Feb 2022 13:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644789371;
        bh=1Itp++xv8W/R2ulqDlIKu3fZRTFp1222976vAT9X+yA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=QofCFkIoHCOECh8pwO0ggroYVkk7N8epyVMCRz9LF4r9xZow1aP1qX1AhSMA2HSCZ
         1u3+Up2flwY3OxI+LqNUUaREGdrjHQFPVhg6Wvah8o1Iob5yaZfTxDTfoyIY1UgePw
         PIs6wbSYTJ7IGVDAdDFeBPdYn2JVatdjYoKIc/gA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.238]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXUN-1ncGc941QN-00JaGg; Sun, 13
 Feb 2022 22:56:11 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH v5] parisc: Fix some apparent put_user() failures
Date:   Sun, 13 Feb 2022 22:55:47 +0100
Message-Id: <20220213215546.230680-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X6LCPrZ0kr1crKFZrUdYJYQNiEJX1nRoaUhMouGZOa7lhJ7uFbk
 J/JSrr+JbyoM3AkFQ+SJjM+IC71bJXuAOUgybAIlZCSrXr9/RImVH9ihrZ82cS1mTiuS6Z6
 ZkHPGDG5dKinbdObKwW/ZhNO5pG+J32VzDfqN7YmJJY49z9M4EDDjlEWf2RBCOYqu/80n1g
 FJxBPIY/4+OQTl8taxyNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4yzGj7kpflU=:OAgn3eaBt16pg+a/iSRHoZ
 Dm5RXKM6EXBF+M1UTPlT6V+MLqJxyizR8ukJEPJgunwuaj8po4EWCHh1oTNAASpphYZ/75kSQ
 11dy2hLYqDB+HgOtcR0yQcAulHGfq8Xm9p+SyeCZ794cqwDn5XJWpTEHs0k+dszqiaCOHoqZN
 rjTYDVj2C330E6Wz7mfb6ti7aVOWuc3pnA4ErDyEO3A5Q7NiSEypUlGlyAf7hMIXIL/6E0GVK
 ukXvbenJzRu5pnB0vsKaJWYv6sD4Y0Q+vZusHC4XSifsLMzJLsyWFNOoo2Q0iMnXOB3+KYTT9
 Uat+H0B5wfgmmmm6uM7ztiVg8NPmNofEIt70nt9VwriYvp2cgp83WqGDbBosraz/zsZVDIyU8
 96p+WS/zj6Xdhlr0vuCHbkOZpzBe3kRUR326qJfMzxXglI/o8QHxbro2YsJnCvoxCboLFkpWn
 wvapQtE0JC07Fj/4YxiaY54BKP4uuEOKhwVyCyhNC3zZzENYrR3+D13lOq3zo5Qk/dnuPkILh
 E2Pvrko44Ypw+3Tdz/Ea4f8VWHCiY+00/1y2E4YQi89Vx7gwSo7Qsnv52wKaey1k2ad8IO8Jw
 Lf9F7RGBfnTHnzHnYvJvNNX3NOhmmnUaUVqPQ+duk8fTlVVCtG+xP1mbbWawUDy3g8/KTLFKv
 4i/BdT+0gVJvDsi44OdvtSDRuKDe3x+CsOn3MX4vXS0o6vbqKgvHJZAr6R0mxSP0eUhA1wxgC
 oX6gq9zCSsQqMbpga+hPvfeVsBg7VMrchwY/63LzTTOmp4LS2E0l2YyRBRxsJRQiYuGsP5CHf
 3xgEw1pBOA+3m6bGJKRwq2j54sv+OB2e3iIheSGSvRZoifa9yOe0+zEmU7Mgaq+uc0i8ODzCK
 p97J1SUuKauZ7kRr4+lVloSfnXMJfRnluFAzBmQMWwnxMTtZeVSz+4/PMIVeTwxdWD2Ya9xR6
 C/iWAn5by5DqiI5fEDkVxdLaO0oiCflSNym679XGchGeN5NRqmDKvXk2RNPc5p3XN7QiuhcoS
 xFpgmfqmmwARVdCwKKeyy7MQEkHuJYwfW2VTfAfHly2EwpdMwo0Tt96CR8kBm9WEOEzgJpPqk
 3ACeuPX7K5YoDc=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
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

It turned out, that a function call inside a put_user(), e.g.:
put_user(vt_do_kdgkbmode(console), (int __user *)arg);
clobbered the error register (r29) and thus the put_user() call itself
seem to have failed.

Rearrange the C-code to pre-calculate the intermediate value
and then do the put_user().
Additionally prefer the "+" constraint on pu_err and gu_err registers
to tell the compiler that those operands are both read and written by
the assembly instruction.

Reported-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: 4b9d2a731c3d ("parisc: Switch user access functions to signal error=
s in r29 instead of r8")
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/uaccess.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/u=
access.h
index ebf8a845b017..175e17197813 100644
=2D-- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -89,8 +89,8 @@ struct exception_table_entry {
 	__asm__("1: " ldx " 0(" sr "%2),%0\n"		\
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
-		: "=3Dr"(__gu_val), "=3Dr"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err));		\
+		: "=3Dr"(__gu_val), "+r"(__gu_err)        \
+		: "r"(ptr));				\
 							\
 	(val) =3D (__force __typeof__(*(ptr))) __gu_val;	\
 }
@@ -123,8 +123,8 @@ struct exception_table_entry {
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)	\
-		: "=3D&r"(__gu_tmp.l), "=3Dr"(__gu_err)	\
-		: "r"(ptr), "1"(__gu_err));		\
+		: "=3D&r"(__gu_tmp.l), "+r"(__gu_err)	\
+		: "r"(ptr));				\
 							\
 	(val) =3D __gu_tmp.t;				\
 }
@@ -135,13 +135,12 @@ struct exception_table_entry {
 #define __put_user_internal(sr, x, ptr)				\
 ({								\
 	ASM_EXCEPTIONTABLE_VAR(__pu_err);		      	\
-        __typeof__(*(ptr)) __x =3D (__typeof__(*(ptr)))(x);	\
 								\
 	switch (sizeof(*(ptr))) {				\
-	case 1: __put_user_asm(sr, "stb", __x, ptr); break;	\
-	case 2: __put_user_asm(sr, "sth", __x, ptr); break;	\
-	case 4: __put_user_asm(sr, "stw", __x, ptr); break;	\
-	case 8: STD_USER(sr, __x, ptr); break;			\
+	case 1: __put_user_asm(sr, "stb", x, ptr); break;	\
+	case 2: __put_user_asm(sr, "sth", x, ptr); break;	\
+	case 4: __put_user_asm(sr, "stw", x, ptr); break;	\
+	case 8: STD_USER(sr, x, ptr); break;			\
 	default: BUILD_BUG();					\
 	}							\
 								\
@@ -150,7 +149,8 @@ struct exception_table_entry {

 #define __put_user(x, ptr)					\
 ({								\
-	__put_user_internal("%%sr3,", x, ptr);			\
+	__typeof__(*(ptr)) __x =3D (__typeof__(*(ptr)))(x);	\
+	__put_user_internal("%%sr3,", __x, ptr);		\
 })

 #define __put_kernel_nofault(dst, src, type, err_label)		\
@@ -180,8 +180,8 @@ struct exception_table_entry {
 		"1: " stx " %2,0(" sr "%1)\n"			\
 		"9:\n"						\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
-		: "=3Dr"(__pu_err)				\
-		: "r"(ptr), "r"(x), "0"(__pu_err))
+		: "+r"(__pu_err)				\
+		: "r"(ptr), "r"(x))


 #if !defined(CONFIG_64BIT)
@@ -193,8 +193,8 @@ struct exception_table_entry {
 		"9:\n"						\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)		\
-		: "=3Dr"(__pu_err)				\
-		: "r"(ptr), "r"(__val), "0"(__pu_err));		\
+		: "+r"(__pu_err)				\
+		: "r"(ptr), "r"(__val));			\
 } while (0)

 #endif /* !defined(CONFIG_64BIT) */
=2D-
2.34.1


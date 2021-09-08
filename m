Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A66404043
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Sep 2021 22:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350544AbhIHUrA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Sep 2021 16:47:00 -0400
Received: from mout.gmx.net ([212.227.15.18]:57223 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350507AbhIHUrA (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Sep 2021 16:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1631133943;
        bh=gQ92j+eFefii+Grc3pfyMM+VWOEAUseqpOeE+AQtd4g=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=MoT7ncvPs1iuXWajCTwx1Bler5LzkgCiWK4wCiTJhy+ugOEazGIYHEQg3sWCMYwQG
         i2Bf2wflAwUAyPy7DXyrLi4bxQr2L01TgmNREG5I8BLyg5EkVYZyK5PwVfk+OjIrbC
         MMnp9DlRFcZIG0U50AiBV82nS2zxoqx1w2zfIPUA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.187.121.129]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MeU4s-1myVf83SwW-00aX83; Wed, 08 Sep 2021 22:45:43 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH 1/4] parisc: Drop strnlen_user() in favour of generic version
Date:   Wed,  8 Sep 2021 22:44:02 +0200
Message-Id: <20210908204405.127665-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uiqlyHoS/WBnLltSwVv+6DhbKuWF5IX4RFrTeYTMhEoHnTBwHU7
 gbAx/z9tlFq0QDOwHxqK4WaODetYaq6mn+L0lP/q2dWAcq1pjCLQikSioIjGKInLpGOatoZ
 XP1G7XR2OwwjOSyTVCH4R1w0emuq4mqvbUXBC4+VdW6Mr3GO8n/G4FQVbllPHuVGV7OogLA
 Uuzj7hmZr+OWh4VFF7yVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ICiw4KEzSVg=:3UO4c6LzvJ2ZInZiL/oVx2
 rIPuvHfso/pwdxcUOSXbU2ZK4fmTT3ooo00VLy3QPurjpJAQEWEIv163lBTJs9k41tEN8rh5Z
 3DjQqN2yC5CEETHiPfZvB2A//L5j/YSlzNTE1iWxfVtKxip0qK8d2epNeZk3fIBvzXmXqqxyT
 TvwclVhV+tF9jt9MKwGYOBCvKNv7dh5Z3F9FkBTNIxu4atkSJZbKDtRNTu6P+GtV8pQWlrLwM
 O7ZJSfIcNJn81bZgmi4YOAaiNY1PDoxvbkyaDVNvhNVTk6mcAO2b8TyeCo8hBTKseCQaCJTsg
 YLU3yOwKdwF0UM13o1XhTjmSqb41vKg0DeisFF8rW3SQUX+eTKFQPZtYqon9p5WpO4wnXsF8/
 L8mnnJBDNW+bDreaLJvERY0VKhUJhcZTzNdP0Zx4X4GQaVNe1aKt2z9eT1nGCYZWfEJds1jti
 0Fm6DM3fB0yHhqRcYHq/ERiNzQEEZd3PMtT3hf5ugDreE6J18+XCqY811wKjqwO240EJnWcUX
 f/NgfYFCNhC3Nmep8+tpLxdIbUqg8ZrU6Q0ZnmuNdJOHF73iMtCI332vBRGKRcKQR8HtVqs5E
 rbq/R7fO3icLahkuyNnM9+OpcegTfZHoGKL1kfTnPlYaVFhWKl+Ww951lL7C05CCMfl4yiztV
 X0QfVx/tZrjEAr9Y62/1rPgJALvzv9KbaX8xwN8tKt6FDNrbg4d3Ax7mmi1x/qTMLR29rnocs
 zKxAupFKXJ1savMIgKR1df9F0/RchDA+kBQiYREDCIrk1bIg/Ae+svIHVCdhqZi/Eg7bt0qDf
 02pGsxnhXO9V2hYmW2vAcucMRjikUbWrLGsZays0InHi2p9IvfYQRmuigvkBMC3rzzxVPWJjt
 m3mXedu2ToRZVWYJASqEdPTW2BbaNZ9rd405RaPFpaukY7NptIm+Sr/dL+2R5/sK6Dmu1fpe1
 cINilJxiKUHIk9VcuFdkTnZMiV+XTbjMRpv6NIiCLLSCuxsxbqaiXB07ByhldLwsoAsvMvfOj
 EKddPUvA5DQIvj/77ty0S7JdgOErqIVv8dzURDrMbKyaxnH/F6DaSQNXXZQaF6jKcWgD47ZmB
 ZhzpiLXd9XhuKU=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

As suggested by Arnd Bergmann, drop the parisc version of
strnlen_user() and switch to the generic version.

user_addr_max() was wrong too, fix it by using TASK_SIZE.

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Kconfig               |  1 -
 arch/parisc/include/asm/uaccess.h |  5 ++---
 arch/parisc/kernel/parisc_ksyms.c |  1 -
 arch/parisc/lib/lusercopy.S       | 34 -------------------------------
 4 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 95d4bbf4e455..3ae71994399c 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -10,7 +10,6 @@ config PARISC
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
-	select ARCH_HAS_STRNLEN_USER
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_HUGETLBFS if PA20
 	select ARCH_SUPPORTS_MEMORY_FAILURE
diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/u=
access.h
index ed2cd4fb479b..2442ed2929ae 100644
=2D-- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -201,13 +201,12 @@ struct exception_table_entry {

 extern long strncpy_from_user(char *, const char __user *, long);
 extern unsigned lclear_user(void __user *, unsigned long);
-extern long lstrnlen_user(const char __user *, long);
+extern __must_check long strnlen_user(const char __user *src, long n);
 /*
  * Complex access routines -- macros
  */
-#define user_addr_max() (~0UL)
+#define user_addr_max() (uaccess_kernel() ? ~0UL : TASK_SIZE)

-#define strnlen_user lstrnlen_user
 #define clear_user lclear_user
 #define __clear_user lclear_user

diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc=
_ksyms.c
index e8a6a751dfd8..00297e8e1c88 100644
=2D-- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -32,7 +32,6 @@ EXPORT_SYMBOL(__xchg64);

 #include <linux/uaccess.h>
 EXPORT_SYMBOL(lclear_user);
-EXPORT_SYMBOL(lstrnlen_user);

 #ifndef CONFIG_64BIT
 /* Needed so insmod can set dp value */
diff --git a/arch/parisc/lib/lusercopy.S b/arch/parisc/lib/lusercopy.S
index 36d6a8638ead..0aad5ce89f4d 100644
=2D-- a/arch/parisc/lib/lusercopy.S
+++ b/arch/parisc/lib/lusercopy.S
@@ -67,40 +67,6 @@ $lclu_done:
 ENDPROC_CFI(lclear_user)


-	/*
-	 * long lstrnlen_user(char *s, long n)
-	 *
-	 * Returns 0 if exception before zero byte or reaching N,
-	 *         N+1 if N would be exceeded,
-	 *         else strlen + 1 (i.e. includes zero byte).
-	 */
-
-ENTRY_CFI(lstrnlen_user)
-	comib,=3D     0,%r25,$lslen_nzero
-	copy	    %r26,%r24
-	get_sr
-1:      ldbs,ma     1(%sr1,%r26),%r1
-$lslen_loop:
-	comib,=3D,n   0,%r1,$lslen_done
-	addib,<>    -1,%r25,$lslen_loop
-2:      ldbs,ma     1(%sr1,%r26),%r1
-$lslen_done:
-	bv          %r0(%r2)
-	sub	    %r26,%r24,%r28
-
-$lslen_nzero:
-	b           $lslen_done
-	ldo         1(%r26),%r26 /* special case for N =3D=3D 0 */
-
-3:      b	    $lslen_done
-	copy        %r24,%r26    /* reset r26 so 0 is returned on fault */
-
-	ASM_EXCEPTIONTABLE_ENTRY(1b,3b)
-	ASM_EXCEPTIONTABLE_ENTRY(2b,3b)
-
-ENDPROC_CFI(lstrnlen_user)
-
-
 /*
  * unsigned long pa_memcpy(void *dstp, const void *srcp, unsigned long le=
n)
  *
=2D-
2.31.1


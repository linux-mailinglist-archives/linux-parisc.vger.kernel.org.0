Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6276D4B93A7
	for <lists+linux-parisc@lfdr.de>; Wed, 16 Feb 2022 23:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236440AbiBPWLl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 16 Feb 2022 17:11:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbiBPWLk (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 16 Feb 2022 17:11:40 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A967B1116A
        for <linux-parisc@vger.kernel.org>; Wed, 16 Feb 2022 14:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645049481;
        bh=eZ0oRIhEyYOJw7srh0eR8XdDTZrRdie0YDy6r7FysZ0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=dxzkcitOvNThhHmBxfF0lfy/vScNalmJqb05/4sjRmlRvqM67yGaG8fsl96oRIg3M
         Pv2Cq9KNLHC2BNRJRCegDhnWaH+OHPkRyOzsbv8NFXPpHiCBdrMawffwnXtFgIkxUQ
         0HC+ddxZ1no/PIuw3uRSL/W2UF5XnhIrzarK2Br4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.128.232]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGhyS-1nY9e63iJ0-00DnNN; Wed, 16
 Feb 2022 23:11:20 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Use PRIV_USER and PRIV_KERNEL in get_user() and put_user()
Date:   Wed, 16 Feb 2022 23:11:20 +0100
Message-Id: <20220216221120.233845-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HKFFoTtj3fyS7VSmJcX18mZC2m+GIIcWpgOYHR5skI7ob56UPy5
 PgDziCrC/wxCBee8FBKDME2Ld5ejlyuHLPcfSPAIbo+TwLWFHHMZrucpV9dYGfXDBnmZWlE
 YpzsqyfEjYgGzunaUTAV2CvQ8F0wJqIS7lYKiy/q0X9dK+z62ebRs9lWtrCaiC64gjZirqr
 7MsyA85n8L5Kgiu5/iE2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lKLho5J4ZBM=:plHtGV7BBmm2slXgPOnIfH
 JIELyjSEUj1eDqnIiV2rv0PNiyFtpHDTr94don5Jxz0b326SnyJpaocZoz9tpDK+WpF+1mrmR
 Ff9VcWYwG/KvMNAtkKH0gYUr4i4X2baRtt0DJZgoeXaffmuPbEzh+CndI3Z5BGp4w/GO0lS1V
 uJOVjigzBHHeAPggroRJuPZYgy1UpW8QMxt/lyy1qnwGg68ueqfSipovHW8KojaNUW+t8gcZV
 RTF3yxZVSaMbjLA+rLjdlvT5ldOa73Hb/QwD6niODEgj+hrCXCwRVVIF3e+HhHumldTzI8Jy4
 UaPs9ewHAHkHbDTrVaoGwKfx/Bwc5lnkCMp+JNjWGDmXGxoTZKoNfFp+CHZnTpCaX8VZoo7P7
 BNOPFq2PFmL6uR+93GpKmnA1kmLK5bOXq1oxTa5KJO9ypoY1tjeSxdkKjoPfYI2rwS8HrsWHw
 NiAgko/hqzF2ZGuWWkl2Z8FVoA1ycqgzmthO1TNKTHI7C0aRZHtGcEGK1LVrjL1NW/huK9pbf
 hamBGM6IZfFQoXTXfYrgRbguF5Tw266VbWp/CTjlm1vdZpOG8mbFzghv9bvo4xZy1sOKnYmu5
 /I/6YzW1MvxYyL8ZM0KXe9ZzSZ+bIvtU6CSqYWZLCxI8fWe25Bcwgzgg56hQ1kdx1QzKm/jBY
 Oo8lSDuTnS7O/1hYFIY5InpfCMezklzSFLar25vFiVUCIbyBdaSa1UpTVl8VsxqhdMX2I3smI
 1gd+rYCLh0+JX/8cYKyzFTC2s2UmVfpBCMulfjvCxv+npy6bvWxnu0a8LVsGZxwo5tqyV+4wr
 VK+iA1z5g/KYSpN9dgYO+GuImG83BdoXNsFfMbqjFWBym0ooS6kzPiDLgVW+KfFK/9yI5h+RF
 wB7BoUQhI6Lk7EEN4qspu3mwIau2EJ6SDogKXAkdoNtofs1VNkVu7IYuwimm7vYhPaWz3J6ud
 1ROvgSYiif5GHDSA331i7AlrLmRmYzi3F3QsV16Gyr0on8fN3apld8q6BpXoAMVi5dCNIjNsV
 o9TyfMHVMQkt+fulEId4gjMzLSkKdypr5LnT4ylE6k30K6euO+iTVYU7cAKlRMwOp+07+qB1u
 tD/QNlwZaPtAGM=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Instead of hardcoding the space registers as strings, use the PRIV_USER
and PRIV_KERNEL constants to form the space register in the access
functions.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/uaccess.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/u=
access.h
index 123d5f16cd9d..17aa83729cc2 100644
=2D-- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -79,18 +79,18 @@ struct exception_table_entry {

 #define __get_user(val, ptr)				\
 ({							\
-	__get_user_internal("%%sr3,", val, ptr);	\
+	__get_user_internal(PRIV_USER, val, ptr);	\
 })

 #define __get_user_asm(sr, val, ldx, ptr)		\
 {							\
 	register long __gu_val;				\
 							\
-	__asm__("1: " ldx " 0(" sr "%2),%0\n"		\
+	__asm__("1: " ldx " 0(%%sr%2,%3),%0\n"		\
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
 		: "=3Dr"(__gu_val), "+r"(__gu_err)        \
-		: "r"(ptr));				\
+		: "i"(sr), "r"(ptr));			\
 							\
 	(val) =3D (__force __typeof__(*(ptr))) __gu_val;	\
 }
@@ -100,7 +100,7 @@ struct exception_table_entry {
 {							\
 	type __z;					\
 	long __err;					\
-	__err =3D __get_user_internal("%%sr0,", __z, (type *)(src)); \
+	__err =3D __get_user_internal(PRIV_KERNEL, __z, (type *)(src)); \
 	if (unlikely(__err))				\
 		goto err_label;				\
 	else						\
@@ -118,13 +118,13 @@ struct exception_table_entry {
 	} __gu_tmp;					\
 							\
 	__asm__("   copy %%r0,%R0\n"			\
-		"1: ldw 0(" sr "%2),%0\n"		\
-		"2: ldw 4(" sr "%2),%R0\n"		\
+		"1: ldw 0(%%sr%2,%3),%0\n"		\
+		"2: ldw 4(%%sr%2,%3),%R0\n"		\
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)	\
 		: "=3D&r"(__gu_tmp.l), "+r"(__gu_err)	\
-		: "r"(ptr));				\
+		: "i"(sr), "r"(ptr));			\
 							\
 	(val) =3D __gu_tmp.t;				\
 }
@@ -151,14 +151,14 @@ struct exception_table_entry {
 ({								\
 	__typeof__(&*(ptr)) __ptr =3D ptr;			\
 	__typeof__(*(__ptr)) __x =3D (__typeof__(*(__ptr)))(x);	\
-	__put_user_internal("%%sr3,", __x, __ptr);		\
+	__put_user_internal(PRIV_USER, __x, __ptr);		\
 })

 #define __put_kernel_nofault(dst, src, type, err_label)		\
 {								\
 	type __z =3D *(type *)(src);				\
 	long __err;						\
-	__err =3D __put_user_internal("%%sr0,", __z, (type *)(dst)); \
+	__err =3D __put_user_internal(PRIV_KERNEL, __z, (type *)(dst)); \
 	if (unlikely(__err))					\
 		goto err_label;					\
 }
@@ -178,24 +178,24 @@ struct exception_table_entry {

 #define __put_user_asm(sr, stx, x, ptr)				\
 	__asm__ __volatile__ (					\
-		"1: " stx " %2,0(" sr "%1)\n"			\
+		"1: " stx " %1,0(%%sr%2,%3)\n"			\
 		"9:\n"						\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
 		: "+r"(__pu_err)				\
-		: "r"(ptr), "r"(x))
+		: "r"(x), "i"(sr), "r"(ptr))


 #if !defined(CONFIG_64BIT)

 #define __put_user_asm64(sr, __val, ptr) do {			\
 	__asm__ __volatile__ (					\
-		"1: stw %2,0(" sr "%1)\n"			\
-		"2: stw %R2,4(" sr "%1)\n"			\
+		"1: stw %1,0(%%sr%2,%3)\n"			\
+		"2: stw %R1,4(%%sr%2,%3)\n"			\
 		"9:\n"						\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)		\
 		: "+r"(__pu_err)				\
-		: "r"(ptr), "r"(__val));			\
+		: "r"(__val), "i"(sr), "r"(ptr));		\
 } while (0)

 #endif /* !defined(CONFIG_64BIT) */
=2D-
2.34.1


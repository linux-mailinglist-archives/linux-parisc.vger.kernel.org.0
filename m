Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17B374BAB3C
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Feb 2022 21:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243231AbiBQUqU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Feb 2022 15:46:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiBQUqT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Feb 2022 15:46:19 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25AB515DB0D
        for <linux-parisc@vger.kernel.org>; Thu, 17 Feb 2022 12:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645130755;
        bh=MdCCqZdPd9v+nYgJxsV+wO5HtXBphMuoH5QwFxXxKX0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Jm6V8qi+VjxIQ/XRbB1PQYozWg4oiVxIZLu8SNjmCsatzc5ApkcVymlYup6/Hq92V
         sFR4qjbb4lTph4XcK+d6ISlyntdKgZx8Dpl1ZLXVfj2BgKKtWB0dwrJx8Ic08b6d3C
         J7VKS3V1ThIOcra7JxubTRp2/Um8GYkdvTBVA/b0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.175.13]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC30P-1nQXtu1aJB-00CRGy; Thu, 17
 Feb 2022 21:45:55 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 2/4] parisc: Use SR_USER and SR_KERNEL in get_user() and put_user()
Date:   Thu, 17 Feb 2022 21:45:52 +0100
Message-Id: <20220217204554.305554-2-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217204554.305554-1-deller@gmx.de>
References: <20220217204554.305554-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FJ64aROyc/X1Scx5kD/6BjaM5rK8Y5Tiffb5xb267vCa62iiV2d
 sJBhzLg22lCRKtrKtr2DVigRFJMXXN61VW1O9ytGQ7mkhznuxO98nM/0Hbdo3iCama/KKgP
 rrqDm81l23X8hmAJbiZQLCLXMmdGn0icbc9V0ZEV9YNXC7nojcG66EXiLj2hU9vgLQb2Mdb
 +c0orSlcGV0IUPF2Lffhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4BQhTjcoJHU=:PMI/7RaCLJwgqjqc3QYIrw
 yenrtFoMANvXeYwu89rt3iK2MjLYIZgrTrF89+JgenwZoBpDVNWKY0IS83tjYMjPZX12DHU1k
 j1f+F/x88RJY8cTF3Q6zezMirW9E+P/0ieYRlYuQ7kGADu20XDCs+ZFiQGqJ7j2ZPk0jC65q3
 dQuthktkf6QHEBBv8j5Vz39qzpau+43pAg/TiiVuHjeit04gAJH2O5mw2N2RRmgHnS19ls+MR
 hXJiFb5xCCiVCjEUcrLdUJFtKWMJIZKuxs0mgUSkTvLau8a1YadKbggLB2fklrVQUtYODjEjE
 WIU6IhF8MKryLVjKpPn0tAKboTdZr4f4i2MzynFocKMEtYr9M2M2U0f7TrxvBZ7FrBf6ZbSZx
 OmbkJN6vnvz5gBlVUUMGJPpWCU630WYVHq7lNs3sAfAkjsNhkjPCXjNtDeipCW7TnhlVcp7rG
 3b7/OwGWs3tEx6rHk9hFnskyDaNmrI/uxOc5guOWi8eiFi8643ka9n1F6PWwLjkrdS4jO78DL
 2yf4CouBo/UO4+FMWb1VU/ZGQAzRbahpJ54K+omCQxD6Er73ZTIM7khhSsWRAaA2NrmzaKxB3
 0OFxsfA1tRsOOk/QtMv31BOs8hdNHM05HqMS1nTtfvj80aR236g0jxX3MBL4xEtzR2+39tXVV
 53cguNd3+ocrjA9VBXl4dFl3RPvg4S5vi62jJmTeI2mmKbSxNVE842UmJ4LfPggmh/fGguqp+
 0uGbMmkF019MZAXuvV73RdiWNwTvxGMR+yPfrwtbDXrhwZJRro9c3oth10SA82+/K2RM1vM+T
 6ZPwyC/hQsmcPA3vPv87Qyay0niVNYCZfgw7okETJi/lnatE9LJJvefTikMauzOR61UpGsdvS
 rg1dosThg8CaGEQwGrEdGAHQz41RK6JJ4aU0ykGb+POIANc0E8eHZts/0Xdh3lhwOCMuhxBB1
 MFo5Vt/a5i6b3ml2fcjZXxkx7i3dPHce5Eq4d0uUsWpyDX89g9z0kGTAyQxZ99USUDYydtBFK
 8mtvYRpZ3/T/HjINghZI/ANYPoHAXUIQ6WK5ZYrhYSqoNKYOn5lJLPnWOo01Yvk9JNn7uqkzq
 B821iyVEHar7UE=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Instead of hardcoding the space registers as strings, use the SR_USER
and SR_KERNEL constants to form the space register in the access
functions.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/uaccess.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/u=
access.h
index 123d5f16cd9d..b3eb4541e441 100644
=2D-- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -79,18 +79,18 @@ struct exception_table_entry {

 #define __get_user(val, ptr)				\
 ({							\
-	__get_user_internal("%%sr3,", val, ptr);	\
+	__get_user_internal(SR_USER, val, ptr);	\
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
+	__err =3D __get_user_internal(SR_KERNEL, __z, (type *)(src)); \
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
+	__put_user_internal(SR_USER, __x, __ptr);		\
 })

 #define __put_kernel_nofault(dst, src, type, err_label)		\
 {								\
 	type __z =3D *(type *)(src);				\
 	long __err;						\
-	__err =3D __put_user_internal("%%sr0,", __z, (type *)(dst)); \
+	__err =3D __put_user_internal(SR_KERNEL, __z, (type *)(dst)); \
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


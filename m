Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2124C1921
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Feb 2022 17:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243051AbiBWQze (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 23 Feb 2022 11:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243050AbiBWQzb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 23 Feb 2022 11:55:31 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF2B275C1
        for <linux-parisc@vger.kernel.org>; Wed, 23 Feb 2022 08:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645635296;
        bh=guYEiL5Pau753E1q+hmt7K50WbXb82F6iy2VWVPPuq8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Zijsi2no7oLG/EltWyDUr1e2tG+ylTegnTwunUsi5qfdZ33SQTHoQZuMtazmXqfXu
         xAyZG2bMq1UCtrmV0+iw6fdR8cC5Y3w9TOSx3emIjjPRZ111vktJahh1XF8nC0kep1
         Jw4GQ2iXMBlNBfcGW8QGp5xe/7/DY8vKgIqarw2Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.191.154]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1OXT-1oOTkp0bcZ-012t8J; Wed, 23
 Feb 2022 17:54:56 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 3/4] parisc/unaligned: Tweak 32-bit inline assembly of emulate_ldd()
Date:   Wed, 23 Feb 2022 17:54:54 +0100
Message-Id: <20220223165455.3764-3-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223165455.3764-1-deller@gmx.de>
References: <20220223165455.3764-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:58ZatPFzTGg47lUM3KvKeePkACjbsLqVoTwe1WDvcLCNwdb8Pie
 WO58l3AbhvsD9ZRuF6EsxIq+Vt46TqDvFfqwBITmgFf2AEUTPwIXThlT2AHAbchEaK7hUFY
 O0ks+VanPx0mSPHL+f4ZA+TFmAOlSpQya7lohJBI0YkKbX1JRTopHwNfqbS7C8MnpZIi8SV
 +0KD/0iLSeyX/tzAzdyCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LuUj0XDpBa4=:TDSFh5soj3bfWcc8GUaMDN
 KyJ/z5nwGoUZml96qDduxtdhZHIPOe+WTRmRuxgU35YrApGaLRO9ciBVP6ZeMYt/y8VHx4ZuX
 UUZ2GqFvsg5Ck0X2rSqdHhgnnK6IRCyhQ9ek+Yxr/jksYwfW5hatgnYmWeHP0o84X3V4mevnY
 MVle+Ol1r3b8IvnrGJggzGwha1Acrgn4EtiCpH5J4yQYzNQCThF46Y41d5ZTHbyjUsFZ7HdVe
 PAhjtkj1cCyCg3Q2ODCaKafkPCJBtg/ACfIvu1g9iCbxTw6PvQeIFa4y7JTyD6NBY5RJnALnq
 Txg5hxn2NwJ0jLD+AUaeBFlnNsxBqxjUXHv2tjPjAFlMppkTOGxfEPv5kwnC/e6ukxIN7s2lQ
 JDYxSYP8pzP3iXz2CByrXVdBLmz/ZIlI6TSfjnOa1SvKVn1YEtTQQePoT1ZoDqcxpVbyPc9IB
 hZ7tHkcEy6m/R0qD/vPwwgCXtetPTy82bfkYub+bEBmTTLpts3X9b8Y2PpeXsVJsd5laqd6RO
 ed+3/IthFyeigoTBFkqUG6xpUAAyK4anoSJMY+kc1M67CFgi0DOKxbzk3mmEcbgqGWgj3+q3B
 0HC/bRuLIbzjTLcc0V1J2SG+IVyJvyKy284MwSEbH3Qv4otV2BKHf97w5+oFm7AtTTKZjInn2
 ZB30nrOH/S2u/goGoRXf3tAQpJbEFkPzgfyQToFLAlNC72l+cChwoIfXV/uJwqIn2wMXm1L6U
 sBi0H8Z4a863kTbEFpIA6nrdSMob9CLOOPes9VH54jI6pPuwgGYc/qgMb818RQqGvMz6wXyL0
 o/AFLLv4Aqd76V05bv5dwZXYEoIrDwdZ9WYojSepAgrESnyME2q9q82WYNTu5iWP1Ax4UU5zJ
 lBKkYCWufmD7Xz0oRDTwAvRXMXMcigeblBMwrq7yMORIUbX8v1tqUHLxZtM52D5wLVmfUYI4G
 pun4SLM1CSjEsS3uBvApBRshkA5HaJ/oJwCulmuwMsO6wd0BBvvRI2ytcm1JdCFpkUN1aWAyW
 QUKimPm/MQCKZ9Rkm6cLeQAFamryFGlqKMBFWC5gnjbG4jeYUinzyhjdBmpRt++FbEvnQu0rP
 cFsm3cWNYPa/As=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Convert to use real temp variables instead of clobbering processor
registers.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/unaligned.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned=
.c
index e8bc0cd8140c..8fbe000b33e7 100644
=2D-- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -201,26 +201,24 @@ static int emulate_ldd(struct pt_regs *regs, int tor=
eg, int flop)
 	: "r19", "r20" );
 #else
     {
-	unsigned long valh=3D0,vall=3D0;
+	unsigned long shift, temp1;
 	__asm__ __volatile__  (
-"	zdep	%5,29,2,%%r19\n"		/* r19=3D(ofs&3)*8 */
-"	mtsp	%6, %%sr1\n"
-"	dep	%%r0,31,2,%5\n"
-"1:	ldw	0(%%sr1,%5),%0\n"
-"2:	ldw	4(%%sr1,%5),%1\n"
-"3:	ldw	8(%%sr1,%5),%%r20\n"
-"	subi	32,%%r19,%%r19\n"
-"	mtsar	%%r19\n"
-"	vshd	%0,%1,%0\n"
-"	vshd	%1,%%r20,%1\n"
+"	zdep	%2,29,2,%3\n"		/* r19=3D(ofs&3)*8 */
+"	mtsp	%5, %%sr1\n"
+"	dep	%%r0,31,2,%2\n"
+"1:	ldw	0(%%sr1,%2),%0\n"
+"2:	ldw	4(%%sr1,%2),%R0\n"
+"3:	ldw	8(%%sr1,%2),%4\n"
+"	subi	32,%3,%3\n"
+"	mtsar	%3\n"
+"	vshd	%0,%R0,%0\n"
+"	vshd	%R0,%4,%R0\n"
 "4:	\n"
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 4b)
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 4b)
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(3b, 4b)
-	: "=3Dr" (valh), "=3Dr" (vall), "+r" (ret)
-	: "0" (valh), "1" (vall), "r" (saddr), "r" (regs->isr)
-	: "r19", "r20" );
-	val=3D((__u64)valh<<32)|(__u64)vall;
+	: "+r" (val), "+r" (ret), "+r" (saddr), "=3D&r" (shift), "=3D&r" (temp1)
+	: "r" (regs->isr) );
     }
 #endif

=2D-
2.34.1


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100912280A7
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Jul 2020 15:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbgGUNLC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Jul 2020 09:11:02 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:33639 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726769AbgGUNLB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Jul 2020 09:11:01 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20200721131100.GQWV6697.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 21 Jul 2020 09:11:00 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm02.bell.net
          with ESMTP
          id <20200721131100.MFAM16325.torspm02.bell.net@[192.168.2.49]>;
          Tue, 21 Jul 2020 09:11:00 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Remove ldcw barriers from LWS routines in syscall.S
Message-ID: <4e679f6d-e7e7-fe38-5d79-8de3a022a510@bell.net>
Date:   Tue, 21 Jul 2020 09:10:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=XvWExmN9 c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=20HY8SAuM6c2nFZf5YoA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfDeAgHyYQK3ldyc9kwFWQWh2a/fKTxQun0NRBDi4NFwNC4EJJPklR8872a2gTcsZZtXs74K8FENuqtMPBQIuAojaIM0HbdkEx3hHqtDgaZjkM3Z54e9t FeFK0gPhcTjFf5qVslOZsW2LEDRHTPDqkW+h6DoZ868mAk9yZBEyWrB2K8ah2pxzAmsaglDVDia/bQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The LDCW barriers in the light-weight system (LWS) calls in syscall.S can be removed.  Ordered stores
can be used to provide the necessary release semantics.  This saves an instruction that is relatively
expensive.

Signed-off-by: Dave Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index f05c9d5b6b9e..069c7c93d16b 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -640,11 +640,7 @@ cas_action:
 	sub,<>	%r28, %r25, %r0
 2:	stw	%r24, 0(%r26)
 	/* Free lock */
-#ifdef CONFIG_SMP
-98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
-#endif
-	stw	%r20, 0(%sr2,%r20)
+	stw,ma	%r20, 0(%sr2,%r20)			/* Ordered store */
 #if ENABLE_LWS_DEBUG
 	/* Clear thread register indicator */
 	stw	%r0, 4(%sr2,%r20)
@@ -658,11 +654,7 @@ cas_action:
 3:		
 	/* Error occurred on load or store */
 	/* Free lock */
-#ifdef CONFIG_SMP
-98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
-#endif
-	stw	%r20, 0(%sr2,%r20)
+	stw,ma	%r20, 0(%sr2,%r20)			/* Ordered store */
 #if ENABLE_LWS_DEBUG
 	stw	%r0, 4(%sr2,%r20)
 #endif
@@ -863,11 +855,7 @@ cas2_action:

 cas2_end:
 	/* Free lock */
-#ifdef CONFIG_SMP
-98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
-#endif
-	stw	%r20, 0(%sr2,%r20)
+	stw,ma	%r20, 0(%sr2,%r20)			/* Ordered store */
 	/* Enable interrupts */
 	ssm	PSW_SM_I, %r0
 	/* Return to userspace, set no error */
@@ -876,12 +864,7 @@ cas2_end:

 22:
 	/* Error occurred on load or store */
-	/* Free lock */
-#ifdef CONFIG_SMP
-98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
-#endif
-	stw	%r20, 0(%sr2,%r20)
+	stw,ma	%r20, 0(%sr2,%r20)			/* Ordered store */
 	ssm	PSW_SM_I, %r0
 	ldo	1(%r0),%r28
 	b	lws_exit

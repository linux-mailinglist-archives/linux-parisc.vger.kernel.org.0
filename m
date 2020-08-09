Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C88123FE2C
	for <lists+linux-parisc@lfdr.de>; Sun,  9 Aug 2020 14:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgHIMNq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 9 Aug 2020 08:13:46 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:38864 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgHIMNq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 9 Aug 2020 08:13:46 -0400
X-Greylist: delayed 1031 seconds by postgrey-1.27 at vger.kernel.org; Sun, 09 Aug 2020 08:13:44 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Type:MIME-Version:Message-ID:Date:
        Subject:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mNYkYGR5EH4UPIXl5GA2m5uG/NOqFCJzxHxVwteUglk=; b=jqb8/NflfhuKSXfDbbospqlBGU
        iClJG0kWmO4AANyB3ezgi5KSNq3EMvffyIEtfvsYZ7a1w6poFcaTXIjkTDHCQQz7xRd14fQiye+j9
        UJOYZSg7D9lTOWSTvjS1IVjbuA7psmWCYmn3yVXwR/FItoYq4kJIzRudqeHvKmi1yPb4=;
Received: from hsi-kbw-091-089-248-125.hsi2.kabel-badenwuerttemberg.de ([91.89.248.125] helo=x280.stackframe.org)
        by smtp.duncanthrax.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <svens@stackframe.org>)
        id 1k4jwG-0007V9-6J
        for linux-parisc@vger.kernel.org; Sun, 09 Aug 2020 13:56:32 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc@vger.kernel.org
Subject: HPMC handling on C8000
Date:   Sun, 09 Aug 2020 13:06:38 +0200
Lines:  130
X-From-Line: nobody Sun Aug  9 13:06:39 2020
Message-ID: <87d040docw.fsf@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi List,

on my C8000 a HPMC was triggered, but the HPMC handler wasn't called.
I got the following chassis codes:

<Cpu2> e800009802e00000  0000000000000000  CC_ERR_CHECK_HPMC
<Cpu3> e800009803e00000  00000000001b28a3  CC_ERR_CHECK_HPMC
<Cpu2> 37000f7302e00000  8400000000800000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu3> 37000f7303e00000  8400000000800000  CC_ERR_CPU_CHECK_SUMMARY                                                                                                                           
<Cpu2> f600105e02e00000  fffffff0f0c00000  CC_MC_HPMC_MONARCH_SELECTED
<Cpu3> 5600100b03e00000  00000000000001a0  CC_MC_OS_HPMC_LEN_ERR
<Cpu2> 140003b202e00000  000000000000000b  CC_ERR_HPMC_STATE_ENTRY
<Cpu3> 5600106403e00000  fffffff0f043ad20  CC_MC_BR_TO_OS_HPMC_FAILED
<Cpu3> 160012cf03e00000  030001001e000007  CC_MPS_CPU_WAITING
<Cpu2> 5600100b02e00000  00000000000001a0  CC_MC_OS_HPMC_LEN_ERR
<Cpu2> 5600106402e00000  fffffff0f0438e70  CC_MC_BR_TO_OS_HPMC_FAILED
<Cpu2> e800009802e00000  0000000000000000  CC_ERR_CHECK_HPMC
<Cpu2> 37000f7302e00000  8400000000800000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu2> 4000109f02e00000  0000000000000000  CC_MC_HPMC_INITIATED
<Cpu2> 4000101902e00000  0000000000000000  CC_MC_MULTIPLE_HPMCS
<Cpu2> 030010d502e00000  0000000000000000  CC_CPU_STOP

C8000 PDC is complaining about our HPMC handler length, which is 1a0
(second part of the chassis code). Changing that to 0 makes the error
go away:

<Cpu0> e800009800e00000  0000000000000000  CC_ERR_CHECK_HPMC
<Cpu3> e800009803e00000  0000000000000000  CC_ERR_CHECK_HPMC
<Cpu1> e800009801e00000  0000000000000000  CC_ERR_CHECK_HPMC
<Cpu2> e800009802e00000  0000000000000000  CC_ERR_CHECK_HPMC
<Cpu0> 37000f7300e00000  8060004000000000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu3> 37000f7303e00000  8060004000000000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu1> 37000f7301e00000  8060004000000000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu2> 37000f7302e00000  8060004000000000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu0> f600105e00e00000  fffffff0f0c00000  CC_MC_HPMC_MONARCH_SELECTED
<Cpu3> 5600109b03e00000  00000000001eb024  CC_MC_BR_TO_OS_HPMC
<Cpu1> 5600109b01e00000  00000000001eb024  CC_MC_BR_TO_OS_HPMC
<Cpu2> 5600109b02e00000  00000000001eb024  CC_MC_BR_TO_OS_HPMC
<Cpu0> 140003b200e00000  000000000000000b  CC_ERR_HPMC_STATE_ENTRY
<Cpu3> 0000000003000000  0000000000000000  
<Cpu1> 0000000001000000  0000000000000000  
<Cpu2> 0000000002000000  0000000000000000  
<Cpu0> 5600109b00e00000  00000000001eb024  CC_MC_BR_TO_OS_HPMC
<Cpu0> 0000000000000000  0000000000000000  

So at least the HPMC handler is now called, but it hangs. Which isn't
really suprising, as the code has at least one comment saying it can't
handle multiple CPUs, and here the handler is called on all CPUs. And
i'm not sure whether it can handle 64 Bit.

So despite what the PDC spec says, C8000 and RP34xx/RP44xx don't want
the OS_HPMC length in the vector set, which is odd. I disassembled the
firmware and it actually looks like a Bug in PDC. Any thoughts/
experience with that?

I don't have a 32 bit parisc system handy, can anyone test what the
bahviour on older systems is? The patch i'm using is:

> From 159df64544ffc37443032b9507368f5a13a5f67f Mon Sep 17 00:00:00 2001
From: Sven Schnelle <svens@stackframe.org>
Date: Sun, 9 Aug 2020 12:58:54 +0200
Subject: [PATCH] parisc: remove os_hpmc handler from checksum handler

At least C8000/rp34xx/rp54xx complain about an invalid HPMC
length if we add the length of the os_hpmc handler. The PDC
specs say we need to do it, but it doesn't work. Looks like
a firmware bug.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/hpmc.S  | 10 ----------
 arch/parisc/kernel/traps.c |  8 +-------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index 81de5e2b391c..c2981401775c 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -289,13 +289,3 @@ os_hpmc_6:
 	b .
 	nop
 	.align 16	/* make function length multiple of 16 bytes */
-.os_hpmc_end:
-
-
-	__INITRODATA
-.globl os_hpmc_size
-	.align 4
-	.type   os_hpmc_size, @object
-	.size   os_hpmc_size, 4
-os_hpmc_size:
-	.word .os_hpmc_end-.os_hpmc
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 43875c289723..3f5e578903c1 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -799,14 +799,13 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 
 void __init initialize_ivt(const void *iva)
 {
-	extern u32 os_hpmc_size;
 	extern const u32 os_hpmc[];
 
 	int i;
 	u32 check = 0;
 	u32 *ivap;
 	u32 *hpmcp;
-	u32 length, instr;
+	u32 instr;
 
 	if (strcmp((const char *)iva, "cows can fly"))
 		panic("IVT invalid");
@@ -837,14 +836,9 @@ void __init initialize_ivt(const void *iva)
 
 	/* Setup IVA and compute checksum for HPMC handler */
 	ivap[6] = (u32)__pa(os_hpmc);
-	length = os_hpmc_size;
-	ivap[7] = length;
 
 	hpmcp = (u32 *)os_hpmc;
 
-	for (i=0; i<length/4; i++)
-	    check += *hpmcp++;
-
 	for (i=0; i<8; i++)
 	    check += ivap[i];
 
-- 
2.27.0


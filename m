Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7207781BAC
	for <lists+linux-parisc@lfdr.de>; Sun, 20 Aug 2023 02:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjHTAWr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 19 Aug 2023 20:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjHTAWW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 19 Aug 2023 20:22:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02066E715F
        for <linux-parisc@vger.kernel.org>; Sat, 19 Aug 2023 14:44:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74A7660F01
        for <linux-parisc@vger.kernel.org>; Sat, 19 Aug 2023 21:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14959C433C7;
        Sat, 19 Aug 2023 21:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692481442;
        bh=TN6SPNdn/vA/HroGsKlhOpKWn15yA7ZlZPBZrwLZsYs=;
        h=From:To:Cc:Subject:Date:From;
        b=T78ZIDd9txGLXIRe3kR9ZEaa0l4lsw9sb7bgKgwetpBRZIP1Gukp9t+Ra+WMflXvL
         AyHwQ46r5Czr9qHrcG7J801/LGEZ08EQftVQn0MkpQr/s6exoO79n/Bpt2WU+Xi3h1
         2rOFJRi0Dm9SG7TDwWH1iG8UNMcRp34ySFVVdQBiC0BRTZVfFw0rqSkoQQp8JbRUE3
         cFx0ixiWBVm0JRGjEnv0zP32Ht1gTvIa/kXsE9gy8yLtJz1ZE7IMoR/GBxruruffG7
         pcN1AXie3A+Ijmibl1+N4ScZBzq4BPBVPZQlhFCUcyilTV45lIB7BlRmddY214lBrj
         BOUbAOD0GfhTg==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: unaligned: Simplify 32-bit assembly in emulate_std()
Date:   Sat, 19 Aug 2023 23:43:47 +0200
Message-ID: <20230819214347.9653-1-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Helge Deller <deller@gmx.de>

No need to extract upper and lower 32bit values of the 64-bit value. Use
gcc's %R1 to access lower 32-bits and %1 to access upper 32-bits
instead.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/unaligned.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned.c
index 170d0dda4213..ce25acfe4889 100644
--- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -338,25 +338,24 @@ static int emulate_std(struct pt_regs *regs, int frreg, int flop)
 	: "r19", "r20", "r21", "r22", "r1" );
 #else
     {
-	unsigned long valh = (val >> 32), vall = (val & 0xffffffffl);
 	__asm__ __volatile__ (
-"	mtsp	%4, %%sr1\n"
-"	zdep	%2, 29, 2, %%r19\n"
-"	dep	%%r0, 31, 2, %3\n"
+"	mtsp	%3, %%sr1\n"
+"	zdep	%R1, 29, 2, %%r19\n"
+"	dep	%%r0, 31, 2, %2\n"
 "	mtsar	%%r19\n"
 "	zvdepi	-2, 32, %%r19\n"
-"1:	ldw	0(%%sr1,%3),%%r20\n"
-"2:	ldw	8(%%sr1,%3),%%r21\n"
-"	vshd	%1, %2, %%r1\n"
+"1:	ldw	0(%%sr1,%2),%%r20\n"
+"2:	ldw	8(%%sr1,%2),%%r21\n"
+"	vshd	%1, %R1, %%r1\n"
 "	vshd	%%r0, %1, %1\n"
-"	vshd	%2, %%r0, %2\n"
+"	vshd	%R1, %%r0, %R1\n"
 "	and	%%r20, %%r19, %%r20\n"
 "	andcm	%%r21, %%r19, %%r21\n"
 "	or	%1, %%r20, %1\n"
-"	or	%2, %%r21, %2\n"
-"3:	stw	%1,0(%%sr1,%3)\n"
-"4:	stw	%%r1,4(%%sr1,%3)\n"
-"5:	stw	%2,8(%%sr1,%3)\n"
+"	or	%R1, %%r21, %R1\n"
+"3:	stw	%1,0(%%sr1,%2)\n"
+"4:	stw	%%r1,4(%%sr1,%2)\n"
+"5:	stw	%R1,8(%%sr1,%2)\n"
 "6:	\n"
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 6b)
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 6b)
@@ -364,7 +363,7 @@ static int emulate_std(struct pt_regs *regs, int frreg, int flop)
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(4b, 6b)
 	ASM_EXCEPTIONTABLE_ENTRY_EFAULT(5b, 6b)
 	: "+r" (ret)
-	: "r" (valh), "r" (vall), "r" (regs->ior), "r" (regs->isr)
+	: "r" (val), "r" (regs->ior), "r" (regs->isr)
 	: "r19", "r20", "r21", "r1" );
     }
 #endif
-- 
2.41.0


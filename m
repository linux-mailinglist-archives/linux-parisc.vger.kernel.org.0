Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3B87CE55E
	for <lists+linux-parisc@lfdr.de>; Wed, 18 Oct 2023 19:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbjJRRyY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 18 Oct 2023 13:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjJRRyY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 18 Oct 2023 13:54:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DBDEA
        for <linux-parisc@vger.kernel.org>; Wed, 18 Oct 2023 10:54:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EE6C433C8;
        Wed, 18 Oct 2023 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697651662;
        bh=DVXqaA9v2sekuWepQjC/WTqAujx3Xu0RxThGO/heU3U=;
        h=From:To:Cc:Subject:Date:From;
        b=e3FvZV23R+f2qH4Sx/8gxcFUyJj1LAd2Z223Cu8k7SM/GQ0e7NOBQMsvBn93IKc+d
         I+rFTSBnKPTCNWfCxbUmskeuhAnu80VrOvmTMNuMQxDfjN25ObhJ8ddMyNuMLb345F
         p4jvv+F2aFUJVKYiOledwaEcTnRHxlXHz3wwJ6sD7N7OzdGdw9S0h7kWS10ns7CWri
         c2gB0fwzRRX8Cmz/SKdifzCVlWjiPDjB5h5IukkVKzgOVQWkq09GvzwMz/15aRRoVt
         vL/yF61KB9beb/nFigiQIynGl3Qor9LyvMp+9IvJw822W31VyrfrPphNlciVxYFg/h
         DQbjUk+wJ+Znw==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH 1/2] parisc: Move parisc_narrow_firmware variable to header file
Date:   Wed, 18 Oct 2023 19:54:16 +0200
Message-ID: <20231018175417.358964-1-deller@kernel.org>
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

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/processor.h | 1 +
 arch/parisc/kernel/setup.c          | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index ff6cbdb6903b..c05d121cf5d0 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -287,6 +287,7 @@ extern int _parisc_requires_coherency;
 #endif
 
 extern int running_on_qemu;
+extern int parisc_narrow_firmware;
 
 extern void __noreturn toc_intr(struct pt_regs *regs);
 extern void toc_handler(void);
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 2f434f2da185..ace483b6f19a 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -100,9 +100,6 @@ static void __init dma_ops_init(void)
 
 void __init setup_arch(char **cmdline_p)
 {
-#ifdef CONFIG_64BIT
-	extern int parisc_narrow_firmware;
-#endif
 	unwind_init();
 
 	init_per_cpu(smp_processor_id());	/* Set Modes & Enable FP */
-- 
2.41.0


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483DE7CE55F
	for <lists+linux-parisc@lfdr.de>; Wed, 18 Oct 2023 19:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbjJRRy2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 18 Oct 2023 13:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbjJRRy1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 18 Oct 2023 13:54:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C852119
        for <linux-parisc@vger.kernel.org>; Wed, 18 Oct 2023 10:54:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E18DC433C8;
        Wed, 18 Oct 2023 17:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697651665;
        bh=zvCqZ5Ozvzy1lDsnEjftbaByDGUlvYFgb7XGyvTd3DU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fVX6arT76ZSL4l3BYUd3Yoaw4z4jWD57uJtm20BVPBAavI1PjyFqpGIgJZHStzZb9
         tsBgQW1P0mjJTK+5lg/IMnjuvohC6BKVSnpmD0UaQjPhSAmQA0gJKCXQdjHMUFgfpK
         BO1XvvR6cXqwGeaXWbvRGxq6ivrEXaTICxcf8Aw1Pzv/5EP+1pcTH2QFX94MtLb5Lm
         giYF6DgM3FVVsgstB7wTg/6piP6swr+iakF6sLlOdlIm62+L1e/G6l+kMQSa7WwIWn
         9nQ1pdcVZKM2Eslynao46i/igMPPgLmyh4HGwF4dgL9WLPPdgDokpOKTwJOPXjX4s4
         PLGZyNRuso9Ew==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH 2/2] parisc/firmware: Use PDC constants for narrow/wide firmware
Date:   Wed, 18 Oct 2023 19:54:17 +0200
Message-ID: <20231018175417.358964-2-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018175417.358964-1-deller@kernel.org>
References: <20231018175417.358964-1-deller@kernel.org>
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

PDC uses the PDC_MODEL_OS64 and PDC_MODEL_OS32 constants, so use
those constants for the internal WIDE_FIRMWARE/NARROW_FIRMWARE too.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/firmware.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 81078abec521..904ca3b9e7a7 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -78,12 +78,12 @@ static unsigned long pdc_result[NUM_PDC_RESULT]  __aligned(8);
 static unsigned long pdc_result2[NUM_PDC_RESULT] __aligned(8);
 
 #ifdef CONFIG_64BIT
-#define WIDE_FIRMWARE 0x1
-#define NARROW_FIRMWARE 0x2
+#define WIDE_FIRMWARE		PDC_MODEL_OS64
+#define NARROW_FIRMWARE		PDC_MODEL_OS32
 
-/* Firmware needs to be initially set to narrow to determine the 
+/* Firmware needs to be initially set to narrow to determine the
  * actual firmware width. */
-int parisc_narrow_firmware __ro_after_init = 2;
+int parisc_narrow_firmware __ro_after_init = NARROW_FIRMWARE;
 #endif
 
 /* On most currently-supported platforms, IODC I/O calls are 32-bit calls
@@ -166,10 +166,10 @@ void set_firmware_width_unlocked(void)
 	if (pdc_result[0] != NARROW_FIRMWARE)
 		parisc_narrow_firmware = 0;
 }
-	
+
 /**
  * set_firmware_width - Determine if the firmware is wide or narrow.
- * 
+ *
  * This function must be called before any pdc_* function that uses the
  * convert_to_wide function.
  */
@@ -178,7 +178,7 @@ void set_firmware_width(void)
 	unsigned long flags;
 
 	/* already initialized? */
-	if (parisc_narrow_firmware != 2)
+	if (parisc_narrow_firmware != NARROW_FIRMWARE)
 		return;
 
 	spin_lock_irqsave(&pdc_lock, flags);
-- 
2.41.0


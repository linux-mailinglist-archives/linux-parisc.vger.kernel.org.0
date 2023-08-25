Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2AD788E3A
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Aug 2023 20:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjHYSKP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Aug 2023 14:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbjHYSJh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Aug 2023 14:09:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C162697
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 11:09:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8F2362EF6
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 18:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CC4C433C7;
        Fri, 25 Aug 2023 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692986974;
        bh=xgm/x5DZjeMhOokXjeVgLv46+HcSvagI+IK/gwFko90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jd6CNgYombcVbNV/WcOa93Aazo3Uq333wmdEOe1NL54Zqj9sQF49HLEK4IU+t4pIV
         bVO01x4+Z9U4Qhfg+5RpGXv0+FxU4+Bhr4jvtXp7DS8Be/SGX8P+ZMsySw05CKCLvf
         /DDSTmDUsWDWSocD4OWX9FGBimtsAK280cyon817FaQHvYqksDeMmCsVP8xtE2JRkj
         7K1uLTwgbvD6aiFq+fR8/Gsn7fGAkAX4yFTyhuFBGJ52fo7qIgQPH3i1HXic6EQLRi
         uQuVuI+Vq6LQKFFzlnb+BZ2kwHkALk96nIknk/Vv/eIhPY0L4FbB2fqN5QXZLJOdot
         TuqMjgoqJcr1w==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH 3/3] parisc: chassis: Do not overwrite LCD display
Date:   Fri, 25 Aug 2023 20:09:28 +0200
Message-ID: <20230825180928.205499-3-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825180928.205499-1-deller@kernel.org>
References: <20230825180928.205499-1-deller@kernel.org>
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

If we have the LCD/LED driver and tell PDC about a status change
of the system, PDC will usually overwrite the contents on the LCD.

To avoid that, just write the LCD string again via the LCD driver.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/pdc_chassis.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/parisc/kernel/pdc_chassis.c b/arch/parisc/kernel/pdc_chassis.c
index 0a9d7008ef2a..d477d0177c2f 100644
--- a/arch/parisc/kernel/pdc_chassis.c
+++ b/arch/parisc/kernel/pdc_chassis.c
@@ -31,6 +31,7 @@
 #include <asm/processor.h>
 #include <asm/pdc.h>
 #include <asm/pdcpat.h>
+#include <asm/led.h>
 
 #define PDC_CHASSIS_VER	"0.05"
 
@@ -234,6 +235,11 @@ int pdc_chassis_send_status(int message)
 		} else retval = -1;
 #endif /* CONFIG_64BIT */
 	}	/* if (pdc_chassis_enabled) */
+
+	/* if system has LCD display, update current string */
+	if (retval != -1 && IS_ENABLED(CONFIG_CHASSIS_LCD_LED))
+		lcd_print(NULL);
+
 #endif /* CONFIG_PDC_CHASSIS */
 	return retval;
 }
-- 
2.41.0


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6275B7CCAF8
	for <lists+linux-parisc@lfdr.de>; Tue, 17 Oct 2023 20:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbjJQSqF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 Oct 2023 14:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbjJQSqF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 Oct 2023 14:46:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB72E92
        for <linux-parisc@vger.kernel.org>; Tue, 17 Oct 2023 11:46:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73A2C433C8;
        Tue, 17 Oct 2023 18:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697568363;
        bh=4I12LF1dfSZ917A9nOM6On+z+9L/aTAWwip9Au2DNPM=;
        h=From:To:Cc:Subject:Date:From;
        b=GH3B/N/HUKhydlqzf5UfjDoZYNwEnbuaRTLClREn920XJSIDPcVZSV+5c4Vjk3W/V
         i4dwBtqumUZ5Jh8zM4sJ8OZw3HTKxZmOOLJPi9k9YD5D1B+7lVUCgh9+6+jvWddH+c
         DDG1Av2GBMWwNAXk5sFqDUWbJTxPgCP2ne6HSDEqN5IVLZIxoyrhFFHlfjir32/fgR
         J81uwBVyR8wQdagqQMX6kHNQt+lc/p/jTerXO8wTyoVvYoaMr3V7kVJNvXOo6dmHSf
         sGVkTSKwxwVbCaaSWudt9X3wz07huprypnC5mJww1BWAG/k5W0KWEuz+TPwyvJ47OL
         Yoda/99RgvNLg==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add some missing PDC functions and constants
Date:   Tue, 17 Oct 2023 20:45:58 +0200
Message-ID: <20231017184558.118936-1-deller@kernel.org>
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
 arch/parisc/include/uapi/asm/pdc.h | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi/asm/pdc.h
index 7a90070136e8..3c723a69393e 100644
--- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -58,8 +58,8 @@
 #define  PDC_MODEL_NVA_SUPPORTED	(0 << 4)
 #define  PDC_MODEL_NVA_SLOW		(1 << 4)
 #define  PDC_MODEL_NVA_UNSUPPORTED	(3 << 4)
-#define PDC_MODEL_GET_BOOT__OP	8	/* returns boot test options	*/
-#define PDC_MODEL_SET_BOOT__OP	9	/* set boot test options	*/
+#define PDC_MODEL_FIRM_TEST_GET	8	/* returns boot test options	*/
+#define PDC_MODEL_FIRM_TEST_SET	9	/* set boot test options	*/
 #define PDC_MODEL_GET_PLATFORM_INFO 10	/* returns platform info	*/
 #define PDC_MODEL_GET_INSTALL_KERNEL 11	/* returns kernel for installation */
 
@@ -609,6 +609,12 @@ struct pdc_system_map_addr_info { /* PDC_SYSTEM_MAP/FIND_ADDRESS */
 	unsigned long mod_pgs;
 };
 
+struct pdc_relocate_info_block {   /* PDC_RELOCATE_INFO */
+        unsigned long pdc_size;
+        unsigned long pdc_alignment;
+        unsigned long pdc_address;
+};
+
 struct pdc_initiator { /* PDC_INITIATOR */
 	int host_id;
 	int factor;
@@ -717,6 +723,23 @@ struct pdc_toc_pim_20 {
 	struct pim_cpu_state_cf cpu_state;
 };
 
+/* for SpeedyBoot/firm_ctl funtionality */
+struct pdc_firm_test_get_rtn_block {   /* PDC_MODEL/PDC_FIRM_TEST_GET */
+        unsigned long current_tests;   /* u_R_addr Raddr_ints[0]  */
+        unsigned long tests_supported; /* u_R_addr Raddr_ints[1]  */
+        unsigned long default_tests;   /* u_R_addr Raddr_ints[2]  */
+};
+
+#define TORNADO_CPU_ID 		 0xB
+#define PCXL_CPU_ID              0xD
+#define PCXU_CPU_ID              0xE	/* U and U+ for all but C-class with bug */
+#define VR_CPU_ID                0xF
+#define PCXU_PLUS_CPU_ID        0x10	/* U+ only on C-class with bug */
+#define PCXW_CPU_ID             0x11
+#define PCXW_PLUS_CPU_ID        0x12
+#define PIRANHA_CPU_ID          0x13
+#define MAKO_CPU_ID             0x14
+
 #endif /* !defined(__ASSEMBLY__) */
 
 #endif /* _UAPI_PARISC_PDC_H */
-- 
2.41.0


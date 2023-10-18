Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163BE7CE520
	for <lists+linux-parisc@lfdr.de>; Wed, 18 Oct 2023 19:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbjJRRnj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 18 Oct 2023 13:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbjJRRnZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 18 Oct 2023 13:43:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73C619A4
        for <linux-parisc@vger.kernel.org>; Wed, 18 Oct 2023 10:42:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99388C433C7;
        Wed, 18 Oct 2023 17:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697650972;
        bh=2ZhOW4D4eZhMA82BvP24SEVvdKhWpz5M5l/5DfsTKlY=;
        h=From:To:Cc:Subject:Date:From;
        b=MCEQj3mTh4jGhDaKVMmH/UpV2iM3+iDFadXDPtmFAWtUvIwlrGZePzeNq2YiF/pHY
         38P9Not6p15xeQwLYdTrIWyyn9qAgD8oHV+xrt2lyws0qB6Bh0sZzM/06ftKSM63+/
         0fMqqdrGISL/RTdAhL2z0JHt7dv1wMXEbQ9x1AQ6fjtqc8QlRk1/01a/+lNl/h7jof
         z2AdjTTDSSr3TjT0l/bohDJx1l0SbE++gLlIgcckj+zLwPGoH+ot8GkfP4L8klymvM
         +HJqOIqdsScSz9q/l60Sm69kUrOgjeMiTMVuYhMY4qFh315RnrgWDUMWdfrjjLPRlE
         LEy3ZULbwdIlg==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc/agp: Use 64-bit LE values in SBA IOMMU PDIR table
Date:   Wed, 18 Oct 2023 19:42:46 +0200
Message-ID: <20231018174246.344079-1-deller@kernel.org>
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

The PDIR table of the System Bus Adapter (SBA) I/O MMU uses 64-bit
little-endian pointers.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 drivers/char/agp/parisc-agp.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-agp.c
index c6f181702b9a..edbc4d338117 100644
--- a/drivers/char/agp/parisc-agp.c
+++ b/drivers/char/agp/parisc-agp.c
@@ -38,7 +38,7 @@ static struct _parisc_agp_info {
 
 	int lba_cap_offset;
 
-	u64 *gatt;
+	__le64 *gatt;
 	u64 gatt_entries;
 
 	u64 gart_base;
@@ -104,7 +104,7 @@ parisc_agp_create_gatt_table(struct agp_bridge_data *bridge)
 	int i;
 
 	for (i = 0; i < info->gatt_entries; i++) {
-		info->gatt[i] = (unsigned long)agp_bridge->scratch_page;
+		info->gatt[i] = cpu_to_le64(agp_bridge->scratch_page);
 	}
 
 	return 0;
@@ -158,9 +158,9 @@ parisc_agp_insert_memory(struct agp_memory *mem, off_t pg_start, int type)
 		for (k = 0;
 		     k < info->io_pages_per_kpage;
 		     k++, j++, paddr += info->io_page_size) {
-			info->gatt[j] =
+			info->gatt[j] = cpu_to_le64(
 				parisc_agp_mask_memory(agp_bridge,
-					paddr, type);
+					paddr, type));
 			asm_io_fdc(&info->gatt[j]);
 		}
 	}
@@ -184,7 +184,7 @@ parisc_agp_remove_memory(struct agp_memory *mem, off_t pg_start, int type)
 	io_pg_start = info->io_pages_per_kpage * pg_start;
 	io_pg_count = info->io_pages_per_kpage * mem->page_count;
 	for (i = io_pg_start; i < io_pg_count + io_pg_start; i++) {
-		info->gatt[i] = agp_bridge->scratch_page;
+		info->gatt[i] = cpu_to_le64(agp_bridge->scratch_page);
 	}
 
 	agp_bridge->driver->tlb_flush(mem);
@@ -204,7 +204,8 @@ parisc_agp_mask_memory(struct agp_bridge_data *bridge, dma_addr_t addr,
 	pa |= (ci >> PAGE_SHIFT) & 0xff;/* move CI (8 bits) into lowest byte */
 	pa |= SBA_PDIR_VALID_BIT;	/* set "valid" bit */
 
-	return cpu_to_le64(pa);
+	/* return native (big-endian) PDIR entry */
+	return pa;
 }
 
 static void
@@ -251,7 +252,8 @@ static int __init
 agp_ioc_init(void __iomem *ioc_regs)
 {
 	struct _parisc_agp_info *info = &parisc_agp_info;
-        u64 iova_base, *io_pdir, io_tlb_ps;
+        u64 iova_base, io_tlb_ps;
+	__le64 *io_pdir;
         int io_tlb_shift;
 
         printk(KERN_INFO DRVPFX "IO PDIR shared with sba_iommu\n");
-- 
2.41.0


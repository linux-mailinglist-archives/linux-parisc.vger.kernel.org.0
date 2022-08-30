Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237145A6A94
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Aug 2022 19:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbiH3RbI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 30 Aug 2022 13:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbiH3Raf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 30 Aug 2022 13:30:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E02C32FB;
        Tue, 30 Aug 2022 10:27:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A764617CA;
        Tue, 30 Aug 2022 17:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05ABC43470;
        Tue, 30 Aug 2022 17:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661880355;
        bh=AMvkWcumkyw9/k0EQQQuY6LBmsfboRqftOvewoCknF0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G7CDzrzPXB37ExIjDEKtF+MQUGyfZB32u8kEwqvW2tFxin/Keck9MoziJf+E7x9dF
         4E3AWFUxC9a/eO5Kl9ClerXEsievVe8jXmMQ+CZh2hydyz/raAZu37yX/4iQtMb3zO
         JTAksAGdmNQBQnkxVC9+c6wFU2IsphBz17Pfc2jseNnFc0buAA4f6KWyzONg1/krgt
         yecCpqAuwvnzBnz1sA2q7MzLLVOdM4GyOBht+uAlsyt/Cbp9HLqztGzBIffIRHMfxY
         pUr0ds6i5BvwIqIGooTM/54wNOGYHQNAwY3PKbQu1pfvLF5v9pYPR/VSDC8okA6+D6
         yuWF/0EH77yIA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Li Qiong <liqiong@nfschina.com>, Helge Deller <deller@gmx.de>,
        Sasha Levin <sashal@kernel.org>,
        James.Bottomley@HansenPartnership.com, linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 04/10] parisc: ccio-dma: Handle kmalloc failure in ccio_init_resources()
Date:   Tue, 30 Aug 2022 13:25:35 -0400
Message-Id: <20220830172541.581820-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172541.581820-1-sashal@kernel.org>
References: <20220830172541.581820-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Li Qiong <liqiong@nfschina.com>

[ Upstream commit d46c742f827fa2326ab1f4faa1cccadb56912341 ]

As the possible failure of the kmalloc(), it should be better
to fix this error path, check and return '-ENOMEM' error code.

Signed-off-by: Li Qiong <liqiong@nfschina.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/parisc/ccio-dma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 6efab7a06c5fc..73ee74d6e7a3d 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1390,15 +1390,17 @@ ccio_init_resource(struct resource *res, char *name, void __iomem *ioaddr)
 	}
 }
 
-static void __init ccio_init_resources(struct ioc *ioc)
+static int __init ccio_init_resources(struct ioc *ioc)
 {
 	struct resource *res = ioc->mmio_region;
 	char *name = kmalloc(14, GFP_KERNEL);
-
+	if (unlikely(!name))
+		return -ENOMEM;
 	snprintf(name, 14, "GSC Bus [%d/]", ioc->hw_path);
 
 	ccio_init_resource(res, name, &ioc->ioc_regs->io_io_low);
 	ccio_init_resource(res + 1, name, &ioc->ioc_regs->io_io_low_hv);
+	return 0;
 }
 
 static int new_ioc_area(struct resource *res, unsigned long size,
@@ -1552,7 +1554,10 @@ static int __init ccio_probe(struct parisc_device *dev)
 		return -ENOMEM;
 	}
 	ccio_ioc_init(ioc);
-	ccio_init_resources(ioc);
+	if (ccio_init_resources(ioc)) {
+		kfree(ioc);
+		return -ENOMEM;
+	}
 	hppa_dma_ops = &ccio_ops;
 	dev->dev.platform_data = kzalloc(sizeof(struct pci_hba_data), GFP_KERNEL);
 
-- 
2.35.1


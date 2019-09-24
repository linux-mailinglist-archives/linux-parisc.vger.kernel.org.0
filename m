Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E68EBCAC3
	for <lists+linux-parisc@lfdr.de>; Tue, 24 Sep 2019 17:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409772AbfIXPBo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 24 Sep 2019 11:01:44 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:59086 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390565AbfIXPBn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 24 Sep 2019 11:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=asTpfATHVdYEYQSAzZcEjMAWgV2/KRyuMk1HUDQHBjc=; b=PvFh5yd3mdo1z6yhrAVH1ePkAo
        6LBbYmGkpdJg65jDje2CuuL0isd7FvmyAtsvVa59Aauk6WgjBYxFctbCl8CvuXXs6kQGzSU4r7hAn
        sq6sSLzclAeXdgswlSawjpxZlcxYJZoEk4obAY/auJuDvjpRLy2LT491oj+rWGPNnCfo=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de ([46.5.233.221] helo=x280.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1iCmJx-0006Pc-LN; Tue, 24 Sep 2019 17:01:41 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: remove 32-bit DMA enforcement from sba_iommu
Date:   Tue, 24 Sep 2019 17:01:31 +0200
Message-Id: <20190924150131.24404-1-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This breaks booting from sata_sil24 with the recent DMA
change. According to James Bottomley this was in to improve
performance. Remove it for now to make DMA working again.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 drivers/parisc/sba_iommu.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 296668caf7e5..6ac9500f2752 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -678,14 +678,6 @@ static int sba_dma_supported( struct device *dev, u64 mask)
 		return(0);
 	}
 
-	/* Documentation/DMA-API-HOWTO.txt tells drivers to try 64-bit
-	 * first, then fall back to 32-bit if that fails.
-	 * We are just "encouraging" 32-bit DMA masks here since we can
-	 * never allow IOMMU bypass unless we add special support for ZX1.
-	 */
-	if (mask > ~0U)
-		return 0;
-
 	ioc = GET_IOC(dev);
 	if (!ioc)
 		return 0;
-- 
2.23.0.rc1


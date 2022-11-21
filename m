Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA3B632342
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Nov 2022 14:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiKUNQh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 21 Nov 2022 08:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKUNQg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Nov 2022 08:16:36 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C453418B24
        for <linux-parisc@vger.kernel.org>; Mon, 21 Nov 2022 05:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=Iu5qvlybAa38cYhxG7+Q3GkKys0eQm++/EOJTfcd+NQ=; b=IKyLoNC0av06SmE/2kRuCBTx99
        nQd0jnN9W7F1nrQ/ewWl2JT0KBeTojzjymQJsTdgWBwzBN/lFmxa4SB4iFWugJ0B85P90coG/fUmR
        YASlvHIgfYZZAUCzE30X9fZW1UcFeMlB5XbyPJawFvqpthe/qgNHca0Yvdb01gEPeSca6D0SXEOX0
        wkeOBav1CBxqajyE+HtRsnehVO2BsIirKzXSvT0gsPcXUvaJE/OaNBFgkCfStAazsqYVmmmA9DgQq
        JsdqM6fO/Pa9obrR6Xpr3wRVX3/gjam3uOyBKL5o72zg5NCOXjN6gTqDpZpxiWD1DsRjjHnca0oE4
        WDuFpwdQ==;
Received: from [2001:4bb8:199:6d04:9a88:dc19:c657:d17f] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ox6ey-00Dwvb-Vn; Mon, 21 Nov 2022 13:16:29 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, iommu@lists.linux.dev
Subject: [PATCH 1/2] dma-mapping: add a arch_can_dma_alloc_coherent hook
Date:   Mon, 21 Nov 2022 14:16:22 +0100
Message-Id: <20221121131623.228727-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221121131623.228727-1-hch@lst.de>
References: <20221121131623.228727-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This hook allows an architecture to reject coherent DMA allocations
entirely if they can't be supported.  This will be useful to convert
parisc and m68knommu to the generic dma-direct code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-map-ops.h | 1 +
 kernel/dma/Kconfig          | 3 +++
 kernel/dma/direct.c         | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index d678afeb8a13a..10272f95cdb64 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -344,6 +344,7 @@ static inline void arch_dma_mark_clean(phys_addr_t paddr, size_t size)
 }
 #endif /* ARCH_HAS_DMA_MARK_CLEAN */
 
+bool arch_can_dma_alloc_coherent(void);
 void *arch_dma_set_uncached(void *addr, size_t size);
 void arch_dma_clear_uncached(void *addr, size_t size);
 
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 56866aaa2ae1a..6fd4efe71d136 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -20,6 +20,9 @@ config DMA_OPS
 config DMA_OPS_BYPASS
 	bool
 
+config ARCH_HAS_CAN_DMA_ALLOC_COHERENT
+	bool
+
 # Lets platform IOMMU driver choose between bypass and IOMMU
 config ARCH_HAS_DMA_MAP_DIRECT
 	bool
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 63859a101ed83..03929482e92f7 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -232,6 +232,10 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 			return arch_dma_alloc(dev, size, dma_handle, gfp,
 					      attrs);
 
+		if (IS_ENABLED(CONFIG_ARCH_HAS_CAN_DMA_ALLOC_COHERENT) &&
+		    !arch_can_dma_alloc_coherent())
+			return NULL;
+
 		/*
 		 * If there is a global pool, always allocate from it for
 		 * non-coherent devices.
-- 
2.30.2


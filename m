Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76ED95E6BA6
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Sep 2022 21:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbiIVTUt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 22 Sep 2022 15:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbiIVTUq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Sep 2022 15:20:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFA5F858D
        for <linux-parisc@vger.kernel.org>; Thu, 22 Sep 2022 12:20:45 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id k10so16318754lfm.4
        for <linux-parisc@vger.kernel.org>; Thu, 22 Sep 2022 12:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=KtnnvekeIG3AbHaZTlvsgkpZEmg94g53bOzjaDeD0m0=;
        b=GwUN2WmOMes03sCM4vcCQfLNMzRw/WSaQHhpu/xiOlQP3jDC3xr2PI91CHDlsp6j9m
         MVWXl+TMygIS1IJvFIhRPn6Yy8gUIMNUjEsAUNxf9QB3jrPEipTrl542qt0SuXIOaKBS
         ku/BlTDq3RBPEmNrjTBkFto1PZ2RkCldhWvuKY50wGQmSEn8xL94rI7EFxemLH9DloLB
         S1WOoT7N0EG7/LePcuyDV3hcamOdjzM9y0hSxN1C2T1hiSfU1zVWAcNlDI1uyyAp9nSL
         farcVQXrKBvDQ73u380xIyRQX46X8hBwRo9eES3OJhFtHdgHs13vu9V0/ETCXwF3sZWv
         gGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=KtnnvekeIG3AbHaZTlvsgkpZEmg94g53bOzjaDeD0m0=;
        b=zMMdfa341f2xsJGnQb1LRev+vRuICJoo1dUTjt7eYabU3LjgkboDO1EO3S0tdD3P9z
         g7XieJ5qPuF7g1nsM+S701uT2rSbawdxS9MhbITx3RY71qcU1hTpP8frWWkBjGbuHpDM
         H4rJ8lbhQl45PA0x3GTCi7WIlgrdV2oP6evrltijYHRVL+iR3assuV6Kc+IXoZrUbDni
         bt2FpORk8mRfc1AF4LjTr2UsomxBBhyJmDdvANhj5oPORM58NM5dxmj3/ZNlLcCMQkSs
         4r7ZEp4929gPG5EW67d7oZ/fgqKTiy8ZUbE/FZL7OcMV8cEMcBgqZ/Juo9Iuta2+l836
         Ws4A==
X-Gm-Message-State: ACrzQf37EqXIe35Td9TcOXjBzYkLoC1dWmOr5pnsGlFFBjQcxBhqIXFB
        mRt3wwkqN+sA0dnMWgW1Ohqihw==
X-Google-Smtp-Source: AMsMyM6OgvYu2UItbjr6/8Zr8NrldHCVxo9qibiV8uwWBgyPSDBnrAjABYu3iWLbD3dHanWcb281kw==
X-Received: by 2002:a05:6512:3091:b0:49a:d800:2828 with SMTP id z17-20020a056512309100b0049ad8002828mr1862379lfd.534.1663874443611;
        Thu, 22 Sep 2022 12:20:43 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id z7-20020a056512376700b00498fbec3f8asm1072199lft.129.2022.09.22.12.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:20:42 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] parisc: Drop homebrewn io[read|write]64_[lo_hi|hi_lo]
Date:   Thu, 22 Sep 2022 21:18:39 +0200
Message-Id: <20220922191839.585186-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The parisc implements ioread64_lo_hi(), ioread64_hi_lo()
iowrite64_lo_hi() and iowrite64_hi_lo() while we already
have a perfectly working generic version in the generic
portable assembly in <linux/io-64-nonatomic-hi-lo.h>.

Drop the custom versions in favor for the defaults.

Fixes: 77bfc8bdb5a1 ("parisc: Remove 64bit access on 32bit machines")
Cc: Arnd Bergmann <arnd@arndb.de>
Acked-by: Helge Deller <deller@gmx.de>
Reported-by: Helge Deller <deller@gmx.de>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Arnd: please queue this on top of your pile in linux-arch
if it looks all right.
---
 arch/parisc/lib/iomap.c | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/arch/parisc/lib/iomap.c b/arch/parisc/lib/iomap.c
index d3d57119df64..915c0c4da663 100644
--- a/arch/parisc/lib/iomap.c
+++ b/arch/parisc/lib/iomap.c
@@ -360,26 +360,6 @@ u64 ioread64be(const void __iomem *addr)
 }
 #endif
 
-u64 ioread64_lo_hi(const void __iomem *addr)
-{
-	u32 low, high;
-
-	low = ioread32(addr);
-	high = ioread32(addr + sizeof(u32));
-
-	return low + ((u64)high << 32);
-}
-
-u64 ioread64_hi_lo(const void __iomem *addr)
-{
-	u32 low, high;
-
-	high = ioread32(addr + sizeof(u32));
-	low = ioread32(addr);
-
-	return low + ((u64)high << 32);
-}
-
 void iowrite8(u8 datum, void __iomem *addr)
 {
 	if (unlikely(INDIRECT_ADDR(addr))) {
@@ -445,18 +425,6 @@ void iowrite64be(u64 datum, void __iomem *addr)
 }
 #endif
 
-void iowrite64_lo_hi(u64 val, void __iomem *addr)
-{
-	iowrite32(val, addr);
-	iowrite32(val >> 32, addr + sizeof(u32));
-}
-
-void iowrite64_hi_lo(u64 val, void __iomem *addr)
-{
-	iowrite32(val >> 32, addr + sizeof(u32));
-	iowrite32(val, addr);
-}
-
 /* Repeating interfaces */
 
 void ioread8_rep(const void __iomem *addr, void *dst, unsigned long count)
@@ -564,8 +532,6 @@ EXPORT_SYMBOL(ioread32be);
 EXPORT_SYMBOL(ioread64);
 EXPORT_SYMBOL(ioread64be);
 #endif
-EXPORT_SYMBOL(ioread64_lo_hi);
-EXPORT_SYMBOL(ioread64_hi_lo);
 EXPORT_SYMBOL(iowrite8);
 EXPORT_SYMBOL(iowrite16);
 EXPORT_SYMBOL(iowrite16be);
@@ -575,8 +541,6 @@ EXPORT_SYMBOL(iowrite32be);
 EXPORT_SYMBOL(iowrite64);
 EXPORT_SYMBOL(iowrite64be);
 #endif
-EXPORT_SYMBOL(iowrite64_lo_hi);
-EXPORT_SYMBOL(iowrite64_hi_lo);
 EXPORT_SYMBOL(ioread8_rep);
 EXPORT_SYMBOL(ioread16_rep);
 EXPORT_SYMBOL(ioread32_rep);
-- 
2.37.3


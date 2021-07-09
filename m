Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606F23C252C
	for <lists+linux-parisc@lfdr.de>; Fri,  9 Jul 2021 15:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbhGINsb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 9 Jul 2021 09:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbhGINsb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 9 Jul 2021 09:48:31 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A0AC0613E5
        for <linux-parisc@vger.kernel.org>; Fri,  9 Jul 2021 06:45:47 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id t19so9298505qkg.7
        for <linux-parisc@vger.kernel.org>; Fri, 09 Jul 2021 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:organization:mime-version
         :content-transfer-encoding;
        bh=c0nabnxYO3Pj1tSNnj4zugZjojE0WvtH+XiU1QLpplE=;
        b=c6vP56wKhvfdWxYbh0FZ6eEWIP2TwTBo/IEIShGNTEady0yXtT35b9WNF3F3i4yuHt
         dr8XkwhtxTKDFlAm1NUa0rfhhBnftLLbXdrB5dyn3//2AI6tu1tmm2uGXqwMEf7GVc/k
         Z6cIvHwShz/A0EsHWhIvYtE0EJVKoV8NznZsN079akD/jEvRj3GgZ5F6OVjOgD3ruE5o
         5G+m4gCLo9dryP06TmjBwkvpxf1bI5vXjfO3nZd2Ijb6YtNMqNPW+aAfL1CQz5iULmOq
         Aa0KWkylTkLp4AQzz/NG5OdM+oWpaH+Q10gdi2DRzxpGsu8alQwmXUdES42Et/njhKB3
         pT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:organization
         :mime-version:content-transfer-encoding;
        bh=c0nabnxYO3Pj1tSNnj4zugZjojE0WvtH+XiU1QLpplE=;
        b=OZ3HTftSnUPiw+4jbpLvTpl6WbGAweY9g0nthnKGwicA2S9uUYEYDvz814MFIySbLc
         AObXbM5wf+HU0Li+R5qlq/Cb5uC2mAzqB+OAh+mFS9jiHdc3zRIiM1hiWVDgd7LUklP5
         prcWPXLGNWN7Juwu9HlcsuLa3NK0iZKjcXYBku3UpcBLGKNLEer9rVEHf+5iUfEHI820
         YKNcqDLMbeunC9qSJHj0Cje40+2syYVceoWvZq1Rz82VmT6Vg3b7dR1e7KTGUvy8NhHU
         hH+nfM4STyRLJiyPSogATNHv8vCqGtrEIoBgnqIbugbIRRN8aBAS2MrumZPEH/f+Xq9G
         t0Fg==
X-Gm-Message-State: AOAM5333Qsk0hzIy9vluuoj69ndZALxDk5joABGo2nMHFsgfVs1qX6nO
        5KUKRHuyzLchzo5FU59qotYnuA==
X-Google-Smtp-Source: ABdhPJwaY/NYjnSHtnDtPk05bzLYGSIb2okWI7rBD7izjBQBs/PJERicaEGEYxglgF6fk2sIqYUdiw==
X-Received: by 2002:a05:620a:1988:: with SMTP id bm8mr36222833qkb.222.1625838346722;
        Fri, 09 Jul 2021 06:45:46 -0700 (PDT)
Received: from iron-maiden.localnet ([50.225.136.98])
        by smtp.gmail.com with ESMTPSA id k66sm2612711qke.28.2021.07.09.06.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 06:45:46 -0700 (PDT)
From:   Carlos Bilbao <bilbao@vt.edu>
To:     James.Bottomley@hansenpartnership.com, deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: parisc: Update sba_iommu driver with proper printks
Date:   Fri, 09 Jul 2021 09:45:45 -0400
Message-ID: <4359868.LvFx2qVVIh@iron-maiden>
Organization: Virginia Tech
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The code from the old SBA IOMMU manager is outdated when it comes to printks. 
Fix applying proper indentation and using dev_dbg() instead of printk on 
debugging blocks. Also add a KERN_<LEVEL> where it is missing.

Signed-off-by: Carlos Bilbao <bilbao@vt.edu>
---
 drivers/parisc/sba_iommu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index dce4cdf786cd..ca5d43bb347d 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -16,6 +16,7 @@
 ** FIXME: add DMA hint support programming in both sba and lba modules.
 */
 
+#include <linux/dev_printk.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
@@ -65,26 +66,26 @@
 #undef DEBUG_DMB_TRAP
 
 #ifdef DEBUG_SBA_INIT
-#define DBG_INIT(x...)	printk(x)
+#define DBG_INIT(x...)	dev_dbg(x)
 #else
 #define DBG_INIT(x...)
 #endif
 
 #ifdef DEBUG_SBA_RUN
-#define DBG_RUN(x...)	printk(x)
+#define DBG_RUN(x...)	dev_dbg(x)
 #else
 #define DBG_RUN(x...)
 #endif
 
 #ifdef DEBUG_SBA_RUN_SG
-#define DBG_RUN_SG(x...)	printk(x)
+#define DBG_RUN_SG(x...)	dev_dbg(x)
 #else
 #define DBG_RUN_SG(x...)
 #endif
 
 
 #ifdef DEBUG_SBA_RESOURCE
-#define DBG_RES(x...)	printk(x)
+#define DBG_RES(x...)	dev_dbg(x)
 #else
 #define DBG_RES(x...)
 #endif
@@ -1276,7 +1277,7 @@ sba_ioc_init_pluto(struct parisc_device *sba, struct ioc *ioc, int ioc_num)
 	iova_space_size = ~(READ_REG(ioc->ioc_hpa + IOC_IMASK) & 0xFFFFFFFFUL) + 1;
 
 	if ((ioc->ibase < 0xfed00000UL) && ((ioc->ibase + iova_space_size) > 0xfee00000UL)) {
-		printk("WARNING: IOV space overlaps local config and interrupt message, truncating\n");
+		printk(KERN_WARNING "WARNING: IOV space overlaps local config and interrupt message, truncating\n");
 		iova_space_size /= 2;
 	}
 
@@ -1550,7 +1551,7 @@ static void sba_hw_init(struct sba_device *sba_dev)
 
 
 #if 0
-printk("sba_hw_init(): mem_boot 0x%x 0x%x 0x%x 0x%x\n", PAGE0->mem_boot.hpa,
+	dev_dbg("sba_hw_init(): mem_boot 0x%x 0x%x 0x%x 0x%x\n", PAGE0->mem_boot.hpa,
 	PAGE0->mem_boot.spa, PAGE0->mem_boot.pad, PAGE0->mem_boot.cl_class);
 
 	/*
-- 
2.25.1




Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECF93C15E7
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Jul 2021 17:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhGHP23 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 8 Jul 2021 11:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbhGHP23 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 8 Jul 2021 11:28:29 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6136AC061574
        for <linux-parisc@vger.kernel.org>; Thu,  8 Jul 2021 08:25:46 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id g4so6020784qkl.1
        for <linux-parisc@vger.kernel.org>; Thu, 08 Jul 2021 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:organization:mime-version
         :content-transfer-encoding;
        bh=ZlsmpUZ3dqpWLyD9xGWZtjT/n2aBeI2MV4ZA7OeTIJE=;
        b=JX1jiFOpEifP7nXEV+l7qXTqB/HpAHr5Y4V5OqIKYTgubw7yR7sQ0AMWtdU252XEPV
         nulK4XSgludUXIgMZNSh3t0VUIeJKPP6uIdsM6ZklTJ7WvjoTZm5YkI9pVHVNZEzUjn6
         RBPChln9daFTztYlfZOPh8jiHA21Qi07eeHIXBor4KJ9bB4ga7zZTSxpUBPAUuxugDx8
         rCjL9SUIwGO6jA10YB2JPZ9yIw75IsEbS2PMYcJGubbskvqGPK+k41coVcF4VHTqaYI2
         FQlpAXIBNW329Q/H5iQSiuIXBJiZXaVGEG6DmZUxafOvKWiI/js5h6k8iuAWO/RCcL1S
         e9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:organization
         :mime-version:content-transfer-encoding;
        bh=ZlsmpUZ3dqpWLyD9xGWZtjT/n2aBeI2MV4ZA7OeTIJE=;
        b=In7QmVgwn/39JOAaZEVFYWSN1fXIRzgiJHMqWFM60Ez9rfoBfVYJFQi3cd022Gqr4C
         tP5JgAE/FDHxQRBDTbglL7RwobGaBlorM5afHkgWPs3h9qucFNaajvFRxsFOrtJYcgk1
         d+iEuUCQFuzL5UomlabJjeG2pTeeanvX/IZ5N6UHQUuM62ik/O9vBkeNkOogZ6TvVArp
         BFk1DRifipnu3c2BzWomjUpxqXXWn6owhGpHisOXRGJeESCXbgb1yDfD1rydhbZr0C6y
         m+PN7aom0UW5lxa7v2ExE1go+6Mhpk3WbGvh7fiNa1UZoGv94ZbRNe71/6Xsx/QRCQht
         FY7Q==
X-Gm-Message-State: AOAM530YOCvSK6pD3mSlYUqvDZVetpx1B0MROI8L407ZAb7EQa54HEYy
        ar/sZSMOyws7mykkSYckKgVLDg==
X-Google-Smtp-Source: ABdhPJzlnN/DdwjUTZRoDmXWDXPzwZfq3mQopOF5elSUKGRVoaL7qo3K3JzF8ZcimejjDuXT+boFxA==
X-Received: by 2002:a05:620a:4dd:: with SMTP id 29mr27156031qks.250.1625757945517;
        Thu, 08 Jul 2021 08:25:45 -0700 (PDT)
Received: from iron-maiden.localnet ([50.225.136.98])
        by smtp.gmail.com with ESMTPSA id b188sm1073658qkf.133.2021.07.08.08.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 08:25:45 -0700 (PDT)
From:   Carlos Bilbao <bilbao@vt.edu>
To:     James.Bottomley@hansenpartnership.com
Cc:     deller@gmx.de, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrew@lunn.ch
Subject: [PATCH] drivers: parisc: Follow the indentation coding standard on printks
Date:   Thu, 08 Jul 2021 11:25:44 -0400
Message-ID: <1793924.CQOukoFCf9@iron-maiden>
Organization: Virginia Tech
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix indentation of printks that start at the beginning of the line. Change this 
for the right number of space characters, or tabs if the file uses them. 

Signed-off-by: Carlos Bilbao <bilbao@vt.edu>
---
 drivers/parisc/iosapic.c               | 4 ++--
 drivers/parisc/sba_iommu.c             | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index 8a3b0c3a1e92..5d27c23e6429 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -633,7 +633,7 @@ static void iosapic_unmask_irq(struct irq_data *d)
 	printk("\n");
 }
 
-printk("iosapic_enable_irq(): sel ");
+	printk("iosapic_enable_irq(): sel ");
 {
 	struct iosapic_info *isp = vi->iosapic;
 
@@ -642,7 +642,7 @@ printk("iosapic_enable_irq(): sel ");
 		printk(" %x", d1);
 	}
 }
-printk("\n");
+	printk("\n");
 #endif
 
 	/*
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index dce4cdf786cd..c3381facdfc5 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -1550,7 +1550,7 @@ static void sba_hw_init(struct sba_device *sba_dev)
 
 
 #if 0
-printk("sba_hw_init(): mem_boot 0x%x 0x%x 0x%x 0x%x\n", PAGE0->mem_boot.hpa,
+	printk("sba_hw_init(): mem_boot 0x%x 0x%x 0x%x 0x%x\n", PAGE0->mem_boot.hpa,
 	PAGE0->mem_boot.spa, PAGE0->mem_boot.pad, PAGE0->mem_boot.cl_class);
 
 	/*
-- 
2.25.1





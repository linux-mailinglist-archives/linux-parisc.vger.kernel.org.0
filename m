Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA64F4AC3AC
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Feb 2022 16:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237012AbiBGPcc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 7 Feb 2022 10:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237870AbiBGPRf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 7 Feb 2022 10:17:35 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 07:17:34 PST
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64F7C0401C1
        for <linux-parisc@vger.kernel.org>; Mon,  7 Feb 2022 07:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644247054; x=1675783054;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RVfpHwKqjohdLekv0K+S7TGWa9dDO77kQ5CF3SAMaFk=;
  b=jX++m6o+rstETn/iKsoq4juviCRN/MYK/Uyrer0nZDoohZ69gilK0qLv
   6iEiZgbDCszpeL2h8VDFzx0+X8Ur/CZ1W2ISJkkkgAlPl8DqlyVN/uOUl
   lfeSWp8PsjsP58sKBIfWVVHkBoN0BMj3TQBr0WRxJ94x3sV8klgyT6I2f
   m4BI0t9+fQnnKR05K28+dT3yW7Vsz4UcaJuqLZOPCYQyf+YcCm2mDQekU
   UCQOtWlTdu3AStvdx/ncHIdTK6nxP9k6UnbT86RWd9YAxo3QPzTtkKEAE
   tT8BNnHxeaTJGrv4bgV1sG+3cJEcYnjf7u7JRU2kzDJS3Qm+yzOWk6jvW
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="335137274"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="335137274"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 07:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="540139670"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 07 Feb 2022 07:16:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3AFB631D; Mon,  7 Feb 2022 17:16:44 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Subject: [PATCH v1 1/1] parisc: Add ioread64_lo_hi() and iowrite64_lo_hi()
Date:   Mon,  7 Feb 2022 17:16:39 +0200
Message-Id: <20220207151639.75086-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

It's a followup to the previous commit f15309d7ad5d ("parisc: Add
ioread64_hi_lo() and iowrite64_hi_lo()") which does only half of
the job. Add the rest, so we won't get a new kernel test robot
reports.

Fixes: f15309d7ad5d ("parisc: Add ioread64_hi_lo() and iowrite64_hi_lo()")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/parisc/lib/iomap.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/parisc/lib/iomap.c b/arch/parisc/lib/iomap.c
index 367f6397bda7..860385058085 100644
--- a/arch/parisc/lib/iomap.c
+++ b/arch/parisc/lib/iomap.c
@@ -346,6 +346,16 @@ u64 ioread64be(const void __iomem *addr)
 	return *((u64 *)addr);
 }
 
+u64 ioread64_lo_hi(const void __iomem *addr)
+{
+	u32 low, high;
+
+	low = ioread32(addr);
+	high = ioread32(addr + sizeof(u32));
+
+	return low + ((u64)high << 32);
+}
+
 u64 ioread64_hi_lo(const void __iomem *addr)
 {
 	u32 low, high;
@@ -419,6 +429,12 @@ void iowrite64be(u64 datum, void __iomem *addr)
 	}
 }
 
+void iowrite64_lo_hi(u64 val, void __iomem *addr)
+{
+	iowrite32(val, addr);
+	iowrite32(val >> 32, addr + sizeof(u32));
+}
+
 void iowrite64_hi_lo(u64 val, void __iomem *addr)
 {
 	iowrite32(val >> 32, addr + sizeof(u32));
@@ -530,6 +546,7 @@ EXPORT_SYMBOL(ioread32);
 EXPORT_SYMBOL(ioread32be);
 EXPORT_SYMBOL(ioread64);
 EXPORT_SYMBOL(ioread64be);
+EXPORT_SYMBOL(ioread64_lo_hi);
 EXPORT_SYMBOL(ioread64_hi_lo);
 EXPORT_SYMBOL(iowrite8);
 EXPORT_SYMBOL(iowrite16);
@@ -538,6 +555,7 @@ EXPORT_SYMBOL(iowrite32);
 EXPORT_SYMBOL(iowrite32be);
 EXPORT_SYMBOL(iowrite64);
 EXPORT_SYMBOL(iowrite64be);
+EXPORT_SYMBOL(iowrite64_lo_hi);
 EXPORT_SYMBOL(iowrite64_hi_lo);
 EXPORT_SYMBOL(ioread8_rep);
 EXPORT_SYMBOL(ioread16_rep);
-- 
2.34.1


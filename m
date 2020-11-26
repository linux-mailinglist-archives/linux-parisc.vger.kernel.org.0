Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0C62C5474
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Nov 2020 14:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389790AbgKZNGH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Nov 2020 08:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389799AbgKZNGG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Nov 2020 08:06:06 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38781C0617A7
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2020 05:06:04 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id i17so2287682ljd.3
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2020 05:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YZf4/VZqM+Z9lbh8Toi6q5/Zm7QXw+MN5AWWv9ll1M=;
        b=uppblSurxa3P9JcajMHBOPQWGc29jSYIYmUhm+agj0vBg/LmXAvgQiSzQa0SHBemln
         JEbwpdsi2TaZXWqPVBbKMKOtiXH0B9pXxVRbRb/Ii0SGBw2r9axKkgCY7cwCFOPXi0k8
         aaHfL69InCFbVxqGhoZ6CVAzr/RI9mB5NYctuHOdRbWj/1t1YgInBqNlhDxqwW23KGK/
         I3aEWUsOsUBmeVs/fiixGx1POtf3bMGgku2hXknPP+m1i+qXwr6j2Hjj95ieHoIP3V/I
         j9cfNnKML2guNcRb2O92AKgGTDhQkzbcYqZ9cmmTkcHAzPZqb4b+sSb9Wji6Lxh0CvGZ
         brcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YZf4/VZqM+Z9lbh8Toi6q5/Zm7QXw+MN5AWWv9ll1M=;
        b=T2fGSinGIMxa/6sWpgDqscgOVSeGyuXKkXVVpd4Kuzag2u9SUPsfmecHvLh1+1cUhN
         ZwdU7ImQzsFBINcpRhY3zin5LeaGHcDPQkdgMGaVdO+2sSGKMgvjjrLiykaIW/47N3HB
         goIaCWvgCEVOHP+mJrWayNBz4GrK/KZVStblDO2E1Jc3MWRJD0MiWfcUiKVXLEuXzsGv
         PNXXnEMC8XSnvJ5nuZO5Z8qY+JZlW8/SzCdWWsqlTBCXTp35609s1Gqbh8X1KbrT2+oR
         sGSC66o9T/6VRXfdJEbgwBnLkUilOCK5+EaZYdqWeVp0/LR09Ay4eTcPxfFU9/qinq8/
         Gqdg==
X-Gm-Message-State: AOAM5309TrTP3QoHo1pZN9xGjfHQEFHgyCb8SZFcXxmZ8yyyjRVwoTrD
        H0mbC2hIzAjsQdGsIAv+CKcFBw==
X-Google-Smtp-Source: ABdhPJzjW6rxKvOmhpsBZnFOvyZwT4zrQYqYBz7gfWPJ3rPoqzHjg5M7x3Oqru2CO9bTxqbyqEks1w==
X-Received: by 2002:a2e:731a:: with SMTP id o26mr1164563ljc.98.1606395962373;
        Thu, 26 Nov 2020 05:06:02 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id c5sm310077lfg.84.2020.11.26.05.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:06:01 -0800 (PST)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     James.Bottomley@HansenPartnership.com, deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] parisc: pci-dma: fix warning unused-function
Date:   Thu, 26 Nov 2020 14:06:00 +0100
Message-Id: <20201126130600.2290331-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When building tinyconfig on parisc the following warnign shows up:

/tmp/arch/parisc/kernel/pci-dma.c:338:12: warning: 'proc_pcxl_dma_show' defined but not used [-Wunused-function]
 static int proc_pcxl_dma_show(struct seq_file *m, void *v)
            ^~~~~~~~~~~~~~~~~~

Mark the function as __maybe_unused to fix the warning.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/parisc/kernel/pci-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 36610a5c029f..36a57aa38e87 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -335,7 +335,7 @@ pcxl_free_range(unsigned long vaddr, size_t size)
 	dump_resmap();
 }
 
-static int proc_pcxl_dma_show(struct seq_file *m, void *v)
+static int __maybe_unused proc_pcxl_dma_show(struct seq_file *m, void *v)
 {
 #if 0
 	u_long i = 0;
-- 
2.29.2


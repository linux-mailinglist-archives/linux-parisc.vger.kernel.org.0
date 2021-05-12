Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6EF837B599
	for <lists+linux-parisc@lfdr.de>; Wed, 12 May 2021 07:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhELFuV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 12 May 2021 01:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhELFuV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 12 May 2021 01:50:21 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E64C061574
        for <linux-parisc@vger.kernel.org>; Tue, 11 May 2021 22:49:14 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id i190so17676875pfc.12
        for <linux-parisc@vger.kernel.org>; Tue, 11 May 2021 22:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=li9YcYROAunICMjiIw6dES/TTsumuPv/+LxZYrriycI=;
        b=sfLawrKWz60UmsSTnWGWnGc6q93yAAM8jNpJGQrnbXGnj4Y3a9YZ2AciN1n2OcU15D
         jYJbiA1+YuKCL2lttNw6MKGB6FDSFb2KRBEJdJzv8lVPiIglzAG+CnkfLoLrvOkq3x3y
         0CgntRMbDx7K0mZ0tHGzBi2tDQZ7uxjtG5FZ2y7NhiJXnAgkNQuEDeqnJLkE/7MS4a7a
         07KdimdbMtMdnjHNtloA8jNprkhG+6Uqv/OTh4iPFqgLB20XNoNuYTcVRrHk/MPZ2ZiV
         eypHw1XRZ5dAXEyYBhRMJfi+qiHNw3+HtQuxnRo9BxbyQM0A2mLl6nRkXSTOJ+BjQObb
         G4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=li9YcYROAunICMjiIw6dES/TTsumuPv/+LxZYrriycI=;
        b=UkemHw++npnrWG1ZF3sfespiZPRMlXZ9eeLngywVYEG9oxxvwiMlBCRFle1EBLsthH
         LeCvHY+pPfbNpG4k46B7XcnCbDItrWmr3LInkmcUwthYLjrZdy2sjMq7boCxEkADTlYg
         RwxhJURC07lTTNtI6d0Kc4p33JU8Hwde4wTn7wQYXcQQ3Yxj0dmxDkraWyl9Z6RNPB8f
         O3BMhx9Mnw7ycALX5L/3OQ5/i2s4ZOZbVwJOBss+krpHe+AUkqTJEulAdvDY6j2UkmGH
         mvfERtUqs5VH7X829Fkt830+69sQ4L+p2G3YYxsYxKklZ/hdvRzyI+pTLaJ0/c93yODG
         rDgA==
X-Gm-Message-State: AOAM533FHW6odGXd6Wm8zvO1TBXUIu2JQksPYchN0We6haIZA262YoPb
        4s+YnWv/z+aoZRWy2kcA3po=
X-Google-Smtp-Source: ABdhPJzyWbZfgKD6fNdFVfxf6BijZ3FJwb6GkEFOEvgJrSkjai9IOiCgfsZbR/IdEG4AFzZgOTS8hQ==
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr34055527pgb.110.1620798553597;
        Tue, 11 May 2021 22:49:13 -0700 (PDT)
Received: from yguoaz-VirtualBox.hz.ali.com ([106.11.30.45])
        by smtp.googlemail.com with ESMTPSA id gb9sm3526340pjb.7.2021.05.11.22.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 22:49:13 -0700 (PDT)
From:   Yiyuan GUO <yguoaz@gmail.com>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, yguoaz@gmail.com
Subject: [PATCH] video/logo: protect against divide by zero when reading image
Date:   Wed, 12 May 2021 13:48:43 +0800
Message-Id: <20210512054843.54883-1-yguoaz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

In video/logo/pnmtologo.c, the function read_image can read from the
image file an integer 0 and pass it to function get_number255, leading
to a divide by zero problem.

Signed-off-by: Yiyuan GUO <yguoaz@gmail.com>
---
 drivers/video/logo/pnmtologo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/logo/pnmtologo.c b/drivers/video/logo/pnmtologo.c
index 4718d7895..cc8dca5ef 100644
--- a/drivers/video/logo/pnmtologo.c
+++ b/drivers/video/logo/pnmtologo.c
@@ -118,7 +118,12 @@ static unsigned int get_number(FILE *fp)
 
 static unsigned int get_number255(FILE *fp, unsigned int maxval)
 {
-    unsigned int val = get_number(fp);
+    unsigned int val;
+
+    if (!maxval)
+	die("Corrupted maxval\n");
+
+    val = get_number(fp);
     return (255*val+maxval/2)/maxval;
 }
 
-- 
2.25.1


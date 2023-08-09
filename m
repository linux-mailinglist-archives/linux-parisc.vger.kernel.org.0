Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1422B77564B
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Aug 2023 11:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbjHIJWz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 9 Aug 2023 05:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbjHIJWx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 9 Aug 2023 05:22:53 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7599B1FEE
        for <linux-parisc@vger.kernel.org>; Wed,  9 Aug 2023 02:22:52 -0700 (PDT)
Received: from dggpemm500011.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RLPf75cZmz1hwYJ;
        Wed,  9 Aug 2023 17:19:59 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500011.china.huawei.com (7.185.36.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 17:22:49 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 17:22:48 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-parisc@vger.kernel.org>
CC:     <James.Bottomley@HansenPartnership.com>, <deller@gmx.de>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next] parisc: pdt: Use PTR_ERR_OR_ZERO() to simplify code
Date:   Wed, 9 Aug 2023 17:19:53 +0800
Message-ID: <20230809091953.2821517-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Return PTR_ERR_OR_ZERO() instead of return 0 or PTR_ERR() to
simplify code.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 arch/parisc/kernel/pdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index 0d24735bd918..0f9b3b5914cf 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -354,10 +354,8 @@ static int __init pdt_initcall(void)
 		return -ENODEV;
 
 	kpdtd_task = kthread_run(pdt_mainloop, NULL, "kpdtd");
-	if (IS_ERR(kpdtd_task))
-		return PTR_ERR(kpdtd_task);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(kpdtd_task);
 }
 
 late_initcall(pdt_initcall);
-- 
2.25.1


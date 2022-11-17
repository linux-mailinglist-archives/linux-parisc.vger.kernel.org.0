Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7FA462D137
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Nov 2022 03:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbiKQCrA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 16 Nov 2022 21:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiKQCqx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 16 Nov 2022 21:46:53 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6963FBAC
        for <linux-parisc@vger.kernel.org>; Wed, 16 Nov 2022 18:46:49 -0800 (PST)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NCPSK3l6cz15MkP;
        Thu, 17 Nov 2022 10:46:25 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 17 Nov
 2022 10:46:47 +0800
From:   Shang XiaoJing <shangxiaojing@huawei.com>
To:     <James.Bottomley@HansenPartnership.com>, <deller@gmx.de>,
        <grundler@parisc-linux.org>, <kyle@parisc-linux.org>,
        <linux-parisc@vger.kernel.org>
CC:     <shangxiaojing@huawei.com>
Subject: [PATCH] parisc: led: Fix potential null-ptr-deref in start_task()
Date:   Thu, 17 Nov 2022 10:45:14 +0800
Message-ID: <20221117024514.3620-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

start_task() calls create_singlethread_workqueue() and not checked the
ret value, which may return NULL. And a null-ptr-deref may happen:

start_task()
    create_singlethread_workqueue() # failed, led_wq is NULL
    queue_delayed_work()
        queue_delayed_work_on()
            __queue_delayed_work()  # warning here, but continue
                __queue_work()      # access wq->flags, null-ptr-deref

Check the ret value and return -ENOMEM if it is NULL.

Fixes: 3499495205a6 ("[PARISC] Use work queue in LED/LCD driver instead of tasklet.")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/parisc/led.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index d4be9d2ee74d..8bdc5e043831 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -137,6 +137,9 @@ static int start_task(void)
 
 	/* Create the work queue and queue the LED task */
 	led_wq = create_singlethread_workqueue("led_wq");	
+	if (!led_wq)
+		return -ENOMEM;
+
 	queue_delayed_work(led_wq, &led_task, 0);
 
 	return 0;
-- 
2.17.1


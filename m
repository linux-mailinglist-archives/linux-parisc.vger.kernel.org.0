Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5081145E5C7
	for <lists+linux-parisc@lfdr.de>; Fri, 26 Nov 2021 04:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358896AbhKZCpQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 25 Nov 2021 21:45:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:50246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1358635AbhKZCnP (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 25 Nov 2021 21:43:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FD8261263;
        Fri, 26 Nov 2021 02:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637894118;
        bh=NAQYj6k14BTvbarLpERBFjTCDkSvdLI44DIIKOd4jKo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SeW1eeY3WnSwHAx1RqqKsVF9Al7kxtgHM2nrkOOWNjPNvlMzOi40mR/hVUjQrePy9
         P00SbsFi+XzxlnCDZw0coOwNL8EnFTOFhF3PGCyykwMOkFWU/L+U4w1l7Dsjwnxkds
         e/KL1Y38RRL6ZEUGL1Arh5KA4eknYSyMt4GL1WcxPzh0zeZAAEZcpsV5fUzO/R6F0Z
         L5el6x+aqzQjTTDJEVlv/Rgq0YRKgXuUhu60Rf4jmRaygoJHvBnWKFMdC6/QqdpQ9+
         YDIFVs0S5eXNSNFoxibeMxEqjiV74uSScX1Y90I4r5ks+IHohZiBuBIqkPADXia67E
         xwyt1ag7EC4QA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     zhangyue <zhangyue1@kylinos.cn>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, kuba@kernel.org,
        arnd@arndb.de, starmiku1207184332@gmail.com, tanghui20@huawei.com,
        netdev@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 16/19] net: tulip: de4x5: fix the problem that the array 'lp->phy[8]' may be out of bound
Date:   Thu, 25 Nov 2021 21:34:45 -0500
Message-Id: <20211126023448.442529-16-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126023448.442529-1-sashal@kernel.org>
References: <20211126023448.442529-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: zhangyue <zhangyue1@kylinos.cn>

[ Upstream commit 61217be886b5f7402843677e4be7e7e83de9cb41 ]

In line 5001, if all id in the array 'lp->phy[8]' is not 0, when the
'for' end, the 'k' is 8.

At this time, the array 'lp->phy[8]' may be out of bound.

Signed-off-by: zhangyue <zhangyue1@kylinos.cn>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/dec/tulip/de4x5.c | 30 +++++++++++++++-----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/de4x5.c b/drivers/net/ethernet/dec/tulip/de4x5.c
index c813e6f2b371e..a80252973171f 100644
--- a/drivers/net/ethernet/dec/tulip/de4x5.c
+++ b/drivers/net/ethernet/dec/tulip/de4x5.c
@@ -4999,19 +4999,23 @@ mii_get_phy(struct net_device *dev)
 	}
 	if ((j == limit) && (i < DE4X5_MAX_MII)) {
 	    for (k=0; k < DE4X5_MAX_PHY && lp->phy[k].id; k++);
-	    lp->phy[k].addr = i;
-	    lp->phy[k].id = id;
-	    lp->phy[k].spd.reg = GENERIC_REG;      /* ANLPA register         */
-	    lp->phy[k].spd.mask = GENERIC_MASK;    /* 100Mb/s technologies   */
-	    lp->phy[k].spd.value = GENERIC_VALUE;  /* TX & T4, H/F Duplex    */
-	    lp->mii_cnt++;
-	    lp->active++;
-	    printk("%s: Using generic MII device control. If the board doesn't operate,\nplease mail the following dump to the author:\n", dev->name);
-	    j = de4x5_debug;
-	    de4x5_debug |= DEBUG_MII;
-	    de4x5_dbg_mii(dev, k);
-	    de4x5_debug = j;
-	    printk("\n");
+	    if (k < DE4X5_MAX_PHY) {
+		lp->phy[k].addr = i;
+		lp->phy[k].id = id;
+		lp->phy[k].spd.reg = GENERIC_REG;      /* ANLPA register         */
+		lp->phy[k].spd.mask = GENERIC_MASK;    /* 100Mb/s technologies   */
+		lp->phy[k].spd.value = GENERIC_VALUE;  /* TX & T4, H/F Duplex    */
+		lp->mii_cnt++;
+		lp->active++;
+		printk("%s: Using generic MII device control. If the board doesn't operate,\nplease mail the following dump to the author:\n", dev->name);
+		j = de4x5_debug;
+		de4x5_debug |= DEBUG_MII;
+		de4x5_dbg_mii(dev, k);
+		de4x5_debug = j;
+		printk("\n");
+	    } else {
+		goto purgatory;
+	    }
 	}
     }
   purgatory:
-- 
2.33.0


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C97145E526
	for <lists+linux-parisc@lfdr.de>; Fri, 26 Nov 2021 03:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358142AbhKZCjy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 25 Nov 2021 21:39:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:47858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1358107AbhKZChn (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 25 Nov 2021 21:37:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E303611CC;
        Fri, 26 Nov 2021 02:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637893990;
        bh=8K/IMu8w2POBs5mV05Tn0tBb3m8P7QDfwGC/glV7Ufs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GKu9H9EbQneezENDn0h0nnsUcG8+09bCWPWILnoro5zg8BabyvDwFH5hm4gJ8fMla
         xuJh9lTOyVasw0PA1GbuqKVUtbGF2d3x+55aws3ua6UXyCSXPteaCLX8oScTSxFM93
         E+osQYuv72XDRqD3gaj9ldzsaWSxvL8Bd0SZ/zWoKPOKtzBIxi5NB6lGcsTVk11iRj
         FNiPmk0ZfkCZPhWVYxnbJjvXnxy0pSlJd1e3F/U6HrIp7Qj+S9aYoKfS55DrySGax/
         Hg75ZJZlSssREuKkSvXnk54VCTV1eMvv1jLbBbSPZX3xGbvc7XVTHjK1k4LzOtxnlJ
         mKbmaVmEgJYWg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Teng Qi <starmiku1207184332@gmail.com>,
        TOTE Robot <oslab@tsinghua.edu.cn>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, kuba@kernel.org,
        tanghui20@huawei.com, zhangyue1@kylinos.cn, netdev@vger.kernel.org,
        linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 32/39] net: ethernet: dec: tulip: de4x5: fix possible array overflows in type3_infoblock()
Date:   Thu, 25 Nov 2021 21:31:49 -0500
Message-Id: <20211126023156.441292-32-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126023156.441292-1-sashal@kernel.org>
References: <20211126023156.441292-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Teng Qi <starmiku1207184332@gmail.com>

[ Upstream commit 0fa68da72c3be09e06dd833258ee89c33374195f ]

The definition of macro MOTO_SROM_BUG is:
  #define MOTO_SROM_BUG    (lp->active == 8 && (get_unaligned_le32(
  dev->dev_addr) & 0x00ffffff) == 0x3e0008)

and the if statement
  if (MOTO_SROM_BUG) lp->active = 0;

using this macro indicates lp->active could be 8. If lp->active is 8 and
the second comparison of this macro is false. lp->active will remain 8 in:
  lp->phy[lp->active].gep = (*p ? p : NULL); p += (2 * (*p) + 1);
  lp->phy[lp->active].rst = (*p ? p : NULL); p += (2 * (*p) + 1);
  lp->phy[lp->active].mc  = get_unaligned_le16(p); p += 2;
  lp->phy[lp->active].ana = get_unaligned_le16(p); p += 2;
  lp->phy[lp->active].fdx = get_unaligned_le16(p); p += 2;
  lp->phy[lp->active].ttm = get_unaligned_le16(p); p += 2;
  lp->phy[lp->active].mci = *p;

However, the length of array lp->phy is 8, so array overflows can occur.
To fix these possible array overflows, we first check lp->active and then
return -EINVAL if it is greater or equal to ARRAY_SIZE(lp->phy) (i.e. 8).

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Teng Qi <starmiku1207184332@gmail.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/dec/tulip/de4x5.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/dec/tulip/de4x5.c b/drivers/net/ethernet/dec/tulip/de4x5.c
index 0ebc0bc83c73a..b9d967e419387 100644
--- a/drivers/net/ethernet/dec/tulip/de4x5.c
+++ b/drivers/net/ethernet/dec/tulip/de4x5.c
@@ -4708,6 +4708,10 @@ type3_infoblock(struct net_device *dev, u_char count, u_char *p)
         lp->ibn = 3;
         lp->active = *p++;
 	if (MOTO_SROM_BUG) lp->active = 0;
+	/* if (MOTO_SROM_BUG) statement indicates lp->active could
+	 * be 8 (i.e. the size of array lp->phy) */
+	if (WARN_ON(lp->active >= ARRAY_SIZE(lp->phy)))
+		return -EINVAL;
 	lp->phy[lp->active].gep = (*p ? p : NULL); p += (2 * (*p) + 1);
 	lp->phy[lp->active].rst = (*p ? p : NULL); p += (2 * (*p) + 1);
 	lp->phy[lp->active].mc  = get_unaligned_le16(p); p += 2;
-- 
2.33.0


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 096CF27B9E3
	for <lists+linux-parisc@lfdr.de>; Tue, 29 Sep 2020 03:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbgI2BeD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 28 Sep 2020 21:34:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:41386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727711AbgI2Bbt (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 28 Sep 2020 21:31:49 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A460321D7D;
        Tue, 29 Sep 2020 01:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601343109;
        bh=uhklsGMvmDuSfpQw0E0z9Z3B/B8b1QvtXsxAGER1tNQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lawCZ8HA5bmetfyX0r0NmG8k/UfxckotX9ZgqHsJeXnzPWIkg6wO3/R2Bb77fP1/X
         ZJnflFsRXo1a9tRt/ZYzgs/rl8K6fmZ+L5Zea/dSSL+cc5oPSFDYLfWBrVGr7PYP5M
         jJD4AaqJhyS+uyowT8yQJGLQR+GtPjOHBbai7/Vw=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Lucy Yan <lucyyan@google.com>, Moritz Fischer <mdf@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 3/9] net: dec: de2104x: Increase receive ring size for Tulip
Date:   Mon, 28 Sep 2020 21:31:38 -0400
Message-Id: <20200929013144.2406985-3-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929013144.2406985-1-sashal@kernel.org>
References: <20200929013144.2406985-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Lucy Yan <lucyyan@google.com>

[ Upstream commit ee460417d254d941dfea5fb7cff841f589643992 ]

Increase Rx ring size to address issue where hardware is reaching
the receive work limit.

Before:

[  102.223342] de2104x 0000:17:00.0 eth0: rx work limit reached
[  102.245695] de2104x 0000:17:00.0 eth0: rx work limit reached
[  102.251387] de2104x 0000:17:00.0 eth0: rx work limit reached
[  102.267444] de2104x 0000:17:00.0 eth0: rx work limit reached

Signed-off-by: Lucy Yan <lucyyan@google.com>
Reviewed-by: Moritz Fischer <mdf@kernel.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/dec/tulip/de2104x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index c87b8cc429638..6ca15c595f543 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -91,7 +91,7 @@ MODULE_PARM_DESC (rx_copybreak, "de2104x Breakpoint at which Rx packets are copi
 #define DSL			CONFIG_DE2104X_DSL
 #endif
 
-#define DE_RX_RING_SIZE		64
+#define DE_RX_RING_SIZE		128
 #define DE_TX_RING_SIZE		64
 #define DE_RING_BYTES		\
 		((sizeof(struct de_desc) * DE_RX_RING_SIZE) +	\
-- 
2.25.1


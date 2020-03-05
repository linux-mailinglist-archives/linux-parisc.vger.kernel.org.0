Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98DA717A422
	for <lists+linux-parisc@lfdr.de>; Thu,  5 Mar 2020 12:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgCELXx (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 5 Mar 2020 06:23:53 -0500
Received: from gateway33.websitewelcome.com ([192.185.145.190]:25739 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725880AbgCELXx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 5 Mar 2020 06:23:53 -0500
X-Greylist: delayed 1212 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Mar 2020 06:23:52 EST
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id AE45223E39
        for <linux-parisc@vger.kernel.org>; Thu,  5 Mar 2020 05:03:40 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 9oI0jQ6fWSl8q9oI0j2ZRU; Thu, 05 Mar 2020 05:03:40 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=AKyS/FSSKOcktqfRdmBIG2IkRBKAyZrf6dcf3eo+zjY=; b=bKp6mtkgJEuAkukD00EYIF48Rx
        mieJyYDNSDAzAP/A0l8ZE+HjCkLGj6fWmKc82C9MN4jy57+ZwR1xOv3g5mMPO3889iBE29//9yUPh
        lMwDbqkjN6BCDRaM/wwyx8rAt4J/KVXxmbB6tMXwMEhP1045AS7mbpTK8V3+wX56qPc16ADsLC9pE
        tldiSA36SXYx8bR86PYzY7YNzWfMPdhFaC+ERz8MULe9lRebA9teFSqnW/YVGlzPU662zhau5UF3H
        VttR5po0oLB7MBbeCrbmsylIviT0SpAWXrvMRk5TriWzKqNFmS2zmMjmWZ9RTvdoj2DlE50YuU5av
        bB3KkAFg==;
Received: from [201.166.169.220] (port=7940 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j9oHy-003n2K-UE; Thu, 05 Mar 2020 05:03:39 -0600
Date:   Thu, 5 Mar 2020 05:06:44 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] net: tulip: Replace zero-length array with
 flexible-array member
Message-ID: <20200305110644.GA8604@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.166.169.220
X-Source-L: No
X-Exim-ID: 1j9oHy-003n2K-UE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.166.169.220]:7940
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/ethernet/dec/tulip/tulip.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/dec/tulip/tulip.h b/drivers/net/ethernet/dec/tulip/tulip.h
index b458140aeaef..815907259048 100644
--- a/drivers/net/ethernet/dec/tulip/tulip.h
+++ b/drivers/net/ethernet/dec/tulip/tulip.h
@@ -381,7 +381,7 @@ struct mediatable {
 	unsigned has_reset:6;
 	u32 csr15dir;
 	u32 csr15val;		/* 21143 NWay setting. */
-	struct medialeaf mleaf[0];
+	struct medialeaf mleaf[];
 };
 
 
-- 
2.25.0


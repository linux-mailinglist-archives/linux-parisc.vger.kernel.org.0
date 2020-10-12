Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F21F28AEE8
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Oct 2020 09:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgJLHSn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Oct 2020 03:18:43 -0400
Received: from mout.gmx.net ([212.227.17.22]:55017 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726413AbgJLHSn (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Oct 2020 03:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602487118;
        bh=DzXZ18JEU3GC4R9JkOl4nxNTuqk+aRBFmioaz2HBsYo=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=kTgGTBHRJUqpFkXxxO9UZ/GBmCRgLE41jN1+KIYt0xEQ7XGBXZ8SchvAnCBpK9Crj
         cUzmDJRfj1pVQ1k0VEFRQxJBv+2TeXdiHMthaZ9GKCIy45taxqH8VL+WatAal/0g18
         KiadnBII7ijMIWctqN7Ji2r/3QvGS2LOgu4Mf3yE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.158.71]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2O2Q-1kTX3g0VN0-003vaA; Mon, 12
 Oct 2020 09:18:38 +0200
Date:   Mon, 12 Oct 2020 09:18:36 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc/stifb: Enable stifb with A1924A on HP 730 workstation
Message-ID: <20201012071836.GA16373@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:vdhVzNy24gD0ySNZUwHdEVur7/aaYM/lXeBA/Nm5G3s/0mU8QmQ
 htm2WiYbU1tXy5N1Hv9mT/06NpzlXmWzXbtRiGxVKJLWFQ53I5ssPyAs8TZMDvEOoaXHDvC
 bb6o86XjyKBK5z8xtGV8sGReDQq9wS86MYn0rAWfuZNLifzvtO1ANuOy4QhQ0GX2pe6FuIT
 76ZTJ+jEAc9ZZcm1sskAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:57ggY9LAFyk=:GGJQ7Iy2AvQTEJQuziLuGn
 OcjLa8yDw5dF+KHn5Tc3wlOPai2dRcgGGZ8cjiIKKpXiUpgyRB5aexsXo5zdg+PEOQbgVcLYF
 9T9D3hUFuTAHJg6Ll0KzE8YC8xSsjqABxap+hbM95wvPfwCGChZ8ZsKeYTa13R2pmO3p0hlzA
 AiFqSfq34kvNsK36/71obctlSZmv9GuGKd85U52f9mhp2scBmVDeaekO3fzBPSxQIwrCyTvb4
 /0Lm6olmG5erorkWIO/TKDvrnUQXxhZcm5qn4iCF2LN+3oRBwSLmNrpl7E9eJJwQ0/SqHqttC
 cRbiNYKoJK+FOk7H33S9vB/WXcfbKQmj5bUnoyKjy+8pjru2xrBFLeXuGP5St8XQqGScpQfpY
 aZ5gRW4Gk8AlWyxWSvRmaWO6R4lbvEM3zNpiItgPzxNQX8inlObJrn5IDd18HP1/QwC5N+btm
 OcNuQKtlIB9fJ8BxCmmu3WNfJL1VISLUszGR3Sl06YWE85bWG8GisyBzNZucdch6J5FzgWPH7
 PCbjOhjbmEM0nZLJBv80sV+++KDNqiGJl7reMOiCad3E8tdza6AAQVUzsJ0ePpM8JCY8hoCjX
 +le/0eJIeHIbrm32rkjsi0LlH1ETy1TXIAhyuSRDs9cqMtUdRCAWg4nh+g3T8FiFPBlIjBSzA
 0EBk5lHBbsPqE8MmXEp64C3BpDK7sqRIAASexsMvxblwqKRwC3VpmIG3AXz/e1wF8tmmN9fjO
 hDouTMIGtOX4ohTxmjF/ZyBzpoVLs6HGD3FbkgM0Zm7n9LSeFup+iPmANxyd5/IybTy60DFpF
 UD3W0hrAjAi1bfWrwqRHyr3qbUmNQ9KUAnOusldusHfXaXKxwXzJXKH05KDmVhL8IJsubNMrl
 0FUgB7hvo9phdTGkqUxbn0lhoS63wmignxlJg17dz+QDED9JpgWWHQirU+GAAxK1zS0jhfoH9
 6QnPl3ODyPFbiXLAcrs8rfoXk7q9JHftSBF8XLTwvXerXpKtYK2rSr2hx+PW5hjO/zuKQPFvB
 xfyyrG0Mt7kBlboRWLFnt/VIVPjyEzuGhqWrO9/frirkE+/JR+I9Mb/KdDDuTQhZobalR1VRV
 EBPVqfYNDx4AOF+YNllcqGW5gg7K05VYhy77Id6VZyXJMQqnP6wwAi7mM+lfR42v9zOzkCSTt
 ppJHbKkpCgCxNYazMyJBIB8uBRS0Y9akg0duyfgzlhANfgdcaqRrSY2J3FpaNodLV5pH2Edd2
 G0O0UBzPCGeWP3k3j
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The stifb driver should - according to the documentation - work on my HP
730 workstation with built-in A1924A card. The A1924A is a grayscale CRC
card and should be compatible with the A1659A. Nevertheless, the screen
stays blank and this patch needs more analysis...

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 265865610edc..60ebbb7f922d 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -1162,6 +1162,7 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	case S9000_ID_HCRX:
 	case S9000_ID_TIMBER:
 	case S9000_ID_A1659A:
+	case S9000_ID_A1924A:
 	case S9000_ID_A1439A:
 		break;
 	default:

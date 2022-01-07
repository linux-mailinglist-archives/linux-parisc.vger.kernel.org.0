Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82888486F05
	for <lists+linux-parisc@lfdr.de>; Fri,  7 Jan 2022 01:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344011AbiAGApZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 6 Jan 2022 19:45:25 -0500
Received: from mout.gmx.net ([212.227.15.15]:58255 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343865AbiAGApY (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 6 Jan 2022 19:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641516323;
        bh=mi9Hx1hKcNAvUHRCowjJSH43FnbgZnlWG3ag3B+81sk=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=MJgE6ueANT9vCqqlrOfYHOTT0QGw/0CpiAr0/4MKJeB8+3uqDXWJjXv+fC/4tGZgM
         vTPigp21ivsY6LpmaeAL5upVMYlxY6p1orcYk9wx5wbPfDQZFNCocgnGoDBloONWum
         1OHuB30REOoDRos71YoKywSKT2uOPO2MZ7FCLVtY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.152.191]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdeR-1n8hmQ0p5p-00EbBA; Fri, 07
 Jan 2022 01:45:23 +0100
Date:   Fri, 7 Jan 2022 01:44:23 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Include Intel E1000 driver in 32-bit defconfig
Message-ID: <YdeM5172NZkBA1EU@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:QOYGGN0l9p5jy+4j/BFEd68MM48hHxPzr1a3De0TS0sVbmz5OK+
 9didBGxqfZmTQpgMKDU5msSqp+QltgdRUzfCZ/jakXAyvxQsW7RsgSmvwHvGpiqnGSGyUw2
 YOb/SovYOhoJcm1HsMPiQV9/gyQJEGG3avCZ62ZKYfI1i+x4+m050MoXvPZnZH53qvBNT9Y
 bt/PUFTk21Uu0fWg+x8Pw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bgSPlqfRQAg=:GcimzK5sBUo/aEfjUpx0kC
 Rq3NS872/hKsOlamQcwDSxpld3NsBlY95e3gjBQ3XVWThyHNyejZ75iXmBid4Evy79YqOfTCM
 FND8w2Ik7k+otJdnYSnAYZeedWBW0TtX7LrLqKYIoLS76wPGnDSDOOFrfn5yvnCW0GIum0HQE
 pksYlglVDf17rU38OB1yiFpUgCS3KoMBayNSB755c+ev4TcG1vTdHvuT8CmU2yiibyIkJjy5A
 6lzvrlCPDDbzGng3pxPl963YxY6HJd5XZIGvRnukR1rPz1/D61y8Haz0MfOtBaZhoE7PMEbcF
 u5aX0gN+8XTuVoR1GCW8RrhyCjyfkNEi27nqD41Xemp6OAj4fkSAj/RthlSz4ewzeeeu8cA/1
 zjXLU48l5L3lLDuH+Dz5kttcfMZ+88JQKU9Wh9IBWxNV74x4xmWO4qLXKZxr1fKnwNTS+uDX0
 vWi7wVfahFbwt+5PZ1xldwn28YBW5288bb4G6czDFtVfLgeV2ygRATZxNMItJxxUV4BzXscbM
 /5KdejBQNeryT98g35mh2RvLmO/4FValbsoFcUENq2XwEQOkqadEW9KWKGmfkMTGm1htlf/JV
 53QB1q4U+pxo8ENM5c6xLNioj9x0Tx32T2hy7n+z2uja6UigXg541zQOglgt5VHBC7o2ccQg9
 zm8Y2OUxilHY8bFLLUtyrdi6SyNR0IP6LU54hUBuMqn+3yHDOws1kwxH/7xgO662gJ06gAu2F
 lq3vQ+XGgN6tx9mOVyNCPTdfTIgSZNR4CCzeUnZ9q4zYYC1A7nQtRMZsYGufQ7RBc3KSFAz0V
 IxFKJWfZC/cCn651D+cuGnEi6gKOkOXFa2MuKebZMpkywvWKCW+Aq7lzleKaxF4dxQIrPdTUW
 1NBdU1u9Ca97kIgm4WmXZKMh1ESXAkCbjne3dtHdFiOPRzrarPQdRvAMZGZM78yqDY6K3ApZ+
 hSm/2bLwxDD9E97pFKlmF/3WFBSkAi2JwnpGQE4ROObNuANETJvC2niNv1LaXk/mg4NNtRYKk
 RBCFJY4/FaUOh0OvxmaT26YUwE9AnfQsvh6cXGRB6WBH/HpvjWBlV8V7a7sqkC0RbNJYxQ90c
 2Dxco3zOtmqHng=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is currently the only emulated network card in qemu for parisc
linux, so better include it in the default config.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
index 53061cb2cf7f..5945555a45d7 100644
--- a/arch/parisc/configs/generic-32bit_defconfig
+++ b/arch/parisc/configs/generic-32bit_defconfig
@@ -89,6 +88,7 @@ CONFIG_TULIP=y
 # CONFIG_NET_VENDOR_DLINK is not set
 # CONFIG_NET_VENDOR_EMULEX is not set
 CONFIG_LASI_82596=y
+CONFIG_E1000=y
 # CONFIG_NET_VENDOR_MELLANOX is not set
 # CONFIG_NET_VENDOR_MICREL is not set
 # CONFIG_NET_VENDOR_MYRI is not set

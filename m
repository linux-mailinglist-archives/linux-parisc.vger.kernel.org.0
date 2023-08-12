Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C314B77A301
	for <lists+linux-parisc@lfdr.de>; Sat, 12 Aug 2023 23:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjHLVCm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 12 Aug 2023 17:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjHLVCl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 12 Aug 2023 17:02:41 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7C51709
        for <linux-parisc@vger.kernel.org>; Sat, 12 Aug 2023 14:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691874162; x=1692478962; i=deller@gmx.de;
 bh=cwzb+B6Drd0ECV6gu/0lVhGoVdHx9WFqeC8fw1YASzU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=KFZpAZhmleLdbBb1m1o8aU4LZvJQCaQFzgBCsJKhuNMVtc2sR73F0fRLy7kLIg42Y56H/9q
 zIqGWIstnIkrov5/fRpoBpVIh4sqiUPh/03A06p9hFs9DuROsYB0ckBLwyZZoNGrhrr2CUZHv
 ZGuMWG4I9rbnyskha4aMWdMX9IrWUk8OExA+5PEomcHREt0sJQC9ky4WkKCIFCRwXujecztxi
 2vXfEfRNWwwkSayFbPcu+coN4kru1c12XDg+T+DVGV2lSIj8PzD1skZATi1PQn+IWP+kX7XHN
 6xUxuXs51oD+tdZiTDX94OnbByt6r+/R7IWdyHWD6bsDd8+G05nQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.153.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUosN-1qLkep1i77-00Qlp8; Sat, 12
 Aug 2023 23:02:42 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: proces: Drop pm_power_off function pointer
Date:   Sat, 12 Aug 2023 23:02:40 +0200
Message-ID: <20230812210240.419137-1-deller@gmx.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CzpYDpdPRR6QdkzmIeLcXbVOxF3VYGHOL6xGuol/YjL2qTSEjEi
 Ab9UtM7sxulR8r8PlIGMOGJeO1aepW3eKp8k3M9mHK8YH7g41fkJ2GHYLgq1T3OuK0SpFyi
 SMYC77R+TWNfs3PgHXrKaYSoL7LEGPBH1CCLj0BmfAYq+aDFx8ICrT/UkkTXa+PXbPVvR+c
 Qg8GRSXYRjNm6Abk8cIrg==
UI-OutboundReport: notjunk:1;M01:P0:l6Ky2jyyR7I=;282WCvhbf8CaI93ijsVLlK6PMBL
 bdTUpt23QYCQdr5n0BhjNKeqWNkOcVhpTGzHS5MrvinAESUKyZ7fzLm20YxKvJYrsJ3TBMVt0
 1oIxEcjUVOBO56+jvgMmRaAzzO8XEsa1OYutMwk3zK67N/lw5PUmgBV3toPUSicLPC2kJpxB4
 NGR3CFzdtzIXO/C0j3593mrV6VDuwhvHDujSv5/qm5o0QiuMKfSDgcO4Wjw9NYEwOtuhLLsOH
 jEkoIYk/iewwEGnr33uvQ0bk/PuEUiYQvzBNl5fOlyVLJw5vM+ScSEEfLe1PjPO4JaosimQi7
 vp36l4n4iSFcx4d3z2ODom24HZkUXVFyG9Qndaf1UJAppO2a1WX6EVCMGmX98gjpOO6FbMzR4
 zY8EEXOeRrw9XClWev69+nUoffNUUz9zSs6Tswm0LVz4PI4M7bXHMEujaGhNsS0YyOWq5NVBx
 5IgWVifS7QyGMQiUN2LZA5iLUKWJZmJl/rOIhFWw4EpxkrcRUSuWPwacqTOkdZuuLGf6wPXZL
 SHN0+4x032pvVsBuZLLEVwfnMTL0mvPRyT1r8fg7DsT0odJj/YZAyQcCT67kNi5ShxR2E7099
 J9I0h7LSj6NsSwzcJhOb4tbVfbLNAv/v3bCO3iACn2F03m715JbfWn6Yog9BVB4AmPNeyFfsP
 coSxcilxmyAOuO6qIsk9pRlf0Diz7zEzn/BU+9NLDU4/DOuTbsoWlI1Qg1kyIjL6w9fJp+BGA
 Aspqio/S6t7FKtiPp4Z4CKUEDJ4mwWLc346KZJKmv3TC4CzaEgaYaG3tDRxOy7rJzqW5O4k6C
 45gWfzsGt67rn2gVenKhWyu6iuwrYuG2hPzRTDm8XT2Gwk2XbkzeW1Bi21Jt2NhK+mrlfCZds
 mzbQARv/sm2+WpSDyINn5T+gLqAuVkby4/zHM5geTqpTtmgKdbcZh7U+gKbI07SJzC40reTFv
 fceJVHxacqI3yOLkBUeqUzCp5xs=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/process.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 62f9b14c6406..3b9713cf7de6 100644
=2D-- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -130,9 +130,6 @@ void machine_power_off(void)
 	}
 }

-void (*pm_power_off)(void);
-EXPORT_SYMBOL(pm_power_off);
-
 void machine_halt(void)
 {
 	machine_power_off();
=2D-
2.41.0


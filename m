Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A394E7534
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359348AbiCYOkY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359350AbiCYOkS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:18 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB450972E5
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219115;
        bh=VR8qPK9Dzn3QdAzeiNPmyam7q5XtGtB0PRh6/8eqJa4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=bIS6KjVKIfnRXDHd3wSMCjknpoXy3G54AtYdsaxqEc6V0+i/VPeDPMciClWhVIT6d
         oC60R02tyvnIcRaNtPgDX6TX/4z5sujtCt6Ep5vSj4AgjkUSyTpPhVRgOQi4FMlD3o
         p61JzHQQRMvO9sfY5GWmZBbBYhFpQQ/P5jErvdno=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUnK-1oOtbN09q6-00rWlJ; Fri, 25
 Mar 2022 15:38:35 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 05/12] parisc: Move init_per_cpu() init __cpuinit section
Date:   Fri, 25 Mar 2022 15:38:26 +0100
Message-Id: <20220325143833.402631-5-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fbniOUFFkqxoKtvZYuGOTBo2ZtZgYaHk2eH6T1HZpRzzpI2pTVJ
 SyYhPZW1/pQ1nXH6CiSfsn4KtYLCqbJEHjmFrLU+l25KunUVMAGe0g0JJXcFkISB+BoIHlg
 194xewr3k+OtzDRpNHK9mDMWoK01lF9LPlTvFzTQORH14lOFmezI8pdoWa3stHJAyDCnrJi
 V8h2EfOQhET2fvhOBKqsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YTuxLA3dqZM=:genPiE53xFoLcQKGK11+vR
 SOE+pYBAXycpSssV6t0OuzljUU9KBA6ilSDrXTw234EuGFn/Ym0DQuv8U4qDsQOvS8RsnovTf
 AtX41QXd17JSrc8/NgtfB81kpWNAx9zxwGTZoBGcoy7H0ArSL6omHW+mziyf+FMsPKCf3vJNx
 b1GMt9yS48IwR9KG1mqqcwHUHVEKD5wFBElUyApeZ6CblYFdWGa0n3zjqMT4aUZU0jcDbn4yH
 9gOzHDNP97XINL5Ry8MGXKxW7YqKPiNE2NnI6JBsoWcz6zbFhtOHlXn5UmQXgQVRuLsxONyRv
 QTrTmm+8lzIn2NlPNzEdrdIoAKm/tvalEH8eryeFKNCWF5iNG2xumqK3L+m2tIiue4LurZctL
 MBC1VWWGyuaqfsGs44mNya2ofktmCe97obg97Mu/wC1bSb3wQ//rSyPUL4a6x8SuzWmcxZgPj
 65CwWjKYehYNLo9zNBAN13V0K48zK7kwPRXLv8GGgMaAg1LGdA5Hosja1pj4GmwWnRB5tSomz
 GJv6cWKGJJSth7e1lshqNe70aozh67N8z21vptkYoTq3rPX9oy7gcNaMkilb6co3Vp80Y1dIh
 97Ras14Yv7aHaX36JvY2Rfv30LLy/l+Pev08ZrGp/UhZMsSE1B8QboHXODZ60qM4sPpbFsPnC
 f1b4aZiKgP9bllZNWdjx/wY9vkNQyr1nKEXP4/sTv3NZhLgyYM8y6NKbVX2elO4diKxYi6Lz+
 eI0Mwr23DrCoYfdlxPH0ZfUlQozK4PyVmggjZi06pBf6WUMFPrBaBj8ll8SXBFb+9lvncmHZF
 Wz6eFGA17+twB6AwUaalVjHQ22o40kCgzcHjPan9TSEx66sCQLSi7iwbn4ZosSrmtkXgn9Ct0
 /5hGkk2FGxl6IkY4DSjSmM7DzZtAwY5mMfhxUFCIMxKFGURFvsMx5ilqWfRsKDMAELtcxm/4A
 5DrVW2cEP6ZFZGx5Rxm1CGnXa5Jz15ESOoI8H/7JWzFNWfsTTafRaZ8+iLPIWP30eB6voFzMq
 EQDcHTALzohkATGMJC45YeCiFTEaKGmUQVrTdg1KNX4Fos/oBjmpQLrkJ8HdPMpZhfOKS3P2+
 cWW00PawlL0G8Q=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/processor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor=
.c
index d0bfd61a4623..89284e79c159 100644
=2D-- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -29,6 +29,7 @@
 #include <asm/pdcpat.h>
 #include <asm/irq.h>		/* for struct irq_region */
 #include <asm/parisc-device.h>
+#include <asm/sections.h>

 struct system_cpuinfo_parisc boot_cpu_data __ro_after_init;
 EXPORT_SYMBOL(boot_cpu_data);
@@ -317,7 +318,7 @@ void __init collect_boot_cpu_data(void)
  *
  * o Enable CPU profiling hooks.
  */
-int __init init_per_cpu(int cpunum)
+int __cpuinit init_per_cpu(int cpunum)
 {
 	int ret;
 	struct pdc_coproc_cfg coproc_cfg;
=2D-
2.35.1


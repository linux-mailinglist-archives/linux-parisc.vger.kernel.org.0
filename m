Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6800270CBB5
	for <lists+linux-parisc@lfdr.de>; Mon, 22 May 2023 22:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjEVU5r (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 May 2023 16:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjEVU5q (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 May 2023 16:57:46 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386D894
        for <linux-parisc@vger.kernel.org>; Mon, 22 May 2023 13:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684789063; i=deller@gmx.de;
        bh=qvd/Fr8OWURoc9q8jhplDSFUQ4XJgtmm1GV4xbeZnQ4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=X0y0lHRkk08voOOhgPBgFDzfGlp2+hYohgTzN43FTd5CP+VBZVdop/CKHeYlCIZ2e
         1KEyESbZCIij58aT4OlLZ/zeWFcXFl4o770dWJKtnTs6+xPuHN4rL2h5R/2MTWWc7n
         bLS/tSGWNfAcIT5p7ONEYuERdkGWihpR2RR66Nu/wHSujkhC1m81b6bh0NSE+jwwbx
         Wpl24Xv7OKRw1JY7JA3C8g/F8KgalNUwTQ4QxUCEHAt6+M2+kby1y6ewhg9GVMimJA
         1sNRrd8ksv/DbaQMYjuQaNjn3Fj6bzjP7ULDSUzbF/2FhJFOd0WCs5prFn6Edzlhou
         Na8gOjsYuqZhA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.144.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbRk3-1qXnOY1TGz-00btF1; Mon, 22
 May 2023 22:57:43 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Allow to reboot machine after system halt
Date:   Mon, 22 May 2023 22:57:30 +0200
Message-Id: <20230522205730.309803-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zv/uoA2RLa5WFdi1UkoVUPsYjavac+XokBf2qsHvSfUSvNm8Tsc
 NVTUwZCAPNOMNNdeoqo5RzQZ7VgR6aK8BqfGPrtW++60nX7oVl+KVarEcggWu/OAnfAHvat
 81rlUgrYNPqkCvBJ2F48iqRU5jIl8ZmEOsRAJuySV11DgbVA8k+z8mOS6KH4h3NFvOL1Gyt
 txnILnwg7DAg2Q/oLERzQ==
UI-OutboundReport: notjunk:1;M01:P0:3p82IVxSRBs=;N2feq2NhjPvGZgJvBg8SG5chqRH
 Pjz9PPWDTntfpAt3GOGXeDtKWKNtTxq+dgmHkKg4g5nfJJiT9JttrNXhj5Mfnv4ebjTN27ZhP
 PZ9RjOh1U4LY8FEveI+MQMtXRydbithD0Bc0/PgbrU3Z/hVHIkmQOfX2v5jv090aim9aKJkud
 Nxbyxs9MZfGQuMUXmYWUU2wALp14zaR1RTzHk/QgQX2k+kQCQYyLY33waMl2SH3cx4s979UCJ
 KmIMuiVxdEYYRWLO+YLQwhskXtg/4m7hGyVdWE8TbRB7NIcVSde/8UUt2PCYqM8/bgXeYI+wh
 OmHoCIz0FLaFiaQQOLYbcjtO7pNmuJclVggf6fNKaqsNVAXHY6tWMbE51EbjQvswCHicSkW5s
 Rl5B9QLJzYb60FA4fSl/OJNW8Mv8BApyVkDBOCJZOz3GigCFvYJYoedmszq7vfAwvBE3cfsjH
 AvpLrVJM4MpaIgn5HR3ROvDNKmt+53oxBcrQ2rYyy9dsNx022j4TkAp0wDAFRhWmv+wFPG+tC
 qpFWttY+ZV/8Z7Sol7smiUokGgR+gst/dN4Eu/R34cF5cqykTa4RDVXythCpKN/fRnMHClc4A
 1rOXwF8sxKOLbUMUgGeF2nsdFMAJWG5v1WfDZfxhSlcyOMwTqx615pnAbsWeBGygRBp+f5XL5
 1iWI5onGL72E91v93fOuvIF/P6Jr0SrmHt6khzpV07RVsn+rFBHIVm9Cs2mSA9bCwew93UKCd
 qINKdNQMj9jYyZ510wN3PsFg0ppRreiq4FDGE1sx46uq3PMCOcQAe3QkJx4eNOANpze559Ky8
 9ZAIRyBHzt1mbszz6hvxKEYFvuQOjJ/rWD0q3vC4729jjQ2dZLWyT7XWuwj5YNZiIcEo4uCl8
 qr/lt3Y+hp7PjY36/6MYtMJTbNHqSFz7hpKVnpzOddb3BXLeKHVmyWBnB2hnYOjCBuLlbgasY
 M4YucA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

In case a machine can't power-off itself on system shutdown,
allow the user to reboot it by pressing the RETURN key.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/process.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index c064719b49b0..ec48850b9273 100644
=2D-- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -122,13 +122,18 @@ void machine_power_off(void)
 	/* It seems we have no way to power the system off via
 	 * software. The user has to press the button himself. */

-	printk(KERN_EMERG "System shut down completed.\n"
-	       "Please power this system off now.");
+	printk("Power off or press RETURN to reboot.\n");

 	/* prevent soft lockup/stalled CPU messages for endless loop. */
 	rcu_sysrq_start();
 	lockup_detector_soft_poweroff();
-	for (;;);
+	while (1) {
+		/* reboot if user presses RETURN key */
+		if (pdc_iodc_getc() =3D=3D 13) {
+			printk("Rebooting...\n");
+			machine_restart(NULL);
+		}
+	}
 }

 void (*pm_power_off)(void);
=2D-
2.38.1


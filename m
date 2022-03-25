Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8C664E752D
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359344AbiCYOkU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359342AbiCYOkR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:17 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82EB97B83
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219115;
        bh=eFe6kw2jmtf31i+lCOQ25HgYFMe7RRq72KEe4pK9ycA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Pwuv+bCnT5fTiEASOHRNu7h4GhOGHxvbpeKRL2kJQS3KOMMTgmBD138pInKpBnZ6l
         zEHNR7J4eWzOPJlGFI458OpCB1I9yGUWkylJlxuL/q0QaXAgM3dOOW9hpAeSgU/ERv
         ZUzo9+wwUQrBcU4tpI2/hsIhRQSa/HzZkOg8ntXU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAwXh-1nMWfK3Bw9-00BLRW; Fri, 25
 Mar 2022 15:38:35 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 10/12] parisc: Move common_stext into text section when CONFIG_HOTPLUG_CPU=y
Date:   Fri, 25 Mar 2022 15:38:31 +0100
Message-Id: <20220325143833.402631-10-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YdQUrKLVdkQURAPAypVl5qiQvERZZR60FPBaIGDzunVKuLS2Xgm
 KkO2SnSbsMCfQD/V+QJJvfym9FM7vCTq2Q3YHeM2MTf1Mg0zgilFcH54iGjajFKuKqmUNTL
 +8UXh4fxr+bseA8xpSHuBqhi+I5lhWQhYwsx+YDuyoLDV7vwmx8stlPuGHeD4/ZQm1Hc8tL
 GzGYsnOnttl54Br9714Aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZhuaO2qks3g=:X+xXu2TaV3gI3Tfc0cVsSG
 I6cOEB/jaBAnTnfz6qEgvJoUgJAOVjhuntOhmgodanV4QXmTJt2ccKSi+CuPjGNB+DP9/6oG9
 fH1+OYhOJwsTSiZxvnzkOePINVL0EXyCeL10Fe0B3H8saE5quw+UOB4sk+Yq6p6gLG9PrTZ4f
 yJLFXFVmRXGwD/RgfHzrmiQx9nnCyNFXvnU80sX3UxjfA044Wm/Ig6jmvYm4DHVtQpaLiks20
 hSU30OtNGy9eebA/vS76Shx7eZnzlBHJ56rd4OrTiFNiLwb2RjS1tmv5hiGkdNl3o1/NBH9Dj
 y7d43MDM7OSEogqRKhqpDzppafd9T6sxLnF+zdcE8xmEllvdBY0aKM4rWUN+EIC/iXjPk/JBi
 z/Xk6Uhb8d5alAHY0aVs6uPSAPtmLFGBqLz0bH2Km+xUCy8/daDViU08KNZ87CgyZ785siovA
 Ylk12w+BozsrjKyX7uGYDPl7ibXrna6aqI4iUpxSdR4pZ9ci0Ev3zMEgcMH/XLjVEaFduCTAE
 i3v+9eUYK/c6pY0ACRJwN7Ddc6lgJiGRMLHpz6W5ZPZY0QmsY6DL05KtHvhBQDjjWMZddY+g1
 Bp5ZZiHEMqdw6KaTSwU7MEFjtk6DXKjnrkCvWfaASBuDyt8fqd9aKxdks5yA3EyNKAcrYxt0e
 xwKnI25XIEDfN5wv5wRbju1WXJFealcUkeWsNweOuw9X8KSCo8OCGnkLaulKh8kTK5hMDrp81
 rriHNSqVBJyIhOocfVHwf2mNn8P6u3pzaNjDg+b2EM3fnjWMzA4HX8ljYDbDzmpdmFgxkovi9
 na2debt33X6tYeedvsIKPEUaNgm+wZoCwsdZSYbJPhmvLFetMCQ9cTRpu9E8XHDQisEvvhkE8
 kEbDA5gwFfrljA7komfX2SZfHF23eavJ5PlVG21587Zi3nkhDUwQmWqPcNE+E545hTKfWbxl7
 JXFPHRg61wfPHHh63Q+JAILwYt/cnyUAuk5Jb1muyLoF7lDFpzpolXWA8a5Y3FD3xNakD/W+f
 v8fucoEs6LAPx4awQKrf+SEzG45SRpYgp1VImG6kzQOYlaVOOTdA1ax8STOL4Td+hoMz0D4P2
 cDVLqiKUTQukB4=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Move the common_stext function into the non-init text section if hotplug
is enabled. This function is called from the firmware when secondary
CPUS are brought up when CPU hotplug is enabled.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/head.S | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index b24f77748c22..e0a9e9657622 100644
=2D-- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -162,6 +162,15 @@ $pgt_fill_loop:
 	/* FALLTHROUGH */
 	.procend

+#ifdef CONFIG_HOTPLUG_CPU
+	/* common_stext is far away in another section... jump there */
+	load32		PA(common_stext), %rp
+	bv,n		(%rp)
+
+	/* common_stext and smp_slave_stext needs to be in text section */
+	.text
+#endif
+
 	/*
 	** Code Common to both Monarch and Slave processors.
 	** Entry:
@@ -371,8 +380,6 @@ smp_slave_stext:
 	.procend
 #endif /* CONFIG_SMP */

-ENDPROC(parisc_kernel_start)
-
 #ifndef CONFIG_64BIT
 	.section .data..ro_after_init

=2D-
2.35.1


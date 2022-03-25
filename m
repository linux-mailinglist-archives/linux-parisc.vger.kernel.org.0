Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCE24E752F
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359342AbiCYOkU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359343AbiCYOkR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:17 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C40972F8
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219115;
        bh=amQlvFNtU9AFkPjlzd46qn7EpfFJNkEFb6lZBKoWs+k=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=LnALhSrBkr0iQei0P6QyUYx4mh9ltLbmZSjCt1oibITl3EqNMo7Hv3k79VL4CgUFE
         obY4oi1DbXCr/EW3dLIodo01HnJSxZI6//IlM7kxZqCWvKAqyS2ynT7Nn2tGz5Pffh
         mPC7LU5WagAY2X8i8lvw5lQvCisJAeFQ0ePKGMfY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDou-1oHjvv2ic4-00xaVT; Fri, 25
 Mar 2022 15:38:35 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 09/12] parisc: Ensure set_firmware_width() is called only once
Date:   Fri, 25 Mar 2022 15:38:30 +0100
Message-Id: <20220325143833.402631-9-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ajP7ANnLAq5kkJ2G9YaooKPrUrhjHF0ouxAFGYLdGQ7LUfQIkX/
 xvN442FkWY9GuC4+AcFakFCI7R4KBtqc7fYZf9tvq5Ts4xHyjXMp74wu8mHmLwH6Qu9nMqa
 ba5W805CJcz/M1KqV9j6h0vrOI5DSsGgkR9RjBfk3JFPQNHKN1Gxoj5peW4hyGF63kj0D6O
 Eif8rgVTBt8CYjJiqanFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eS+aXfRp3kc=:GgwyQLld0mFeqeL/M8miVg
 vBQf1cUQ7TVDgbZOXNtuQthevKG+mB+gYaF4F8/SeU6RCJaWiXVldPRuaUh57trQNVNX2xWp9
 BkuvcLeNnLDuuHPpelkOoJfloZxY4CHbeWp0Tn7KwtouVNxOK2MG31u7WrvtwK6UH271fza8j
 0Ro8YAlDlAXhF9skv352BSNPyUB22PLnrBprd5hFFnwxb7bkrcv6f8SD4ggCJV+5gyzJ/cndQ
 fRGoKhHjxF3IDRSx3A345QmlD9AS3PQORfhpBLARczHY5R2G1QIg5ZM5FGP/AJyZB7yf6qWpz
 8c5VwM/8LBP2JxmUzj8W1YGJvQxRescu6ivvznPgfZdPRnyiXRhWE1oBRqL4xdE//S9qVUe5o
 9w4r1ChsbgJds3D4MyLkQcFlfTYhmzPkLMyxZS5tpkIIcr0uDgSEDV++JOJnfuEL1TTTakByv
 +FDIShSVPZbqSkTm5vwsTqMo6J3xW8p8q+CEKxBaQ5VulHuuAsCCh+pJF7XX2Oa7ZA6PwadSE
 zrbrwtvOHyLjLxpDa/wA0aLbauNrXjdaAy11Sk3YVddfBPFe7YF9ETt/SOb5saiciGEIxMtsR
 6GYfFXw4vStDf8KcwUvkC3p5DGMTdDKwDjlEd9fcXahVWy8NmBwLN83YOUEeSwSn2aYsOd9wD
 iY1XRYTFdsgzJt5O8n5a+LGeY7M+DGPO2u5b0X/QFMZg90WpL1gpu2rOUDveEVG54Ujvon8eS
 3o0Qeph4I2pG+OC62jMbrKhWXZ56CK0yQhf6LjA+EnGJ/9Vis56it02PoiW45GAitFEL8AgeW
 brG/7I2U9b7trBQZpMXg8APz0ThM98P4dWREZsmiuuckbmIJldtMAlNahRY6Cr0XoZWjCSuwV
 XwMKKpoVAMTZY/uyQ9xd1A2xpKcq0Tq5IVVdB/P185/j2Rb3jEWTRayGDv4ZFNItPC/ydiwQO
 86Jen3FBR8dJOQQQoXKn71NvEaBs1KzCFdksclkHqhzN86Pqxx3gT2z5S/HiNX7v/tlmj5Xa7
 bmnAbY53U6Vqtw8nFW91+S736F7chCo2Pm2Wn10CT9Q9c1NQPh7GHXzbnljjHeN+2MXUWeS0e
 /5H8xxbOSOW3nY=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Make sure, that set_firmware_width() is only called once at
runtime. This prevents that if secondary CPUs are started later
get stuck in spinlocks.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/firmware.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 3370e347dde3..c6b11bdb8602 100644
=2D-- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -83,7 +83,7 @@ extern unsigned long pdc_result2[NUM_PDC_RESULT];

 /* Firmware needs to be initially set to narrow to determine the
  * actual firmware width. */
-int parisc_narrow_firmware __ro_after_init =3D 1;
+int parisc_narrow_firmware __ro_after_init =3D 2;
 #endif

 /* On most currently-supported platforms, IODC I/O calls are 32-bit calls
@@ -174,6 +174,11 @@ void set_firmware_width_unlocked(void)
 void set_firmware_width(void)
 {
 	unsigned long flags;
+
+	/* already initialized? */
+	if (parisc_narrow_firmware !=3D 2)
+		return;
+
 	spin_lock_irqsave(&pdc_lock, flags);
 	set_firmware_width_unlocked();
 	spin_unlock_irqrestore(&pdc_lock, flags);
=2D-
2.35.1


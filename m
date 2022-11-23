Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43049636361
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Nov 2022 16:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236307AbiKWPYv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 23 Nov 2022 10:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236514AbiKWPYs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 23 Nov 2022 10:24:48 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF29A62C2
        for <linux-parisc@vger.kernel.org>; Wed, 23 Nov 2022 07:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1669217086; bh=Q5LoITtDXx1IawdeTJdtGcowSmAImxHRkeIQRt2RPiU=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=riPSG7YSJ9FcOoAMRSvmG1cyUflQvOBMmHuzyjd50d1qDyAZF3SvZ8MCcKiL22+QX
         ydyfzWIkJklFZaJqqEyVdaUP+7+PX78YyVOEcooKuwj8ER5ERoaMNJHEW5a2AY6W2H
         Xv4Ys7F1dxRbAZRJqv1OGJUv1kx1XlkW6tt+fcI29XN8kkfiQk3+XNIjKc3sU4O4bm
         mvvapkMBsKHvsh1spYNCLTlZpF9tp29JpOu7gsRj0Br0hqFWjsrnXirZnUpzd/cNb9
         Xb2AGuzrz2z1olL39TWbp5WCbuLOy4073Gb4mzhfPXXe2w7ypupFE6+FBpvpK3gAHY
         PiVFHM79vpoMA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.168.154]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5GDv-1p60vj0EFB-0117US for
 <linux-parisc@vger.kernel.org>; Wed, 23 Nov 2022 16:24:46 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 2/2] parisc: Fix kgdb keyboard input in pdc early console driver
Date:   Wed, 23 Nov 2022 16:24:35 +0100
Message-Id: <20221123152435.276718-2-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123152435.276718-1-deller@gmx.de>
References: <20221123152435.276718-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GdL2FuL1jxDtjabyxupCx39Y+T0Zb5lpq1AFDsSVAz/0vvprxMG
 bT361r8ts67Iwd8WSXwKm8ZOA2EGfUOzWDKb2MArPLJujJr5+L1NEPYJ0Hvl50oSc0GrRZI
 0Q18BkgXVEikFFmx0WUClm1S/zb2Um8XmRyLvqZyi66JLCDW4YWD0pozHxAlh19viu4q8XY
 bK9ZLRo3M+/v2hxec//JQ==
UI-OutboundReport: notjunk:1;M01:P0:K+klLJwdFfE=;/1Vzuh209ruCXRhRHq+zeOcLplX
 fr3DDJCha/TXlRa4MSmU14q6qDs+2NXqcCbkclovQ1Ex2ifJu5GnRF40xOYQRaBaIO61ioAar
 3AuxoeKzWan2fK7S1Q3MWd10SzcProlD/3DuitfDvadtQDcmOQHjhjpH6vf6Xh/1MUacMNai5
 kKKunrDClpEVPEQZLh68i6jIU/I5mqxgMSFU4wiOkxelPyojG869cqNNpv58JlHi6V3f/lUi1
 vW9VPaQ6Xi3s16pEEe7O8Gg5ia7NEUzEBBUZawLLH7GZGY80Qt9EmC/O4ZJHcvC05JvSPdjXN
 yCX4A7Kdm5gkWyjDj75PL1IOYjlk5S0CIVX8l8yfU9pqpqnaW0sAqWtgMqJ2eBUGwQGMFLzC+
 jLyYj8W2dbnrDE/qPiPDKeX/9+ra1WPmm3oeGWmyzMkH8vfze+/L++yVNoLMFhc+0rvMPynEd
 pPttXojfoC1UnedW00WEk/HjXf0QVKW0GkIsrMJjzVOLkebll4ulxzk3tjDh01IdX3zN7/csD
 66QwVL7/7TlfAPe0IW7UNf9LIgI5+0fyA0nrDUaIpU1yxl+NTDqr/GuXDI9iCZe7f1Ektntas
 2uvp55igokvIwHeqcUhWwyi5Q33yfpX937i5mAnFT5hQeiW704ve9Bw0//Q0F/SCu5L0gjTeu
 w1W9qeJi3gLy6gcBjhGzS8QcEcCXb7QA5X3guzL4cSnv1CJLnU9YSYaOmM6Cj4Owc6Y0FXj2F
 ZWjAfg7TUWZT8t1CRWz16bTYxeNFGpUkO92YkRwUn4JrG11WhduhJAf1J3wm5xIbyrfVD0e0I
 1+60iXGHQ0rDGc+zeKnJZOV9wLGONS4dXbqYm44pQ//v9aQpC61S0ro3QED2IkwuI6FPncwBF
 KcQWdpAJqPv6wrZa4R3loP+bxWpYATlntWpc0Aca0QcrlS2ruMj91hJYNuJo38N7AZnoDiUvD
 trLa+w==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Commit 027c3d345e2a ("parisc: Convert PDC console to an early console")
broke (physical) keyboard input for kgdb due to the spinlocks used in
the PDC console function.
Fix it by using using PDC calls which are not protected by spinlocks.

Fixes: 027c3d345e2a ("parisc: Convert PDC console to an early console")
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/pdc_cons.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_cons.c
index 7d0989f523d0..bb498c6d51c2 100644
=2D-- a/arch/parisc/kernel/pdc_cons.c
+++ b/arch/parisc/kernel/pdc_cons.c
@@ -12,29 +12,19 @@
 #include <asm/page.h>		/* for PAGE0 */
 #include <asm/pdc.h>		/* for iodc_call() proto and friends */

-static DEFINE_SPINLOCK(pdc_console_lock);
-
 static void pdc_console_write(struct console *co, const char *s, unsigned=
 count)
 {
 	int i =3D 0;
-	unsigned long flags;

-	spin_lock_irqsave(&pdc_console_lock, flags);
 	do {
 		i +=3D pdc_iodc_print(s + i, count - i);
 	} while (i < count);
-	spin_unlock_irqrestore(&pdc_console_lock, flags);
 }

 #ifdef CONFIG_KGDB
 static int kgdb_pdc_read_char(void)
 {
-	int c;
-	unsigned long flags;
-
-	spin_lock_irqsave(&pdc_console_lock, flags);
-	c =3D pdc_iodc_getc();
-	spin_unlock_irqrestore(&pdc_console_lock, flags);
+	int c =3D pdc_iodc_getc_unlocked();

 	return (c <=3D 0) ? NO_POLL_CHAR : c;
 }
@@ -42,7 +32,7 @@ static int kgdb_pdc_read_char(void)
 static void kgdb_pdc_write_char(u8 chr)
 {
 	if (PAGE0->mem_cons.cl_class !=3D CL_DUPLEX)
-		pdc_console_write(NULL, &chr, 1);
+		pdc_iodc_print_unlocked(&chr, 1);
 }

 static struct kgdb_io kgdb_pdc_io_ops =3D {
=2D-
2.38.1


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36704639846
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Nov 2022 22:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiKZVgd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 26 Nov 2022 16:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKZVgb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 26 Nov 2022 16:36:31 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A335140E3
        for <linux-parisc@vger.kernel.org>; Sat, 26 Nov 2022 13:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1669498588; bh=jrPp0gIJ2x+WB0WgiAjQUuQ2jToHP3y/7vYHioJTKlA=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=B/yz9DZVGtgL6zgKCePvY9DfyRPHigUkUNJL/WIZOFtS1ZWjyXs3zzgB12VHZg2pn
         opnNO6mmmX7oPcFDcQ1eo6j5937lfu1jSsQzrhfaT72zQBx1b0GHyf663qSeTCBjGx
         cNR7lzABmhQLprrfomii/6Q6Tw7OnHpXZKLl9kwJw4lTWTjjUVTH89e3cQkrg9Gd3Q
         DxdUctOHW4llJkfefy6N5CCu/9+watAefCRjgGv95bnKzKGYIDPJ5qIEWkcCAKoElG
         Q9r9SPwaJu+upkuGpP93izeQJdF3wmkaPckHdDoqN5COtP+h3eP7GmWX3jwD3kbF0H
         tFNtDUyAU9WaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.155.181]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mof5H-1ofRcD1o41-00p1TH for
 <linux-parisc@vger.kernel.org>; Sat, 26 Nov 2022 22:36:28 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 1/4] parisc: Fix locking in pdc_iodc_print() firmware call
Date:   Sat, 26 Nov 2022 22:36:18 +0100
Message-Id: <20221126213621.363838-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dI9tissJqtjT4vbcVphXoQEIbEv1sczxmmkp67QajDW+W9Xi1VF
 Fta01FFvbnp027MEINhPRURjzyC8McAMFmPN2+zJD4u/P4hGtfCzJOG9mlIElFxUZ5yG39U
 cmKgiZ4zfH35UU1RPLCAi8jfYi/luTT5Bk2HMbmz90jfeFURo1GzkUXx29MsAvMtnteOHdQ
 kaUVaxMnHP1cCcKFikQbQ==
UI-OutboundReport: notjunk:1;M01:P0:k7RbQ66cxu8=;fuOEJaPwHqbgOVYwWtpC8QB3fID
 7PHHKipm43YV0eJZmIt6UQmMdYARflsOP+B+0Zqq/5FgWm6lbtctVu+1btVgY7cWX/qqKOdtL
 fZKGrZUXRBrS/DZ18r7ZX0cRrpIUdQJbk2zvLP7m+fMXjrx9kY14QxjYG+xlx67zZaDqcRBES
 Z8V5VxezG1AuYJtB7iKIlpmwzARKe6vLGXODaAkSY94QcqIWAsbmB97+qYpriRqtNmvIcrcIN
 ETsM8Oy2NPFPj9KgYQH1/aJFWgNScXcfP7E86J7ohr0WGvE7cTXF2TejNwaEvJAtQc1GcTzE+
 BEqQnkfrQuRCtBv45xJVB1ObIEPnbTlTRP9Pwa/SnX02V4RqP5N8a90gwrzLtWJeHfAYrqwTu
 kKgpZxodGibsqEfTKX4mnhCcXnQH4ZM2uDB/MwSk+CFoqKSKzSUzl5Z7GHCal83aKl8/HBO7l
 091UUyAY8xGFoYozOdnf5chJBZZMEAz2KLK1uf0Tyx9Nt9Z6kMWicm+9Fph2qEXrJbfGP9hYK
 jaP5StX1qs2Q3fvcytVkG3WG69mS//cz5D2P0WYfefAR8n+5qb9LV1PCkORlDNuVl7Z1SxgoN
 nCAFiu+iRqG1BIMUxUC4OBNzyVzJrA8JaAYm/8T0Hp8Ki2h+RQvZNSr2eAjp74XboOnu9hWrJ
 BLq53cfOICDYLJgOS31yWD1UluDS5goreXXGkZTz5TsL+fFGIGp71T9VAAFLX7dTdlSBwsePW
 oXOTffg3jhmaPaqiMeD45DVsVJNn7p0gWCVe2TemoRUIBxKqP1pv8F71N7lFPv/E0GMWtWKke
 LjFV/zV4ei5R2Jn0IRMq+X0vnrB5pf4BkfW2iFBSuLA03Zg0C9F+z9xSieOvX2DfJwkykMyeo
 c4wRYD0WMHmgJsduV/MkySNNmyovrO24lg4xmUK/X7NbHjumly5PBkK7xBOIWlGYncV8faQCw
 74ro1jkA3ctj+h6ozqUJ8DrkRrI=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Utilize pdc_lock spinlock to protect parallel modifications of the
iodc_dbuf[] buffer, check length to prevent buffer overflow of
iodc_dbuf[], drop the iodc_retbuf[] buffer and fix some wrong
indentings.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/firmware.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 6a7e315bcc2e..c19506fc4e4e 100644
=2D-- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1288,9 +1288,8 @@ void pdc_io_reset_devices(void)

 #endif /* defined(BOOTLOADER) */

-/* locked by pdc_console_lock */
-static int __attribute__((aligned(8)))   iodc_retbuf[32];
-static char __attribute__((aligned(64))) iodc_dbuf[4096];
+/* locked by pdc_lock */
+char iodc_dbuf[2*4096] __page_aligned_bss;

 /**
  * pdc_iodc_print - Console print using IODC.
@@ -1307,6 +1306,9 @@ int pdc_iodc_print(const unsigned char *str, unsigne=
d count)
 	unsigned int i;
 	unsigned long flags;

+	count =3D min(count, sizeof(iodc_dbuf));
+
+	spin_lock_irqsave(&pdc_lock, flags);
 	for (i =3D 0; i < count;) {
 		switch(str[i]) {
 		case '\n':
@@ -1322,12 +1324,11 @@ int pdc_iodc_print(const unsigned char *str, unsig=
ned count)
 	}

 print:
-        spin_lock_irqsave(&pdc_lock, flags);
-        real32_call(PAGE0->mem_cons.iodc_io,
-                    (unsigned long)PAGE0->mem_cons.hpa, ENTRY_IO_COUT,
-                    PAGE0->mem_cons.spa, __pa(PAGE0->mem_cons.dp.layers),
-                    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), i, 0);
-        spin_unlock_irqrestore(&pdc_lock, flags);
+	real32_call(PAGE0->mem_cons.iodc_io,
+		(unsigned long)PAGE0->mem_cons.hpa, ENTRY_IO_COUT,
+		PAGE0->mem_cons.spa, __pa(PAGE0->mem_cons.dp.layers),
+		__pa(pdc_result), 0, __pa(iodc_dbuf), i, 0);
+	spin_unlock_irqrestore(&pdc_lock, flags);

 	return i;
 }
@@ -1354,10 +1355,10 @@ int pdc_iodc_getc(void)
 	real32_call(PAGE0->mem_kbd.iodc_io,
 		    (unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
 		    PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers),
-		    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
+		    __pa(pdc_result), 0, __pa(iodc_dbuf), 1, 0);

 	ch =3D *iodc_dbuf;
-	status =3D *iodc_retbuf;
+	status =3D *pdc_result;
 	spin_unlock_irqrestore(&pdc_lock, flags);

 	if (status =3D=3D 0)
=2D-
2.38.1


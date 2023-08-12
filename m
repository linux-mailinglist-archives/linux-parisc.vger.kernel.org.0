Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD5C77A291
	for <lists+linux-parisc@lfdr.de>; Sat, 12 Aug 2023 22:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjHLUiH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 12 Aug 2023 16:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbjHLUiB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 12 Aug 2023 16:38:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9EF21720
        for <linux-parisc@vger.kernel.org>; Sat, 12 Aug 2023 13:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691872681; x=1692477481; i=deller@gmx.de;
 bh=1u48DLIOpXVKoad/MwJxGkSBosF5Nq/Cx6ge5r2r4KI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=aJxuRl2cGwzdvEI5Ko6HmcGMOc/RI1mYGPIGFg2SlfYrEAmBFspnx0Izy0XNatpGNDWyGRf
 BDbUs+Cg7IbQv81P9VEc1mgBssIQu2bOfRSMIgXXkITSg/Y/p6g0uHtqIRBVlJTPRp+x6fnD4
 6Ot/LvNF1uew3qOHgCYOAD5NnQMbOsrN0YDuwJdcVUL6EzM5jE21yaLn8plbJ44ZANbodYQ83
 OIa6EN/Us8T/wmlptTo7nZzKMPX5lck/i3Dk1HK7kUiF98/AoHb7ncljEsn1pjRYsNm1/+Zf0
 EfKJNy/u8wJ6naPfukKNP/nfUcglEwCaQC7cptnT2cX41BqZ0ZmA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.153.44]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3DJl-1qVjeO33wD-003d7C; Sat, 12
 Aug 2023 22:38:01 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: lasi: Register LASI power-off feature as sys_off_handler
Date:   Sat, 12 Aug 2023 22:37:59 +0200
Message-ID: <20230812203759.395651-1-deller@gmx.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2vDRU9KzEvNwjuedKSkR8Ee0tYjMSMj7S0X07aYfpNTvm1w1sOh
 3XHSDjsnFl0tbr545vA7bFYC2IALPomZA3yzCInbxlYbTxaLgQPyC1xTJ/J+nM42Pnz7OSd
 taL5nkL5ayq3Q7sWjxBOMIM8uBFRHk5AfU3QhBjPcRKKKY2oypUTs00tffkocc63Kp7z/d6
 qRVVYWE76crm08u2nIDTg==
UI-OutboundReport: notjunk:1;M01:P0:eIR+LMSwihs=;RTb1lzKH13QC+wm1kAj1Z24AcIg
 vw4BnuaLClRmQOIdBXuvPBaWmYThTsKYX9Aqu94BreNgYTdFH8dfBJ4ebHFnUxvQPgUHgAtmr
 uMjxfcf4ZNnwOoBXcDSvM6raOY7aG19zBjeY3msqFz3LyvXFJz/YISBs/wPCMOFtzyqcHaPGN
 6HMMJfW9LFepGLEBdfGuf1A+jOxNaJ2yJhKoTuatXFZiUFWZrtsg4avNjq0gZ3ujAWiPV46Te
 QVp4A8HsIVbNH30NLeXpE5Cy63s55VzOGiU23JVTe0lGIHtgZhW+grNhmbMJ/SuB9u9lVtH9h
 RunC5jpkNDObmLgganxwWhQ+UxgCKr7X7oQPpfQbB0+yQkaG89ZKZgkJB+mnTr71Xuqwt4pmo
 lRKQFkvT5gVMcF2PM+rLxEwfCfi+VFVQJoxstFS4+ChBSWTvkuOGpE8dFBmu5fAnBpjuWladY
 ciNYzfCWU03Z78D1tO+5hYjFCOUpD03X2SknyfOB4jNXjvIzzlwgQRFfM7j6B7jiOgV1QAQH3
 Gqjth93Rau/C+wvufTYsrdtCWq/BoL3GXsalBn1mUBDgse5AJcYVxq6Smt2mEnqgyRh90hOmm
 7SZP9wjPDCWhaNIXYxQnQF9J9JGKsj8yWgGkdzzshCr7pjH1eT3pFGVPJ0+FiGnYzVGO9UXMW
 9k5pn+CVWY7jSgv4gW6zHKgQ7kgaD3jFSzYTeCmlll2WlGwF9Tx8/eMdSqUZHpM1FEewSMZSv
 Z5LWBgtR64qULXIELMpznjwXfDLafvRi9hlnikIOxqa1CfxZJYg0sl8nxDf4ml3P2Cm/7UaIb
 a7uXYHfcpiHquhQV+FecpYZ/T3Q1xKFkxrCQIedCYMpwPmzYJCdLKua1sCIO7MweuFrOsl+jV
 qp9Y3vhy91QLTvISZBt04qgj4P/DeLv8XkdmtULXYSEFDlWnUPNg8AQ3AQc61ctCV8gVnQx9h
 5pxoa2u9BW0Ic2e4MD9qA1KQscI=
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

Prefer the Linux kernel sys_off_handler functionality over a
home-grown implementation.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/process.c |  6 ------
 drivers/parisc/lasi.c        | 29 ++++++++++++-----------------
 2 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index abdbf038d643..62f9b14c6406 100644
=2D-- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -97,18 +97,12 @@ void machine_restart(char *cmd)

 }

-void (*chassis_power_off)(void);
-
 /*
  * This routine is called from sys_reboot to actually turn off the
  * machine
  */
 void machine_power_off(void)
 {
-	/* If there is a registered power off handler, call it. */
-	if (chassis_power_off)
-		chassis_power_off();
-
 	/* Put the soft power button back under hardware control.
 	 * If the user had already pressed the power button, the
 	 * following call will immediately power off. */
diff --git a/drivers/parisc/lasi.c b/drivers/parisc/lasi.c
index 6ef621adb63a..8a2339ad457a 100644
=2D-- a/drivers/parisc/lasi.c
+++ b/drivers/parisc/lasi.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/pm.h>
 #include <linux/types.h>
+#include <linux/reboot.h>

 #include <asm/io.h>
 #include <asm/hardware.h>
@@ -145,23 +146,19 @@ static void __init lasi_led_init(unsigned long lasi_=
hpa)
  * 1 to PWR_ON_L in the Power Control Register
  *
  */
-
-static unsigned long lasi_power_off_hpa __read_mostly;
-
-static void lasi_power_off(void)
+static int lasi_power_off(struct sys_off_data *data)
 {
-	unsigned long datareg;
+	struct gsc_asic *lasi =3D data->cb_data;

-	/* calculate addr of the Power Control Register */
-	datareg =3D lasi_power_off_hpa + 0x0000C000;
+	/* Power down the machine via Power Control Register */
+	gsc_writel(0x02, lasi->hpa + 0x0000C000);

-	/* Power down the machine */
-	gsc_writel(0x02, datareg);
+	/* might not be reached: */
+	return NOTIFY_DONE;
 }

 static int __init lasi_init_chip(struct parisc_device *dev)
 {
-	extern void (*chassis_power_off)(void);
 	struct gsc_asic *lasi;
 	int ret;

@@ -212,13 +209,11 @@ static int __init lasi_init_chip(struct parisc_devic=
e *dev)

 	gsc_fixup_irqs(dev, lasi, lasi_choose_irq);

-	/* initialize the power off function */
-	/* FIXME: Record the LASI HPA for the power off function.  This should
-	 * ensure that only the first LASI (the one controlling the power off)
-	 * should set the HPA here */
-	lasi_power_off_hpa =3D lasi->hpa;
-	chassis_power_off =3D lasi_power_off;
-
+	/* register the LASI power off function */
+	register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+                                 SYS_OFF_PRIO_DEFAULT,
+                                 lasi_power_off, lasi);
+
 	return ret;
 }

=2D-
2.41.0


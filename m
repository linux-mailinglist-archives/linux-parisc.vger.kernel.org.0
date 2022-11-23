Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7CCD636360
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Nov 2022 16:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236308AbiKWPYu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 23 Nov 2022 10:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236307AbiKWPYr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 23 Nov 2022 10:24:47 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591146253
        for <linux-parisc@vger.kernel.org>; Wed, 23 Nov 2022 07:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1669217083; bh=027uEDEoyIMA+UzasI1Z+4I8GRT//yG5VhZ4T1R/Nn0=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=cVc2fP+zU+UxGicl42lAWMocLQYs0+7O3D9k1u2UFQWfGwuZEmyIjqgd3ivLUZiaO
         nEb/deKdzJ9LDQZP+LGJpACMkcL77GprxwUy+TaKFWJQXSPu9wk6iOU+ozykX55qEU
         ep3H0wACf7NVAF1B9Ne4IRgcUQpfidTwHLsSJkmnb3Gw/WrBvYPB66Dh55j5d/gF0s
         cDcpiOxETMPg+oeocqPodC+Zp6aMKcipJj+GzHEdlKROwyYonM/xj/0V5sgy2dGNJG
         kxUAyIuUGmZyq8J26zukklAy4+ja3QcCMU7GaJwAAdyRGxbZ/f8qSARIw8LW9ZwfD6
         P58CJCQTx5oBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.168.154]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYvY2-1oT5Ct2nBI-00UpTl for
 <linux-parisc@vger.kernel.org>; Wed, 23 Nov 2022 16:24:43 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 1/2] parisc: Add unlocked functions for pdc_iodc_getc() and pdc_iodc_print()
Date:   Wed, 23 Nov 2022 16:24:34 +0100
Message-Id: <20221123152435.276718-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PWW0fMar43FZZjFRlcUzWuwH14fJb3ZfC0rxDNpEp3C4D2LAEET
 IMzneJulX55S3cd2chvrhoB3KVDAW6V3b6hYaqOPS9NidxUbg82e1URw1nXj3meaw0Yrtwt
 lbVasgzRAqHdo4ryaMqXXc4mVYUSl508BNHXGpSMuCJpaAgJFm3qMT+N2G5wB/bcZXXM3Nj
 Q+ug+ASdSn/3Ua0Gnlr2A==
UI-OutboundReport: notjunk:1;M01:P0:LTKW4s3jjV0=;5Ov9T96spGH3gNMHZs4UadSzGgA
 ZpfyH+X/JW361JbYmXebqPSyuyd8+ih1P5+wE1c2sdTAiYeKXaf56oM1lxyO1oJbkg2oHZqct
 2B8dJluIOPCICgP7dNvX4In7bo7hLt5/EBZ1EgpcXRI0oLlXuSi4QWgJ3T1FgYt5A0XaG0v/D
 UBRxx4P/0vCdbovyNZAe8ytdW417G4VR7bc/T1r8hl6PWtTlINuyWA6DtFwkfiNuYyWCflG08
 dpz1VDkOp5Sn85izsEjIWoBJt5dDmvBgjmlF5zDQF2rfrf4HfZSRokz1Z1fc6CaPZzba/dZuQ
 j1mOUdP7tyT4MYot0BATQGMeehz60RUwAuSXXoY94JA5f091UaZM1/VDRDqDSmNIQr7Qukpr5
 nSd4EHBUI7H4bWWejlU0zHHMbEd7W6TM9eAEDhKFprS38aGZ12qGOA+fGJGnRh/POpiY3SlUA
 OXLcjY0E1NjwOpNlSQk8zYr7TeOWwcU+u+LgjhwT1OdA4IHODH/gwSilRIGM1zW3gGPA8AfQh
 3IXpw2sv6sMKvAU0UbSKKuZR9PpcrBe29DTMxew/RUbmeDKQAdgfh6DMeau639T3gLtZQT9M+
 jtxL88vbjyCAuCWtP1fEyetJ5OsqDLn1RbZrkkZG7hkR4OW5Mvc6a1H48QhSxNDxyLG+DqPa1
 liARrtpiTr8Rs108agPfhbJStZm699sJJ1jX/XGJzPlQgjLmxjQKi6/UMiaIViSFo+MnjRDdY
 xzG91oPVkHU0a52SEBMVoWFx8jJFuYWLvKUa1rmjLeffqJJFANPCSuPRDlimhb2BKej1p4fPl
 hfUS1ljnx1AxoiSdgI6w5d2I/Tf9PUcrehOooTrG0qB6RO21UHVCqbxvyxsiuT+duBA3rtc54
 EnzeUPM9ScR9WhI2Eq07cNkk4osPcEIuISiwIpcHyX5DKfhmG3PFgzqlWilQtAoXz2JK7Qr8g
 Emhp+w==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The built-in kernel debugger (kgdb) deadlocks if we use spinlocks (which
should protect against concurrent firmware calls) to get keyboard input
or to output to the console.  Since we are in debugger mode anyway, we
can simply avoid using this protection mechanism, which is why this
patch adds unlocked keyboard input/console output functions which will
be used by a follow-up patch.

In addition save some static bytes by reusing pdc_result[] as
iodc_retbuf[] and by reducing the memory footprint of iodc_dbuf[].

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/pdc.h |  2 +
 arch/parisc/kernel/firmware.c | 70 +++++++++++++++++++++--------------
 2 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index fcbcf9a96c11..bca1458b7c44 100644
=2D-- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -83,7 +83,9 @@ int pdc_soft_power_button(int sw_control);
 void pdc_io_reset(void);
 void pdc_io_reset_devices(void);
 int pdc_iodc_getc(void);
+int pdc_iodc_getc_unlocked(void);
 int pdc_iodc_print(const unsigned char *str, unsigned count);
+int pdc_iodc_print_unlocked(const unsigned char *str, unsigned count);

 void pdc_emergency_unlock(void);
 int pdc_sti_call(unsigned long func, unsigned long flags,
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 6a7e315bcc2e..6c2bfd6d36b2 100644
=2D-- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1288,25 +1288,14 @@ void pdc_io_reset_devices(void)

 #endif /* defined(BOOTLOADER) */

-/* locked by pdc_console_lock */
-static int __attribute__((aligned(8)))   iodc_retbuf[32];
-static char __attribute__((aligned(64))) iodc_dbuf[4096];
+/* locked by pdc_lock */
+static char __attribute__((aligned(64))) iodc_dbuf[1024];

-/**
- * pdc_iodc_print - Console print using IODC.
- * @str: the string to output.
- * @count: length of str
- *
- * Note that only these special chars are architected for console IODC io=
:
- * BEL, BS, CR, and LF. Others are passed through.
- * Since the HP console requires CR+LF to perform a 'newline', we transla=
te
- * "\n" to "\r\n".
- */
-int pdc_iodc_print(const unsigned char *str, unsigned count)
+int pdc_iodc_print_unlocked(const unsigned char *str, unsigned count)
 {
 	unsigned int i;
-	unsigned long flags;

+	count =3D min(count, sizeof(iodc_dbuf));
 	for (i =3D 0; i < count;) {
 		switch(str[i]) {
 		case '\n':
@@ -1322,16 +1311,35 @@ int pdc_iodc_print(const unsigned char *str, unsig=
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

 	return i;
 }

+/**
+ * pdc_iodc_print - Console print using IODC.
+ * @str: the string to output.
+ * @count: length of str
+ *
+ * Note that only these special chars are architected for console IODC io=
:
+ * BEL, BS, CR, and LF. Others are passed through.
+ * Since the HP console requires CR+LF to perform a 'newline', we transla=
te
+ * "\n" to "\r\n".
+ */
+int pdc_iodc_print(const unsigned char *str, unsigned count)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	ret =3D pdc_iodc_print_unlocked(str, count);
+	spin_unlock_irqrestore(&pdc_lock, flags);
+	return ret;
+}
+
 #if !defined(BOOTLOADER)
 /**
  * pdc_iodc_getc - Read a character (non-blocking) from the PDC console.
@@ -1339,26 +1347,23 @@ int pdc_iodc_print(const unsigned char *str, unsig=
ned count)
  * Read a character (non-blocking) from the PDC console, returns -1 if
  * key is not present.
  */
-int pdc_iodc_getc(void)
+int pdc_iodc_getc_unlocked(void)
 {
 	int ch;
 	int status;
-	unsigned long flags;

 	/* Bail if no console input device. */
 	if (!PAGE0->mem_kbd.iodc_io)
 		return 0;

 	/* wait for a keyboard (rs232)-input */
-	spin_lock_irqsave(&pdc_lock, flags);
 	real32_call(PAGE0->mem_kbd.iodc_io,
 		    (unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
 		    PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers),
-		    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
+		    __pa(pdc_result), 0, __pa(iodc_dbuf), 1, 0);

 	ch =3D *iodc_dbuf;
-	status =3D *iodc_retbuf;
-	spin_unlock_irqrestore(&pdc_lock, flags);
+	status =3D *pdc_result;

 	if (status =3D=3D 0)
 	    return -1;
@@ -1366,6 +1371,17 @@ int pdc_iodc_getc(void)
 	return ch;
 }

+int pdc_iodc_getc(void)
+{
+	unsigned long flags;
+	int ch;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	ch =3D pdc_iodc_getc_unlocked();
+	spin_unlock_irqrestore(&pdc_lock, flags);
+	return ch;
+}
+
 int pdc_sti_call(unsigned long func, unsigned long flags,
                  unsigned long inptr, unsigned long outputr,
                  unsigned long glob_cfg)
=2D-
2.38.1


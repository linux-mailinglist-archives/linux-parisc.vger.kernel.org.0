Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C55464FC8D
	for <lists+linux-parisc@lfdr.de>; Sat, 17 Dec 2022 23:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiLQWEr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 17 Dec 2022 17:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiLQWEn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 17 Dec 2022 17:04:43 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90AEE011
        for <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1671314680; bh=xVbiTtplwHmDVtHBadwsyLXpl9f0VXl5L8XmpuJkw6U=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=VglpqwP8lqfD/AmG1Kz0+0rdrrvqYbLAkPHrFO5Pv24ztD6mt8guuaFstlqZouTHx
         k+2CjOu8OidYJNuTPGX2zSjgb7AtK5mtRyc5YVaay9MuS6ioFBjifKsA0viwKfsolq
         iUkYLLkrQS950B74+qsLYmYnxG0nhhZApN8QTVaRj4s7IrnzTrALSNePSaYw1hI6W2
         Kq3htq5rXYU4gQVmfUb0JTqDWSGsmwUUHRdg5RR+ruRlzdK7MRo79xDKIxRm2/n/YO
         HQ+l4dQ4/cTv+fitAE3eDXZSOSpO+9xI6poq1BBxv0p3omvCg8M13TdxGqFR5YK//P
         q8HGDcZANwmIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.160.18]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU5R-1oSupH07MZ-00ee3e for
 <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 23:04:40 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 2/6] parisc: Fix locking in pdc_iodc_print() firmware call
Date:   Sat, 17 Dec 2022 23:04:24 +0100
Message-Id: <20221217220428.383330-2-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217220428.383330-1-deller@gmx.de>
References: <20221217220428.383330-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/09C9W7JQhoE8Uj9MrEpKzYI/zBE4cqo1F0qreqQr9qYKzeVJtk
 gUjPKx8tgZcpMi3DkFPzqR34s6LhGTtLcoyOArLzxEt2BOhZjgUAfXVGddouxKUCFMeYdDH
 h9vcIXwn2wV4p2afntNZh2dCYOPkbD0JjvXpkgdM0we1u3z5qLGHvtnjef3NobsrN1NhlEH
 fJeGgLdRhzwvVWJxJ86HA==
UI-OutboundReport: notjunk:1;M01:P0:JYeKNydDv7w=;E5nbiLTJ2va3RF2wbfZ+NclldAQ
 EO0/3Q42+HZ3iVSuE2u4RmcRbVUJPCZY3HpjydYv263f9vziC/g85Hve2CqVprICBXk3KTBqO
 XoIPOF1SJVUTWG2mLtBfmswX91Tmx/Q+1G3oCDOVX+ergfRQzdUEvIyoGyCQpCQMMdySreMbB
 ByCUwUjhJ2L39PrHrsk6NeHDRcwpXdu5X2fNW8ehdWTro2kN+0a6SLDf1e9MTdByVk+/ub0RJ
 RFy1sd5AqnLCE8lXLqVTUh3esHuuRwpRRs/IK2uyOeI3zAefaQ6N++c2SoxDqDqbJh/3zP/fF
 yhSrNlF/0qcze/cA1+jKSEWkdngeCgR5YbPLPVyOgVcAof5oR0dSfM/CC7IrPO4bVi577Uu1T
 UOMGSrzdJoOKmrU86okHJYVBKcsf15Z4W234fjXV2w6zsmK0d1nohHuTUWWsmhLdMmHtY07VY
 Y7qloObgjupl6j7uOK7p79QK2Ir1s0T9m8Th5kxPSkOXMObAC56Q0fhr8S6cz3LhMv8mEbP/Y
 bC/g5DZFi3uZfKKDS143Kr9U7jpWnY0JTApSq1kcv5G3qcCQwN7Zt+YMvpEFyXgjFEAjypGoj
 gUszSF7uLA/+rGOdCmUORd8TNGViZ12CuPQb7lRacVRf09zR94wm90wr4MG3P47V84k/Cepph
 qCHkJVnCT+adlmyiSXGu8VMaVZK/RULOjDQqxV7k4WKgA/1Ejg7wQwwUusJ392KFW1Q4goqcd
 UcIx24QdTTVW9tv2vCKbR5EH3Rypb4UHyk0NIBhOc2iFLxjwz1fooL45KRWrVXoV3nzIj7UPe
 iaW2SUsvsaLdPlKe03rjPzLBaKfAOwjjScGrbAxqGYz3acfWwNrt4XHxyyAPWA71mQVyk63Qj
 rwq+Het4YkB1hWvWns44JCwSfh3buYJgyQfKKfzNiA2XTZwreKEjh8WUdgPKYEQqY/BBkxcfa
 sDmFtk/61eXMNlakX2+42CmtDgw=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
Cc: <stable@vger.kernel.org> # 6.0+
=2D--
 arch/parisc/kernel/firmware.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 6a7e315bcc2e..5bccf0025fbd 100644
=2D-- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1288,9 +1288,8 @@ void pdc_io_reset_devices(void)

 #endif /* defined(BOOTLOADER) */

-/* locked by pdc_console_lock */
-static int __attribute__((aligned(8)))   iodc_retbuf[32];
-static char __attribute__((aligned(64))) iodc_dbuf[4096];
+/* locked by pdc_lock */
+static char iodc_dbuf[4096] __page_aligned_bss;

 /**
  * pdc_iodc_print - Console print using IODC.
@@ -1307,6 +1306,9 @@ int pdc_iodc_print(const unsigned char *str, unsigne=
d count)
 	unsigned int i;
 	unsigned long flags;

+	count =3D min_t(unsigned int, count, sizeof(iodc_dbuf));
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


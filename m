Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B940064FC8B
	for <lists+linux-parisc@lfdr.de>; Sat, 17 Dec 2022 23:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiLQWEp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 17 Dec 2022 17:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiLQWEn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 17 Dec 2022 17:04:43 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB71BFAE7
        for <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1671314680; bh=XG4VbDB0J4izQ6gNlDnI7d1/KeFFRXC9PgG+5mF6L80=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=AOYcasQjor4I/YDn7nZfUCCpNS6zyy+7Mhbc/4R1BE5vtLTHfckm3wAKeADByCvTA
         gxUpDTpdlUu8urZayPnYZ1YHruvbw4bvYStyRUlHV7bxLeU688RZg7JiKPsF2539bF
         7B4pK0vEtMRXZp2oEqEFp2OqHtCqaDPhXoyRqNm2UiTYrY62GhHbSCqXL9NEfre+8Z
         xDl5LyLfxUDCk0O1PYuDbAg48/v4+Jw3ugBbhJ7tN30TDtxG4lB5nonv/1nUB0DVUn
         dsx3Wku1WUV9ONMBOHOsxIh8URxZ+fOdNe+tn7+siLpwnmSe6f9YPJezTDPjqm8DTG
         8vyNYVbO+ox5Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.160.18]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKm0-1pH9ve0p6Q-00Om6N for
 <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 23:04:40 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 4/6] parisc: Drop locking in pdc console code
Date:   Sat, 17 Dec 2022 23:04:26 +0100
Message-Id: <20221217220428.383330-4-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217220428.383330-1-deller@gmx.de>
References: <20221217220428.383330-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tuunWJO8/QL8+ngL6cHbhGu4HwQF3unHbrOptDTKcmKxwOFsrxO
 Zs8ngEls43vuJ162DmQyZLBKgszpziJ28sgmhqxC21M3Wv+dvmVrj2Re+rOt3PpjRjWWPOp
 rkpIT/9VnUGW80e7Y5qSVU/wHaImLFEzmEgNkjT/FdxnrvIpLFrelJkvofkSteOusOyqWTa
 w12bcuJvgcDchDYLOswZA==
UI-OutboundReport: notjunk:1;M01:P0:iWV2UMIWKYs=;wTWAeg8hTWECYaWCJyRp/WXNQNz
 OuJCEF2dnj4jOyOjQXupBylTtOMCk3JP9wwtTgyl8vhnqu08mck9/Ob8uhPkQ5JZuj85VGigU
 VreUjdPyWU08fM1QecPuRygmAtd+EQcxof0chliBfpn3LL4EPEVTgs1WzVISmFOBuDHScrAVi
 4pWgr3Oebg/257S20eOiZ1A1nvWG2nfPpqDVFERlUz4UjOPP3zA1jixPUgJze7xmWoSlfmomv
 iiDJbD0nWCQp1K4uFjW7RVg+RuCXTamlpQu1XUKi9Wjp4W9jA9Uk4P5IhyRNUGzTQkgXz1I2f
 4v2aeFN09A71+HDf4pGpYzZaACLLLm5YP0ISvUOH6/9R0UIxHyrgPd0vTlIcazTte/An5a02q
 kXtjznlixLqF4It2AYUfBFrkNFql6Fy8H3uRXbChe78PGPEtpJ+D3lD3mS39zOU/mWzSkTHrC
 9WKOvwbhMjnG3bi3+lBm52lHViFEwKXNNzja8zlwrEGtx1MBOThIryOWrIo4vCB5ME0HGEHtj
 a1ETP7Ie1j0EHs2x3U8LofxEocYBp/f0e+yftV+0knronLboEYRAWdckghy5dCHyvUZNkZRfS
 1FqySSqlucZSoFgKK3sx5ItAI78tO3POg6qUKvNRjzHIPDPMtmJQ6NuMRfBvcNYTxcqyu4NMF
 1szDhl9S7gwcmcF7PYR5Fo75SfrFo+mUhTwmbYVreb6ajYw2FbZzYSHh2X/aQdAJMJ6p17GcD
 M2qzeqkACoq1Y5a2A2DFxmIVMMqbtzSif1Lg2feeMp3+nkFURNM7ZOgqvt4FRy6mBi/YGNX2f
 lWcikxRAZkqEuz6UYnuh2Pu6/8Xsrq2m8gDwLTTVG9bBP7CYuANl0rwFHT4xeb7h3M9c/dxY9
 Sf2p9j+fI/PpXLZYB6/t1N7HdBYvg1TvYIEHFQgfeL3bMU6HhfA0wu/QQ4MHLxtg1iTYiqaAz
 IFOe7A==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

No need to have specific locking for console I/O since
the PDC functions provide an own locking.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # 6.1+
=2D--
 arch/parisc/kernel/pdc_cons.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_cons.c
index 7d0989f523d0..df374f7b42c9 100644
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
+	int c =3D pdc_iodc_getc();

 	return (c <=3D 0) ? NO_POLL_CHAR : c;
 }
=2D-
2.38.1


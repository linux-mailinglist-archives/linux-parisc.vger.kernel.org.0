Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25DC364FC8E
	for <lists+linux-parisc@lfdr.de>; Sat, 17 Dec 2022 23:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiLQWEs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 17 Dec 2022 17:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiLQWEn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 17 Dec 2022 17:04:43 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBFE7FD30
        for <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1671314680; bh=77l3N0weOo3yGbHoN7xASq1Pgy0xZdMgqvZFHKiEEBE=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=ApbMBFJ/3w/MJOvXOgKnBXWjaZTINEs28OAjHoE/dnIUsrmFK+P0JevJhATQXsQyI
         U8aEH2mmSgjGHlJRaJfZcjBASo8frgh5Z8mvfalPGyhfgstMVcioB+sNsYTRTPLdWh
         WMdT5DIEKCcVyyfYWehbAZGMn/3Z6LEPb2M9AqK6q3qo5NY4aFcv1Pnqth29bSuaKz
         BrfZjsZSe6QkybVUtmuOjlmmj76/4L9Mt0s08Y48MYzxect3dgvzz3AYFLXuz+578H
         r9chi+3zyFGPLn2yx7XqygIc+fBlHllmZQByE1k5cdJTYbPw2O9oxTo5HtGXxQvviC
         C2FrOaILb+avA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.160.18]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJlW-1ofGUW1Ctg-00jLQz for
 <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 23:04:40 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 5/6] parisc: Move pdc_result struct to firmware.c
Date:   Sat, 17 Dec 2022 23:04:27 +0100
Message-Id: <20221217220428.383330-5-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217220428.383330-1-deller@gmx.de>
References: <20221217220428.383330-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qsf+RXvsSSbOAFnwOcfa62z6qoicrC7W3tn7tVh3CYmJVR1t3gT
 W5HyQhhShqLY8eKdu0PnZIlyguUgNOzcyyPie0vHaoPynt0Mxezc4l8a+V4pHt9GTJu6x+C
 ArhaG5uI0b6Zsj/TCjBjjvJF25vwOAdQE614tYVNo3WIyl4jqtVAmq9xUgEZkmKWzG961fJ
 7b4C2cQNaUsBr7/XwvSlw==
UI-OutboundReport: notjunk:1;M01:P0:TBNbLBm30VU=;pW27XTRrgubcPYB4YXkO+5cOgOi
 8fxczJ1d144mNO3yhE7eRNsv0ihlh+tBpaWcEGiH9wEelBXbeL2URB1sDtO+V2GrEPiRY/ppw
 y3NJXdUbefJrVjcHz5gEoZ+fH/nIDFIsHDZ2+FIJyAek4uUiFsUL6k/+ZUsNgb8meHDCzZeu+
 y9Sscn+B48XfO+b1XgrvkdFkcvrbGoJUSZLMpd2PvXWFMq9ZIGjcmQ5Ip4WX+ErhtpEV9cywy
 KF4/kXLkLv+SET+PGi/3PIi9XW57Zvb4Q8aeY6mtCJ+OMWpAmQhUOYQ5V0nU0AXOpykAkfx6E
 Jag3/Ta/Mp2A4HDhrDge6tVcSafZCtibzIG58gdHd/zeVeDGfva0qdS7DNqrd8uaDeulPHwUQ
 2sKXoQ5mjGEeKbiUw3C6/2g06amQ5o4syTCne/wRuTvCQtlGP/7dC7KjAC168vxgD6DSgE7kZ
 MYFrF/Obe+XNSyknhktXIOb2Ig3QPB7mtFzfkq9wrqx6iV0LRtjlg7ddx8MfCNR7Z8KeNWIey
 GEUmP7RfLf5AR1w6nxWWwcJ8UaoKReC8MCtiX3EIEHaJ770rximnYFoorZPQw03xmzhmh37zC
 SyEOkZ+Vc5Ft8l/tRcasRF7W7dUoYOndkhX9RMjXXRpw9Re4ZDOUvCCt8qrUmD2uwhoMjrFgi
 rigIvbX/uS7AnOl8RHOQy4Y32tHPKERb6q58ILnYtO2Gn95ZfwMNpa/ofPceXIS5ZENrgeqJz
 9+x3uGXc9E2j0MP726OpUJLPPBrmI7kbwz6kxiLG+3Gg3gERHiHowUsA0j0PDU7IQVrkRZJ9C
 DACGdckmkqGQf9hv/v+PYnrVgxK73xjXiZZm4+8pgqCLA3Ig4OI+wQi0s/K4AHjZfxamZKN0x
 F+X2yFmuXoavUOlHujT8YSBm7bX+wUfdUkjQ2M+2/BFXF+eEih+kbZNcllmbj5A1L4YlofKVt
 eo/98/aVyqWj8sXVMU11WLlrPBQ=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/firmware.c |  4 ++--
 arch/parisc/kernel/real2.S    | 17 ++---------------
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 5bccf0025fbd..9d7516376fbf 100644
=2D-- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -74,8 +74,8 @@
 static DEFINE_SPINLOCK(pdc_lock);
 #endif

-extern unsigned long pdc_result[NUM_PDC_RESULT];
-extern unsigned long pdc_result2[NUM_PDC_RESULT];
+unsigned long pdc_result[NUM_PDC_RESULT]  __aligned(8);
+unsigned long pdc_result2[NUM_PDC_RESULT] __aligned(8);

 #ifdef CONFIG_64BIT
 #define WIDE_FIRMWARE 0x1
diff --git a/arch/parisc/kernel/real2.S b/arch/parisc/kernel/real2.S
index 2b16d8d6598f..4dc12c4c0980 100644
=2D-- a/arch/parisc/kernel/real2.S
+++ b/arch/parisc/kernel/real2.S
@@ -15,28 +15,15 @@

 #include <linux/linkage.h>

-
-	.section	.bss
-
-	.export pdc_result
-	.export pdc_result2
-	.align 8
-pdc_result:
-	.block	ASM_PDC_RESULT_SIZE
-pdc_result2:
-	.block	ASM_PDC_RESULT_SIZE
-
 	.export real_stack
-	.export real32_stack
 	.export real64_stack
-	.align	64
+	__PAGE_ALIGNED_BSS
 real_stack:
-real32_stack:
 real64_stack:
 	.block	8192

 #define N_SAVED_REGS 9
-
+	.section	.bss
 save_cr_space:
 	.block	REG_SZ * N_SAVED_REGS
 save_cr_end:
=2D-
2.38.1


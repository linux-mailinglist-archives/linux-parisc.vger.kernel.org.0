Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E7A606FF9
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Oct 2022 08:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiJUGZC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 21 Oct 2022 02:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiJUGZB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 21 Oct 2022 02:25:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E895725B
        for <linux-parisc@vger.kernel.org>; Thu, 20 Oct 2022 23:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666333494;
        bh=wFQsF1cjqJo95iMLqGtGrEvdIyBG7ZGhjsvwCx/S510=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=jyNjMVG9XOgQgvvZJT5Nx7a8VK5rEWfsS/ZJDI6dsfMFnokXHzkdyNxSVgDdjpmsV
         SFU20ORbOf3MmwcAaFw8Vpi14wMuE+prhbkyGD0kTV17v33lpT64vvJrS8fsUnwsgh
         CwywVXw909IS3V4u6yMsBgvp4bHJ+q+8LuuqHVW0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.168.94]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MplXp-1pT19n1pGP-00q83H; Fri, 21
 Oct 2022 08:24:54 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 2/2] parisc/serial: Rename 8250_gsc.c to 8250_parisc.c
Date:   Fri, 21 Oct 2022 08:24:45 +0200
Message-Id: <20221021062445.28701-2-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021062445.28701-1-deller@gmx.de>
References: <20221021062445.28701-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rADhSgdJMDZMm0FSRfuluyOSfIbeFQK8wrIXI/l8VKbqCpK00C6
 0O1WlTrYaScJQ5R1lZN+4w+5P6xbjvUXD/OLTPzNSqQRQTU5JtflY+mQu48oVlvoiQ7EU6z
 urJfYLm4CyFJ6tONs5+sCkZOIwpNkfKzPO43XbkxygRnV9DGPgy8t9cK6GPuHIzFFxBUoab
 rZiDr8LHZA84MZj2BcsKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YjMamR/KSN4=:Lk4rAN3fhCBNjzPcU39PUO
 pV4SKMd428VqeDn81ixohtZ8LYw79ediMYMiS11KR5iceekhNf3JIrwN6GCHsdvb5FPvDzJHd
 2Xoo56kgTLZRd5X66T23AaAJcyeYDgksgfZXObQp2GPXKtsqBiKdkdiK8QwVCNFpPqDQwEFsz
 cIQScXISbn0bjkdzljZ9orvhnKrgpuJW6bS52P8caVv8JK5vySpwqib30qoLNghyXtytWxsKM
 fl/lcsbpX37C6M1wuvdZ6KdlgE1uHSJ5mVPtcbBFcD+DFWiToWRz3m5XeldvMzk8pSu2huSUV
 gG9ToeolljUmq9pKZcJeEX1iNd1MeRzw8QitH7AryvFl5G2mwJ0vnj2+7kOzHUQUKHZ10cDUa
 kWrLJXy5hLMd4lSpm9b1/83wRTgtwAeLyXLuBvzMrqday+gmibQp6OGN71Kxd7Clm3ha3w8Jr
 Jlxe9aXV/3gKRdFxtWprTnGQ9n8bF7GvLMhq7joooepXConJCdGbGjDpGczzUvkahkb3fGqNq
 KtGgm2chEOj+QeMKR+f+hayr7cdD1cseydAsJ07qXgGcEIHN8aRg/vbAP1xicao0+Xn9ihyYH
 7d4U1cPd5s7VBu8yXlv2KNlIE7bnxYrbZcM1HSqL3EwTtS+ZDxH00e7FVJGTn5b9AkP0lgB+s
 PI0zZro5DX+xaCxNwHc7HxfQYrl5rbAMyVNEOZvhoGuVwR2emJsz3dtT8mSbMa56cvh6tO1L4
 n4F+GG++Hqkycii+01qV6JWlzKtphsAANvPTRhrWmXp0rDqHv71eKbLGhNWpOPWgvjxMrFrTw
 LZNsp+6f7rbeZxFafufFEt133uu9PSQYNZB/BzVKNrDLh+eN4rg1cjCk0cWCN0jVxmTT28IYy
 5veF9xi8fST4QD6Y3O9LS04ti45tNnKtf8jj4i7XuAkYXyVICqpwTMrDT/CpAzR/AbD4gLuGO
 ZMsyVeULogsE8RkUO4RUf9GNvOcD6OKE/FH/qPhZ4fTU0IbCLehcNi5THef8P8uEhf1njfxX+
 nBPMxTq7WIiZ+KbQ6pd8DChr6dGP375tNUwihUE7U3YjK9P1ylR2+XUbjxrM1CGJOSDusMO9a
 iwA2MO1Ofjk3rujpy5Dt9RZ5O9J6ZiqW3E45sIjxkn+XoWQGaiJhk7zAwnoVqqigkrLRZzY1i
 7FLSNVuc5FJxjOZKsSHGnbmcb0LrOVG3xpRX0m008ozTQbuTJev1wB7pi7FlpMCi5KuAVcUkZ
 H3BJRZV8VgN2uAtFuifzMvWUw0mHSaxmitrUw2Tf8+Jv2xGYdnL4UO+jkz++voPawnLg6OMm6
 lrpbolOtCWKFB/9QR4pMrGskPymIPROyvB3Bj6MZGpHXr2yecFe71GskR7vrM5qiFgqMOQJIJ
 vO3GQFure9OpgrE2krGu4YI/Bw1U0DSr5MpN2+ZtRCyQW0yJP0zesH2+WnEzFJ1sZJMGc/9U9
 Umy5Hi1YKNhQMev5VDtEv4F1eq/6tPzQrzbgDwZuquSLQNTR1dbMzNWGTU26AXk4Gt3X/ZN3w
 vEME55PgxAerzEkFvqx7jHT1VPpcsFRXAG3Y5JFtWBWvU
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The file name of this driver is misleading - it handles various serial
ports on parisc machines, not just such on the GSC bus.
Rename the file to make this clearer.

Suggested-by: Mikulas Patocka <mpatocka@redhat.com>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 drivers/tty/serial/8250/{8250_gsc.c =3D> 8250_parisc.c} | 0
 drivers/tty/serial/8250/Kconfig                       | 2 +-
 drivers/tty/serial/8250/Makefile                      | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/tty/serial/8250/{8250_gsc.c =3D> 8250_parisc.c} (100%)

diff --git a/drivers/tty/serial/8250/8250_gsc.c b/drivers/tty/serial/8250/=
8250_parisc.c
similarity index 100%
rename from drivers/tty/serial/8250/8250_gsc.c
rename to drivers/tty/serial/8250/8250_parisc.c
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kco=
nfig
index 7b3ffb7f50ab..b0f62345bc84 100644
=2D-- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -116,7 +116,7 @@ config SERIAL_8250_CONSOLE

 	  If unsure, say N.

-config SERIAL_8250_GSC
+config SERIAL_8250_PARISC
 	tristate
 	depends on SERIAL_8250 && PARISC
 	default SERIAL_8250
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Ma=
kefile
index bee908f99ea0..1615bfdde2a0 100644
=2D-- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_SERIAL_8250)		+=3D 8250.o 8250_base.o
 8250_base-$(CONFIG_SERIAL_8250_DMA)	+=3D 8250_dma.o
 8250_base-$(CONFIG_SERIAL_8250_DWLIB)	+=3D 8250_dwlib.o
 8250_base-$(CONFIG_SERIAL_8250_FINTEK)	+=3D 8250_fintek.o
-obj-$(CONFIG_SERIAL_8250_GSC)		+=3D 8250_gsc.o
+obj-$(CONFIG_SERIAL_8250_PARISC)	+=3D 8250_parisc.o
 obj-$(CONFIG_SERIAL_8250_PCI)		+=3D 8250_pci.o
 obj-$(CONFIG_SERIAL_8250_EXAR)		+=3D 8250_exar.o
 obj-$(CONFIG_SERIAL_8250_HP300)		+=3D 8250_hp300.o
=2D-
2.37.3


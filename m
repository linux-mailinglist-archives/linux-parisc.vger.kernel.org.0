Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0CE457899
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Nov 2021 23:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235436AbhKSWYa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Nov 2021 17:24:30 -0500
Received: from mout.gmx.net ([212.227.15.19]:60291 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235428AbhKSWY3 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Nov 2021 17:24:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637360478;
        bh=llAtR64OETgb0vamulGtcDWWg5v/pvXovRyFNUkwX9o=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Zhj95S4vfLgj/+ORjUTinRaFfdd2nOKc9Ya5uQymFlxsgPlSDgMpi7qv3gUKA5cf1
         6ugM1r7b5QNSjkwWW9lMnoRKFRMR7aVcfI4cGi2ipcoJs3JzGOsZqmFb0JEITu8dsp
         vskR27nMlumWZ//4UWNsjFNIc4w8qc3iRwyu1vRg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.164.19]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAcs-1mCwh33WwK-00bdkU; Fri, 19
 Nov 2021 23:21:17 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 1/4] parisc: Increase FRAME_WARN to 4096 bytes on parisc
Date:   Fri, 19 Nov 2021 23:20:39 +0100
Message-Id: <20211119222042.361671-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mw5bWapNjToicdK7khij0D7EIGLYU5bHnIhM38X/8L5w1c6j6Xf
 5M5B3wNLfF4c+JR8QRYS0wcbkwKQCvDW+70Q/OSs2g2dr+9a2JtIXRDyqTijuW40J8p4QrF
 L+j3GSC/XzpIoRY1o3kPp+R+i3WS+ACbnrGRCz/9HvfVusNzSqk7bOjotfNouEZcyfeKSxx
 qy1qLnfI0jzpzNz8mNQ/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8aiID7a2Tlg=:EOw7QFAAGx5DzD/y2GXfyp
 4V6pvggUHNRPCvOeOZWHvAS55Z5mt5dirNebSzcRImYlWOVsnlYNbJFyX00qG2CENNTYDCIj+
 dOpAdrNUA9+jTpjc0lqI1pU6EuV2v/Gb9onqsK4Rvf1Ops/t+KnzYG6sPPz+96CayQwhS0RpG
 tAylwNGJ2vEbW/kxWOyX9qMRgEMwuOCKnyI2gsRD7wWQCOfobc1IdVk8ldRMOWD2f3cxtx0gh
 1wr/oBj1nhL0pgB9/Nga5iLiUdPRz6QeuYmLO2T/wpeyV2oa7zpv/Olvf1x/ZLCUaRzOsHJpU
 4ocUmUZYfELn/4/SH6wfPCluS5bDw8vxPoXda3hJ5FL8gZNNh3WwpDI8X29XRhB4mvHJQ8DmZ
 tdwkMA7HWz5jg/PvgtpSjLwwVLAVcbLI6kMkp0DrDAtUlbzDk5wVmQX4LP7ZK9yT9QJ+eJnRe
 7rlLFyE537kyD3Hdj9RgV/jXyM51wm62Exj5rPxieRJsuq5W7+QdBnJ5X9Gxc6weBZIkPOMiX
 E3ZC/mnZA6drLXcGt252fQ9WoXr4DiBkahWAM7D4NvGwgSD0XfiXAOrr6ghf4NyYdQ+EOOZZE
 SGRdAwEBUbVx9c9T5yy/x/dvFuUbOazOxtVIApq5U0RXqjZcXIkkQ6vu5Lc+9/v6zhHSfeD+5
 pNNVtdu3+e8uU6vMGeKHS7HtCESyfkQFTV7PCTUCWH3cfUXziFypO/lbZ2Ja2vNiZGqtw2YXC
 r8moUAjzJtZznvj9kYI8zOQQ6ANcAvPO1cQolvuHdJI+M+Q/BJo/OozER/k8ppzo1EkW+iBcr
 6pQxlZQoExcDtbYHIQUy0XYMMzySyaYnCtGBxkyB8okLzp2f2SPvGPAlw4/dMSZQw3snbeknJ
 pod93jX17F0SrxgvRPqOkMR/AInOD08eFGD3xZ4yFTm1VQ2KthAXBRuMK1yNesmH6BrtKE9Hk
 0fidz+8UeY8pIW6x2nWKKh742HIo89BwgiviPWrKpFveA79STvS4I3KeP7PskuKoA+bp1P55P
 7TJUpTOiSSD35itX77DlJgBIHwKChqkVbjo25doWAV9TMGPsQgsbXrLIlEy+CfAtex0S12uXU
 cuMCj5YgcjHle0=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

PA-RISC uses a much bigger frame size for functions than other
architectures. So increase it to 2048 for 32- and 64-bit kernels.
This fixes e.g. a warning in lib/xxhash.c.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 lib/Kconfig.debug | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9ef7ce18b4f5..5c12bde10996 100644
=2D-- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -346,8 +346,9 @@ config FRAME_WARN
 	int "Warn for stack frames larger than"
 	range 0 8192
 	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
-	default 1536 if (!64BIT && (PARISC || XTENSA))
-	default 1024 if (!64BIT && !PARISC)
+	default 2048 if PARISC
+	default 1536 if (!64BIT && XTENSA)
+	default 1024 if !64BIT
 	default 2048 if 64BIT
 	help
 	  Tell gcc to warn at build time for stack frames larger than this.
=2D-
2.31.1


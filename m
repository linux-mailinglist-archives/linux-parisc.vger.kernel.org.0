Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD3D453253
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Nov 2021 13:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbhKPMnW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Nov 2021 07:43:22 -0500
Received: from mout.gmx.net ([212.227.15.18]:60881 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236153AbhKPMnS (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Nov 2021 07:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637066415;
        bh=C0bvVbS2Xyh0plvFiLgE7Tk7LbSkB+yti1MqhIioNQU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Jdejy6E85gZn/quPVEgLWeCa6EzxXJY33X+budqqDqf1S/mF/CxQIkP81XfLpRaia
         l5+OyEaxAppWgDaN0KftFLKE+ho7nReXiiozbyIwfDLdkoCEjbi7szIgl+pIZiHym6
         0faiKBm3Cmgex2CG3d3LWptQrqcI1oIsBk89RGFg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.177.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJhO-1mNUIF0xNc-00jJRB; Tue, 16
 Nov 2021 13:40:15 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 2/4] parisc: Increase FRAME_WARN to 4096 on parisc
Date:   Tue, 16 Nov 2021 13:40:10 +0100
Message-Id: <20211116124012.1380455-2-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116124012.1380455-1-deller@gmx.de>
References: <20211116124012.1380455-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0VjQNE83kuTlkmshLhltHCttTR4C7j8L3y0wWdzQpAjo408X4Lw
 htY2W37jbje86PAcWvCMaQx164XirmKcsYZOdVK0BFtpVKipH66yIRC5zBGQppJAW5HFds4
 Fl8B+H98zwh2IAQW3b/TBIWCCAlxxFDPNEBBJcwtdQsjYphyZAnIESq6HFL6LPWK+eOUPSt
 HUggjZjmaeuY/hVMZnyTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RO3yDsNVZAU=:4RTcXVSCGnMremZnZVMlWs
 hugxVxfNPM5gAG9SQQf5GyxGHlkG40Q6tT9nY2URHRuohQXb7WYejmCVTVdPrDXlSHYW80SLB
 nSGfNNujFYyOGZyWHzaTGdj78mmSHBzEFC9s2P/Wu6GeE35fFH9ZVdZHFkzfCRlYlxwkVAmBU
 55H5svg6M/njjFYCjrLyMMCIm8PmS54HTuh7rn6Jpr3pKCx1oMaXbr8PixttKL4i2t88uB13S
 jpRrk0S4S0UZ955QyAVfGkX4lbfavy3BNL/pGG31/9KNETFnY0TX/v2mv/hsvt8kvJPYq1l2r
 XfQw16F0IkTkPVS2WfJoT/WXFgnEtjcxJ5mAMoVOEO8KWgz7o29aaB6Gm9wwrPtXcnLmXZJs+
 i4QPKEyGsPLNRq9VWpsw7PGQ2kMeWhPYq9wvdPzVtmLOvnAfPa7y8L5Tz7FekNYTuGE8oRtv+
 +09Uc8uOUSAVROCHc0R1sUYQXRPtlGBIjCE3hqA32d1KBr6XWVLgTjzJuaFaICDCg+YHo0amV
 BGU55W1/hD92xrE/0W5hV4r7Vv6lPP19FvewOqR53kKECx7zKxE34+NPAw+LthoyahoPv0EyD
 +ETi8AjsV5h3jM51Y7hpcRa949D2HFmYgYRoEMfOCiWkxOP72VPyb33ZcTXU+2xTAOAIYK290
 GrPqGwX0B82IjOYYsaSG48ltJpqGCSLBPFA6qEQ+i5Gxn73ycVvvE7HXeKY5wMZjfqe2qJn5i
 jNCxYPoPxTeTb2Oqi/1aox+yZ24kmCXTFJosfWAYwBDQZFRGZc69/SfDOd99Ie6/oe2Jges5p
 3+b63eOs7nrMMRv4Yb3YBTBKW37j16XmkBMYwzunsf3PrgYp/mhFOvaM8sdi7TwhzrhxauK2F
 oe7HA1TZBHWJYa6Ozeo2hsJE7k/5SSduyGI0UDxdvlaf6fiSgq9SvBKF9PomM5WFwOUlLsiZ9
 /bQtrJQO1iF4kjZiVeJ/09/ExEUduBLEXcNfVuoOK6tDLXuJWN15uqwvpdmZRY5xizu0gcnnT
 XhnYNxmMKvL5LGo+Y39NtcAc38gCNbk33H/QpLzOXsPDwvI0CAVrHa/QQHcJiMBNVcf3UvDOP
 hBqjnAtpDPf/GU=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

PA-RISC uses a much bigger frame size for functions than other
architectures. So increase it to 4096 to silence lots of warnings.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 lib/Kconfig.debug | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9ef7ce18b4f5..4fd34095c369 100644
=2D-- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -346,8 +346,9 @@ config FRAME_WARN
 	int "Warn for stack frames larger than"
 	range 0 8192
 	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
-	default 1536 if (!64BIT && (PARISC || XTENSA))
-	default 1024 if (!64BIT && !PARISC)
+	default 4096 if PARISC
+	default 1536 if (!64BIT && XTENSA)
+	default 1024 if !64BIT
 	default 2048 if 64BIT
 	help
 	  Tell gcc to warn at build time for stack frames larger than this.
=2D-
2.31.1


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6733048E4AD
	for <lists+linux-parisc@lfdr.de>; Fri, 14 Jan 2022 08:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236022AbiANHIc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 14 Jan 2022 02:08:32 -0500
Received: from mout.gmx.net ([212.227.15.18]:38949 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235841AbiANHIc (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 14 Jan 2022 02:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1642144104;
        bh=BxfRhreYujPeGp9+nJXdTyutjragMB4S+jmRTEjvV9g=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=TwJEhODW9CsBflhHXPZ5a3a8ZkgkENG/TAo1MoV6E3d7ABW3Khyr1VhhsSqNCe9C2
         /O2MLN1DjX3abdC0pGf+tr9Ip8IpEAXGO7vRsAcJ1rhIVu89OdP9vGhkj+uBisOTDK
         oVyWY5mANuDvbhDzurKA9HfZ+dkVRNRser2v6cZ8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.186.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2O2W-1nC8JS0ZMk-003utK; Fri, 14
 Jan 2022 08:08:24 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 1/2] parisc: Use safer strscpy() in setup_cmdline()
Date:   Fri, 14 Jan 2022 08:07:19 +0100
Message-Id: <20220114070720.73353-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AL+gSoW0b5rnxUEaIYu+TPfpx3cTN7j46ygbCMs9sJkZ32R+7GJ
 q3dP+RdIlqoOs/A+RV1l8reXvXa+OR/xfDF7D2pHrKtAiRku+qwyg4vY6JFw58lljxUpism
 fC3TksaNuSoXNvtFv7Wm8ceebnPUDyw+Y66e6qnDPg66oev2imFFAJlKZi38EjsFqwZCIqb
 5TGtbuyS5xNBzLNQ3CJcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1jwmLCznY2Y=:P+zRUHQ/J5kKjbUz1Tr+eb
 blfHjYUNBXY0gZfT99BXU33CRvT4EizHJ9mJk+77WmXAYyCa2Przv5OwAC0VP45xcvzO6MedS
 p62FsMA7FvV6LFf3tO3a+Yn3lhjezECg+4us+QcMsEEf9LF3nBEs7I1EM37FlAjELeHS0BZte
 Ne1lvqhuS+UJUbjk7bTkE9K8ZvAYOft8dqFUFX1DcDihg0vs7/H5r8Nfdr4ul5YMi5ayxXkxD
 gV7GWwHNKLHzK48QVAYmpEVeIq2dI7Uy6b6VhNHNHCGhhGG+kLmMFekT4JCow5t1B85RPW+gM
 ZAbrq0BrrF12aITs6PLsJaVszCypGZnEzAAundDGuHwafIUeordgUa+l/kTWI1TRSC93zX005
 7EQV1d9I3ygvU26wcBPC3XsWf0nW68zobOtyX9yZvlIx8I5DAfAKcifWFB2NKsGeg+7TJ4Bvi
 tlfYV5NpdLYQrRgJh4LS5tEUbfE5tD2aX7dhaTZkb8UW0W9e9QJpS+ECtqJfieLe1cDIZ/MVw
 +GIOHTCM6+ELuXZHCwRcY+1OfKYqerTBpJ5TgHV8cThqPaoKUE56bYktFo5kHDsnGgSBKKMq+
 XRpi1+pSNopB7RCTHzTHg1R/IE31unJ8BJMh5CicUwubXFvJE6bBuvBw+Qe8fDuHX8CciBso+
 KItcy/0jIFIpM7rPtRGIhyrG63bxDQnCSZ1VrV8VqWBVJR5yaMYVLA1koo5EwXKiIJtrcoj2Q
 bGdA308xKVkbUwMMXphM1tuYl4l1xxLK4xN736SiemZngSO1pwYtiBPfYKuh1uILOUUVZJFLY
 dcFfLNvRrKZr/56NBLV2USxuikOEWRSOOvDeuHFwoJEgcjc8IliqwQO8xClrLcCJmXKsM4te+
 7/2VGWd16MstXtw4OaKAv4gWNwi47j0vbcoJLUeiQS0alV05ScKW1BEVxG43irXYCxfeYgI88
 lYRkYVh6uFZPi57ADtaDBv0spWwvpmiKpSkEwbF/0R+KtLFvXSAU4IO2sD4gjhojs5FsVaOjF
 WlKpDizy+qcPrqKIL9eOgiz2eLePARt91bdxxtgxLeeP8nlx6J2Gb9zSPNEp9CE14XmgzbJoQ
 Jaik4Uhb7Uc9t4=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index cceb09855e03..456087a2350c 100644
=2D-- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -56,7 +56,7 @@ void __init setup_cmdline(char **cmdline_p)
 		/* called from hpux boot loader */
 		boot_command_line[0] =3D '\0';
 	} else {
-		strlcpy(boot_command_line, (char *)__va(boot_args[1]),
+		strscpy(boot_command_line, (char *)__va(boot_args[1]),
 			COMMAND_LINE_SIZE);

 #ifdef CONFIG_BLK_DEV_INITRD
@@ -68,7 +68,7 @@ void __init setup_cmdline(char **cmdline_p)
 #endif
 	}

-	strcpy(command_line, boot_command_line);
+	strscpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p =3D command_line;
 }

=2D-
2.31.1


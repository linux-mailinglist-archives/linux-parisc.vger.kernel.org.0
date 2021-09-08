Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779C540408B
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Sep 2021 23:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234048AbhIHVdS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Sep 2021 17:33:18 -0400
Received: from mout.gmx.net ([212.227.15.18]:52137 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229885AbhIHVdS (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Sep 2021 17:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1631136725;
        bh=Iv84LDyIFfYQGXvfwrBLaSmbfkdtZf+k1v67gqDJiJ4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=cGvS8SJBCMMH1p4OyYWfIE5uQKurZNMuC6QS+C34xfWQYpKdt7jq6wZkCjd0gV6b2
         yOkoZEak36Dkjh+W2yX1KI+dVzNa7HDaW/8yQX/KL4O7Bmrcb0Hf9AY0rgMyobLcBX
         9cnRYWhztOjMYvd3hpefahnz8Grkoe2y3PO16dpg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.187.121.129]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MeCpR-1mynEh33Ad-00bLWh; Wed, 08 Sep 2021 23:32:04 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Mark sched_clock unstable only if clocks are not syncronized
Date:   Wed,  8 Sep 2021 23:30:27 +0200
Message-Id: <20210908213027.177112-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OJvkyt4dTrFywe+zck4jNtz/sw0+koiGxGZwtYswwDjaFSDibv+
 +fA3dBJcd4lBZczVt80ghZstJLVCxGRWjRaL5g2XAT6qKEJBR7aAhwZXrkXgex+tNtChZ7r
 hw0fx86ICnsmJAmtQ9WLUW+1HddrB44HUs9Wh2Ien7YDX9gOpweXTJxsFM7gtgGFYoHmEzq
 S5ggitXvh3Y2dAHK+OW9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VWJKw619fjQ=:mzhjcKZUN2ROY1HavQg4EB
 TJb2vHysJ1k1GTrryWhhq8LNrB2Xu3/6wJjhvPwxIKM2I/oAOO/z4LJ+xMccCTCmHhnYkRbrJ
 yYMtt8G5BvXO+2QHptTRfZFKOwNMvz+19mSWeqm1x+Zu8DBgkkHxx9HPo9F8wIMctTRsd1ZTh
 9V/PhGBOU6114cp9ni06zGSdHD5NJHDTfeBLetzOw1Q2qIzqMmD8KTaZjveFmQ6r0GzN1LKhq
 XVrDrzRvn81RGGDrGELevHEEVO80v006PyX03I5aiiWGmxOVagzdPkDDto0WI2wdS9OHQps2T
 31SQIp0a8PXDbqk0BkJ2/S3wVI0XHoxQDJsFqO4xOHWOq2cw5GhLZ5895uAMiMPWBSu+U7hDS
 fdqvyf109dBVWgoZYgirczeDN7JbG9gQiULBDK+hCq1JqascGAtyeBliyd/jhqy+2ZeWMj8eu
 h5mJ+4FvnUa0Yw99xKEP16C8ylLQreKci/iWDa0iJhU5M+gTDZ5gXErrBJQAtcC8q7Bkni6Kc
 Ul52+rC1TeoyOG6Dx723AJTKFJ2GFfyVAPqaIKp8IyPyWKSo5v02tiCFGaUGnh3dXOR16pNT+
 BMAXseQbRRjMmR557iocDZ5QbGS70KNwR+6STjSztAOPSbiGVPh9RH8jnZ2Wb1W7vLMtb8LVj
 tctZ/j8VtVJDXDrpHIGAMSO2mgSxLUA+jobi4/s9gPP4Z5GDXTzjKxLln5iPwKaIkb+xH4eyT
 K2I7oFp4YdqigpkB/CASC8OxX94Ev6zkZ79ZDlHIiZAKlTrkdv+eTM+5r7U8aAVnrswCxAro5
 paNGNK65uUvQ0EsnzzPl6zlRypqkkYJ79g/Cofp7tiSCq9YCsLyKkKK7WpIRcU7kg2FgssLhs
 m2lYd4+5xdFEeni4F9fPVoS+zG6eNgAid5pW5L8gUTjY7WRY4fBzs3RUovwcV4+/CNm9gTX6c
 EE0FLrL8WEFqOs1jh53sNDp0Xl+BXoDZ80Q7kFnrz6oIrNVpab6240wPViSeh24E13BxpppPU
 I8GxqNqVEC8rAk25RZOT309TMogeI5Dw4SpKluO/22Xhix2OLKZjzmFFQ4S2jYsRNKf+oAJcl
 Zh6ucxrV6+WqzU=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

We check at runtime if the cr16 clocks are stable across CPUs. Only mark
the sched_clock unstable by calling clear_sched_clock_stable() if we
know that we run on a system which isn't syncronized across CPUs.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/setup.c | 2 --
 arch/parisc/kernel/time.c  | 7 +++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 3fb86ee507dd..cceb09855e03 100644
=2D-- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -150,8 +150,6 @@ void __init setup_arch(char **cmdline_p)
 #ifdef CONFIG_PA11
 	dma_ops_init();
 #endif
-
-	clear_sched_clock_stable();
 }

 /*
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 08e4d480abe1..9fb1e794831b 100644
=2D-- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -265,6 +265,9 @@ static int __init init_cr16_clocksource(void)
 			    (cpu0_loc =3D=3D per_cpu(cpu_data, cpu).cpu_loc))
 				continue;

+			/* mark sched_clock unstable */
+			clear_sched_clock_stable();
+
 			clocksource_cr16.name =3D "cr16_unstable";
 			clocksource_cr16.flags =3D CLOCK_SOURCE_UNSTABLE;
 			clocksource_cr16.rating =3D 0;
@@ -272,10 +275,6 @@ static int __init init_cr16_clocksource(void)
 		}
 	}

-	/* XXX: We may want to mark sched_clock stable here if cr16 clocks are
-	 *	in sync:
-	 *	(clocksource_cr16.flags =3D=3D CLOCK_SOURCE_IS_CONTINUOUS) */
-
 	/* register at clocksource framework */
 	clocksource_register_hz(&clocksource_cr16,
 		100 * PAGE0->mem_10msec);
=2D-
2.31.1


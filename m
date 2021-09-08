Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C1E404041
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Sep 2021 22:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350500AbhIHUq6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Sep 2021 16:46:58 -0400
Received: from mout.gmx.net ([212.227.15.18]:33869 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350509AbhIHUq5 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Sep 2021 16:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1631133944;
        bh=kd7gPk+eIrr2D3SXV0PRWz8e7NH4O/pJiuNTbD7HvHU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=CPasY0R97HiU4lcrAsdYtHQjZOHCWrVwMQFohSFbbnOnz7rdAVAz8MdoSu0/lQkm7
         KNOecmw5jSSFTTMOBu8x1u/40Qox/9lb0b/DTnUV43ZsLExCxEd+qJ5b7YVW9kCBxz
         N1Gxi5yLsP+7LY89kzZ9ayr/4vXEHCZYAWI/r6M8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.187.121.129]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MvbFs-1nGjGw0cTe-00scD7; Wed, 08 Sep 2021 22:45:44 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 4/4] parisc: Reduce sigreturn trampoline to 3 instructions
Date:   Wed,  8 Sep 2021 22:44:05 +0200
Message-Id: <20210908204405.127665-4-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908204405.127665-1-deller@gmx.de>
References: <20210908204405.127665-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2nffwEEyUtkR3Vvd6T2HVqBWamT8+fqkYiApU6/m7UK5OotzAxS
 SA+q+L95vfn5MiWInDhDvmy04xOYBhCxYjsu7EwfD6bzAKe01emLRV/mAKmsBYwwUYeU9Ex
 WTldxNP5kHRCDIvTecVa5NsH8ZT/oC0g9N47Mkiv06ndN2zLFp5izQsb50TKBAq97cDPTIP
 9ZYdxTtkH3CQofICVn4sA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aWihpC8IgTU=:ByHsQ7VF8PkhO7yw9UOYRA
 bCzRmKEca8oKfSxd94wfu74y9iyot18TPTRO0ZWGELirELC/6tZCwlsvDNvMfBJ0XW4U7dYoC
 tQllV4+Umfcr7s8JcwaR89tE/Kz67/5ICyvtbZ8E4tj4EMbMMMOXa1tP7KPVo0mavAZ6KYxUh
 +/tUfMAfGhqDRvef/7JQ6fWtEXw3T//l5V1sV08Rzs2oVo3iqTdun8/m+Zd/XzmffnUkvHOM9
 5degLr9sTvOCj/UbEaiWK19xqZe6xfjD4z4DgGShfREL7urx4BORZxQCKP9knG0ITC9lQW+51
 dZ63ABTEJZ2x3IEyTu8X9zpSXbmIKKkkxTw7NcJsf+EAw5MEBTlGu9/OO83RPLumxSE6kzcWX
 Ao9Cd8cLvcQvBA6AesXpRvwqNFoIcClxUK7ooY0B2HplNlH5ayRD8w5afl6Hx0k+tqq39mh+P
 b8tttK2Tyxq0nCDJisvbsdbsQGbhMUtODsUw+WKbudkGM52WhrUD++dgQbMNXwGMd6yM62tSj
 b4DWnrj5+6ywSS4UWmf6oj6rloEmSrDjge/j3t9en8jmigbMjbfib1IzfB31cX4uwcxrNxzzJ
 w4mxJCBrXLqGtfSJ5dOkhb+K9MxDYmw09D2EAFUSW5FARlgI+MO/AO5ASb6X42/1ssG7orVvL
 /lsz0IbCYinXVZ0Ng4CM/XcRHLHV0uZWu5/zxhQijCgiQEZYe2ZbvsnRnmG5UFdLE56EqH4Cy
 pL9dWQOWEJTOtJEtTf1CpE+eiw3eOSu5i+2e1hWGU+jA9RxrzTxOJq1mgM73iXu2FTjvZ33Jc
 wb3uvHjZgC2X5JI3q8SCCfyy+zYtZiZz1uQjcorkBRajhLC2QRnp+ncIZytBaHgo40Gnd6WYC
 HiJkgV9iWwRaKe1F6kWzxRE717lbcJyuMeW4f3sHKtAXvq0BUQb7JtqB+GfefLjLl5owOsbSX
 z8SWCtJ6K/jTcfdKQj2TWSlA5A9PJRASXKAvsoh6E3OLOPpy6O1dupzT62BTippALf4TLBD3z
 4kr4fEFDji62mS+j3bzbnetgS1Aif8E4sGBNVHxcQNpMh/pccSQfu6Np09LHK5Y4vink1KaIt
 ADO4s4Eg6YzuI0=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

We can move the INSN_LDI_R20 instruction into the branch delay slot.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/rt_sigframe.h |  2 +-
 arch/parisc/kernel/signal.c           | 13 ++++++-------
 arch/parisc/kernel/signal32.h         |  2 +-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/parisc/include/asm/rt_sigframe.h b/arch/parisc/include/a=
sm/rt_sigframe.h
index 2b3010ade00e..4b9e3d707571 100644
=2D-- a/arch/parisc/include/asm/rt_sigframe.h
+++ b/arch/parisc/include/asm/rt_sigframe.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_PARISC_RT_SIGFRAME_H
 #define _ASM_PARISC_RT_SIGFRAME_H

-#define SIGRETURN_TRAMP 4
+#define SIGRETURN_TRAMP 3
 #define SIGRESTARTBLOCK_TRAMP 5
 #define TRAMP_SIZE (SIGRETURN_TRAMP + SIGRESTARTBLOCK_TRAMP)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 46b1050640b8..bbfe23c40c01 100644
=2D-- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -288,22 +288,21 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, =
struct pt_regs *regs,
 	   already in userspace. The first words of tramp are used to
 	   save the previous sigrestartblock trampoline that might be
 	   on the stack. We start the sigreturn trampoline at
-	   SIGRESTARTBLOCK_TRAMP+X. */
+	   SIGRESTARTBLOCK_TRAMP. */
 	err |=3D __put_user(in_syscall ? INSN_LDI_R25_1 : INSN_LDI_R25_0,
 			&frame->tramp[SIGRESTARTBLOCK_TRAMP+0]);
-	err |=3D __put_user(INSN_LDI_R20,
-			&frame->tramp[SIGRESTARTBLOCK_TRAMP+1]);
 	err |=3D __put_user(INSN_BLE_SR2_R0,
+			&frame->tramp[SIGRESTARTBLOCK_TRAMP+1]);
+	err |=3D __put_user(INSN_LDI_R20,
 			&frame->tramp[SIGRESTARTBLOCK_TRAMP+2]);
-	err |=3D __put_user(INSN_NOP, &frame->tramp[SIGRESTARTBLOCK_TRAMP+3]);

-	start =3D (unsigned long) &frame->tramp[0];
-	end =3D (unsigned long) &frame->tramp[TRAMP_SIZE];
+	start =3D (unsigned long) &frame->tramp[SIGRESTARTBLOCK_TRAMP+0];
+	end =3D (unsigned long) &frame->tramp[SIGRESTARTBLOCK_TRAMP+3];
 	flush_user_dcache_range_asm(start, end);
 	flush_user_icache_range_asm(start, end);

 	/* TRAMP Words 0-4, Length 5 =3D SIGRESTARTBLOCK_TRAMP
-	 * TRAMP Words 5-9, Length 4 =3D SIGRETURN_TRAMP
+	 * TRAMP Words 5-7, Length 3 =3D SIGRETURN_TRAMP
 	 * So the SIGRETURN_TRAMP is at the end of SIGRESTARTBLOCK_TRAMP
 	 */
 	rp =3D (unsigned long) &frame->tramp[SIGRESTARTBLOCK_TRAMP];
diff --git a/arch/parisc/kernel/signal32.h b/arch/parisc/kernel/signal32.h
index f166250f2d06..a5bdbb5678b7 100644
=2D-- a/arch/parisc/kernel/signal32.h
+++ b/arch/parisc/kernel/signal32.h
@@ -36,7 +36,7 @@ struct compat_regfile {
         compat_int_t rf_sar;
 };

-#define COMPAT_SIGRETURN_TRAMP 4
+#define COMPAT_SIGRETURN_TRAMP 3
 #define COMPAT_SIGRESTARTBLOCK_TRAMP 5
 #define COMPAT_TRAMP_SIZE (COMPAT_SIGRETURN_TRAMP + \
 				COMPAT_SIGRESTARTBLOCK_TRAMP)
=2D-
2.31.1


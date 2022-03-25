Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1114E7913
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 17:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241312AbiCYQmW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 12:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243097AbiCYQmV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 12:42:21 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E57DF4BB
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648226441;
        bh=6e8x+3vHpe/N4+j4wLJlK1lnp0sz4Gqbdy4NlzdXlDs=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=LD3v6h7lpB19ibr5353KcWs8fTbpha2M1ZAuu5wJasRe32XHnvNSONqfNurBHnciA
         Lh+XZtMvA0TbDh99NglNAItH1OdytvGhzq2sqN8iKpglPXTVgkOPU3cii3QyZdHgke
         YviNag2NQPzHu+7ZUF3xsHS4EgEAkHgFMbtC/i5U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNNy-1nccZe3ir4-00VNLa; Fri, 25
 Mar 2022 17:40:40 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 1/2] parisc: Add constant for control registers and clean up mfctl()
Date:   Fri, 25 Mar 2022 17:40:39 +0100
Message-Id: <20220325164040.502188-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i6Qpw2EImUk/Qkcqpmx5qdbhUUA4uX7UU1PuAgqy7QS3TDBycYF
 3FiSatmxFY6io5Zx9hpvuJRePoYNBrOyotOOewQHYqhQKLhYZz93waco+Hy4E6ewtfR00J5
 LQ4s9n1bx1fSUqXHkeCk/4R3xM6ZnRxnypOo7aM0SFBBDTDUCFTrN4ysjeuSZWLaX8nt0Z9
 Natlm1/Ja9ORx17dk7S6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bxd10u3t6bY=:mdRD63tkNzWiv9Gik+6meO
 mwsDU8HhMkrG/Xt4xoKk4xvOlRF+sR6QGJsy3iA9UNUZBeJ9FjAd96MVT3Z08XCCwQ3y170cG
 WMkmdKZ9nGyH35HGuwQHjEBQ7KFfcgCe6g989BB511TustZWZ5WE28VoDUCVpkqtPC23cd8P7
 Sh1TktYPxDYDYz64126IVB7jhDQtXbiZX7V54HaIZT8AN+4qArijTApw2LIF4eChHXr6TWvT1
 1J6za4ONHCN/HW4qsXdHg5JcrUXisJjAE4kldOyHCAXxFkfrXQBAFxKgB5L+IGrlEazJ0aDFr
 gCLFxmZjBWMBOK56FT1baTntAj2oPTq7r3NzKD4AmBla+iGo5nBZ2G/7j8woTIO3dphk4e+KO
 VlKF4v6iQKpedDPhOsAlCpT1f7J8mRHQJPzCfkkqEcmyz2P02ApTmgAs3dcOX2SXRR9iEM1sM
 4ltWgW3S/d3D14zwidMUenQju8A18fZEN44P3VTpdZdyy0b7Th65WbveG22S/j7vYk7Q8E/IK
 Sqs1f7WdFszBVu/5mWKp9vehNzJ5cxkqB2s51/9af4Ag+DL3k+HCH8vbzefcExBXwsKnuaWIR
 UaHVrhIICt1mxAHtQLQFxH8dEqzUCPUpTuHrH9dhqZymTEVH2BXEQWHtMS+x3IegH9qbyc1es
 +lThtW/KDfNs0izxhwR1RzCoCC1saNUvo8MLHDKP3wWBrPgd4M6Zpud2FpJBiMRjbB4rPjjf0
 aNUSHxAwl0vdcXtMkqdphxSM2efgQ50BB3CbNCpURRMK0wg4GV+PoSznOjyXvvJ849KL4QElr
 IN6SfrKMOTjkwi0fmCj5/A+DmkbNAlX0moZ/3NItTVFxMhavHF25N+2ndpT1no/4kw+kBO/VK
 G1w4laiI/C5nmk023d1BhCAe9wvokbG1gN2+CXhg98Wa5hLPuEU1xxk0MwKyfryEttIBlq9Pl
 OaSqO4QUIgU5nDnK7Au0zE9eNuzxnyLBwVx1SvL110s4TkYJXuKPZtGgEdDvmH7a6waVvEb7O
 kp3+xJN0+82MaJ42/FydGjtVh971UtLXbAuBwPlEygGYd+aEAhxus3Ydvk/JVlfxtjuZFv/sM
 nf1lmRGAdJ3xSs=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Clean up the code and add often used constants.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/special_insns.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/include=
/asm/special_insns.h
index 41b3ddbd344c..c822bd0c0e3c 100644
=2D-- a/arch/parisc/include/asm/special_insns.h
+++ b/arch/parisc/include/asm/special_insns.h
@@ -30,11 +30,15 @@
 	pa;						\
 })

+#define CR_EIEM 15	/* External Interrupt Enable Mask */
+#define CR_CR16 16	/* CR16 Interval Timer */
+#define CR_EIRR 23	/* External Interrupt Request Register */
+
 #define mfctl(reg)	({		\
 	unsigned long cr;		\
 	__asm__ __volatile__(		\
-		"mfctl " #reg ",%0" :	\
-		 "=3Dr" (cr)		\
+		"mfctl %1,%0" :		\
+		 "=3Dr" (cr) : "i" (reg)	\
 	);				\
 	cr;				\
 })
@@ -44,13 +48,8 @@
 		: /* no outputs */ \
 		: "r" (gr), "i" (cr) : "memory")

-/* these are here to de-mystefy the calling code, and to provide hooks */
-/* which I needed for debugging EIEM problems -PB */
-#define get_eiem() mfctl(15)
-static inline void set_eiem(unsigned long val)
-{
-	mtctl(val, 15);
-}
+#define get_eiem()	mfctl(CR_EIEM)
+#define set_eiem(val)	mtctl(val, CR_EIEM)

 #define mfsp(reg)	({		\
 	unsigned long cr;		\
=2D-
2.35.1


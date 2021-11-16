Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2071453254
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Nov 2021 13:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236153AbhKPMnW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Nov 2021 07:43:22 -0500
Received: from mout.gmx.net ([212.227.15.18]:41427 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236289AbhKPMnS (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Nov 2021 07:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637066415;
        bh=d9YgylWXktj6SbejvOJARECK5eu7WxLIAJIywJrpFt4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=KRYR2NeHLVJdMN2fVcegpexgKfjt6X8LNHdAGQ7RP4AYqS5cwUvJTLFgD2ccKdjw0
         KGEZhdPQD4QBZlQpuZ1/Ey33K/v8AYbjmCyUAAERRVxMY2jkIxebYwvDU8Tt8lJMbV
         4A30CzqTpbudKIZxoW6RkJY3xCaOMTtdUPHXdAsQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.177.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxUs7-1mSqZi2Bqb-00xrbI; Tue, 16
 Nov 2021 13:40:15 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 4/4] parisc: Move assembler related defines below the __ASSEMBLY__ umbrella
Date:   Tue, 16 Nov 2021 13:40:12 +0100
Message-Id: <20211116124012.1380455-4-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116124012.1380455-1-deller@gmx.de>
References: <20211116124012.1380455-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fYoDejxwgx+lmVcdAjNN929/dY622EIjhkNnEsCucBjE2XLvHON
 MgK9y3HjO0TCek+MuIR5S+ycZsJWy3Kv9tI6q0RpVm4pbZ1Doqudp2bV9fVTrbtAJwagf9o
 mPo+KEfREhx9LwPc5XHoBTaluw0V8TfdOarYFlXKV2hG7eAIiCPu4Klw4kFkenM+XoB6C8s
 bSufIvTQLbvPNAMkdfw2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/dIlHfGS1Yc=:jZxEZOt4LqBbSLZKR3M8UA
 d2dkc4DpPe+N7serRB4RFeuxznKG7K6c3GPqHgKHsB8RsKKro/J5BLJmpqFxaUw766wWMtEZQ
 u+SeHzCSozHBRiVy2CxjIWZ1vCcxMegNYMzj8DhzILMqukZ7zt2KWLeAulqcvRWiAHLTNYfyv
 4SNRRJjZp6Vg0ZTN9uIOZuWQ5QAn+bXcGWP6g4mvgemk7tQF4InwrITTJebg5FwvMVDIxgr7Q
 CB2/n8r7GCwIVIPBHEyULU0FQRL41NVeg/ARsvhfJdAaFV44GEVHyN2l2n+M+6rXv+z+VjNnC
 3KMDUgJy0WPcpdEIEKf1Ja1eG4FhdHV0XbQn2N5Qoo8jcj+yCMQjtzJjwzLxrO8HLbxfzPPsE
 uYKQ1u51uiIbfvTbfbhwhIOrgP3/olWpDovvvRJrU573UyW9zrHVU+h9klknaaVOgvnXfSnpy
 LUucdL9i4hge8d+C2Wb8wyJd2SSskdjZY/xx93QlzkV2EU68Jtq3jakUflgN7W6D8QCejWlCu
 UitNnKZ3A/rAZXJGHj4OM5CR7BDtv6z2eGK8iSPtN1Q1zqg1tV6xwDuEB8yFhTnNTOTrIE4Sz
 sYeDkqpgpIOyMB0LQ8qE5/wqgZ+2FRfwaFfv30EbccXJzodxKjvj8OHgGAPfbe2Cx5tQVJvSu
 x5xWiFT28nKi+cR2g2XPOqPssRQOsXskNV4iyjrRoK43/Olu52x/xsLCaO/QuH41THPodhuld
 n1IUR9QDq1AFiWpFzeivu5tQv/qfs/yO4QQ/CbSeD3pBBpopPtzl45GuRX5EQoUx2Zc/yedez
 T4vd99uBKMJkbMpvqAo8MrFRkRT999BVZ6OwmxcJo7NqlvChgUe7Si7c0FTZTwaJp1LwpPlS7
 v9kLZyjhdXBcV0GyAkQCN5j0lkbEmSxqxcuE67OWImfuOLJSPIE/QJBMAjo6/0YvRRGqVux4m
 XADaqxIaEnWazUEvAKb8A2k9qdeGK4JsMvoWIoqg/cHrViUmWujsRd9+UQaZquodDe69vmPtc
 vyubEei0y3G+ShspMF5x2/gcy+VJaWcJ1QGICpyaUVBuMwB2NmvkuAblCQejKJOhsf5oorG8/
 h3ai07deTm12+U=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Building allmodconfig generates some errors in the gpu/drm/msm
(MSM/snapdragon) drivers, because there a conflicting COND() define is
used as well. Although those drivers aren't relevant for parisc, they
are nevertheless compiled when CONFIG_COMPILE_TEST is defined.

The parisc COND() define is only used for assembly statements. So we can
simply move it including the other mnemonics inside the #ifdef
__ASSEMBLY__ part to avoid this conflict.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/assembly.h | 44 ++++++++++++++++--------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/=
assembly.h
index 7085df079702..39e7985086f9 100644
=2D-- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -3,38 +3,19 @@
  * Copyright (C) 1999 Hewlett-Packard (Frank Rowand)
  * Copyright (C) 1999 Philipp Rumpf <prumpf@tux.org>
  * Copyright (C) 1999 SuSE GmbH
+ * Copyright (C) 2021 Helge Deller <deller@gmx.de>
  */

 #ifndef _PARISC_ASSEMBLY_H
 #define _PARISC_ASSEMBLY_H

-#define CALLEE_FLOAT_FRAME_SIZE	80
-
 #ifdef CONFIG_64BIT
-#define LDREG	ldd
-#define STREG	std
-#define LDREGX  ldd,s
-#define LDREGM	ldd,mb
-#define STREGM	std,ma
-#define SHRREG	shrd
-#define SHLREG	shld
-#define ANDCM   andcm,*
-#define	COND(x)	* ## x
 #define RP_OFFSET	16
 #define FRAME_SIZE	128
 #define CALLEE_REG_FRAME_SIZE	144
 #define REG_SZ		8
 #define ASM_ULONG_INSN	.dword
 #else	/* CONFIG_64BIT */
-#define LDREG	ldw
-#define STREG	stw
-#define LDREGX  ldwx,s
-#define LDREGM	ldwm
-#define STREGM	stwm
-#define SHRREG	shr
-#define SHLREG	shlw
-#define ANDCM   andcm
-#define COND(x)	x
 #define RP_OFFSET	20
 #define FRAME_SIZE	64
 #define CALLEE_REG_FRAME_SIZE	128
@@ -45,6 +26,7 @@
 /* Frame alignment for 32- and 64-bit */
 #define FRAME_ALIGN     64

+#define CALLEE_FLOAT_FRAME_SIZE	80
 #define CALLEE_SAVE_FRAME_SIZE (CALLEE_REG_FRAME_SIZE + CALLEE_FLOAT_FRAM=
E_SIZE)

 #ifdef CONFIG_PA20
@@ -67,6 +49,28 @@

 #ifdef __ASSEMBLY__

+#ifdef CONFIG_64BIT
+#define LDREG	ldd
+#define STREG	std
+#define LDREGX  ldd,s
+#define LDREGM	ldd,mb
+#define STREGM	std,ma
+#define SHRREG	shrd
+#define SHLREG	shld
+#define ANDCM   andcm,*
+#define	COND(x)	* ## x
+#else	/* CONFIG_64BIT */
+#define LDREG	ldw
+#define STREG	stw
+#define LDREGX  ldwx,s
+#define LDREGM	ldwm
+#define STREGM	stwm
+#define SHRREG	shr
+#define SHLREG	shlw
+#define ANDCM   andcm
+#define COND(x)	x
+#endif
+
 #ifdef CONFIG_64BIT
 /* the 64-bit pa gnu assembler unfortunately defaults to .level 1.1 or 2.=
0 so
  * work around that for now... */
=2D-
2.31.1


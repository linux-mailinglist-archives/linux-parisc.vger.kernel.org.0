Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254A814299
	for <lists+linux-parisc@lfdr.de>; Sun,  5 May 2019 23:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbfEEVyq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 May 2019 17:54:46 -0400
Received: from mout.gmx.net ([212.227.17.22]:55725 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbfEEVyq (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 May 2019 17:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557093277;
        bh=uh4PMvqDJCmy5zuXfxWotUqn4C5g+x6kUNAsOwEaC04=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=PWgeiiaTrjP8KDJCBLCyXqSm7COx9c8V1symE0f5mVM+7r6ipL9yb4m8gngdyXuF4
         zeGLGPRH+vc+D+6FGN8iQzmDR2nZudq/NbuvObLzKtcPFEVkhNhUvWBiVTP7AlBJhp
         19el3A0pXkKdKZaUhDXtJdwTb5Xm2n8KI1nuStV0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.187.88]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJVG-1gr4sF29Mk-00fTNn; Sun, 05
 May 2019 23:54:37 +0200
Date:   Sun, 5 May 2019 23:54:34 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] Rename LEVEL to PA_ASM_LEVEL to avoid name clash with DRBD
 code
Message-ID: <20190505215434.GA25118@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:xRn//fUO+T2URRpa9hnW0Eys8UBB5JKqiiY0eB6k8AmVIpaEryx
 R7+gnOxM49+ACMc0gKQKx6y6mSj2lHejmxgELEyBSudf9NXvBglR7BSg3W4GPUjGzuJrsfP
 VIa4+scDZl1KmeKEtP/aQdjqeEAxJraIucwFOF8z/kH0VY7/YfglJhuh1y76DVOWq2VIs+x
 v6wUsqQAH9UgMjjF3hFaQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nkmMjVZOrPY=:BKjZHRLW9a3YXKWyb8I/UL
 wlq9E1JglnlIpxof+hViAPz4OF9MlVAZO6mBraPHJv8PKmIokVsXUlNj9fNeNzmyi8dJ5/+fx
 QuNEGitoXTwa5IeMT+9PDQZbI1Hs+lC7gple/IXanFGE5kpkgqrdkpuFh/IapY7LfWr9OIP1x
 2iy4rjdPcJoY12kMU9vCbLGqadotjPg05N4gHltnsDMiPTPJ0pwID/8asUIkKUgV4rA/yTVcR
 cYhqk0AjhpxHTL/y/X0+HkRuXPqcsrZqeQ1hTDdNxhRerNzncrvahzJtW/DjwFSoP2/ITfMwm
 8Gdv5m4B4j0yNx/SUNM7S0DLwLhmYXgKjldRiQJYXgmgww4xIV1V/pUuR1DF77HyHZ/PRqIR7
 2hgvxlmOp6ibdMMqVYhd3N7HXuYMKGzBia4GajE5cY6SMujUb7KCwyKKxlOx+Qhup9CiyI5yc
 S3eo1NXpfIX21PR14SNsXzxv/XkTP3V70Vnd/G18RI//f+ARb75/PYbR0h6EvADZfJ1Drv7AV
 MNTQasbQgJQCdfunmycsMsjRtsgr52kPVuDfGYLQxREA3syFR/2bHwI9L0XLcSgF5mApCPwON
 G7RPKzsMLVl4M8nUb4F8YqyYeuZLrxpjLUrK2+x1ON7KC7ROgxXatrgIs+/SmBf7xS09iiwlq
 onRcwt2M/k1Ei8DHlwblDJQD2/lLWv+FpRfDdGR2bdUKZhWIXpxbDFikWX69TIzPMaq/z4mTo
 gyiIVw39YFNbn8w2rVoN6iBI1YfVIcsqRZbteB79IDXS/xpwP4UeoJLJkZtgN+MLjBGLHzqzS
 H5LhBo3lem/QYFV70fKDCXbJVRK+368RyhHIZEhJ2FP9u+tmCiKT+6QDB94Df3/T2MrREDhrZ
 2Sh7KJj3l/pjObn6qgnNwokvUiAZ6qt0I5EVEENl6LUN/8uNBGmxkJgkLobGRX
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

LEVEL is a very common word, and now after many years it suddenly
clashed with another LEVEL define in the DRBD code.
Rename it to PA_ASM_LEVEL instead.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org>

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/=
assembly.h
index c17ec0ee6e7c..d85738a7bbe6 100644
=2D-- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -61,14 +61,14 @@
 #define LDCW		ldcw,co
 #define BL		b,l
 # ifdef CONFIG_64BIT
-#  define LEVEL		2.0w
+#  define PA_ASM_LEVEL	2.0w
 # else
-#  define LEVEL		2.0
+#  define PA_ASM_LEVEL	2.0
 # endif
 #else
 #define LDCW		ldcw
 #define BL		bl
-#define LEVEL		1.1
+#define PA_ASM_LEVEL	1.1
 #endif

 #ifdef __ASSEMBLY__
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index fefaba2097b5..d12de2a13753 100644
=2D-- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -22,7 +22,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>

-	.level	LEVEL
+	.level	PA_ASM_LEVEL

 	__INITDATA
 ENTRY(boot_args)
@@ -258,7 +258,7 @@ stext_pdc_ret:
 	ldo		R%PA(fault_vector_11)(%r10),%r10

 $is_pa20:
-	.level		LEVEL /* restore 1.1 || 2.0w */
+	.level		PA_ASM_LEVEL /* restore 1.1 || 2.0w */
 #endif /*!CONFIG_64BIT*/
 	load32		PA(fault_vector_20),%r10

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index e2b4c8d81275..e54d5e4d3489 100644
=2D-- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -48,7 +48,7 @@ registers).
 	 */
 #define KILL_INSN	break	0,0

-	.level          LEVEL
+	.level          PA_ASM_LEVEL

 	.text


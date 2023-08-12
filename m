Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8037377A2E3
	for <lists+linux-parisc@lfdr.de>; Sat, 12 Aug 2023 22:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjHLUvo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 12 Aug 2023 16:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjHLUvn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 12 Aug 2023 16:51:43 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8032510F2
        for <linux-parisc@vger.kernel.org>; Sat, 12 Aug 2023 13:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691873503; x=1692478303; i=deller@gmx.de;
 bh=Rt0pEMn+LZY2RpiIXLlNAAi0mL1rdIhXoiAcKU5PFIs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=kHJdNl49MPQqUF0FHKUo8ZesUCefOrlkp9+YQmAe/BhNgeC5iVP4LJ5IgQKhrdXO0bBesCc
 JbCvjIN2LqnV9TTKTMvH1M46eVvOuG0knk1eGw6SPvYEPf5zaV5OGbgindY92O0iAAAT97R82
 EZkkIzux2Gnc4RzGWmH1cPCFIv+Jir2UsNw1klVUKxTpss42xvUb/0gQILQZw34xou0w6Xa+H
 fAgXbGVniFsMEiVSVSvIHyDCAnTvOc5bezsb8dOEzx67LozUL1KvZ9ms/rqKH8DV0rymEjrsV
 FEvxQrHaAJf4RkuiwKK9gxUT+Be5BBT8ESGSmNVO8S5bUUdHkBnA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.153.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH9i-1pwhl53F5o-00cgsH; Sat, 12
 Aug 2023 22:51:43 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH 1/2] parisc: Drop the pa7300lc LPMC handler
Date:   Sat, 12 Aug 2023 22:51:38 +0200
Message-ID: <20230812205139.401366-1-deller@gmx.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RpX+IHG9Pm1NttjwtlUhy2yCK5a9khcHm2ON6Za27QozPsHxrLA
 VEa1vxng2uVK9YOGrzhxXc7RYFNX1aeNuAQpThxS2LASRjz0AlfcRRo7ki+7hGnVLgkG6r4
 ZYDQvkbQO8gvdPYR/BZB34+nwGX8FQCb7cQDRsHxaLQI/tjWMXnInggO/iLdCpUVqnhthWk
 WZMECv8ZRuQ9OcPxewkRA==
UI-OutboundReport: notjunk:1;M01:P0:sTwdcpslYnQ=;7zIzg/Hw8c+EZxHYKgEklSQSPyX
 BIKPki6nL0NYA+j/zirBEldmh38uttZmigpY4cEAGhJ7Q6emgdv8HyFQdG52T2KNqy8DZ8asU
 fPp2Z8kGRWbp71MeclLomblS6EsEQ4GVpxjQmI1iO7W89tvpqPenkw3QcLrIm/dB8x5ZX4Sgr
 2kTY8pXQeV3tRC/6ILqFsB8bWzXfa3V5TYqsIOJwTxu72CG19Ugnf+sm9Qn/RzJr3w15ynofL
 lR5cayEnYMrgYhfpSG97QHYZS04/7QrurZmOnIXjdh/iyZFn5udeijpqBROL0UW/v6egeCWqs
 2umNfBaMcR+aUX/V9VKMKjFHnrWos7Vs+QNaU+mdsTbABs2P+IvWMpuUH2k0lSxmBP5tU3kTs
 n+79+/nr2O5rqC7Jb9g6EqM1TVkP5W0TJ/bTbmJgXx+9NnpAs5VTlkjNEg5SNTHT+dgYzi4Q2
 Gxw+o2EdiKbtXA1LEnq4frsKdp6ScefVhQ0cPfPJeZ2VAHewkL61zY0Y30inLoScQ7jsD5kQk
 bv6M3CldSpvS7W7BH+xyoSPLHf7cu5ek2pDth7wCdpLyWQ3CAp8NBiYdR5/txefb2B5ji+cm1
 URrfq2Kgye2+PT4GnkGShl/xF7zPINM3E/hBufFOoBMcz2QiYt14puJABFBx8Ss4lCd5w2X+h
 3RWcY614ijnBFR3y7lj8J6vmIGA0UkFeRwelrakqpMknyzCSCmHIzPFv42TgLEf/XXwzhtsVW
 kVPFhgibUhpcttbP8Spbz70thd1kOwrH8r+NIfYC44w8i9vsXsboIeRMAWjXIlPydl6xF0Cd+
 VODNxNTAE637NmeB9XWnKwnP2rVzpB4XgcQ7+W4ON5OnL8J6g4bB+60HlMEy0s7sT40lVrGQb
 zO0CsAKCacuwUqbKWL9jMAgPtG2U1i2ByQhw+8UrmscWnZqWvD7wEfGD86x2qvnZCT8j/vP38
 CrEL33phAy39cH0kfC/HdwToo6o=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This was actually never really used, and the info it
prints won't help. Drop it.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/machdep.h | 17 -----------
 arch/parisc/kernel/Makefile       |  2 +-
 arch/parisc/kernel/pa7300lc.c     | 51 -------------------------------
 arch/parisc/kernel/setup.c        |  3 --
 4 files changed, 1 insertion(+), 72 deletions(-)
 delete mode 100644 arch/parisc/include/asm/machdep.h
 delete mode 100644 arch/parisc/kernel/pa7300lc.c

diff --git a/arch/parisc/include/asm/machdep.h b/arch/parisc/include/asm/m=
achdep.h
deleted file mode 100644
index 215d2c43989d..000000000000
=2D-- a/arch/parisc/include/asm/machdep.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _PARISC_MACHDEP_H
-#define _PARISC_MACHDEP_H
-
-#include <linux/notifier.h>
-
-#define	MACH_RESTART	1
-#define	MACH_HALT	2
-#define MACH_POWER_ON	3
-#define	MACH_POWER_OFF	4
-
-extern struct notifier_block *mach_notifier;
-extern void pa7300lc_init(void);
-
-extern void (*cpu_lpmc)(int, struct pt_regs *);
-
-#endif
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 2d1478fc4aa5..5ab0467be70a 100644
=2D-- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -6,7 +6,7 @@
 extra-y		:=3D vmlinux.lds

 obj-y		:=3D head.o cache.o pacache.o setup.o pdt.o traps.o time.o irq.o \
-		   pa7300lc.o syscall.o entry.o sys_parisc.o firmware.o \
+		   syscall.o entry.o sys_parisc.o firmware.o \
 		   ptrace.o hardware.o inventory.o drivers.o alternative.o \
 		   signal.o hpmc.o real2.o parisc_ksyms.o unaligned.o \
 		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o \
diff --git a/arch/parisc/kernel/pa7300lc.c b/arch/parisc/kernel/pa7300lc.c
deleted file mode 100644
index 0d770ac83f70..000000000000
=2D-- a/arch/parisc/kernel/pa7300lc.c
+++ /dev/null
@@ -1,51 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- *   linux/arch/parisc/kernel/pa7300lc.c
- *	- PA7300LC-specific functions
- *
- *   Copyright (C) 2000 Philipp Rumpf */
-
-#include <linux/sched.h>
-#include <linux/sched/debug.h>
-#include <linux/smp.h>
-#include <linux/kernel.h>
-#include <asm/io.h>
-#include <asm/ptrace.h>
-#include <asm/machdep.h>
-
-/* CPU register indices */
-
-#define MIOC_STATUS	0xf040
-#define MIOC_CONTROL	0xf080
-#define MDERRADD	0xf0e0
-#define DMAERR		0xf0e8
-#define DIOERR		0xf0ec
-#define HIDMAMEM	0xf0f4
-
-/* this returns the HPA of the CPU it was called on */
-static u32 cpu_hpa(void)
-{
-	return 0xfffb0000;
-}
-
-static void pa7300lc_lpmc(int code, struct pt_regs *regs)
-{
-	u32 hpa;
-	printk(KERN_WARNING "LPMC on CPU %d\n", smp_processor_id());
-
-	show_regs(regs);
-
-	hpa =3D cpu_hpa();
-	printk(KERN_WARNING
-		"MIOC_CONTROL %08x\n" "MIOC_STATUS  %08x\n"
-		"MDERRADD     %08x\n" "DMAERR       %08x\n"
-		"DIOERR       %08x\n" "HIDMAMEM     %08x\n",
-		gsc_readl(hpa+MIOC_CONTROL), gsc_readl(hpa+MIOC_STATUS),
-		gsc_readl(hpa+MDERRADD), gsc_readl(hpa+DMAERR),
-		gsc_readl(hpa+DIOERR), gsc_readl(hpa+HIDMAMEM));
-}
-
-void pa7300lc_init(void)
-{
-	cpu_lpmc =3D pa7300lc_lpmc;
-}
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 211a4afdd282..3e95b5417a50 100644
=2D-- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -31,7 +31,6 @@
 #include <asm/sections.h>
 #include <asm/pdc.h>
 #include <asm/led.h>
-#include <asm/machdep.h>	/* for pa7300lc_init() proto */
 #include <asm/pdc_chassis.h>
 #include <asm/io.h>
 #include <asm/setup.h>
@@ -93,8 +92,6 @@ static void __init dma_ops_init(void)
 			"the PA-RISC 1.1 or 2.0 architecture specification.\n");

 	case pcxl2:
-		pa7300lc_init();
-		break;
 	default:
 		break;
 	}
=2D-
2.41.0


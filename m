Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD7544B49C
	for <lists+linux-parisc@lfdr.de>; Tue,  9 Nov 2021 22:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbhKIV22 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 9 Nov 2021 16:28:28 -0500
Received: from mout.gmx.net ([212.227.15.15]:60833 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230248AbhKIV22 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 9 Nov 2021 16:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1636493133;
        bh=QY3kTBwLZWVYYkwSH8ym658NFMYJ4Uac0CzJB8h1o2U=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=YArwK0ioKMcdtIvQabLJAW1g7HSXld5le8a5Zqqsl+YFPqODWAP4crhAGmt137mHf
         Z4vi/kqR0a0bm8wqWIUDKAuJA9tzUSKbpxxQNSRHG6n407/QXDiaxqR4fB0psZTDFa
         UNCqTypPSvSnGBA/ffJqHgvvloZ2dkKLcNd0wEGc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.191.21]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8QWA-1moyTN0eEC-004TFj; Tue, 09
 Nov 2021 22:25:33 +0100
Date:   Tue, 9 Nov 2021 22:25:02 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Avoid using hardware single-step in kprobes
Message-ID: <YYrnLtQhGkw4/tBZ@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:KiMq1I+mwtl+cpIoRgkDOt+q2NP7Cq4VCrNU/omIkBJIM52OetD
 nlT2/P+ZcWV2Y1CA5HbBkIFr/KXFEnkTnb/P9M7HlpMDmP6fWf8g9AST/2jzeFzOQp1+XDo
 DJy0M1yEIB2lxHNX/yTkJMlVlurBlax9Sv+7cPI9nzVJ+uhQd0ogzVVbRaiWsjEDIrb7Zos
 qHH8lCARohYBYOrG2NMeA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eYIRRM0FkzI=:0AKXC+rlm8xCbW5tNaOnoL
 4NgmbBEhS0gYHjNA1abfkoHK4FWviYHUvcLFgEeLVxId9X/3vbZnDMoyA9JBbKWOXBXfpHsyT
 /mQDhx7YfcojARIiZbZh2g5M18qWERmn1wpn63cKtgQtcMZmZK2s5RfElD31jqYvHn9TfTYLI
 xrp4ODuF55WMo2nW4bBgB92ccUdBPxR6y01F5mQYe7kbahWQCHLtM0dx8sWiKduxxOKtuWsyH
 YCTyMkxWMnXtRU9tddKK4C5SsXIzJ4f0AE3yYSe+tOfn5PyiZAe6yg6ZTDf5SE4dfce4KKi2p
 baObRMpRkF61G8MZNzKiDTD8a+LaEgQGjtXEXJpwrPvyG4ABoQBwlxK9vnmSCg1sgNARdnndu
 vePWV+IzV0qXHGSorWB4IBNuoAxAjiPftfqtJ0aAjdtWJIfJOQoeamSfQVp1bhhXgisCLeczT
 vVUFol9p09NbSRf69v2idqPEYlnFNYyM6XdWg37qopjzieJBRONyUC8V35EeJIxb92AsDdW1T
 xDPu+3vpp0KQbYZ8GL9505UFun+7ADEm5oWYC5gzN3gnhAQCRwSBg5uOf11nHpYjABEd+LADL
 jr18O3pc/ODHCU+hfV21rhlYyEUu8WjywCnXAhRvlN7cGUkVbNS9pWLSMYCHUuBkO6RvvdG4/
 oeQ94nCuAsS11WApnJ62Tr6twL40N7xMjTDSNP+kWuFyju6MXjeMaGYueME5qqpQWA1HlWpQM
 R2mVl3qWcuoVvM3fho41tQYKmr0NXS/McnrdVmGXy7lhU2dBmpxv6jWzZZeyhxPfzKmsH9e2Q
 EWM4D8vW4bm7u2JD1LFe1koqlvHOlJId9wujrkw1auxr+h7Ufey/QgGfchag2h+I/Y2GSZHKX
 isauPbBDJrsjh9NhqduL/u0ppaCM3RkpMDW7vt6T9zdHOczC1QMMgSjculmUN+dmJmYMLkFJz
 xwLHzxkypJL9aTUOC2sNmjVCddPChJaslNuapAbZKOTbyYNOwNRlKF8eHiuc81wiPXyPZa69T
 EGwARTEIrEkVqqPObcoogBMTYg1wqWQide/ThnJWtxm28lRc5Um0kJYWpGgNK13qV1Jv0jnke
 4ORVZY6Cp469i0=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This patch changes the kprobe and kretprobe feature to use another
break instruction instead of relying on the hardware single-step
feature.
That way those kprobes now work in qemu as well, because in qemu we
don't emulate yet single-stepping.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/kprobes.h b/arch/parisc/include/asm/k=
probes.h
index 904034da4974..0a175ac87698 100644
=2D-- a/arch/parisc/include/asm/kprobes.h
+++ b/arch/parisc/include/asm/kprobes.h
@@ -18,8 +18,9 @@
 #include <linux/notifier.h>

 #define PARISC_KPROBES_BREAK_INSN	0x3ff801f
+#define PARISC_KPROBES_BREAK_INSN2	0x3ff801e
 #define  __ARCH_WANT_KPROBES_INSN_SLOT
-#define MAX_INSN_SIZE 1
+#define MAX_INSN_SIZE 2

 typedef u32 kprobe_opcode_t;
 struct kprobe;
@@ -29,7 +30,7 @@ void arch_remove_kprobe(struct kprobe *p);
 #define flush_insn_slot(p) \
 	flush_icache_range((unsigned long)&(p)->ainsn.insn[0], \
 			   (unsigned long)&(p)->ainsn.insn[0] + \
-			   sizeof(kprobe_opcode_t))
+			   MAX_INSN_SIZE*sizeof(kprobe_opcode_t))

 #define kretprobe_blacklist_size    0

diff --git a/arch/parisc/kernel/kprobes.c b/arch/parisc/kernel/kprobes.c
index e2bdb5a5f93e..2ca34fc250a6 100644
=2D-- a/arch/parisc/kernel/kprobes.c
+++ b/arch/parisc/kernel/kprobes.c
@@ -5,6 +5,7 @@
  * PA-RISC kprobes implementation
  *
  * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+ * Copyright (c) 2021 Helge Deller <deller@gmx.de>
  */

 #include <linux/types.h>
@@ -25,9 +26,14 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 	if (!p->ainsn.insn)
 		return -ENOMEM;

-	memcpy(p->ainsn.insn, p->addr,
-		MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
+	/*
+	 * Set up new instructions. Second break instruction will
+	 * trigger call of parisc_kprobe_ss_handler().
+	 */
 	p->opcode =3D *p->addr;
+	p->ainsn.insn[0] =3D p->opcode;
+	p->ainsn.insn[1] =3D PARISC_KPROBES_BREAK_INSN2;
+
 	flush_insn_slot(p);
 	return 0;
 }
@@ -73,9 +79,7 @@ static void __kprobes setup_singlestep(struct kprobe *p,
 {
 	kcb->iaoq[0] =3D regs->iaoq[0];
 	kcb->iaoq[1] =3D regs->iaoq[1];
-	regs->iaoq[0] =3D (unsigned long)p->ainsn.insn;
-	mtctl(0, 0);
-	regs->gr[0] |=3D PSW_R;
+	instruction_pointer_set(regs, (unsigned long)p->ainsn.insn);
 }

 int __kprobes parisc_kprobe_break_handler(struct pt_regs *regs)
@@ -165,9 +170,8 @@ int __kprobes parisc_kprobe_ss_handler(struct pt_regs =
*regs)
 		regs->iaoq[0] =3D kcb->iaoq[1];
 		break;
 	default:
-		regs->iaoq[1] =3D kcb->iaoq[0];
-		regs->iaoq[1] +=3D (regs->iaoq[1] - regs->iaoq[0]) + 4;
 		regs->iaoq[0] =3D kcb->iaoq[1];
+		regs->iaoq[1] =3D regs->iaoq[0] + 4;
 		break;
 	}
 	kcb->kprobe_status =3D KPROBE_HIT_SSDONE;
@@ -191,14 +195,17 @@ static struct kprobe trampoline_p =3D {
 static int __kprobes trampoline_probe_handler(struct kprobe *p,
 					      struct pt_regs *regs)
 {
-	unsigned long orig_ret_address;
-
-	orig_ret_address =3D __kretprobe_trampoline_handler(regs, NULL);
-	instruction_pointer_set(regs, orig_ret_address);
+	__kretprobe_trampoline_handler(regs, NULL);

 	return 1;
 }

+void arch_kretprobe_fixup_return(struct pt_regs *regs,
+				 kprobe_opcode_t *correct_ret_addr)
+{
+	regs->gr[2] =3D (unsigned long)correct_ret_addr;
+}
+
 void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
 				      struct pt_regs *regs)
 {
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index b11fb26ce299..3ec3be8e90c5 100644
=2D-- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -302,7 +302,10 @@ static void handle_break(struct pt_regs *regs)
 		parisc_kprobe_break_handler(regs);
 		return;
 	}
-
+	if (unlikely(iir =3D=3D PARISC_KPROBES_BREAK_INSN2)) {
+		parisc_kprobe_ss_handler(regs);
+		return;
+	}
 #endif

 #ifdef CONFIG_KGDB
@@ -539,11 +542,6 @@ void notrace handle_interruption(int code, struct pt_=
regs *regs)
 		/* Recovery counter trap */
 		regs->gr[0] &=3D ~PSW_R;

-#ifdef CONFIG_KPROBES
-		if (parisc_kprobe_ss_handler(regs))
-			return;
-#endif
-
 #ifdef CONFIG_KGDB
 		if (kgdb_single_step) {
 			kgdb_handle_exception(0, SIGTRAP, 0, regs);

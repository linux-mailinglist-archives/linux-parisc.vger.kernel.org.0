Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FD516466E
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Feb 2020 15:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgBSOJs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Feb 2020 09:09:48 -0500
Received: from mout.gmx.net ([212.227.15.18]:38567 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727786AbgBSOJs (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Feb 2020 09:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582121380;
        bh=xbE6eA9MBqvG8pB6J+HAfxztNDTpYVT7w6C2yRa7mZo=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=LsKzlIobNWN0ZUDoHUl+prTDVODvGtu7gGjj9uvD04yAuMLUnDi6Gf3ygP7PinClr
         h7mOvMO3Y2t3XrSsnVLAHpPtQkqMF7k8kU6HxL1t4EK8gQZbxYlBz06I56RBdh6u9y
         /XefX92DckoLnNC01WHxkhyA7np4l6Qyuveb5TAU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.186.19]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowKi-1joGmQ2Zoc-00qNwI; Wed, 19
 Feb 2020 15:09:40 +0100
Date:   Wed, 19 Feb 2020 15:09:38 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add arch_trigger_cpumask_backtrace() function
Message-ID: <20200219140938.GA27510@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:2nHx+pRpw/FApTpHYujUCyRXjQX25bho8Al/PfzvhmkNmMdf/0o
 FYpju0H0s3jm/dfvW4dF8iOBuNDr3FmxvEGBPLyyHJqiA9NsPru3MMbAijgt/G6aDZSQIwD
 1EfM1Ou3L1ocA9QrSSbnINpdp0soXElwp+/IpkGKl+zPtG1o73aM0SRqimWhWYES1Z2OZqo
 +Kf7KqWKbDiwRpNSKiXdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:evSLJ0Mvgz8=:6Gq+6TTkG5Hx+drm4sg2Sb
 xQnAahuOt51CI7eRv9WNDHHkxv7I1T/VEF+SXwyae4rjmXA+2eOxqmCQQ5Jx0paZZvGlrubiZ
 47RO266cQ5hW6RoxUfH1+vsiYweEq8/+TjOJct61O/iTrtkOfVV6dqr01WiwY51v9If4fHLgv
 mWfI5CKiX+mc7u3IxPVyeVYnPf5FZ9fr7AJYSoKQsdw6MRdmakS9GZ1IaU5Jgq7GUyIHsjz1N
 fvn1DVEQ4D+4hqEwIcW2SehsYuIyNAsxKPHzwM5XM1u74qur1Ca0FzatLRuzP61u5fb6EZPF8
 1fIxlJclAhn/So5Xw8MpVTc9+hehiWTU1nNYPdZD4Rk76MkFCQZMGAfdOhO2FGUpxSZd7+dao
 VFmiale5bJ/KZ2G3HEHyb1YnXje1Xt+WnJUI0lddqNlokvm9v0n0WK77y+31jvGgwjuxvi+KJ
 MaxUzAHvnjf33tyt0hLJc/fa1kA9GmB70C8maKda2jpEUTjHo7wOnw4YiRNU3Dnvosll6d+xp
 gikOt2FNsxERpg5Oc9ZPGx+YuHa7UdwbrnnW03FPBylKeirB1MArvOXHHzJ0x4nOU1IAPxZBj
 jVDESzuCY0k0rywHPZ6YMAxFmfxaCcNmTb8C+B9dVktJKbfTDu61ZE2iUfIVuJriAC0fsFLSS
 fw63tNmUdcj3grkrOwMT3Gbt7i6Iur7ZkmlTHtcJQlYKmjrKch8bqqM7tptZSFLX5QYsPBuC1
 CKbFP5XJotql9Ngca/UvJjhvCzzf3XkNEL4oF4KkDE62jPtVzvRiuVgNN/HgAWmi39H+fWqWr
 VDD7zHpW6NQmU/9gC+mfdFDF9ugLzORr+hloVerc8rqsb6ZFMrQCA/iKm+CCPHSmlQylufwje
 fRF48Ztkb1xT/+8c3n1UcWtyn4SJXVMVv43YXg+cCyDzB3vXJtGNafgCam88RZE4ctCZF9iRy
 139g5P1zQ2w5CDl7YMTH8ar4WwzJzW8r3BH5hKUuhi7GZxanX69RmXVxOKZS739+rd6/7FCu1
 lwICLrFm/boGGc9CZ9vsj8A2KZExHCCNoT0cnPWAC5n/UOqHMVx4Z2EpUWZAVwqmuva05xgbw
 QkXOZ+/TvA5g7gBYT5BQSG5arr1LtqDkg7uFww+ST+NFQg7GMzOfRIeV/5ruS5H3DFIRGGyES
 vucoS//ucazjxDXLQFs0lQqVeXXy4epanXBZcTB9hm5pCF9xC7V8pXTjD61HVpj9hAOr0p9y5
 0/wb3bvAWWJpQqQc+
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Implement the parisc version for the arch_trigger_cpumask_backtrace()
function to provide IPI-triggered per-CPU backtrace printouts.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/irq.h b/arch/parisc/include/asm/irq.h
index 959e79cd2c14..c978d50bd29e 100644
=2D-- a/arch/parisc/include/asm/irq.h
+++ b/arch/parisc/include/asm/irq.h
@@ -50,4 +50,10 @@ extern int cpu_check_affinity(struct irq_data *d, const=
 struct cpumask *dest);
 /* soft power switch support (power.c) */
 extern struct tasklet_struct power_tasklet;

+#ifdef CONFIG_SMP
+extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
+					   bool exclude_self);
+#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
+#endif
+
 #endif	/* _ASM_PARISC_IRQ_H */
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index e202c37e56af..7cdbe98c26a8 100644
=2D-- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -29,6 +29,7 @@
 #include <linux/bitops.h>
 #include <linux/ftrace.h>
 #include <linux/cpu.h>
+#include <linux/nmi.h>

 #include <linux/atomic.h>
 #include <asm/current.h>
@@ -71,7 +72,8 @@ enum ipi_message_type {
 	IPI_CALL_FUNC,
 	IPI_CPU_START,
 	IPI_CPU_STOP,
-	IPI_CPU_TEST
+	IPI_CPU_TEST,
+	IPI_CPU_BACKTRACE
 };


@@ -170,6 +172,14 @@ ipi_interrupt(int irq, void *dev_id)
 				smp_debug(100, KERN_DEBUG "CPU%d is alive!\n", this_cpu);
 				break;

+			case IPI_CPU_BACKTRACE:
+				printk_nmi_enter();
+				irq_enter();
+				nmi_cpu_backtrace(get_irq_regs());
+				irq_exit();
+				printk_nmi_exit();
+				break;
+
 			default:
 				printk(KERN_CRIT "Unknown IPI num on CPU%d: %lu\n",
 					this_cpu, which);
@@ -248,6 +258,16 @@ void arch_send_call_function_single_ipi(int cpu)
 	send_IPI_single(cpu, IPI_CALL_FUNC);
 }

+static void raise_nmi(cpumask_t *mask)
+{
+	send_IPI_mask(mask, IPI_CPU_BACKTRACE);
+}
+
+void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_s=
elf)
+{
+	nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_nmi);
+}
+
 /*
  * Called by secondaries to update state and initialize CPU registers.
  */

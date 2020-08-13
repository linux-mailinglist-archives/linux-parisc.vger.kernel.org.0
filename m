Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6FF2435DB
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Aug 2020 10:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHMITO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 13 Aug 2020 04:19:14 -0400
Received: from mout.gmx.net ([212.227.15.19]:44999 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbgHMITN (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 13 Aug 2020 04:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597306751;
        bh=v1rpsyUWYXOzOHhA9lIjvaWMHhCNd0bm5Ks/kwkqn1o=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=AGGDmvAuOpvlN6M46TN2yOOmohegf2Klvqa4dWENVmjaol3moYZHMNj/EgZyd/JC0
         BnmhkivfHimV1ZF46Xw956EX1CRDqGtnVBJXd4DgsnnuGg2gZvyMIQUCB/sahyfnIr
         183eB6UzHL3LZE1/GF6niYGW2fKgY2ECY0d5u4lc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.146.187]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mplc7-1kTK6c392r-00qAj4; Thu, 13
 Aug 2020 10:19:11 +0200
Date:   Thu, 13 Aug 2020 10:19:10 +0200
From:   Helge Deller <deller@gmx.de>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2] parisc: Add raise_nmi() and
 arch_trigger_cpumask_backtrace()
Message-ID: <20200813081910.GA8106@ls3530.fritz.box>
References: <20200219140938.GA27510@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219140938.GA27510@ls3530.fritz.box>
X-Provags-ID: V03:K1:kRkToEOSBg6wM0D753ITSe8VS0rx79dNwgFpKAsd/Nsph6VsDrU
 rKShpME78OQ8B04A00K4Vk6DeQacfyoq/IZj+n2jQm75DdldjDO34/i+JgjZ7e7EvLzXrT+
 /YC2kzpXgMpsedcTA0vunbO8EedchOkLrXi8nLrEuEXF0Yar82wMqlnKZkDEL2TpL/FqQfa
 kCf1kAn4y6LMy5uCcYtXQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:an3zWJop4wc=:KzK/YLrBVbwxXxKo6/mygZ
 5JlG32ls3nWigfepnFbIaR+ECYSRY6fYI7SE94DZWWjvYg2u1KxFLCrsxLJ2HYgrhG8V1kIHk
 ojudhGA9FoD9n3HLu5Bmp85L6keg3AxmnYv43ZL5oTpjP3/GIcOiTvX49HWJrBvjQBC3PTRgK
 l0+wngMhDnzF772EdNnQoRI6UbH7ik/Q/f4P+yRM8ZxpppIrH/DCq35AmzXKDEqekckAHNyGM
 HsGOW+GEU243ry78PyAFc22AlC1DjVAirTzWXv5Lnwv4RNInMBMqCPulKnJGbYyu1xsaO5HCD
 9ZhhiXWmHDsKUYPR8yWJ8JIl0Cr/bt2iKT1ZpUnI5FpJ508PRdrdX3KLoEmPjeMpp+ml0I7Zr
 y0MGxICadmUFPras05qeR5vPX2IEKm0iKvwo1JTrN4sKq4+0YynjE7KkfOikGBfvDOnwK8vtB
 Ty/P8zT0XYKRAq7zm5KyQScnkkxTPOB0veB8A+wW4orBEfHMhhGeBf2TPkPINfiyq62OiMURN
 QayO7zYbuuxCbX+P/u0aJCwHWKn9K/KeZ3TSfYfVYFSYSt77LU2El661GzE26StK4tTWBi44G
 OkYpBo7e3ZHKgEcaJtSiI7DqdVcnom/qMNseNwLIergVXiWudddFJoLKKbOro+l9OX5SJFJ5m
 jjVTccbY0LVeZWJ058WAYkumEd5GFpzGZqcINLaSnAuhVzSh9Z44GdgH4rcY6Ra84Yac/Xmop
 vf99QamlQ2EbyS2OoxfdRKhArCrRkWR0+29m8GOhCPl+Me8Wq0kEZ/j0Zoo/hkO6GkCcsQ5Px
 H1d+ekbvRYLsyEVq9DSAL/bDAgIHehIwQqKpTYHI85hldXYcpZr9K3HLHsvREFPiJOArdlBry
 yExBbTVWJAjJe493VVNERvPM9sDDL/laGxWf/Fdrhi5Ah//VCTt/EJxGZuoXYANm1auhtE4Al
 7X066w+Yt+5XPAYVrcR371PKsjpNskD5fcFK2q8Au1+IUJoOfY0WQIguCx5f0Q0j4I0ZfUtPG
 fjWVIbFHbp5VzUpzBLd0rJwBCzvdYCF9k38TyAXSOuyoFuclgql5cV/27r2oEoJBXVft8YM4f
 Xe48BJbuuwep55Wyt7N3KZIradKFz1+yFFP0A+vRa4oF/0AX2L8qwtDMTcArxwaSKyx7BqejF
 hhCV1IT1swh5YxGRcTQOq7r1kMLNuZlK5Vqjlj13ia38/LuGf0i8avBz40iFmy3KQv1fFtRgf
 /RQq9H3M+o5pV5iLE
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Implement the parisc versions for raise_nmi() and arch_trigger_cpumask_bac=
ktrace()
functions to provide IPI-triggered per-CPU backtrace printouts.

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
index 6271139d2213..cd7694497428 100644
=2D-- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -29,6 +29,7 @@
 #include <linux/bitops.h>
 #include <linux/ftrace.h>
 #include <linux/cpu.h>
+#include <linux/nmi.h>

 #include <linux/atomic.h>
 #include <asm/current.h>
@@ -69,6 +70,7 @@ enum ipi_message_type {
 	IPI_CALL_FUNC,
 	IPI_CPU_START,
 	IPI_CPU_STOP,
+	IPI_CPU_BACKTRACE,
 	IPI_CPU_TEST
 };

@@ -164,6 +166,14 @@ ipi_interrupt(int irq, void *dev_id)
 				halt_processor();
 				break;

+			case IPI_CPU_BACKTRACE:
+				printk_nmi_enter();
+				irq_enter();
+				nmi_cpu_backtrace(get_irq_regs());
+				irq_exit();
+				printk_nmi_exit();
+				break;
+
 			case IPI_CPU_TEST:
 				smp_debug(100, KERN_DEBUG "CPU%d is alive!\n", this_cpu);
 				break;
@@ -173,9 +183,12 @@ ipi_interrupt(int irq, void *dev_id)
 					this_cpu, which);
 				return IRQ_NONE;
 			} /* Switch */
-		/* let in any pending interrupts */
-		local_irq_enable();
-		local_irq_disable();
+
+			/* before doing more, let in any pending interrupts */
+			if (ops) {
+				local_irq_enable();
+				local_irq_disable();
+			}
 		} /* while (ops) */
 	}
 	return IRQ_HANDLED;
@@ -246,6 +259,16 @@ void arch_send_call_function_single_ipi(int cpu)
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

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774EE244A54
	for <lists+linux-parisc@lfdr.de>; Fri, 14 Aug 2020 15:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgHNNUc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 14 Aug 2020 09:20:32 -0400
Received: from mout.gmx.net ([212.227.17.20]:50553 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbgHNNUc (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 14 Aug 2020 09:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597411230;
        bh=YIqVM/eAj7nM/erOBjsDnQmMIxobZQEbysaGFkZ4mPI=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=C4ApkZqD2ghXiWsYwG+d42Ol/z+tLWLAFwtiXIora1VgbBfk2489BzwvrePNzCX59
         djAp2UTkCR+V4J1a101yxq4o5dpxmd3GnQ1kAGa+fNwA5w4ufbOUiiv+SZi/t7E437
         pBQ+G9cx9Y0ZTeye5gOsUOTNw+p6hILpDpsxDgnc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.148.19]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0G1n-1krXJK487b-00xHYX; Fri, 14
 Aug 2020 15:20:30 +0200
Date:   Fri, 14 Aug 2020 15:20:28 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH v3] parisc: Add raise_nmi() and
 arch_trigger_cpumask_backtrace()
Message-ID: <20200814132028.GA10165@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Gy/5ampeFM1UaqacSxt1HpjlGD7mWrViCB+k5FCnWCGM7oswqxP
 O0CoryibCDKfiKSJDvmHzePZKZLSPXEBa0Azt7CZV7gBx4xc6MHBmej+CJP/nK5EZAv1HcL
 vqGzEnQHLAnGpiFQJJ7CnV/BHWS7T0Ikp6Zrf3lhtSsImkxzqX9uBCbGjRJHSVKLkQlp8S1
 wjHpDQAxcM5c5DHOMbUWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:55w9cTGwtnQ=:HgsUenuKmtkKtE6DP6Nhlg
 QjVdzM2+T7vVdRsjJpSTQlFxqThVJJDFzmI2Kw8zNw/9fYmmRTPUvZjikyyTW1Km8dr0mX+vt
 2zMV+UMBfTEeFr8sztzOgi0zys9LipJSvQshpyThxclTbG7otmjGEz+LQHpi0mEl3aOUu3Tnm
 3PEwm8wD10DNjbTWldAGVfL8/g/nixv6ZqcE8+J1Ia4xZrUTUiMSjV4BDWMe68mC+Qz56gAAb
 oxOHKqz37npPOSknfMPbypLGcJ5CE1moODnUvIKHh0/RlDSbu/KTGWpvKFdfz5LfGm9zNPnNr
 ZiPwG5yyBXrk7GY0qSJtUzNhxqVuE84vOMPODqx4o8s6h0w8P0+vS1oAwCV0HkSh6ZJhjWwVh
 aNIGeJrPyJlQRNPoKxfeVenfvvTUwdfd3RKHQ5UGJtYlVu8i9jBUoLkryBy1VtJbNACTQl2GX
 eEHxLMLpbmD9wjhvU7PVYoWxR61kUOoI+U1NfJdKq2fQhV0ZyPOJ0ICELv49ifyZZ+Oq6oK4n
 daQeeLpTvvhHwgGMpSXJrt7mOxEtTRinbNZhjPN7j8fKxj+TgNLpoJMKxMeBd+cUzXNTBlDiR
 +zDGdhGDDOxHBsLl6C1/x6VJYOyalH44W+wnh0l7kySR6A3L7iao5MkJn8N3jXCMShCOiLaQz
 dTBG2O8EQG5woobe/U8BDUwiVH0ZAVXP3aeb0yEmvl0uzBryryXZmNKki7dM6i+TwZOnBZ6/U
 UWgelw40rw1Yq6iZ56i9Yl6A/d44dcKkoYhdz7CCuCB2H3t7eL9oxuRZ4+mhcL7847SOAdSpB
 w3he9IH5KP7DZz/DHg5l3SH2BnFHswOz9J8S7FMccLlqeRvoHwqX/qbjHT25iSAZTkmVgBhWJ
 HE/RyUsI3NjsyfBWdzDeie1qzGQURL6AmP8VksWnIM2mT/8bJkVTg84Ttx/wj6gm4rL3lA6Xy
 Ab20sV+B5gB2U1j/cKcX8cn20VTTb7wcgkuuQF02X+mWixcQTLdpkzUqlKacWGYCYEFaMK564
 /TaITesB+gAPYwAvyP1R9G8ysiL49YtIQ39kdL6h7r5Ehf1A6TabPEeJSz8t3NO2qIRYokUv7
 LI/0n3u5cTK4VDmTQEodcVFe8v++lYyhPM0BFN5YB+KD7sA72U8EfYRyWsAJcP1hhhXpSscqK
 DctjUA8hrDUkaDMrUo+zFjiP0OmYrx3aH9CmkXtEhUt3f4clxn0Ab5eXL4Omm/dhDIcjwkhUv
 jRzfdD3lMVthgMoVR
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

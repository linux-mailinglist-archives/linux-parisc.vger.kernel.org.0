Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0D024C6B9
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Aug 2020 22:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgHTUYX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Aug 2020 16:24:23 -0400
Received: from mout.gmx.net ([212.227.15.18]:47557 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726908AbgHTUYV (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Aug 2020 16:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597955046;
        bh=oQ4Rf2ngzltKs/rLxAgCGiTeA585GwkylL1CYgCQXcA=;
        h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
        b=fXQQ8Wqikg5yRxdbe78MG6I8+NGvs8X1mmAJwrI22AdkwoRwFbuMzhE8cYB2u2Maf
         5A10Wqaw1Aapu/ZLh4rF7s69MTzdcUulOb0IsBaxexFk7xipADNLYG642Tkne3T5XX
         +sa7rVhBFsM9Upj7ilfUnYGWTOhbHnXQgkgKfTKQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([80.187.101.156]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1kErMK1mZu-00TFZd; Thu, 20
 Aug 2020 22:24:06 +0200
Date:   Thu, 20 Aug 2020 22:23:59 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: Re: [RFC][PATCH v2] parisc NMI backtrace support
Message-ID: <20200820202359.GA29801@ls3530>
References: <20200818110511.GA30870@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818110511.GA30870@ls3530>
X-Provags-ID: V03:K1:MJMmVsqn0C9a1lPfeeUX6E3HSFAgHNiaTi+d46E7UH0oqhh6GMk
 uvIqCpeUczShyYqdE5ardSMr1H8ybEi+qOZ3l8nhijPkuG6nwNigodGzOJ0Ocy5Nw3EwZZL
 mPziwE12fcV8Yzy1Z4cOG8kzOgvSx6unn6HZ4ChXEfAm8+H67qXKn0hRcN0m43hqQB7fwVP
 nJVmLoCaSHFUiZEuvcqBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rIkTo8g5PNE=:pf5oJud2MpgMaHqYjKUjb2
 ilJnHoooCAOPqqpJRbghY55B5j/KlcVQowgvoG+5iTAHv69LxGncSh49v8IhMYf+b/B6qh6s/
 3z4MypnWAzBmHqaRZdsMMXM4tZoEKlu3/SJoVg00uGSke5ResTbznP5kU6rH9RfQKUFHhsNam
 RqlMnyzTXpneGCg3OqrGoyUwxFS/KW6I4WX++8xXwqxFXkBfhWJk1AmHZFr1Ft3JkjqGcKreo
 d+J7LDHiIIjPgLjmVqHCJDHmdmVyRzuOiNFAAtf3iU4GZ0EYorZ4PlWnM8lIAWpzRWf3zmqnr
 X2Qwp+BOHCgceXITdb+Srx9IWwfQrs7FLoxGHe07J0cG+zXGlYnfZrdrFWQD99IY6tiUCWML1
 6uDy2BnDZZWT62q/Aa5XskZjO7Ebi1CBiqCqD+qPswbmtkDqB0+G1W49/aE3KgPlXJKL51iKp
 CvfCIuLNlzFlljfn/qfXHRLeHGtv36gIPDbTUQC6Q57vXCz9JVei/a0l+VYwnPTCeD1u8txSl
 84LklKAmOiVV17F7NRAdbK5N3CCkP7RGpmLowb2/qKi8u+hUYyX5Q7U9cZBuVpKwzuWLtFTPv
 VD+XhfhQ6aTz7Xn7QDkmqSn5v1RWTTIS87oMRnQHVtYJ7g4TCFTu6CE0Lz+It1uVMjZ98TB//
 m+FpCRKbKwV1Wkfg5fC2wuNw8F8O1G+YD7+Vneueeztyy2ykT2GXNThBZldlulUrIawUWmWwe
 OEgRr4ukN1JeE2yycDZPQ0boaG4xEAzfiVUzof1+kQBAkxjxheVA9a+D6wJ5ltlnI3xPVKPHn
 8dzJ0/zSnwqx9Q19Bq7JGfQL6gRXQH9nROenWIJp7px/jvo0sWsP7AKcx0k9WCyup8xM0WFHR
 6EY3XR0isf5IF2CuGELqtZlB6WeU+zz8Z+HI2hB4dxbBZD4gxUWJFH7oICBfDMPvd+Vxhbyhw
 MHE8bzkiRe26R9JZxGCFGeg8OAQ2srveFMZ0XPqbQHT6ZgcXCE3kyrMHO0tPyog/TsCX6CSe2
 q0ZXF5jVkvMdMSXelsFND88NC+IzVQBN2faBL6cU/KsftoFjNv/7Min3wfc/zBZe6IbLNh0x6
 Xc1ReysEw8J2EIbPZOTQ5U2yd5MgnM6bDNl2uMeEskcFJIpAfPtNn3Bxivht7Ly9cJmIHb2oA
 bQc2WfwplFmjALQps/RLVGedLXStuzoXZqgaXZbLkDuAPSxGVCgBDW47UL6p94vsGbBOizWO8
 dZjnhPO4Ex3y/9YIt
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* Helge Deller <deller@gmx.de>:
> On parisc we don't have a real NMI interrupt which can be triggered at
> any time, even when running in a loop with external interrupts disabled.
>
> This patch works around that limitation by adding a new virtual NMI
> interrupt handler which works mostly like standard interrupts and which
> can be triggered at any time.
>
> Up to now we used the I flag in the PSW (PSW_I) to enable or disable
> external interrupts completely. The arch_local_irq_disable() and
> arch_local_irq_enable() functions modified that bit in the processor
> internal PSW register.
> In the new implementation we keep the external interrupts enabled
> the whole time and instead modify the EIEM (external interrupt enable
> mask) at runtime: When we want IRQs disabled, we only allow the NMI
> interrupt to pass, and when we enable interrupts we unmask all IRQs in
> the EIEM.
>
> The patch below is still work-in-progress which contains debug printks
> and comments, but it seems to work (tested on qemu) and I'm looking for
> feedback.
>
> The downside of this implementation is, that the arch_irq_local*
> functions became bigger and due to header dependencies I wasn't able
> to implement them inline.
>
> The upside is, that we now can trigger NMI backtraces at any time to
> analyze where the kernel hangs. This can be done via sysrq on a serial
> console or when logged in via "echo l > /proc/sysrq_tigger".

Below is an updated patch in which the local_irq* symbols were exported
with EXPORT_SYMBOL() for usage in modules.

Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/include/asm/irq.h b/arch/parisc/include/asm/irq.h
index 959e79cd2c14..d99f99eff1ed 100644
=2D-- a/arch/parisc/include/asm/irq.h
+++ b/arch/parisc/include/asm/irq.h
@@ -22,7 +22,8 @@
 #endif

 #define TIMER_IRQ	(CPU_IRQ_BASE + 0)
-#define	IPI_IRQ		(CPU_IRQ_BASE + 1)
+#define IPI_IRQ		(CPU_IRQ_BASE + 1)
+#define NMI_IRQ		(CPU_IRQ_BASE + 2)
 #define CPU_IRQ_MAX	(CPU_IRQ_BASE + (BITS_PER_LONG - 1))

 #define NR_IRQS		(CPU_IRQ_MAX + 1)
@@ -50,4 +51,10 @@ extern int cpu_check_affinity(struct irq_data *d, const=
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
diff --git a/arch/parisc/include/asm/irqflags.h b/arch/parisc/include/asm/=
irqflags.h
index 38a19c0bac3a..3582942412ca 100644
=2D-- a/arch/parisc/include/asm/irqflags.h
+++ b/arch/parisc/include/asm/irqflags.h
@@ -5,43 +5,12 @@
 #include <linux/types.h>
 #include <asm/psw.h>

-static inline unsigned long arch_local_save_flags(void)
-{
-	unsigned long flags;
-	asm volatile("ssm 0, %0" : "=3Dr" (flags) : : "memory");
-	return flags;
-}
-
-static inline void arch_local_irq_disable(void)
-{
-	asm volatile("rsm %0,%%r0\n" : : "i" (PSW_I) : "memory");
-}
-
-static inline void arch_local_irq_enable(void)
-{
-	asm volatile("ssm %0,%%r0\n" : : "i" (PSW_I) : "memory");
-}
-
-static inline unsigned long arch_local_irq_save(void)
-{
-	unsigned long flags;
-	asm volatile("rsm %1,%0" : "=3Dr" (flags) : "i" (PSW_I) : "memory");
-	return flags;
-}
-
-static inline void arch_local_irq_restore(unsigned long flags)
-{
-	asm volatile("mtsm %0" : : "r" (flags) : "memory");
-}
-
-static inline bool arch_irqs_disabled_flags(unsigned long flags)
-{
-	return (flags & PSW_I) =3D=3D 0;
-}
-
-static inline bool arch_irqs_disabled(void)
-{
-	return arch_irqs_disabled_flags(arch_local_save_flags());
-}
+unsigned long arch_local_save_flags(void);
+void arch_local_irq_disable(void);
+void arch_local_irq_enable(void);
+unsigned long arch_local_irq_save(void);
+void arch_local_irq_restore(unsigned long flags);
+bool arch_irqs_disabled_flags(unsigned long flags);
+bool arch_irqs_disabled(void);

 #endif /* __PARISC_IRQFLAGS_H */
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index e76c86619949..35018e79b490 100644
=2D-- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -22,7 +22,12 @@

 #undef PARISC_IRQ_CR16_COUNTS

+#define IRQ_DISABLE()	asm volatile("rsm %0,%%r0\n" : : "i" (PSW_I) : "mem=
ory")
+#define IRQ_ENABLE()	asm volatile("ssm %0,%%r0\n" : : "i" (PSW_I) : "memo=
ry")
+#define IRQ_STATUS()	({ unsigned long flags; asm volatile("ssm 0,%0\n" : =
"=3Dr" (flags) :: "memory"); (flags & PSW_I); })
+
 extern irqreturn_t timer_interrupt(int, void *);
+extern irqreturn_t nmi_interrupt(int, void *);
 extern irqreturn_t ipi_interrupt(int, void *);

 #define EIEM_MASK(irq)       (1UL<<(CPU_IRQ_MAX - irq))
@@ -507,7 +512,7 @@ void do_softirq_own_stack(void)
 void do_cpu_irq_mask(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs;
-	unsigned long eirr_val;
+	unsigned long eirr_val, old_status;
 	int irq, cpu =3D smp_processor_id();
 	struct irq_data *irq_data;
 #ifdef CONFIG_SMP
@@ -515,10 +520,13 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 #endif

 	old_regs =3D set_irq_regs(regs);
-	local_irq_disable();
 	irq_enter();

 	eirr_val =3D mfctl(23) & cpu_eiem & per_cpu(local_ack_eiem, cpu);
+	old_status =3D arch_local_irq_save();
+	// we could enable irqs again:
+	// IRQ_ENABLE();
+
 	if (!eirr_val)
 		goto set_out;
 	irq =3D eirr_to_irq(eirr_val);
@@ -553,6 +561,7 @@ void do_cpu_irq_mask(struct pt_regs *regs)
  out:
 	irq_exit();
 	set_irq_regs(old_regs);
+	arch_local_irq_restore(old_status);
 	return;

  set_out:
@@ -573,6 +582,9 @@ static void claim_cpu_irqs(void)
 	irq_set_handler(TIMER_IRQ, handle_percpu_irq);
 	if (request_irq(TIMER_IRQ, timer_interrupt, flags, "timer", NULL))
 		pr_err("Failed to register timer interrupt\n");
+	irq_set_handler(NMI_IRQ, handle_percpu_irq);
+	if (request_irq(NMI_IRQ, nmi_interrupt, IRQF_PERCPU, "NMI", NULL))
+		pr_err("Failed to register NMI interrupt\n");
 #ifdef CONFIG_SMP
 	irq_set_handler(IPI_IRQ, handle_percpu_irq);
 	if (request_irq(IPI_IRQ, ipi_interrupt, IRQF_PERCPU, "IPI", NULL))
@@ -582,16 +594,110 @@ static void claim_cpu_irqs(void)

 void __init init_IRQ(void)
 {
-	local_irq_disable();	/* PARANOID - should already be disabled */
+	int cpu =3D smp_processor_id();
+
+	IRQ_DISABLE();		/* PARANOID - should already be disabled */
 	mtctl(~0UL, 23);	/* EIRR : clear all pending external intr */
 #ifdef CONFIG_SMP
 	if (!cpu_eiem) {
 		claim_cpu_irqs();
-		cpu_eiem =3D EIEM_MASK(IPI_IRQ) | EIEM_MASK(TIMER_IRQ);
+		cpu_eiem =3D EIEM_MASK(IPI_IRQ) | EIEM_MASK(TIMER_IRQ) | EIEM_MASK(NMI_=
IRQ);
 	}
 #else
 	claim_cpu_irqs();
-	cpu_eiem =3D EIEM_MASK(TIMER_IRQ);
+	cpu_eiem =3D EIEM_MASK(TIMER_IRQ) | EIEM_MASK(NMI_IRQ);
 #endif
-        set_eiem(cpu_eiem);	/* EIEM : enable all external intr */
+	per_cpu(local_ack_eiem, cpu) =3D EIEM_MASK(NMI_IRQ);
+	set_eiem(cpu_eiem & per_cpu(local_ack_eiem, cpu));	/* EIEM : enable all =
external intr */
+	/* enable external IRQs again */
+	IRQ_ENABLE();
+}
+
+
+#include <asm/special_insns.h>
+
+inline unsigned long notrace arch_local_save_flags(void)
+{
+	int cpu =3D smp_processor_id();
+	return per_cpu(local_ack_eiem, cpu);
+}
+EXPORT_SYMBOL(arch_local_save_flags);
+
+inline void notrace arch_local_irq_disable(void)
+{
+	int cpu =3D smp_processor_id();
+	per_cpu(local_ack_eiem, cpu) =3D EIEM_MASK(NMI_IRQ);
+	set_eiem(EIEM_MASK(NMI_IRQ));
+}
+EXPORT_SYMBOL(arch_local_irq_disable);
+
+void notrace arch_local_irq_enable(void)
+{
+	int cpu =3D smp_processor_id();
+	per_cpu(local_ack_eiem, cpu) =3D ~0UL;
+	set_eiem(cpu_eiem);
+// printk("3 INTERRUPTS ARE %lx\n", IRQ_STATUS());
+//	mtctl(~cpu_eiem, 23);	/* EIRR : clear other pending external intr */
+	IRQ_ENABLE(); /* why is this needed? */
+}
+EXPORT_SYMBOL(arch_local_irq_enable);
+
+unsigned long notrace arch_local_irq_save(void)
+{
+	unsigned long flags;
+	flags =3D arch_local_save_flags();
+	arch_local_irq_disable();
+	return flags;
+}
+EXPORT_SYMBOL(arch_local_irq_save);
+
+void notrace arch_local_irq_restore(unsigned long flags)
+{
+	int cpu =3D smp_processor_id();
+	per_cpu(local_ack_eiem, cpu) =3D flags;
+	set_eiem(cpu_eiem & flags);
+}
+EXPORT_SYMBOL(arch_local_irq_restore);
+
+inline bool notrace arch_irqs_disabled_flags(unsigned long flags)
+{
+	return (flags & ~EIEM_MASK(NMI_IRQ)) =3D=3D 0;
+}
+EXPORT_SYMBOL(arch_irqs_disabled_flags);
+
+bool notrace arch_irqs_disabled(void)
+{
+	return arch_irqs_disabled_flags(arch_local_save_flags());
+}
+EXPORT_SYMBOL(arch_irqs_disabled);
+
+
+#include <linux/nmi.h>
+
+/* NMI interrupt */
+irqreturn_t __irq_entry nmi_interrupt(int irq, void *dev_id)
+{
+	printk_nmi_enter();
+	irq_enter();
+	nmi_cpu_backtrace(get_irq_regs());
+	irq_exit();
+	printk_nmi_exit();
+
+	return IRQ_HANDLED;
+}
+
+static void raise_nmi(cpumask_t *mask)
+{
+	int cpu;
+
+	for_each_cpu(cpu, mask) {
+		struct cpuinfo_parisc *p =3D &per_cpu(cpu_data, cpu);
+
+		gsc_writel(NMI_IRQ - CPU_IRQ_BASE, p->hpa);
+	}
+}
+
+void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_s=
elf)
+{
+	nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_nmi);
 }


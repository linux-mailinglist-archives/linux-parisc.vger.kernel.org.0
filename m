Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B208298175
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Oct 2020 12:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415407AbgJYLYT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Oct 2020 07:24:19 -0400
Received: from mout.gmx.net ([212.227.17.22]:57901 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391537AbgJYLYQ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Oct 2020 07:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603625046;
        bh=oaR3zFl0B529zYP84NX8tt1245woURbFvWoSyG5MzQo=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=OAU1tLKybp2T5D0oPtV5NGz8A17QbZF+lT2WQbvUZEyBu7HyEwLdzFgaYL/Krmqko
         ZOTiSwYfAu3SBSaVsvM7XRFk+gWf/htN2RPeH78IWGGD95bV/I9XbESPnEJ5wbNcMj
         005+NhTRgg5dtXHcToaNtqXFtLja/1oQLNma8VNc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.190.61]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzb8-1kxUea32Uk-00R2wA; Sun, 25
 Oct 2020 12:24:06 +0100
Date:   Sun, 25 Oct 2020 12:24:03 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [RFC][PATCH v1] parisc: Switch to clockevent based timers
Message-ID: <20201025112403.GA7034@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:+LQqXe39pVDGwFZrti647CWvqrYclJcOXVSC0aGADlDWw0l5/hB
 ifWrBSJnzDK507pMeGzbMjzLQz5bPdy5ELGf2ThD1nypHN2zZ0bwgjJDelRL+GRA+qypw00
 u0G1IUot5cOjwRW0Awo7zaJvo1opYR7+g8hlylURK4/RF5+aHwM2pljsI+LtUxba7CgS/zT
 UXvXsLJiWIpKub44+C/gA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cAAkRtECLGA=:GRnsjcwMHRUKm6EKaFQ484
 QqEWARFDsXZvrWDKMZ+/2fK4peZ5Q3zlw0WBtdvhwoAS42qAxJgTug/xQ0bnM9tfqvZQtY7Hn
 1Ycj9U1GjRfQmJMTMsgLUXzxJKbuE+rsT+/6r2EE7Q54/XETfmcLxsoUgs2+WSwb/S3kzdwnw
 9wH5zHv4RA5LGrFZBsEnVDopfmvFJ6kozmWseYJsUWQifrYT7uzhM40EpJbTsup0sXcevUwOV
 ftGb+zYTB2idHcmI8NNIj/XTa1eks7jjG4+QdKFyrVCbWoNqmbyJCJ4zsUBgdy4mxSTzE3xek
 Miee14oqbt7WhFUJKOHRrvgM2OTUCzaZrC5jvkZ7S54hGSNLhrFpfRnQQ1AXx7Ku32bVb68C2
 UlODUDryjqDtL7NVVUSqfjZR1oeqOXG9+UI6IGCoidwjxkxY31AYNpSPCuWGuuKjMmx6YYfFE
 h2/Bl9+3UodlC4nt8VW600/kGzy8MOqYRJxIsPaU5id/FDWHivQG2OeAkCxzuPIlzKFd8eOD7
 v2L6dwN13bk5sGIFO9GsEPqeRUjZS9g8CtbCnUq+q6u0MKx0+ytM/im5seLzAX3noZj4h3bmj
 TGm+U4Jhy7YfJ/GoH/qypIZpQCHNZ3R1833M/IlHskzjSgHdY1YDJScUfCTXvLmZFjZqr44lk
 xZT4oYIqDAPYndBWDyZKvWblhsRHJRFNz8QzS7CI9dqw6JhxSNsWpSuKZD9MkQ0VUQVqK+3ke
 oCCm8jMOXsF29V7CPPI7fJDGOQZvyFTcCu//bO7j+rdajc4FwrTxwFtK1mfvtOm8PJxgZYQd8
 83arWZTWtE8r9zwNmmnyfOldWmkL+jyr524G0Vj0jNlzI//EGFoixHJVe26BfiBATtCB1lCPb
 OFW3odtInYkvdlfI5HFQ==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Switch from a periodic timer-based configuration to a clockevent based
configuration. With this change we now have more fine grained hrtimers
and it's possible to switch to a CONFIG_NO_HZ_IDLE system.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm=
/processor.h
index 6e2a8176b0dd..186ba6bd1131 100644
=2D-- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -82,7 +82,6 @@ struct system_cpuinfo_parisc {

 /* Per CPU data structure - ie varies per CPU.  */
 struct cpuinfo_parisc {
-	unsigned long it_value;     /* Interval Timer at last timer Intr */
 	unsigned long irq_count;    /* number of IRQ's since boot */
 	unsigned long cpuid;        /* aka slot_number or set to NO_PROC_ID */
 	unsigned long hpa;          /* Host Physical address */
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index e76c86619949..50ec7b529922 100644
=2D-- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -562,17 +562,14 @@ void do_cpu_irq_mask(struct pt_regs *regs)

 static void claim_cpu_irqs(void)
 {
-	unsigned long flags =3D IRQF_TIMER | IRQF_PERCPU | IRQF_IRQPOLL;
 	int i;

 	for (i =3D CPU_IRQ_BASE; i <=3D CPU_IRQ_MAX; i++) {
 		irq_set_chip_and_handler(i, &cpu_interrupt_type,
 					 handle_percpu_irq);
 	}
-
-	irq_set_handler(TIMER_IRQ, handle_percpu_irq);
-	if (request_irq(TIMER_IRQ, timer_interrupt, flags, "timer", NULL))
-		pr_err("Failed to register timer interrupt\n");
+	irq_set_percpu_devid(TIMER_IRQ);
+	irq_set_handler(TIMER_IRQ, handle_percpu_devid_irq);
 #ifdef CONFIG_SMP
 	irq_set_handler(IPI_IRQ, handle_percpu_irq);
 	if (request_irq(IPI_IRQ, ipi_interrupt, IRQF_PERCPU, "IPI", NULL))
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 04508158815c..60ae30cbc59e 100644
=2D-- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -22,6 +22,7 @@
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/interrupt.h>
+#include <linux/clockchips.h>
 #include <linux/time.h>
 #include <linux/init.h>
 #include <linux/smp.h>
@@ -40,82 +41,75 @@

 #include <linux/timex.h>

+/*
+ * The PA-RISC Interval Timer is a pair of registers; one is read-only an=
d one
+ * is write-only; both accessed through CR16.  The read-only register is =
32 or
+ * 64 bits wide, and increments by 1 every CPU clock tick.  The architect=
ure
+ * only guarantees us a rate between 0.5 and 2, but all implementations u=
se a
+ * rate of 1.  The write-only register is 32-bits wide.  When the lowest =
32
+ * bits of the read-only register compare equal to the write-only registe=
r, it
+ * raises a maskable external interrupt.  Each processor has an Interval =
Timer
+ * of its own and they are not synchronised.
+ */
+
+#define cr16_hz	(100 * PAGE0->mem_10msec)	/* Hz */
 static unsigned long clocktick __ro_after_init;	/* timer cycles per tick =
*/

+static DEFINE_PER_CPU(struct clock_event_device, hppa_clk_events);
+
 /*
- * We keep time on PA-RISC Linux by using the Interval Timer which is
- * a pair of registers; one is read-only and one is write-only; both
- * accessed through CR16.  The read-only register is 32 or 64 bits wide,
- * and increments by 1 every CPU clock tick.  The architecture only
- * guarantees us a rate between 0.5 and 2, but all implementations use a
- * rate of 1.  The write-only register is 32-bits wide.  When the lowest
- * 32 bits of the read-only register compare equal to the write-only
- * register, it raises a maskable external interrupt.  Each processor has
- * an Interval Timer of its own and they are not synchronised.
- *
- * We want to generate an interrupt every 1/HZ seconds.  So we program
- * CR16 to interrupt every @clocktick cycles.  The it_value in cpu_data
- * is programmed with the intended time of the next tick.  We can be
- * held off for an arbitrarily long period of time by interrupts being
- * disabled, so we may miss one or more ticks.
+ * Do not disable the timer irq. The clockevents get that frequently
+ * programmed, that it's unlikely the timer will wrap and trigger again. =
So
+ * it's not worth to disable and reenable the hardware irqs, instead stor=
e in a
+ * static per-cpu variable if the irq is expected or not.
  */
-irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
+static DEFINE_PER_CPU(bool, cr16_clockevent_enabled);
+
+static void cr16_set_next(unsigned long delta, bool reenable_irq)
+{
+	mtctl(mfctl(16) + delta, 16);
+
+	if (reenable_irq)
+		per_cpu(cr16_clockevent_enabled, smp_processor_id()) =3D true;
+}
+
+static int cr16_clockevent_shutdown(struct clock_event_device *evt)
+{
+	per_cpu(cr16_clockevent_enabled, smp_processor_id()) =3D false;
+	return 0;
+}
+
+static int cr16_clockevent_set_periodic(struct clock_event_device *evt)
+{
+	cr16_set_next(clocktick, true);
+	return 0;
+}
+
+static int cr16_clockevent_set_next_event(unsigned long delta,
+					struct clock_event_device *evt)
+{
+	cr16_set_next(delta, true);
+	return 0;
+}
+
+static irqreturn_t timer_interrupt(int irq, void *dev_id)
 {
-	unsigned long now;
-	unsigned long next_tick;
-	unsigned long ticks_elapsed =3D 0;
 	unsigned int cpu =3D smp_processor_id();
-	struct cpuinfo_parisc *cpuinfo =3D &per_cpu(cpu_data, cpu);
-
-	/* gcc can optimize for "read-only" case with a local clocktick */
-	unsigned long cpt =3D clocktick;
-
-	profile_tick(CPU_PROFILING);
-
-	/* Initialize next_tick to the old expected tick time. */
-	next_tick =3D cpuinfo->it_value;
-
-	/* Calculate how many ticks have elapsed. */
-	now =3D mfctl(16);
-	do {
-		++ticks_elapsed;
-		next_tick +=3D cpt;
-	} while (next_tick - now > cpt);
-
-	/* Store (in CR16 cycles) up to when we are accounting right now. */
-	cpuinfo->it_value =3D next_tick;
-
-	/* Go do system house keeping. */
-	if (cpu =3D=3D 0)
-		xtime_update(ticks_elapsed);
-
-	update_process_times(user_mode(get_irq_regs()));
-
-	/* Skip clockticks on purpose if we know we would miss those.
-	 * The new CR16 must be "later" than current CR16 otherwise
-	 * itimer would not fire until CR16 wrapped - e.g 4 seconds
-	 * later on a 1Ghz processor. We'll account for the missed
-	 * ticks on the next timer interrupt.
-	 * We want IT to fire modulo clocktick even if we miss/skip some.
-	 * But those interrupts don't in fact get delivered that regularly.
-	 *
-	 * "next_tick - now" will always give the difference regardless
-	 * if one or the other wrapped. If "now" is "bigger" we'll end up
-	 * with a very large unsigned number.
-	 */
-	now =3D mfctl(16);
-	while (next_tick - now > cpt)
-		next_tick +=3D cpt;
-
-	/* Program the IT when to deliver the next interrupt.
-	 * Only bottom 32-bits of next_tick are writable in CR16!
-	 * Timer interrupt will be delivered at least a few hundred cycles
-	 * after the IT fires, so if we are too close (<=3D 8000 cycles) to the
-	 * next cycle, simply skip it.
-	 */
-	if (next_tick - now <=3D 8000)
-		next_tick +=3D cpt;
-	mtctl(next_tick, 16);
+	struct clock_event_device *evt;
+	bool handle_irq;
+
+	evt =3D &per_cpu(hppa_clk_events, cpu);
+	handle_irq =3D per_cpu(cr16_clockevent_enabled, cpu);
+
+	if (clockevent_state_oneshot(evt))
+		per_cpu(cr16_clockevent_enabled, smp_processor_id()) =3D false;
+	else {
+		if (handle_irq)
+			cr16_set_next(clocktick, false);
+	}
+
+	if (handle_irq)
+		evt->event_handler(evt);

 	return IRQ_HANDLED;
 }
@@ -156,11 +150,29 @@ static struct clocksource clocksource_cr16 =3D {
 void __init start_cpu_itimer(void)
 {
 	unsigned int cpu =3D smp_processor_id();
-	unsigned long next_tick =3D mfctl(16) + clocktick;

-	mtctl(next_tick, 16);		/* kick off Interval Timer (CR16) */
+	struct clock_event_device *clk =3D this_cpu_ptr(&hppa_clk_events);
+
+	clk->name =3D "cr16";
+	clk->features =3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT |
+			CLOCK_EVT_FEAT_PERCPU;
+	clk->set_state_shutdown =3D cr16_clockevent_shutdown;
+	clk->set_state_periodic =3D cr16_clockevent_set_periodic;
+	clk->set_state_oneshot =3D cr16_clockevent_shutdown;
+	clk->set_state_oneshot_stopped =3D cr16_clockevent_shutdown;
+	clk->set_next_event =3D cr16_clockevent_set_next_event;
+	clk->cpumask =3D cpumask_of(cpu);
+	clk->rating =3D 300;
+	clk->irq =3D TIMER_IRQ;
+	clockevents_config_and_register(clk, cr16_hz, 4000, 0xffffffff);
+
+	if (cpu =3D=3D 0) {
+		int err =3D request_percpu_irq(TIMER_IRQ, timer_interrupt,
+					 "timer", clk);
+		BUG_ON(err);
+	}

-	per_cpu(cpu_data, cpu).it_value =3D next_tick;
+	enable_percpu_irq(clk->irq, IRQ_TYPE_NONE);
 }

 #if IS_ENABLED(CONFIG_RTC_DRV_GENERIC)
@@ -231,13 +243,9 @@ static u64 notrace read_cr16_sched_clock(void)

 void __init time_init(void)
 {
-	unsigned long cr16_hz;
-
-	clocktick =3D (100 * PAGE0->mem_10msec) / HZ;
+	clocktick =3D DIV_ROUND_CLOSEST(cr16_hz, HZ);
 	start_cpu_itimer();	/* get CPU 0 started */

-	cr16_hz =3D 100 * PAGE0->mem_10msec;  /* Hz */
-
 	/* register as sched_clock source */
 	sched_clock_register(read_cr16_sched_clock, BITS_PER_LONG, cr16_hz);
 }

Return-Path: <linux-parisc+bounces-1835-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90064937466
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Jul 2024 09:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE9541C20A0B
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Jul 2024 07:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162492CA6;
	Fri, 19 Jul 2024 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMtERc6t"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E383D2C80
	for <linux-parisc@vger.kernel.org>; Fri, 19 Jul 2024 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721374237; cv=none; b=iJf7p4lGKlXEiuR5AroGYnkFJ6oNCemIDqdN+PDVqzWX8wEDXy2QJRD9ZeZo/W6yBPH/+6vzoBDKa0qEhrOz/DdsEjlA75wnzZFlOzwf6mDZsv13GjFIFekC/r0J5GOWF8V1dxFKcl5FBDa3IibuWsP1IAoc1eDBZbfedCaAfTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721374237; c=relaxed/simple;
	bh=P6wSM049sXknDU/s58rfLESWsf/6yOtYpC+gLfC7zgk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQf5P79KssGBXq13DdHZgOIi1NIE/X09Q/TKQUk/3TUzoah6kv0CcdeIXKKcszStzBzV0j28kCjYmI248rKcmKhDePc8Gnf5qP+hkZ9rjJZjlfKh8Cb5+rMBhX40sZn+Cf/3EyyPV8rvQl2vcKhLk5SpbHOoWyIekv3I7gAJvpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMtERc6t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF543C32782;
	Fri, 19 Jul 2024 07:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721374236;
	bh=P6wSM049sXknDU/s58rfLESWsf/6yOtYpC+gLfC7zgk=;
	h=Date:From:To:Subject:From;
	b=jMtERc6tvjU1XljxKqlsOK1y03hDXQFf/qmEIzuPLcJwkimN5jgEx52HnE82jbh4X
	 CPSqp2gJJh9RSrLJI5/F+jLwDKJqsfRPc+d72pMROD3RPuEDqVlOI1OWO7uY/OStv2
	 gjb4ezQRjCEzRJvFmhKLfLxd9ZUnMiqNl4lwBX3oG3yZt23soW2jXPn1Bb0qeDaBE0
	 VsNwFCgXeIwMx5G41I9ySU0M/8sm9Ja1LCIq88itUP3iwjGwHRx8G8778hZuwXGucn
	 L1qkZpd68h21DBs5pkDr5QMGnQ6DW78wkJ5qZmxsKKXp6x2Fm3zOH0dxMEIz5Ex3wH
	 77TmDX0j2Mupg==
Date: Fri, 19 Jul 2024 09:30:33 +0200
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH v2] parisc: Improve monotonic clock_gettime() resolution on
 SMP machines
Message-ID: <ZpoWGfQMJY19fOyR@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On parisc SMP machines the CR16 CPU-internal clocks are not syncronized,
which is why they can't be used to provide a more fine-grained monotonic
clock as it's done on x86 with the TSC timers.
Work around that issue by increasing the standard timer interrupt to fire
10 times more often and use an irq counter to improve the clock_gettime64()
resolution.

Note that this is necessary on physical SMP machines only. Qemu will always
provide a fine-grained clock based on the host clock.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org	# v6.0+
Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1020321#23

---

v2:
- change to irq counter instead of using the raw cr16 value of monarch CPU

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 9714fbd7c42d..27a7d7125b30 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -44,6 +44,10 @@ int time_keeper_id __read_mostly;	/* CPU used for timekeeping. */
 
 static unsigned long clocktick __ro_after_init;	/* timer cycles per tick */
 
+#define MONARCH_CLOCKTICK_FACTOR	10
+static int clock_use_monarch_cr16;
+static unsigned long monarch_cr16_ticks;
+
 /*
  * We keep time on PA-RISC Linux by using the Interval Timer which is
  * a pair of registers; one is read-only and one is write-only; both
@@ -60,6 +64,16 @@ static unsigned long clocktick __ro_after_init;	/* timer cycles per tick */
  * is programmed with the intended time of the next tick.  We can be
  * held off for an arbitrarily long period of time by interrupts being
  * disabled, so we may miss one or more ticks.
+ *
+ * Note that on SMP machines the CR16 clocks are not syncronized between
+ * the CPUs. So, on such machines CR16 can not be used as high-res clock
+ * input for the monotonic clock_gettime64() syscall, which is why
+ * clock_gettime64() delivers poor resolution on SMP when configured with
+ * HZ=100 or HZ=250.  To work around this issue, let the CR16 timer
+ * interrupt trigger MONARCH_CLOCKTICK_FACTOR times more often, and
+ * increase the a cr16 counter everytime when interrupted. This counter is
+ * then used instead of the local CPU cr16 counter to get higher resolution
+ * than just using the jiffie-based timer.
  */
 irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 {
@@ -68,10 +82,21 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 	unsigned long ticks_elapsed = 0;
 	unsigned int cpu = smp_processor_id();
 	struct cpuinfo_parisc *cpuinfo = &per_cpu(cpu_data, cpu);
+	int increase_monarch_tickrate = 0;
+	static int monarch_tickrate_counter;
 
 	/* gcc can optimize for "read-only" case with a local clocktick */
 	unsigned long cpt = clocktick;
 
+	/* let main clock tick faster if necessary */
+	if (IS_ENABLED(CONFIG_SMP) &&
+	    (IS_ENABLED(CONFIG_HZ_100) || IS_ENABLED(CONFIG_HZ_250)) &&
+	    clock_use_monarch_cr16 && (cpu == time_keeper_id)) {
+		increase_monarch_tickrate = 1;
+		cpt /= MONARCH_CLOCKTICK_FACTOR;
+		monarch_tickrate_counter++;
+	}
+
 	/* Initialize next_tick to the old expected tick time. */
 	next_tick = cpuinfo->it_value;
 
@@ -88,7 +113,14 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 	/* Go do system house keeping. */
 	if (IS_ENABLED(CONFIG_SMP) && (cpu != time_keeper_id))
 		ticks_elapsed = 0;
-	legacy_timer_tick(ticks_elapsed);
+	else
+		monarch_cr16_ticks++;
+	if (!increase_monarch_tickrate || (increase_monarch_tickrate
+		&& monarch_tickrate_counter == MONARCH_CLOCKTICK_FACTOR)) {
+		legacy_timer_tick(ticks_elapsed);
+		if (increase_monarch_tickrate)
+			monarch_tickrate_counter = 0;
+	}
 
 	/* Skip clockticks on purpose if we know we would miss those.
 	 * The new CR16 must be "later" than current CR16 otherwise
@@ -141,7 +173,10 @@ EXPORT_SYMBOL(profile_pc);
 
 static u64 notrace read_cr16(struct clocksource *cs)
 {
-	return get_cycles();
+	if (clock_use_monarch_cr16)
+		return monarch_cr16_ticks;
+	else
+		return get_cycles();
 }
 
 static struct clocksource clocksource_cr16 = {
@@ -250,18 +285,23 @@ void __init time_init(void)
 
 static int __init init_cr16_clocksource(void)
 {
+	unsigned int cr16_hz = 100 * PAGE0->mem_10msec;
+
 	/*
 	 * The cr16 interval timers are not synchronized across CPUs.
 	 */
 	if (num_online_cpus() > 1 && !running_on_qemu) {
-		clocksource_cr16.name = "cr16_unstable";
-		clocksource_cr16.flags = CLOCK_SOURCE_UNSTABLE;
-		clocksource_cr16.rating = 0;
+		clock_use_monarch_cr16 = 1;
+		clocksource_cr16.name = "cr16_monarch";
+		cr16_hz = HZ;
+		/* keep CONFIG_HZ, but let timer fire more often */
+		if (IS_ENABLED(CONFIG_HZ_100) || IS_ENABLED(CONFIG_HZ_250)) {
+			cr16_hz *= MONARCH_CLOCKTICK_FACTOR;
+		}
 	}
 
 	/* register at clocksource framework */
-	clocksource_register_hz(&clocksource_cr16,
-		100 * PAGE0->mem_10msec);
+	clocksource_register_hz(&clocksource_cr16, cr16_hz);
 
 	return 0;
 }


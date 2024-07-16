Return-Path: <linux-parisc+bounces-1834-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1544C93309E
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Jul 2024 20:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 464511C228E3
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Jul 2024 18:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C111A2C0A;
	Tue, 16 Jul 2024 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APBZqxjb"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52C81A08C4
	for <linux-parisc@vger.kernel.org>; Tue, 16 Jul 2024 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721155267; cv=none; b=vEqbiFHSiHPmiAsa6lmrRfwrrBlCL7/6CXzhmpqJh0RZyMETLRlY+RNmDLdVS8zqQhEvvPPz3EUsffSdDMZsGt+M3plBmLlHhGzUd8BY7npi0Z4J9hZ6gpgZe3MkM4qLD7iS42UonSkMHc5wvSiz9atnICy+jvXyX/AGQn5EtHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721155267; c=relaxed/simple;
	bh=tNP23nhF7caxMbecmL/QEMPmwCd1mbD40HQd39Xwgns=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZc8vW/A5mffY63EeGURDjn7XQDCEkaiVKP4pc4aZ7Bthx8j4g9lqYDG11NoGzYVPL9RepglVja0+eDyaUEKZ8yrBkAuGl4yVHjFvgYS2gHldKGfJr3vOyedqkZNVh8IsFmETAisfZGaZHceT9IcJm8uTubjyEsNDceIiBXKDkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APBZqxjb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4711C116B1;
	Tue, 16 Jul 2024 18:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721155266;
	bh=tNP23nhF7caxMbecmL/QEMPmwCd1mbD40HQd39Xwgns=;
	h=Date:From:To:Subject:From;
	b=APBZqxjbczCFdbvuE4jRGhRsvsCrytqKtwDu8qQ4V0Qa90zrof8wmLVmGnoa5c1sw
	 jqApicQxcPoAvHIuFgx4r2jr/mjivQjiMDnXiWtv8SkygjvqKFker9tdk7ZZ6nVOc8
	 OQchXAssF3twH39qUOVhvGFKg4iwnlO5ZGtVuCsmcxgckNtBtGGG2BDNitRM6c9+8d
	 qQgmD7Eb4s726BQmOf1O2UGsbVN/d9JVWUiC9KdbU8DgrJWDlKr9yg6NramXK1uPfl
	 /s2OPz2oeOVPKMBcqSh2UbFG4WsHjDrwatyljUbd6GusyODolaaU2RLiqRnT6OBI1r
	 HXfntZthUDBkg==
Date: Tue, 16 Jul 2024 20:41:03 +0200
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Improve monotonic clock_gettime() resolution on SMP
 machines
Message-ID: <Zpa-v2xm6ZxxCI1f@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On parisc SMP machines the CR16 CPU-internal clocks are not syncronized, which
is why they can't be used to calculatate a more fine-grained monotonic clock
as it's done on x86 with the TSC timers.
Work around that issue by increasing the standard timer interrupt to fire 10
times more often and use the cr16 value of the monarch CPU to improve the
clock_gettime64() resolution.

Note that this is necessary for physical SMP machines only. Qemu will
always provide a fine-grained clock.

Signed-off-by: Helge Deller <deller@gmx.de>
Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1020321#23

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 9714fbd7c42d..0126fed197cd 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -44,6 +44,9 @@ int time_keeper_id __read_mostly;	/* CPU used for timekeeping. */
 
 static unsigned long clocktick __ro_after_init;	/* timer cycles per tick */
 
+#define MONARCH_CLOCKTICK_FACTOR	10
+static int clock_use_monarch_cr16;
+
 /*
  * We keep time on PA-RISC Linux by using the Interval Timer which is
  * a pair of registers; one is read-only and one is write-only; both
@@ -60,6 +63,16 @@ static unsigned long clocktick __ro_after_init;	/* timer cycles per tick */
  * is programmed with the intended time of the next tick.  We can be
  * held off for an arbitrarily long period of time by interrupts being
  * disabled, so we may miss one or more ticks.
+ *
+ * Note that on SMP machines the CR16 clocks are not syncronized between
+ * the CPUs. So, on such machines CR16 can not be used as high-res clock
+ * input for the monotonic clock_gettime64() syscall, which is why
+ * clock_gettime64() delivers poor resolution on SMP when configured with
+ * HZ=100 or HZ=250.  To work around this issue, let the CR16 timer
+ * interrupt trigger MONARCH_CLOCKTICK_FACTOR times more often, and read the
+ * monarch CR16 value everytime when interrupted. This CR16 value of the
+ * monarch CPU will then be used instead of the local CPU cr16 counter to
+ * get higher resolution than just using the jiffie-based timer.
  */
 irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 {
@@ -68,10 +81,21 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
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
 
@@ -88,7 +112,12 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 	/* Go do system house keeping. */
 	if (IS_ENABLED(CONFIG_SMP) && (cpu != time_keeper_id))
 		ticks_elapsed = 0;
-	legacy_timer_tick(ticks_elapsed);
+	if (!increase_monarch_tickrate || (increase_monarch_tickrate
+		&& monarch_tickrate_counter == MONARCH_CLOCKTICK_FACTOR)) {
+		legacy_timer_tick(ticks_elapsed);
+		if (increase_monarch_tickrate)
+			monarch_tickrate_counter = 0;
+	}
 
 	/* Skip clockticks on purpose if we know we would miss those.
 	 * The new CR16 must be "later" than current CR16 otherwise
@@ -141,7 +170,14 @@ EXPORT_SYMBOL(profile_pc);
 
 static u64 notrace read_cr16(struct clocksource *cs)
 {
-	return get_cycles();
+	struct cpuinfo_parisc *cpuinfo;
+
+	/* fast path */
+	if (!clock_use_monarch_cr16)
+		return get_cycles();
+
+	cpuinfo = &per_cpu(cpu_data, time_keeper_id);
+	return cpuinfo->it_value;
 }
 
 static struct clocksource clocksource_cr16 = {
@@ -254,9 +290,11 @@ static int __init init_cr16_clocksource(void)
 	 * The cr16 interval timers are not synchronized across CPUs.
 	 */
 	if (num_online_cpus() > 1 && !running_on_qemu) {
-		clocksource_cr16.name = "cr16_unstable";
-		clocksource_cr16.flags = CLOCK_SOURCE_UNSTABLE;
-		clocksource_cr16.rating = 0;
+		clock_use_monarch_cr16 = 1;
+		/* keep CONFIG_HZ, but let timer fire more often */
+		if (IS_ENABLED(CONFIG_HZ_100) || IS_ENABLED(CONFIG_HZ_250)) {
+			clocksource_cr16.name = "cr16_monarch";
+		}
 	}
 
 	/* register at clocksource framework */


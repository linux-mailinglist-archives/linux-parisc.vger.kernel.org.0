Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6762A09C5
	for <lists+linux-parisc@lfdr.de>; Fri, 30 Oct 2020 16:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgJ3P1K (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 30 Oct 2020 11:27:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:59394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726999AbgJ3P1K (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 30 Oct 2020 11:27:10 -0400
Received: from localhost.localdomain (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E893120791;
        Fri, 30 Oct 2020 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604071122;
        bh=xEE6XAwTyiJCuhep1UVzNt+e6/QHIKC+pYNSqF2F5gg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TqW15yUGN+tgHssz20Dk9lehvOdW5CVcoq+VmEBc1q2MwkZHWoDsvmK5EdXPyeDSE
         BsMn0Du8ZolR9KGv35T+5vPu3TDWPIo7CaTzPXqC2NkSGrYxSCsMhLLhMvp2YmXZMv
         hFhVNGvwzqmyn/52DFEYxUXb8gNXABLfUG6GmQWY=
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ia64@vger.kernel.org,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 05/15] ia64: convert to legacy_timer_tick
Date:   Fri, 30 Oct 2020 16:17:48 +0100
Message-Id: <20201030151758.1241164-6-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201030151758.1241164-1-arnd@kernel.org>
References: <20201030151758.1241164-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

ia64 is the only architecture that calls xtime_update() in a loop,
once for each jiffie that has passed since the last event.

Before commit 3171a0305d62 ("[PATCH] simplify update_times (avoid
jiffies/jiffies_64 aliasing problem)") in 2006, it could not actually do
this any differently, but now it seems simpler to just pass the number
of jiffies that passed in the meantime.

While this loses the ability process interrupts in the middle of
the timer tick by calling local_irq_enable(), doing so is fairly
peculiar anyway and it seems better to just do what everyone
else does here.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/ia64/Kconfig       |  1 +
 arch/ia64/kernel/time.c | 36 +++++++++++++-----------------------
 2 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 39b25a5a591b..db8c2a365b70 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -46,6 +46,7 @@ config IA64
 	select ARCH_THREAD_STACK_ALLOCATOR
 	select ARCH_CLOCKSOURCE_DATA
 	select GENERIC_TIME_VSYSCALL
+	select LEGACY_TIMER_TICK
 	select SWIOTLB
 	select SYSCTL_ARCH_UNALIGN_NO_WARN
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/ia64/kernel/time.c b/arch/ia64/kernel/time.c
index 7abc5f37bfaf..9431edb08508 100644
--- a/arch/ia64/kernel/time.c
+++ b/arch/ia64/kernel/time.c
@@ -161,39 +161,29 @@ void vtime_account_idle(struct task_struct *tsk)
 static irqreturn_t
 timer_interrupt (int irq, void *dev_id)
 {
-	unsigned long new_itm;
+	unsigned long cur_itm, new_itm, ticks;
 
 	if (cpu_is_offline(smp_processor_id())) {
 		return IRQ_HANDLED;
 	}
 
 	new_itm = local_cpu_data->itm_next;
+	cur_itm = ia64_get_itc();
 
-	if (!time_after(ia64_get_itc(), new_itm))
+	if (!time_after(cur_itm, new_itm)) {
 		printk(KERN_ERR "Oops: timer tick before it's due (itc=%lx,itm=%lx)\n",
-		       ia64_get_itc(), new_itm);
-
-	profile_tick(CPU_PROFILING);
-
-	while (1) {
-		update_process_times(user_mode(get_irq_regs()));
-
-		new_itm += local_cpu_data->itm_delta;
-
-		if (smp_processor_id() == time_keeper_id)
-			xtime_update(1);
-
-		local_cpu_data->itm_next = new_itm;
+		       cur_itm, new_itm);
+		ticks = 1;
+	} else {
+		ticks = DIV_ROUND_UP(cur_itm - new_itm,
+				     local_cpu_data->itm_delta);
+		new_itm += ticks * local_cpu_data->itm_delta;
+	}
 
-		if (time_after(new_itm, ia64_get_itc()))
-			break;
+	if (smp_processor_id() != time_keeper_id)
+		ticks = 0;
 
-		/*
-		 * Allow IPIs to interrupt the timer loop.
-		 */
-		local_irq_enable();
-		local_irq_disable();
-	}
+	legacy_timer_tick(ticks);
 
 	do {
 		/*
-- 
2.27.0


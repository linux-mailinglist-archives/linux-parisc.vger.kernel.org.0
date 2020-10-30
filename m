Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322ED2A0987
	for <lists+linux-parisc@lfdr.de>; Fri, 30 Oct 2020 16:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgJ3PUa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 30 Oct 2020 11:20:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:52804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726867AbgJ3PUB (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 30 Oct 2020 11:20:01 -0400
Received: from localhost.localdomain (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF5EC22246;
        Fri, 30 Oct 2020 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604071140;
        bh=1U0ECVqd2hNgqIJBzCiaE0G3Htac28AHKdGuEc6XP0Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mYdsPP8cT4riayqUCnHMvcpTSpOrhi3YSE4t0JqeIOcSvOMDaPTkYggDnUgQb2faP
         h/CoXoTiH3Ok9f0NYQ9R/g3i6G1WgP0MSYZIfi+kiBxsYesZvCwAAJs1uQN9fFAKGG
         SuIrZnPotazCQd8YQ5skHinbiEbDmJqn58vnt3kQ=
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 09/15] m68k: split heartbeat out of timer function
Date:   Fri, 30 Oct 2020 16:17:52 +0100
Message-Id: <20201030151758.1241164-10-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201030151758.1241164-1-arnd@kernel.org>
References: <20201030151758.1241164-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The heartbeat functionality is mostly separate from the
actual timer interrupt handling, and it is only used on
five platforms.

Split it out into a separate function and call that directly
from the timer irq on those platforms.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/amiga/config.c        | 1 +
 arch/m68k/apollo/config.c       | 1 +
 arch/m68k/atari/time.c          | 2 ++
 arch/m68k/hp300/time.c          | 1 +
 arch/m68k/include/asm/machdep.h | 7 +++++++
 arch/m68k/kernel/time.c         | 7 +++++--
 arch/m68k/q40/q40ints.c         | 2 ++
 7 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index bee9f240f35d..29f92333119e 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -480,6 +480,7 @@ static irqreturn_t ciab_timer_handler(int irq, void *dev_id)
 	clk_total += jiffy_ticks;
 	clk_offset = 0;
 	timer_routine(0, NULL);
+	timer_heartbeat();
 
 	return IRQ_HANDLED;
 }
diff --git a/arch/m68k/apollo/config.c b/arch/m68k/apollo/config.c
index 762da5d7a415..30915f1a8760 100644
--- a/arch/m68k/apollo/config.c
+++ b/arch/m68k/apollo/config.c
@@ -173,6 +173,7 @@ irqreturn_t dn_timer_int(int irq, void *dev_id)
 	volatile unsigned char x;
 
 	timer_handler(irq, dev_id);
+	timer_heartbeat();
 
 	x = *(volatile unsigned char *)(apollo_timer + 3);
 	x = *(volatile unsigned char *)(apollo_timer + 5);
diff --git a/arch/m68k/atari/time.c b/arch/m68k/atari/time.c
index ce923a523695..ce4a5961ca93 100644
--- a/arch/m68k/atari/time.c
+++ b/arch/m68k/atari/time.c
@@ -21,6 +21,7 @@
 #include <linux/export.h>
 
 #include <asm/atariints.h>
+#include <asm/machdep.h>
 
 DEFINE_SPINLOCK(rtc_lock);
 EXPORT_SYMBOL_GPL(rtc_lock);
@@ -49,6 +50,7 @@ static irqreturn_t mfp_timer_c_handler(int irq, void *dev_id)
 	} while (last_timer_count == 1);
 	clk_total += INT_TICKS;
 	timer_routine(0, NULL);
+	timer_heartbeat();
 	local_irq_restore(flags);
 
 	return IRQ_HANDLED;
diff --git a/arch/m68k/hp300/time.c b/arch/m68k/hp300/time.c
index bfee13e1d0fe..e3cd938de0f9 100644
--- a/arch/m68k/hp300/time.c
+++ b/arch/m68k/hp300/time.c
@@ -65,6 +65,7 @@ static irqreturn_t hp300_tick(int irq, void *dev_id)
 	clk_total += INTVAL;
 	clk_offset = 0;
 	timer_routine(0, NULL);
+	timer_heartbeat();
 	local_irq_restore(flags);
 
 	/* Turn off the network and SCSI leds */
diff --git a/arch/m68k/include/asm/machdep.h b/arch/m68k/include/asm/machdep.h
index 49bd3266b4b1..e62a39d01ae4 100644
--- a/arch/m68k/include/asm/machdep.h
+++ b/arch/m68k/include/asm/machdep.h
@@ -35,6 +35,13 @@ extern void (*mach_beep) (unsigned int, unsigned int);
 /* Hardware clock functions */
 extern void hw_timer_init(irq_handler_t handler);
 extern unsigned long hw_timer_offset(void);
+#ifdef CONFIG_HEARTBEAT
+extern void timer_heartbeat(void);
+#else
+static inline void timer_heartbeat(void)
+{
+}
+#endif
 
 extern void config_BSP(char *command, int len);
 
diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
index c2697a4d4ddd..c05cec21b05f 100644
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -45,8 +45,12 @@ static irqreturn_t timer_interrupt(int irq, void *dummy)
 	xtime_update(1);
 	update_process_times(user_mode(get_irq_regs()));
 	profile_tick(CPU_PROFILING);
+	return IRQ_HANDLED;
+}
 
 #ifdef CONFIG_HEARTBEAT
+void timer_heartbeat(void)
+{
 	/* use power LED as a heartbeat instead -- much more useful
 	   for debugging -- based on the version for PReP by Cort */
 	/* acts like an actual heart beat -- ie thump-thump-pause... */
@@ -68,9 +72,8 @@ static irqreturn_t timer_interrupt(int irq, void *dummy)
 		dist = period / 4;
 	    }
 	}
-#endif /* CONFIG_HEARTBEAT */
-	return IRQ_HANDLED;
 }
+#endif /* CONFIG_HEARTBEAT */
 
 #ifdef CONFIG_M68KCLASSIC
 #if !IS_BUILTIN(CONFIG_RTC_DRV_GENERIC)
diff --git a/arch/m68k/q40/q40ints.c b/arch/m68k/q40/q40ints.c
index 1c696906c159..b01b545a2db0 100644
--- a/arch/m68k/q40/q40ints.c
+++ b/arch/m68k/q40/q40ints.c
@@ -17,6 +17,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 
+#include <asm/machdep.h>
 #include <asm/ptrace.h>
 #include <asm/traps.h>
 
@@ -144,6 +145,7 @@ static irqreturn_t q40_timer_int(int irq, void *dev_id)
 
 		local_irq_save(flags);
 		timer_routine(0, NULL);
+		timer_heartbeat();
 		local_irq_restore(flags);
 	}
 	return IRQ_HANDLED;
-- 
2.27.0


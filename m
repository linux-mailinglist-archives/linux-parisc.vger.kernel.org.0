Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F642877E9
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Oct 2020 17:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731205AbgJHPsj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 8 Oct 2020 11:48:39 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:56269 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731178AbgJHPsi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 8 Oct 2020 11:48:38 -0400
Received: from localhost.localdomain ([192.30.34.233]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mn1iT-1kp7mV2szP-00k4sm; Thu, 08 Oct 2020 17:47:49 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/13] m68k: coldfire: use legacy_timer_tick()
Date:   Thu,  8 Oct 2020 17:46:43 +0200
Message-Id: <20201008154651.1901126-6-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201008154651.1901126-1-arnd@arndb.de>
References: <20201008154651.1901126-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xNQxS2XthDSdDM0fGxa0OcEpfzhuQeGcWB55DeOgoAALv6NRiur
 EcuewQB+TTEl3bne5Oz1MWVYMU3jfDcmVWBNe4Jz53Ma61yGreo2XZNX08gunfwwUXS6DHo
 ETJWbwiHtG6dXsQNe6llZp9PCSpmCZJA77Dy5/jHVXEHXT+Dw0yIR6Pon+8/MJVPWSC24yg
 3yohRLHTfW+RAfhNEitVQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ri+t/fACKuk=:q4aukyYZnZOvR98hZhLtT2
 +pr15i/AgsInH8Epuvg/PLEnJAzzr37jF9HhP3vXuC7apUauO931yJtR329OHwpcGXdHnTi3w
 XpKVoTERi6P3mbQV8klWRC94kQlcWsIEFLueTHw48ujkea8sgCCwcEx3F3oBQFYhsxP9XlfI0
 SzijQB37ScmmHnoyRAkLHVfKcahumtbB2yPiazNT57MJErpvXfza1AYhC6Hq0Ka22J75CmxVc
 9Ce6PuI1WHc//cCBkNrwiyk2Y3ATGxTdbrzyxzEkWW/sYBOcu7JvB1yCSP1Mnh8ToQNANeuzb
 Tb8xAgsTMBGnlDxa94ZHgAfGIn9fr6g3XNSrdj5ePe44aAXluhpwRgVm7AkvQ+rPzujLsBTQ4
 xqHaKmlk8eA/o5D5SdtSB1dU1NUPSPdhVUKZHlBo+aa/Ldiv8O8IJ8Ce2ODwm6PFC59nOWgoe
 QsfoyGc6YFcdcF6rDX5wwIM2axDM+cBy9Rv8q6uO1FMaffY9WGeEglvVP2PS4MG0MCwq4obN7
 ZYjCj7miHQo9uqk490MIO6zdrZjFowhAnduzjo10xjJPWtJDXiRa+XplDqM96ApH/CIIsiplG
 VLzKwUOBR3fR5VkbADwW1Y47VwyJrHJvG08f9icaHU8FJLEYfZj2IeI9Egcn3WbasVlaNnRwB
 6yC5Uu8PZQ6bprjtq4JQers2q1YXwmF13bEmda+jn/PGY8hWORyq9KzC9rQXDF4GiqPvDk2Aa
 qs+RE1zS89LPXa8EjzvNeoxi3u0FjahRcrp7J2TU1EMB/ekJapr4YjvCyFesjuBVMXHdTUQMW
 VaMBL9Ae0k5h9jYeFdz+oCTCYNlkL1AYAk1qCDmztRtGGz1bpvpbU4j6gxZu2Gv1Omf2Lnk
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Replace the indirect function calls in the timer code
with direct calls to the newly added legacy_timer_tick()
helper for those that have not yet been converted to
generic clockevents.

This makes the timer code a little more self-contained.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/Kconfig.cpu         | 35 +++++++++++++++++++++++++++++------
 arch/m68k/coldfire/Makefile   | 32 ++++++++++++++++++--------------
 arch/m68k/coldfire/sltimers.c |  6 ++----
 arch/m68k/coldfire/timers.c   |  6 ++----
 4 files changed, 51 insertions(+), 28 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 694c4fca9f5d..322a35ef14c6 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -137,6 +137,7 @@ config M5206
 	bool "MCF5206"
 	depends on !MMU
 	select COLDFIRE_SW_A7
+	select COLDFIRE_TIMERS
 	select HAVE_MBAR
 	select CPU_NO_EFFICIENT_FFS
 	help
@@ -146,6 +147,7 @@ config M5206e
 	bool "MCF5206e"
 	depends on !MMU
 	select COLDFIRE_SW_A7
+	select COLDFIRE_TIMERS
 	select HAVE_MBAR
 	select CPU_NO_EFFICIENT_FFS
 	help
@@ -154,7 +156,7 @@ config M5206e
 config M520x
 	bool "MCF520x"
 	depends on !MMU
-	select GENERIC_CLOCKEVENTS
+	select COLDFIRE_PIT_TIMER
 	select HAVE_CACHE_SPLIT
 	help
 	   Freescale Coldfire 5207/5208 processor support.
@@ -162,7 +164,7 @@ config M520x
 config M523x
 	bool "MCF523x"
 	depends on !MMU
-	select GENERIC_CLOCKEVENTS
+	select COLDFIRE_PIT_TIMER
 	select HAVE_CACHE_SPLIT
 	select HAVE_IPSBAR
 	help
@@ -172,6 +174,7 @@ config M5249
 	bool "MCF5249"
 	depends on !MMU
 	select COLDFIRE_SW_A7
+	select COLDFIRE_TIMERS
 	select HAVE_MBAR
 	select CPU_NO_EFFICIENT_FFS
 	help
@@ -181,6 +184,7 @@ config M525x
 	bool "MCF525x"
 	depends on !MMU
 	select COLDFIRE_SW_A7
+	select COLDFIRE_TIMERS
 	select HAVE_MBAR
 	select CPU_NO_EFFICIENT_FFS
 	help
@@ -189,10 +193,10 @@ config M525x
 config M5271
 	bool "MCF5271"
 	depends on !MMU
+	select COLDFIRE_PIT_TIMER
 	select M527x
 	select HAVE_CACHE_SPLIT
 	select HAVE_IPSBAR
-	select GENERIC_CLOCKEVENTS
 	help
 	  Freescale (Motorola) ColdFire 5270/5271 processor support.
 
@@ -200,6 +204,7 @@ config M5272
 	bool "MCF5272"
 	depends on !MMU
 	select COLDFIRE_SW_A7
+	select COLDFIRE_TIMERS
 	select HAVE_MBAR
 	select CPU_NO_EFFICIENT_FFS
 	help
@@ -208,17 +213,17 @@ config M5272
 config M5275
 	bool "MCF5275"
 	depends on !MMU
+	select COLDFIRE_PIT_TIMER
 	select M527x
 	select HAVE_CACHE_SPLIT
 	select HAVE_IPSBAR
-	select GENERIC_CLOCKEVENTS
 	help
 	  Freescale (Motorola) ColdFire 5274/5275 processor support.
 
 config M528x
 	bool "MCF528x"
 	depends on !MMU
-	select GENERIC_CLOCKEVENTS
+	select COLDFIRE_PIT_TIMER
 	select HAVE_CACHE_SPLIT
 	select HAVE_IPSBAR
 	help
@@ -227,6 +232,7 @@ config M528x
 config M5307
 	bool "MCF5307"
 	depends on !MMU
+	select COLDFIRE_TIMERS
 	select COLDFIRE_SW_A7
 	select HAVE_CACHE_CB
 	select HAVE_MBAR
@@ -237,6 +243,7 @@ config M5307
 config M532x
 	bool "MCF532x"
 	depends on !MMU
+	select COLDFIRE_TIMERS
 	select M53xx
 	select HAVE_CACHE_CB
 	help
@@ -245,6 +252,7 @@ config M532x
 config M537x
 	bool "MCF537x"
 	depends on !MMU
+	select COLDFIRE_TIMERS
 	select M53xx
 	select HAVE_CACHE_CB
 	help
@@ -254,6 +262,7 @@ config M5407
 	bool "MCF5407"
 	depends on !MMU
 	select COLDFIRE_SW_A7
+	select COLDFIRE_TIMERS
 	select HAVE_CACHE_CB
 	select HAVE_MBAR
 	select CPU_NO_EFFICIENT_FFS
@@ -263,6 +272,7 @@ config M5407
 config M547x
 	bool "MCF547x"
 	select M54xx
+	select COLDFIRE_SLTIMERS
 	select MMU_COLDFIRE if MMU
 	select FPU if MMU
 	select HAVE_CACHE_CB
@@ -273,6 +283,7 @@ config M547x
 
 config M548x
 	bool "MCF548x"
+	select COLDFIRE_SLTIMERS
 	select MMU_COLDFIRE if MMU
 	select FPU if MMU
 	select M54xx
@@ -284,8 +295,8 @@ config M548x
 
 config M5441x
 	bool "MCF5441x"
+	select COLDFIRE_PIT_TIMER
 	select MMU_COLDFIRE if MMU
-	select GENERIC_CLOCKEVENTS
 	select HAVE_CACHE_CB
 	help
 	  Freescale Coldfire 54410/54415/54416/54417/54418 processor support.
@@ -302,6 +313,18 @@ config M54xx
 	select HAVE_PCI
 	bool
 
+config COLDFIRE_PIT_TIMER
+	bool
+	select GENERIC_CLOCKEVENTS
+
+config COLDFIRE_TIMERS
+	bool
+	select LEGACY_TIMER_TICK
+
+config COLDFIRE_SLTIMERS
+	bool
+	select LEGACY_TIMER_TICK
+
 endif # COLDFIRE
 
 
diff --git a/arch/m68k/coldfire/Makefile b/arch/m68k/coldfire/Makefile
index 573eabca1a3a..a3e18d73d8b8 100644
--- a/arch/m68k/coldfire/Makefile
+++ b/arch/m68k/coldfire/Makefile
@@ -16,20 +16,24 @@
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
 obj-$(CONFIG_COLDFIRE)	+= cache.o clk.o device.o dma.o entry.o vectors.o
-obj-$(CONFIG_M5206)	+= m5206.o timers.o intc.o reset.o
-obj-$(CONFIG_M5206e)	+= m5206.o timers.o intc.o reset.o
-obj-$(CONFIG_M520x)	+= m520x.o pit.o intc-simr.o reset.o
-obj-$(CONFIG_M523x)	+= m523x.o pit.o dma_timer.o intc-2.o reset.o
-obj-$(CONFIG_M5249)	+= m5249.o timers.o intc.o intc-5249.o reset.o
-obj-$(CONFIG_M525x)	+= m525x.o timers.o intc.o intc-525x.o reset.o
-obj-$(CONFIG_M527x)	+= m527x.o pit.o intc-2.o reset.o
-obj-$(CONFIG_M5272)	+= m5272.o intc-5272.o timers.o
-obj-$(CONFIG_M528x)	+= m528x.o pit.o intc-2.o reset.o
-obj-$(CONFIG_M5307)	+= m5307.o timers.o intc.o reset.o
-obj-$(CONFIG_M53xx)	+= m53xx.o timers.o intc-simr.o reset.o
-obj-$(CONFIG_M5407)	+= m5407.o timers.o intc.o reset.o
-obj-$(CONFIG_M54xx)	+= m54xx.o sltimers.o intc-2.o
-obj-$(CONFIG_M5441x)	+= m5441x.o pit.o intc-simr.o reset.o
+obj-$(CONFIG_M5206)	+= m5206.o intc.o reset.o
+obj-$(CONFIG_M5206e)	+= m5206.o intc.o reset.o
+obj-$(CONFIG_M520x)	+= m520x.o intc-simr.o reset.o
+obj-$(CONFIG_M523x)	+= m523x.o dma_timer.o intc-2.o reset.o
+obj-$(CONFIG_M5249)	+= m5249.o intc.o intc-5249.o reset.o
+obj-$(CONFIG_M525x)	+= m525x.o intc.o intc-525x.o reset.o
+obj-$(CONFIG_M527x)	+= m527x.o intc-2.o reset.o
+obj-$(CONFIG_M5272)	+= m5272.o intc-5272.o
+obj-$(CONFIG_M528x)	+= m528x.o intc-2.o reset.o
+obj-$(CONFIG_M5307)	+= m5307.o intc.o reset.o
+obj-$(CONFIG_M53xx)	+= m53xx.o intc-simr.o reset.o
+obj-$(CONFIG_M5407)	+= m5407.o intc.o reset.o
+obj-$(CONFIG_M54xx)	+= m54xx.o intc-2.o
+obj-$(CONFIG_M5441x)	+= m5441x.o intc-simr.o reset.o
+
+obj-$(CONFIG_COLDFIRE_PIT_TIMER) += pit.o
+obj-$(CONFIG_COLDFIRE_TIMERS)	 += timers.o
+obj-$(CONFIG_COLDFIRE_SLTIMERS)	 += sltimers.o
 
 obj-$(CONFIG_NETtel)	+= nettel.o
 obj-$(CONFIG_CLEOPATRA)	+= nettel.o
diff --git a/arch/m68k/coldfire/sltimers.c b/arch/m68k/coldfire/sltimers.c
index 5ab81c9c552d..25a1319f3cb8 100644
--- a/arch/m68k/coldfire/sltimers.c
+++ b/arch/m68k/coldfire/sltimers.c
@@ -83,14 +83,13 @@ void mcfslt_profile_init(void)
 static u32 mcfslt_cycles_per_jiffy;
 static u32 mcfslt_cnt;
 
-static irq_handler_t timer_interrupt;
-
 static irqreturn_t mcfslt_tick(int irq, void *dummy)
 {
 	/* Reset Slice Timer 0 */
 	__raw_writel(MCFSLT_SSR_BE | MCFSLT_SSR_TE, TA(MCFSLT_SSR));
 	mcfslt_cnt += mcfslt_cycles_per_jiffy;
-	return timer_interrupt(irq, dummy);
+	legacy_timer_tick(1);
+	return IRQ_HANDLED;
 }
 
 static u64 mcfslt_read_clk(struct clocksource *cs)
@@ -136,7 +135,6 @@ void hw_timer_init(irq_handler_t handler)
 	/* initialize mcfslt_cnt knowing that slice timers count down */
 	mcfslt_cnt = mcfslt_cycles_per_jiffy;
 
-	timer_interrupt = handler;
 	r = request_irq(MCF_IRQ_TIMER, mcfslt_tick, IRQF_TIMER, "timer", NULL);
 	if (r) {
 		pr_err("Failed to request irq %d (timer): %pe\n", MCF_IRQ_TIMER,
diff --git a/arch/m68k/coldfire/timers.c b/arch/m68k/coldfire/timers.c
index b8301fddf901..24b5e2d1b00b 100644
--- a/arch/m68k/coldfire/timers.c
+++ b/arch/m68k/coldfire/timers.c
@@ -48,8 +48,6 @@ void coldfire_profile_init(void);
 static u32 mcftmr_cycles_per_jiffy;
 static u32 mcftmr_cnt;
 
-static irq_handler_t timer_interrupt;
-
 /***************************************************************************/
 
 static void init_timer_irq(void)
@@ -77,7 +75,8 @@ static irqreturn_t mcftmr_tick(int irq, void *dummy)
 	__raw_writeb(MCFTIMER_TER_CAP | MCFTIMER_TER_REF, TA(MCFTIMER_TER));
 
 	mcftmr_cnt += mcftmr_cycles_per_jiffy;
-	return timer_interrupt(irq, dummy);
+	legacy_timer_tick(1);
+	return IRQ_HANDLED;
 }
 
 /***************************************************************************/
@@ -126,7 +125,6 @@ void hw_timer_init(irq_handler_t handler)
 
 	clocksource_register_hz(&mcftmr_clk, FREQ);
 
-	timer_interrupt = handler;
 	init_timer_irq();
 	r = request_irq(MCF_IRQ_TIMER, mcftmr_tick, IRQF_TIMER, "timer", NULL);
 	if (r) {
-- 
2.27.0


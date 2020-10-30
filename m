Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B902A0994
	for <lists+linux-parisc@lfdr.de>; Fri, 30 Oct 2020 16:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgJ3PUr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 30 Oct 2020 11:20:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:52708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726674AbgJ3PUB (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 30 Oct 2020 11:20:01 -0400
Received: from localhost.localdomain (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D39820756;
        Fri, 30 Oct 2020 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604071127;
        bh=iDfeVQLWc0H76d65dMCO1CjztYPtBiAdqFL9uiIlkxA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jhb1OIn10HVnUycRJeZeUqhvjqY7b4mZX550t1143M1pIBYLmQQr0nzbiZElXNTXc
         bYTQ0X2dUf+nNTz58NXmdjsqCiSPXs5uSCmOEw7151a70EDxo3by7tfJNhBu9i2yER
         0eNneQ49BRZzFLRnGlBHU9e+toxVifn5GrJivi9I=
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
Subject: [PATCH v2 06/15] ARM: rpc: use legacy_timer_tick
Date:   Fri, 30 Oct 2020 16:17:49 +0100
Message-Id: <20201030151758.1241164-7-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201030151758.1241164-1-arnd@kernel.org>
References: <20201030151758.1241164-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

rpc is the only user of the timer_tick() function now, and can
just call the newly added generic version instead.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                 |  1 +
 arch/arm/include/asm/mach/time.h |  2 --
 arch/arm/kernel/time.c           | 14 --------------
 arch/arm/mach-rpc/time.c         |  2 +-
 4 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 1b9fda08b92f..dbadfa186f72 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -452,6 +452,7 @@ config ARCH_RPC
 	select HAVE_IDE
 	select HAVE_PATA_PLATFORM
 	select ISA_DMA_API
+	select LEGACY_TIMER_TICK
 	select NEED_MACH_IO_H
 	select NEED_MACH_MEMORY_H
 	select NO_IOPORT_MAP
diff --git a/arch/arm/include/asm/mach/time.h b/arch/arm/include/asm/mach/time.h
index d75d39280db7..5f522916ec99 100644
--- a/arch/arm/include/asm/mach/time.h
+++ b/arch/arm/include/asm/mach/time.h
@@ -7,8 +7,6 @@
 #ifndef __ASM_ARM_MACH_TIME_H
 #define __ASM_ARM_MACH_TIME_H
 
-extern void timer_tick(void);
-
 typedef void (*clock_access_fn)(struct timespec64 *);
 extern int register_persistent_clock(clock_access_fn read_persistent);
 
diff --git a/arch/arm/kernel/time.c b/arch/arm/kernel/time.c
index 09b149b09c43..b3836c94dc74 100644
--- a/arch/arm/kernel/time.c
+++ b/arch/arm/kernel/time.c
@@ -60,20 +60,6 @@ unsigned long profile_pc(struct pt_regs *regs)
 EXPORT_SYMBOL(profile_pc);
 #endif
 
-#ifndef CONFIG_GENERIC_CLOCKEVENTS
-/*
- * Kernel system timer support.
- */
-void timer_tick(void)
-{
-	profile_tick(CPU_PROFILING);
-	xtime_update(1);
-#ifndef CONFIG_SMP
-	update_process_times(user_mode(get_irq_regs()));
-#endif
-}
-#endif
-
 static void dummy_clock_access(struct timespec64 *ts)
 {
 	ts->tv_sec = 0;
diff --git a/arch/arm/mach-rpc/time.c b/arch/arm/mach-rpc/time.c
index da85cac761ba..9f8edcfe9357 100644
--- a/arch/arm/mach-rpc/time.c
+++ b/arch/arm/mach-rpc/time.c
@@ -81,7 +81,7 @@ static irqreturn_t
 ioc_timer_interrupt(int irq, void *dev_id)
 {
 	ioc_time += RPC_LATCH;
-	timer_tick();
+	legacy_timer_tick(1);
 	return IRQ_HANDLED;
 }
 
-- 
2.27.0


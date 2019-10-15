Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32696D8000
	for <lists+linux-parisc@lfdr.de>; Tue, 15 Oct 2019 21:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389394AbfJOTUf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 15 Oct 2019 15:20:35 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:45647 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389374AbfJOTSl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 15 Oct 2019 15:18:41 -0400
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
        by Galois.linutronix.de with esmtp (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1iKSL7-00067i-HB; Tue, 15 Oct 2019 21:18:37 +0200
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     linux-kernel@vger.kernel.org
Cc:     tglx@linutronix.de,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 15/34] parisc: Use CONFIG_PREEMPTION
Date:   Tue, 15 Oct 2019 21:18:02 +0200
Message-Id: <20191015191821.11479-16-bigeasy@linutronix.de>
In-Reply-To: <20191015191821.11479-1-bigeasy@linutronix.de>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Thomas Gleixner <tglx@linutronix.de>

CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
Both PREEMPT and PREEMPT_RT require the same functionality which today
depends on CONFIG_PREEMPT.

Switch the entry code over to use CONFIG_PREEMPTION.

Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
[bigeasy: +Kconfig]
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/parisc/Kconfig        |  2 +-
 arch/parisc/kernel/entry.S | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index b16237c95ea33..593e4014cef84 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -81,7 +81,7 @@ config STACK_GROWSUP
 config GENERIC_LOCKBREAK
 	bool
 	default y
-	depends on SMP && PREEMPT
+	depends on SMP && PREEMPTION
=20
 config ARCH_HAS_ILOG2_U32
 	bool
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 1d1d748c227f0..de212948de74e 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -940,14 +940,14 @@ ENTRY(intr_return)
 	rfi
 	nop
=20
-#ifndef CONFIG_PREEMPT
+#ifndef CONFIG_PREEMPTION
 # define intr_do_preempt	intr_restore
-#endif /* !CONFIG_PREEMPT */
+#endif /* !CONFIG_PREEMPTION */
=20
 	.import schedule,code
 intr_do_resched:
 	/* Only call schedule on return to userspace. If we're returning
-	 * to kernel space, we may schedule if CONFIG_PREEMPT, otherwise
+	 * to kernel space, we may schedule if CONFIG_PREEMPTION, otherwise
 	 * we jump back to intr_restore.
 	 */
 	LDREG	PT_IASQ0(%r16), %r20
@@ -979,7 +979,7 @@ ENTRY(intr_return)
 	 * and preempt_count is 0. otherwise, we continue on
 	 * our merry way back to the current running task.
 	 */
-#ifdef CONFIG_PREEMPT
+#ifdef CONFIG_PREEMPTION
 	.import preempt_schedule_irq,code
 intr_do_preempt:
 	rsm	PSW_SM_I, %r0		/* disable interrupts */
@@ -999,7 +999,7 @@ ENTRY(intr_return)
 	nop
=20
 	b,n	intr_restore		/* ssm PSW_SM_I done by intr_restore */
-#endif /* CONFIG_PREEMPT */
+#endif /* CONFIG_PREEMPTION */
=20
 	/*
 	 * External interrupts.
--=20
2.23.0


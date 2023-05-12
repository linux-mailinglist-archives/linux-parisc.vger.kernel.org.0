Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201F7701086
	for <lists+linux-parisc@lfdr.de>; Fri, 12 May 2023 23:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240321AbjELVJh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 12 May 2023 17:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239952AbjELVI2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 12 May 2023 17:08:28 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1BE100E1;
        Fri, 12 May 2023 14:07:49 -0700 (PDT)
Message-ID: <20230512205256.972894276@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1683925662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         references:references; bh=nzItUYys+FxnFlxHRSRwXNvBFw4/RHjBPySjAIg1FA0=;
        b=HFAJV0pMQwfu/4+GAhQLuXhpUO6abQd4y85mbgjAss6mqH/BExmc6AKeRMkuLpdoxhLinj
        NBMK7Ra2vav1RTE5mzIkDgtLQvIZiWXsjGTWMWD3X/NXyy3ID7jD6oi/PGdhpAjN0b4CZQ
        6IMLg3BcGBtrqbRHE3Td3hMjnCGGjMUZew8rgNfnNgQ+oeJaUqITgff3tJlFeEUzOnnv+R
        Fjr1+md7ekwb9fGi39VcdH3yTLAztWBmY3Yv4ndK172fdqfHvHqzXeEqjzim8ZrnuECBT9
        6bomIHXV7BUv75NlLf7B9z3kwvgz12t7LUL/w3aX0Wd0Yv0nG39/k2Y0dX/XYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1683925662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         references:references; bh=nzItUYys+FxnFlxHRSRwXNvBFw4/RHjBPySjAIg1FA0=;
        b=eK6tV6hlAQaheu95GgdL2hUtApcdcJITHelzRXs0n6MnF+U01Souw/mHmLrDCW7jivSlgK
        RTZIurVUzouaTZAQ==
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     x86@kernel.org, David Woodhouse <dwmw2@infradead.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Brian Gerst <brgerst@gmail.com>,
        Arjan van de Veen <arjan@linux.intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul McKenney <paulmck@kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Sean Christopherson <seanjc@google.com>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>,
        Usama Arif <usama.arif@bytedance.com>,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Sabin Rapan <sabrapan@amazon.com>,
        "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
        Ross Philipson <ross.philipson@oracle.com>
Subject: [patch V4 28/37] cpu/hotplug: Remove unused state functions
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 12 May 2023 23:07:41 +0200 (CEST)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Thomas Gleixner <tglx@linutronix.de>

All users converted to the hotplug core mechanism.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 include/linux/cpu.h |    2 -
 kernel/smpboot.c    |   75 ----------------------------------------------------
 2 files changed, 77 deletions(-)


--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -193,8 +193,6 @@ static inline void play_idle(unsigned lo
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-bool cpu_wait_death(unsigned int cpu, int seconds);
-bool cpu_report_death(void);
 void cpuhp_report_idle_dead(void);
 #else
 static inline void cpuhp_report_idle_dead(void) { }
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -325,78 +325,3 @@ void smpboot_unregister_percpu_thread(st
 	cpus_read_unlock();
 }
 EXPORT_SYMBOL_GPL(smpboot_unregister_percpu_thread);
-
-#ifndef CONFIG_HOTPLUG_CORE_SYNC
-static DEFINE_PER_CPU(atomic_t, cpu_hotplug_state) = ATOMIC_INIT(CPU_POST_DEAD);
-
-#ifdef CONFIG_HOTPLUG_CPU
-/*
- * Wait for the specified CPU to exit the idle loop and die.
- */
-bool cpu_wait_death(unsigned int cpu, int seconds)
-{
-	int jf_left = seconds * HZ;
-	int oldstate;
-	bool ret = true;
-	int sleep_jf = 1;
-
-	might_sleep();
-
-	/* The outgoing CPU will normally get done quite quickly. */
-	if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
-		goto update_state_early;
-	udelay(5);
-
-	/* But if the outgoing CPU dawdles, wait increasingly long times. */
-	while (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) != CPU_DEAD) {
-		schedule_timeout_uninterruptible(sleep_jf);
-		jf_left -= sleep_jf;
-		if (jf_left <= 0)
-			break;
-		sleep_jf = DIV_ROUND_UP(sleep_jf * 11, 10);
-	}
-update_state_early:
-	oldstate = atomic_read(&per_cpu(cpu_hotplug_state, cpu));
-update_state:
-	if (oldstate == CPU_DEAD) {
-		/* Outgoing CPU died normally, update state. */
-		smp_mb(); /* atomic_read() before update. */
-		atomic_set(&per_cpu(cpu_hotplug_state, cpu), CPU_POST_DEAD);
-	} else {
-		/* Outgoing CPU still hasn't died, set state accordingly. */
-		if (!atomic_try_cmpxchg(&per_cpu(cpu_hotplug_state, cpu),
-					&oldstate, CPU_BROKEN))
-			goto update_state;
-		ret = false;
-	}
-	return ret;
-}
-
-/*
- * Called by the outgoing CPU to report its successful death.  Return
- * false if this report follows the surviving CPU's timing out.
- *
- * A separate "CPU_DEAD_FROZEN" is used when the surviving CPU
- * timed out.  This approach allows architectures to omit calls to
- * cpu_check_up_prepare() and cpu_set_state_online() without defeating
- * the next cpu_wait_death()'s polling loop.
- */
-bool cpu_report_death(void)
-{
-	int oldstate;
-	int newstate;
-	int cpu = smp_processor_id();
-
-	oldstate = atomic_read(&per_cpu(cpu_hotplug_state, cpu));
-	do {
-		if (oldstate != CPU_BROKEN)
-			newstate = CPU_DEAD;
-		else
-			newstate = CPU_DEAD_FROZEN;
-	} while (!atomic_try_cmpxchg(&per_cpu(cpu_hotplug_state, cpu),
-				     &oldstate, newstate));
-	return newstate == CPU_DEAD;
-}
-
-#endif /* #ifdef CONFIG_HOTPLUG_CPU */
-#endif /* !CONFIG_HOTPLUG_CORE_SYNC */




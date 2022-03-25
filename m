Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 006204E752E
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353013AbiCYOkU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359345AbiCYOkR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:17 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2F5972ED
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219116;
        bh=VeXH08U6o9RgNfldRtp2u1AmoHAErZ1QgI99hc7Lxd4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ixBkg8a01Qa8QJcF8zqDVFnZ3b2DYB+Q5HCI2omTIKmPhKDDdYAryQyPaykaFg6EL
         D5KlSx8Z4QHlJRoLbMK3GSRr231DESMPFUd5VC6SV5waxHPzO0igLQ9ZjGXjjM6OgD
         b0MuwASLnkw3EnLlKJ0dqfhaA0ZKRcV6rRmay6RI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTNF-1njV2v079B-00NRLG; Fri, 25
 Mar 2022 15:38:36 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 12/12] parisc: Implement __cpu_die() and __cpu_disable() for CPU hotplugging
Date:   Fri, 25 Mar 2022 15:38:33 +0100
Message-Id: <20220325143833.402631-12-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XDywusJ0V1cHWLP1BMVEsjCYvhcfaOEq1Yq4YBninT++W1r6dMG
 BScOzHo0G9BHFYTx3sCxveZyMkUCTgokKWvbGsjjoMNW8rwBTxBQLYrFzSChpFvXU6tpHA/
 TG0GReI0Ls8vJSptxm/9i2uTx7YcdQGHrJCWfPWwhLQlLunwgs027rRC/D/zIX0bgiMP/Ql
 Zqqu5xEEVaBvbRnoMcn0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FeNlkaIqG9c=:3Y+5rLGqtPq9Wyf7C1lG1F
 HBwB/d1Wgh9KpRNLJifCj9VHSfJgQ83e1QmSZanSIOLcEFyKRGQ0R7r9W1P2BEwJ6DAfL5U/w
 9pWy3t1uYmmFbbECCHWkV7ssXCb94y+1lOmN7SUBVLmA/X1Bb1raTiLAKygfDvHFC82K3Qo4V
 9joLYB4Uu9ZdLonYGS4g1B9QomwwMNYdfy1UVz3DclV+5rjFyiFElIsf/syExh3t/2ExcidXk
 JRDiMeSbtUW1SdBW7EXcFRPf0nurbwFVQiUzdNad8QMFoRTYVBv1UBVmvmZYkBgERrJe/xmyF
 5qadufwGUmpTHa9tUyvtOBYKsdjWbffgcLIwqwC9k7d9JHeDTdO3WmA+DKarrnPZgejzlMFjU
 FKvM06g19ws91F/zX9h7ARsBVcIY6gaRQkpdCGwXcvgyBMWq1dKHHQYwAhLg6fT3W7bQ/VY2W
 dSKMB1VTO+Axcbf8tH2pUmpndwbvdEUIeLBv5jlks8EoOXlRBXm7bZy6Dfxon1JwGYXX3EvCG
 HE7BEPecYbBLFPrmya6y5HrjNp5RnigaUXIxbkGEIGaX6czWAofzm/Jiwerau+TuOaXk1trTz
 8m8M+EyCyFZVUG9yVhSy6v4dPqgXTuqH2YKBwkEnTFgubCxmFXnJVST+/nD5+VR8PcevijKHm
 sOMJbuN9Kb9wdH3S8CYDqGQsZCXBCLCo6QxVMYpzQrEK29M+myjODLSGod3wLDSTo+PZ1+Tgz
 R608cHE4B06XrjOdR3HrVHKVwfAyiV6djSIZGRH1CIhEuy8C1TJAU3RyRpEKmUPDlA5AmupRR
 IaaPCkf2lzxlxAjF9PXkyxCQWb0FHntC3vXzsd05KOsNF0z+m6WxLkSCy40oVT36ON0gnwYAy
 5TUGpOmwY+QT/kVGMfnLl7FuAkYuep008L4zrSroTLrt5zwsaIcLmHzhBPuEe40eqoK08g0Tt
 LmvtwSthoi2e0dSntayLJZudOdb3hIcKO1A7QbF05gQw7UIiuTWG6nMujGpqUNwstdG8gs3VV
 95zAboBH6AD65c9SwkagfYVaR7cylWDIlKA5EiVfaLvS0EYysrJmbEV/WQmT2D6G3H1SYnQJk
 8Cvy+fI0mc7qFo=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add relevant code to __cpu_die() and __cpu_disable() to finally enable
the CPU hotplugging features. Reset the irq count values in smp_callin()
to zero before bringing up the CPU.

Use "chcpu -d 1" to bring CPU1 down, and "chcpu -e 1" to bring it up.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Kconfig           |  1 +
 arch/parisc/include/asm/smp.h |  9 +---
 arch/parisc/kernel/smp.c      | 80 +++++++++++++++++++++++++++++++++--
 3 files changed, 79 insertions(+), 11 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 6bd42c82a019..ec5bb9626d06 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -56,6 +56,7 @@ config PARISC
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select GENERIC_SCHED_CLOCK
+	select GENERIC_IRQ_MIGRATION
 	select HAVE_UNSTABLE_SCHED_CLOCK if SMP
 	select LEGACY_TIMER_TICK
 	select CPU_NO_EFFICIENT_FFS
diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/smp.h
index 2279ebe5e2da..94d1f21ce99a 100644
=2D-- a/arch/parisc/include/asm/smp.h
+++ b/arch/parisc/include/asm/smp.h
@@ -44,12 +44,7 @@ static inline void smp_send_all_nop(void) { return; }

 #define NO_PROC_ID		0xFF		/* No processor magic marker */
 #define ANY_PROC_ID		0xFF		/* Any processor magic marker */
-static inline int __cpu_disable (void) {
-  return 0;
-}
-static inline void __cpu_die (unsigned int cpu) {
-  while(1)
-    ;
-}
+int __cpu_disable(void);
+void __cpu_die(unsigned int cpu);

 #endif /*  __ASM_SMP_H */
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index a32a882a2d58..60cc33fd345c 100644
=2D-- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -30,6 +30,7 @@
 #include <linux/ftrace.h>
 #include <linux/cpu.h>
 #include <linux/kgdb.h>
+#include <linux/sched/hotplug.h>

 #include <linux/atomic.h>
 #include <asm/current.h>
@@ -309,7 +310,7 @@ smp_cpu_init(int cpunum)
  * Slaves start using C here. Indirectly called from smp_slave_stext.
  * Do what start_kernel() and main() do for boot strap processor (aka mon=
arch)
  */
-void __init smp_callin(unsigned long pdce_proc)
+void __cpuinit smp_callin(unsigned long pdce_proc)
 {
 	int slave_id =3D cpu_now_booting;

@@ -339,6 +340,19 @@ int smp_boot_one_cpu(int cpuid, struct task_struct *i=
dle)
 	const struct cpuinfo_parisc *p =3D &per_cpu(cpu_data, cpuid);
 	long timeout;

+#ifdef CONFIG_HOTPLUG_CPU
+	int i;
+
+	/* reset irq statistics for this CPU */
+	memset(&per_cpu(irq_stat, cpuid), 0, sizeof(irq_cpustat_t));
+	for (i =3D 0; i < NR_IRQS; i++) {
+		struct irq_desc *desc =3D irq_to_desc(i);
+
+		if (desc && desc->kstat_irqs)
+			*per_cpu_ptr(desc->kstat_irqs, cpuid) =3D 0;
+	}
+#endif
+
 	/* Let _start know what logical CPU we're booting
 	** (offset into init_tasks[],cpu_data[])
 	*/
@@ -430,10 +444,68 @@ void smp_cpus_done(unsigned int cpu_max)

 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
-	if (cpu !=3D 0 && cpu < parisc_max_cpus && smp_boot_one_cpu(cpu, tidle))
-		return -ENOSYS;
+	if (cpu_online(cpu))
+		return 0;
+
+	if (num_online_cpus() < parisc_max_cpus && smp_boot_one_cpu(cpu, tidle))
+		return -EIO;
+
+	return cpu_online(cpu) ? 0 : -EIO;
+}
+
+/*
+ * __cpu_disable runs on the processor to be shutdown.
+ */
+int __cpu_disable(void)
+{
+#ifdef CONFIG_HOTPLUG_CPU
+	unsigned int cpu =3D smp_processor_id();
+
+	remove_cpu_topology(cpu);
+
+	/*
+	 * Take this CPU offline.  Once we clear this, we can't return,
+	 * and we must not schedule until we're ready to give up the cpu.
+	 */
+	set_cpu_online(cpu, false);
+
+	/*
+	 * disable IPI interrupt
+	 */
+	disable_percpu_irq(IPI_IRQ);
+
+	/*
+	 * migrate IRQs away from this CPU
+	 */
+	irq_migrate_all_off_this_cpu();
+
+	/*
+	 * Flush user cache and TLB mappings, and then remove this CPU
+	 * from the vm mask set of all processes.
+	 *
+	 * Caches are flushed to the Level of Unification Inner Shareable
+	 * to write-back dirty lines to unified caches shared by all CPUs.
+	 */
+	flush_cache_all_local();
+	flush_tlb_all_local(NULL);

-	return cpu_online(cpu) ? 0 : -ENOSYS;
+	/* disable all irqs, including timer irq */
+	local_irq_disable();
+#endif
+	return 0;
+}
+
+/*
+ * called on the thread which is asking for a CPU to be shutdown -
+ * waits until shutdown has completed, or it is timed out.
+ */
+void __cpu_die(unsigned int cpu)
+{
+	if (!cpu_wait_death(cpu, 5)) {
+		pr_crit("CPU%u: cpu didn't die\n", cpu);
+		return;
+	}
+	pr_debug("CPU%u: shutdown\n", cpu);
 }

 #ifdef CONFIG_PROC_FS
=2D-
2.35.1


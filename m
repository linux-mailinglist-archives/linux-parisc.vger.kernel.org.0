Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30634539154
	for <lists+linux-parisc@lfdr.de>; Tue, 31 May 2022 15:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344516AbiEaNF4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 31 May 2022 09:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbiEaNFu (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 31 May 2022 09:05:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3B6887207
        for <linux-parisc@vger.kernel.org>; Tue, 31 May 2022 06:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654002347;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CbC6MKPQNrWLf7dTh3IFCGP7HHEApD//3Q3OSEjYYBk=;
        b=XTwTevqekQDjZp5/P0mTphlLtjgtpdKt0RRJzglFWunwpjJHrZNzt+ByDg5dqnkMhLrjEI
        wgJMAImGSlJSLNXS0SJmN3r0QrkwsqR3X3wcN9/sTW1bHIxoQrwB26bLssFxFi2wmjx2IJ
        Cy3Li9gHrALhT016bW8RbonQSVVZZyg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-7TBA0K6sPVuHjZbLg5JwCA-1; Tue, 31 May 2022 09:05:44 -0400
X-MC-Unique: 7TBA0K6sPVuHjZbLg5JwCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79B67100F84A;
        Tue, 31 May 2022 13:05:44 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E2AB40CF8ED;
        Tue, 31 May 2022 13:05:44 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 24VD5iUF018182;
        Tue, 31 May 2022 09:05:44 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 24VD5iTs018178;
        Tue, 31 May 2022 09:05:44 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Tue, 31 May 2022 09:05:44 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: Re: non-booting kernel caused by "parisc: Switch from GENERIC_CPU_DEVICES
 to GENERIC_ARCH_TOPOLOGY"
In-Reply-To: <4dcb485a-d0ae-9c49-5bd2-43327e930ee5@gmx.de>
Message-ID: <alpine.LRH.2.02.2205310832260.16547@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2205310542460.5691@file01.intranet.prod.int.rdu2.redhat.com> <4dcb485a-d0ae-9c49-5bd2-43327e930ee5@gmx.de>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Tue, 31 May 2022, Helge Deller wrote:

> Hello Mikulas,
> 
> On 5/31/22 12:43, Mikulas Patocka wrote:
> > The kernel 5.18 doesn't boot on my C8000 with two dual-core CPUs. It hangs
> > at this point:
> >
> > [    0.000000] NR_IRQS: 80
> > [    0.000002] sched_clock: 64 bits at 1000MHz, resolution 1ns, wraps every 4398046511103ns
> > [    0.107049] Console: colour dummy device 160x64
> > [    0.166791] Calibrating delay loop... 1991.60 BogoMIPS (lpj=3317760)
> > [    0.270079] pid_max: default: 32768 minimum: 301
> > [    0.330158] random: get_random_bytes called from net_ns_init+0x118/0x4c8 with crng_init=0
> > [    0.330394] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
> > [    0.536892] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
> > [    0.644729] cblist_init_generic: Setting adjustable number of callback queues.
> > [    0.740083] cblist_init_generic: Setting shift to 2 and lim to 1.
> > [    0.820179] TOC handler registered
> > [    0.866852] rcu: Hierarchical SRCU implementation.
> > [    0.930550] smp: Bringing up secondary CPUs ...
> > [    0.990084] smp: Brought up 1 node, 1 CPU
> >
> > I bisected it and it is caused by the commit
> > 62773112acc55d29727465d075fc61ed08a0a532 ("parisc: Switch from
> > GENERIC_CPU_DEVICES to GENERIC_ARCH_TOPOLOGY")
> >
> > When I revert this patch on the kernel 5.18 (and resolve several
> > conflcits), the kernel boots.
> 
> You are really sure that you test v5.18-final, right?

Yes.

> If not there were multiple hickups during the -rc phases of v5.18, and
> bisecting through the -rc versions won't help much because we had multiple
> issues which conflicted with each other and prevented a boot.

I hit some crashes when running userspace when bisecting, but I bisected 
them as "good" and I only bisected the hang at "smp: Brought up 1 node, 1 
CPU" as "bad". And bisect showed the faulty commit - reverting that commit 
makes the kernel bool.

> But those should have been resolved with my "for-5.18/parisc-3" push, which e.g.
> partly re-enabled GENERIC_CPU_DEVICES:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f002488d80b557c7dc540457b176011449895fcb
> Esp. this commit ("Re-enable GENERIC_CPU_DEVICES for !SMP") fixed it for non-SMP:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1955c4f879a130c7822f483cf593338ad747aed4

These commits are already present in 5.18. They don't fix the hang.

> So, right now I'm somehow lost how I can help.

If you don't know what causes it, I can try to add some debug printks into 
the kernel and analyze it when I have time.

> You could you send me your .config, then I'll check locally.
> Please also try a "make oldconfig" with your .config so that the options don't have any leftovers.

I uploaded my config here: 
https://people.redhat.com/~mpatocka/testcases/parisc-config-5.18.txt

> Helge

This is quick-and-dirty revert of the patch 
62773112acc55d29727465d075fc61ed08a0a532. When it is applied on 5.18, the 
kernel boots fine. I don't intend to try to push this into the kernel, but 
it may help with debugging the problem.

Mikulas



---
 arch/parisc/Kconfig                |   11 ++++-
 arch/parisc/include/asm/topology.h |   23 ++++++++++-
 arch/parisc/kernel/Makefile        |    2 -
 arch/parisc/kernel/processor.c     |    5 --
 arch/parisc/kernel/smp.c           |    2 -
 arch/parisc/kernel/topology.c      |   72 +++++++++++++++++++++++++++++--------
 6 files changed, 89 insertions(+), 26 deletions(-)

Index: linux-5.18.1/arch/parisc/Kconfig
===================================================================
--- linux-5.18.1.orig/arch/parisc/Kconfig	2022-05-31 12:12:11.000000000 +0200
+++ linux-5.18.1/arch/parisc/Kconfig	2022-05-31 12:12:11.000000000 +0200
@@ -37,7 +37,7 @@ config PARISC
 	select GENERIC_PCI_IOMAP
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select GENERIC_SMP_IDLE_THREAD
-	select GENERIC_ARCH_TOPOLOGY if SMP
+	select GENERIC_CPU_DEVICES
 	select GENERIC_CPU_DEVICES if !SMP
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select SYSCTL_ARCH_UNALIGN_ALLOW
@@ -281,9 +281,16 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
+config PARISC_CPU_TOPOLOGY
+	bool "Support cpu topology definition"
+	depends on SMP
+	default y
+	help
+	  Support PARISC cpu topology definition.
+
 config SCHED_MC
 	bool "Multi-core scheduler support"
-	depends on GENERIC_ARCH_TOPOLOGY && PA8X00
+	depends on PARISC_CPU_TOPOLOGY && PA8X00
 	help
 	  Multi-core scheduler support improves the CPU scheduler's decision
 	  making when dealing with multi-core CPU chips at a cost of slightly
Index: linux-5.18.1/arch/parisc/include/asm/topology.h
===================================================================
--- linux-5.18.1.orig/arch/parisc/include/asm/topology.h	2022-05-31 12:12:11.000000000 +0200
+++ linux-5.18.1/arch/parisc/include/asm/topology.h	2022-05-31 12:12:11.000000000 +0200
@@ -1,16 +1,33 @@
 #ifndef _ASM_PARISC_TOPOLOGY_H
 #define _ASM_PARISC_TOPOLOGY_H
 
-#ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
+#ifdef CONFIG_PARISC_CPU_TOPOLOGY
 
 #include <linux/cpumask.h>
-#include <linux/arch_topology.h>
+
+struct cputopo_parisc {
+	int thread_id;
+	int core_id;
+	int socket_id;
+	cpumask_t thread_sibling;
+	cpumask_t core_sibling;
+};
+
+extern struct cputopo_parisc cpu_topology[NR_CPUS];
+
+#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
+#define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
+#define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
+#define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
+
+void init_cpu_topology(void);
+void store_cpu_topology(unsigned int cpuid);
+const struct cpumask *cpu_coregroup_mask(int cpu);
 
 #else
 
 static inline void init_cpu_topology(void) { }
 static inline void store_cpu_topology(unsigned int cpuid) { }
-static inline void reset_cpu_topology(void) { }
 
 #endif
 
Index: linux-5.18.1/arch/parisc/kernel/Makefile
===================================================================
--- linux-5.18.1.orig/arch/parisc/kernel/Makefile	2022-05-31 12:12:11.000000000 +0200
+++ linux-5.18.1/arch/parisc/kernel/Makefile	2022-05-31 12:12:11.000000000 +0200
@@ -31,7 +31,7 @@ obj-$(CONFIG_AUDIT)	+= audit.o
 obj64-$(CONFIG_AUDIT)	+= compat_audit.o
 # only supported for PCX-W/U in 64-bit mode at the moment
 obj-$(CONFIG_64BIT)	+= perf.o perf_asm.o $(obj64-y)
-obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY)	+= topology.o
+obj-$(CONFIG_PARISC_CPU_TOPOLOGY)	+= topology.o
 obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
 obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
Index: linux-5.18.1/arch/parisc/kernel/processor.c
===================================================================
--- linux-5.18.1.orig/arch/parisc/kernel/processor.c	2022-05-31 12:12:11.000000000 +0200
+++ linux-5.18.1/arch/parisc/kernel/processor.c	2022-05-31 12:12:11.000000000 +0200
@@ -19,7 +19,6 @@
 #include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/cpu.h>
-#include <asm/topology.h>
 #include <asm/param.h>
 #include <asm/cache.h>
 #include <asm/hardware.h>	/* for register_parisc_driver() stuff */
@@ -392,7 +391,7 @@ show_cpuinfo (struct seq_file *m, void *
 				 boot_cpu_data.cpu_hz / 1000000,
 				 boot_cpu_data.cpu_hz % 1000000  );
 
-#ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
+#ifdef CONFIG_PARISC_CPU_TOPOLOGY
 		seq_printf(m, "physical id\t: %d\n",
 				topology_physical_package_id(cpu));
 		seq_printf(m, "siblings\t: %d\n",
@@ -463,8 +462,6 @@ void __init processor_init(void)
 {
 	unsigned int cpu;
 
-	reset_cpu_topology();
-
 	/* reset possible mask. We will mark those which are possible. */
 	for_each_possible_cpu(cpu)
 		set_cpu_possible(cpu, false);
Index: linux-5.18.1/arch/parisc/kernel/topology.c
===================================================================
--- linux-5.18.1.orig/arch/parisc/kernel/topology.c	2022-05-31 12:12:11.000000000 +0200
+++ linux-5.18.1/arch/parisc/kernel/topology.c	2022-05-31 12:12:11.000000000 +0200
@@ -13,12 +13,46 @@
 #include <linux/percpu.h>
 #include <linux/sched.h>
 #include <linux/sched/topology.h>
-#include <linux/cpu.h>
 
 #include <asm/topology.h>
 #include <asm/sections.h>
 
-static DEFINE_PER_CPU(struct cpu, cpu_devices);
+ /*
+  * cpu topology table
+  */
+struct cputopo_parisc cpu_topology[NR_CPUS] __read_mostly;
+EXPORT_SYMBOL_GPL(cpu_topology);
+
+const struct cpumask *cpu_coregroup_mask(int cpu)
+{
+	return &cpu_topology[cpu].core_sibling;
+}
+
+static void update_siblings_masks(unsigned int cpuid)
+{
+	struct cputopo_parisc *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
+	int cpu;
+
+	/* update core and thread sibling masks */
+	for_each_possible_cpu(cpu) {
+		cpu_topo = &cpu_topology[cpu];
+
+		if (cpuid_topo->socket_id != cpu_topo->socket_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
+		if (cpu != cpuid)
+			cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+		if (cpuid_topo->core_id != cpu_topo->core_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
+		if (cpu != cpuid)
+			cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
+	}
+	smp_wmb();
+}
 
 static int dualcores_found;
 
@@ -29,7 +63,7 @@ static int dualcores_found;
  */
 void store_cpu_topology(unsigned int cpuid)
 {
-	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
+	struct cputopo_parisc *cpuid_topo = &cpu_topology[cpuid];
 	struct cpuinfo_parisc *p;
 	int max_socket = -1;
 	unsigned long cpu;
@@ -38,12 +72,6 @@ void store_cpu_topology(unsigned int cpu
 	if (cpuid_topo->core_id != -1)
 		return;
 
-#ifdef CONFIG_HOTPLUG_CPU
-	per_cpu(cpu_devices, cpuid).hotpluggable = 1;
-#endif
-	if (register_cpu(&per_cpu(cpu_devices, cpuid), cpuid))
-		pr_warn("Failed to register CPU%d device", cpuid);
-
 	/* create cpu topology mapping */
 	cpuid_topo->thread_id = -1;
 	cpuid_topo->core_id = 0;
@@ -59,25 +87,25 @@ void store_cpu_topology(unsigned int cpu
 			cpuid_topo->core_id = cpu_topology[cpu].core_id;
 			if (p->cpu_loc) {
 				cpuid_topo->core_id++;
-				cpuid_topo->package_id = cpu_topology[cpu].package_id;
+				cpuid_topo->socket_id = cpu_topology[cpu].socket_id;
 				dualcores_found = 1;
 				continue;
 			}
 		}
 
-		if (cpuid_topo->package_id == -1)
-			max_socket = max(max_socket, cpu_topology[cpu].package_id);
+		if (cpuid_topo->socket_id == -1)
+			max_socket = max(max_socket, cpu_topology[cpu].socket_id);
 	}
 
-	if (cpuid_topo->package_id == -1)
-		cpuid_topo->package_id = max_socket + 1;
+	if (cpuid_topo->socket_id == -1)
+		cpuid_topo->socket_id = max_socket + 1;
 
 	update_siblings_masks(cpuid);
 
 	pr_info("CPU%u: cpu core %d of socket %d\n",
 		cpuid,
 		cpu_topology[cpuid].core_id,
-		cpu_topology[cpuid].package_id);
+		cpu_topology[cpuid].socket_id);
 }
 
 static struct sched_domain_topology_level parisc_mc_topology[] = {
@@ -95,6 +123,20 @@ static struct sched_domain_topology_leve
  */
 void __init init_cpu_topology(void)
 {
+	unsigned int cpu;
+
+	/* init core mask and capacity */
+	for_each_possible_cpu(cpu) {
+		struct cputopo_parisc *cpu_topo = &(cpu_topology[cpu]);
+
+		cpu_topo->thread_id = -1;
+		cpu_topo->core_id =  -1;
+		cpu_topo->socket_id = -1;
+		cpumask_clear(&cpu_topo->core_sibling);
+		cpumask_clear(&cpu_topo->thread_sibling);
+	}
+	smp_wmb();
+
 	/* Set scheduler topology descriptor */
 	if (dualcores_found)
 		set_sched_topology(parisc_mc_topology);
Index: linux-5.18.1/arch/parisc/kernel/smp.c
===================================================================
--- linux-5.18.1.orig/arch/parisc/kernel/smp.c	2022-05-31 12:12:11.000000000 +0200
+++ linux-5.18.1/arch/parisc/kernel/smp.c	2022-05-31 12:12:11.000000000 +0200
@@ -457,7 +457,7 @@ int __cpu_disable(void)
 #ifdef CONFIG_HOTPLUG_CPU
 	unsigned int cpu = smp_processor_id();
 
-	remove_cpu_topology(cpu);
+	/*remove_cpu_topology(cpu);*/
 
 	/*
 	 * Take this CPU offline.  Once we clear this, we can't return,


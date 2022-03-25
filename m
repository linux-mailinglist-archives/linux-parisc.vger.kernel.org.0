Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 458204E752C
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359346AbiCYOkT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359344AbiCYOkR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:17 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A441972F3
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219114;
        bh=laixUKfNbIs4VhFbXyzNyI0y4Hju3cFq5IT3/sxGdgk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=ZHyab8MqlWyqH1yuz/LkEzYyY2ilcYQ4a3zUQJ3UYhf7e+qIYPeXglhAQMSrBfnst
         m62ZR1azObufOwy9tWoqP/Vg2r4nAzoTBv8yKOHMXWN6INmYXztOSoxf2bX70/LHPP
         CWf8DHnu0+YjwxlAXCz6YIpnU+HnCB1njlsdbWCU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVN6t-1nfhPh1zUt-00SKtc; Fri, 25
 Mar 2022 15:38:34 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 01/12] parisc: Switch from GENERIC_CPU_DEVICES to GENERIC_ARCH_TOPOLOGY
Date:   Fri, 25 Mar 2022 15:38:22 +0100
Message-Id: <20220325143833.402631-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ni75TFiqLQ65YFV0OldjzS9jDANmnXC6Za/yjqS3nuvdb9ZUo2T
 9oli9CoCKE9hCzgFxaJBQFDIuCPqr6yJUKjRniHd5OEDGbQjjtujQaGjQKKPSJjbFAfHuV5
 rYp8lH3654SSSABjVuJUGgdmwi3B7cP6NJ5jYZbnwAG/sHz8mrwe/khnl//FLA6Zyq345Lc
 bwfH+xjfLq3mjT/sOoVQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8ygvNR4shMo=:pl6aR6Fofz9im/4thk+eSP
 Hb/7qJtzz/6yYY5k0M57W8rD6nKjz3CErWlJG7i+xCXIrvTO59d8w2SbjCSS5s7/kKTKTB8Dg
 naRhuajTesmqcU7ARTHngqtX3VxH49U0XbNLNViYXUc6oHT1ECqxnkk8x3LYOWPcg6su3HHI8
 9CbZoJe1rOXcoafx4IX8vjc7D97XDxpYlzUs8EjTHxThG7zYDHADfE74IJEzTiuyLCm1DONVG
 oYw8hJ91s+aqTPCGbpwXYYF5YtdQ2Z80pwkzEAOMWPPBEXi4xbf1XP82wq7xLTu7YTJZoIM8z
 1SFvuBCNONVCClwK2xrCtYzPJzP2oOY6ctvta6BCimo2XGWLVH7N1XUUo1dMuIBYa5fi4/kIg
 kspSUDqQ7niksuoJjvRjSZuYxIkXHRWd5GRNUNWj4Y1tcqUYY1BH32uNqtJu1+y9Uk3EqybZF
 8/NuLsV68vpNxmZxnRm+/30kZA+lJJmb7Y5VVIhE85cBXCPcaiqsAV+IespfvibRiJwkiXPXF
 WcvIqtaMjF0uccH4nYyIo4cvN1IWqXb0xCxUhDUbJGudswDxH8HXTk6a642pkJqucAyJA+SIx
 CYh/ZOIm6PojJlyRGESPDDV7nT15Ut4UCEyAwvC6gsCgZVjHDnXes57RXLuQCQntSNqBsPKYO
 3NdSBrjko+QYNkkJXJqagL551mYOsGzAC0BOXwcVm2+K553TzOK9eKmtcLdMftEYrKFa9BCWB
 iTsF+DYNJ3Q5IoHLdqPP+vDbiaGBHIhh99ri3ZC4UEMcs7ZjSXDDgZr2Ku6TzBOGktWTWSym4
 oz7cYvTJ0uq1c0JlHJjxKyTR6ZmMki5/Khlw4gSrnlEmu5FjpOYP+mnjGHFXrmPIrMLzj293T
 RxxY9xCEt4h6n8c1WoU/M9cFtac6ibjJDLJXOqvexPT2vlyfpC8SREgRJV6m9Sc4eCpxFrkl7
 EehKuqZD2ISs0z7pVRmj7diKw3QwKTrXEQfnPGVSQeS3MzjLrwXTZr3OgSscaq384hajPkTcb
 m5ERv/sawfgr0bQdegC1PTJRnWcDRogpLmm4Jggek9XbLbup5uOuusYi8U7WXNpdNBndOhM/e
 8Q9Uf3+S1wKJi8=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Switch away from the own cpu topology code to common code which is used
by ARM64 and RISCV. That allows us to enable hotplug later on too.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Kconfig                |  2 +-
 arch/parisc/include/asm/topology.h | 20 +--------
 arch/parisc/kernel/processor.c     |  2 +
 arch/parisc/kernel/topology.c      | 72 +++++++-----------------------
 4 files changed, 19 insertions(+), 77 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 00cb889bd9a6..6bd42c82a019 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -37,7 +37,7 @@ config PARISC
 	select GENERIC_PCI_IOMAP
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select GENERIC_SMP_IDLE_THREAD
-	select GENERIC_CPU_DEVICES
+	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	select SYSCTL_EXCEPTION_TRACE
diff --git a/arch/parisc/include/asm/topology.h b/arch/parisc/include/asm/=
topology.h
index 6f0750c74e47..734eddf096f7 100644
=2D-- a/arch/parisc/include/asm/topology.h
+++ b/arch/parisc/include/asm/topology.h
@@ -4,25 +4,7 @@
 #ifdef CONFIG_PARISC_CPU_TOPOLOGY

 #include <linux/cpumask.h>
-
-struct cputopo_parisc {
-	int thread_id;
-	int core_id;
-	int socket_id;
-	cpumask_t thread_sibling;
-	cpumask_t core_sibling;
-};
-
-extern struct cputopo_parisc cpu_topology[NR_CPUS];
-
-#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
-#define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
-#define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
-#define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
-
-void init_cpu_topology(void);
-void store_cpu_topology(unsigned int cpuid);
-const struct cpumask *cpu_coregroup_mask(int cpu);
+#include <linux/arch_topology.h>

 #else

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor=
.c
index ccaf075d0750..d0bfd61a4623 100644
=2D-- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -19,6 +19,7 @@
 #include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/cpu.h>
+#include <asm/topology.h>
 #include <asm/param.h>
 #include <asm/cache.h>
 #include <asm/hardware.h>	/* for register_parisc_driver() stuff */
@@ -459,5 +460,6 @@ static struct parisc_driver cpu_driver __refdata =3D {
  */
 void __init processor_init(void)
 {
+	reset_cpu_topology();
 	register_parisc_driver(&cpu_driver);
 }
diff --git a/arch/parisc/kernel/topology.c b/arch/parisc/kernel/topology.c
index e88a6ce7c96d..72d9aeb54fbe 100644
=2D-- a/arch/parisc/kernel/topology.c
+++ b/arch/parisc/kernel/topology.c
@@ -13,45 +13,11 @@
 #include <linux/percpu.h>
 #include <linux/sched.h>
 #include <linux/sched/topology.h>
+#include <linux/cpu.h>

 #include <asm/topology.h>

- /*
-  * cpu topology table
-  */
-struct cputopo_parisc cpu_topology[NR_CPUS] __read_mostly;
-EXPORT_SYMBOL_GPL(cpu_topology);
-
-const struct cpumask *cpu_coregroup_mask(int cpu)
-{
-	return &cpu_topology[cpu].core_sibling;
-}
-
-static void update_siblings_masks(unsigned int cpuid)
-{
-	struct cputopo_parisc *cpu_topo, *cpuid_topo =3D &cpu_topology[cpuid];
-	int cpu;
-
-	/* update core and thread sibling masks */
-	for_each_possible_cpu(cpu) {
-		cpu_topo =3D &cpu_topology[cpu];
-
-		if (cpuid_topo->socket_id !=3D cpu_topo->socket_id)
-			continue;
-
-		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
-		if (cpu !=3D cpuid)
-			cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
-
-		if (cpuid_topo->core_id !=3D cpu_topo->core_id)
-			continue;
-
-		cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
-		if (cpu !=3D cpuid)
-			cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
-	}
-	smp_wmb();
-}
+static DEFINE_PER_CPU(struct cpu, cpu_devices);

 static int dualcores_found __initdata;

@@ -62,7 +28,7 @@ static int dualcores_found __initdata;
  */
 void __init store_cpu_topology(unsigned int cpuid)
 {
-	struct cputopo_parisc *cpuid_topo =3D &cpu_topology[cpuid];
+	struct cpu_topology *cpuid_topo =3D &cpu_topology[cpuid];
 	struct cpuinfo_parisc *p;
 	int max_socket =3D -1;
 	unsigned long cpu;
@@ -71,6 +37,12 @@ void __init store_cpu_topology(unsigned int cpuid)
 	if (cpuid_topo->core_id !=3D -1)
 		return;

+#ifdef CONFIG_HOTPLUG_CPU
+	per_cpu(cpu_devices, cpuid).hotpluggable =3D 1;
+#endif
+	if (register_cpu(&per_cpu(cpu_devices, cpuid), cpuid))
+		printk("Failed to register CPU device");
+
 	/* create cpu topology mapping */
 	cpuid_topo->thread_id =3D -1;
 	cpuid_topo->core_id =3D 0;
@@ -86,25 +58,25 @@ void __init store_cpu_topology(unsigned int cpuid)
 			cpuid_topo->core_id =3D cpu_topology[cpu].core_id;
 			if (p->cpu_loc) {
 				cpuid_topo->core_id++;
-				cpuid_topo->socket_id =3D cpu_topology[cpu].socket_id;
+				cpuid_topo->package_id =3D cpu_topology[cpu].package_id;
 				dualcores_found =3D 1;
 				continue;
 			}
 		}

-		if (cpuid_topo->socket_id =3D=3D -1)
-			max_socket =3D max(max_socket, cpu_topology[cpu].socket_id);
+		if (cpuid_topo->package_id =3D=3D -1)
+			max_socket =3D max(max_socket, cpu_topology[cpu].package_id);
 	}

-	if (cpuid_topo->socket_id =3D=3D -1)
-		cpuid_topo->socket_id =3D max_socket + 1;
+	if (cpuid_topo->package_id =3D=3D -1)
+		cpuid_topo->package_id =3D max_socket + 1;

 	update_siblings_masks(cpuid);

 	pr_info("CPU%u: cpu core %d of socket %d\n",
 		cpuid,
 		cpu_topology[cpuid].core_id,
-		cpu_topology[cpuid].socket_id);
+		cpu_topology[cpuid].package_id);
 }

 static struct sched_domain_topology_level parisc_mc_topology[] =3D {
@@ -122,20 +94,6 @@ static struct sched_domain_topology_level parisc_mc_to=
pology[] =3D {
  */
 void __init init_cpu_topology(void)
 {
-	unsigned int cpu;
-
-	/* init core mask and capacity */
-	for_each_possible_cpu(cpu) {
-		struct cputopo_parisc *cpu_topo =3D &(cpu_topology[cpu]);
-
-		cpu_topo->thread_id =3D -1;
-		cpu_topo->core_id =3D  -1;
-		cpu_topo->socket_id =3D -1;
-		cpumask_clear(&cpu_topo->core_sibling);
-		cpumask_clear(&cpu_topo->thread_sibling);
-	}
-	smp_wmb();
-
 	/* Set scheduler topology descriptor */
 	if (dualcores_found)
 		set_sched_topology(parisc_mc_topology);
=2D-
2.35.1


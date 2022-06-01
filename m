Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 460EC53ABB1
	for <lists+linux-parisc@lfdr.de>; Wed,  1 Jun 2022 19:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353421AbiFARSb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 Jun 2022 13:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356294AbiFARS3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 Jun 2022 13:18:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 17E81483A5
        for <linux-parisc@vger.kernel.org>; Wed,  1 Jun 2022 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654103904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=B+dUyFrYgkNVjV9s+xzJHJAtek2WRdL6L/vnBDmmfrs=;
        b=JFvJDLd+YQIfx0FebgvHinh9x1Xg1ZOKSJ1IOaXlryBBk7ERFZKX9yVPdcMFJ4x45fSUzg
        WoJZMcLeF2f+cX00fcXcMmZajDVZK+9WVDz72TV9nexsUr/9rj76ggeGauUSiwtoe1zW6R
        mOBEsVqlWuGSWe20OqVLodmzfy3B9Sw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-6EShAqb5PrKtudACig83WQ-1; Wed, 01 Jun 2022 13:18:23 -0400
X-MC-Unique: 6EShAqb5PrKtudACig83WQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 933D5294EDE9;
        Wed,  1 Jun 2022 17:18:22 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8835641637E;
        Wed,  1 Jun 2022 17:18:22 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 251HIMSm027376;
        Wed, 1 Jun 2022 13:18:22 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 251HIME5027373;
        Wed, 1 Jun 2022 13:18:22 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Wed, 1 Jun 2022 13:18:22 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH v2] parisc: fix a crash with multicore scheduler
In-Reply-To: <alpine.LRH.2.02.2206011146110.23169@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2206011316440.25830@file01.intranet.prod.int.rdu2.redhat.com>
References: <YpZYPokZr9s4uwtt@p100> <alpine.LRH.2.02.2206010911370.15916@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2206011053050.20771@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2206011146110.23169@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

With the kernel 5.18, the system will hang on boot if it is compiled with
CONFIG_SCHED_MC. The last printed message is "Brought up 1 node, 1 CPU".

The crash happens in sd_init
tl->mask (which is cpu_coregroup_mask) returns an empty mask. This happens
	because cpu_topology[0].core_sibling is empty.
Consequently, sd_span is set to an empty mask
sd_id = cpumask_first(sd_span) sets sd_id == NR_CPUS (because the mask is
	empty)
sd->shared = *per_cpu_ptr(sdd->sds, sd_id); sets sd->shared to NULL
	because sd_id is out of range
atomic_inc(&sd->shared->ref); crashes without printing anything

We can fix it by calling reset_cpu_topology() from init_cpu_topology() -
this will initialize the sibling masks on CPUs, so that they're not empty.

This patch also removes the variable "dualcores_found", it is useless,
because during boot, init_cpu_topology is called before
store_cpu_topology. Thus, set_sched_topology(parisc_mc_topology) is never
called. We don't need to call it at all because default_topology in
kernel/sched/topology.c contains the same items as parisc_mc_topology.

Note that we should not call store_cpu_topology() from init_per_cpu()
because it is called too early in the kernel initialization process and it
results in the message "Failure to register CPU0 device". Before this
patch, store_cpu_topology() would exit immediatelly because
cpuid_topo->core id was uninitialized and it was 0.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v5.18

---
 arch/parisc/kernel/processor.c |    2 --
 arch/parisc/kernel/topology.c  |   16 +---------------
 2 files changed, 1 insertion(+), 17 deletions(-)

Index: linux-2.6/arch/parisc/kernel/topology.c
===================================================================
--- linux-2.6.orig/arch/parisc/kernel/topology.c	2022-06-01 15:32:59.000000000 +0200
+++ linux-2.6/arch/parisc/kernel/topology.c	2022-06-01 18:37:37.000000000 +0200
@@ -20,8 +20,6 @@
 
 static DEFINE_PER_CPU(struct cpu, cpu_devices);
 
-static int dualcores_found;
-
 /*
  * store_cpu_topology is called at boot when only one cpu is running
  * and with the mutex cpu_hotplug.lock locked, when several cpus have booted,
@@ -60,7 +58,6 @@ void store_cpu_topology(unsigned int cpu
 			if (p->cpu_loc) {
 				cpuid_topo->core_id++;
 				cpuid_topo->package_id = cpu_topology[cpu].package_id;
-				dualcores_found = 1;
 				continue;
 			}
 		}
@@ -80,22 +77,11 @@ void store_cpu_topology(unsigned int cpu
 		cpu_topology[cpuid].package_id);
 }
 
-static struct sched_domain_topology_level parisc_mc_topology[] = {
-#ifdef CONFIG_SCHED_MC
-	{ cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
-#endif
-
-	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
-	{ NULL, },
-};
-
 /*
  * init_cpu_topology is called at boot when only one cpu is running
  * which prevent simultaneous write access to cpu_topology array
  */
 void __init init_cpu_topology(void)
 {
-	/* Set scheduler topology descriptor */
-	if (dualcores_found)
-		set_sched_topology(parisc_mc_topology);
+	reset_cpu_topology();
 }
Index: linux-2.6/arch/parisc/kernel/processor.c
===================================================================
--- linux-2.6.orig/arch/parisc/kernel/processor.c	2022-06-01 15:32:59.000000000 +0200
+++ linux-2.6/arch/parisc/kernel/processor.c	2022-06-01 18:35:12.000000000 +0200
@@ -327,8 +327,6 @@ int init_per_cpu(int cpunum)
 	set_firmware_width();
 	ret = pdc_coproc_cfg(&coproc_cfg);
 
-	store_cpu_topology(cpunum);
-
 	if(ret >= 0 && coproc_cfg.ccr_functional) {
 		mtctl(coproc_cfg.ccr_functional, 10);  /* 10 == Coprocessor Control Reg */
 


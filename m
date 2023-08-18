Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06DE9781456
	for <lists+linux-parisc@lfdr.de>; Fri, 18 Aug 2023 22:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379972AbjHRUfq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 18 Aug 2023 16:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380004AbjHRUfj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 18 Aug 2023 16:35:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6330A3C2F
        for <linux-parisc@vger.kernel.org>; Fri, 18 Aug 2023 13:35:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F17C860AF4
        for <linux-parisc@vger.kernel.org>; Fri, 18 Aug 2023 20:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0607C433C7;
        Fri, 18 Aug 2023 20:35:35 +0000 (UTC)
Date:   Fri, 18 Aug 2023 22:35:32 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Fix /proc/cpuinfo output for lscpu
Message-ID: <ZN/WFGNDWqQdyv75@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The lscpu command is broken since commit cab56b51ec0e ("parisc: Fix
device names in /proc/iomem") added the PA pathname to all PA
devices, includig the CPUs.

lscpu parses /proc/cpuinfo and now believes it found different CPU
types since every CPU is listed with an unique identifier (PA
pathname).

Fix this problem by simply dropping the PA pathname when listing the
CPUs in /proc/cpuinfo. There is no need to show the pathname in this
procfs file.

Fixes: cab56b51ec0e ("parisc: Fix device names in /proc/iomem")
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # v4.9+

---

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 762289b9984e..8511594352ef 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -378,7 +378,9 @@ int
 show_cpuinfo (struct seq_file *m, void *v)
 {
 	unsigned long cpu;
+	char cpu_name[60];
 
+	cpu_name[0] = 0;
 	for_each_online_cpu(cpu) {
 		const struct cpuinfo_parisc *cpuinfo = &per_cpu(cpu_data, cpu);
 #ifdef CONFIG_SMP
@@ -424,10 +426,22 @@ show_cpuinfo (struct seq_file *m, void *v)
 		}
 		seq_printf(m, " (0x%02lx)\n", boot_cpu_data.pdc.capabilities);
 
+		/* strip bus path from CPU name to not confuse lscpu */
+		if (cpu_name[0] == 0) {
+			char *p;
+
+			if (cpuinfo->dev)
+				strlcpy(cpu_name, cpuinfo->dev->name,
+					sizeof(cpu_name));
+			else
+				strcpy(cpu_name, "Unknown");
+			p = strrchr(cpu_name, '[');
+			if (p)
+				*(--p) = 0;
+		}
 		seq_printf(m, "model\t\t: %s - %s\n",
 				 boot_cpu_data.pdc.sys_model_name,
-				 cpuinfo->dev ?
-				 cpuinfo->dev->name : "Unknown");
+				 cpu_name);
 
 		seq_printf(m, "hversion\t: 0x%08x\n"
 			        "sversion\t: 0x%08x\n",

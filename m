Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB184E752B
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359354AbiCYOkT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359346AbiCYOkR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:17 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EA4972FF
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219116;
        bh=lXyzy3GOxyMDK40biUVP97KgTYN+dTugnTrUHzWDMnE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=MqHfZe+JMmtvH0QJNSdsoqSv1sp+OFwrD6PFGZcbXK7PlFEOJ0gNqX5/yfbFt6Fs1
         d4vW9PeEcCPE91u5yFvOC8xOOpIP9Z0JjD0T1kClgxzyI8FL6Rwix70bNu07vcNSzX
         Gdugo/TK8oiSEqmQDDyllufn9fcWEgSaAdH0XueI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfYm-1nMnmV3ihc-00B4Sd; Fri, 25
 Mar 2022 15:38:35 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 11/12] parisc: Rewrite arch_cpu_idle_dead() for CPU hotplugging
Date:   Fri, 25 Mar 2022 15:38:32 +0100
Message-Id: <20220325143833.402631-11-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LZj4cdxw+PuJKk39OysNJZC7J1cWXPrKlOmAGHm+WHRkxDn27AC
 qWYkk7KzrEwDzsCbbenbhwjd9DJluQ3zsGqMVc59JjFI1rXMa0Y92MW2XkerhnQVs3SQbM3
 tSQJM6ehDW+ZSo9gt3ONPqC+2x8iqLCUGyc8D/cbxcwfgcAhWUhtO4BR0dut/ae5HvbcieI
 nok1SsManPzpSQkgDzyZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZzsFIqEAI9o=:wqyl6CebfLCBkD6ramB5Hu
 MxmqPy7ulJ0hrVaLK96w9sbG3e1j3VqmcsKkwK2FOv0UHyoZV0xWSmztzKAVC2Cm4jOA9ryY/
 /hdAdKeDrZNoGy4nUpRvm+ElR+D6dTm4vS0QwgXncDgD8je2oraZa0z8NDu3Wi4iPiIDVH/5B
 /4FmXbF9y9wU+2wAJ+yBnhcN/2kiqMO3k3P3DtRDstH3Fz/9/fcVpCJXVzHC6PxZ2dDRR/JLL
 Yp+ojPHxTZ89xP07mktjJHXF3u/y6G6N6tHBPTF2tF6LDWs4LcQAPDjBNAYTy3Frd+bcHlqWM
 tjb3jmpUDwVytpaiSw70A6IHnogVnLQEIzqeMxI5kNvcvNrE1kJtrvMNgSk1jwQwYbmbTg5g7
 YcOza087JkuxMEwQf5tP4tNJm3KbNFASNNSeSYyupJGwqlMGsv+4nefRSQwBysaVIgDIMMdmp
 sMGSVs+1E4Z8mv4wafdO3Eo23I/Fy8YAbRMqqFUsoNyBk3ain2gxrwRX5SBrV1zsIbpZYWvvb
 sNzu4wNXsHxO4NzsbP4t8BHFhCHlcFy096yAnDRUKBm6pJDpDQM4lHqY811kV470W6NTFPPQk
 +sS0nErfn1qTQ7FY5phOVaqUKAUOQiry/Cb/PiUZxBdzWViyHLYzuEtG1KlI6sflcFL1tyBTf
 Jdr2yuayd2lJOo2IN7xxE8ZiSJs9wclhlhxVwW0eOKiRhDmlPdePWIt7A+ol5oYRvC5bF1FXs
 o4VqfkGYRQY84vhTsxkx79aVaqeHkhaf2c1bcD7NFub9n4QnpshRGESAdrxLPjkQ2ko4YUpBW
 hJLLUg9zZsvIfz8uLTaOJMUn0gVLemuHpFvI8E4uIFWLjiyGM/by6x705GGL+oxGh6EMAzlpe
 0D1VhNVzRm+//OGav78cY7p9khN25wr3NaL9s7S4K//6nsiUItZWZ3Clm+yrcNml5wL9rpX8Q
 oB8HK/xmL3A+plCKoKdE/dzrTJjvd4wj0CKZjx2TPEvw8YIyrhwbeBm3XPpFsLULJOPFXT9sY
 jipWUQMaeLlc7xT/XR93Ppdmz/6cmZW+hpetJUwPD3/2HsrSwaWKNIhPvMOzHajVsuThOJkC+
 KL/scwd0dOiNYM=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Let the PDC firmware put the CPU into firmware idle loop with
pdc_cpu_rendezvous() function.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/process.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index ea3d83b6fb62..44fa89fbb280 100644
=2D-- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -38,6 +38,7 @@
 #include <linux/rcupdate.h>
 #include <linux/random.h>
 #include <linux/nmi.h>
+#include <linux/sched/hotplug.h>

 #include <asm/io.h>
 #include <asm/asm-offsets.h>
@@ -46,6 +47,7 @@
 #include <asm/pdc_chassis.h>
 #include <asm/unwind.h>
 #include <asm/sections.h>
+#include <asm/cacheflush.h>

 #define COMMAND_GLOBAL  F_EXTEND(0xfffe0030)
 #define CMD_RESET       5       /* reset any module */
@@ -158,10 +160,35 @@ void release_thread(struct task_struct *dead_task)
 int running_on_qemu __ro_after_init;
 EXPORT_SYMBOL(running_on_qemu);

-void __cpuidle arch_cpu_idle_dead(void)
+/*
+ * Called from the idle thread for the CPU which has been shutdown.
+ */
+void arch_cpu_idle_dead(void)
 {
-	/* nop on real hardware, qemu will offline CPU. */
-	asm volatile("or %%r31,%%r31,%%r31\n":::);
+#ifdef CONFIG_HOTPLUG_CPU
+	idle_task_exit();
+
+	local_irq_disable();
+
+	/*
+	 * Tell __cpu_die() that this CPU is now safe to dispose of.
+	 */
+	(void)cpu_report_death();
+
+	/*
+	 * Ensure that the cache lines are written out.
+	 */
+	flush_cache_all_local();
+	flush_tlb_all_local(NULL);
+
+	/*
+	 * Let PDC firmware put CPU into firmware idle loop.
+	 */
+	__pdc_cpu_rendezvous();
+
+	pr_warn("PDC does not provide rendezvous function.\n");
+#endif
+	while (1);
 }

 void __cpuidle arch_cpu_idle(void)
=2D-
2.35.1


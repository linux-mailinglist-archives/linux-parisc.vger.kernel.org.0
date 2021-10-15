Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2CE42FC82
	for <lists+linux-parisc@lfdr.de>; Fri, 15 Oct 2021 21:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242845AbhJOTvu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 15 Oct 2021 15:51:50 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:36466 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242841AbhJOTvt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 15 Oct 2021 15:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=y/q7uiNTQc+unZmUPnnId/iro1yE0QL8Q9EUIAaWfZ4=; b=ZbU75B9a803sePSWoJj2bH1CoO
        d7Nc5zXr6Ec2tW9S/6N2nf3PSh8nCDmZ+eI6BHERfs8w+gOa3SgUuAAtok0OJcvmm8MT1p+Eny4vy
        KNDz13/faFSgF0+otfGtDLtp8zx7XJVFNHA/W0I7IX86Vmse+ep9n8wG5tEf1INtkONk=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mbTD3-00035c-Kt; Fri, 15 Oct 2021 21:49:41 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc/kgdb: add kgdb_roundup() to make kgdb work with idle polling
Date:   Fri, 15 Oct 2021 21:49:23 +0200
Message-Id: <20211015194923.23058-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

With idle polling, IPIs are not sent when a CPU idle, but queued
and run later from do_idle(). The default kgdb_call_nmi_hook()
implementation gets the pointer to struct pt_regs from get_irq_reqs(),
which doesn't work in that case because it was not called from the
IPI interrupt handler. Fix it by defining our own kgdb_roundup()
function which sents an IPI_ENTER_KGDB. When that IPI is received
on the target CPU kgdb_nmicallback() is called.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/smp.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index b282c1ce00c8..171925285f3e 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -29,6 +29,7 @@
 #include <linux/bitops.h>
 #include <linux/ftrace.h>
 #include <linux/cpu.h>
+#include <linux/kgdb.h>
 
 #include <linux/atomic.h>
 #include <asm/current.h>
@@ -69,7 +70,10 @@ enum ipi_message_type {
 	IPI_CALL_FUNC,
 	IPI_CPU_START,
 	IPI_CPU_STOP,
-	IPI_CPU_TEST
+	IPI_CPU_TEST,
+#ifdef CONFIG_KGDB
+	IPI_ENTER_KGDB,
+#endif
 };
 
 
@@ -167,7 +171,12 @@ ipi_interrupt(int irq, void *dev_id)
 			case IPI_CPU_TEST:
 				smp_debug(100, KERN_DEBUG "CPU%d is alive!\n", this_cpu);
 				break;
-
+#ifdef CONFIG_KGDB
+			case IPI_ENTER_KGDB:
+				smp_debug(100, KERN_DEBUG "CPU%d ENTER_KGDB\n", this_cpu);
+				kgdb_nmicallback(raw_smp_processor_id(), get_irq_regs());
+				break;
+#endif
 			default:
 				printk(KERN_CRIT "Unknown IPI num on CPU%d: %lu\n",
 					this_cpu, which);
@@ -228,6 +237,12 @@ send_IPI_allbutself(enum ipi_message_type op)
 	preempt_enable();
 }
 
+#ifdef CONFIG_KGDB
+void kgdb_roundup_cpus(void)
+{
+	send_IPI_allbutself(IPI_ENTER_KGDB);
+}
+#endif
 
 inline void 
 smp_send_stop(void)	{ send_IPI_allbutself(IPI_CPU_STOP); }
-- 
2.33.0


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1079427CA9
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Oct 2021 20:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhJIS0u (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Oct 2021 14:26:50 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:45736 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbhJIS0u (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Oct 2021 14:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OxTKNI8XCny7h9we6L6NOBdFK3V44SBGlYijzCauxE0=; b=WiCG3AxMUJmj96uyRX5K0TzljV
        J4On68huU1EI01vehv4OFTwIuPsxEXy4Kx7bOBqtgFMPy2U1pTIpXkPNSHdGCGFCbtoMnTlFIulcL
        yV0Nrb9jM9aLvi8aoCkYVqz8kYdqdJ6l6T208kGS+YictW79bI9/JkbrbIT4pQT+tWxQ=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZH1f-0001dj-3V; Sat, 09 Oct 2021 20:24:51 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v2 5/5] parisc: fix warning in flush_tlb_all
Date:   Sat,  9 Oct 2021 20:24:39 +0200
Message-Id: <20211009182439.30016-6-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009182439.30016-1-svens@stackframe.org>
References: <20211009182439.30016-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I've got the following splat after enabling preemption:

[    3.724721] BUG: using __this_cpu_add() in preemptible [00000000] code: swapper/0/1
[    3.734630] caller is __this_cpu_preempt_check+0x38/0x50
[    3.740635] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.15.0-rc4-64bit+ #324
[    3.744605] Hardware name: 9000/785/C8000
[    3.744605] Backtrace:
[    3.744605]  [<00000000401d9d58>] show_stack+0x74/0xb0
[    3.744605]  [<0000000040c27bd4>] dump_stack_lvl+0x10c/0x188
[    3.744605]  [<0000000040c27c84>] dump_stack+0x34/0x48
[    3.744605]  [<0000000040c33438>] check_preemption_disabled+0x178/0x1b0
[    3.744605]  [<0000000040c334f8>] __this_cpu_preempt_check+0x38/0x50
[    3.744605]  [<00000000401d632c>] flush_tlb_all+0x58/0x2e0
[    3.744605]  [<00000000401075c0>] 0x401075c0
[    3.744605]  [<000000004010b8fc>] 0x4010b8fc
[    3.744605]  [<00000000401080fc>] 0x401080fc
[    3.744605]  [<00000000401d5224>] do_one_initcall+0x128/0x378
[    3.744605]  [<0000000040102de8>] 0x40102de8
[    3.744605]  [<0000000040c33864>] kernel_init+0x60/0x3a8
[    3.744605]  [<00000000401d1020>] ret_from_kernel_thread+0x20/0x28
[    3.744605]

Fix this by moving the __inc_irq_stat() into the locked section.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 3f7d6d5b56ac..65f50f072a87 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -842,9 +842,9 @@ void flush_tlb_all(void)
 {
 	int do_recycle;
 
-	__inc_irq_stat(irq_tlb_count);
 	do_recycle = 0;
 	spin_lock(&sid_lock);
+	__inc_irq_stat(irq_tlb_count);
 	if (dirty_space_ids > RECYCLE_THRESHOLD) {
 	    BUG_ON(recycle_inuse);  /* FIXME: Use a semaphore/wait queue here */
 	    get_dirty_sids(&recycle_ndirty,recycle_dirty_array);
@@ -863,8 +863,8 @@ void flush_tlb_all(void)
 #else
 void flush_tlb_all(void)
 {
-	__inc_irq_stat(irq_tlb_count);
 	spin_lock(&sid_lock);
+	__inc_irq_stat(irq_tlb_count);
 	flush_tlb_all_local(NULL);
 	recycle_sids();
 	spin_unlock(&sid_lock);
-- 
2.33.0


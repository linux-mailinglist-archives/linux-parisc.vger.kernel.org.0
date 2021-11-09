Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDFE44A2DC
	for <lists+linux-parisc@lfdr.de>; Tue,  9 Nov 2021 02:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241536AbhKIBWY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 8 Nov 2021 20:22:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:46484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238191AbhKIBTy (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 8 Nov 2021 20:19:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3059561AFE;
        Tue,  9 Nov 2021 01:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636420081;
        bh=wxotQDW19YNcb69h8iniSFCrA/WaQ+/r2v+KXBKhbTo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hrWB+cdhW6sCiK+rqkMzc/LBI07XGNfZ0T6xn85KGBw+WWrbc0xxLzKBOWsdbPNDQ
         BzjoeL7Cbx4lOz1JxA3r3qbYd3jNbF3rxf27zvZptyA5wdn2NSWDceacoUXUX5lQQi
         l82E3N4C3k69+NZ/jJ8Gx4nYnrsnUIOYbCAoFpuOol512/ilaRuLM99cFZLWpwX9e/
         WXFe21kTC3euhg9UlnwNe7iOGNt1HlcwH4ho037gyv68dcqUkEjeZe8sIWUwPTvki7
         eTkYDw5oPdpbaTWsYWrBNeRIrixD3KaaGdVUh1avsCeUCVII+pMHgDBOo/rj3I0W5y
         vJsnYIy0gQmOA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
        Sasha Levin <sashal@kernel.org>,
        James.Bottomley@HansenPartnership.com, david@redhat.com,
        akpm@linux-foundation.org, rmk+kernel@armlinux.org.uk,
        hanyihao@vivo.com, wangkefeng.wang@huawei.com, willy@infradead.org,
        linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 37/39] parisc: fix warning in flush_tlb_all
Date:   Mon,  8 Nov 2021 20:06:47 -0500
Message-Id: <20211109010649.1191041-37-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109010649.1191041-1-sashal@kernel.org>
References: <20211109010649.1191041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Sven Schnelle <svens@stackframe.org>

[ Upstream commit 1030d681319b43869e0d5b568b9d0226652d1a6f ]

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
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/parisc/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 8be075f81ce66..c8af5296cfd24 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -895,9 +895,9 @@ void flush_tlb_all(void)
 {
 	int do_recycle;
 
-	__inc_irq_stat(irq_tlb_count);
 	do_recycle = 0;
 	spin_lock(&sid_lock);
+	__inc_irq_stat(irq_tlb_count);
 	if (dirty_space_ids > RECYCLE_THRESHOLD) {
 	    BUG_ON(recycle_inuse);  /* FIXME: Use a semaphore/wait queue here */
 	    get_dirty_sids(&recycle_ndirty,recycle_dirty_array);
@@ -916,8 +916,8 @@ void flush_tlb_all(void)
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


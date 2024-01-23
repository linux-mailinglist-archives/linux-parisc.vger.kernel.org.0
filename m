Return-Path: <linux-parisc+bounces-414-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9B8393F9
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 16:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 275E51F21F07
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 15:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45AD60EFF;
	Tue, 23 Jan 2024 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYNLFTLk"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914465F552
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706025553; cv=none; b=mgo3KhMHVzzhIbKffGShB5OYDqHL/DtNJEiUrXtRGvAmTTc9ZOPnHKJEa/mIJGHtbIT1DsEv5NpMQciqT2ejvmWCNMkBQ2jgVeNN61aS51/rmMSN6XDfNuGs57w/1nMuGG7HovbQejXF92Uxq37TG8bW093Eeik1m+jw9V8sJsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706025553; c=relaxed/simple;
	bh=+VdqAfcT+UzoiXuEv7wP7IafLCE81jF76rm78rIo5Pg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uq7M1sQZAA5lsv8QaJVY8qFicOPNn1VDc0FPs8UpwylU1pWETnlrIqkfFA4NnHajm7rb8ddbZH9Lbr/W7oAhf7TLN7MWZzRkl5PktrcYjxgswNaVnFDX3cWnTnUQkynXewPLGAo1K155oA7+jbwhE+WNMNyiUDPPQ+2WOfN3kLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYNLFTLk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B87C433C7
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706025553;
	bh=+VdqAfcT+UzoiXuEv7wP7IafLCE81jF76rm78rIo5Pg=;
	h=From:To:Subject:Date:From;
	b=RYNLFTLkJQzc0DtpO6vUxKHGmWznvbNthv0GYR+Bljayn2sBsHM90Sz04MAqKvYXe
	 Bm3cCGXBth3HM5K1W4NMZSb42iOLtrNrjTBE0zhbVKi7XzP4zg2DJtVrgYm5nBF4lU
	 8DcQlg3nzQO+E5etUmP1ERu1mEfvNaGneA76aaSBE6Js7Son8m4sjramlAqest9Bjs
	 zrpZF00Ibj59vn/RWLJThvJa/I1sNLRSTBGDVQ/X3UIrVY3TQ9yXyo/Y7oxqzYtAb6
	 rAUMF3n1f9mTHYRVD8RSzqwAEVwGwZLTRQcUseS2qP/7qt/TpGxnXxqtrUaXBRbNon
	 rK/+V6Wkhclag==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH 1/7] parisc: Use irq_enter_rcu() to fix warning at kernel/context_tracking.c:367
Date: Tue, 23 Jan 2024 16:58:58 +0100
Message-ID: <20240123155904.6220-1-deller@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Use irq*_rcu() functions to fix this kernel warning:

 WARNING: CPU: 0 PID: 0 at kernel/context_tracking.c:367 ct_irq_enter+0xa0/0xd0
 Modules linked in:
 CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.7.0-rc3-64bit+ #1037
 Hardware name: 9000/785/C3700

 IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000412cd758 00000000412cd75c
  IIR: 03ffe01f    ISR: 0000000000000000  IOR: 0000000043c20c20
  CPU:        0   CR30: 0000000041caa000 CR31: 0000000000000000
  ORIG_R28: 0000000000000005
  IAOQ[0]: ct_irq_enter+0xa0/0xd0
  IAOQ[1]: ct_irq_enter+0xa4/0xd0
  RP(r2): irq_enter+0x34/0x68
 Backtrace:
  [<000000004034a3ec>] irq_enter+0x34/0x68
  [<000000004030dc48>] do_cpu_irq_mask+0xc0/0x450
  [<0000000040303070>] intr_return+0x0/0xc

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 2f81bfd4f15e..dff66be65d29 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -498,7 +498,7 @@ asmlinkage void do_cpu_irq_mask(struct pt_regs *regs)
 
 	old_regs = set_irq_regs(regs);
 	local_irq_disable();
-	irq_enter();
+	irq_enter_rcu();
 
 	eirr_val = mfctl(23) & cpu_eiem & per_cpu(local_ack_eiem, cpu);
 	if (!eirr_val)
@@ -533,7 +533,7 @@ asmlinkage void do_cpu_irq_mask(struct pt_regs *regs)
 #endif /* CONFIG_IRQSTACKS */
 
  out:
-	irq_exit();
+	irq_exit_rcu();
 	set_irq_regs(old_regs);
 	return;
 
-- 
2.43.0



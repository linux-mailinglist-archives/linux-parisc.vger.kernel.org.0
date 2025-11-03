Return-Path: <linux-parisc+bounces-4249-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E51C2E38B
	for <lists+linux-parisc@lfdr.de>; Mon, 03 Nov 2025 23:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACF6B1887A1A
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Nov 2025 22:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6132EE5F5;
	Mon,  3 Nov 2025 22:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDu2TGrm"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998D12EE268
	for <linux-parisc@vger.kernel.org>; Mon,  3 Nov 2025 22:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762207895; cv=none; b=NupvlXz7m4IlDU3IinlggECqK8bHz3MIsFagFxQu2JkWiau55ZoN1R2D+cupDEHFwMcu+lVr5xE6J34xtrsPjD1/h5m8fy/xJ2fpAYIWxLQniTOX3tkXhB8HN9VvpAGE1JfGs1Vnu5rV4teYSJFkYK27NcaU6EPfOspkiVVlG7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762207895; c=relaxed/simple;
	bh=c5KcyDrEtt8a5uizotqH00RuOldT/bAmx/8kRfJHrwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ksJBkhg7Te0cUQtfyHiroHlqDYjOEw0QEdP72wUI+gmg5gcj17px7osqTa8f7pA8AwgMRtWYFtI+K1lqO3vRUdRwDBBm/s8fz82c0oGgIURvdR+qHq6XWBG0q1lot00c1tex66d/a4sO5uNr1wE9bLXWzN5UVvBFLD4zsiQvMxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDu2TGrm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32EDC113D0;
	Mon,  3 Nov 2025 22:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762207895;
	bh=c5KcyDrEtt8a5uizotqH00RuOldT/bAmx/8kRfJHrwI=;
	h=From:To:Cc:Subject:Date:From;
	b=YDu2TGrmaYQjCxGp0U0R3UdQCXg9GpBG45ErzMK3WMvJ0FYehfnDJCYcxo6f41X/9
	 Tb3yyETuUS3yIxIJhRNHpDwjbSbQB7BePEaYYD1tLNXIRrukC+h5wHF+DU9Di0fHOr
	 wcDEPcEijVNRYbJR2zIN7pFPuN4VtP/57ZDsh233q/VkMdtgbH8KtP8qrxeiHUWzMs
	 NvY1R3dHeMuPNu1/NJoVyRLbmoKWUrWCrhJiMb0GIFvK2NIfiwUVr9kLHrbIFh0x8q
	 rDzYEtYkT0Wft36H9jIHbpmDQ98HUoT1Ws/olVrWwFMFjkID98W6M4Wxg8tjjh6FlD
	 vFNKmnkuxYLrw==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] parisc: Avoid crash due to unaligned access in unwinder
Date: Mon,  3 Nov 2025 23:11:10 +0100
Message-ID: <20251103221112.38617-1-deller@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Guenter Roeck reported this kernel crash on his emulated B160L machine:

Starting network: udhcpc: started, v1.36.1
 Backtrace:
  [<104320d4>] unwind_once+0x1c/0x5c
  [<10434a00>] walk_stackframe.isra.0+0x74/0xb8
  [<10434a6c>] arch_stack_walk+0x28/0x38
  [<104e5efc>] stack_trace_save+0x48/0x5c
  [<105d1bdc>] set_track_prepare+0x44/0x6c
  [<105d9c80>] ___slab_alloc+0xfc4/0x1024
  [<105d9d38>] __slab_alloc.isra.0+0x58/0x90
  [<105dc80c>] kmem_cache_alloc_noprof+0x2ac/0x4a0
  [<105b8e54>] __anon_vma_prepare+0x60/0x280
  [<105a823c>] __vmf_anon_prepare+0x68/0x94
  [<105a8b34>] do_wp_page+0x8cc/0xf10
  [<105aad88>] handle_mm_fault+0x6c0/0xf08
  [<10425568>] do_page_fault+0x110/0x440
  [<10427938>] handle_interruption+0x184/0x748
  [<11178398>] schedule+0x4c/0x190
  BUG: spinlock recursion on CPU#0, ifconfig/2420
  lock: terminate_lock.2+0x0/0x1c, .magic: dead4ead, .owner: ifconfig/2420, .owner_cpu: 0

While creating the stack trace, the unwinder uses the stack pointer to guess
the previous frame to read the previous stack pointer from memory.  The crash
happens, because the unwinder tries to read from unaligned memory and as such
triggers the unalignment trap handler which then leads to the spinlock
recursion and finally to a deadlock.

Fix it by checking the alignment before accessing the memory.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # v6.12+
---
 arch/parisc/kernel/unwind.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index f7e0fee5ee55..7ac88ff13d3c 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -35,6 +35,8 @@
 
 #define KERNEL_START (KERNEL_BINARY_TEXT_START)
 
+#define ALIGNMENT_OK(ptr, type) (((ptr) & (sizeof(type) - 1)) == 0)
+
 extern struct unwind_table_entry __start___unwind[];
 extern struct unwind_table_entry __stop___unwind[];
 
@@ -257,12 +259,15 @@ static int unwind_special(struct unwind_frame_info *info, unsigned long pc, int
 	if (pc_is_kernel_fn(pc, _switch_to) ||
 	    pc == (unsigned long)&_switch_to_ret) {
 		info->prev_sp = info->sp - CALLEE_SAVE_FRAME_SIZE;
-		info->prev_ip = *(unsigned long *)(info->prev_sp - RP_OFFSET);
+		if (ALIGNMENT_OK(info->prev_sp, long))
+			info->prev_ip = *(unsigned long *)(info->prev_sp - RP_OFFSET);
+		else
+			info->prev_ip = info->prev_sp = 0;
 		return 1;
 	}
 
 #ifdef CONFIG_IRQSTACKS
-	if (pc == (unsigned long)&_call_on_stack) {
+	if (pc == (unsigned long)&_call_on_stack && ALIGNMENT_OK(info->sp, long)) {
 		info->prev_sp = *(unsigned long *)(info->sp - FRAME_SIZE - REG_SZ);
 		info->prev_ip = *(unsigned long *)(info->sp - FRAME_SIZE - RP_OFFSET);
 		return 1;
@@ -370,8 +375,10 @@ static void unwind_frame_regs(struct unwind_frame_info *info)
 			info->prev_sp = info->sp - frame_size;
 			if (e->Millicode)
 				info->rp = info->r31;
-			else if (rpoffset)
+			else if (rpoffset && ALIGNMENT_OK(info->prev_sp, long))
 				info->rp = *(unsigned long *)(info->prev_sp - rpoffset);
+			else
+				info->rp = 0;
 			info->prev_ip = info->rp;
 			info->rp = 0;
 		}
-- 
2.51.0



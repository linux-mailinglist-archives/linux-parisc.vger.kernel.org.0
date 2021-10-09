Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574AF427D8F
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Oct 2021 23:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhJIVRU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Oct 2021 17:17:20 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:53412 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhJIVRT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Oct 2021 17:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7NHtzehqjrGt0OkpZzoM3KFC2kvW+PIt6psTZ1gHBFU=; b=qAX6cu4LD32Gm8ACgHGHVPzAO5
        eQRSpKf0MdXUIoDNiJ8KGOEaxzY3ftX9WxpfM6xNqffY3o2uqjpp4AjOwHilQmpbx9ZLZUlp0GSjL
        7CLWZekMntRnvUz9IdO46PxLk20Jm/5YvqHRDKwnErp1drHO1vriok17Z9njiCazO+As=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZJge-0003Bh-UG; Sat, 09 Oct 2021 23:15:21 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc/unwind: fix unwinder when CONFIG_64BIT is enabled
Date:   Sat,  9 Oct 2021 23:15:17 +0200
Message-Id: <20211009211517.25725-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

With 64 bit kernels unwind_special() is not working because
it compares the pc to the address of the function descriptor.
Add a helper function that compares pc with the dereferenced
address. This fixes all of the backtraces on my c8000. Without
this changes, a lot of backtraces are missing in kdb or the
show-all-tasks command from /proc/sysrq-trigger.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/unwind.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 87ae476d1c4f..86a57fb0e6fa 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -21,6 +21,8 @@
 #include <asm/ptrace.h>
 
 #include <asm/unwind.h>
+#include <asm/switch_to.h>
+#include <asm/sections.h>
 
 /* #define DEBUG 1 */
 #ifdef DEBUG
@@ -203,6 +205,11 @@ int __init unwind_init(void)
 	return 0;
 }
 
+static bool pc_is_kernel_fn(unsigned long pc, void *fn)
+{
+	return (unsigned long)dereference_kernel_function_descriptor(fn) == pc;
+}
+
 static int unwind_special(struct unwind_frame_info *info, unsigned long pc, int frame_size)
 {
 	/*
@@ -221,7 +228,7 @@ static int unwind_special(struct unwind_frame_info *info, unsigned long pc, int
 	extern void * const _call_on_stack;
 #endif /* CONFIG_IRQSTACKS */
 
-	if (pc == (unsigned long) &handle_interruption) {
+	if (pc_is_kernel_fn(pc, handle_interruption)) {
 		struct pt_regs *regs = (struct pt_regs *)(info->sp - frame_size - PT_SZ_ALGN);
 		dbg("Unwinding through handle_interruption()\n");
 		info->prev_sp = regs->gr[30];
@@ -229,13 +236,13 @@ static int unwind_special(struct unwind_frame_info *info, unsigned long pc, int
 		return 1;
 	}
 
-	if (pc == (unsigned long) &ret_from_kernel_thread ||
-	    pc == (unsigned long) &syscall_exit) {
+	if (pc_is_kernel_fn(pc, ret_from_kernel_thread) ||
+	    pc_is_kernel_fn(pc, syscall_exit)) {
 		info->prev_sp = info->prev_ip = 0;
 		return 1;
 	}
 
-	if (pc == (unsigned long) &intr_return) {
+	if (pc_is_kernel_fn(pc, intr_return)) {
 		struct pt_regs *regs;
 
 		dbg("Found intr_return()\n");
@@ -246,20 +253,20 @@ static int unwind_special(struct unwind_frame_info *info, unsigned long pc, int
 		return 1;
 	}
 
-	if (pc == (unsigned long) &_switch_to_ret) {
+	if (pc_is_kernel_fn(pc, _switch_to) ||
+	    pc_is_kernel_fn(pc, _switch_to_ret)) {
 		info->prev_sp = info->sp - CALLEE_SAVE_FRAME_SIZE;
 		info->prev_ip = *(unsigned long *)(info->prev_sp - RP_OFFSET);
 		return 1;
 	}
 
 #ifdef CONFIG_IRQSTACKS
-	if (pc == (unsigned long) &_call_on_stack) {
+	if (pc_is_kernel_fn(pc, _call_on_stack)) {
 		info->prev_sp = *(unsigned long *)(info->sp - FRAME_SIZE - REG_SZ);
 		info->prev_ip = *(unsigned long *)(info->sp - FRAME_SIZE - RP_OFFSET);
 		return 1;
 	}
 #endif
-
 	return 0;
 }
 
-- 
2.33.0


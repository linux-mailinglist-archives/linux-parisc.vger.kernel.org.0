Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B3529F11F
	for <lists+linux-parisc@lfdr.de>; Thu, 29 Oct 2020 17:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgJ2QTY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 29 Oct 2020 12:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgJ2QTX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 29 Oct 2020 12:19:23 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE14C0613CF
        for <linux-parisc@vger.kernel.org>; Thu, 29 Oct 2020 09:19:23 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id g7so3596732ilr.12
        for <linux-parisc@vger.kernel.org>; Thu, 29 Oct 2020 09:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=VE3B3MkzsTtEfYRDGgJZ/VimBuD/C9zzQieiWxEDy1Y=;
        b=ZkdaAvIdqekj+Y0mOnbLIizCvHsnfRgQc/bE0h2hC1/pHf1SD4hMgz30YjJJPykJT8
         nCtr1tHcpuFV5YoVxavmRf7SHz7ZdsCsH7W8nCzfxdIhfCbNaVr9gRLn+MCncoYacGmy
         cOMAJufnM7slTT3reP+4en2ad/QoprO7tSv2ABjyP0vW3UPj0x0VHDjUPO0wNxYxsh9t
         CtCCzdoDRnrKwwLNZQPVBCZHBI7Fn4CkyQsp+pA+ZRsdfmPnXH+cst1PKWRC2BeGc1N6
         iawIqTqONFxT9GqWxeqq5H7us6u+5xxtj8ksxnKwnYDMmLv3zqcjwt7koTtMWcO7YYCM
         HtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=VE3B3MkzsTtEfYRDGgJZ/VimBuD/C9zzQieiWxEDy1Y=;
        b=cxHJE0hCAvsb/ZkAObauIfNgnyTbPxuXH65/vMn5ua10DaS0rwXQDh7mePwU4KKruf
         cdYeW8JE7nAmMwwQXlIERL8Oi8mNXT8Lo8TJ0RYX0z5FF9jWOSUddCu3TGXj8tgth2zd
         U3odPgc/sz/nxHapCCBIm6Gp0Pu1R8eJ/VVCJwSy4+0ZF/XjUsECCCenuT0MYOVDGUp+
         buz/YNyGipf6sEJEZWSyed6HODbH4PryfGKAal7gI1/NNNV9M9ohYpJzEz06NESihWAH
         gNn2HoLoQzl4BMrFdPacJQbFPiYvdsL1L/cq7Ft6c5VPzlEqmMUGdfk7Rh7E92GdzL0V
         WhDQ==
X-Gm-Message-State: AOAM532MPA5Rl63wJaZIYyceKBndwnlcD36+FKgT3SIoO4Al6BGOvIlo
        9oRHq+2+lQPhwaIZt+/xp7wKuu2g3ilxOw==
X-Google-Smtp-Source: ABdhPJwPPmgBSJQCnMVeLaIAK/XjDDOWwujisNS3yh2AjAvW38J5FH8H2OCt1Cl3pRoVrFS2WI5C9g==
X-Received: by 2002:a92:5f5b:: with SMTP id t88mr4074292ilb.170.1603988362357;
        Thu, 29 Oct 2020 09:19:22 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id j85sm3034524ilg.82.2020.10.29.09.19.21
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:19:21 -0700 (PDT)
To:     linux-parisc@vger.kernel.org
From:   Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] linux-parisc@vger.kernel.org
Message-ID: <18ca5e8a-2ae9-a15b-24c4-4b6b501c9121@kernel.dk>
Date:   Thu, 29 Oct 2020 10:19:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Wire up TIF_NOTIFY_SIGNAL handling for parisc.

Cc: linux-parisc@vger.kernel.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/parisc/include/asm/thread_info.h | 4 +++-
 arch/parisc/kernel/signal.c           | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index 285757544cca..0bd38a972cea 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -52,6 +52,7 @@ struct thread_info {
 #define TIF_POLLING_NRFLAG	3	/* true if poll_idle() is polling TIF_NEED_RESCHED */
 #define TIF_32BIT               4       /* 32 bit binary */
 #define TIF_MEMDIE		5	/* is terminating due to OOM killer */
+#define TIF_NOTIFY_SIGNAL	6	/* signal notifications exist */
 #define TIF_SYSCALL_AUDIT	7	/* syscall auditing active */
 #define TIF_NOTIFY_RESUME	8	/* callback before returning to user */
 #define TIF_SINGLESTEP		9	/* single stepping? */
@@ -61,6 +62,7 @@ struct thread_info {
 
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
+#define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
 #define _TIF_POLLING_NRFLAG	(1 << TIF_POLLING_NRFLAG)
 #define _TIF_32BIT		(1 << TIF_32BIT)
@@ -72,7 +74,7 @@ struct thread_info {
 #define _TIF_SYSCALL_TRACEPOINT	(1 << TIF_SYSCALL_TRACEPOINT)
 
 #define _TIF_USER_WORK_MASK     (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | \
-                                 _TIF_NEED_RESCHED)
+                                 _TIF_NEED_RESCHED | _TIF_NOTIFY_SIGNAL)
 #define _TIF_SYSCALL_TRACE_MASK (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP |	\
 				 _TIF_BLOCKSTEP | _TIF_SYSCALL_AUDIT | \
 				 _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT)
diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 9f43eaeb0b0a..fb1e94a3982b 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -603,7 +603,8 @@ do_signal(struct pt_regs *regs, long in_syscall)
 
 void do_notify_resume(struct pt_regs *regs, long in_syscall)
 {
-	if (test_thread_flag(TIF_SIGPENDING))
+	if (test_thread_flag(TIF_SIGPENDING) ||
+	    test_thread_flag(TIF_NOTIFY_SIGNAL))
 		do_signal(regs, in_syscall);
 
 	if (test_thread_flag(TIF_NOTIFY_RESUME))
-- 
2.29.0

-- 
Jens Axboe


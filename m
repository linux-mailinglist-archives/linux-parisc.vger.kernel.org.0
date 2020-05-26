Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7535B1AF4D9
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Apr 2020 22:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbgDRUWD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 18 Apr 2020 16:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728525AbgDRUUZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Apr 2020 16:20:25 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD42C061A0C
        for <linux-parisc@vger.kernel.org>; Sat, 18 Apr 2020 13:20:25 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id d17so7134151wrg.11
        for <linux-parisc@vger.kernel.org>; Sat, 18 Apr 2020 13:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=80X4Yab7gc2dKXb2/166nv1tQUsG/OBzmENTNDm0wlc=;
        b=JcYr+CRilpJzyu/qow3rrSl6FBw67qD0akW1r35aXubgviX9l0a+uW2IEylx13gIAv
         TafC8EgPt6GBXk9J/znJpUhtdSd9xwv8YKnXlIdunWL+ZGlS5zsj3edAVw5yeS/F38r+
         b0r/qwnRn4qylLjJtD+dE6alVNsTHRy+0WBmzBz5ZjP8ThwrhAMJ8Lhx2vn6/0BOKJlT
         Hy9Lu68OFn+WxcKql1/mT+RP1lHZRXom7HtLnspmCX0BM98V0T8Ez+dNIUQ+PKAKQ8Bs
         YZPHDW7NaUEyREfsv8izAHiComdLV3vdqhOwBb9cBAWdc298OCJaZ0Mdcgl1ZEv9wFZ4
         KWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=80X4Yab7gc2dKXb2/166nv1tQUsG/OBzmENTNDm0wlc=;
        b=tK4MeFPp8gBiY2eWMG/hLVNN7ipJbhT0bvjhhjhqBrDn+TOehCJA10wkCUiECoB02x
         3tj2op8qVZRKW+MoB14aDU8vX8zsAkIuPpheYUwicAP1Su8Z0fuqiI2c/u/kaCRZa1hp
         z67sVlOLN8HVEwi1fSswH01qPe0n0r+wHJgjaO9lJUOfMn5h0EIPCOTXrIC/D1dBhJ/M
         3tHRBIwQaR7HwBPkQrcq6pZwo2Lnz1LrinJq26GI0b8lhZrCMYTjEt/9pA6cs2SkA7F2
         OPuCJbkhtCOOwKxRCDuWT6PNCD8ehZOaMbDhNIZFna7FF4PaFOPc/UcU5typLYtE9Bwt
         ZrMw==
X-Gm-Message-State: AGi0Pua1HGs/6wXy66H3EIX3ChNrWwx1R9a1QvtsjfgdeYYCxv0LthyN
        rbsfnMu6IDd8maYg6qlAShadRg==
X-Google-Smtp-Source: APiQypIUuLwWELrUVMinedHW76ZSJt4aH18ARhtOE/1lhi6OBsrcNi3F3erb1YFpm2CvQ7S0lcxIOA==
X-Received: by 2002:adf:df01:: with SMTP id y1mr10316118wrl.401.1587241224172;
        Sat, 18 Apr 2020 13:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id m1sm31735255wro.64.2020.04.18.13.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:20:23 -0700 (PDT)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-parisc@vger.kernel.org
Subject: [PATCHv3 25/50] parisc: Add show_stack_loglvl()
Date:   Sat, 18 Apr 2020 21:19:19 +0100
Message-Id: <20200418201944.482088-26-dima@arista.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418201944.482088-1-dima@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Currently, the log-level of show_stack() depends on a platform
realization. It creates situations where the headers are printed with
lower log level or higher than the stacktrace (depending on
a platform or user).

Furthermore, it forces the logic decision from user to an architecture
side. In result, some users as sysrq/kdb/etc are doing tricks with
temporary rising console_loglevel while printing their messages.
And in result it not only may print unwanted messages from other CPUs,
but also omit printing at all in the unlucky case where the printk()
was deferred.

Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
an easier approach than introducing more printk buffers.
Also, it will consolidate printings with headers.

Introduce show_stack_loglvl(), that eventually will substitute
show_stack().

Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-parisc@vger.kernel.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/parisc/kernel/traps.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 82fc01189488..c2411de3730f 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -49,7 +49,7 @@
 #include "../math-emu/math-emu.h"	/* for handle_fpe() */
 
 static void parisc_show_stack(struct task_struct *task,
-	struct pt_regs *regs);
+	struct pt_regs *regs, const char *loglvl);
 
 static int printbinary(char *buf, unsigned long x, int nbits)
 {
@@ -155,7 +155,7 @@ void show_regs(struct pt_regs *regs)
 		printk("%s IAOQ[1]: %pS\n", level, (void *) regs->iaoq[1]);
 		printk("%s RP(r2): %pS\n", level, (void *) regs->gr[2]);
 
-		parisc_show_stack(current, regs);
+		parisc_show_stack(current, regs, KERN_DEFAULT);
 	}
 }
 
@@ -170,37 +170,43 @@ static DEFINE_RATELIMIT_STATE(_hppa_rs,
 }
 
 
-static void do_show_stack(struct unwind_frame_info *info)
+static void do_show_stack(struct unwind_frame_info *info, const char *loglvl)
 {
 	int i = 1;
 
-	printk(KERN_CRIT "Backtrace:\n");
+	printk("%sBacktrace:\n", loglvl);
 	while (i <= MAX_UNWIND_ENTRIES) {
 		if (unwind_once(info) < 0 || info->ip == 0)
 			break;
 
 		if (__kernel_text_address(info->ip)) {
-			printk(KERN_CRIT " [<" RFMT ">] %pS\n",
-				info->ip, (void *) info->ip);
+			printk("%s [<" RFMT ">] %pS\n",
+				loglvl, info->ip, (void *) info->ip);
 			i++;
 		}
 	}
-	printk(KERN_CRIT "\n");
+	printk("%s\n", loglvl);
 }
 
 static void parisc_show_stack(struct task_struct *task,
-	struct pt_regs *regs)
+	struct pt_regs *regs, const char *loglvl)
 {
 	struct unwind_frame_info info;
 
 	unwind_frame_init_task(&info, task, regs);
 
-	do_show_stack(&info);
+	do_show_stack(&info, loglvl);
+}
+
+void show_stack_loglvl(struct task_struct *t, unsigned long *sp,
+		       const char *loglvl)
+{
+	parisc_show_stack(t, NULL, loglvl);
 }
 
 void show_stack(struct task_struct *t, unsigned long *sp)
 {
-	parisc_show_stack(t, NULL);
+	show_stack_loglvl(t, sp, KERN_CRIT)
 }
 
 int is_valid_bugaddr(unsigned long iaoq)
@@ -446,7 +452,7 @@ void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long o
 		/* show_stack(NULL, (unsigned long *)regs->gr[30]); */
 		struct unwind_frame_info info;
 		unwind_frame_init(&info, current, regs);
-		do_show_stack(&info);
+		do_show_stack(&info, KERN_CRIT);
 	}
 
 	printk("\n");
-- 
2.26.0


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3081B186D70
	for <lists+linux-parisc@lfdr.de>; Mon, 16 Mar 2020 15:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731627AbgCPOlh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 Mar 2020 10:41:37 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39782 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731596AbgCPOlg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 Mar 2020 10:41:36 -0400
Received: by mail-pl1-f194.google.com with SMTP id j20so8099622pll.6
        for <linux-parisc@vger.kernel.org>; Mon, 16 Mar 2020 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ooWUba+WuFM1LT+rG8Ix9OwtU31ZH6sCxTrj5FjF2+E=;
        b=RRzmiGntFjx3swzVfTda7U4xZacTsYm6K9zFvuZcyL1jVtrG2V+lgrSGjSTqpPDiIR
         bhNBPwtU23IIj81xOpKjNaymf6lt2WfyOJ4BhH93umWmwKy/QQwLly+6ZBd7ztyrGFGD
         gjPBVuoeOqJ4LNhi0O3L3m3NpJoUqGL25p84Xb0QsQg5gEG7U42ouuMmUyAOzd2K9gRr
         UNe+jUcZmr0N7Na38Uk/FPwEtlh8XN/xf6ThS12jyTwZ4XXVFAHCVpRwu2xfeg/K1os3
         7YR7V/8DhUqoE2SdpZdfdr/BONtod+KRq2nxG5zLE1isiFK7x3Lv3/s6IPuRq1T8FR7/
         /6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ooWUba+WuFM1LT+rG8Ix9OwtU31ZH6sCxTrj5FjF2+E=;
        b=Rmr+V4W6XKEKuHG0ZeidjKopWIzlyO5SrRX6uGyTugxxK9qjREjo+AR1N6Js/2IfQf
         0esKUwPXIvIhOfkHxesn+lbCr1s7WpQ66WBcJZEnQZTP1l9+wdg1KN2aGoD1D7RdlaCL
         DWwVaCQwu7LLec2EytdejJP7Cv5LjWl2dvD0pt/13iY6FQqOT2X2eVRMrlJOwvNHx50q
         4mvWoCyPX9VLUhOfu6FIRIW+YZY9D7C/MNa9lROB5ADY9mfZ1n+8BEpI26cj1aPRNK3+
         HmUU2pxnNCzuFQrZZpHxSVAcdosoQ7jyYrm+IZpDukohQjV3e72z/IDkZCPTXdYojKZM
         J//A==
X-Gm-Message-State: ANhLgQ2Uca9nW2ZnSgjMMv8HPXTqO+v55MSMiOMG+qzm3CxcTujE1o8k
        nROZZXj9x+aTu7LdWObUVK9QGw==
X-Google-Smtp-Source: ADFU+vuk1Nax5JXjWEjr21XPm5/y0ppQ2bw6f25AJVd/HAFgjQBil3QYq0tzGY1BdFrIh7N2s8c0bg==
X-Received: by 2002:a17:90a:c301:: with SMTP id g1mr25092050pjt.88.1584369694718;
        Mon, 16 Mar 2020 07:41:34 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 07:41:34 -0700 (PDT)
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
Subject: [PATCHv2 25/50] parisc: Add show_stack_loglvl()
Date:   Mon, 16 Mar 2020 14:38:51 +0000
Message-Id: <20200316143916.195608-26-dima@arista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316143916.195608-1-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
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
2.25.1


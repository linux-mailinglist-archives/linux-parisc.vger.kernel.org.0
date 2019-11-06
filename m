Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00A8CF0C81
	for <lists+linux-parisc@lfdr.de>; Wed,  6 Nov 2019 04:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387980AbfKFDHq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 5 Nov 2019 22:07:46 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42481 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387975AbfKFDHp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 5 Nov 2019 22:07:45 -0500
Received: by mail-pf1-f194.google.com with SMTP id s5so9472870pfh.9
        for <linux-parisc@vger.kernel.org>; Tue, 05 Nov 2019 19:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NYMXo5tm1vSQYBY7oCGznRMKQHPJSlsp16NmNOYCIiM=;
        b=UBC7Y7/xFdaEvQmFoWJTKNH293yye4eq68qOdzP3p96qK6trmKAtFgWI7p+yPjecB2
         VuPcXJRSd7HFwSy1Qqkrt76lOr8lcRCcDpDnlxWPlNOGGZJNpTJ3v+mrB790s3AxfX9K
         ldC3iVk1goR79u5DeB0Loj0Cm9Vn40BxP7a9Q2OXSTcYEd7kqdTMopZaulv2xUToK4uY
         exLvjgFCPpcrUHyVd+hdP3U4N6Ek6ml0kGlEI/sqG0DJezwZwmjA0AiefSAWkBzt7rP8
         xc405ddbuIVxOV+7PhgwrfMz7x00eGNPHXN9cW7QSB0gUgdr2m1aeCmMFxBPKsdT9NDN
         SENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NYMXo5tm1vSQYBY7oCGznRMKQHPJSlsp16NmNOYCIiM=;
        b=XtiiEISXUOXuIS0v26jDU4GJLAcX91bvi3WweC9ZNfvMFfRxEWWlFvunTEOEHyKLZg
         tuwBYve7ZjUndBXdet6bn4PIOE33mbJwWt+tDlNTLYdGHYlTs+H8AB/cVbv+t3Kawryp
         hO2Z9PLzt+Y1y3KgOO62q2n0eOKT9Nh5Teq8kYK20NbPbCFt+AYJD/pvyCIjR7pZ8BOd
         x1LxkcL/Hcal9eHJwI0mhB1wS2JB6G1SxLN9X8arlFe0s4dyBdFCY/+MOuyzHZM1gEMG
         jES0BCcvSvL5BiL0CNdLs6XZlfm51J2X6VFnBUB5E0rFXEDyp4t/IKZkHsjGHwKQWFkA
         Ltjw==
X-Gm-Message-State: APjAAAVNzQ1P0iBVtTT+j+ShrJVI8s+5CYpxoDguXWk1XMXmAjZzGP+6
        ARm5CQDFxafvvASeisY8mn8ZUw==
X-Google-Smtp-Source: APXvYqwSml+8c3NmlSxGjro0cUsOMkTRgIB3xXs1VkWvcbapnFuLRoapTW0RCYHtNLRu/j52+hnloQ==
X-Received: by 2002:a62:2a41:: with SMTP id q62mr414892pfq.131.1573009664696;
        Tue, 05 Nov 2019 19:07:44 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:07:43 -0800 (PST)
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
Subject: [PATCH 25/50] parisc: Add show_stack_loglvl()
Date:   Wed,  6 Nov 2019 03:05:16 +0000
Message-Id: <20191106030542.868541-26-dima@arista.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
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
2.23.0


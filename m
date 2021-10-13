Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A126E42B347
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Oct 2021 05:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhJMDUK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Oct 2021 23:20:10 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:12222 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229526AbhJMDUK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Oct 2021 23:20:10 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R941e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=yun.wang@linux.alibaba.com;NM=1;PH=DS;RN=31;SR=0;TI=SMTPD_---0Ure8VYX_1634095080;
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com fp:SMTPD_---0Ure8VYX_1634095080)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 13 Oct 2021 11:18:01 +0800
Subject: [PATCH v2 2/2] ftrace: do CPU checking after preemption disabled
From:   =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
To:     Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Colin Ian King <colin.king@canonical.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        live-patching@vger.kernel.org
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <1a8e8d73-b508-f90b-0d82-eb2da45a720e@linux.alibaba.com>
Message-ID: <44c07848-c1e1-79f1-8356-4310c1bae037@linux.alibaba.com>
Date:   Wed, 13 Oct 2021 11:18:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1a8e8d73-b508-f90b-0d82-eb2da45a720e@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

With CONFIG_DEBUG_PREEMPT we observed reports like:

  BUG: using smp_processor_id() in preemptible
  caller is perf_ftrace_function_call+0x6f/0x2e0
  CPU: 1 PID: 680 Comm: a.out Not tainted
  Call Trace:
   <TASK>
   dump_stack_lvl+0x8d/0xcf
   check_preemption_disabled+0x104/0x110
   ? optimize_nops.isra.7+0x230/0x230
   ? text_poke_bp_batch+0x9f/0x310
   perf_ftrace_function_call+0x6f/0x2e0
   ...
   __text_poke+0x5/0x620
   text_poke_bp_batch+0x9f/0x310

This telling us the CPU could be changed after task is preempted, and
the checking on CPU before preemption will be invalid.

Since now ftrace_test_recursion_trylock() will help to disable the
preemption, this patch just do the checking after trylock() to address
the issue.

CC: Steven Rostedt <rostedt@goodmis.org>
Reported-by: Abaci <abaci@linux.alibaba.com>
Signed-off-by: Michael Wang <yun.wang@linux.alibaba.com>
---
 kernel/trace/trace_event_perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/trace_event_perf.c b/kernel/trace/trace_event_perf.c
index 6aed10e..fba8cb7 100644
--- a/kernel/trace/trace_event_perf.c
+++ b/kernel/trace/trace_event_perf.c
@@ -441,13 +441,13 @@ void perf_trace_buf_update(void *record, u16 type)
 	if (!rcu_is_watching())
 		return;

-	if ((unsigned long)ops->private != smp_processor_id())
-		return;
-
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;

+	if ((unsigned long)ops->private != smp_processor_id())
+		goto out;
+
 	event = container_of(ops, struct perf_event, ftrace_ops);

 	/*
-- 
1.8.3.1


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DB1430E5B
	for <lists+linux-parisc@lfdr.de>; Mon, 18 Oct 2021 05:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhJRDlr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 17 Oct 2021 23:41:47 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:32871 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230470AbhJRDlr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 17 Oct 2021 23:41:47 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R241e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=yun.wang@linux.alibaba.com;NM=1;PH=DS;RN=31;SR=0;TI=SMTPD_---0UsUnxv-_1634528369;
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com fp:SMTPD_---0UsUnxv-_1634528369)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 18 Oct 2021 11:39:31 +0800
Subject: [PATCH v4 1/2] ftrace: disable preemption when recursion locked
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
References: <32a36348-69ee-6464-390c-3a8d6e9d2b53@linux.alibaba.com>
Message-ID: <21f21a86-e0a2-af69-00b0-a82588ddd7ee@linux.alibaba.com>
Date:   Mon, 18 Oct 2021 11:39:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <32a36348-69ee-6464-390c-3a8d6e9d2b53@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

As the documentation explained, ftrace_test_recursion_trylock()
and ftrace_test_recursion_unlock() were supposed to disable and
enable preemption properly, however currently this work is done
outside of the function, which could be missing by mistake.

And since the internal using of trace_test_and_set_recursion()
and trace_clear_recursion() also require preemption disabled, we
can just merge the logical.

This patch will make sure the preemption has been disabled when
trace_test_and_set_recursion() return bit >= 0, and
trace_clear_recursion() will enable the preemption if previously
enabled.

CC: Petr Mladek <pmladek@suse.com>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Miroslav Benes <mbenes@suse.cz>
Reported-by: Abaci <abaci@linux.alibaba.com>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Michael Wang <yun.wang@linux.alibaba.com>
---
 arch/csky/kernel/probes/ftrace.c     |  2 --
 arch/parisc/kernel/ftrace.c          |  2 --
 arch/powerpc/kernel/kprobes-ftrace.c |  2 --
 arch/riscv/kernel/probes/ftrace.c    |  2 --
 arch/x86/kernel/kprobes/ftrace.c     |  2 --
 include/linux/trace_recursion.h      | 20 +++++++++++++++++++-
 kernel/livepatch/patch.c             | 13 +++++++------
 kernel/trace/ftrace.c                | 15 +++++----------
 kernel/trace/trace_functions.c       |  5 -----
 9 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
index b388228..834cffc 100644
--- a/arch/csky/kernel/probes/ftrace.c
+++ b/arch/csky/kernel/probes/ftrace.c
@@ -17,7 +17,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		return;

 	regs = ftrace_get_regs(fregs);
-	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)ip);
 	if (!p) {
 		p = get_kprobe((kprobe_opcode_t *)(ip - MCOUNT_INSN_SIZE));
@@ -57,7 +56,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		__this_cpu_write(current_kprobe, NULL);
 	}
 out:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 0a1e75a..3543496 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -216,7 +216,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		return;

 	regs = ftrace_get_regs(fregs);
-	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)ip);
 	if (unlikely(!p) || kprobe_disabled(p))
 		goto out;
@@ -245,7 +244,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	}
 	__this_cpu_write(current_kprobe, NULL);
 out:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
index 7154d58..072ebe7 100644
--- a/arch/powerpc/kernel/kprobes-ftrace.c
+++ b/arch/powerpc/kernel/kprobes-ftrace.c
@@ -26,7 +26,6 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 		return;

 	regs = ftrace_get_regs(fregs);
-	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)nip);
 	if (unlikely(!p) || kprobe_disabled(p))
 		goto out;
@@ -61,7 +60,6 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 		__this_cpu_write(current_kprobe, NULL);
 	}
 out:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
index aab85a8..7142ec4 100644
--- a/arch/riscv/kernel/probes/ftrace.c
+++ b/arch/riscv/kernel/probes/ftrace.c
@@ -15,7 +15,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	if (bit < 0)
 		return;

-	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)ip);
 	if (unlikely(!p) || kprobe_disabled(p))
 		goto out;
@@ -52,7 +51,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		__this_cpu_write(current_kprobe, NULL);
 	}
 out:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
index 596de2f..dd2ec14 100644
--- a/arch/x86/kernel/kprobes/ftrace.c
+++ b/arch/x86/kernel/kprobes/ftrace.c
@@ -25,7 +25,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	if (bit < 0)
 		return;

-	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)ip);
 	if (unlikely(!p) || kprobe_disabled(p))
 		goto out;
@@ -59,7 +58,6 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		__this_cpu_write(current_kprobe, NULL);
 	}
 out:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index a9f9c57..f13a9f9 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -159,6 +159,9 @@ static __always_inline int trace_get_context_bit(void)
 # define do_ftrace_record_recursion(ip, pip)	do { } while (0)
 #endif

+/*
+ * Preemption is promised to be disabled when return bit >= 0.
+ */
 static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsigned long pip,
 							int start, int max)
 {
@@ -189,14 +192,29 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 	current->trace_recursion = val;
 	barrier();

+	/*
+	 * Disable preemption to fulfill the promise.
+	 *
+	 * Don't worry about the bit 0 cases, they indicate
+	 * the disabling behaviour has already been done by
+	 * internal call previously.
+	 */
+	preempt_disable_notrace();
+
 	return bit + 1;
 }

+/*
+ * Preemption will be enabled (if it was previously enabled).
+ */
 static __always_inline void trace_clear_recursion(int bit)
 {
 	if (!bit)
 		return;

+	if (bit > 0)
+		preempt_enable_notrace();
+
 	barrier();
 	bit--;
 	trace_recursion_clear(bit);
@@ -209,7 +227,7 @@ static __always_inline void trace_clear_recursion(int bit)
  * tracing recursed in the same context (normal vs interrupt),
  *
  * Returns: -1 if a recursion happened.
- *           >= 0 if no recursion
+ *           >= 0 if no recursion.
  */
 static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
 							 unsigned long parent_ip)
diff --git a/kernel/livepatch/patch.c b/kernel/livepatch/patch.c
index e8029ae..b8d75fb 100644
--- a/kernel/livepatch/patch.c
+++ b/kernel/livepatch/patch.c
@@ -49,14 +49,16 @@ static void notrace klp_ftrace_handler(unsigned long ip,

 	ops = container_of(fops, struct klp_ops, fops);

+	/*
+	 *
+	 * The ftrace_test_recursion_trylock() will disable preemption,
+	 * which is required for the variant of synchronize_rcu() that is
+	 * used to allow patching functions where RCU is not watching.
+	 * See klp_synchronize_transition() for more details.
+	 */
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (WARN_ON_ONCE(bit < 0))
 		return;
-	/*
-	 * A variant of synchronize_rcu() is used to allow patching functions
-	 * where RCU is not watching, see klp_synchronize_transition().
-	 */
-	preempt_disable_notrace();

 	func = list_first_or_null_rcu(&ops->func_stack, struct klp_func,
 				      stack_node);
@@ -120,7 +122,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
 	klp_arch_set_pc(fregs, (unsigned long)func->new_func);

 unlock:
-	preempt_enable_notrace();
 	ftrace_test_recursion_unlock(bit);
 }

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 7d0fd89..35cccef 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6977,16 +6977,15 @@ void ftrace_reset_array_ops(struct trace_array *tr)
 	struct ftrace_ops *op;
 	int bit;

+	/*
+	 * The ftrace_test_and_set_recursion() will disable preemption,
+	 * which is required since some of the ops may be dynamically
+	 * allocated, they must be freed after a synchronize_rcu().
+	 */
 	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_LIST_START, TRACE_LIST_MAX);
 	if (bit < 0)
 		return;

-	/*
-	 * Some of the ops may be dynamically allocated,
-	 * they must be freed after a synchronize_rcu().
-	 */
-	preempt_disable_notrace();
-
 	do_for_each_ftrace_op(op, ftrace_ops_list) {
 		/* Stub functions don't need to be called nor tested */
 		if (op->flags & FTRACE_OPS_FL_STUB)
@@ -7010,7 +7009,6 @@ void ftrace_reset_array_ops(struct trace_array *tr)
 		}
 	} while_for_each_ftrace_op(op);
 out:
-	preempt_enable_notrace();
 	trace_clear_recursion(bit);
 }

@@ -7056,12 +7054,9 @@ static void ftrace_ops_assist_func(unsigned long ip, unsigned long parent_ip,
 	if (bit < 0)
 		return;

-	preempt_disable_notrace();
-
 	if (!(op->flags & FTRACE_OPS_FL_RCU) || rcu_is_watching())
 		op->func(ip, parent_ip, op, fregs);

-	preempt_enable_notrace();
 	trace_clear_recursion(bit);
 }
 NOKPROBE_SYMBOL(ftrace_ops_assist_func);
diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
index 1f0e63f..9f1bfbe 100644
--- a/kernel/trace/trace_functions.c
+++ b/kernel/trace/trace_functions.c
@@ -186,7 +186,6 @@ static void function_trace_start(struct trace_array *tr)
 		return;

 	trace_ctx = tracing_gen_ctx();
-	preempt_disable_notrace();

 	cpu = smp_processor_id();
 	data = per_cpu_ptr(tr->array_buffer.data, cpu);
@@ -194,7 +193,6 @@ static void function_trace_start(struct trace_array *tr)
 		trace_function(tr, ip, parent_ip, trace_ctx);

 	ftrace_test_recursion_unlock(bit);
-	preempt_enable_notrace();
 }

 #ifdef CONFIG_UNWINDER_ORC
@@ -298,8 +296,6 @@ static inline void process_repeats(struct trace_array *tr,
 	if (bit < 0)
 		return;

-	preempt_disable_notrace();
-
 	cpu = smp_processor_id();
 	data = per_cpu_ptr(tr->array_buffer.data, cpu);
 	if (atomic_read(&data->disabled))
@@ -324,7 +320,6 @@ static inline void process_repeats(struct trace_array *tr,

 out:
 	ftrace_test_recursion_unlock(bit);
-	preempt_enable_notrace();
 }

 static void
-- 
1.8.3.1


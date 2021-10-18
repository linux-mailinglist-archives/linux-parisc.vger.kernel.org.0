Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACAD4327DC
	for <lists+linux-parisc@lfdr.de>; Mon, 18 Oct 2021 21:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbhJRTqa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 18 Oct 2021 15:46:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:33420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231977AbhJRTq2 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 18 Oct 2021 15:46:28 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7746960F57;
        Mon, 18 Oct 2021 19:44:14 +0000 (UTC)
Date:   Mon, 18 Oct 2021 15:44:12 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>, Ingo Molnar <mingo@redhat.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
        Joe Lawrence <joe.lawrence@redhat.com>,
        Colin Ian King <colin.king@canonical.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, live-patching@vger.kernel.org,
        =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>,
        Guo Ren <guoren@kernel.org>
Subject: [PATCH v2] tracing: Have all levels of checks prevent recursion
Message-ID: <20211018154412.09fcad3c@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

[
   Linus,
     I have patches that clean this up that are not marked for stable, but
     will depend on this patch. As I already have commits in my next queue,
     I can do one of the following:

    1. Cherry pick this from my urgent tree, and build everything on top.
    2. Add this on top of the mainline tag my next branch is based on and
       merge it.
    3. Add this to my next branch, and have it go in at the next merge
       window.
]

From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

While writing an email explaining the "bit = 0" logic for a discussion on
making ftrace_test_recursion_trylock() disable preemption, I discovered a
path that makes the "not do the logic if bit is zero" unsafe.

The recursion logic is done in hot paths like the function tracer. Thus,
any code executed causes noticeable overhead. Thus, tricks are done to try
to limit the amount of code executed. This included the recursion testing
logic.

Having recursion testing is important, as there are many paths that can
end up in an infinite recursion cycle when tracing every function in the
kernel. Thus protection is needed to prevent that from happening.

Because it is OK to recurse due to different running context levels (e.g.
an interrupt preempts a trace, and then a trace occurs in the interrupt
handler), a set of bits are used to know which context one is in (normal,
softirq, irq and NMI). If a recursion occurs in the same level, it is
prevented*.

Then there are infrastructure levels of recursion as well. When more than
one callback is attached to the same function to trace, it calls a loop
function to iterate over all the callbacks. Both the callbacks and the
loop function have recursion protection. The callbacks use the
"ftrace_test_recursion_trylock()" which has a "function" set of context
bits to test, and the loop function calls the internal
trace_test_and_set_recursion() directly, with an "internal" set of bits.

If an architecture does not implement all the features supported by ftrace
then the callbacks are never called directly, and the loop function is
called instead, which will implement the features of ftrace.

Since both the loop function and the callbacks do recursion protection, it
was seemed unnecessary to do it in both locations. Thus, a trick was made
to have the internal set of recursion bits at a more significant bit
location than the function bits. Then, if any of the higher bits were set,
the logic of the function bits could be skipped, as any new recursion
would first have to go through the loop function.

This is true for architectures that do not support all the ftrace
features, because all functions being traced must first go through the
loop function before going to the callbacks. But this is not true for
architectures that support all the ftrace features. That's because the
loop function could be called due to two callbacks attached to the same
function, but then a recursion function inside the callback could be
called that does not share any other callback, and it will be called
directly.

i.e.

 traced_function_1: [ more than one callback tracing it ]
   call loop_func

 loop_func:
   trace_recursion set internal bit
   call callback

 callback:
   trace_recursion [ skipped because internal bit is set, return 0 ]
   call traced_function_2

 traced_function_2: [ only traced by above callback ]
   call callback

 callback:
   trace_recursion [ skipped because internal bit is set, return 0 ]
   call traced_function_2

 [ wash, rinse, repeat, BOOM! out of shampoo! ]

Thus, the "bit == 0 skip" trick is not safe, unless the loop function is
call for all functions.

Since we want to encourage architectures to implement all ftrace features,
having them slow down due to this extra logic may encourage the
maintainers to update to the latest ftrace features. And because this
logic is only safe for them, remove it completely.

 [*] There is on layer of recursion that is allowed, and that is to allow
     for the transition between interrupt context (normal -> softirq ->
     irq -> NMI), because a trace may occur before the context update is
     visible to the trace recursion logic.

Link: https://lore.kernel.org/all/609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com/

Cc: stable@vger.kernel.org
Fixes: edc15cafcbfa3 ("tracing: Avoid unnecessary multiple recursion checks")
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
Changes since v1:
   - Removed "max" parameter (Petr Mladek)
     Petr, I did not update the comment, because that can/should be a
     separate patch, as the comment was there before this patch.

 include/linux/trace_recursion.h | 49 ++++++---------------------------
 kernel/trace/ftrace.c           |  4 +--
 2 files changed, 11 insertions(+), 42 deletions(-)

diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index a9f9c5714e65..fe95f0922526 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -16,23 +16,8 @@
  *  When function tracing occurs, the following steps are made:
  *   If arch does not support a ftrace feature:
  *    call internal function (uses INTERNAL bits) which calls...
- *   If callback is registered to the "global" list, the list
- *    function is called and recursion checks the GLOBAL bits.
- *    then this function calls...
  *   The function callback, which can use the FTRACE bits to
  *    check for recursion.
- *
- * Now if the arch does not support a feature, and it calls
- * the global list function which calls the ftrace callback
- * all three of these steps will do a recursion protection.
- * There's no reason to do one if the previous caller already
- * did. The recursion that we are protecting against will
- * go through the same steps again.
- *
- * To prevent the multiple recursion checks, if a recursion
- * bit is set that is higher than the MAX bit of the current
- * check, then we know that the check was made by the previous
- * caller, and we can skip the current check.
  */
 enum {
 	/* Function recursion bits */
@@ -40,12 +25,14 @@ enum {
 	TRACE_FTRACE_NMI_BIT,
 	TRACE_FTRACE_IRQ_BIT,
 	TRACE_FTRACE_SIRQ_BIT,
+	TRACE_FTRACE_TRANSITION_BIT,
 
-	/* INTERNAL_BITs must be greater than FTRACE_BITs */
+	/* Internal use recursion bits */
 	TRACE_INTERNAL_BIT,
 	TRACE_INTERNAL_NMI_BIT,
 	TRACE_INTERNAL_IRQ_BIT,
 	TRACE_INTERNAL_SIRQ_BIT,
+	TRACE_INTERNAL_TRANSITION_BIT,
 
 	TRACE_BRANCH_BIT,
 /*
@@ -86,12 +73,6 @@ enum {
 	 */
 	TRACE_GRAPH_NOTRACE_BIT,
 
-	/*
-	 * When transitioning between context, the preempt_count() may
-	 * not be correct. Allow for a single recursion to cover this case.
-	 */
-	TRACE_TRANSITION_BIT,
-
 	/* Used to prevent recursion recording from recursing. */
 	TRACE_RECORD_RECURSION_BIT,
 };
@@ -113,12 +94,10 @@ enum {
 #define TRACE_CONTEXT_BITS	4
 
 #define TRACE_FTRACE_START	TRACE_FTRACE_BIT
-#define TRACE_FTRACE_MAX	((1 << (TRACE_FTRACE_START + TRACE_CONTEXT_BITS)) - 1)
 
 #define TRACE_LIST_START	TRACE_INTERNAL_BIT
-#define TRACE_LIST_MAX		((1 << (TRACE_LIST_START + TRACE_CONTEXT_BITS)) - 1)
 
-#define TRACE_CONTEXT_MASK	TRACE_LIST_MAX
+#define TRACE_CONTEXT_MASK	((1 << (TRACE_LIST_START + TRACE_CONTEXT_BITS)) - 1)
 
 /*
  * Used for setting context
@@ -132,6 +111,7 @@ enum {
 	TRACE_CTX_IRQ,
 	TRACE_CTX_SOFTIRQ,
 	TRACE_CTX_NORMAL,
+	TRACE_CTX_TRANSITION,
 };
 
 static __always_inline int trace_get_context_bit(void)
@@ -160,45 +140,34 @@ extern void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip);
 #endif
 
 static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsigned long pip,
-							int start, int max)
+							int start)
 {
 	unsigned int val = READ_ONCE(current->trace_recursion);
 	int bit;
 
-	/* A previous recursion check was made */
-	if ((val & TRACE_CONTEXT_MASK) > max)
-		return 0;
-
 	bit = trace_get_context_bit() + start;
 	if (unlikely(val & (1 << bit))) {
 		/*
 		 * It could be that preempt_count has not been updated during
 		 * a switch between contexts. Allow for a single recursion.
 		 */
-		bit = TRACE_TRANSITION_BIT;
+		bit = TRACE_CTX_TRANSITION + start;
 		if (val & (1 << bit)) {
 			do_ftrace_record_recursion(ip, pip);
 			return -1;
 		}
-	} else {
-		/* Normal check passed, clear the transition to allow it again */
-		val &= ~(1 << TRACE_TRANSITION_BIT);
 	}
 
 	val |= 1 << bit;
 	current->trace_recursion = val;
 	barrier();
 
-	return bit + 1;
+	return bit;
 }
 
 static __always_inline void trace_clear_recursion(int bit)
 {
-	if (!bit)
-		return;
-
 	barrier();
-	bit--;
 	trace_recursion_clear(bit);
 }
 
@@ -214,7 +183,7 @@ static __always_inline void trace_clear_recursion(int bit)
 static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
 							 unsigned long parent_ip)
 {
-	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
+	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START);
 }
 
 /**
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 7efbc8aaf7f6..635fbdc9d589 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6977,7 +6977,7 @@ __ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
 	struct ftrace_ops *op;
 	int bit;
 
-	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_LIST_START, TRACE_LIST_MAX);
+	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_LIST_START);
 	if (bit < 0)
 		return;
 
@@ -7052,7 +7052,7 @@ static void ftrace_ops_assist_func(unsigned long ip, unsigned long parent_ip,
 {
 	int bit;
 
-	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_LIST_START, TRACE_LIST_MAX);
+	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_LIST_START);
 	if (bit < 0)
 		return;
 
-- 
2.31.1


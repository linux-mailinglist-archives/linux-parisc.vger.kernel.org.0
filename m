Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356F342BADF
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Oct 2021 10:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238892AbhJMIxN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 13 Oct 2021 04:53:13 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:42703 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238450AbhJMIxN (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 13 Oct 2021 04:53:13 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R501e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=yun.wang@linux.alibaba.com;NM=1;PH=DS;RN=31;SR=0;TI=SMTPD_---0UrfYR3s_1634115063;
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com fp:SMTPD_---0UrfYR3s_1634115063)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 13 Oct 2021 16:51:04 +0800
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
From:   =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Subject: [PATCH v3 0/2] fix & prevent the missing preemption disabling
Message-ID: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
Date:   Wed, 13 Oct 2021 16:51:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The testing show that perf_ftrace_function_call() are using smp_processor_id()
with preemption enabled, all the checking on CPU could be wrong after preemption.

As Peter point out, the section between ftrace_test_recursion_trylock/unlock()
pair require the preemption to be disabled as 'Documentation/trace/ftrace-uses.rst'
explained, but currently the work is done outside of the helpers.

Patch 1/2 will make sure preemption disabled after trylock() succeed,
patch 2/2 will do smp_processor_id() checking after trylock to address the
issue.

v1: https://lore.kernel.org/all/8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com/
v2: https://lore.kernel.org/all/b1d7fe43-ce84-0ed7-32f7-ea1d12d0b716@linux.alibaba.com/

Michael Wang (2):
  ftrace: disable preemption between ftrace_test_recursion_trylock/unlock()
  ftrace: do CPU checking after preemption disabled

 arch/csky/kernel/probes/ftrace.c     |  2 --
 arch/parisc/kernel/ftrace.c          |  2 --
 arch/powerpc/kernel/kprobes-ftrace.c |  2 --
 arch/riscv/kernel/probes/ftrace.c    |  2 --
 arch/x86/kernel/kprobes/ftrace.c     |  2 --
 include/linux/trace_recursion.h      | 17 ++++++++++++++++-
 kernel/livepatch/patch.c             | 13 +++++++------
 kernel/trace/trace_event_perf.c      |  6 +++---
 kernel/trace/trace_functions.c       |  5 -----
 9 files changed, 26 insertions(+), 25 deletions(-)

-- 
1.8.3.1


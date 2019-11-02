Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAE3ECE90
	for <lists+linux-parisc@lfdr.de>; Sat,  2 Nov 2019 13:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfKBMMd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 2 Nov 2019 08:12:33 -0400
Received: from foss.arm.com ([217.140.110.172]:46692 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726163AbfKBMMd (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 2 Nov 2019 08:12:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 820ED31F;
        Sat,  2 Nov 2019 05:12:32 -0700 (PDT)
Received: from [10.162.0.144] (a075553-lin.blr.arm.com [10.162.0.144])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D83913F718;
        Sat,  2 Nov 2019 05:12:27 -0700 (PDT)
Subject: Re: [PATCHv2 0/8] arm64: ftrace cleanup + FTRACE_WITH_REGS
To:     Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
        deller@gmx.de, duwe@suse.de, James.Bottomley@HansenPartnership.com,
        james.morse@arm.com, jeyu@kernel.org, jpoimboe@redhat.com,
        jthierry@redhat.com, linux-parisc@vger.kernel.org,
        mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org,
        svens@stackframe.org, takahiro.akashi@linaro.org, will@kernel.org
References: <20191029165832.33606-1-mark.rutland@arm.com>
From:   Amit Daniel Kachhap <amit.kachhap@arm.com>
Message-ID: <42c113ee-e7fc-3e94-cca0-f05f1c89fdb8@arm.com>
Date:   Sat, 2 Nov 2019 17:42:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191029165832.33606-1-mark.rutland@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Mark,

On 10/29/19 10:28 PM, Mark Rutland wrote:
> Hi,
> 
> This series is a reworked version of Torsten's FTRACE_WITH_REGS series
> [1]. I've tried to rework the existing code in preparatory patches so
> that the patchable-function-entry bits slot in with fewer surprises.
> This version is based on v5.4-rc3, and can be found in my
> arm64/ftrace-with-regs branch [2].
> 
> Patch 1 adds an (optional) ftrace_init_nop(), which the core code uses
> to initialize callsites. This allows us to avoid a synthetic MCOUNT_ADDR
> symbol, and more cleanly separates the one-time initialization of the
> callsite from dynamic NOP<->CALL modification. Architectures which don't
> implement this get the existing ftrace_make_nop() with MCOUNT_ADDR.
> 
> Recently parisc gained ftrace support using patchable-function-entry.
> Patch 2 makes the handling of module callsite locations common in
> kernel/module.c with a new FTRACE_CALLSITE_SECTION definition, and
> removed the newly redundant bits from arch/parisc.
> 
> Patches 3 and 4 move the module PLT initialization to module load time,
> which simplifies runtime callsite modification. This also means that we
> don't transitently mark the module text RW, and will allow for the
> removal of module_disable_ro().
> 
> Patches 5 and 6 add some trivial infrastructure, with patch 7 finally
> adding FTRACE_WITH_REGS support. Additional work will be required for
> livepatching (e.g. implementing reliable stack trace), which is
> commented as part of patch 7.
> 
> Patch 8 is a trivial cleanup atop of the rest of the series, making the
> code easier to read and less susceptible to config-specific breakage.
I tested the whole series with my latest in-kernel ptrauth patches [1]
and graph_tracer/function_graph_tracer works fine, So for the whole series,
Tested-by: Amit Daniel Kachhap <amit.kachhap@arm.com>

Also I gave few minor comments in the individual patches. With those
comments,
Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>

Thanks,
Amit Daniel
[1]: https://patchwork.kernel.org/cover/11195085/
> 
> Since v1 [3]:
> * Add a couple of people to Cc
> * Fold in Ard's Reviewed-by tag
> * Rename ftrace_code_init_disabled() to ftrace_nop_initialize()
> * Move ftrace_init_nop() to <linux/ftrace.h>, with kerneldoc
> * Update kerneldoc for rec parameters
> 
> Thanks,
> Mark.
> 
> [1] https://lore.kernel.org/r/20190208150826.44EBC68DD2@newverein.lst.de
> [2] git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/ftrace-with-regs
> [3] https://lore.kernel.org/r/20191021163426.9408-1-mark.rutland@arm.com
> 
> Mark Rutland (7):
>    ftrace: add ftrace_init_nop()
>    module/ftrace: handle patchable-function-entry
>    arm64: module: rework special section handling
>    arm64: module/ftrace: intialize PLT at load time
>    arm64: insn: add encoder for MOV (register)
>    arm64: asm-offsets: add S_FP
>    arm64: ftrace: minimize ifdeffery
> 
> Torsten Duwe (1):
>    arm64: implement ftrace with regs
> 
>   arch/arm64/Kconfig               |   2 +
>   arch/arm64/Makefile              |   5 ++
>   arch/arm64/include/asm/ftrace.h  |  23 +++++++
>   arch/arm64/include/asm/insn.h    |   3 +
>   arch/arm64/include/asm/module.h  |   2 +-
>   arch/arm64/kernel/asm-offsets.c  |   1 +
>   arch/arm64/kernel/entry-ftrace.S | 140 +++++++++++++++++++++++++++++++++++++--
>   arch/arm64/kernel/ftrace.c       | 123 ++++++++++++++++++++--------------
>   arch/arm64/kernel/insn.c         |  13 ++++
>   arch/arm64/kernel/module-plts.c  |   3 +-
>   arch/arm64/kernel/module.c       |  57 +++++++++++++---
>   arch/parisc/Makefile             |   1 -
>   arch/parisc/kernel/module.c      |  10 ++-
>   arch/parisc/kernel/module.lds    |   7 --
>   include/linux/ftrace.h           |  40 ++++++++++-
>   kernel/module.c                  |   2 +-
>   kernel/trace/ftrace.c            |   6 +-
>   17 files changed, 355 insertions(+), 83 deletions(-)
>   delete mode 100644 arch/parisc/kernel/module.lds
> 

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD2444507F
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 09:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhKDImT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 04:42:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:54392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230084AbhKDImT (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 04:42:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA6BA611CB
        for <linux-parisc@vger.kernel.org>; Thu,  4 Nov 2021 08:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636015181;
        bh=wkNmzGAeM2bLUDPy8bQyL5uAddcEk9wTzmZooZT7kqk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DHZOUExM2EjkgLQ7FRF/zPPwMjxJdB16T4rsD9oDjFk+MvQVweTxwSFtFDPOrmlPl
         aS2Ukv5R79RgodV3R7NAOFm/uOg100pi1yde08U6trprYdCaE8LqU30TcXN0o/Qij7
         +ManXrZ5ycJyiG3ke4eUtMWGbhv8fnECZhyrPLM0jt2B95ulSRPiX+FnNjm4x5WLT0
         4zRw3KXAyA1c//tamM4oDz7SZH5qLWoRdjPPknz8LF6GkYNavR0dyKPcZihMT4p4xT
         sNUZWX8vKJdBsZOxn1/frinhsQg9TdPMgOll2cIRJk7zmW/mo8h5xFzzemTotvrG3Q
         GkYVlYyuoU09g==
Received: by mail-ot1-f53.google.com with SMTP id s19-20020a056830125300b0055ad9673606so6032359otp.0
        for <linux-parisc@vger.kernel.org>; Thu, 04 Nov 2021 01:39:41 -0700 (PDT)
X-Gm-Message-State: AOAM530xuaUESzbhSYJNrCVxKTLDjE2wqZLtPeC5LcXbVOLUlTwg+Ke9
        WTfEHwtWD2sqNB/4Bw/+2Nze7Fe8zjPDMieYdJA=
X-Google-Smtp-Source: ABdhPJyDCAhieGwMu2hCVfiLx8g4kRan4MaasfabdL1ejp+4UAP21lHTCheot44rU1WQjS6IxxVhiMVyAvOV6uit268=
X-Received: by 2002:a05:6830:14c:: with SMTP id j12mr7268502otp.147.1636015181095;
 Thu, 04 Nov 2021 01:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211104082628.2793555-1-ardb@kernel.org> <c48314bf-7a07-47d8-f15a-0e30f47d1920@gmx.de>
In-Reply-To: <c48314bf-7a07-47d8-f15a-0e30f47d1920@gmx.de>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 4 Nov 2021 09:39:30 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH7MpKFFB1g4G6YxMbhhZn1S5YkYAfBb_F5xnAkHpFO0g@mail.gmail.com>
Message-ID: <CAMj1kXH7MpKFFB1g4G6YxMbhhZn1S5YkYAfBb_F5xnAkHpFO0g@mail.gmail.com>
Subject: Re: [PATCH] parisc: move CPU field back into thread_info
To:     Helge Deller <deller@gmx.de>
Cc:     "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, 4 Nov 2021 at 09:31, Helge Deller <deller@gmx.de> wrote:
>
> On 11/4/21 09:26, Ard Biesheuvel wrote:
> > In commit 2214c0e77259 ("parisc: Move thread_info into task struct")
> > PA-RISC gained support for THREAD_INFO_IN_TASK while changes were
> > already underway to keep the CPU field in thread_info rather than move
> > it into task_struct when THREAD_INFO_IN_TASK is enabled. The result is a
> > broken build for all PA-RISC configs that enable SMP.
> >
> > So let's partially revert that commit, and get rid of the ugly hack to
> > get at the offset of task_struct::cpu without having to include
> > linux/sched.h, and put the CPU field back where it was before.
> >
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Fixes: bcf9033e5449 ("sched: move CPU field back into thread_info if THREAD_INFO_IN_TASK=y")
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Thanks Ard!
>
> I actually had the same patch finished right now too :-)
>

I was wondering about that :-)

> One small nid though. See below...
>
>
> > ---
> >  arch/parisc/include/asm/smp.h         | 19 ++-----------------
> >  arch/parisc/include/asm/thread_info.h |  2 ++
> >  arch/parisc/kernel/asm-offsets.c      |  4 +---
> >  arch/parisc/kernel/smp.c              |  2 +-
> >  4 files changed, 6 insertions(+), 21 deletions(-)
> >
> > diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/smp.h
> > index 16d41127500e..cba55abf7bac 100644
> > --- a/arch/parisc/include/asm/smp.h
> > +++ b/arch/parisc/include/asm/smp.h
> > @@ -34,23 +34,8 @@ extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
> >
> >  #endif /* !ASSEMBLY */
> >
> > -/*
> > - * This is particularly ugly: it appears we can't actually get the definition
> > - * of task_struct here, but we need access to the CPU this task is running on.
> > - * Instead of using task_struct we're using TASK_CPU which is extracted from
> > - * asm-offsets.h by kbuild to get the current processor ID.
> > - *
> > - * This also needs to be safeguarded when building asm-offsets.s because at
> > - * that time TASK_CPU is not defined yet. It could have been guarded by
> > - * TASK_CPU itself, but we want the build to fail if TASK_CPU is missing
> > - * when building something else than asm-offsets.s
> > - */
> > -#ifdef GENERATING_ASM_OFFSETS
> > -#define raw_smp_processor_id()               (0)
> > -#else
> > -#include <asm/asm-offsets.h>
> > -#define raw_smp_processor_id()               (*(unsigned int *)((void *)current + TASK_CPU))
> > -#endif
> > +#define raw_smp_processor_id() (current_thread_info()->cpu)
> > +
> >  #else /* CONFIG_SMP */
> >
> >  static inline void smp_send_all_nop(void) { return; }
> > diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
> > index 75657c2c54e1..d6268834bfa5 100644
> > --- a/arch/parisc/include/asm/thread_info.h
> > +++ b/arch/parisc/include/asm/thread_info.h
> > @@ -8,12 +8,14 @@
> >
> >  struct thread_info {
> >       unsigned long flags;            /* thread_info flags (see TIF_*) */
> > +     __u32 cpu;                      /* current CPU */
> >       int preempt_count;              /* 0=premptable, <0=BUG; will also serve as bh-counter */
> >  };
> >
> >  #define INIT_THREAD_INFO(tsk)                        \
> >  {                                            \
> >       .flags          = 0,                    \
> > +     .cpu            = 0,                    \
> >       .preempt_count  = INIT_PREEMPT_COUNT,   \
> >  }
> >
> > diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
> > index e35154035441..629d38e36e22 100644
> > --- a/arch/parisc/kernel/asm-offsets.c
> > +++ b/arch/parisc/kernel/asm-offsets.c
> > @@ -14,8 +14,6 @@
> >   *    Copyright (C) 2003 James Bottomley <jejb at parisc-linux.org>
> >   */
> >
> > -#define GENERATING_ASM_OFFSETS /* asm/smp.h */
> > -
> >  #include <linux/types.h>
> >  #include <linux/sched.h>
> >  #include <linux/thread_info.h>
> > @@ -40,7 +38,7 @@ int main(void)
> >       DEFINE(TASK_TI_FLAGS, offsetof(struct task_struct, thread_info.flags));
> >       DEFINE(TASK_STACK, offsetof(struct task_struct, stack));
> >  #ifdef CONFIG_SMP
> > -     DEFINE(TASK_CPU, offsetof(struct task_struct, cpu));
> > +     DEFINE(TASK_CPU, offsetof(struct task_struct, thread_info.cpu));
> >  #endif
>
> The TASK_CPU define isn't needed any longer.
> So, the whole part inside #ifdef..#endif can go.
>

OK let's just drop it then.

> >       BLANK();
> >       DEFINE(TASK_REGS, offsetof(struct task_struct, thread.regs));
> > diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
> > index 171925285f3e..0cd97fa004c5 100644
> > --- a/arch/parisc/kernel/smp.c
> > +++ b/arch/parisc/kernel/smp.c
> > @@ -339,7 +339,7 @@ int smp_boot_one_cpu(int cpuid, struct task_struct *idle)
> >       const struct cpuinfo_parisc *p = &per_cpu(cpu_data, cpuid);
> >       long timeout;
> >
> > -     idle->cpu = cpuid;
> > +     task_thread_info(idle)->cpu = cpuid;

I was wondering if this could simply be dropped altogether? I am
pretty sure it is redundant, as the core code sets this field as well,
but I don't have access to a SMP PA-RISC machine to test it.

> >
> >       /* Let _start know what logical CPU we're booting
> >       ** (offset into init_tasks[],cpu_data[])
> >

> If it's Ok for you I'll clean up your patch and submit
> all with the next pull request to Linus later today.
>

Whatever works for you is fine with me.

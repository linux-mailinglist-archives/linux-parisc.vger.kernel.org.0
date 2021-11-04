Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE81445668
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 16:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhKDPiK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 11:38:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:42126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231500AbhKDPiJ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 11:38:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B108C611EE
        for <linux-parisc@vger.kernel.org>; Thu,  4 Nov 2021 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636040131;
        bh=sB6JgNGBcxNAC/+2kzdRo/6Dh1B65feENSWLh6TqxLo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bscsC3v4oRGuFzN0b7E+DnEL6Is89AICIgl2FEv7FoxEShwxX2WhjQg+VXurzA3Wq
         X+UJU14o8Xbf71gb42WplpksOoiHGGfOxh3ETrpzUPY8nPrfNwKJBOsc9kNf1l+9bz
         XkpmZqOTtKDUSwxEnau0hORo92trjwkbbo7MK+brikt6Ct6pEmAANUQLumECta+nlS
         Pn5j3nuHBCMUC+3QrX56xUoT1hU8FLSxX9txhBFxXdwUR6pQ7ks3JGxRAqUee6CQ4F
         3MwoGS1ddxbFZgHodc5giH5TZFntMV0oLIJnsES+bWNrnLYJ+m4em3PUQ1qcyCAiP0
         DCKy9vGWn20xQ==
Received: by mail-ot1-f49.google.com with SMTP id g25-20020a9d5f99000000b0055af3d227e8so4368345oti.11
        for <linux-parisc@vger.kernel.org>; Thu, 04 Nov 2021 08:35:31 -0700 (PDT)
X-Gm-Message-State: AOAM53080S4t32Bj+ckNGaoRUGtKbzPK8hzEIY3yKdYUKNkKFkg1SFrU
        gTxDk5HwU5biaEGkDeU1l63PyR/6e0tHf3mNqxk=
X-Google-Smtp-Source: ABdhPJxrEY6Zeal7SYy73fSrS3+Mok9P8LUfww6XJAbpu9LlctS5ix5C/m9I9VUl9umkRhratl1Fjc8NOxO7D7fNGO4=
X-Received: by 2002:a05:6830:14c:: with SMTP id j12mr9172140otp.147.1636040130960;
 Thu, 04 Nov 2021 08:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211104082628.2793555-1-ardb@kernel.org> <c48314bf-7a07-47d8-f15a-0e30f47d1920@gmx.de>
 <CAMj1kXH7MpKFFB1g4G6YxMbhhZn1S5YkYAfBb_F5xnAkHpFO0g@mail.gmail.com> <2809a837-cd97-fdb4-5b4c-d280ce3dd425@gmx.de>
In-Reply-To: <2809a837-cd97-fdb4-5b4c-d280ce3dd425@gmx.de>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 4 Nov 2021 16:35:19 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGW_cExeFvMK+Z1ArwDMJNJiFvY4eSnjYhYXN=JNE7=0A@mail.gmail.com>
Message-ID: <CAMj1kXGW_cExeFvMK+Z1ArwDMJNJiFvY4eSnjYhYXN=JNE7=0A@mail.gmail.com>
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

On Thu, 4 Nov 2021 at 16:26, Helge Deller <deller@gmx.de> wrote:
>
> On 11/4/21 09:39, Ard Biesheuvel wrote:
> > On Thu, 4 Nov 2021 at 09:31, Helge Deller <deller@gmx.de> wrote:
> >>
> >> On 11/4/21 09:26, Ard Biesheuvel wrote:
> >>> In commit 2214c0e77259 ("parisc: Move thread_info into task struct")
> >>> PA-RISC gained support for THREAD_INFO_IN_TASK while changes were
> >>> already underway to keep the CPU field in thread_info rather than move
> >>> it into task_struct when THREAD_INFO_IN_TASK is enabled. The result is a
> >>> broken build for all PA-RISC configs that enable SMP.
> >>>
> >>> So let's partially revert that commit, and get rid of the ugly hack to
> >>> get at the offset of task_struct::cpu without having to include
> >>> linux/sched.h, and put the CPU field back where it was before.
> >>>
> >>> Reported-by: Guenter Roeck <linux@roeck-us.net>
> >>> Fixes: bcf9033e5449 ("sched: move CPU field back into thread_info if THREAD_INFO_IN_TASK=y")
> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>
> >> Thanks Ard!
> >>
> >> I actually had the same patch finished right now too :-)
> >>
> >
> > I was wondering about that :-)
> >
> >> One small nid though. See below...
> >>
> >>
> >>> ---
> >>>  arch/parisc/include/asm/smp.h         | 19 ++-----------------
> >>>  arch/parisc/include/asm/thread_info.h |  2 ++
> >>>  arch/parisc/kernel/asm-offsets.c      |  4 +---
> >>>  arch/parisc/kernel/smp.c              |  2 +-
> >>>  4 files changed, 6 insertions(+), 21 deletions(-)
> >>>
> >>> diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/smp.h
> >>> index 16d41127500e..cba55abf7bac 100644
> >>> --- a/arch/parisc/include/asm/smp.h
> >>> +++ b/arch/parisc/include/asm/smp.h
> >>> @@ -34,23 +34,8 @@ extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
> >>>
> >>>  #endif /* !ASSEMBLY */
> >>>
> >>> -/*
> >>> - * This is particularly ugly: it appears we can't actually get the definition
> >>> - * of task_struct here, but we need access to the CPU this task is running on.
> >>> - * Instead of using task_struct we're using TASK_CPU which is extracted from
> >>> - * asm-offsets.h by kbuild to get the current processor ID.
> >>> - *
> >>> - * This also needs to be safeguarded when building asm-offsets.s because at
> >>> - * that time TASK_CPU is not defined yet. It could have been guarded by
> >>> - * TASK_CPU itself, but we want the build to fail if TASK_CPU is missing
> >>> - * when building something else than asm-offsets.s
> >>> - */
> >>> -#ifdef GENERATING_ASM_OFFSETS
> >>> -#define raw_smp_processor_id()               (0)
> >>> -#else
> >>> -#include <asm/asm-offsets.h>
> >>> -#define raw_smp_processor_id()               (*(unsigned int *)((void *)current + TASK_CPU))
> >>> -#endif
> >>> +#define raw_smp_processor_id() (current_thread_info()->cpu)
> >>> +
> >>>  #else /* CONFIG_SMP */
> >>>
> >>>  static inline void smp_send_all_nop(void) { return; }
> >>> diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
> >>> index 75657c2c54e1..d6268834bfa5 100644
> >>> --- a/arch/parisc/include/asm/thread_info.h
> >>> +++ b/arch/parisc/include/asm/thread_info.h
> >>> @@ -8,12 +8,14 @@
> >>>
> >>>  struct thread_info {
> >>>       unsigned long flags;            /* thread_info flags (see TIF_*) */
> >>> +     __u32 cpu;                      /* current CPU */
> >>>       int preempt_count;              /* 0=premptable, <0=BUG; will also serve as bh-counter */
> >>>  };
> >>>
> >>>  #define INIT_THREAD_INFO(tsk)                        \
> >>>  {                                            \
> >>>       .flags          = 0,                    \
> >>> +     .cpu            = 0,                    \
> >>>       .preempt_count  = INIT_PREEMPT_COUNT,   \
> >>>  }
> >>>
> >>> diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
> >>> index e35154035441..629d38e36e22 100644
> >>> --- a/arch/parisc/kernel/asm-offsets.c
> >>> +++ b/arch/parisc/kernel/asm-offsets.c
> >>> @@ -14,8 +14,6 @@
> >>>   *    Copyright (C) 2003 James Bottomley <jejb at parisc-linux.org>
> >>>   */
> >>>
> >>> -#define GENERATING_ASM_OFFSETS /* asm/smp.h */
> >>> -
> >>>  #include <linux/types.h>
> >>>  #include <linux/sched.h>
> >>>  #include <linux/thread_info.h>
> >>> @@ -40,7 +38,7 @@ int main(void)
> >>>       DEFINE(TASK_TI_FLAGS, offsetof(struct task_struct, thread_info.flags));
> >>>       DEFINE(TASK_STACK, offsetof(struct task_struct, stack));
> >>>  #ifdef CONFIG_SMP
> >>> -     DEFINE(TASK_CPU, offsetof(struct task_struct, cpu));
> >>> +     DEFINE(TASK_CPU, offsetof(struct task_struct, thread_info.cpu));
> >>>  #endif
> >>
> >> The TASK_CPU define isn't needed any longer.
> >> So, the whole part inside #ifdef..#endif can go.
> >>
> >
> > OK let's just drop it then.
>
> Ok
>
> >
> >>>       BLANK();
> >>>       DEFINE(TASK_REGS, offsetof(struct task_struct, thread.regs));
> >>> diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
> >>> index 171925285f3e..0cd97fa004c5 100644
> >>> --- a/arch/parisc/kernel/smp.c
> >>> +++ b/arch/parisc/kernel/smp.c
> >>> @@ -339,7 +339,7 @@ int smp_boot_one_cpu(int cpuid, struct task_struct *idle)
> >>>       const struct cpuinfo_parisc *p = &per_cpu(cpu_data, cpuid);
> >>>       long timeout;
> >>>
> >>> -     idle->cpu = cpuid;
> >>> +     task_thread_info(idle)->cpu = cpuid;
> >
> > I was wondering if this could simply be dropped altogether? I am
> > pretty sure it is redundant, as the core code sets this field as well,
> > but I don't have access to a SMP PA-RISC machine to test it.
>
>
> Good point.
> I tested and it can be dropped.
>
>
> >>>       /* Let _start know what logical CPU we're booting
> >>>       ** (offset into init_tasks[],cpu_data[])
> >>>
> >
> >> If it's Ok for you I'll clean up your patch and submit
> >> all with the next pull request to Linus later today.
> >>
> >
> > Whatever works for you is fine with me.
>
> Ok. I've cleaned it up, applied it to my for-next tree and will push later today to Linus
> with other patches. Here is the current version:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next
>

Looks fine

Thanks,

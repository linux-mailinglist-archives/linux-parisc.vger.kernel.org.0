Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94ECA445796
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 17:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhKDQyE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 12:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbhKDQyD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 12:54:03 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F76C061714
        for <linux-parisc@vger.kernel.org>; Thu,  4 Nov 2021 09:51:25 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id c2-20020a056830348200b0055a46c889a8so9107982otu.5
        for <linux-parisc@vger.kernel.org>; Thu, 04 Nov 2021 09:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dk6KjxHZedzcWlQifAYe++iZ4IQuZOs9gVOlxdOuHwo=;
        b=lIls4+Q0oQwCJDFdj+iN3FaVe4lqOwgB3ZiJpOEhw0Ljn2PDPWKLrWF1pUcuik2l+n
         c061KCQBlquEGHq6sIU8T8n/s6eoJEO7V8DOZa06IRx/7HTUvMFMorgVtGsthoUN/fjr
         WfjRH/Byoi4wgsM84mHg+mq2EgrM7j1wi12nFJhuj2JY+U5Xecw+xkh+lYvqyVqMHh1z
         irRfHLG6uQHN397Ext182cl2XnBc7TRmaRBDLwpJnt/wo1wJ30A9LJ00oXXnYLSykqck
         2y+V3xST9upzHpZY2hu4H1aUkNhvs+lx75L1TLAgp6VEFmZi8q+tT16Y3yJll6qRmFwC
         wQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dk6KjxHZedzcWlQifAYe++iZ4IQuZOs9gVOlxdOuHwo=;
        b=3tHrGs+FqHmBSIvkzfnHtGrg036OoZ3BvMusm5qAD+l+1TK/f/eAtxpgUBEvjoLTlc
         wPnzLJ7HqyZQXsyQwSCi/zHiRib6egSdMRbfjiROIH+rChKet3THkT2eoTylz/M3fTKz
         qodwwxMDoQy2klnU9OkeDdE7binVGzGi7Nwk4DV+LdRo2QOYZeUYamfFNNFUQmplgQIf
         ljP63kWxHVVsHHSOIEyLsZ7S/bMXeBPryelJSCjBamlWF33/VAGIqE9kR+UfLwusU9WQ
         NABAmmqDR9TTW7FaItQebKwYT2nX1aVdV/raEPloRwk55p+oMijIK45pfhgSQNSg2DGc
         vVtA==
X-Gm-Message-State: AOAM530yn2cNnHqNC7pQGxWypDhZImDePIjnlzyVYX78DkFV2/n6ifqn
        VdEnET1uD63hKIv9vdLVNio=
X-Google-Smtp-Source: ABdhPJwxizJ1O5uN5yeB2dCux59SneLustCNR0Kb8ilAG209Q57JNusT9cMXCwoHJzobcUc/H0IFRg==
X-Received: by 2002:a9d:1ca9:: with SMTP id l41mr8599367ota.108.1636044685077;
        Thu, 04 Nov 2021 09:51:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d13sm1461136otc.2.2021.11.04.09.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Nov 2021 09:51:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] parisc: move CPU field back into thread_info
To:     Helge Deller <deller@gmx.de>, Ard Biesheuvel <ardb@kernel.org>
Cc:     "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20211104082628.2793555-1-ardb@kernel.org>
 <c48314bf-7a07-47d8-f15a-0e30f47d1920@gmx.de>
 <CAMj1kXH7MpKFFB1g4G6YxMbhhZn1S5YkYAfBb_F5xnAkHpFO0g@mail.gmail.com>
 <2809a837-cd97-fdb4-5b4c-d280ce3dd425@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <07c5f6cb-cab8-039c-d253-9e514fe71e06@roeck-us.net>
Date:   Thu, 4 Nov 2021 09:51:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2809a837-cd97-fdb4-5b4c-d280ce3dd425@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/4/21 8:25 AM, Helge Deller wrote:
> On 11/4/21 09:39, Ard Biesheuvel wrote:
>> On Thu, 4 Nov 2021 at 09:31, Helge Deller <deller@gmx.de> wrote:
>>>
>>> On 11/4/21 09:26, Ard Biesheuvel wrote:
>>>> In commit 2214c0e77259 ("parisc: Move thread_info into task struct")
>>>> PA-RISC gained support for THREAD_INFO_IN_TASK while changes were
>>>> already underway to keep the CPU field in thread_info rather than move
>>>> it into task_struct when THREAD_INFO_IN_TASK is enabled. The result is a
>>>> broken build for all PA-RISC configs that enable SMP.
>>>>
>>>> So let's partially revert that commit, and get rid of the ugly hack to
>>>> get at the offset of task_struct::cpu without having to include
>>>> linux/sched.h, and put the CPU field back where it was before.
>>>>
>>>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>>>> Fixes: bcf9033e5449 ("sched: move CPU field back into thread_info if THREAD_INFO_IN_TASK=y")
>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> Thanks Ard!
>>>
>>> I actually had the same patch finished right now too :-)
>>>
>>
>> I was wondering about that :-)
>>
>>> One small nid though. See below...
>>>
>>>
>>>> ---
>>>>   arch/parisc/include/asm/smp.h         | 19 ++-----------------
>>>>   arch/parisc/include/asm/thread_info.h |  2 ++
>>>>   arch/parisc/kernel/asm-offsets.c      |  4 +---
>>>>   arch/parisc/kernel/smp.c              |  2 +-
>>>>   4 files changed, 6 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/smp.h
>>>> index 16d41127500e..cba55abf7bac 100644
>>>> --- a/arch/parisc/include/asm/smp.h
>>>> +++ b/arch/parisc/include/asm/smp.h
>>>> @@ -34,23 +34,8 @@ extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
>>>>
>>>>   #endif /* !ASSEMBLY */
>>>>
>>>> -/*
>>>> - * This is particularly ugly: it appears we can't actually get the definition
>>>> - * of task_struct here, but we need access to the CPU this task is running on.
>>>> - * Instead of using task_struct we're using TASK_CPU which is extracted from
>>>> - * asm-offsets.h by kbuild to get the current processor ID.
>>>> - *
>>>> - * This also needs to be safeguarded when building asm-offsets.s because at
>>>> - * that time TASK_CPU is not defined yet. It could have been guarded by
>>>> - * TASK_CPU itself, but we want the build to fail if TASK_CPU is missing
>>>> - * when building something else than asm-offsets.s
>>>> - */
>>>> -#ifdef GENERATING_ASM_OFFSETS
>>>> -#define raw_smp_processor_id()               (0)
>>>> -#else
>>>> -#include <asm/asm-offsets.h>
>>>> -#define raw_smp_processor_id()               (*(unsigned int *)((void *)current + TASK_CPU))
>>>> -#endif
>>>> +#define raw_smp_processor_id() (current_thread_info()->cpu)
>>>> +
>>>>   #else /* CONFIG_SMP */
>>>>
>>>>   static inline void smp_send_all_nop(void) { return; }
>>>> diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
>>>> index 75657c2c54e1..d6268834bfa5 100644
>>>> --- a/arch/parisc/include/asm/thread_info.h
>>>> +++ b/arch/parisc/include/asm/thread_info.h
>>>> @@ -8,12 +8,14 @@
>>>>
>>>>   struct thread_info {
>>>>        unsigned long flags;            /* thread_info flags (see TIF_*) */
>>>> +     __u32 cpu;                      /* current CPU */
>>>>        int preempt_count;              /* 0=premptable, <0=BUG; will also serve as bh-counter */
>>>>   };
>>>>
>>>>   #define INIT_THREAD_INFO(tsk)                        \
>>>>   {                                            \
>>>>        .flags          = 0,                    \
>>>> +     .cpu            = 0,                    \
>>>>        .preempt_count  = INIT_PREEMPT_COUNT,   \
>>>>   }
>>>>
>>>> diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
>>>> index e35154035441..629d38e36e22 100644
>>>> --- a/arch/parisc/kernel/asm-offsets.c
>>>> +++ b/arch/parisc/kernel/asm-offsets.c
>>>> @@ -14,8 +14,6 @@
>>>>    *    Copyright (C) 2003 James Bottomley <jejb at parisc-linux.org>
>>>>    */
>>>>
>>>> -#define GENERATING_ASM_OFFSETS /* asm/smp.h */
>>>> -
>>>>   #include <linux/types.h>
>>>>   #include <linux/sched.h>
>>>>   #include <linux/thread_info.h>
>>>> @@ -40,7 +38,7 @@ int main(void)
>>>>        DEFINE(TASK_TI_FLAGS, offsetof(struct task_struct, thread_info.flags));
>>>>        DEFINE(TASK_STACK, offsetof(struct task_struct, stack));
>>>>   #ifdef CONFIG_SMP
>>>> -     DEFINE(TASK_CPU, offsetof(struct task_struct, cpu));
>>>> +     DEFINE(TASK_CPU, offsetof(struct task_struct, thread_info.cpu));
>>>>   #endif
>>>
>>> The TASK_CPU define isn't needed any longer.
>>> So, the whole part inside #ifdef..#endif can go.
>>>
>>
>> OK let's just drop it then.
> 
> Ok
> 
>>
>>>>        BLANK();
>>>>        DEFINE(TASK_REGS, offsetof(struct task_struct, thread.regs));
>>>> diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
>>>> index 171925285f3e..0cd97fa004c5 100644
>>>> --- a/arch/parisc/kernel/smp.c
>>>> +++ b/arch/parisc/kernel/smp.c
>>>> @@ -339,7 +339,7 @@ int smp_boot_one_cpu(int cpuid, struct task_struct *idle)
>>>>        const struct cpuinfo_parisc *p = &per_cpu(cpu_data, cpuid);
>>>>        long timeout;
>>>>
>>>> -     idle->cpu = cpuid;
>>>> +     task_thread_info(idle)->cpu = cpuid;
>>
>> I was wondering if this could simply be dropped altogether? I am
>> pretty sure it is redundant, as the core code sets this field as well,
>> but I don't have access to a SMP PA-RISC machine to test it.
> 
> 
> Good point.
> I tested and it can be dropped.
> 
> 
>>>>        /* Let _start know what logical CPU we're booting
>>>>        ** (offset into init_tasks[],cpu_data[])
>>>>
>>
>>> If it's Ok for you I'll clean up your patch and submit
>>> all with the next pull request to Linus later today.
>>>
>>
>> Whatever works for you is fine with me.
> 
> Ok. I've cleaned it up, applied it to my for-next tree and will push later today to Linus
> with other patches. Here is the current version:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next
> 

Works for me.

Thanks,
Guenter

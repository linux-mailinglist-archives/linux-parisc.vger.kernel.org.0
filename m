Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F28E44564C
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 16:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhKDP3M (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 11:29:12 -0400
Received: from mout.gmx.net ([212.227.17.22]:55831 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231305AbhKDP3L (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 11:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1636039570;
        bh=cksmbDQwu0z2y7n6XnQC/6LPiMU4I2OxE4ZYOs7EZ/8=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=YooYM2H92q89DItc7oY/zWo/8h0+z2TXB9bHrWxsPbu0AfKF0XF4paJTyZ68T4tqI
         nXLfqVWptlNe/4GyM2QiUSi6wW1JtqvyFKvo3fWYdPF8R5fUk8SM3ER6Q1yT4lC0fe
         q8H0vjm6eUib3F/kSCEbU70H6sPfNUMJpOdPEWXU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.157.73]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1n5fgk2ie4-00N8Oo; Thu, 04
 Nov 2021 16:26:10 +0100
Message-ID: <2809a837-cd97-fdb4-5b4c-d280ce3dd425@gmx.de>
Date:   Thu, 4 Nov 2021 16:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] parisc: move CPU field back into thread_info
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20211104082628.2793555-1-ardb@kernel.org>
 <c48314bf-7a07-47d8-f15a-0e30f47d1920@gmx.de>
 <CAMj1kXH7MpKFFB1g4G6YxMbhhZn1S5YkYAfBb_F5xnAkHpFO0g@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <CAMj1kXH7MpKFFB1g4G6YxMbhhZn1S5YkYAfBb_F5xnAkHpFO0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1759D2JTnPO+aVMWZY+ALqtA9sINksKMzzqHiGHhLnR9HbMjq52
 mcm5WxEeZWdWaZ3boDPen35uwftZERK23jkzcYBtJW9+Za48s4+yBcdzz+YIFkCIJwjgwoW
 q+5pnsbxx7/M38yFllILRzMAfloX3vi4OxGxMe9zBtGDvzkw2OUB49XW+7l1pOituFL2nba
 8yY2JgY5hLZooEYfgV1XA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m8FVcOU1vis=:BIGgC/i1lMDuV05qarFgzS
 ZpSZssw74ndyh5rrp7qh5sm1Rcvp2a+vlk/JSrWcbSR/20Kia5+a4kG0PPaVZwzMaqZMvhUcb
 Vhf0czF9kuu6ClF91G2bA8XvhwotyuljrMkgMIxuuKRreUq8JK11ElaTmgb1WNhT5nR3Y2rV6
 0+0k/CI6jxtZcI9JFqrDIQolCvMbtT/EMTxSoyh4EUFsYZKM4KBJ8AMb+xjrYoZ4nnyVwls4A
 +VoyT3d94cI9YMDsGVClIRJaPr6HRfYj8r6x2h+8j+2sEVjqB8hmYzb3CM/8w5qZzKVIDoj1l
 miS5ntWWhn2TzxrlOFbPLG/SMe/gdYIUt0dXQfHXGCPsk+Sa4fA8ehQO+YFOvWV9rJjvrX13b
 eSAilHisl6YlcyUk9vfaP3A7OJ6iy4dbb9/KDWXSC5Y59pb2eDY2sJB+9iBoMfjWgNO537OU8
 4fubPgpaiu8ZbAEgSeJmWNHcIrdQh3z6dDRGcRGyWOaALcDkGLRUXqj8YGzRlc3He2LdL/gwd
 w9W+0XOV1EiU4UPXkZpgsL6Brt1FeQwOLuLd/v0TUjmOd2Dm11SFME6kbEaus6e0es9+sHwGY
 O5SnzQqlPjeLGG7+s3n6257g3I0ESOK0kAfxG6hHCNAhzh0U2r0xJMpy9lZL/J3zkVUHnTD1A
 NNxg18WD50/ScH6q2+REtq+NPgGQQu3CW8eCtLZwAc9LNFpu/neXGLQGYm/95PocS/FvO7tak
 QI8R+aJXhTQ9G+ZHk6dk2vTb+EWymAyD47hHvzpntNl3PEdhfndOoQgIiaKuugu67B+aRpK/I
 3u+QwDNFnS1VJz7Ihw29W22QlkQdaX773bARRpxdRR8zvolDCkgah3wRAx7vzwxlmzblCtX8Z
 a6L0IQMpP6Il57CqWPPTem/Nt+xDeFOEpmixsq5H6rQXtpAn293ucQN9YLtL2MquPpj81oQ4W
 tj8fJn8J3S5Gdw/+YfPxEtzsj5p1V+mfultCzqfViw2+nY2kcgl3sdw4A1djEjItHT0Tyjntj
 fIp/Eo7Zx23n+KDi28s7rgdGREZ6+SYtCQc0OUiYHOqew4TbIF/bqdfkoeQ1iiNJGW0blmdVc
 BglcoBdsujKkhI=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/4/21 09:39, Ard Biesheuvel wrote:
> On Thu, 4 Nov 2021 at 09:31, Helge Deller <deller@gmx.de> wrote:
>>
>> On 11/4/21 09:26, Ard Biesheuvel wrote:
>>> In commit 2214c0e77259 ("parisc: Move thread_info into task struct")
>>> PA-RISC gained support for THREAD_INFO_IN_TASK while changes were
>>> already underway to keep the CPU field in thread_info rather than move
>>> it into task_struct when THREAD_INFO_IN_TASK is enabled. The result is=
 a
>>> broken build for all PA-RISC configs that enable SMP.
>>>
>>> So let's partially revert that commit, and get rid of the ugly hack to
>>> get at the offset of task_struct::cpu without having to include
>>> linux/sched.h, and put the CPU field back where it was before.
>>>
>>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>>> Fixes: bcf9033e5449 ("sched: move CPU field back into thread_info if T=
HREAD_INFO_IN_TASK=3Dy")
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>
>> Thanks Ard!
>>
>> I actually had the same patch finished right now too :-)
>>
>
> I was wondering about that :-)
>
>> One small nid though. See below...
>>
>>
>>> ---
>>>  arch/parisc/include/asm/smp.h         | 19 ++-----------------
>>>  arch/parisc/include/asm/thread_info.h |  2 ++
>>>  arch/parisc/kernel/asm-offsets.c      |  4 +---
>>>  arch/parisc/kernel/smp.c              |  2 +-
>>>  4 files changed, 6 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/s=
mp.h
>>> index 16d41127500e..cba55abf7bac 100644
>>> --- a/arch/parisc/include/asm/smp.h
>>> +++ b/arch/parisc/include/asm/smp.h
>>> @@ -34,23 +34,8 @@ extern void arch_send_call_function_ipi_mask(const =
struct cpumask *mask);
>>>
>>>  #endif /* !ASSEMBLY */
>>>
>>> -/*
>>> - * This is particularly ugly: it appears we can't actually get the de=
finition
>>> - * of task_struct here, but we need access to the CPU this task is ru=
nning on.
>>> - * Instead of using task_struct we're using TASK_CPU which is extract=
ed from
>>> - * asm-offsets.h by kbuild to get the current processor ID.
>>> - *
>>> - * This also needs to be safeguarded when building asm-offsets.s beca=
use at
>>> - * that time TASK_CPU is not defined yet. It could have been guarded =
by
>>> - * TASK_CPU itself, but we want the build to fail if TASK_CPU is miss=
ing
>>> - * when building something else than asm-offsets.s
>>> - */
>>> -#ifdef GENERATING_ASM_OFFSETS
>>> -#define raw_smp_processor_id()               (0)
>>> -#else
>>> -#include <asm/asm-offsets.h>
>>> -#define raw_smp_processor_id()               (*(unsigned int *)((void=
 *)current + TASK_CPU))
>>> -#endif
>>> +#define raw_smp_processor_id() (current_thread_info()->cpu)
>>> +
>>>  #else /* CONFIG_SMP */
>>>
>>>  static inline void smp_send_all_nop(void) { return; }
>>> diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/inclu=
de/asm/thread_info.h
>>> index 75657c2c54e1..d6268834bfa5 100644
>>> --- a/arch/parisc/include/asm/thread_info.h
>>> +++ b/arch/parisc/include/asm/thread_info.h
>>> @@ -8,12 +8,14 @@
>>>
>>>  struct thread_info {
>>>       unsigned long flags;            /* thread_info flags (see TIF_*)=
 */
>>> +     __u32 cpu;                      /* current CPU */
>>>       int preempt_count;              /* 0=3Dpremptable, <0=3DBUG; wil=
l also serve as bh-counter */
>>>  };
>>>
>>>  #define INIT_THREAD_INFO(tsk)                        \
>>>  {                                            \
>>>       .flags          =3D 0,                    \
>>> +     .cpu            =3D 0,                    \
>>>       .preempt_count  =3D INIT_PREEMPT_COUNT,   \
>>>  }
>>>
>>> diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm=
-offsets.c
>>> index e35154035441..629d38e36e22 100644
>>> --- a/arch/parisc/kernel/asm-offsets.c
>>> +++ b/arch/parisc/kernel/asm-offsets.c
>>> @@ -14,8 +14,6 @@
>>>   *    Copyright (C) 2003 James Bottomley <jejb at parisc-linux.org>
>>>   */
>>>
>>> -#define GENERATING_ASM_OFFSETS /* asm/smp.h */
>>> -
>>>  #include <linux/types.h>
>>>  #include <linux/sched.h>
>>>  #include <linux/thread_info.h>
>>> @@ -40,7 +38,7 @@ int main(void)
>>>       DEFINE(TASK_TI_FLAGS, offsetof(struct task_struct, thread_info.f=
lags));
>>>       DEFINE(TASK_STACK, offsetof(struct task_struct, stack));
>>>  #ifdef CONFIG_SMP
>>> -     DEFINE(TASK_CPU, offsetof(struct task_struct, cpu));
>>> +     DEFINE(TASK_CPU, offsetof(struct task_struct, thread_info.cpu));
>>>  #endif
>>
>> The TASK_CPU define isn't needed any longer.
>> So, the whole part inside #ifdef..#endif can go.
>>
>
> OK let's just drop it then.

Ok

>
>>>       BLANK();
>>>       DEFINE(TASK_REGS, offsetof(struct task_struct, thread.regs));
>>> diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
>>> index 171925285f3e..0cd97fa004c5 100644
>>> --- a/arch/parisc/kernel/smp.c
>>> +++ b/arch/parisc/kernel/smp.c
>>> @@ -339,7 +339,7 @@ int smp_boot_one_cpu(int cpuid, struct task_struct=
 *idle)
>>>       const struct cpuinfo_parisc *p =3D &per_cpu(cpu_data, cpuid);
>>>       long timeout;
>>>
>>> -     idle->cpu =3D cpuid;
>>> +     task_thread_info(idle)->cpu =3D cpuid;
>
> I was wondering if this could simply be dropped altogether? I am
> pretty sure it is redundant, as the core code sets this field as well,
> but I don't have access to a SMP PA-RISC machine to test it.


Good point.
I tested and it can be dropped.


>>>       /* Let _start know what logical CPU we're booting
>>>       ** (offset into init_tasks[],cpu_data[])
>>>
>
>> If it's Ok for you I'll clean up your patch and submit
>> all with the next pull request to Linus later today.
>>
>
> Whatever works for you is fine with me.

Ok. I've cleaned it up, applied it to my for-next tree and will push later=
 today to Linus
with other patches. Here is the current version:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dfor-next

Thanks!
Helge

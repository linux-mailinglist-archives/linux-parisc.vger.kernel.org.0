Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5563844505E
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 09:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhKDIeJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 04:34:09 -0400
Received: from mout.gmx.net ([212.227.15.15]:53035 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230445AbhKDIeI (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 04:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1636014668;
        bh=OZvLRx8bFrEnwhxGvtFTL2UNvNIBgpwGXyCxwmAwe3A=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=F/4qmQI0Ko62/FgzaLALI0jJJKvxpXcPGaXBsFaj+bwdVRE+yeTE9MV+bbTZlWOUO
         W3iGTR1aJuSlJ494x6zcVHKO+PQShKcs6qQInV/W+Ni6molE5UgK4oTltqmuSqLLwi
         XZfQAuz9c+UKwLe6ArnOdWtDdBNhmd5qQf0BreFA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.157.73]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6siz-1mgZIy3ed5-018Iqk; Thu, 04
 Nov 2021 09:31:07 +0100
Message-ID: <c48314bf-7a07-47d8-f15a-0e30f47d1920@gmx.de>
Date:   Thu, 4 Nov 2021 09:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] parisc: move CPU field back into thread_info
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>, linux-parisc@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com, linux@roeck-us.net,
        torvalds@linux-foundation.org
References: <20211104082628.2793555-1-ardb@kernel.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20211104082628.2793555-1-ardb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PooqXyNGxZ7GOiEJWPxdz0xfR2PxKnh7mrLC3RLVXFbkIeAhMQ5
 Ae+hne7X/C1oUPIGB1Ht18eK+VHDlUe9snQJxPcwLE1KRA37Z65OPO0W62P5vpvM3qIacjx
 XhrO0tcy1VEMpMChFEfnlYjwJgS8wlaAiWaxOHZM3+l49hQh7UDUgUGLpffgKNHbAi394HJ
 sEbtnIhUaGP1pCxd9/VmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2hfcl6ZBs+o=:GzstWDcMRrxSPGdppDPdQt
 +NPDLM9Lb/EjysK6Apf974NJklBJRGuGRPMhJMewNPfjIo0vkDgqSQExhOHRB5b5myE7JVal8
 x+ZZq6pcdmTG0ZKky2AxMWSz7zoRtZVA/UeXujq5ij+wvEuDyGoh9ZPedaZ5/TuuGsTLdLOZG
 8qbD0zGx00ALEkiINxMtDolqo4/t3Zudb1S5b0XCBHg2pzbSGHCVXa8v29ns2KS9sSpT4tfGf
 ac0zl3za422oPiqMCNgo/FFtPyrili/BTkg27FYXKG7OSXu5egFwzoDuHtHPlf23VXjMripAz
 DGwn3qJZNNypQLwGb5obcTfTYSK6NQdS0eAMZuPebxfcNDhPMcu/k+onIcFYtp9fnf/zQQ2z8
 elT5vk0RdADGZ1GZyIJmICQps0JnEnAcBnelMp3f81XuwfG2vXiQeS4LVzmaLOWCL6RrvPrgr
 24anBT+4Xd2Y3yDeiHZsOgmGQMMfNAO1Wrav33qCiNckCXzrRv/3pmacnbDMvLDMQ55bnOE0/
 AuoxaLi0pvnM33JBjgXK7EwJEKZGk5+u3YI6/XGOzRSo+IT3sA6gKRtQvDGs/xKEI9mTzncuh
 XI6rBGVDWFv5r2bXsvfLdXlATXzN+FDziilYCjZcpi6sIAEVfe1h7CF9b19oqNC+A7/5coKyN
 kHbk/5fPDrUCNLCp3qEV7j+Gzw7WuokkUxGiPXj0rJYVTfU/YiSOkzFATlifGthZypz3kL4NZ
 19VvhOSNRC90sCVOS8uh/Xwf1IL6sOoeiZctX0/2COwhsC+huoujNF19p9QdxbqZoCxJ95ij9
 jRl+QiVOFKVX2TL75lrIRodKUao3oKUAR7HWi2hQAj664w7VKc0jHUGPSe7HxKqFmp5DjU4eE
 YM+sj50SjmDWP5b73MxpUmnWb1BZBwv71LGmQRlr36UyZZpB7N73SlxCE3361F6oVwRq8RoPQ
 huu3Pm+lXKFjQODdsFgV7HAgJmkjCa6HjIGnMtiIiBjGxGapYN35/rMOiYy+g+RgNXaJkbvvm
 g1W4DWtfM/6nw+kRZ++q7AKUAt9U4G/c+UFux2rVKm7ZUUeDCCiKaYQC4ZuRKMKbog==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/4/21 09:26, Ard Biesheuvel wrote:
> In commit 2214c0e77259 ("parisc: Move thread_info into task struct")
> PA-RISC gained support for THREAD_INFO_IN_TASK while changes were
> already underway to keep the CPU field in thread_info rather than move
> it into task_struct when THREAD_INFO_IN_TASK is enabled. The result is a
> broken build for all PA-RISC configs that enable SMP.
>
> So let's partially revert that commit, and get rid of the ugly hack to
> get at the offset of task_struct::cpu without having to include
> linux/sched.h, and put the CPU field back where it was before.
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: bcf9033e5449 ("sched: move CPU field back into thread_info if THR=
EAD_INFO_IN_TASK=3Dy")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Thanks Ard!

I actually had the same patch finished right now too :-)

One small nid though. See below...


> ---
>  arch/parisc/include/asm/smp.h         | 19 ++-----------------
>  arch/parisc/include/asm/thread_info.h |  2 ++
>  arch/parisc/kernel/asm-offsets.c      |  4 +---
>  arch/parisc/kernel/smp.c              |  2 +-
>  4 files changed, 6 insertions(+), 21 deletions(-)
>
> diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/smp=
.h
> index 16d41127500e..cba55abf7bac 100644
> --- a/arch/parisc/include/asm/smp.h
> +++ b/arch/parisc/include/asm/smp.h
> @@ -34,23 +34,8 @@ extern void arch_send_call_function_ipi_mask(const st=
ruct cpumask *mask);
>
>  #endif /* !ASSEMBLY */
>
> -/*
> - * This is particularly ugly: it appears we can't actually get the defi=
nition
> - * of task_struct here, but we need access to the CPU this task is runn=
ing on.
> - * Instead of using task_struct we're using TASK_CPU which is extracted=
 from
> - * asm-offsets.h by kbuild to get the current processor ID.
> - *
> - * This also needs to be safeguarded when building asm-offsets.s becaus=
e at
> - * that time TASK_CPU is not defined yet. It could have been guarded by
> - * TASK_CPU itself, but we want the build to fail if TASK_CPU is missin=
g
> - * when building something else than asm-offsets.s
> - */
> -#ifdef GENERATING_ASM_OFFSETS
> -#define raw_smp_processor_id()		(0)
> -#else
> -#include <asm/asm-offsets.h>
> -#define raw_smp_processor_id()		(*(unsigned int *)((void *)current + TA=
SK_CPU))
> -#endif
> +#define raw_smp_processor_id() (current_thread_info()->cpu)
> +
>  #else /* CONFIG_SMP */
>
>  static inline void smp_send_all_nop(void) { return; }
> diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include=
/asm/thread_info.h
> index 75657c2c54e1..d6268834bfa5 100644
> --- a/arch/parisc/include/asm/thread_info.h
> +++ b/arch/parisc/include/asm/thread_info.h
> @@ -8,12 +8,14 @@
>
>  struct thread_info {
>  	unsigned long flags;		/* thread_info flags (see TIF_*) */
> +	__u32 cpu;			/* current CPU */
>  	int preempt_count;		/* 0=3Dpremptable, <0=3DBUG; will also serve as bh=
-counter */
>  };
>
>  #define INIT_THREAD_INFO(tsk)			\
>  {						\
>  	.flags		=3D 0,			\
> +	.cpu		=3D 0,			\
>  	.preempt_count	=3D INIT_PREEMPT_COUNT,	\
>  }
>
> diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-o=
ffsets.c
> index e35154035441..629d38e36e22 100644
> --- a/arch/parisc/kernel/asm-offsets.c
> +++ b/arch/parisc/kernel/asm-offsets.c
> @@ -14,8 +14,6 @@
>   *    Copyright (C) 2003 James Bottomley <jejb at parisc-linux.org>
>   */
>
> -#define GENERATING_ASM_OFFSETS /* asm/smp.h */
> -
>  #include <linux/types.h>
>  #include <linux/sched.h>
>  #include <linux/thread_info.h>
> @@ -40,7 +38,7 @@ int main(void)
>  	DEFINE(TASK_TI_FLAGS, offsetof(struct task_struct, thread_info.flags))=
;
>  	DEFINE(TASK_STACK, offsetof(struct task_struct, stack));
>  #ifdef CONFIG_SMP
> -	DEFINE(TASK_CPU, offsetof(struct task_struct, cpu));
> +	DEFINE(TASK_CPU, offsetof(struct task_struct, thread_info.cpu));
>  #endif

The TASK_CPU define isn't needed any longer.
So, the whole part inside #ifdef..#endif can go.

If it's Ok for you I'll clean up your patch and submit
all with the next pull request to Linus later today.

Helge



>  	BLANK();
>  	DEFINE(TASK_REGS, offsetof(struct task_struct, thread.regs));
> diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
> index 171925285f3e..0cd97fa004c5 100644
> --- a/arch/parisc/kernel/smp.c
> +++ b/arch/parisc/kernel/smp.c
> @@ -339,7 +339,7 @@ int smp_boot_one_cpu(int cpuid, struct task_struct *=
idle)
>  	const struct cpuinfo_parisc *p =3D &per_cpu(cpu_data, cpuid);
>  	long timeout;
>
> -	idle->cpu =3D cpuid;
> +	task_thread_info(idle)->cpu =3D cpuid;
>
>  	/* Let _start know what logical CPU we're booting
>  	** (offset into init_tasks[],cpu_data[])
>


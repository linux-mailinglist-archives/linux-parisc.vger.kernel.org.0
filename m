Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEDC29F3B8
	for <lists+linux-parisc@lfdr.de>; Thu, 29 Oct 2020 19:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgJ2SBH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 29 Oct 2020 14:01:07 -0400
Received: from mout.gmx.net ([212.227.17.22]:39355 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgJ2SBF (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 29 Oct 2020 14:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603994462;
        bh=LvkY3ZEHoMoeyzyp+YS8ypfTEZzd8bB8d/rZxireEDw=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=SJyU7Fg0Jb3XSZDaTXK3LLYfmymQSw0zV1l0HXAAa9sEDFPsoSkcalv7FGbRXDjKH
         /xG5PCmZPXzew5H3+5lcnuhc/XrnWb9Eb8TXPS9Oj/8Qq6awptPI3RT8+bSoBXCOX6
         2FqsX7SWWB1Sv7lxkguO0AVt09W8VOLtaphj4+fY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.179.39] ([92.116.183.86]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatVb-1jw7K23RgB-00cMhp; Thu, 29
 Oct 2020 19:01:01 +0100
Subject: Re: [PATCH] Wire up TIF_NOTIFY_SIGNAL handling for parisc (was:
 linux-parisc@vger.kernel.org)
To:     Jens Axboe <axboe@kernel.dk>, linux-parisc@vger.kernel.org
References: <18ca5e8a-2ae9-a15b-24c4-4b6b501c9121@kernel.dk>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <c2d3b7c7-331a-b258-31ab-bf7fc46dad92@gmx.de>
Date:   Thu, 29 Oct 2020 19:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <18ca5e8a-2ae9-a15b-24c4-4b6b501c9121@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L50vYv5pele+IiIhAVBGE0K8WjhsM9stFmUwTQgZSNczhwUsJk3
 CgWDY2pEXexlxkvht9b+65CUgs0sSMgeCNsWkElWaYS4LAMO2uNAOQg18e8TMcjPu3RZbiA
 bGXfAhtKOsSkbzQw7tb5fToMDIt5TXkXP+axBrIx9KOzkvLrMFW1fW8ZW7VjZZcdJKzt2vT
 vF4xPdBEztN/uGh0U9Amg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J1BDmwEy8WE=:AZTvdSz7S7ToBLes80QuVC
 T6rildbqZeinS+8U3H8nmEtwQmwHPs0218oBVRz50cukW6Zu+eXE/mehS1mHwMKxpgfqnh0CC
 v+B63HTImsdKOKQr0B4ZIjlltZ1UJOodlQ1j2eH5N7ISJ+bqkgO+VBeXHgr4CyfKYq0ewvE7i
 J92vTgnQw08sH3Jp5n8daZeNa0Ma7q3d4jWS7d+rAKpROCJvk8f3agftd6RWKtCmuma3BzG73
 q/RGrhelrpP0BHBUxwneG23TRlfYpEZ1dmtYy0zk++87r9ot673rwN8aWqAmgaLXPOWU5esKN
 oVzvVXGmgopRWXBP5EIweuRKPHIAybrc2CgV7D+tcojM+TeG03OHnZLewtzj5HGAUCC9McGRm
 ne0xx8fo+Er1n4jmJUZFQ+5XYXpgC7fFHgfsbLpPU1zvY60FIlq68LQx77DrC8dtOYajX7aT7
 ZVB/dsLw+dAH08wbCL6X+ciRc8PmRebtyvj3nITYYoHoE/6Uq9nqsi80xlb6BlOQYguso0jsZ
 JJXkxJFTG1OMQstwk3JXOeu0W7ptMiKZrupjbdqUspKV98RWJAvOkbV0dmIqZ1j04KAcuktNz
 lBAtxNmzqaiQ7I+A7J/I3icacrCO0+iToGi3R4ikpAip7/xlG7c/ueQCdgWF3AqXkbTB4iczR
 P1NMa7mGbrHgElxEVA5N4ZHCDqM+HrquVlptNMN5tZdkP6N1BjgLA8IlmpUoxE7k+VOTLsxnq
 vB6oDh5fIYdeP83lYTDZGLo1wyvtqa7AXadnbn22X0NZtCGor2cg5z1adx5kaUBPSB1gmTp3s
 G1P0pabjFSXXr25VlL1HPaPPKkxA51vo/8pcSO6U8WOQVn03LP4Hjx086JBzeDYnMIEphW+Hj
 ILAnHOuydDhES7yzof5Q==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/29/20 5:19 PM, Jens Axboe wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for parisc.

Nit: You mixed up the mail subject....

> Cc: linux-parisc@vger.kernel.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
>
> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
> for details:
>
> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk=
/
>
> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
> as that will enable a set of cleanups once all of them support it. I'm
> happy carrying this patch if need be, or it can be funelled through the
> arch tree. Let me know.

Thanks for adding the support for it on parisc.
I'd prefer if you keep it in your tree and push it together with the
other patches.

You may add:
Acked-by: Helge Deller <deller@gmx.de>

Thanks!
Helge


>  arch/parisc/include/asm/thread_info.h | 4 +++-
>  arch/parisc/kernel/signal.c           | 3 ++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include=
/asm/thread_info.h
> index 285757544cca..0bd38a972cea 100644
> --- a/arch/parisc/include/asm/thread_info.h
> +++ b/arch/parisc/include/asm/thread_info.h
> @@ -52,6 +52,7 @@ struct thread_info {
>  #define TIF_POLLING_NRFLAG	3	/* true if poll_idle() is polling TIF_NEED=
_RESCHED */
>  #define TIF_32BIT               4       /* 32 bit binary */
>  #define TIF_MEMDIE		5	/* is terminating due to OOM killer */
> +#define TIF_NOTIFY_SIGNAL	6	/* signal notifications exist */
>  #define TIF_SYSCALL_AUDIT	7	/* syscall auditing active */
>  #define TIF_NOTIFY_RESUME	8	/* callback before returning to user */
>  #define TIF_SINGLESTEP		9	/* single stepping? */
> @@ -61,6 +62,7 @@ struct thread_info {
>
>  #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
> +#define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
>  #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
>  #define _TIF_POLLING_NRFLAG	(1 << TIF_POLLING_NRFLAG)
>  #define _TIF_32BIT		(1 << TIF_32BIT)
> @@ -72,7 +74,7 @@ struct thread_info {
>  #define _TIF_SYSCALL_TRACEPOINT	(1 << TIF_SYSCALL_TRACEPOINT)
>
>  #define _TIF_USER_WORK_MASK     (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME |=
 \
> -                                 _TIF_NEED_RESCHED)
> +                                 _TIF_NEED_RESCHED | _TIF_NOTIFY_SIGNAL=
)
>  #define _TIF_SYSCALL_TRACE_MASK (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP |=
	\
>  				 _TIF_BLOCKSTEP | _TIF_SYSCALL_AUDIT | \
>  				 _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT)
> diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
> index 9f43eaeb0b0a..fb1e94a3982b 100644
> --- a/arch/parisc/kernel/signal.c
> +++ b/arch/parisc/kernel/signal.c
> @@ -603,7 +603,8 @@ do_signal(struct pt_regs *regs, long in_syscall)
>
>  void do_notify_resume(struct pt_regs *regs, long in_syscall)
>  {
> -	if (test_thread_flag(TIF_SIGPENDING))
> +	if (test_thread_flag(TIF_SIGPENDING) ||
> +	    test_thread_flag(TIF_NOTIFY_SIGNAL))
>  		do_signal(regs, in_syscall);
>
>  	if (test_thread_flag(TIF_NOTIFY_RESUME))
>


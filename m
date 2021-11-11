Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5FC44DE70
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Nov 2021 00:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhKKX1Y (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 11 Nov 2021 18:27:24 -0500
Received: from mta-tor-003.bell.net ([209.71.212.30]:12694 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229710AbhKKX1X (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 Nov 2021 18:27:23 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C8802C0B0177F4
X-CM-Envelope: MS4xfMjzTy8FVLxpm1Llgunb71byB2qDhMqxsYELFz3ys9oVTtc597EdH2WI/D2CnuOtJNWm8/G2Y5jO48RL+VtwHEoe/b55fkRJtMlxMfQDFRTkERaFJnFc
 u9mtzCg9ghzGuM2DfRAaMzjIeO3kKb/pp/6fLMc0azdPr0vmfrifgOfdWevoqNfRMVWoEi7bXidilW5kXSjpAzOMt2i0OWqCbrTsXMCwMH+oUSdbR8MhKKIw
 MGK+nC1Tul9wEwyNNfLUE6BMqZ1npjsvED9H6OnEwKznM57Sv4kxmpq1jZSQ6ceGQkFR0BdsOIhUchXf55M1fg==
X-CM-Analysis: v=2.4 cv=Zd5+iuZA c=1 sm=1 tr=0 ts=618da626
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=ZysoHL1CAAAA:8 a=FBHGMhGWAAAA:8 a=T59I9_ytL5hvFVbukTgA:9
 a=QEXdDO2ut3YA:10 a=5AXFdVBGJ8Jq6-3WnMNo:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C8802C0B0177F4; Thu, 11 Nov 2021 18:24:22 -0500
Message-ID: <c2377426-5d45-91dd-46f2-74ead855a07d@bell.net>
Date:   Thu, 11 Nov 2021 18:24:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] parisc/entry: fix trace test in syscall exit path
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
References: <20211111220429.797-1-svens@stackframe.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <20211111220429.797-1-svens@stackframe.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-11 5:04 p.m., Sven Schnelle wrote:
> commit 8779e05ba8aa ("parisc: Fix ptrace check on syscall return")
> fixed testing of TI_FLAGS. This uncovered a bug in the test mask.
> syscall_restore_rfi is only used when the kernel needs to exit to
> usespace with single stepping via recovery counter enabled. The test
> however used _TIF_SYSCALL_TRACE_MASK, which includes a lot of bits
> that shouldn't be tested here.
>
> Fix this by using TIF_SINGLESTEP and TIF_BLOCKSTEP directly and
> remove those bits from TIF_SYSCALL_TRACE_MASK.
>
> I encountered this bug by enabling syscall tracepoints. Both in qemu and
> on real hardware. As soon as i enabled the tracepoint (sys_exit_read,
> but i guess it doesn't really matter which one), i got random page
> faults in userspace almost immediately.
>
> Signed-off-by: Sven Schnelle <svens@stackframe.org>
> ---
>   arch/parisc/include/asm/thread_info.h | 3 +--
>   arch/parisc/kernel/entry.S            | 2 +-
>   2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
> index 1a58795f785c..a3ba8c518292 100644
> --- a/arch/parisc/include/asm/thread_info.h
> +++ b/arch/parisc/include/asm/thread_info.h
> @@ -68,8 +68,7 @@ struct thread_info {
>   
>   #define _TIF_USER_WORK_MASK     (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | \
>                                    _TIF_NEED_RESCHED | _TIF_NOTIFY_SIGNAL)
> -#define _TIF_SYSCALL_TRACE_MASK (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP |	\
> -				 _TIF_BLOCKSTEP | _TIF_SYSCALL_AUDIT | \
> +#define _TIF_SYSCALL_TRACE_MASK (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
>   				 _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT)
>   
>   #ifdef CONFIG_64BIT
> diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
> index 57944d6f9ebb..88c188a965d8 100644
> --- a/arch/parisc/kernel/entry.S
> +++ b/arch/parisc/kernel/entry.S
> @@ -1805,7 +1805,7 @@ syscall_restore:
>   
>   	/* Are we being ptraced? */
>   	LDREG	TASK_TI_FLAGS(%r1),%r19
> -	ldi	_TIF_SYSCALL_TRACE_MASK,%r2
> +	ldi	_TIF_SINGLESTEP|_TIF_BLOCKSTEP,%r2
This change seems applied to the old code and not 8779e05ba8aa.

Dave

-- 
John David Anglin  dave.anglin@bell.net


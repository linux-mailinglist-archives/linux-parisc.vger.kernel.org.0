Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F3D4517D9
	for <lists+linux-parisc@lfdr.de>; Mon, 15 Nov 2021 23:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbhKOWrI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 15 Nov 2021 17:47:08 -0500
Received: from mta-tor-001.bell.net ([209.71.212.28]:26976 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349824AbhKOW21 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 Nov 2021 17:28:27 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C8802C0B4649A6
X-CM-Envelope: MS4xfBULVjOl4cpiNaLGFRdqk1LgbKKxPXGHqXE7MSAUOHLNsAYrCMdFNN5+bZWuZ1KtXlGi2LyKFzN7oD5cVJebZUjRXaMurZBmI++ZHUTQoDMxWtO8XbZ+
 b8peX+hcgUkgxrgcPkv2hnjBcoTQ5j4bXgX2sRQiO9AMM+tUULEw2gShL9CK/8L8TBoZ7oxX/j0HHYFz3x/aLK9bFfPtrfvniNb7JCVQgqo/LmuQrz2M9SIJ
 GNmuX6xTiTY72nIgv0a9QxfkvL3jQFb+MoyX1aWXsLnp7HfvN1KtTqdmb3W2/cHJG9of5IGqFxfF7zDkes1q0xp04jzJOXIihnl+i2NYSqk=
X-CM-Analysis: v=2.4 cv=Zd5+iuZA c=1 sm=1 tr=0 ts=6192de51
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=N9WcvLJbCjeZKmjANRwA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C8802C0B4649A6; Mon, 15 Nov 2021 17:25:21 -0500
Message-ID: <689b8410-5384-f77d-0724-eddbb4452368@bell.net>
Date:   Mon, 15 Nov 2021 17:25:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/4] parisc: Reduce sigreturn trampoline to 3 instructions
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20210908204405.127665-1-deller@gmx.de>
 <20210908204405.127665-4-deller@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <20210908204405.127665-4-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This change breaks signal delivery and causes various glibc tests to fail.

commit 3e4a1aff2a97cb4fd7f0268e4b69e8c9d3641277:
dave@atlas:~/gnu/glibc/objdir$ env GCONV_PATH=/home/dave/gnu/glibc/objdir/iconvdata LOCPATH=/home/dave/gnu/glibc/objdir/localedata LC_ALL=C 
/home/dave/gnu/glibc/objdir/elf/ld.so.1 --library-path 
/home/dave/gnu/glibc/objdir:/home/dave/gnu/glibc/objdir/math:/home/dave/gnu/glibc/objdir/elf:/home/dave/gnu/glibc/objdir/dlfcn:/home/dave/gnu/glibc/objdir/nss:/home/dave/gnu/glibc/objdir/nis:/home/dave/gnu/glibc/objdir/rt:/home/dave/gnu/glibc/objdir/resolv:/home/dave/gnu/glibc/objdir/mathvec:/home/dave/gnu/glibc/objdir/support:/home/dave/gnu/glibc/objdir/crypt:/home/dave/gnu/glibc/objdir/nptl 
/home/dave/gnu/glibc/objdir/nptl/tst-cancelx4
got size 4512
in-time cancel test of 'read' successful
in-time cancel test of 'readv' successful
in-time cancel test of 'select' successful
in-time cancel test of 'pselect' successful
in-time cancel test of 'poll' successful
in-time cancel test of 'ppoll' successful
in-time cancel test of 'write' successful
in-time cancel test of 'writev' successful
in-time cancel test of 'sleep' successful
in-time cancel test of 'usleep' successful
in-time cancel test of 'nanosleep' successful
in-time cancel test of 'wait' successful
in-time cancel test of 'waitid' successful
in-time cancel test of 'waitpid' successful
in-time cancel test of 'sigpause' successful
in-time cancel test of 'sigsuspend' successful
in-time cancel test of 'sigwait' successful
in-time cancel test of 'sigwaitinfo' successful
in-time cancel test of 'sigtimedwait' successful
in-time cancel test of 'pause' successful
in-time cancel test of 'accept' successful
got size 4512
in-time cancel test of 'send' successful
in-time cancel test of 'recv' successful
in-time cancel test of 'recvfrom' successful
in-time cancel test of 'recvmsg' successful
in-time cancel test of 'msgrcv' successful
early cancel test of 'read' successful
early cancel test of 'readv' successful
early cancel test of 'select' successful
early cancel test of 'pselect' successful
early cancel test of 'poll' successful
early cancel test of 'ppoll' successful
early cancel test of 'write' successful
early cancel test of 'writev' successful
early cancel test of 'sleep' successful
early cancel test of 'usleep' successful
early cancel test of 'nanosleep' successful
early cancel test of 'wait' successful
early cancel test of 'waitid' successful
early cancel test of 'waitpid' successful
early cancel test of 'sigpause' successful
early cancel test of 'sigsuspend' successful
early cancel test of 'sigwait' successful
early cancel test of 'sigwaitinfo' successful
early cancel test of 'sigtimedwait' successful
early cancel test of 'pause' successful
early cancel test of 'accept' successful
got size 4512
early cancel test of 'send' successful
early cancel test of 'recv' successful
early cancel test of 'recvfrom' successful
early cancel test of 'recvmsg' successful
early cancel test of 'preadv' successful
early cancel test of 'preadv2' successful
early cancel test of 'pwritev' successful
early cancel test of 'pwritev2' successful
early cancel test of 'open' successful
early cancel test of 'close' successful
early cancel test of 'pread' successful
early cancel test of 'pwrite' successful
early cancel test of 'fsync' successful
early cancel test of 'fdatasync' successful
early cancel test of 'msync' successful
got size 4512
early cancel test of 'sendto' successful
early cancel test of 'sendmsg' successful
early cancel test of 'creat' successful
early cancel test of 'connect' successful
early cancel test of 'tcdrain' successful
early cancel test of 'msgrcv' successful
early cancel test of 'msgsnd' successful
dave@atlas:~/gnu/glibc/objdir$ echo $?
0

commit e4f2006f1287e7ea17660490569cff323772dac4:
dave@atlas:~/gnu/glibc/objdir$ env GCONV_PATH=/home/dave/gnu/glibc/objdir/iconvdata LOCPATH=/home/dave/gnu/glibc/objdir/localedata LC_ALL=C 
/home/dave/gnu/glibc/objdir/elf/ld.so.1 --library-path 
/home/dave/gnu/glibc/objdir:/home/dave/gnu/glibc/objdir/math:/home/dave/gnu/glibc/objdir/elf:/home/dave/gnu/glibc/objdir/dlfcn:/home/dave/gnu/glibc/objdir/nss:/home/dave/gnu/glibc/objdir/nis:/home/dave/gnu/glibc/objdir/rt:/home/dave/gnu/glibc/objdir/resolv:/home/dave/gnu/glibc/objdir/mathvec:/home/dave/gnu/glibc/objdir/support:/home/dave/gnu/glibc/objdir/crypt:/home/dave/gnu/glibc/objdir/nptl 
/home/dave/gnu/glibc/objdir/nptl/tst-cancelx4
got size 4512
cleanup handler not called for 'read'
cleanup handler not called for 'readv'
cleanup handler not called for 'select'
cleanup handler not called for 'pselect'
cleanup handler not called for 'poll'
cleanup handler not called for 'ppoll'
cleanup handler not called for 'write'
cleanup handler not called for 'writev'
cleanup handler not called for 'sleep'
cleanup handler not called for 'usleep'
cleanup handler not called for 'nanosleep'
cleanup handler not called for 'wait'
cleanup handler not called for 'waitid'
cleanup handler not called for 'waitpid'
cleanup handler not called for 'sigpause'
cleanup handler not called for 'sigsuspend'
cleanup handler not called for 'sigwait'
cleanup handler not called for 'sigwaitinfo'
cleanup handler not called for 'sigtimedwait'
cleanup handler not called for 'pause'
cleanup handler not called for 'accept'
got size 4512
cleanup handler not called for 'send'
cleanup handler not called for 'recv'
cleanup handler not called for 'recvfrom'
cleanup handler not called for 'recvmsg'
cleanup handler not called for 'msgrcv'
early cancel test of 'read' successful
early cancel test of 'readv' successful
early cancel test of 'select' successful
early cancel test of 'pselect' successful
early cancel test of 'poll' successful
early cancel test of 'ppoll' successful
early cancel test of 'write' successful
early cancel test of 'writev' successful
early cancel test of 'sleep' successful
early cancel test of 'usleep' successful
early cancel test of 'nanosleep' successful
early cancel test of 'wait' successful
early cancel test of 'waitid' successful
early cancel test of 'waitpid' successful
early cancel test of 'sigpause' successful
early cancel test of 'sigsuspend' successful
early cancel test of 'sigwait' successful
early cancel test of 'sigwaitinfo' successful
early cancel test of 'sigtimedwait' successful
early cancel test of 'pause' successful
early cancel test of 'accept' successful
got size 4512
early cancel test of 'send' successful
early cancel test of 'recv' successful
early cancel test of 'recvfrom' successful
early cancel test of 'recvmsg' successful
early cancel test of 'preadv' successful
early cancel test of 'preadv2' successful
early cancel test of 'pwritev' successful
early cancel test of 'pwritev2' successful
early cancel test of 'open' successful
early cancel test of 'close' successful
early cancel test of 'pread' successful
early cancel test of 'pwrite' successful
early cancel test of 'fsync' successful
early cancel test of 'fdatasync' successful
early cancel test of 'msync' successful
got size 4512
early cancel test of 'sendto' successful
early cancel test of 'sendmsg' successful
early cancel test of 'creat' successful
early cancel test of 'connect' successful
early cancel test of 'tcdrain' successful
early cancel test of 'msgrcv' successful
early cancel test of 'msgsnd' successful
dave@atlas:~/gnu/glibc/objdir$ echo $?
1

Dave

On 2021-09-08 4:44 p.m., Helge Deller wrote:
> We can move the INSN_LDI_R20 instruction into the branch delay slot.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   arch/parisc/include/asm/rt_sigframe.h |  2 +-
>   arch/parisc/kernel/signal.c           | 13 ++++++-------
>   arch/parisc/kernel/signal32.h         |  2 +-
>   3 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/arch/parisc/include/asm/rt_sigframe.h b/arch/parisc/include/asm/rt_sigframe.h
> index 2b3010ade00e..4b9e3d707571 100644
> --- a/arch/parisc/include/asm/rt_sigframe.h
> +++ b/arch/parisc/include/asm/rt_sigframe.h
> @@ -2,7 +2,7 @@
>   #ifndef _ASM_PARISC_RT_SIGFRAME_H
>   #define _ASM_PARISC_RT_SIGFRAME_H
>
> -#define SIGRETURN_TRAMP 4
> +#define SIGRETURN_TRAMP 3
>   #define SIGRESTARTBLOCK_TRAMP 5
>   #define TRAMP_SIZE (SIGRETURN_TRAMP + SIGRESTARTBLOCK_TRAMP)
>
> diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
> index 46b1050640b8..bbfe23c40c01 100644
> --- a/arch/parisc/kernel/signal.c
> +++ b/arch/parisc/kernel/signal.c
> @@ -288,22 +288,21 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs,
>   	   already in userspace. The first words of tramp are used to
>   	   save the previous sigrestartblock trampoline that might be
>   	   on the stack. We start the sigreturn trampoline at
> -	   SIGRESTARTBLOCK_TRAMP+X. */
> +	   SIGRESTARTBLOCK_TRAMP. */
>   	err |= __put_user(in_syscall ? INSN_LDI_R25_1 : INSN_LDI_R25_0,
>   			&frame->tramp[SIGRESTARTBLOCK_TRAMP+0]);
> -	err |= __put_user(INSN_LDI_R20,
> -			&frame->tramp[SIGRESTARTBLOCK_TRAMP+1]);
>   	err |= __put_user(INSN_BLE_SR2_R0,
> +			&frame->tramp[SIGRESTARTBLOCK_TRAMP+1]);
> +	err |= __put_user(INSN_LDI_R20,
>   			&frame->tramp[SIGRESTARTBLOCK_TRAMP+2]);
> -	err |= __put_user(INSN_NOP, &frame->tramp[SIGRESTARTBLOCK_TRAMP+3]);
>
> -	start = (unsigned long) &frame->tramp[0];
> -	end = (unsigned long) &frame->tramp[TRAMP_SIZE];
> +	start = (unsigned long) &frame->tramp[SIGRESTARTBLOCK_TRAMP+0];
> +	end = (unsigned long) &frame->tramp[SIGRESTARTBLOCK_TRAMP+3];
>   	flush_user_dcache_range_asm(start, end);
>   	flush_user_icache_range_asm(start, end);
>
>   	/* TRAMP Words 0-4, Length 5 = SIGRESTARTBLOCK_TRAMP
> -	 * TRAMP Words 5-9, Length 4 = SIGRETURN_TRAMP
> +	 * TRAMP Words 5-7, Length 3 = SIGRETURN_TRAMP
>   	 * So the SIGRETURN_TRAMP is at the end of SIGRESTARTBLOCK_TRAMP
>   	 */
>   	rp = (unsigned long) &frame->tramp[SIGRESTARTBLOCK_TRAMP];
> diff --git a/arch/parisc/kernel/signal32.h b/arch/parisc/kernel/signal32.h
> index f166250f2d06..a5bdbb5678b7 100644
> --- a/arch/parisc/kernel/signal32.h
> +++ b/arch/parisc/kernel/signal32.h
> @@ -36,7 +36,7 @@ struct compat_regfile {
>           compat_int_t rf_sar;
>   };
>
> -#define COMPAT_SIGRETURN_TRAMP 4
> +#define COMPAT_SIGRETURN_TRAMP 3
>   #define COMPAT_SIGRESTARTBLOCK_TRAMP 5
>   #define COMPAT_TRAMP_SIZE (COMPAT_SIGRETURN_TRAMP + \
>   				COMPAT_SIGRESTARTBLOCK_TRAMP)
> --
> 2.31.1
>


-- 
John David Anglin  dave.anglin@bell.net


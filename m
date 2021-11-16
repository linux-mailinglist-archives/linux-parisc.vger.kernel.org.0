Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAF6453350
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Nov 2021 14:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbhKPN6H (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Nov 2021 08:58:07 -0500
Received: from mout.gmx.net ([212.227.15.15]:50221 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229583AbhKPN6G (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Nov 2021 08:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637070903;
        bh=lKti+9mgDDZVemaIRb2/sHY9GFzmgBv+cMOpzlzMJNA=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=SuN9ebmklJ+4qdOfjY7hNcvJxLOAo2pJjlH8Jup/yGwfg/Cxhua52fyuLheKWzk6k
         WbfNdVyVz2eDBMhIMBZFXMdNLszbVj3TMjoDxwiMQeY4/Df0d6SkWsulegDiVSO5c/
         9AthzKrNoZ40XW5O9GHK8pf8FKkV/fmslgsQYJLE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.177.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO2E-1mKBbi3wvQ-00op3B; Tue, 16
 Nov 2021 14:55:03 +0100
Message-ID: <b2abc63f-a898-c925-1fc7-af5cf4930f6d@gmx.de>
Date:   Tue, 16 Nov 2021 14:54:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/4] parisc: Reduce sigreturn trampoline to 3 instructions
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20210908204405.127665-1-deller@gmx.de>
 <20210908204405.127665-4-deller@gmx.de>
 <689b8410-5384-f77d-0724-eddbb4452368@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <689b8410-5384-f77d-0724-eddbb4452368@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0S3iy02W3ulqFSyZ02FxyfrepT4dr/nm+BeAEC4ci4xiDWx48PM
 gSIbEnUHWgKZrp/mD7KNEwqTMJJgGINqjul2Zq8m7bn+sueA3EsopCkRcIW8J6MqyL80FyO
 qAvIZEh/J3EPeovAIXL/0YIGlbEVjEGjboNWhN9y/j8nAm93+lXcvU5hKNfzrigAdV68nnM
 kA1UWbcW+TJDu9ttlO8Dg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BJhH+ub30Bw=:x3ucUnALiN1v1PRuYlofT2
 fAvFpMtfTXPo1NywtWlgmDcEb9LKY/mCQudEuNGEcqqXW25ztVrhOXh5Egqgb51hw5kOUNyoK
 iK2eN+WWosamDeI7GLYKuKISVuKHUQTD0XdCzR5CVEYS1TkLLKRBFH5J9c5P87HMWb3oHbHOr
 2WN5fZY98qaXQORh6bWyl/4W65o82gwBdDOd67RPAANjIty1D84hKhxNI6Ed4xrZA+/ULBVzb
 jzINrqP1Zg2qDfjNbM+9P5NiSsfMQ1e9qp+7A/HavPbzC1LiNH1bkk1xEda6zuftj7u1Zgefs
 E4ARp+sOgRy2qa1MikTrT+x0+Cs4WjonfUjIKNJBhpHkBBJ503/bm6AgzHpDC6V9dDMuZjsGS
 NoxrAFdiOGJ6OYe3t4elewPGB9YN1G6n1WS0Q5EUPgOkFaWUYzJ33Y44A2wWF4FsHpmrjmI/S
 mO7PxsHsertQirvUCbA3WxTUMhXprUkd7nBPYYwXE5P8E/DQFP/rkDft5ImdJctMJ8ioL6hqg
 2+eoOrl4XVwBEvqa+W+s6/frH/7G2A8HdvlJPjRV+h0Hp48Xr65IvqhOIHrpiJJyIG4YPtHC1
 9EZU942v7kjSnyrCl2uRWNBRIldD/gBhj5lZwJu+sqfLpXGJVv2/0C114o2Ztf2bhrspnA9HV
 HZJqv+2DerzviaA8NnfgpPoD1nno/BSU+Q1rllgUThTZrrMH3qH2Qz53kM+VsxX5qsbWPOQhy
 dfGOvpB+eyNRcF0RZlTbBNkirGWBQ+KsquJ3GeW+Z6yoP05anmdcrY4EhfwCQaA/7GRNceAKP
 0V3QQ4u7PklZRNHhpZFKZeAjQQTjcMvqCtPQrDjAdkQCCboIxo9C/kC3DrmZJMFFTwGFQL9rc
 BBVAmvCSKSHKOXMxxBLbH72XNCTH95qEt3JCfIpc0m86BkK0aoNvYuJ569us39F9qWx4M4nMj
 9uGqSlnBTtJhaRpjKSePEqVbzAE5EEfbHkBf4uU4TU7mYDAEIgET4C1gKu9wzDzqNWWMA5lDG
 +cbjWcQBXG9PTTMWlTevKCRJ2qCzMip4rgHTHOB8Q+/eclRFG3541CqypUJ5OXRtY7wFog8G0
 kyWR0/H0rF/TXI=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Dave,

Thanks for tracking this down!

I wonder what's wrong with it.
Based on the outcome I should either completely revert that patch or fix i=
t.

Helge

On 11/15/21 23:25, John David Anglin wrote:
> This change breaks signal delivery and causes various glibc tests to fai=
l.
>
> commit 3e4a1aff2a97cb4fd7f0268e4b69e8c9d3641277:
> dave@atlas:~/gnu/glibc/objdir$ env GCONV_PATH=3D/home/dave/gnu/glibc/obj=
dir/iconvdata LOCPATH=3D/home/dave/gnu/glibc/objdir/localedata LC_ALL=3DC =
/home/dave/gnu/glibc/objdir/elf/ld.so.1 --library-path /home/dave/gnu/glib=
c/objdir:/home/dave/gnu/glibc/objdir/math:/home/dave/gnu/glibc/objdir/elf:=
/home/dave/gnu/glibc/objdir/dlfcn:/home/dave/gnu/glibc/objdir/nss:/home/da=
ve/gnu/glibc/objdir/nis:/home/dave/gnu/glibc/objdir/rt:/home/dave/gnu/glib=
c/objdir/resolv:/home/dave/gnu/glibc/objdir/mathvec:/home/dave/gnu/glibc/o=
bjdir/support:/home/dave/gnu/glibc/objdir/crypt:/home/dave/gnu/glibc/objdi=
r/nptl /home/dave/gnu/glibc/objdir/nptl/tst-cancelx4
> got size 4512
> in-time cancel test of 'read' successful
> in-time cancel test of 'readv' successful
> in-time cancel test of 'select' successful
> in-time cancel test of 'pselect' successful
> in-time cancel test of 'poll' successful
> in-time cancel test of 'ppoll' successful
> in-time cancel test of 'write' successful
> in-time cancel test of 'writev' successful
> in-time cancel test of 'sleep' successful
> in-time cancel test of 'usleep' successful
> in-time cancel test of 'nanosleep' successful
> in-time cancel test of 'wait' successful
> in-time cancel test of 'waitid' successful
> in-time cancel test of 'waitpid' successful
> in-time cancel test of 'sigpause' successful
> in-time cancel test of 'sigsuspend' successful
> in-time cancel test of 'sigwait' successful
> in-time cancel test of 'sigwaitinfo' successful
> in-time cancel test of 'sigtimedwait' successful
> in-time cancel test of 'pause' successful
> in-time cancel test of 'accept' successful
> got size 4512
> in-time cancel test of 'send' successful
> in-time cancel test of 'recv' successful
> in-time cancel test of 'recvfrom' successful
> in-time cancel test of 'recvmsg' successful
> in-time cancel test of 'msgrcv' successful
> early cancel test of 'read' successful
> early cancel test of 'readv' successful
> early cancel test of 'select' successful
> early cancel test of 'pselect' successful
> early cancel test of 'poll' successful
> early cancel test of 'ppoll' successful
> early cancel test of 'write' successful
> early cancel test of 'writev' successful
> early cancel test of 'sleep' successful
> early cancel test of 'usleep' successful
> early cancel test of 'nanosleep' successful
> early cancel test of 'wait' successful
> early cancel test of 'waitid' successful
> early cancel test of 'waitpid' successful
> early cancel test of 'sigpause' successful
> early cancel test of 'sigsuspend' successful
> early cancel test of 'sigwait' successful
> early cancel test of 'sigwaitinfo' successful
> early cancel test of 'sigtimedwait' successful
> early cancel test of 'pause' successful
> early cancel test of 'accept' successful
> got size 4512
> early cancel test of 'send' successful
> early cancel test of 'recv' successful
> early cancel test of 'recvfrom' successful
> early cancel test of 'recvmsg' successful
> early cancel test of 'preadv' successful
> early cancel test of 'preadv2' successful
> early cancel test of 'pwritev' successful
> early cancel test of 'pwritev2' successful
> early cancel test of 'open' successful
> early cancel test of 'close' successful
> early cancel test of 'pread' successful
> early cancel test of 'pwrite' successful
> early cancel test of 'fsync' successful
> early cancel test of 'fdatasync' successful
> early cancel test of 'msync' successful
> got size 4512
> early cancel test of 'sendto' successful
> early cancel test of 'sendmsg' successful
> early cancel test of 'creat' successful
> early cancel test of 'connect' successful
> early cancel test of 'tcdrain' successful
> early cancel test of 'msgrcv' successful
> early cancel test of 'msgsnd' successful
> dave@atlas:~/gnu/glibc/objdir$ echo $?
> 0
>
> commit e4f2006f1287e7ea17660490569cff323772dac4:
> dave@atlas:~/gnu/glibc/objdir$ env GCONV_PATH=3D/home/dave/gnu/glibc/obj=
dir/iconvdata LOCPATH=3D/home/dave/gnu/glibc/objdir/localedata LC_ALL=3DC =
/home/dave/gnu/glibc/objdir/elf/ld.so.1 --library-path /home/dave/gnu/glib=
c/objdir:/home/dave/gnu/glibc/objdir/math:/home/dave/gnu/glibc/objdir/elf:=
/home/dave/gnu/glibc/objdir/dlfcn:/home/dave/gnu/glibc/objdir/nss:/home/da=
ve/gnu/glibc/objdir/nis:/home/dave/gnu/glibc/objdir/rt:/home/dave/gnu/glib=
c/objdir/resolv:/home/dave/gnu/glibc/objdir/mathvec:/home/dave/gnu/glibc/o=
bjdir/support:/home/dave/gnu/glibc/objdir/crypt:/home/dave/gnu/glibc/objdi=
r/nptl /home/dave/gnu/glibc/objdir/nptl/tst-cancelx4
> got size 4512
> cleanup handler not called for 'read'
> cleanup handler not called for 'readv'
> cleanup handler not called for 'select'
> cleanup handler not called for 'pselect'
> cleanup handler not called for 'poll'
> cleanup handler not called for 'ppoll'
> cleanup handler not called for 'write'
> cleanup handler not called for 'writev'
> cleanup handler not called for 'sleep'
> cleanup handler not called for 'usleep'
> cleanup handler not called for 'nanosleep'
> cleanup handler not called for 'wait'
> cleanup handler not called for 'waitid'
> cleanup handler not called for 'waitpid'
> cleanup handler not called for 'sigpause'
> cleanup handler not called for 'sigsuspend'
> cleanup handler not called for 'sigwait'
> cleanup handler not called for 'sigwaitinfo'
> cleanup handler not called for 'sigtimedwait'
> cleanup handler not called for 'pause'
> cleanup handler not called for 'accept'
> got size 4512
> cleanup handler not called for 'send'
> cleanup handler not called for 'recv'
> cleanup handler not called for 'recvfrom'
> cleanup handler not called for 'recvmsg'
> cleanup handler not called for 'msgrcv'
> early cancel test of 'read' successful
> early cancel test of 'readv' successful
> early cancel test of 'select' successful
> early cancel test of 'pselect' successful
> early cancel test of 'poll' successful
> early cancel test of 'ppoll' successful
> early cancel test of 'write' successful
> early cancel test of 'writev' successful
> early cancel test of 'sleep' successful
> early cancel test of 'usleep' successful
> early cancel test of 'nanosleep' successful
> early cancel test of 'wait' successful
> early cancel test of 'waitid' successful
> early cancel test of 'waitpid' successful
> early cancel test of 'sigpause' successful
> early cancel test of 'sigsuspend' successful
> early cancel test of 'sigwait' successful
> early cancel test of 'sigwaitinfo' successful
> early cancel test of 'sigtimedwait' successful
> early cancel test of 'pause' successful
> early cancel test of 'accept' successful
> got size 4512
> early cancel test of 'send' successful
> early cancel test of 'recv' successful
> early cancel test of 'recvfrom' successful
> early cancel test of 'recvmsg' successful
> early cancel test of 'preadv' successful
> early cancel test of 'preadv2' successful
> early cancel test of 'pwritev' successful
> early cancel test of 'pwritev2' successful
> early cancel test of 'open' successful
> early cancel test of 'close' successful
> early cancel test of 'pread' successful
> early cancel test of 'pwrite' successful
> early cancel test of 'fsync' successful
> early cancel test of 'fdatasync' successful
> early cancel test of 'msync' successful
> got size 4512
> early cancel test of 'sendto' successful
> early cancel test of 'sendmsg' successful
> early cancel test of 'creat' successful
> early cancel test of 'connect' successful
> early cancel test of 'tcdrain' successful
> early cancel test of 'msgrcv' successful
> early cancel test of 'msgsnd' successful
> dave@atlas:~/gnu/glibc/objdir$ echo $?
> 1
>
> Dave
>
> On 2021-09-08 4:44 p.m., Helge Deller wrote:
>> We can move the INSN_LDI_R20 instruction into the branch delay slot.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>> =C2=A0 arch/parisc/include/asm/rt_sigframe.h |=C2=A0 2 +-
>> =C2=A0 arch/parisc/kernel/signal.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ++++++-------
>> =C2=A0 arch/parisc/kernel/signal32.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 3 files changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/parisc/include/asm/rt_sigframe.h b/arch/parisc/includ=
e/asm/rt_sigframe.h
>> index 2b3010ade00e..4b9e3d707571 100644
>> --- a/arch/parisc/include/asm/rt_sigframe.h
>> +++ b/arch/parisc/include/asm/rt_sigframe.h
>> @@ -2,7 +2,7 @@
>> =C2=A0 #ifndef _ASM_PARISC_RT_SIGFRAME_H
>> =C2=A0 #define _ASM_PARISC_RT_SIGFRAME_H
>>
>> -#define SIGRETURN_TRAMP 4
>> +#define SIGRETURN_TRAMP 3
>> =C2=A0 #define SIGRESTARTBLOCK_TRAMP 5
>> =C2=A0 #define TRAMP_SIZE (SIGRETURN_TRAMP + SIGRESTARTBLOCK_TRAMP)
>>
>> diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
>> index 46b1050640b8..bbfe23c40c01 100644
>> --- a/arch/parisc/kernel/signal.c
>> +++ b/arch/parisc/kernel/signal.c
>> @@ -288,22 +288,21 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *se=
t, struct pt_regs *regs,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 already in userspace. =
The first words of tramp are used to
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 save the previous sigr=
estartblock trampoline that might be
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 on the stack. We start=
 the sigreturn trampoline at
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SIGRESTARTBLOCK_TRAMP+X. */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SIGRESTARTBLOCK_TRAMP. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err |=3D __put_user(in_syscall ? INSN_LD=
I_R25_1 : INSN_LDI_R25_0,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &frame->tramp[SIGRESTARTBLOCK_TRAMP+0]);
>> -=C2=A0=C2=A0=C2=A0 err |=3D __put_user(INSN_LDI_R20,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fr=
ame->tramp[SIGRESTARTBLOCK_TRAMP+1]);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err |=3D __put_user(INSN_BLE_SR2_R0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fr=
ame->tramp[SIGRESTARTBLOCK_TRAMP+1]);
>> +=C2=A0=C2=A0=C2=A0 err |=3D __put_user(INSN_LDI_R20,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &frame->tramp[SIGRESTARTBLOCK_TRAMP+2]);
>> -=C2=A0=C2=A0=C2=A0 err |=3D __put_user(INSN_NOP, &frame->tramp[SIGREST=
ARTBLOCK_TRAMP+3]);
>>
>> -=C2=A0=C2=A0=C2=A0 start =3D (unsigned long) &frame->tramp[0];
>> -=C2=A0=C2=A0=C2=A0 end =3D (unsigned long) &frame->tramp[TRAMP_SIZE];
>> +=C2=A0=C2=A0=C2=A0 start =3D (unsigned long) &frame->tramp[SIGRESTARTB=
LOCK_TRAMP+0];
>> +=C2=A0=C2=A0=C2=A0 end =3D (unsigned long) &frame->tramp[SIGRESTARTBLO=
CK_TRAMP+3];
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flush_user_dcache_range_asm(start, end);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flush_user_icache_range_asm(start, end);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* TRAMP Words 0-4, Length 5 =3D SIGREST=
ARTBLOCK_TRAMP
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * TRAMP Words 5-9, Length 4 =3D SIGRETURN_TRA=
MP
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * TRAMP Words 5-7, Length 3 =3D SIGRETURN_TRA=
MP
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * So the SIGRETURN_TRAMP is at the=
 end of SIGRESTARTBLOCK_TRAMP
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rp =3D (unsigned long) &frame->tramp[SIG=
RESTARTBLOCK_TRAMP];
>> diff --git a/arch/parisc/kernel/signal32.h b/arch/parisc/kernel/signal3=
2.h
>> index f166250f2d06..a5bdbb5678b7 100644
>> --- a/arch/parisc/kernel/signal32.h
>> +++ b/arch/parisc/kernel/signal32.h
>> @@ -36,7 +36,7 @@ struct compat_regfile {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compat_int_t rf_=
sar;
>> =C2=A0 };
>>
>> -#define COMPAT_SIGRETURN_TRAMP 4
>> +#define COMPAT_SIGRETURN_TRAMP 3
>> =C2=A0 #define COMPAT_SIGRESTARTBLOCK_TRAMP 5
>> =C2=A0 #define COMPAT_TRAMP_SIZE (COMPAT_SIGRETURN_TRAMP + \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPAT_SIGRESTARTBLOCK_TRAMP)
>> --
>> 2.31.1
>>
>
>


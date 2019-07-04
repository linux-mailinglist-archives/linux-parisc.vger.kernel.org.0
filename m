Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD64D5FDCB
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Jul 2019 22:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfGDUhI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Jul 2019 16:37:08 -0400
Received: from mout.gmx.net ([212.227.15.15]:44397 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbfGDUhI (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Jul 2019 16:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562272591;
        bh=I1pg0gnf2bRhzsgWO1jsrUSWN4VPmqfacHDZFa/w8vI=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=XGNxOh8osg4dBZY5uKrXObkXDzs1rZhXUtFlRZt0E+/Ozd5IC2VJrQgGSBf9pEwVo
         S5V7fQLkcXejXolV/uHqaYXTFs19s0LYvFcO/DlA+7YJkLLx4UujOtBZNygVIpESaM
         ta3MpL/2J1ijF1gAyHj8ZvTHie1VWzYsbOMEcuX4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.151.143]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M9ra4-1hpi343eJ6-00B0hB; Thu, 04
 Jul 2019 22:36:30 +0200
Subject: Re: [PATCH] parisc: Fix kernel panic due invalid values of IAOQ0 or
 IAOQ1
From:   Helge Deller <deller@gmx.de>
To:     Jeroen Roovers <jer@gentoo.org>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
References: <20190703063524.GA27797@ls3530.dellerweb.de>
 <20190704212321.42a00ebb@wim.jer>
 <238a1253-7967-6f2b-76d5-0c01da87c20d@gmx.de>
 <55c2046b-6715-c332-d67e-dd8b87ef5250@gmx.de>
Message-ID: <bbb57fc8-8f2b-2077-9e59-fed59300b511@gmx.de>
Date:   Thu, 4 Jul 2019 22:36:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <55c2046b-6715-c332-d67e-dd8b87ef5250@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7OKXseBnfpiGFkbz+IrtcL+5zmvLt9SWH5AAgbAPJoYYEigQzOn
 bqBeSPhwveLzJFYEk/p6v86RKOCxbP9SkxDTm/qlIOgrquDIgvZjCB8exlVVSTnHD4+X5sh
 TpYOTZiW8rRfEmfLH5O93uc+yWqyybZnN1IzUMpVr8yE174zTmq8MCknfR0svfJpg2UDcU4
 AKM+1CWqhfVx/H5VHwgiw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gT568Vn3M9w=:HTbrYwMwjkcYC46jb1GJs3
 GXVqnUnJQmL8ydLjjIyvJM7V5mfaIkTtQmJrkkSIMJyiVC6R7ISFQsKwO3Oj9+ZaAqasPpaXT
 Kmf1UyIPjYV/1XuDKbLdFa9ZBC2UCjZnOKNpj2vcx8cZlKnUfX5vuuFoR6cPFpVMOMGO7iVl0
 1N8l0WP9JrHtAEeKVN8WLLVA0ginZcIq3+7b0+D3PEky7QRWQByrzCRNFcfjGBrvF2eY/9twi
 Rlsjdj/umVspVYRDtTp6M9USzi77NUYWCxCWEN9NmAEHCXw8mlHNGiSTiq5BF+ao6LF2TGo2c
 JlOT5fIhFLAOQ/bJiZlAD8MKka4u3HKtapmI2rXA35KFreS7YXBJHcIQpIKqjWPGnd0nTbXGZ
 6lrhiMyMhA/F49Od4osEqxVn/nNQ51EALjTFD/B+En+MwkZML5d6HVoon9zX6TJuQN6Kuj0CT
 GLWUjye6izsZGTm5ZAzG5ocDkWqLsLcFQyZNrdSZRHaU82rcAC/KJgiqwjxUCwHZsnTFIFN4f
 JEghVkniC9Y/QrH5K13LOvF5oCQpdvaRIGhqIy7e55WJ25rXgQdmVrUSDxjmCOyvK5RJwk4E4
 mun9nBd/w1CtMZMzL0BaWS6+06qJ0HIuUt+T7TYNurrI9HdmHLaBip9rGGAlOJVbcxywNO34k
 NEXg/X9pmvpZHAZDOvkMJteioMKiiCORPsyafGUD+X5BpjYfn1m24J84lgw80M6cujxV9fbFj
 rNEq0IF/2ECpFPqHFiFUQFZYloi8Gz0Ts3mZwdRpYGdKJIj+nrlFTu0l0YmEA5NpD/QuRiUyc
 nO2NHOUXFL9PHmu/nqKYuFaxv2A+66D57CqEDMGz9GfuyYJ8oRzKgAKJGwNO73sRHlzLFI25U
 JNIccM0MIXvHEpqRYc184IncSK0vRrdGGC7v5qfcf06/AxSVFere7fUfkSH3CmhO6KyRoNtPS
 w5npky7BLtwt7hqjqUdwEz8xNP63S0FX8XMXegeYJgr+qK2U98Mw294C9cWNmOAjwjYEzkJk/
 Fu03d81MBY6E1q0boj1hpbfRavmba0ajqLbLyYbmLH02vK5FuK3lcVDpw5Z9g3XGQ+tffGNSX
 50P0JYQvT2NKqrrFr1TmO6Akzctzwq9KTfOFHIg7vbD6I3VxnDGNngM9LtTbGqQ6M0EwoYl5k
 doDcSh0BiPthr2WjQsmXvqV2MoPyinSE4rSkxU0IpMkm+SFzd816UMuKvPn63qrM4lPEl25fA
 KC6Jxs+YcfHM10Yew
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 04.07.19 21:58, Helge Deller wrote:
> On 04.07.19 21:54, Helge Deller wrote:
>> Hi Jeroen,
>>
>> On 04.07.19 21:23, Jeroen Roovers wrote:
>>> On Wed, 3 Jul 2019 08:35:24 +0200
>>> Helge Deller <deller@gmx.de> wrote:
>>>
>>>> On parisc the privilege level of a process is stored in the lowest
>>>> two bits of the instruction pointers (IAOQ0 and IAOQ1). On Linux we
>>>> use privilege level 0 for the kernel and privilege level 3 for
>>>> user-space. So userspace should not be allowed to modify IAOQ0 or
>>>> IAOQ1 of a ptraced process to change it's privilege level to e.g. 0
>>>> to try to gain kernel privileges.
>>>>
>>>> This patch prevents such modifications by always setting the two
>>>> lowest bits to one (which relates to privilege level 3 for
>>>> user-space) if IAOQ0 or IAOQ1 are modified via ptrace calls.
>>>>
>>>> Fixes: https://bugs.gentoo.org/481768
>>>> Reported-by: Jeroen Roovers <jer@gentoo.org>
>>>> Cc: <stable@vger.kernel.org>
>>>>
>>>> diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.=
c
>>>> index a3d2fb4e6dd2..8ecd41938709 100644
>>>> --- a/arch/parisc/kernel/ptrace.c
>>>> +++ b/arch/parisc/kernel/ptrace.c
>>>> @@ -167,6 +175,9 @@ long arch_ptrace(struct task_struct *child, long
>>>> request, if ((addr & (sizeof(unsigned long)-1)) ||
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 addr >=3D sizeof(struct pt_regs))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (addr =3D=3D PT_IAOQ0 =
|| addr =3D=3D PT_IAOQ1) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
ata |=3D 3; /* ensure userspace privilege */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((addr >=3D=
 PT_GR1 && addr <=3D PT_GR31) ||
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr =3D=3D PT_IAOQ0 || addr =3D=3D PT_I=
AOQ1
>>>> || (addr >=3D PT_FR0 && addr <=3D PT_FR31 + 4) ||
>>>> @@ -281,6 +292,9 @@ long compat_arch_ptrace(struct task_struct
>>>> *child, compat_long_t request, addr =3D translate_usr_offset(addr);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (addr >=3D sizeof(struct pt_regs))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (addr =3D=3D PT_IAOQ0 || addr =3D=3D PT_IAOQ1) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 data |=3D 3; /* ensure userspace
>>>> privilege */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (addr >=3D PT_FR0 && addr <=3D PT_FR31 + 4) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Special case, fp regs are 64 bits
>>>> anyway */ *(__u64 *) ((char *) task_regs(child) + addr) =3D data;
>>>
>>> That may fix some problem, but it sadly does not fix the problem
>>> reported in https://bugs.gentoo.org/481768 . Both root and unprivilege=
d
>>> users can still trigger the same kernel panic with a kernel patches
>>> thusly. How can we help you reproduce the issue?
>>
>> Thanks for testing, but are you sure?
>> It does fix exactly that kernel panic for me.
>> Instead of triggering a kernel panic, the ptraced process now gets
>> killed by a segfault, which is exactly what should happen:
>>
>> Breakpoint 1, main () at gdb-crash.c:24
>> 24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb-crash.c: No such file or directory=
.
>> (gdb) set tp =3D { 3,4 }
>> Python Exception <type 'exceptions.NameError'> Installation error: gdb.=
execute_unwinders function is missing:
>> Program received signal SIGSEGV, Segmentation fault.
>> 0x00000000 in ?? ()
>> The program being debugged was signaled while in a function called from=
 GDB.
>> GDB remains in the frame where the signal was received.
>> To change this behavior use "set unwindonsignal on".
>> Evaluation of the expression containing the function
>> (malloc) will be abandoned.
>> When the function is done executing, GDB will silently stop.
>> (gdb)
>>
>> Of course this patch does not fix gdb in such a way that
>> it handles the "set tp =3D { 5,3 }" correctly. That's a gdb issue.
>>
>> The above log is from a 32bit-kernel. Did you maybe tested a 64bit kern=
el (I didn't tested it).
>> Or maybe you didn't booted a kernel with that patch?
>> I'm pretty sure the patch is correct.
>
> In case you still get a kernel panic, please verify the value of "IAOQ" =
in the panic you see:
> IASQ: 0000000000334000 0000000000334000 IAOQ: 0000000000000000 000000000=
0000004
>
> If the value is still "0000000000000000" instead of "0000000000000003",
> then my patch wasn't applied correctly.

I'm wrong.
I see crashes with a 64bit kernel too. 32bit kernel worked nicely.
Will analyze.

Helge

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBE55FD95
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Jul 2019 21:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfGDT7O (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Jul 2019 15:59:14 -0400
Received: from mout.gmx.net ([212.227.17.21]:48489 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbfGDT7O (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Jul 2019 15:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562270320;
        bh=5V9iGc7IwxxlS7mcNOTIR7T2RJDYxiF+Ra17iusKYxo=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=WRYD9NH4a+9lJrrstHE7doGU0oY6O7tPcdFoBqMKM1diy5KNIA6nZhLxWUh/FwoTz
         hqzExyoHvu5qN6fwhY9qNvhgMDZaXVDLU+Bsi1XN6UXrj4rTRPhAsIJJ3/XeSUdtl/
         KIsj1ZZxLYgTZ19JDunNGp11mHfwz79uN4aiz+hY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.151.143]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXyJ-1i1UbA44AZ-00YykI; Thu, 04
 Jul 2019 21:58:40 +0200
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
Message-ID: <55c2046b-6715-c332-d67e-dd8b87ef5250@gmx.de>
Date:   Thu, 4 Jul 2019 21:58:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <238a1253-7967-6f2b-76d5-0c01da87c20d@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:494kZvLdjpbiiSLOm/XcMZbOJoW4+148K3L0UkFqSRCFA9vOccK
 MBeG4RzFeqI8bw/cNTTs/iGdlMwJgBoaqmWifrKr4yf9vI6Ed9fSQfYh3Hn1R+eZ7urTHc1
 tMAsSHRl0OuLsGDKIOZpCefy37FSzpVg53dZMuu2+/4XQZqeSTFgsg8YPIwg3x086v5W1MH
 47zP3t3R8riMOYiPgLlvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OQzumrEj6Js=:sWM9ayDGiiYYwo83WSCjpd
 nNV7X0xp/Vo0sxMGV7MqiYSng4/q2HJ4tjJGJSpSkWDVfR6R89B8oNlgaip7hrHWB9bg1bfg7
 j4BjGc0WsWwmwloNuY6lkurK8i7RrBwqKmZp1/YLqgzf9CdXqjnNPhQ3BuJBMR5LLdBdQs8sY
 hvBb/eRcrna0li39c8OW3btt7EzgvKVIKjmy7IBt7XrahjLSIp8vaEHSoCrp8xVLzgEuXJ0ON
 BnIz+GNysZC8eYqMe3K5HP8wSCRSUIUpF0+kwoRi/0In2tZ99Wd3PPJ6sw8bcDGHh6l0ZJ0X/
 d8mmPOZ/rGOXdebTZ3the6FHTiyKJf9BYoO0bRJopbBmElrEWK0+sKoI4lKLoa85KV4GyvnW+
 pbd+q/m7V5alk3EhFUkxarpGN0CR1TSoCAygJWBbmdhRWxGxCF32zuJxwZkSe/Twd5YmOIal9
 PEe0L5LIIpPI+LOMcnyeGsK963a4y325Rtkzb5q9QZybvLEcnAz+LkwWfeG23kSZAvwptA/h4
 dK6RdZvj8MhMjKfJRAJJmwhrZfd0yHjpczg/pvuzs0X1OL92bIuXUQVsdVKoFl/dKf0xIaHZU
 RSI+sbNV8eBC3lz3CGqGuOlrmtad5TCdotw5UXhQhvrsgVtoc00qeq3ZhMNAcrusjJ4/4z9C0
 dtLxY71XHikFi1gfn3BSo5YoNHOfO7B+Gg4LQRLu4ldh0bEVv3TvgY2FR3Ye9ICWHUKsZ/Dtn
 /cMQ1uQAdc27XokjvCs3oaY+p3pPJQQAtp/mWOgKYtwECHqpPQDmYaQp1owYGdBvFlSm34zNF
 GnHz7ujatyoojD34gvPNKNXKhQvuUC+nfujFMpaAU4eT0AnUpCtaZZwqNxKB2scjapMT5BgW9
 Ai8fGRw4Whan6npw2ft0qupAwssUAn6WyLi7foDj71ysW1b7Hxl1p4vTIWE5GTjW5AabOU7WG
 Swa7PglEfCi3RDti3C2Jf2XIKP8w77SmgC37ORc+D8NLnG7z/lemRVw6RclsvcydSkbJeg/s1
 P+mAdmCETGAqewbJ+1RvPkojpMROGcJ5HxWkYPxUDpq0wsJyFSfraP9btgiNlWotPAo7Al8x/
 8MIM3Ha8ptELX/CGnhlocbroOUAY3jZ4LSMOmWIUAxATQD8dyh6XfenSBgBSYRuqh1/RiEsJV
 iU8vJ4PAYPrhCIXSciEMUHoU6wlRFyBkZ6DVaekjjht0HoPM2Cdv5IZthDTXLUM+okF70=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 04.07.19 21:54, Helge Deller wrote:
> Hi Jeroen,
>
> On 04.07.19 21:23, Jeroen Roovers wrote:
>> On Wed, 3 Jul 2019 08:35:24 +0200
>> Helge Deller <deller@gmx.de> wrote:
>>
>>> On parisc the privilege level of a process is stored in the lowest
>>> two bits of the instruction pointers (IAOQ0 and IAOQ1). On Linux we
>>> use privilege level 0 for the kernel and privilege level 3 for
>>> user-space. So userspace should not be allowed to modify IAOQ0 or
>>> IAOQ1 of a ptraced process to change it's privilege level to e.g. 0
>>> to try to gain kernel privileges.
>>>
>>> This patch prevents such modifications by always setting the two
>>> lowest bits to one (which relates to privilege level 3 for
>>> user-space) if IAOQ0 or IAOQ1 are modified via ptrace calls.
>>>
>>> Fixes: https://bugs.gentoo.org/481768
>>> Reported-by: Jeroen Roovers <jer@gentoo.org>
>>> Cc: <stable@vger.kernel.org>
>>>
>>> diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
>>> index a3d2fb4e6dd2..8ecd41938709 100644
>>> --- a/arch/parisc/kernel/ptrace.c
>>> +++ b/arch/parisc/kernel/ptrace.c
>>> @@ -167,6 +175,9 @@ long arch_ptrace(struct task_struct *child, long
>>> request, if ((addr & (sizeof(unsigned long)-1)) ||
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 addr >=3D sizeof(struct pt_regs))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (addr =3D=3D PT_IAOQ0 |=
| addr =3D=3D PT_IAOQ1) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 da=
ta |=3D 3; /* ensure userspace privilege */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((addr >=3D =
PT_GR1 && addr <=3D PT_GR31) ||
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr =3D=3D PT_IAOQ0 || addr =3D=3D PT_I=
AOQ1
>>> || (addr >=3D PT_FR0 && addr <=3D PT_FR31 + 4) ||
>>> @@ -281,6 +292,9 @@ long compat_arch_ptrace(struct task_struct
>>> *child, compat_long_t request, addr =3D translate_usr_offset(addr);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (addr >=3D sizeof(struct pt_regs))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (addr =3D=3D PT_IAOQ0 || addr =3D=3D PT_IAOQ1) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 data |=3D 3; /* ensure userspace
>>> privilege */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (addr >=3D PT_FR0 && addr <=3D PT_FR31 + 4) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Special case, fp regs are 64 bits
>>> anyway */ *(__u64 *) ((char *) task_regs(child) + addr) =3D data;
>>
>> That may fix some problem, but it sadly does not fix the problem
>> reported in https://bugs.gentoo.org/481768 . Both root and unprivileged
>> users can still trigger the same kernel panic with a kernel patches
>> thusly. How can we help you reproduce the issue?
>
> Thanks for testing, but are you sure?
> It does fix exactly that kernel panic for me.
> Instead of triggering a kernel panic, the ptraced process now gets
> killed by a segfault, which is exactly what should happen:
>
> Breakpoint 1, main () at gdb-crash.c:24
> 24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb-crash.c: No such file or directory.
> (gdb) set tp =3D { 3,4 }
> Python Exception <type 'exceptions.NameError'> Installation error: gdb.e=
xecute_unwinders function is missing:
> Program received signal SIGSEGV, Segmentation fault.
> 0x00000000 in ?? ()
> The program being debugged was signaled while in a function called from =
GDB.
> GDB remains in the frame where the signal was received.
> To change this behavior use "set unwindonsignal on".
> Evaluation of the expression containing the function
> (malloc) will be abandoned.
> When the function is done executing, GDB will silently stop.
> (gdb)
>
> Of course this patch does not fix gdb in such a way that
> it handles the "set tp =3D { 5,3 }" correctly. That's a gdb issue.
>
> The above log is from a 32bit-kernel. Did you maybe tested a 64bit kerne=
l (I didn't tested it).
> Or maybe you didn't booted a kernel with that patch?
> I'm pretty sure the patch is correct.

In case you still get a kernel panic, please verify the value of "IAOQ" in=
 the panic you see:
IASQ: 0000000000334000 0000000000334000 IAOQ: 0000000000000000 00000000000=
00004

If the value is still "0000000000000000" instead of "0000000000000003",
then my patch wasn't applied correctly.

Helge

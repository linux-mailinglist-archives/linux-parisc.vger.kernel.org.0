Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5788C5FD8E
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Jul 2019 21:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfGDTy4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Jul 2019 15:54:56 -0400
Received: from mout.gmx.net ([212.227.17.21]:50205 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726805AbfGDTyz (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Jul 2019 15:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562270053;
        bh=zgFueA6b6cAROz6KScOZXUS97Y+7jKXfLgoydUq8lss=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=AzLC3HsfXZFOQtmKQlr+SHnoQchiG193lsKQpu3x1W3N0F9LoORneJnjCG4TH3dez
         GsmLYJNMp1CYZshY+BxlR8IaDAvtl3hhcBoETKWjJfJc2oYJFer6nojL17Qg2bqS3k
         +I+5K7whvp9KFEDaS8gP3n4zHygFLfvSe/czLdp0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.151.143]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LgI0W-1iLmXQ3Flk-00ng98; Thu, 04
 Jul 2019 21:54:12 +0200
Subject: Re: [PATCH] parisc: Fix kernel panic due invalid values of IAOQ0 or
 IAOQ1
To:     Jeroen Roovers <jer@gentoo.org>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
References: <20190703063524.GA27797@ls3530.dellerweb.de>
 <20190704212321.42a00ebb@wim.jer>
From:   Helge Deller <deller@gmx.de>
Message-ID: <238a1253-7967-6f2b-76d5-0c01da87c20d@gmx.de>
Date:   Thu, 4 Jul 2019 21:54:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704212321.42a00ebb@wim.jer>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kh5xvYbYybVmqFhCU9qZxz1b3gQWRPVMPfr/E/6ytESqVaILGcz
 nWAagz/7mBVuM1OGzM8cWtU9aujDn5ShplGWQ+HVXX7vbvDAO3MdMaYIoriXzDQt0Vzwf45
 ybs1WMQ1u/zOFuM72k0C6uQ+5WdsySQDxdYqrk+dlpixREXDtHzHtFQpb39AqKEA0mf6q9p
 I1eV6ScXeInFdZzlWMAQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kuUtpJFxuMY=:xkoIxfZVarRUi8hgPmjBLF
 AQ3O03YXcAs3D9TbYamgHKEAXofCdD/1X7YFZGpEoaQ+ryzQjvGo5FdfONvuRBQhQP5HMpYPs
 m75qn3ToqlwfDDhats33WpKGkTPSMRFZsa7F/bOGYZdVs8UzDzc6N+PoGnZDQuNPQzH19n2zL
 tnovTrBREtjZX8qZWSPgEuMPCMJdRHKREzah02JtMYoGXCR78Vk76lDpo7A75/kR/yrscOR4K
 ZF0UzwcC8gWsv1pG5DUzcFtIzeCCoh+ekgOnzmS92PXGlWw4fnZLzMES5Am126Y184Ihpn9cl
 fEYSKY6JNy/xQWN/950EB3XPhfyeD606FQTrHEQq686/F8NIhsob6GKHb0MKRUxgZ18UNdxLz
 qnGh4gH82py7TLmC6PXmyQRdREboj1cJhxVVSvgtEsHEPAdSB9qyQtJjV/fW3/x7pxC7N7TUQ
 iYflVj+YEai8AN2drYAx/97dacvL/Sb7Zv7lH8sQCEfY+30oWECGzyyHQPefzHAIevEJEAXMy
 VJCMXD8HjAmgT8e2mDtKCWTcHhICkSHp0gwTLTNsF8vW5Cak0IcfjXtutrX/wKTiiEkU2Ipms
 IfspDUY34hZVFeJAUsbv+dQ+EjE6Ca7C0lHp+acuoFTPtpHvqA7Ial0H8Ms4Kag7EHd6eAAyw
 OgIFRrXey0iS4/7s1CQDDLWYryde5iM+CZn+SHFwg3+76bZCmMxdksWEljXCtjJUJPWSGBa2n
 f8jDEFLth1k9sZ7WQeG9xJve7HZkgkvBfwZhHdQ4GIok7bN1NYVypRgdc/0FcnUXyJ1wgG1mU
 o4lljajswB4S9aTPVLxnhGFJfn3AvvnZ2LrRqh85RZCY3O5N8sMx8HKYcsoSAr/6oefsBT4LW
 bkcWwIL0PDLLE/WF5Ha6psKObDJZhKMSmbe0HSA3bqhXJJHn5k4tUwkfFWsxASVsQGdWtiXr2
 GXvuueKGSmhyJYZDVa6is5AqdQVJebzNHKmzy2Zw4+gyHrjELlPZyPNSZiDDr9Ocg5Ts3JQK+
 VD8EyUj9XYvTpDcYZNZRnu+58qt0dd/fmIE45zp7UMPMbRFZdfqNKahEDIzUutjgiYUR2RAyR
 tfXbT6A6hWnFzM=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Jeroen,

On 04.07.19 21:23, Jeroen Roovers wrote:
> On Wed, 3 Jul 2019 08:35:24 +0200
> Helge Deller <deller@gmx.de> wrote:
>
>> On parisc the privilege level of a process is stored in the lowest
>> two bits of the instruction pointers (IAOQ0 and IAOQ1). On Linux we
>> use privilege level 0 for the kernel and privilege level 3 for
>> user-space. So userspace should not be allowed to modify IAOQ0 or
>> IAOQ1 of a ptraced process to change it's privilege level to e.g. 0
>> to try to gain kernel privileges.
>>
>> This patch prevents such modifications by always setting the two
>> lowest bits to one (which relates to privilege level 3 for
>> user-space) if IAOQ0 or IAOQ1 are modified via ptrace calls.
>>
>> Fixes: https://bugs.gentoo.org/481768
>> Reported-by: Jeroen Roovers <jer@gentoo.org>
>> Cc: <stable@vger.kernel.org>
>>
>> diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
>> index a3d2fb4e6dd2..8ecd41938709 100644
>> --- a/arch/parisc/kernel/ptrace.c
>> +++ b/arch/parisc/kernel/ptrace.c
>> @@ -167,6 +175,9 @@ long arch_ptrace(struct task_struct *child, long
>> request, if ((addr & (sizeof(unsigned long)-1)) ||
>>   		     addr >=3D sizeof(struct pt_regs))
>>   			break;
>> +		if (addr =3D=3D PT_IAOQ0 || addr =3D=3D PT_IAOQ1) {
>> +			data |=3D 3; /* ensure userspace privilege */
>> +		}
>>   		if ((addr >=3D PT_GR1 && addr <=3D PT_GR31) ||
>>   				addr =3D=3D PT_IAOQ0 || addr =3D=3D PT_IAOQ1
>> || (addr >=3D PT_FR0 && addr <=3D PT_FR31 + 4) ||
>> @@ -281,6 +292,9 @@ long compat_arch_ptrace(struct task_struct
>> *child, compat_long_t request, addr =3D translate_usr_offset(addr);
>>   			if (addr >=3D sizeof(struct pt_regs))
>>   				break;
>> +			if (addr =3D=3D PT_IAOQ0 || addr =3D=3D PT_IAOQ1) {
>> +				data |=3D 3; /* ensure userspace
>> privilege */
>> +			}
>>   			if (addr >=3D PT_FR0 && addr <=3D PT_FR31 + 4) {
>>   				/* Special case, fp regs are 64 bits
>> anyway */ *(__u64 *) ((char *) task_regs(child) + addr) =3D data;
>
> That may fix some problem, but it sadly does not fix the problem
> reported in https://bugs.gentoo.org/481768 . Both root and unprivileged
> users can still trigger the same kernel panic with a kernel patches
> thusly. How can we help you reproduce the issue?

Thanks for testing, but are you sure?
It does fix exactly that kernel panic for me.
Instead of triggering a kernel panic, the ptraced process now gets
killed by a segfault, which is exactly what should happen:

Breakpoint 1, main () at gdb-crash.c:24
24      gdb-crash.c: No such file or directory.
(gdb) set tp =3D { 3,4 }
Python Exception <type 'exceptions.NameError'> Installation error: gdb.exe=
cute_unwinders function is missing:
Program received signal SIGSEGV, Segmentation fault.
0x00000000 in ?? ()
The program being debugged was signaled while in a function called from GD=
B.
GDB remains in the frame where the signal was received.
To change this behavior use "set unwindonsignal on".
Evaluation of the expression containing the function
(malloc) will be abandoned.
When the function is done executing, GDB will silently stop.
(gdb)

Of course this patch does not fix gdb in such a way that
it handles the "set tp =3D { 5,3 }" correctly. That's a gdb issue.

The above log is from a 32bit-kernel. Did you maybe tested a 64bit kernel =
(I didn't tested it).
Or maybe you didn't booted a kernel with that patch?
I'm pretty sure the patch is correct.

Helge

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A6347E863
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Dec 2021 20:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350090AbhLWTdB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 Dec 2021 14:33:01 -0500
Received: from mout.gmx.net ([212.227.17.21]:41929 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350085AbhLWTdA (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 Dec 2021 14:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1640287968;
        bh=LaBd0SGYFYZrsxaiZZfIMCDeIhbZFTJ+Hy1ZTzZw1PE=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=a72S0SojQ03O9E2ZG4RXTPcW+tgwXYJebVrWMvewITOZWoKSowNJ81z9riC8lVboE
         ZH2xAo+Ghr/RVsx3mzB/cPjYwu3mf85oIAi+WAY6AoXPYgqZia4LPhJ0UCMJnjKfNM
         IwvuYmcwBvlbW6fGvgECQ9Gt84r14eg02X/oAQCM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.187.188]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1nFdqp0spD-00HQmf; Thu, 23
 Dec 2021 20:32:48 +0100
Message-ID: <6e4b0354-c3d9-ec11-4303-525e04c2d5d8@gmx.de>
Date:   Thu, 23 Dec 2021 20:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] parisc: Rewrite light-weight syscall and futex code
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YcScAR4cPgyI5B6d@mx3210.localdomain> <YcTEOhVnmT8kQRmf@ls3530>
 <888da884-86e0-e6f4-68c3-e3448eb4c9c8@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <888da884-86e0-e6f4-68c3-e3448eb4c9c8@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DeKkyjV8lvTRs0dmPDBOwL5m9qkf1DaamePlG4NKeospfry0xEO
 grb7MIqgut/STYc1aq76I2S+NU/HYS01JLGDGYjFhKS2oOjNwVe3npow+vfhEPEAGL04/U/
 PVpOtmxnTeEvbZyB4/X9Gq4wpSaq/xPdlJXjyTgktqvyM0JDCqqt4NDQjZQfaHkp4Ngzm3R
 alUxMP+/af3PY6E8/zjUA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1G4se1sfuTQ=:4R24ZQYARpnAxjh2Yz0f9t
 ElE0EFX6P691WA6YMU1J1FS4Zm40/IvR8wmPI4X1nS3YeNWP2K5oX+OLqT3psFiXff4/IXxlR
 mEiuONVbSr+eVweDPjdhYvE4ihoz1VWhHewg+2kw3yiBHIl4cRSDE0f9zJ9qEXK4Yf1C0xb16
 tATdUhvJCjplhkOyYwIJFcCHZHJ3+GdxIpCRjT6whZ/nQWUVgR4aqe/oKtjkHrSrguitJpMD2
 HmZ6XddWBEyNAl2/hI/tC1NPv57ym8yEjVfry3ixPuzuSGlouz/mmQ4+3Ztrkmibd5gA1MI5O
 2NgitJlSvlnYYeyxWDwY8Gb01goCjALEXhOUOb6vGjbipTNSw8Uu0jvLPuedxv0xJBAnxkQqV
 0hCLt8Zi2XyjD8tiUD+2gXnRfGmTE5M240vQ9ZkQLSSjsHbDq0J1mT2EREP34grjJJU0AyjS7
 ht3jHSe4oIrsN2t9Yld5V0y68+o57Ls8xAzEv+zJ3xaci4MbEtykGubFcm73BeBjTJwQ5aVm1
 impm8cOR2HwixWZ9WrobV0MyEijQAYFWIM+8C+ttTdbLjnFBfnJ46uoOBOGVv0nebytiEbRpe
 Nm05IMypVkSP2J57H56wS1jHG00EfkJyqcFEhek99yrkvIn0jVrdb1N7ZLRNAccb7f7uBveM0
 X4nIiZCAJO6+xv04HNXzxB+C8l4MUChSTRY2Ppbse/dYBYyMqKQNCqnKF1IyzLUUELdW/ySCG
 PssAdQLR93268HuRQZult7KZSrIuOazp8vdwrjQw0r0QblTiDSxYyE/ptfF2GVjlVtZ6zFajT
 49kxmUxSsVFQTcHLHnKgTIxaghcFqnULCxTFWUu9VUweDYI2rDkJpMUO9m7tXZnPpHKRFIhNr
 FSqe4Cx3KjAXnwrOUtWfDDW+SbjuuhTZeNqOfpfgUm8gpiA//F/yH6L4JTjhozmH2GtIuqGTG
 R431SArFEgk9QOlsxkt2kICS5f+nmOh+5SsQ2ScnM/+2Gc2/73+DLU7O1lU8m3nWOCpom15EQ
 rNY4dAwA88+v3YhxIKQqfOeA6ZnhbiNOg/3hnxoViCoKFqFguYsst5bwa29i1fcgS1Api1JwH
 6VcTIUnpLX6W4M=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/23/21 20:17, John David Anglin wrote:
> On 2021-12-23 1:47 p.m., Helge Deller wrote:
>> ...
>>> In order to do this, we need a mechanism to trigger COW breaks outside=
 the
>>> critical region. Fortunately, parisc has the "stbys,e" instruction. Wh=
en
>>> the leftmost byte of a word is addressed, this instruction triggers al=
l
>>> the exceptions of a normal store but it does not write to memory. Thus=
,
>>> we can use it to trigger COW breaks outside the critical region withou=
t
>>> modifying the data that is to be updated atomically.
>> ...
>>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm=
/futex.h
>>> index 9cd4dd6e63ad..8f97db995b04 100644
>>> --- a/arch/parisc/include/asm/futex.h
>>> +++ b/arch/parisc/include/asm/futex.h
>> ...
>>> +static inline bool _futex_force_interruptions(unsigned long ua)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 bool result;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\tldw 0(%1), %0\n"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2:\tstbys,e %%r0, 0(%1)\n=
"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "\tcomclr,=3D %%r0, %%r0, =
%0\n"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "3:\tldi 1, %0\n"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY(1=
b, 3b)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY(2=
b, 3b)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3D&r" (result) : "r" (=
ua) : "memory"
>>> +=C2=A0=C2=A0=C2=A0 );
>>> +=C2=A0=C2=A0=C2=A0 return result;
>> I wonder if we can get rid of the comclr,=3D instruction by using
>> ASM_EXCEPTIONTABLE_ENTRY_EFAULT instead of ASM_EXCEPTIONTABLE_ENTRY,
>> e.g.:
>>
>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/=
futex.h
>> index 8f97db995b04..ea052f013865 100644
>> --- a/arch/parisc/include/asm/futex.h
>> +++ b/arch/parisc/include/asm/futex.h
>> @@ -21,20 +21,21 @@ static inline unsigned long _futex_hash_index(unsig=
ned long ua)
>> =C2=A0=C2=A0 * if load and store fault.
>> =C2=A0=C2=A0 */
>>
>> -static inline bool _futex_force_interruptions(unsigned long ua)
>> +static inline unsigned long _futex_force_interruptions(unsigned long u=
a)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 bool result;
>> +=C2=A0=C2=A0=C2=A0 register unsigned long error __asm__ ("r8") =3D 0;
>> +=C2=A0=C2=A0=C2=A0 register unsigned long temp;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __asm__ __volatile__(
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\tldw 0(%1), %0\n"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2:\tstbys,e %%r0, 0(%1)\n"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "\tcomclr,=3D %%r0, %%r0, %=
0\n"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "3:\tldi 1, %0\n"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY(1b=
, 3b)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY(2b=
, 3b)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3D&r" (result) : "r" (u=
a) : "memory"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\tldw 0(%2), %0\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2:\tstbys,e %%r0, 0(%2)\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "3:\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY_EF=
AULT(1b, 3b)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY_EF=
AULT(2b, 3b)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (temp), "=3Dr" (er=
ror)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (ua), "1" (error) : "=
memory"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 );
>> -=C2=A0=C2=A0=C2=A0 return result;
>> +=C2=A0=C2=A0=C2=A0 return error;
>> =C2=A0 }
> I don't think this is a win.
>
> 1) Register %r8 needs to get loaded with 0. So, that's one instruction.

True. On the other hand you don't need the "ldi 1,%0" then, which brings p=
arity.

> 2) Register %r8 is a caller saves register. Using it will cause gcc to s=
ave and restore it from stack. This may
> cause a stack frame to be created when one isn't needed. The save and re=
store instructions are more
> expensive, particularly if they cause a TLB miss.

Because of this reason, wouln't it make sense to switch the uaccess functi=
ons away from r8 too,
and use another temp register in both?

> Note that the comclr both clears result and nullifies the following ldi =
instruction, so it is not executed in the fast path.

Yes, but when emulating with qemu, it generates comparism and jumps, while=
 the loading of r8 (see 1)), is trivial.

If we change the uaccess functions away from r8, then we can drop comclr (=
and save one instruction).

Helge

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3763F47E8A9
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Dec 2021 21:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350217AbhLWUPF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 Dec 2021 15:15:05 -0500
Received: from mta-mtl-002.bell.net ([209.71.208.12]:36810 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1350206AbhLWUPE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 Dec 2021 15:15:04 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61C4738C000E2DE9
X-CM-Envelope: MS4xfEn3H1/QJEKH93InFuPOY1rkJJJE+J4WIx2xPYifMQFtu00blBCWuXE/vpWJfWW6xyarH894t+2YImt44hjuFjqYseRSWMA4jlAEbgzzM5TublgCmJX4
 R3fQtB0nOPbE9dIyy9YvHjh3cKGKzTJKy/ZC49RBf4FdU5KLRcMDX5La18Zq6qVRmovC08PXpLOiIqwsF7XkRZTDYZU1HDvBgbZstGk4e5HNSWCXghpoU1fv
 XNw3IOomJpgBPot5vW7NFYrWnLhVcBzQxWnFtvaf9jiQVT+GftWGMvuvzaWbeF+WG8tFSYA4eZd9IQKBWZ8geM86L/SIH/PYt73NsHjGG5JeZlzYnhh8VxIK
 6fmvcKK3
X-CM-Analysis: v=2.4 cv=WtFIjfTv c=1 sm=1 tr=0 ts=61c4d8c2
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=Mhmc0_-a3bRNmrw_g5UA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61C4738C000E2DE9; Thu, 23 Dec 2021 15:14:58 -0500
Message-ID: <96a706a5-a2c0-68ae-2541-0ae7287e2aab@bell.net>
Date:   Thu, 23 Dec 2021 15:14:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2] parisc: Rewrite light-weight syscall and futex code
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YcScAR4cPgyI5B6d@mx3210.localdomain> <YcTEOhVnmT8kQRmf@ls3530>
 <888da884-86e0-e6f4-68c3-e3448eb4c9c8@bell.net>
 <6e4b0354-c3d9-ec11-4303-525e04c2d5d8@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <6e4b0354-c3d9-ec11-4303-525e04c2d5d8@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-23 2:31 p.m., Helge Deller wrote:
> On 12/23/21 20:17, John David Anglin wrote:
>> On 2021-12-23 1:47 p.m., Helge Deller wrote:
>>> ...
>>>> In order to do this, we need a mechanism to trigger COW breaks outside the
>>>> critical region. Fortunately, parisc has the "stbys,e" instruction. When
>>>> the leftmost byte of a word is addressed, this instruction triggers all
>>>> the exceptions of a normal store but it does not write to memory. Thus,
>>>> we can use it to trigger COW breaks outside the critical region without
>>>> modifying the data that is to be updated atomically.
>>> ...
>>>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
>>>> index 9cd4dd6e63ad..8f97db995b04 100644
>>>> --- a/arch/parisc/include/asm/futex.h
>>>> +++ b/arch/parisc/include/asm/futex.h
>>> ...
>>>> +static inline bool _futex_force_interruptions(unsigned long ua)
>>>> +{
>>>> +    bool result;
>>>> +
>>>> +    __asm__ __volatile__(
>>>> +        "1:\tldw 0(%1), %0\n"
>>>> +        "2:\tstbys,e %%r0, 0(%1)\n"
>>>> +        "\tcomclr,= %%r0, %%r0, %0\n"
>>>> +        "3:\tldi 1, %0\n"
>>>> +        ASM_EXCEPTIONTABLE_ENTRY(1b, 3b)
>>>> +        ASM_EXCEPTIONTABLE_ENTRY(2b, 3b)
>>>> +        : "=&r" (result) : "r" (ua) : "memory"
>>>> +    );
>>>> +    return result;
>>> I wonder if we can get rid of the comclr,= instruction by using
>>> ASM_EXCEPTIONTABLE_ENTRY_EFAULT instead of ASM_EXCEPTIONTABLE_ENTRY,
>>> e.g.:
>>>
>>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
>>> index 8f97db995b04..ea052f013865 100644
>>> --- a/arch/parisc/include/asm/futex.h
>>> +++ b/arch/parisc/include/asm/futex.h
>>> @@ -21,20 +21,21 @@ static inline unsigned long _futex_hash_index(unsigned long ua)
>>>     * if load and store fault.
>>>     */
>>>
>>> -static inline bool _futex_force_interruptions(unsigned long ua)
>>> +static inline unsigned long _futex_force_interruptions(unsigned long ua)
>>>    {
>>> -    bool result;
>>> +    register unsigned long error __asm__ ("r8") = 0;
>>> +    register unsigned long temp;
>>>
>>>        __asm__ __volatile__(
>>> -        "1:\tldw 0(%1), %0\n"
>>> -        "2:\tstbys,e %%r0, 0(%1)\n"
>>> -        "\tcomclr,= %%r0, %%r0, %0\n"
>>> -        "3:\tldi 1, %0\n"
>>> -        ASM_EXCEPTIONTABLE_ENTRY(1b, 3b)
>>> -        ASM_EXCEPTIONTABLE_ENTRY(2b, 3b)
>>> -        : "=&r" (result) : "r" (ua) : "memory"
>>> +        "1:\tldw 0(%2), %0\n"
>>> +        "2:\tstbys,e %%r0, 0(%2)\n"
>>> +        "3:\n"
>>> +        ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
>>> +        ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
>>> +        : "=r" (temp), "=r" (error)
>>> +        : "r" (ua), "1" (error) : "memory"
>>>        );
>>> -    return result;
>>> +    return error;
>>>    }
>> I don't think this is a win.
>>
>> 1) Register %r8 needs to get loaded with 0. So, that's one instruction.
> True. On the other hand you don't need the "ldi 1,%0" then, which brings parity.
>
>> 2) Register %r8 is a caller saves register. Using it will cause gcc to save and restore it from stack. This may
>> cause a stack frame to be created when one isn't needed. The save and restore instructions are more
>> expensive, particularly if they cause a TLB miss.
> Because of this reason, wouln't it make sense to switch the uaccess functions away from r8 too,
> and use another temp register in both?
Yes. I think it would be best to use %r28.  Then, error will be in correct register for return.

The variables temp and error can combined.
>
>> Note that the comclr both clears result and nullifies the following ldi instruction, so it is not executed in the fast path.
> Yes, but when emulating with qemu, it generates comparism and jumps, while the loading of r8 (see 1)), is trivial.
In this case, the comparison is always true. Does qemu detect that?

The comclr is equivalent to setting target register to 0 and a branch to .+8.
>
> If we change the uaccess functions away from r8, then we can drop comclr (and save one instruction).
If we can use %r28, we should be able to save one instruction.

It's slightly less work for me if you change the uaccess and update the asm at the same time.

Dave

-- 
John David Anglin  dave.anglin@bell.net


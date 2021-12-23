Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62AE47E91F
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Dec 2021 22:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350345AbhLWVg7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 Dec 2021 16:36:59 -0500
Received: from mta-mtl-001.bell.net ([209.71.208.11]:21108 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhLWVg7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 Dec 2021 16:36:59 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61C4738C0010B017
X-CM-Envelope: MS4xfCExAe8KvnLmo2CDltF3z9ETe2L/cuSA2y8mRbVnFQtsRnBn3CEiv6lcMoB4OtkoP459gbnno4U8fLYW4I2IiZ42xUjGuOWzM3hc11CEhzT534z/lpoG
 npVW1k35XR+AQLTB/cObT6vLNADXAlSk3YjrH7NjFdULby8QueZdbDryVRHMNqpqY1pRuETOFzlxy5sQA+SzLqSgJdmO2rlFZmWjlva+NoMXfB4O9T4bw9No
 m0sHzE1SwBoD9spyOO29CdTDXXSEHfos+GDMC3xh3+WYtIXO1B3O5d2evd6HoJKzpTrhC1a2p1leHYKOB63eup02xIoLqvJW2faFCdVyeaL6pBXu7F0JKm1k
 38NA+xjz
X-CM-Analysis: v=2.4 cv=WtFIjfTv c=1 sm=1 tr=0 ts=61c4ebf5
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=v17hkjLcYgvNgLkcyGQA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61C4738C0010B017; Thu, 23 Dec 2021 16:36:53 -0500
Message-ID: <4c4608c7-0c24-9bf7-02f1-27acad108aaf@bell.net>
Date:   Thu, 23 Dec 2021 16:36:53 -0500
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
 <96a706a5-a2c0-68ae-2541-0ae7287e2aab@bell.net>
 <b2a05978-9ec9-5bfb-8df3-746b3321cb71@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <b2a05978-9ec9-5bfb-8df3-746b3321cb71@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-23 4:13 p.m., Helge Deller wrote:
> On 12/23/21 21:14, John David Anglin wrote:
>> On 2021-12-23 2:31 p.m., Helge Deller wrote:
>>> On 12/23/21 20:17, John David Anglin wrote:
>>>> On 2021-12-23 1:47 p.m., Helge Deller wrote:
>>>>> ...
>>>>>> In order to do this, we need a mechanism to trigger COW breaks outside the
>>>>>> critical region. Fortunately, parisc has the "stbys,e" instruction. When
>>>>>> the leftmost byte of a word is addressed, this instruction triggers all
>>>>>> the exceptions of a normal store but it does not write to memory. Thus,
>>>>>> we can use it to trigger COW breaks outside the critical region without
>>>>>> modifying the data that is to be updated atomically.
>>>>> ...
>>>>>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
>>>>>> index 9cd4dd6e63ad..8f97db995b04 100644
>>>>>> --- a/arch/parisc/include/asm/futex.h
>>>>>> +++ b/arch/parisc/include/asm/futex.h
>>>>> ...
>>>>>> +static inline bool _futex_force_interruptions(unsigned long ua)
>>>>>> +{
>>>>>> +    bool result;
>>>>>> +
>>>>>> +    __asm__ __volatile__(
>>>>>> +        "1:\tldw 0(%1), %0\n"
>>>>>> +        "2:\tstbys,e %%r0, 0(%1)\n"
>>>>>> +        "\tcomclr,= %%r0, %%r0, %0\n"
>>>>>> +        "3:\tldi 1, %0\n"
>>>>>> +        ASM_EXCEPTIONTABLE_ENTRY(1b, 3b)
>>>>>> +        ASM_EXCEPTIONTABLE_ENTRY(2b, 3b)
>>>>>> +        : "=&r" (result) : "r" (ua) : "memory"
>>>>>> +    );
>>>>>> +    return result;
>>>>> I wonder if we can get rid of the comclr,= instruction by using
>>>>> ASM_EXCEPTIONTABLE_ENTRY_EFAULT instead of ASM_EXCEPTIONTABLE_ENTRY,
>>>>> e.g.:
>>>>>
>>>>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
>>>>> index 8f97db995b04..ea052f013865 100644
>>>>> --- a/arch/parisc/include/asm/futex.h
>>>>> +++ b/arch/parisc/include/asm/futex.h
>>>>> @@ -21,20 +21,21 @@ static inline unsigned long _futex_hash_index(unsigned long ua)
>>>>>      * if load and store fault.
>>>>>      */
>>>>>
>>>>> -static inline bool _futex_force_interruptions(unsigned long ua)
>>>>> +static inline unsigned long _futex_force_interruptions(unsigned long ua)
>>>>>     {
>>>>> -    bool result;
>>>>> +    register unsigned long error __asm__ ("r8") = 0;
>>>>> +    register unsigned long temp;
>>>>>
>>>>>         __asm__ __volatile__(
>>>>> -        "1:\tldw 0(%1), %0\n"
>>>>> -        "2:\tstbys,e %%r0, 0(%1)\n"
>>>>> -        "\tcomclr,= %%r0, %%r0, %0\n"
>>>>> -        "3:\tldi 1, %0\n"
>>>>> -        ASM_EXCEPTIONTABLE_ENTRY(1b, 3b)
>>>>> -        ASM_EXCEPTIONTABLE_ENTRY(2b, 3b)
>>>>> -        : "=&r" (result) : "r" (ua) : "memory"
>>>>> +        "1:\tldw 0(%2), %0\n"
>>>>> +        "2:\tstbys,e %%r0, 0(%2)\n"
>>>>> +        "3:\n"
>>>>> +        ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
>>>>> +        ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
>>>>> +        : "=r" (temp), "=r" (error)
>>>>> +        : "r" (ua), "1" (error) : "memory"
>>>>>         );
>>>>> -    return result;
>>>>> +    return error;
>>>>>     }
>>>> I don't think this is a win.
>>>>
>>>> 1) Register %r8 needs to get loaded with 0. So, that's one instruction.
>>> True. On the other hand you don't need the "ldi 1,%0" then, which brings parity.
>>>
>>>> 2) Register %r8 is a caller saves register. Using it will cause gcc to save and restore it from stack. This may
>>>> cause a stack frame to be created when one isn't needed. The save and restore instructions are more
>>>> expensive, particularly if they cause a TLB miss.
>>> Because of this reason, wouln't it make sense to switch the uaccess functions away from r8 too,
>>> and use another temp register in both?
>> Yes. I think it would be best to use %r28.  Then, error will be in correct register for return.
> r29 seems to generate smaller code than r28, so I choosed r29.
Okay.  Maybe it won't matter in an inline function.
>
>> The variables temp and error can combined.
> Then I need the copy %r0,%error in asm code.
> It's no option to use ldw with target register %r0 ?
Correct. It's a cache prefetch instruction and doesn't trigger exceptions.

I'm rewriting routine.

Dave

-- 
John David Anglin  dave.anglin@bell.net


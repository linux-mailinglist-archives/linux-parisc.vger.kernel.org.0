Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2D447E838
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Dec 2021 20:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350049AbhLWTRb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 Dec 2021 14:17:31 -0500
Received: from mta-tor-004.bell.net ([209.71.212.31]:39922 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1349936AbhLWTR1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 Dec 2021 14:17:27 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61C4B1FB00028721
X-CM-Envelope: MS4xfLz5VSbtYwPmwlaWdoBKoJiyX9fPZWcyMCgNF7HYWDBDJKIM6ly4f7RzdW29/Jx90kCvwwM0hjt7zAmqu7ASSVAWKmkFxIhRFWGWBuUC2JaC5sb7qA9d
 AcclHS56mJZUfoBDEqpG0SwfAUU1zm6S/o6gfV7/Q7GZz9wGSVTGOuF8a8Ugtwe+K6OjrimtoqhMzW8los/I7HooGImVKN7ZxT2kpC4G7XebkPGwiW8b5u52
 8ovo9gJXDcWmDA0NWRaV7WDM8A1s7iVu1CSe8xs87uZyU+ZWHXs8X+fiU93kTvfKYuXcU9A3g/P16huSMeUXm2PYuT76zkQuoBeaMGClVw9T2A26MtACvGho
 3W+TyZZz
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61c4cb42
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=mk0iugPOH15yq79Re1AA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61C4B1FB00028721; Thu, 23 Dec 2021 14:17:22 -0500
Message-ID: <888da884-86e0-e6f4-68c3-e3448eb4c9c8@bell.net>
Date:   Thu, 23 Dec 2021 14:17:23 -0500
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
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <YcTEOhVnmT8kQRmf@ls3530>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-23 1:47 p.m., Helge Deller wrote:
> ...
>> In order to do this, we need a mechanism to trigger COW breaks outside the
>> critical region. Fortunately, parisc has the "stbys,e" instruction. When
>> the leftmost byte of a word is addressed, this instruction triggers all
>> the exceptions of a normal store but it does not write to memory. Thus,
>> we can use it to trigger COW breaks outside the critical region without
>> modifying the data that is to be updated atomically.
> ...
>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
>> index 9cd4dd6e63ad..8f97db995b04 100644
>> --- a/arch/parisc/include/asm/futex.h
>> +++ b/arch/parisc/include/asm/futex.h
> ...
>> +static inline bool _futex_force_interruptions(unsigned long ua)
>> +{
>> +	bool result;
>> +
>> +	__asm__ __volatile__(
>> +		"1:\tldw 0(%1), %0\n"
>> +		"2:\tstbys,e %%r0, 0(%1)\n"
>> +		"\tcomclr,= %%r0, %%r0, %0\n"
>> +		"3:\tldi 1, %0\n"
>> +		ASM_EXCEPTIONTABLE_ENTRY(1b, 3b)
>> +		ASM_EXCEPTIONTABLE_ENTRY(2b, 3b)
>> +		: "=&r" (result) : "r" (ua) : "memory"
>> +	);
>> +	return result;
> I wonder if we can get rid of the comclr,= instruction by using
> ASM_EXCEPTIONTABLE_ENTRY_EFAULT instead of ASM_EXCEPTIONTABLE_ENTRY,
> e.g.:
>
> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
> index 8f97db995b04..ea052f013865 100644
> --- a/arch/parisc/include/asm/futex.h
> +++ b/arch/parisc/include/asm/futex.h
> @@ -21,20 +21,21 @@ static inline unsigned long _futex_hash_index(unsigned long ua)
>    * if load and store fault.
>    */
>
> -static inline bool _futex_force_interruptions(unsigned long ua)
> +static inline unsigned long _futex_force_interruptions(unsigned long ua)
>   {
> -	bool result;
> +	register unsigned long error __asm__ ("r8") = 0;
> +	register unsigned long temp;
>
>   	__asm__ __volatile__(
> -		"1:\tldw 0(%1), %0\n"
> -		"2:\tstbys,e %%r0, 0(%1)\n"
> -		"\tcomclr,= %%r0, %%r0, %0\n"
> -		"3:\tldi 1, %0\n"
> -		ASM_EXCEPTIONTABLE_ENTRY(1b, 3b)
> -		ASM_EXCEPTIONTABLE_ENTRY(2b, 3b)
> -		: "=&r" (result) : "r" (ua) : "memory"
> +		"1:\tldw 0(%2), %0\n"
> +		"2:\tstbys,e %%r0, 0(%2)\n"
> +		"3:\n"
> +		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 3b)
> +		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 3b)
> +		: "=r" (temp), "=r" (error)
> +		: "r" (ua), "1" (error) : "memory"
>   	);
> -	return result;
> +	return error;
>   }
I don't think this is a win.

1) Register %r8 needs to get loaded with 0. So, that's one instruction.
2) Register %r8 is a caller saves register. Using it will cause gcc to save and restore it from stack. This may
cause a stack frame to be created when one isn't needed. The save and restore instructions are more
expensive, particularly if they cause a TLB miss.

Note that the comclr both clears result and nullifies the following ldi instruction, so it is not executed in the fast path.

Dave

-- 
John David Anglin  dave.anglin@bell.net


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 849265ED006
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Sep 2022 00:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiI0WGY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 27 Sep 2022 18:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbiI0WGL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 27 Sep 2022 18:06:11 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52EFDE21CA
        for <linux-parisc@vger.kernel.org>; Tue, 27 Sep 2022 15:06:09 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [174.95.58.43]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6324753405404B69
X-CM-Envelope: MS4xfBG6W36LMJNqNJ3eqhVZXw/UrcRDUUHsfH6mq/3jhQ/atM7c3L0o2a/HoZ6FQPq9ASKFSmO707z9NdFMuvFpdnQacB7zL816G5wFeUPxrHOyfLxHwyi9
 RF4NXjenKybZl/sZ1Tv+70WgyL0+UJtTDpZABrskcSW/TPgBwYa3fD+4MrmnzYXxl98aztuX1TII+gJ4+D9fKHbUlyLn8rgZfnIOG4vn5h46jL1J6p5Td7ht
 +zhZkVi8JN1kZyd7ZBqgGV8Q9F+jZaHsh0Fh69r8pS3l1v0bly5HWcc9BW2IDysrVxE7u/QGBqaPda7SpvT1c0dWO6h2xtq3JfI9cl9EwNo=
X-CM-Analysis: v=2.4 cv=FMx4e8ks c=1 sm=1 tr=0 ts=633373cc
 a=oiJDitmlNOPgVxj52MZyFw==:117 a=oiJDitmlNOPgVxj52MZyFw==:17
 a=IkcTkHD0fZMA:10 a=5ypQrAzGAAAA:8 a=FBHGMhGWAAAA:8 a=kXxo67owlVFqgddlTvwA:9
 a=QEXdDO2ut3YA:10 a=2h1NDdV7_TUA:10 a=6z8RqSp6YwMA:10
 a=QnlTcYk_iZbCEFXf-YqT:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (174.95.58.43) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6324753405404B69; Tue, 27 Sep 2022 18:06:04 -0400
Message-ID: <8a3451ca-cd30-4730-b7b2-bce7fdc47682@bell.net>
Date:   Tue, 27 Sep 2022 18:06:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on PA2.0 machines
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YzCkkyktEZFM0svQ@p100>
 <1063fc54-738a-a1b9-fb53-8202287805c7@bell.net>
 <1de28183-2252-04dc-9838-d695161a01ed@gmx.de>
 <5f476a72-d2c0-8b0e-2446-13456a92e0bf@bell.net>
 <efb7b1fa-f593-3c52-c8b2-cd42c2594848@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <efb7b1fa-f593-3c52-c8b2-cd42c2594848@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-09-27 4:06 p.m., Helge Deller wrote:
> On 9/25/22 22:28, John David Anglin wrote:
>> On 2022-09-25 4:11 p.m., Helge Deller wrote:
>>> n 9/25/22 22:02, John David Anglin wrote:
>>>> On 2022-09-25 2:57 p.m., Helge Deller wrote:
>>>>> +#ifdef CONFIG_PA20
>>>>> +#define ALT_COND_PACACHE    ALT_COND_ALWAYS
>>>>> +#else
>>>>> +#define ALT_COND_PACACHE    ALT_COND_NO_SMP
>>>>> +#endif
>>>>> +
>>>>>   ENTRY_CFI(flush_tlb_all_local)
>>>>>       /*
>>>>>        * The pitlbe and pdtlbe instructions should only be used to
>>>>> @@ -539,15 +545,10 @@ ENTRY_CFI(copy_user_page_asm)
>>>>>
>>>>>       /* Purge any old translations */
>>>>>
>>>>> -#ifdef CONFIG_PA20
>>>>> -    pdtlb,l        %r0(%r28)
>>>>> -    pdtlb,l        %r0(%r29)
>>>>> -#else
>>>>>   0:    pdtlb        %r0(%r28)
>>>>>   1:    pdtlb        %r0(%r29)
>>>>> -    ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
>>>>> -    ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
>>>>> -#endif
>>>>> +    ALTERNATIVE(0b, 0b+4, ALT_COND_PACACHE, INSN_PxTLB)
>>>>> +    ALTERNATIVE(1b, 1b+4, ALT_COND_PACACHE, INSN_PxTLB)
>>>> This doesn't look correct.  If ALT_COND_PACACHE is defined as ALT_COND_NO_SMP, the pdtlb
>>>> instructions will be converted to pdtlb,l instructions when running UP.  These are not supported
>>>> on PA 1.1.
>>>
>>> Your concern is correct, but there is an additonal check in the alternative-coding,
>>> which prevents enabling the local flag if we're not running on a PA2.0 CPU.
>>> So, those ALTERNATIVE() macros will only apply on PA2.0 machines.
>> You are correct.  Missed that.
>>
>> That only leaves the bus serialization issue when pdtlb is used on an SMP machine.
>
> I think we are Ok with what's in the kernel already.
>
> According to arch/parisc/include/asm/pgtable.h:
>
> * This is for the serialization of PxTLB broadcasts. At least on the N class
>  * systems, only one PxTLB inter processor broadcast can be active at any one
>  * time on the Merced bus. */
> extern spinlock_t pa_tlb_flush_lock;
> #if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
> extern int pa_serialize_tlb_flushes;
> #else
> #define pa_serialize_tlb_flushes        (0)
> #endif
>
> we currently do TLB serialization on 64-bit machines with a 64-bit kernel only.
> N-class machines are 64-bit-only machines which can't run a 32-bit kernel.
> So, 32-bit SMP kernels (which don't have serialization for PxTLB flushes)
> don't seem to be affected.
I don't know enough to be certain. I know the c8000/rp3440 with the Itanium/zx1 CPU/memory
bus needs serialization (tried removing lock).  I suspect all machines with Runway or Runway+
CPU/memory buses need serialization.

https://www.openpa.net/bus.html#runway

The openpa site says there are some PA-7200 machines (e.g., D class)  with this bus.  They would be 32-bit only.

Dave

-- 
John David Anglin  dave.anglin@bell.net


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F6B5E95E0
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 22:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiIYU3G (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 16:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbiIYU3F (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 16:29:05 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120002AE0E
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 13:29:03 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [174.95.58.43]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 631B5D65072EAC6C
X-CM-Envelope: MS4xfG8zscKe3MpWMj/5SsGcL6Qvwp3jukrf1ZvMiZ7B++a8DxXluDhd1NpJPG7dS5zYrq/L6PGi63bRGEn/oCvtLRHrnJdkfXfu4BCwifOF2pmaAKPlXUhi
 u4OY4zmFhfqmqk01ml+AhaKhO9A94GO3bHNilqN1q0gWu0Bey1KraJPM4EPMUEHh0Z3d+3VPNO27zIOQzA7yM9n33RDOyW7oflbU+zuyA69lAdCSySvmXJqT
 kPKS3wjWMM1teFy6fsmyyuzYpbqLsXH8sxrSLej8Ee1VpVY1NnwnfH133B6ZfogQvStHcf8pATT4GgGrGf72q6SkZBwl/tz8ZGiyiwfVIk8=
X-CM-Analysis: v=2.4 cv=XfXqcK15 c=1 sm=1 tr=0 ts=6330ba0b
 a=oiJDitmlNOPgVxj52MZyFw==:117 a=oiJDitmlNOPgVxj52MZyFw==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=5Hw1sYS-p05lIvgEgiQA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (174.95.58.43) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 631B5D65072EAC6C; Sun, 25 Sep 2022 16:28:59 -0400
Message-ID: <5f476a72-d2c0-8b0e-2446-13456a92e0bf@bell.net>
Date:   Sun, 25 Sep 2022 16:28:59 -0400
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
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <1de28183-2252-04dc-9838-d695161a01ed@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-09-25 4:11 p.m., Helge Deller wrote:
> n 9/25/22 22:02, John David Anglin wrote:
>> On 2022-09-25 2:57 p.m., Helge Deller wrote:
>>> +#ifdef CONFIG_PA20
>>> +#define ALT_COND_PACACHE    ALT_COND_ALWAYS
>>> +#else
>>> +#define ALT_COND_PACACHE    ALT_COND_NO_SMP
>>> +#endif
>>> +
>>>   ENTRY_CFI(flush_tlb_all_local)
>>>       /*
>>>        * The pitlbe and pdtlbe instructions should only be used to
>>> @@ -539,15 +545,10 @@ ENTRY_CFI(copy_user_page_asm)
>>>
>>>       /* Purge any old translations */
>>>
>>> -#ifdef CONFIG_PA20
>>> -    pdtlb,l        %r0(%r28)
>>> -    pdtlb,l        %r0(%r29)
>>> -#else
>>>   0:    pdtlb        %r0(%r28)
>>>   1:    pdtlb        %r0(%r29)
>>> -    ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
>>> -    ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
>>> -#endif
>>> +    ALTERNATIVE(0b, 0b+4, ALT_COND_PACACHE, INSN_PxTLB)
>>> +    ALTERNATIVE(1b, 1b+4, ALT_COND_PACACHE, INSN_PxTLB)
>> This doesn't look correct.  If ALT_COND_PACACHE is defined as ALT_COND_NO_SMP, the pdtlb
>> instructions will be converted to pdtlb,l instructions when running UP.  These are not supported
>> on PA 1.1. 
>
> Your concern is correct, but there is an additonal check in the alternative-coding,
> which prevents enabling the local flag if we're not running on a PA2.0 CPU.
> So, those ALTERNATIVE() macros will only apply on PA2.0 machines.
You are correct.  Missed that.

That only leaves the bus serialization issue when pdtlb is used on an SMP machine.

Dave


-- 
John David Anglin  dave.anglin@bell.net


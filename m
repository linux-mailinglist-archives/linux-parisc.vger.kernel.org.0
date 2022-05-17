Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09A7B52A3AC
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 15:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347234AbiEQNlz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 09:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348155AbiEQNlf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 09:41:35 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-001.bell.net [209.71.212.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3E98118B22
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 06:41:34 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 627B9E56015FCB78
X-CM-Envelope: MS4xfEkQgc75J6GIis+cu3UwbJARDsx/G5prEbsBtoeoGgC5g7Hrj1x/6whUjCLunncx8tWELjGQ0b9dv6GqHwDwAjmQ6WKgSMWK44cAeMFgCakXMk5KQBrJ
 WfrqXO6KJjW4Wr5mNsM4vD/JCOtZoUXgQYqPeHYwzKJpLo2vDr3rV7bg+LtkqpNdTKK/YbXn1ls34cDt/r+j8pK3C8hn0W8yZ7wFjEW893STuFhjR9vAgJJp
 1CZjyhFfVoaYXUT/nnorYEFxTSzUgr161Yltid65a93q9/rH8Y9Z/OPnQ4ccH9+ETN14zyJmpasdryd6TTJES300DdnfXxlvhP+NkfrQJJw=
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=6283a607
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=5fyHUA8dbzpiwuH450sA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 627B9E56015FCB78; Tue, 17 May 2022 09:41:27 -0400
Message-ID: <a014d535-74de-1550-749c-9f3b268d4cfc@bell.net>
Date:   Tue, 17 May 2022 09:41:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] parisc: Prevent using same register as soure and target
 in extru/shr
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YoOZy3A3R0i0DUWB@p100>
 <8b5c308a-f3ea-e07f-053a-ad086ce75c43@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <8b5c308a-f3ea-e07f-053a-ad086ce75c43@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I'm not aware of any PA-RISC instructions where the source and target registers can't be the same.

In gcc asm statements, there are early clobber situations where the source and target can't be the same.
The same situation could occur in assembler macros but never when there's a single instruction.

The only thing unusual about the extru instruction is the most significant 32 bits in the target are undefined
on PA 2.0.  Thus, its use needs to be limited to 32-bit extracts.

Dave

On 2022-05-17 8:54 a.m., Helge Deller wrote:
> On 5/17/22 14:49, Helge Deller wrote:
>> In 2004 Randolph added the shr() assembly macro and noted that the
>> source and target register could not be the same.
>>
>> I did not find any confindence in the docs for this restriction. Maybe
>> it's related that on PA2.0 the upper bits may be clobbered?
> Looking at the generated kernel code from C-files, I'll find all over usages of
> 	extru source, x,y,  target
> where source and target are the same register.
> So, at least for 32-bit this restriction can't be true.
>
> Any ideas why this restriction could have been added to the comments?
>
> Helge
>
>
>> Anyway, add a compile-time check for it now.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
>> index ea0cb318b13d..ca1a12ae5ee7 100644
>> --- a/arch/parisc/include/asm/assembly.h
>> +++ b/arch/parisc/include/asm/assembly.h
>> @@ -146,6 +146,9 @@
>>   	/* Shift Right - note the r and t can NOT be the same! */
>>   	.macro shr r, sa, t
>>   	extru \r, 31-(\sa), 32-(\sa), \t
>> +.ifc \r,\t
>> +        .error "Can not used the same register (\r) in shr/extru as source and target register."
>> +.endif
>>   	.endm
>>
>>   	/* pa20w version of shift right */


-- 
John David Anglin  dave.anglin@bell.net


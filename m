Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5DA7A6B9A
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Sep 2023 21:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbjISTgv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 Sep 2023 15:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbjISTgv (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Sep 2023 15:36:51 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-002.bell.net [209.71.212.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52368F
        for <linux-parisc@vger.kernel.org>; Tue, 19 Sep 2023 12:36:44 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.126.114.79]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6509D2C3000304D9
X-CM-Envelope: MS4xfGOhvxEGNcBUDMctjCRqh2rbGT+7cwm8ta+qpkzhThrgzboNVzV5BkRIF5CMpIev+M/U3x14OZ1Ykt4hg+x1RdwajN24WsGcJT2HdyZRv1QEEkXguofb
 LaITWul8kLEI964ddvwt9kB83tAdEgILP9OazrKYcYsFhxcV07PR36wbfbrcfPhansfsPypuMmeBeI6nClUlyhTLxJMH7GPwAHPph50Hae6VsSkHtINbbDEl
 SW9EpSu9pOw7VgLESyAZdT+VmyTeR3Ltt5+UuAbJztCg+J5XI+HeW9J92f5fY+jShKslwHr5YHuNGy1LZQ0ItTnV7BtN4cipUxBCVzWWgvKQeeWotAr6hWAE
 xtjd1S4bCophSOt0W6BJOmIK54idhGCTkJPba4Rleyhux3HnLXM=
X-CM-Analysis: v=2.4 cv=GskhRm5C c=1 sm=1 tr=0 ts=6509f841
 a=qwLmA0wx3TwW38sY+xTbUA==:117 a=qwLmA0wx3TwW38sY+xTbUA==:17
 a=IkcTkHD0fZMA:10 a=_A5TAQVKAAAA:8 a=VwQbUJbxAAAA:8 a=vg-a-5mzAAAA:8
 a=FBHGMhGWAAAA:8 a=cH6R9-kdAAAA:8 a=8OvpA6w1uWgLcGLOLTUA:9 a=QEXdDO2ut3YA:10
 a=ypw9U9_ytwuNp2HAL0_X:22 a=AjGcO6oz07-iQ99wixmX:22 a=fQgEH6BUdnrCkX97fouT:22
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (142.126.114.79) by cmx-torrgo002.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 6509D2C3000304D9; Tue, 19 Sep 2023 15:36:33 -0400
Message-ID: <6b332788-2227-127f-ba6d-55e99ecf4ed8@bell.net>
Date:   Tue, 19 Sep 2023 15:36:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] parisc: Restore __ldcw_align for PA-RISC 2.0 processors
Content-Language: en-US
To:     Sam James <sam@gentoo.org>,
        John David Anglin <dave@parisc-linux.org>
Cc:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <ZQnfrGKvvIs0KLvf@mx3210.localdomain> <87il863tg9.fsf@gentoo.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <87il863tg9.fsf@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-09-19 2:31 p.m., Sam James wrote:
> John David Anglin <dave@parisc-linux.org> writes:
>
>> [[PGP Signed Part:Undecided]]
>> Back in 2005, Kyle McMartin removed the 16-byte alignment for ldcw
>> semaphores on PA 2.0 machines (CONFIG_PA20). This broke spinlocks
>> on pre PA8800 processors. The main symptom was random faults in
>> mmap'd memory (e.g., gcc compilations, etc).
>>
>> Unfortunately, the errata for this ldcw change is lost.
>>
>> The issue is the 16-byte alignment required for ldcw semaphore
>> instructions can only reduced to natural alignment when the ldcw
>> operation can be handled coherently in cache. Only PA8800 and
>> PA8900 processors actually support doing the operation in cache.
>>
>> Aligning the spinlock dynamically adds two integer instructions
>> to each spinlock.
>>
>> Tested on rp3440, c8000 and a500.
> Could you include a 'Fixes: <whatever the ancient commit hash is>'?
I looked but Kyle's commit predates git.  It was done to a cvs archive that I don't have.

It's available in the mail archive here:
https://lore.kernel.org/linux-parisc/20050609050702.GB4641@roadwarrior.mcmartin.ca/
>
> Also, what a find!
>
>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>> ---
>>
>> diff --git a/arch/parisc/include/asm/ldcw.h b/arch/parisc/include/asm/ldcw.h
>> index 6d28b5514699..ee9e071859b2 100644
>> --- a/arch/parisc/include/asm/ldcw.h
>> +++ b/arch/parisc/include/asm/ldcw.h
>> @@ -2,39 +2,42 @@
>>   #ifndef __PARISC_LDCW_H
>>   #define __PARISC_LDCW_H
>>   
>> -#ifndef CONFIG_PA20
>>   /* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
>>      and GCC only guarantees 8-byte alignment for stack locals, we can't
>>      be assured of 16-byte alignment for atomic lock data even if we
>>      specify "__attribute ((aligned(16)))" in the type declaration.  So,
>>      we use a struct containing an array of four ints for the atomic lock
>>      type and dynamically select the 16-byte aligned int from the array
>> -   for the semaphore.  */
>> +   for the semaphore. */
>> +
>> +/* From: "Jim Hull" <jim.hull of hp.com>
>> +   I've attached a summary of the change, but basically, for PA 2.0, as
>> +   long as the ",CO" (coherent operation) completer is implemented, then the
>> +   16-byte alignment requirement for ldcw and ldcd is relaxed, and instead
>> +   they only require "natural" alignment (4-byte for ldcw, 8-byte for
>> +   ldcd).
>> +
>> +   Although the cache control hint is accepted by all PA 2.0 processors,
>> +   it is only implemented on PA8800/PA8900 CPUs. Prior PA8X00 CPUs still
>> +   require 16-byte alignment. If the address is unaligned, the operation
>> +   of the instruction is undefined. The ldcw instruction does not generate
>> +   unaligned data reference traps so misaligned accesses are not detected.
>> +   This hid the problem for years. So, restore the 16-byte alignment dropped
>> +   by Kyle McMartin in "Remove __ldcw_align for PA-RISC 2.0 processors". */
>>   
>>   #define __PA_LDCW_ALIGNMENT	16
>> -#define __PA_LDCW_ALIGN_ORDER	4
>>   #define __ldcw_align(a) ({					\
>>   	unsigned long __ret = (unsigned long) &(a)->lock[0];	\
>>   	__ret = (__ret + __PA_LDCW_ALIGNMENT - 1)		\
>>   		& ~(__PA_LDCW_ALIGNMENT - 1);			\
>>   	(volatile unsigned int *) __ret;			\
>>   })
>> -#define __LDCW	"ldcw"
>>   
>> -#else /*CONFIG_PA20*/
>> -/* From: "Jim Hull" <jim.hull of hp.com>
>> -   I've attached a summary of the change, but basically, for PA 2.0, as
>> -   long as the ",CO" (coherent operation) completer is specified, then the
>> -   16-byte alignment requirement for ldcw and ldcd is relaxed, and instead
>> -   they only require "natural" alignment (4-byte for ldcw, 8-byte for
>> -   ldcd). */
>> -
>> -#define __PA_LDCW_ALIGNMENT	4
>> -#define __PA_LDCW_ALIGN_ORDER	2
>> -#define __ldcw_align(a) (&(a)->slock)
>> +#ifdef CONFIG_PA20
>>   #define __LDCW	"ldcw,co"
>> -
>> -#endif /*!CONFIG_PA20*/
>> +#else
>> +#define __LDCW	"ldcw"
>> +#endif
>>   
>>   /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.
>>      We don't explicitly expose that "*a" may be written as reload
>> diff --git a/arch/parisc/include/asm/spinlock_types.h b/arch/parisc/include/asm/spinlock_types.h
>> index efd06a897c6a..7b986b09dba8 100644
>> --- a/arch/parisc/include/asm/spinlock_types.h
>> +++ b/arch/parisc/include/asm/spinlock_types.h
>> @@ -9,15 +9,10 @@
>>   #ifndef __ASSEMBLY__
>>   
>>   typedef struct {
>> -#ifdef CONFIG_PA20
>> -	volatile unsigned int slock;
>> -# define __ARCH_SPIN_LOCK_UNLOCKED { __ARCH_SPIN_LOCK_UNLOCKED_VAL }
>> -#else
>>   	volatile unsigned int lock[4];
>>   # define __ARCH_SPIN_LOCK_UNLOCKED	\
>>   	{ { __ARCH_SPIN_LOCK_UNLOCKED_VAL, __ARCH_SPIN_LOCK_UNLOCKED_VAL, \
>>   	    __ARCH_SPIN_LOCK_UNLOCKED_VAL, __ARCH_SPIN_LOCK_UNLOCKED_VAL } }
>> -#endif
>>   } arch_spinlock_t;
>>   
>>   
>>
>> [[End of PGP Signed Part]]

-- 
John David Anglin  dave.anglin@bell.net


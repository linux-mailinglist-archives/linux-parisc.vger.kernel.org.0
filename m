Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2802D319668
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Feb 2021 00:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbhBKXNh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 11 Feb 2021 18:13:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhBKXNc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:13:32 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33600C06178B
        for <linux-parisc@vger.kernel.org>; Thu, 11 Feb 2021 15:12:33 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id i3so8098899oif.1
        for <linux-parisc@vger.kernel.org>; Thu, 11 Feb 2021 15:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w7YXdjP1QHQpRno10x2wa7BqK1UfsmPG9PWPZ5v3saw=;
        b=FohArwxxv66jlUey4dx+qT7chEtAev96C7P6RHA7R9YLEMlxbu8nCEvcuwKLE4t0bW
         Avq+/4qbbuiIPoPc5KPo3pJarASEg1caZr1ugvDU3Mt0i84RGhUV4l6dUcY8/RZhQ0gW
         8sa2v7VjptPj7dl21wltyb5ikvUVU7FMaU3/WbupIfSv5kbY42/fc0pNYYzZgEc//idv
         nyftNGZ3vyELf4MrfNXKat3RepbFLhZEd3tvrvq/6sjehhNZTUUMaPYySBKKffc0/FI7
         4dGWpvIA5poSxerGkP+CKUYFs+LNsy6aZHXkphiiw5RzTIoANr1l5DbmBTdI0DNvYUtU
         nA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=w7YXdjP1QHQpRno10x2wa7BqK1UfsmPG9PWPZ5v3saw=;
        b=Ot7HtJgmq4ulylh85Sz8kLxQvXwapVczxnF2Xk80ADrfekJ/dIBymmrIbAkq2QQ4Ek
         5U/RURmBUo9JzqOZuSL1FTmtDehFLqC7QO8jV/EpOWJmuzxer+5LhwBTSljK8+nKA+s5
         5vFFY/GdT9G8ydzokXv3KHHF8E47+D6H87ZulTg6tfaEOEmabaMFJ2On2yVRmUBUUlIF
         W7FmvfWcV4rsa9o2wUZVmgIym79Cl9LmYiCVLuNDT7W2l5MpXidxu3wz0fvLLmJpsomU
         kwqWDyapo53wPmj5O8kAsbb9Ghij5z3w5cH93Tu+W+zYJRX3wJ/USE4f6pg6YLMlOtDd
         Id8Q==
X-Gm-Message-State: AOAM530wIazCvNHwrEs3ndoc7I8GiltFar6cZPwQw2L3mVROh5S9eOG/
        A/dx/bZlvJRqmobnJkuH//KlMpM3/2k=
X-Google-Smtp-Source: ABdhPJyGjoADC5/FvNIQH3jUtq/E/F5DrxbHPaA2/sQlY6HAg78iilv9Fwj/jGhvEE6zngornmFYxg==
X-Received: by 2002:aca:1b0c:: with SMTP id b12mr143930oib.104.1613085152633;
        Thu, 11 Feb 2021 15:12:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w2sm1306120otq.9.2021.02.11.15.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 15:12:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] parisc: Optimize per-pagetable spinlocks (v11)
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>
References: <e023991b-ba2e-f6da-94fb-0988ad70e717@bell.net>
 <9b9c6446-365f-9ca6-b89f-c330fca11952@bell.net>
 <94210da5-5642-82ef-85ae-688e1c07473d@gmx.de>
 <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
 <20210127211851.GA32689@ls3530.fritz.box>
 <20210210145218.GA50561@roeck-us.net>
 <c7996434-198a-2a57-ac58-18ab6e1faf10@gmx.de>
 <288444d5-811f-db8f-6322-e26425527895@bell.net>
 <20210211012047.GA95605@roeck-us.net>
 <51fe1d4a-a2a0-b202-692f-c3db1843785c@bell.net>
 <20210211215131.GA127652@roeck-us.net>
 <06b31cea-61ce-a3a2-8abe-48aa5ab9dafb@bell.net>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <be7ce7b6-39cf-3d7c-7cfa-8941ac2eeb93@roeck-us.net>
Date:   Thu, 11 Feb 2021 15:12:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <06b31cea-61ce-a3a2-8abe-48aa5ab9dafb@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2/11/21 2:16 PM, John David Anglin wrote:
> On 2021-02-11 4:51 p.m., Guenter Roeck wrote:
>> On Thu, Feb 11, 2021 at 09:38:25AM -0500, John David Anglin wrote:
>>> On 2021-02-10 8:20 p.m., Guenter Roeck wrote:
>>>> On Wed, Feb 10, 2021 at 01:57:42PM -0500, John David Anglin wrote:
>>>>> On 2021-02-10 12:23 p.m., Helge Deller wrote:
>>>>>> On 2/10/21 3:52 PM, Guenter Roeck wrote:
>>>>>>> On Wed, Jan 27, 2021 at 10:18:51PM +0100, Helge Deller wrote:
>>>>>>>> On parisc a spinlock is stored in the next page behind the pgd which
>>>>>>>> protects against parallel accesses to the pgd. That's why one additional
>>>>>>>> page (PGD_ALLOC_ORDER) is allocated for the pgd.
>>>>>>>>
>>>>>>>> Matthew Wilcox suggested that we instead should use a pointer in the
>>>>>>>> struct page table for this spinlock and noted, that the comments for the
>>>>>>>> PGD_ORDER and PMD_ORDER defines were wrong.
>>>>>>>>
>>>>>>>> Both suggestions are addressed in this patch. The pgd spinlock
>>>>>>>> (parisc_pgd_lock) is stored in the struct page table. In
>>>>>>>> switch_mm_irqs_off() the physical address of this lock is loaded into
>>>>>>>> cr28 (tr4) and the pgd into cr25, so that the fault handlers can
>>>>>>>> directly access the lock.
>>>>>>>>
>>>>>>>> The currently implemened Hybrid L2/L3 page table scheme (where the pmd
>>>>>>>> is adjacent to the pgd) is dropped now too.
>>>>>>>>
>>>>>>>> Suggested-by: Matthew Wilcox <willy@infradead.org>
>>>>>>>> Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
>>>>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>>>>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>>>>>>> This patch results in:
>>>>>>>
>>>>>>> BUG: spinlock recursion on CPU#0, swapper/0/1
>>>>>>>   lock: 0x12226d14, .magic: dead4ead, .owner: swapper/0/1, .owner_cpu: 0
>>>>>>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc7-next-20210209-32bit #1
>>>>>>> Hardware name: 9000/778/B160L
>>>>>>> Backtrace:
>>>>>>>   [<1019f9bc>] show_stack+0x34/0x48
>>>>>>>   [<10a65278>] dump_stack+0x94/0x114
>>>>>>>   [<10219f4c>] spin_dump+0x8c/0xb8
>>>>>>>   [<1021a0b4>] do_raw_spin_lock+0xdc/0x108
>>>>>>>   [<10a7367c>] _raw_spin_lock_irqsave+0x30/0x48
>>>>>>>   [<102bf41c>] handle_mm_fault+0x5e8/0xdb0
>>>>>>>   [<102b813c>] __get_user_pages.part.0+0x1b0/0x3d4
>>>>>>>   [<102b8900>] __get_user_pages_remote+0x134/0x34c
>>>>>>>   [<102b8b80>] get_user_pages_remote+0x68/0x90
>>>>>>>   [<102fccb0>] get_arg_page+0x94/0xd8
>>>>>>>   [<102fdd84>] copy_string_kernel+0xc4/0x234
>>>>>>>   [<102fe70c>] kernel_execve+0xcc/0x1a4
>>>>>>>   [<10a58d94>] run_init_process+0xbc/0xe0
>>>>>>>   [<10a70d50>] kernel_init+0x98/0x13c
>>>>>>>   [<1019a01c>] ret_from_kernel_thread+0x1c/0x24
>>>>>>>
>>>>>>> when trying to boot parisc/hppa images in qemu. Reverting this patch fixes
>>>>>>> the problem.
>>>>>> True, I can reproduce the problem.
>>>>>> With CONFIG_DEBUG_SPINLOCK=y you get the backtrace above.
>>>>>> With  CONFIG_DEBUG_SPINLOCK=n it just hangs.
>>>>>> Happenes with 32-bit kernel with SMP kernel, even if only one virtual CPU is started.
>>>>> Which is quite puzzling since most spin locks are optimized in this case case.  Strikes me we
>>>>> have a lock that's not initialized.
>>>>>
>>>>> It's not obvious how this relates to the patch.  get_arg_page() calls get_user_pages_remote() with
>>>> The fact that reverting it fixes the problem is a good indication
>>>> that the problem does relate to this patch.
>>>>
>>>> As for how - no idea. That is not my area of expertise.
>>> I built Helge's for-next tree both with CONFIG_DEBUG_SPINLOCK=y and CONFIG_DEBUG_SPINLOCK=n.  Both
>>> builds work fine on c8000.
>>>
>>> The only thing that might have changed in the patch is the alignment of the lock used for page table updates.
>>> Qemu only support PA 1.x instructions.  The ldcw instruction needs 16-byte alignment on real hardware and
>>> there is code to dynamically align lock pointers to 16-byte alignment.  The c8000 supports PA 2.0 instructions
>>> and the ldcw,co instruction only needs 4-byte alignment.  Perhaps there is an issue with the dynamic alignment
>>> of the lock pointer or the lock initialization in the PA 1.x build for qemu.
>>>
>> The first lock is acquired in mm/memory.c from line 3565:
>>
>>         vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
>>                         &vmf->ptl);
>>
>> The second (recursive) lock is acquired from line 3587 in the same
>> function:
>>
>>         set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
>>
>> Source code lines are from next-20210211. I confirmed with deb ug code
>> that the lock address passed to do_raw_spin_lock() is the same in both
>> calls.
> Thanks Guenter.  I assume this is with v15 of the patch?
> 
I have no idea what version it is, sorry. It is with the version
that is in next-20210211. The problem was first seen with next-20210201.

> It looks as if we might not need the ptl lock in set_pte_at() and probably elsewhere.
> 
> But I'm still puzzled as to why this doesn't happen when different locks are used as in your
> report with the earlier patch. 
> 
Maybe I reported it against the wrong version ? If so, sorry, my bad.

Guenter

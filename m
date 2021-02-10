Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D35316F68
	for <lists+linux-parisc@lfdr.de>; Wed, 10 Feb 2021 20:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbhBJTAI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Wed, 10 Feb 2021 14:00:08 -0500
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:45667 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232956AbhBJS60 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 Feb 2021 13:58:26 -0500
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20210210185742.YKHB52743.mtlfep02.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 10 Feb 2021 13:57:42 -0500
Received: from [192.168.2.49] (really [70.50.109.22]) by mtlspm01.bell.net
          with ESMTP
          id <20210210185742.WQUV130487.mtlspm01.bell.net@[192.168.2.49]>;
          Wed, 10 Feb 2021 13:57:42 -0500
To:     Helge Deller <deller@gmx.de>, Guenter Roeck <linux@roeck-us.net>
Cc:     linux-parisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
References: <2786b971-254a-ae07-ea24-38e57bd29892@bell.net>
 <d4751664-6627-920e-9c44-7f9b7e287431@bell.net>
 <6fb36e0e-62f5-68c7-92ec-c6dd16841813@bell.net>
 <44ee7e09-90e7-0766-f0e4-bde2d3cdc2ec@bell.net>
 <5100eb80-975f-d77d-846a-5aabc25d0f95@bell.net>
 <e023991b-ba2e-f6da-94fb-0988ad70e717@bell.net>
 <9b9c6446-365f-9ca6-b89f-c330fca11952@bell.net>
 <94210da5-5642-82ef-85ae-688e1c07473d@gmx.de>
 <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
 <20210127211851.GA32689@ls3530.fritz.box>
 <20210210145218.GA50561@roeck-us.net>
 <c7996434-198a-2a57-ac58-18ab6e1faf10@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Optimize per-pagetable spinlocks (v11)
Message-ID: <288444d5-811f-db8f-6322-e26425527895@bell.net>
Date:   Wed, 10 Feb 2021 13:57:42 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c7996434-198a-2a57-ac58-18ab6e1faf10@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-CM-Analysis: v=2.4 cv=KPWfsHJo c=1 sm=1 tr=0 ts=60242ca6 a=S6gQgrXzeH76ECG4GouVuA==:117 a=S6gQgrXzeH76ECG4GouVuA==:17 a=IkcTkHD0fZMA:10 a=qa6Q16uM49sA:10 a=JfrnYn6hAAAA:8 a=nRxgo2pvAAAA:8 a=FBHGMhGWAAAA:8 a=touHm03F7vrUl70nMIIA:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=hyOiLu3se5BDDO0nYPa2:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4xfI32N45QTnik9zgD/nfQRuUlPF/HdZFsW6nvtOpI2xTQZg0zvmSdHi5DEVxz4BzEU6puiKTiXUOwDHxLhb3xbXEMwlR4OwrsCjR6cSpgl/t6RZJkeIyT 2V4Fu4l3gZvm7cVwjArza0X8sevoYTOgAYFwbZU72jB4AwxRpSj1hsLEXJxZE7ytDOj6vIR4RoZPZUUuw88F+azvV/dEC3G1KpA=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-02-10 12:23 p.m., Helge Deller wrote:
> On 2/10/21 3:52 PM, Guenter Roeck wrote:
>> On Wed, Jan 27, 2021 at 10:18:51PM +0100, Helge Deller wrote:
>>> On parisc a spinlock is stored in the next page behind the pgd which
>>> protects against parallel accesses to the pgd. That's why one additional
>>> page (PGD_ALLOC_ORDER) is allocated for the pgd.
>>>
>>> Matthew Wilcox suggested that we instead should use a pointer in the
>>> struct page table for this spinlock and noted, that the comments for the
>>> PGD_ORDER and PMD_ORDER defines were wrong.
>>>
>>> Both suggestions are addressed in this patch. The pgd spinlock
>>> (parisc_pgd_lock) is stored in the struct page table. In
>>> switch_mm_irqs_off() the physical address of this lock is loaded into
>>> cr28 (tr4) and the pgd into cr25, so that the fault handlers can
>>> directly access the lock.
>>>
>>> The currently implemened Hybrid L2/L3 page table scheme (where the pmd
>>> is adjacent to the pgd) is dropped now too.
>>>
>>> Suggested-by: Matthew Wilcox <willy@infradead.org>
>>> Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>>
>> This patch results in:
>>
>> BUG: spinlock recursion on CPU#0, swapper/0/1
>>   lock: 0x12226d14, .magic: dead4ead, .owner: swapper/0/1, .owner_cpu: 0
>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc7-next-20210209-32bit #1
>> Hardware name: 9000/778/B160L
>> Backtrace:
>>   [<1019f9bc>] show_stack+0x34/0x48
>>   [<10a65278>] dump_stack+0x94/0x114
>>   [<10219f4c>] spin_dump+0x8c/0xb8
>>   [<1021a0b4>] do_raw_spin_lock+0xdc/0x108
>>   [<10a7367c>] _raw_spin_lock_irqsave+0x30/0x48
>>   [<102bf41c>] handle_mm_fault+0x5e8/0xdb0
>>   [<102b813c>] __get_user_pages.part.0+0x1b0/0x3d4
>>   [<102b8900>] __get_user_pages_remote+0x134/0x34c
>>   [<102b8b80>] get_user_pages_remote+0x68/0x90
>>   [<102fccb0>] get_arg_page+0x94/0xd8
>>   [<102fdd84>] copy_string_kernel+0xc4/0x234
>>   [<102fe70c>] kernel_execve+0xcc/0x1a4
>>   [<10a58d94>] run_init_process+0xbc/0xe0
>>   [<10a70d50>] kernel_init+0x98/0x13c
>>   [<1019a01c>] ret_from_kernel_thread+0x1c/0x24
>>
>> when trying to boot parisc/hppa images in qemu. Reverting this patch fixes
>> the problem.
>
> True, I can reproduce the problem.
> With CONFIG_DEBUG_SPINLOCK=y you get the backtrace above.
> With  CONFIG_DEBUG_SPINLOCK=n it just hangs.
> Happenes with 32-bit kernel with SMP kernel, even if only one virtual CPU is started.
Which is quite puzzling since most spin locks are optimized in this case case.  Strikes me we
have a lock that's not initialized.

It's not obvious how this relates to the patch.  get_arg_page() calls get_user_pages_remote() with
locked NULL:

       /*
         * We are doing an exec().  'current' is the process
         * doing the exec and bprm->mm is the new process's mm.
         */
        ret = get_user_pages_remote(bprm->mm, pos, 1, gup_flags,
                        &page, NULL, NULL);

Dave

-- 
John David Anglin  dave.anglin@bell.net



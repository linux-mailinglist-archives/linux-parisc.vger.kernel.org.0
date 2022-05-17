Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F86252A4C5
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 16:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348899AbiEQO0m (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 10:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348895AbiEQO01 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 10:26:27 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-001.bell.net [209.71.212.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AE52542A27
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 07:26:25 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 627A10BA0199B79F
X-CM-Envelope: MS4xfJtiQ+gXAMztriw+dj/mljJaK/g8z6wUMJ+oxxaZ/5lvICAcJIntxi4bykOAjjZ0yO5sioP8VoRnvqcehFMPSL7TEBALUyP1W3mobNYwXtvoVUFRIqTN
 q8V71Bm7y2Blipb6Ym6APXjD9lpW2Q1QFvos2vXHxVLNgu5CkNh0+8s6E/+yPyef/3NDtBWFjhrl+c06PCYZVcjsvZ1sYscOg6WB9sEBsPUGxF43lUwCjbel
 QKPBtm84ykXHHaBA+S93pBiCeP49F/wkvOH1noWZ62FmFTd9qu9Ng8FVw76QEZtK+SsT3raz6KB5Rqo/6GOkU8hTFgk6XXGvFzJCtUWtq+xWxtxaTQqBGjWZ
 5HMVXEwjPc442ShRvqya3QHogoMKng==
X-CM-Analysis: v=2.4 cv=G99/r/o5 c=1 sm=1 tr=0 ts=6283b08a
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=LXi2hibFfeaP9KbleAEA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 627A10BA0199B79F; Tue, 17 May 2022 10:26:18 -0400
Message-ID: <aa7e15ff-3e74-1b9d-4d65-235517b26675@bell.net>
Date:   Tue, 17 May 2022 10:26:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <5568470.DvuYhMxLoT@daneel.sf-tec.de>
 <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
 <2239732.ElGaqSPkdT@eto.sf-tec.de>
 <91bd7b0e-0830-37cc-270c-a3e9d3069e78@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <91bd7b0e-0830-37cc-270c-a3e9d3069e78@gmx.de>
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

On 2022-05-17 9:24 a.m., Helge Deller wrote:
> On 5/17/22 15:19, Rolf Eike Beer wrote:
>> Am Montag, 16. Mai 2022, 23:49:10 CEST schrieb Helge Deller:
>>> On 5/16/22 23:28, Rolf Eike Beer wrote:
>>>> Am Montag, 16. Mai 2022, 17:14:47 CEST schrieb John David Anglin:
>>>>> Originally, I was convinced that we needed to use tmpalias flushes
>>>>> everwhere, for both user and kernel flushes. However, when I modified
>>>>> flush_kernel_dcache_page_addr, to use a tmpalias flush, my c8000
>>>>> would crash quite early when booting.
>>>>>
>>>>> The PDC returns alias values of 0 for the icache and dcache. This
>>>>> indicates that either the alias boundary is greater than 16MB or
>>>>> equivalent aliasing doesn't work. I modified the tmpalias code to
>>>>> make it easy to try alternate boundaries. I tried boundaries up to
>>>>> 128MB but still kernel tmpalias flushes didn't work on c8000.
>>>>>
>>>>> This led me to conclude that tmpalias flushes don't work on PA8800
>>>>> and PA8900 machines, and that we needed to flush directly using the
>>>>> virtual address of user and kernel pages. This is likely the major
>>>>> cause of instability on the c8000 and rp34xx machines.
>>>>>
>>>>> Flushing user pages requires doing a temporary context switch as we
>>>>> have to flush pages that don't belong to the current context. Further,
>>>>> we have to deal with pages that aren't present. If a page isn't
>>>>> present, the flush instructions fault on every line.
>>>>>
>>>>> Other code has been rearranged and simplified based on testing. For
>>>>> example, I introduced a flush_cache_dup_mm routine. flush_cache_mm
>>>>> and flush_cache_dup_mm differ in that flush_cache_mm calls
>>>>> purge_cache_pages and flush_cache_dup_mm calls flush_cache_pages.
>>>>> In some implementations, pdc is more efficient than fdc. Based on
>>>>> my testing, I don't believe there's any performance benefit on the
>>>>> c8000.
>>>>>
>>>>> V2:
>>>>> 1) Add flush_cache_page_check_pte routine.
>>>>> 2) Use it in copy_to_user_page and copy_from_user_page.
>>>>> 3) flush_anon_page moved to cache.c and updated.
>>>>> 4) Changed alias boundary to 64 MB for 64-bit kernels. Revised comment
>>>>>
>>>>>     regarding alias boundary for PA8800/PA8900 processors.
>>>>>
>>>>> 5) Removed struct mm_struct * argument from flush_cache_pages.
>>>>> 6) Fixed thinko in flush_cache_range. It increased the number of pages
>>>>>
>>>>>     flushed and slowed performance.
>>>>>
>>>>> 7) Removed sync changes from pacache.S.
>>>>>
>>>>> V3:
>>>>> 1) copy_to_user_page and copy_from_user_page moved to cache.c to
>>>>>
>>>>>     improve inlining.
>>>>>
>>>>> 2) Replaced copy_user_page with copy_user_highpage.
>>>>> 3) Fixed cache threshold calculation on 32-bit kernels.
>>>>> 4) Don't warn on inequivalent private mappings in flush_dcache_page.
>>>>> 5) Return early from mm_total_size if size exceeds
>>>>>
>>>>>     parisc_cache_flush_threshold.
>>>>>
>>>>> 6) Disable non-access TLB warning in handle_nadtlb_fault. Warning
>>>>>
>>>>>     happens occassionally handling flushes for COW faults.
>>>>>
>>>>> 7) Remove flush_cache_dup_mm.
>>>>> 8) Flush entire cache in flush_cache_mm and flush_cache_range on
>>>>>
>>>>>     processors with aliasing caches. Only flush small cache ranges
>>>>>     on machines with PA8800/PA8900 processors.
>>>>>
>>>>> 9) Tested on rp3440, c8000 and c3750.
>>>> Given how long these changelogs are, and how fragile the whole caching is
>>>> I
>>>> think it is a good idea to split this patch into smaller ones, to improve
>>>> readability and being able to bisect it.
>>> FWIW, I've done some cleanups to this patch and committed it to my for-next
>>> tree. In case it's split up, please use the revised version.
>> Why did you modify get_ptep()? Until now it was just moved around in the file,
>> and IMHO it becomes less readable because all these needless variables are
>> batched up at the start of the function now. The only point I would see in
>> moving them all to the front is if there would be no nesting anymore, and
>> every condition was inverted:
> Dave's original patch did not moved the variables to the beginning.
> That change was me - just because checkpatch complained otherwise.
>
> I agree that it's less readable.
The get_ptep code was originally based on the vmalloc_to_page code in vmalloc.c.
vmalloc_to_page code.  This code has now changed, so I think get_ptep needs updating.
See get_old_pud in mremap.c.  It looks good to me.

Dave

-- 
John David Anglin  dave.anglin@bell.net


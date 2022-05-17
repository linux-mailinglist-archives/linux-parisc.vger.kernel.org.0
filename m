Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C61252A34B
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 15:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347630AbiEQNZR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 09:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347676AbiEQNZP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 09:25:15 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F717434A0
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652793875;
        bh=4qRt7pmtpL6NC9vFiIbxqZ4zc7KYBsTmcpTvb3Ref64=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=imGnjrVwXshX3nXd0hiG16qpY25bOG018ZsSB71aw/Gu8tYjAv2x/Eaf7/+L0ybaF
         c+1Np7bsNkmEToec/hpO6D0VgHQNQ28Zjf5nExc2lsOYri0eVVDbt4MwtVBQ4Q53Nk
         8VR4lfRks90PnWkUZv+0vYK9gn09Wy4Alki2ptus=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.173.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1nbDn004yn-00tS8f; Tue, 17
 May 2022 15:24:35 +0200
Message-ID: <91bd7b0e-0830-37cc-270c-a3e9d3069e78@gmx.de>
Date:   Tue, 17 May 2022 15:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <5568470.DvuYhMxLoT@daneel.sf-tec.de>
 <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
 <2239732.ElGaqSPkdT@eto.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <2239732.ElGaqSPkdT@eto.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hthv0hInJAKR6nSw/9mLdnup/eVkjVktl3bwq7riju0MMYjkxAq
 19BguNe2KLQ7VKDF2RPjwjw41A9wC68wbNd2zQK4Xy5T9Lpnk42D6PICtU/DFtIz7mavMpV
 zZxCtN/BGDbAs+BNcXg3lRA696Q9m5Z/+Lv8CoxHnk7ZS2Z2rMBz9S/fb2AfcSgQVgpjnFa
 R5uHbeCYGCSAGxWI0l5tg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5xCUARCfYb4=:rd5mEUPfXqZe/rB1JW274t
 itqneYcl0Sw5obVz5a0R2R0gx+pPmaF7gBd0kvGx7/QfnUk+yNWMpSCiSZZZ2CMM58rFOK3yk
 Nno+XHrq3pi/Scps7c0k8nKm9WpT7jgvThYId9OhMun/82okwQliN7yL7hHw0RUqNYF2e/64M
 bKno2BWDEdqQQqJZuSGlhuUSBW8KINptAdgdKJrGxkUAUMnBCsppA4hCRIba0gswiH3D8d+/J
 GzbuGPvPn8BVoDEZNqZNKBlLhnN8raReGHyqnSbb10CX6+Luxb0bbet66+lwW2coFNKuisR+u
 ZWtcn5JnkgUDxyDelD25BMELcAZpY7vxBdSh7C2nDG1jT7lpO34SqZMJ/StrZen43BhS5aHS/
 xiaSYLm4IwsyMk3AdKJbNIY07royYXEE4w6VPQ1WQuNro7ILlicNiwFtChFQLsZvW6hNpoXvU
 UNKWy/IR+i2/hTj0eYHmPKTEEc6HqFsm95u6xEkRTSkAToDziwJdmVHsI6PT9Av/qa64pwwXL
 pDIhqfN7eYI87JylM4QmWhfBDCH52dl5nCqWoJLMxgo2JgeBB4Qldf+wzFGIEzoLQgKr0uq1s
 eHXh/UJCXoZRKN+7plPaOovM9yQu3zutA6bMXNwY49J47ycIsLsL0ETXIrbzBUqhgP9g11lKn
 yTSjlWasPhks3eFgdnHXIL9DalU088uw8cumf1u+eulUpGv3rceGFtoRu1xhSIsj9gs4/2YNQ
 DklbEaF6gcU8nNzoVlHWXkT6X0PKvJeMR9S7wb8+bmgkKlOdjLD6xFDF5/goHEomICw3rVkw9
 czsmPdLhoqTPUgWolXoJvKVYxG7/onIoBCPlWzC42H3djfhicq5V0D0NB/3IwlAg4hxzuta7h
 xMoV4nfvTLGVF76EnB9DxPBRLDzGjrIjhrjcZkOOD2Mfy0D1u9+UG5Z1oUVjwVqhkN9iqsqMR
 +e9uuhITjF7QJtVeGb9qXEoDrEbU9FjHiMwEpGRXq+jGCADYQsj4r4CzO/jm2AE9F6Abg+3v7
 PmRrV5AbthgUFl7pbt8aixglQG8tXdKhiCzICE3IjIbSexvxwTOgc78WbYRpbXc6vLnAEoQDJ
 KW3ITY1dXKKuOvBHaGQYGanjMFZeGslAB/0uC+ak0x5I5p3wIHeKOiwRg==
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/17/22 15:19, Rolf Eike Beer wrote:
> Am Montag, 16. Mai 2022, 23:49:10 CEST schrieb Helge Deller:
>> On 5/16/22 23:28, Rolf Eike Beer wrote:
>>> Am Montag, 16. Mai 2022, 17:14:47 CEST schrieb John David Anglin:
>>>> Originally, I was convinced that we needed to use tmpalias flushes
>>>> everwhere, for both user and kernel flushes. However, when I modified
>>>> flush_kernel_dcache_page_addr, to use a tmpalias flush, my c8000
>>>> would crash quite early when booting.
>>>>
>>>> The PDC returns alias values of 0 for the icache and dcache. This
>>>> indicates that either the alias boundary is greater than 16MB or
>>>> equivalent aliasing doesn't work. I modified the tmpalias code to
>>>> make it easy to try alternate boundaries. I tried boundaries up to
>>>> 128MB but still kernel tmpalias flushes didn't work on c8000.
>>>>
>>>> This led me to conclude that tmpalias flushes don't work on PA8800
>>>> and PA8900 machines, and that we needed to flush directly using the
>>>> virtual address of user and kernel pages. This is likely the major
>>>> cause of instability on the c8000 and rp34xx machines.
>>>>
>>>> Flushing user pages requires doing a temporary context switch as we
>>>> have to flush pages that don't belong to the current context. Further=
,
>>>> we have to deal with pages that aren't present. If a page isn't
>>>> present, the flush instructions fault on every line.
>>>>
>>>> Other code has been rearranged and simplified based on testing. For
>>>> example, I introduced a flush_cache_dup_mm routine. flush_cache_mm
>>>> and flush_cache_dup_mm differ in that flush_cache_mm calls
>>>> purge_cache_pages and flush_cache_dup_mm calls flush_cache_pages.
>>>> In some implementations, pdc is more efficient than fdc. Based on
>>>> my testing, I don't believe there's any performance benefit on the
>>>> c8000.
>>>>
>>>> V2:
>>>> 1) Add flush_cache_page_check_pte routine.
>>>> 2) Use it in copy_to_user_page and copy_from_user_page.
>>>> 3) flush_anon_page moved to cache.c and updated.
>>>> 4) Changed alias boundary to 64 MB for 64-bit kernels. Revised commen=
t
>>>>
>>>>    regarding alias boundary for PA8800/PA8900 processors.
>>>>
>>>> 5) Removed struct mm_struct * argument from flush_cache_pages.
>>>> 6) Fixed thinko in flush_cache_range. It increased the number of page=
s
>>>>
>>>>    flushed and slowed performance.
>>>>
>>>> 7) Removed sync changes from pacache.S.
>>>>
>>>> V3:
>>>> 1) copy_to_user_page and copy_from_user_page moved to cache.c to
>>>>
>>>>    improve inlining.
>>>>
>>>> 2) Replaced copy_user_page with copy_user_highpage.
>>>> 3) Fixed cache threshold calculation on 32-bit kernels.
>>>> 4) Don't warn on inequivalent private mappings in flush_dcache_page.
>>>> 5) Return early from mm_total_size if size exceeds
>>>>
>>>>    parisc_cache_flush_threshold.
>>>>
>>>> 6) Disable non-access TLB warning in handle_nadtlb_fault. Warning
>>>>
>>>>    happens occassionally handling flushes for COW faults.
>>>>
>>>> 7) Remove flush_cache_dup_mm.
>>>> 8) Flush entire cache in flush_cache_mm and flush_cache_range on
>>>>
>>>>    processors with aliasing caches. Only flush small cache ranges
>>>>    on machines with PA8800/PA8900 processors.
>>>>
>>>> 9) Tested on rp3440, c8000 and c3750.
>>>
>>> Given how long these changelogs are, and how fragile the whole caching=
 is
>>> I
>>> think it is a good idea to split this patch into smaller ones, to impr=
ove
>>> readability and being able to bisect it.
>>
>> FWIW, I've done some cleanups to this patch and committed it to my for-=
next
>> tree. In case it's split up, please use the revised version.
>
> Why did you modify get_ptep()? Until now it was just moved around in the=
 file,
> and IMHO it becomes less readable because all these needless variables a=
re
> batched up at the start of the function now. The only point I would see =
in
> moving them all to the front is if there would be no nesting anymore, an=
d
> every condition was inverted:

Dave's original patch did not moved the variables to the beginning.
That change was me - just because checkpatch complained otherwise.

I agree that it's less readable.

Helge

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84AE52932A
	for <lists+linux-parisc@lfdr.de>; Mon, 16 May 2022 23:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238115AbiEPVuG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 May 2022 17:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346784AbiEPVuE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 May 2022 17:50:04 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90832E684
        for <linux-parisc@vger.kernel.org>; Mon, 16 May 2022 14:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652737758;
        bh=CNtpL22Pb1kpRs/AkO/buiFHaBfD8xb65OXeOkwucvU=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=h5wO27jDNraCIM73kP9LjKRIYz8QNq6oKV+lOqJglFOvBvusXIpuJCuEA6J4X8eEp
         8AkwCzCfZ5itMdlMcdHltXHUc65GuSxnPY6V7Yp1yLlwTN/o16LzM+J/xBxbv9DtEZ
         /09oAZjQVS2H7mhHzLcf8h8g2sfy+fq3HlZzLab4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhlKs-1nLncE30Zk-00doZS; Mon, 16
 May 2022 23:49:18 +0200
Message-ID: <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
Date:   Mon, 16 May 2022 23:49:10 +0200
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
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <5568470.DvuYhMxLoT@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dXGbaSQAoxE8vN6fmcLaCp8x+riEfRxIpRRnZLDPndKOPfO8cib
 7s81NC5fSSKITYOxuM7gyTYyM7+Zt9nXFXLnf5/rwxK8lJwzHIylSwToZ08if+tCZQ8bQMD
 mKRdtapMMoKQsPMv/KiZ0I5oVcg0N3oOj/gE9n6/jYoKVMmJFuzL+mfCRi8lP6eLwSfxl0Q
 Vn0pPL9e9OGI6fqwh9Wdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FQ+aDRw8syI=:83JTdrXsz9CbKjJ3B07ZCZ
 aqHl7lgpAF0sBE3F+S5EmWxGys5IwkjbpDuqu7XxwfEwAOjByG/r10TIXBxzid2sSf7iySvuy
 +mBcESGk0fi54ZTyi5VMh94XmVNfoC0rgQU4+M/jctPXuIEKOyeJ6+UofRa0q0cUIVM04rCSo
 M+MygbK+bcq0ZkczwVQwT4cDNOwBmh0cRx4ZjnAIM1DG5wF5o9x8jT9Y4+UvWpm20lu8D8q41
 m0h/bm8aBo5UUAySsJBLZi66Zh3Po6xlv018cVli57TVsEEzeKS2FZ9Ojg7IiK+ml+D3ut1kj
 9GpE3dNgsLDhRjKF7KdvAKjmUrPlYS0yWTyU+1YVusDJQlLiINdZNOL0pyaXDnlgV+Gk4ONqh
 FC5nSY1ai7qlK4GWH9PIcnIGAHXw6E4bMwfEPiLSU2jznrsO4Fb7c+uY5R/5NFu2cbi5OYFpB
 arnRa2n4AV8RsZByypNBm6FdPzqhvIc2d3ziAB6n/wImH/Bd2Uz7l5g/DEO7Y1XIaV3twyrna
 7oUQTurObSngSn5fj8Jvk/7Yavg278oRSot5etYNpZ8wnUyCiPva393vvieMy4XlHmAmzJp9K
 sGShH9g7avHQPzabgjIbG7i7ss7d9UIsrrqjpNF1cdhhbrGaMAk/a0vyeAo3v7ipBkfTxDqcP
 WBb6Afj79iiK/+ZMFsvSjic5eUXFHM7rJdvU8JhDpIHyDKwETLeYO7eRikkFQslL/N1a6UEeX
 ZBX9OuTyE5CFnyU4mEPWHFYQRKJ5jcbsmoz5366aUlxDWumQDWNVUtcKeRZ+w6aam9E8np+KI
 ugOTPJX0OHKROnF4/ow9pNR5djv/crrl2yuJcGkFzlAhYGjJ+918btO4Y1f57cB8Y/KzqEZnf
 hMi8qL8PNJZrp6A5zMvDBb5khBUB14aHxy1Ejde0RREmrxCF1foV1y+QH5CDWpIuYqrwMeWMv
 FW2a/2DaO3SLm0USqNXxpkQ+sHjnpHr5bWsNxhun3Z/+6pIAxYvxDixZiR5ApDSBB+dO/28Td
 x5FFcH4CoebqwtFh2dgT6j2SxrR3wMuW9NWzgbssZHj7tfcqf8TJIt6zVA5RDjEoTh8v7/KQL
 5YWZbaC+4S4jxA=
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/16/22 23:28, Rolf Eike Beer wrote:
> Am Montag, 16. Mai 2022, 17:14:47 CEST schrieb John David Anglin:
>> Originally, I was convinced that we needed to use tmpalias flushes
>> everwhere, for both user and kernel flushes. However, when I modified
>> flush_kernel_dcache_page_addr, to use a tmpalias flush, my c8000
>> would crash quite early when booting.
>>
>> The PDC returns alias values of 0 for the icache and dcache. This
>> indicates that either the alias boundary is greater than 16MB or
>> equivalent aliasing doesn't work. I modified the tmpalias code to
>> make it easy to try alternate boundaries. I tried boundaries up to
>> 128MB but still kernel tmpalias flushes didn't work on c8000.
>>
>> This led me to conclude that tmpalias flushes don't work on PA8800
>> and PA8900 machines, and that we needed to flush directly using the
>> virtual address of user and kernel pages. This is likely the major
>> cause of instability on the c8000 and rp34xx machines.
>>
>> Flushing user pages requires doing a temporary context switch as we
>> have to flush pages that don't belong to the current context. Further,
>> we have to deal with pages that aren't present. If a page isn't
>> present, the flush instructions fault on every line.
>>
>> Other code has been rearranged and simplified based on testing. For
>> example, I introduced a flush_cache_dup_mm routine. flush_cache_mm
>> and flush_cache_dup_mm differ in that flush_cache_mm calls
>> purge_cache_pages and flush_cache_dup_mm calls flush_cache_pages.
>> In some implementations, pdc is more efficient than fdc. Based on
>> my testing, I don't believe there's any performance benefit on the
>> c8000.
>>
>> V2:
>> 1) Add flush_cache_page_check_pte routine.
>> 2) Use it in copy_to_user_page and copy_from_user_page.
>> 3) flush_anon_page moved to cache.c and updated.
>> 4) Changed alias boundary to 64 MB for 64-bit kernels. Revised comment
>>    regarding alias boundary for PA8800/PA8900 processors.
>> 5) Removed struct mm_struct * argument from flush_cache_pages.
>> 6) Fixed thinko in flush_cache_range. It increased the number of pages
>>    flushed and slowed performance.
>> 7) Removed sync changes from pacache.S.
>>
>> V3:
>> 1) copy_to_user_page and copy_from_user_page moved to cache.c to
>>    improve inlining.
>> 2) Replaced copy_user_page with copy_user_highpage.
>> 3) Fixed cache threshold calculation on 32-bit kernels.
>> 4) Don't warn on inequivalent private mappings in flush_dcache_page.
>> 5) Return early from mm_total_size if size exceeds
>>    parisc_cache_flush_threshold.
>> 6) Disable non-access TLB warning in handle_nadtlb_fault. Warning
>>    happens occassionally handling flushes for COW faults.
>> 7) Remove flush_cache_dup_mm.
>> 8) Flush entire cache in flush_cache_mm and flush_cache_range on
>>    processors with aliasing caches. Only flush small cache ranges
>>    on machines with PA8800/PA8900 processors.
>> 9) Tested on rp3440, c8000 and c3750.
>
> Given how long these changelogs are, and how fragile the whole caching i=
s I
> think it is a good idea to split this patch into smaller ones, to improv=
e
> readability and being able to bisect it.

FWIW, I've done some cleanups to this patch and committed it to my for-nex=
t tree.
In case it's split up, please use the revised version.

Helge

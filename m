Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2379B52AA51
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 20:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346076AbiEQSOQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 14:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351869AbiEQSNb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 14:13:31 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7A051E51
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 11:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652811107;
        bh=kI5zFU/+L/9/rUSUDO54Haa5xweht+ODlNYRsTK1CsY=;
        h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
        b=ICaQ8u1BbU5rPAvCcNWyonBc6p7dfzkcyMNRuHf4iEhMTGPBRQ96D7ToHT7FmyJmV
         X7JIaHLk8qID3cLqkmfuI5qjEF+rGef3DpNF6u8Ag0uX1PIOfeVcErPfE6eNCdhEN2
         LnMOzgItUoxpgUE9kAyCKwRprcibul4fMzsdSax0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.173.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrhUE-1nVy7y3T9g-00nkU6; Tue, 17
 May 2022 20:11:46 +0200
Message-ID: <5ea9b91f-1d64-027a-b00d-53e0ad2302ff@gmx.de>
Date:   Tue, 17 May 2022 20:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <5568470.DvuYhMxLoT@daneel.sf-tec.de>
 <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
 <2239732.ElGaqSPkdT@eto.sf-tec.de>
 <91bd7b0e-0830-37cc-270c-a3e9d3069e78@gmx.de>
 <aa7e15ff-3e74-1b9d-4d65-235517b26675@bell.net>
From:   Helge Deller <deller@gmx.de>
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
In-Reply-To: <aa7e15ff-3e74-1b9d-4d65-235517b26675@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y76hvs5BIbvD+fc/0IN7zLwWdj+hPR074+7bAwhlEjRTuowzkQT
 ggMEulwwNddwHbyVlPfQTLcEHkdAiXUxXe/nhKjVZWfeY3ullFIU+zPc/FHU/3VGGhv4h4j
 gSV9jukuTa5CcplV27FNafDVeri1S+m1Ei1QjBLQ+w2U2Q2m4c3oS8fEL5U7vXlutk+ijiN
 MFekFSGcIDBQ64OoxftSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Fk+Kxs9RWg=:KGBh8KaXF/RmpMLAoUYRlY
 oMd+XdEpPUx0gq64bP1aAWiG1Ku6MP5ppb4DfId7yTNY+yGsJBGxvGn1j4o7EQ5XosJJ+CXUP
 sE4/DQ4tBW4/YolB+DQVlhhuhMq7XC4/6aBXfMrZU0+qt7UBQsSw4+295KLEhCWhEWJtgGhO5
 q7fnuh86sVvsrFWBe3ouatoZXBD+muEE4c2p3tDWXsIlNxRH+A2dSeVjwjl9Fa+P0AbrFISLz
 nirJfpw+pLu4uqKnxhJX0kMrw7dZkPWWHJ5krk9uijpKB++FLe0bK3XA+4F5WwlkRj0Uvc45K
 uHojW0thavqw1MFDnq8/l3ltJHXaP3xaIKpFKFezPAxco+lb6jXVNnHFxhrwR/B+L1CP4GNwp
 Sa1JPHuFXItgUyfxxp+BERVFxisgRHf1ZU7briIo6n4h6Kj4dfisl6zUTotr12voeUlSvhJwg
 PD7DlOJXreuDQkE6lqQRPnXE+axrJ3P9V2v21pNOE+oZ+xrWgnuCT0mbOeDiLpYLH8+ijlFV7
 wWd7GMgnXv8Qnq4FnzB116c4VZA4/MwUkqtuV48Q2DNW8waZ++je+mtlrSxl9bOdtTE7Np8Do
 B0yo00hBdxs2zB3e+YPPk0ZpZ/R3V12lcJQjosDIEzUULNI0Cjm1+85PVNrvus1gg/lRqvuvN
 HTtKNs8GOkZt/VQryWs6ouVFiQhETfx15yg4U0LPEAZRSUc9+rgbuoyylqo6Acs+0c8cptLxT
 hYXKzcFcFd6+4cTe5UtXxukORGH7tIBrBN73crVVU504jzvuNvb/a7YDyS7/hEL1fTJq/RZtG
 oFv83MSIDcbEwnBhqD170u3Hp8mbg4uR2tTnI19MO3AG/cgzHgbe1/xr9655KXHe4GAKlL5wx
 EuQOIm8DJ9Ufe+hFetc+eolzj16JpN5g2HPmnVkc4fTcfSfgjT5E0HN1Va+VBuJ1IMIiYn9Wa
 2sgaxZ62OcBUKm/6fNzQIlFDbS3Fl4hPYFNiQMQ7YTNpUQkM6PjH8tZL4oy+fJWnNIrMC7WbV
 UJq9RIeoLjUhoYFnbjBE2n0iCuU+dmfyd8KTAz8JM8KFjaeBRx8oy2P9JTjyv0jNbTMcRpD36
 esYPdjLoTAQfGlAcGTC4V544e485Iuw5A4QxsEM9DmY+PS39H1nIiGcEw==
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/17/22 16:26, John David Anglin wrote:
> On 2022-05-17 9:24 a.m., Helge Deller wrote:
>> On 5/17/22 15:19, Rolf Eike Beer wrote:
>>> Am Montag, 16. Mai 2022, 23:49:10 CEST schrieb Helge Deller:
>>>> On 5/16/22 23:28, Rolf Eike Beer wrote:
>>>>> Am Montag, 16. Mai 2022, 17:14:47 CEST schrieb John David Anglin:
>>>>>> Originally, I was convinced that we needed to use tmpalias flushes
>>>>>> everwhere, for both user and kernel flushes. However, when I modifi=
ed
>>>>>> flush_kernel_dcache_page_addr, to use a tmpalias flush, my c8000
>>>>>> would crash quite early when booting.
>>>>>>
>>>>>> The PDC returns alias values of 0 for the icache and dcache. This
>>>>>> indicates that either the alias boundary is greater than 16MB or
>>>>>> equivalent aliasing doesn't work. I modified the tmpalias code to
>>>>>> make it easy to try alternate boundaries. I tried boundaries up to
>>>>>> 128MB but still kernel tmpalias flushes didn't work on c8000.
>>>>>>
>>>>>> This led me to conclude that tmpalias flushes don't work on PA8800
>>>>>> and PA8900 machines, and that we needed to flush directly using the
>>>>>> virtual address of user and kernel pages. This is likely the major
>>>>>> cause of instability on the c8000 and rp34xx machines.
>>>>>>
>>>>>> Flushing user pages requires doing a temporary context switch as we
>>>>>> have to flush pages that don't belong to the current context. Furth=
er,
>>>>>> we have to deal with pages that aren't present. If a page isn't
>>>>>> present, the flush instructions fault on every line.
>>>>>>
>>>>>> Other code has been rearranged and simplified based on testing. For
>>>>>> example, I introduced a flush_cache_dup_mm routine. flush_cache_mm
>>>>>> and flush_cache_dup_mm differ in that flush_cache_mm calls
>>>>>> purge_cache_pages and flush_cache_dup_mm calls flush_cache_pages.
>>>>>> In some implementations, pdc is more efficient than fdc. Based on
>>>>>> my testing, I don't believe there's any performance benefit on the
>>>>>> c8000.
>>>>>>
>>>>>> V2:
>>>>>> 1) Add flush_cache_page_check_pte routine.
>>>>>> 2) Use it in copy_to_user_page and copy_from_user_page.
>>>>>> 3) flush_anon_page moved to cache.c and updated.
>>>>>> 4) Changed alias boundary to 64 MB for 64-bit kernels. Revised comm=
ent
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0 regarding alias boundary for PA8800/PA8900 proce=
ssors.
>>>>>>
>>>>>> 5) Removed struct mm_struct * argument from flush_cache_pages.
>>>>>> 6) Fixed thinko in flush_cache_range. It increased the number of pa=
ges
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0 flushed and slowed performance.
>>>>>>
>>>>>> 7) Removed sync changes from pacache.S.
>>>>>>
>>>>>> V3:
>>>>>> 1) copy_to_user_page and copy_from_user_page moved to cache.c to
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0 improve inlining.
>>>>>>
>>>>>> 2) Replaced copy_user_page with copy_user_highpage.
>>>>>> 3) Fixed cache threshold calculation on 32-bit kernels.
>>>>>> 4) Don't warn on inequivalent private mappings in flush_dcache_page=
.
>>>>>> 5) Return early from mm_total_size if size exceeds
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0 parisc_cache_flush_threshold.
>>>>>>
>>>>>> 6) Disable non-access TLB warning in handle_nadtlb_fault. Warning
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0 happens occassionally handling flushes for COW f=
aults.
>>>>>>
>>>>>> 7) Remove flush_cache_dup_mm.
>>>>>> 8) Flush entire cache in flush_cache_mm and flush_cache_range on
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0 processors with aliasing caches. Only flush smal=
l cache ranges
>>>>>> =C2=A0=C2=A0=C2=A0 on machines with PA8800/PA8900 processors.
>>>>>>
>>>>>> 9) Tested on rp3440, c8000 and c3750.
>>>>> Given how long these changelogs are, and how fragile the whole cachi=
ng is
>>>>> I
>>>>> think it is a good idea to split this patch into smaller ones, to im=
prove
>>>>> readability and being able to bisect it.
>>>> FWIW, I've done some cleanups to this patch and committed it to my fo=
r-next
>>>> tree. In case it's split up, please use the revised version.
>>> Why did you modify get_ptep()? Until now it was just moved around in t=
he file,
>>> and IMHO it becomes less readable because all these needless variables=
 are
>>> batched up at the start of the function now. The only point I would se=
e in
>>> moving them all to the front is if there would be no nesting anymore, =
and
>>> every condition was inverted:
>> Dave's original patch did not moved the variables to the beginning.
>> That change was me - just because checkpatch complained otherwise.
>>
>> I agree that it's less readable.
> The get_ptep code was originally based on the vmalloc_to_page code in vm=
alloc.c.
> vmalloc_to_page code.=C2=A0 This code has now changed, so I think get_pt=
ep needs updating.
> See get_old_pud in mremap.c.=C2=A0 It looks good to me.

So, what's the consense of this discussion now?

I can easily split out the pr_warn("WARNING").
Moving the get_ptep() back to the original place seems ok, and I'll keep
the strange indenting which checkpatch want.
Is that ok?

Helge

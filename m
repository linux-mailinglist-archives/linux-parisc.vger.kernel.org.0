Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 666A74F541D
	for <lists+linux-parisc@lfdr.de>; Wed,  6 Apr 2022 06:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239645AbiDFEEC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 6 Apr 2022 00:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445972AbiDEWWC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 5 Apr 2022 18:22:02 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 96BB1D4451
        for <linux-parisc@vger.kernel.org>; Tue,  5 Apr 2022 14:13:40 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 624AF5870031D69B
X-CM-Envelope: MS4xfN4xqDprShbZCgYa/Oh5kv3WX/TuBEMbkteyU71cq+cqt2UVkU9ZsEmo2sty2/5RXPU59npboB0udhXjm1fV1Le5vJDVgeKqqzAz3g7jdc3gPCpDDOqM
 Pul1AoYuRj/8qKECD/deWSXb28KV//SFAeV4iZ5KD8YPZNYJNz0aS2B12KhijTvgGZY4v5fPNJmfci+g5KVQOT9Q4MqlJTFGjspsMLzIlKOHVT84qHyHrabM
 tQFTS3uwi8An9CLpZ/yTanBhxmS1ChlM07mKHjANQe3tGJChTykEwduurTjLHrob
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=624cb0f9
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=7mOBRU54AAAA:8 a=FBHGMhGWAAAA:8 a=FFk6Qn2WtypZk9e6MTUA:9
 a=QEXdDO2ut3YA:10 a=wa9RWnbW_A1YIeRBVszw:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 624AF5870031D69B; Tue, 5 Apr 2022 17:13:29 -0400
Message-ID: <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
Date:   Tue, 5 Apr 2022 17:13:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
Content-Language: en-US
To:     Sam James <sam@gentoo.org>, linux-parisc@vger.kernel.org
Cc:     hppa@gentoo.org
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-03-22 1:52 p.m., Sam James wrote:
> In Gentoo, we've just got our hands on an RP3440 (PA8800) which seems to quite easily hit inequivalent aliasing issues.
>
> We've found that under some workloads, the machine copes fine, none of that appears in dmesg, and all is well - even for
> over a week. But as soon as we start other workloads (the problematic one is building "stages" -- release media for Gentoo),
> within 30m or so, the machine is in a broken state, with these messages flooding dmesg:
> ```
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42994000 and 0x426e1000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x426e1000 and 0x41b56000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41b56000 and 0x41aae000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41aae000 and 0x42774000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42774000 and 0x41202000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41202000 and 0x428dd000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41e2c000 and 0x418f6000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x418f6000 and 0x42980000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42980000 and 0x426cd000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x426cd000 and 0x41b42000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41b42000 and 0x41a9a000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41a9a000 and 0x42760000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42760000 and 0x411ee000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x411ee000 and 0x428c9000 in file bash
> ```
It seems all these messages result from a single call to flush_dcache_page.  Note the sequential behavior of old_addr
and addr, and message times.

Possibly, the VMA interval tree is corrupt, so the loop doesn't terminate properly.

         vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
                 offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
                 addr = mpnt->vm_start + offset;

                 /* The TLB is the engine of coherence on parisc: The
                  * CPU is entitled to speculate any page with a TLB
                  * mapping, so here we kill the mapping then flush the
                  * page along a special flush only alias mapping.
                  * This guarantees that the page is no-longer in the
                  * cache for any process and nor may it be
                  * speculatively read in (until the user or kernel
                  * specifically accesses it, of course) */

                 flush_tlb_page(mpnt, addr);
                 if (old_addr == 0 || (old_addr & (SHM_COLOUR - 1))
                                       != (addr & (SHM_COLOUR - 1))) {
                         __flush_cache_page(mpnt, addr, page_to_phys(page));
                         if (parisc_requires_coherency() && old_addr)
                                 printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %pD\n", old_addr, addr, mpnt->vm_file);
                         old_addr = addr;
                 }
         }

I see arm skips some VMAs:

         vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
                 unsigned long offset;

                 /*
                  * If this VMA is not in our MM, we can ignore it.
                  */
                 if (mpnt->vm_mm != mm)
                         continue;
                 if (!(mpnt->vm_flags & VM_MAYSHARE))
                         continue;
                 offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
                 flush_cache_page(mpnt, mpnt->vm_start + offset, page_to_pfn(page));
         }

Dave

-- 
John David Anglin  dave.anglin@bell.net


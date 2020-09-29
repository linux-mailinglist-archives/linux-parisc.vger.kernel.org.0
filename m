Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD20127D46D
	for <lists+linux-parisc@lfdr.de>; Tue, 29 Sep 2020 19:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgI2R0b (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 29 Sep 2020 13:26:31 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:42757 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727328AbgI2R0a (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 29 Sep 2020 13:26:30 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20200929172629.JAGH6892.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 29 Sep 2020 13:26:29 -0400
Received: from [192.168.2.49] (really [70.53.61.197]) by torspm01.bell.net
          with ESMTP
          id <20200929172629.NXPH29322.torspm01.bell.net@[192.168.2.49]>;
          Tue, 29 Sep 2020 13:26:29 -0400
Subject: Re: Page tables on machines with >2GB RAM
To:     Matthew Wilcox <willy@infradead.org>, linux-parisc@vger.kernel.org
References: <20200929153316.GG20115@casper.infradead.org>
 <20200929170130.GA21889@casper.infradead.org>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <ec43d0b5-a40b-28d4-4a31-3c841cd89820@bell.net>
Date:   Tue, 29 Sep 2020 13:26:29 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929170130.GA21889@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=XvWExmN9 c=1 sm=1 tr=0 a=6x1y2OhCX1CAR/Lk3lU3cg==:117 a=6x1y2OhCX1CAR/Lk3lU3cg==:17 a=IkcTkHD0fZMA:10 a=reM5J-MqmosA:10 a=FBHGMhGWAAAA:8 a=Re4hEekF_1z0shKhXhUA:9 a=msX20ZLytNJcccQs:21 a=vt_9WDnSVEnRm2wN:21 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfBGC8lE0b+/7jralFTgQRVv1ekD4Ns4jeRstI6nDPNvqPNrCosW/aommoIcv0E7XzXpgaOEMkfov6GDtV95EO8/P0ndvF6XdUKVMCHIO2K2XNsotdK5B HBDkgmoYXrkegDoz5BySFkEQtYobIc2DBmZpo6FzfIgKAiTW8C1iAqdSp/Y9I1sSn615nrnq/23Ikw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-09-29 1:01 p.m., Matthew Wilcox wrote:
> On Tue, Sep 29, 2020 at 04:33:16PM +0100, Matthew Wilcox wrote:
>> I think we can end up truncating a PMD or PGD entry (I get confused
>> easily about levels of the page tables; bear with me)
>>
>> /* NOTE: even on 64 bits, these entries are __u32 because we allocate
>>  * the pmd and pgd in ZONE_DMA (i.e. under 4GB) */
>> typedef struct { __u32 pgd; } pgd_t;
>> ...
>> typedef struct { __u32 pmd; } pmd_t;
>>
>> ...
>>
>>         pgd_t *pgd = (pgd_t *)__get_free_pages(GFP_KERNEL,
>>                                                PGD_ALLOC_ORDER);
>> ...
>>         return (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);
>>
>> so if we have more than 2GB of RAM, we can allocate a page with the top
>> bit set, which we interpret to mean PAGE_PRESENT in the TLB miss handler
>> and mask it off, causing us to load the wrong page for the next level
>> of the page table walk.
>>
>> Have I missed something?
> Yes, yes I have.
>
> We store the PFN, not the physical address.  So we have 28 bits for
> storing the PFN and 4 bits for the PxD bits, supporting 28 + 12 = 40 bits
> (1TB) of physical address space.
The comment in pgalloc.h says 8TB?  I think improving the description as to how this works
would be welcome.

-- 
John David Anglin  dave.anglin@bell.net


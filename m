Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11572705078
	for <lists+linux-parisc@lfdr.de>; Tue, 16 May 2023 16:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233567AbjEPOV3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 May 2023 10:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233755AbjEPOVP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 May 2023 10:21:15 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E67A8A7D
        for <linux-parisc@vger.kernel.org>; Tue, 16 May 2023 07:20:57 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.181.186.176]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 645C61A700787B30
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehledgjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpedvteefhedtgfevheegfedvueegtdelvdefteejleffhfefgefhffeggffggfejhfenucfkphepudegvddrudekuddrudekiedrudejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedugedvrddukedurddukeeirddujeeipdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprghuthhhpghushgvrhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhgvghokffrpeevtedpoffvtefjohhstheptghmgidqmhhtlhhrghhotddtud
X-CM-Envelope: MS4xfP4QAhFN1gt7cq04OxI2tLZyvM4bUU80yn++MrijeHaWpjl26cWjQLdfEkIoCB+X7Pcy8wpbOvpBBgTo6bCaN5b6rQvmT/w9FbBBQ7QWPQxDVIwH7Ccn
 tWHL5T60KX7upik3AZzuk/Ezvh7WoYiaN0H8jkhqC3Ugv1Q5xDoa8UnVLz6EVrIvVTTL4g/6g7K0kyfiRVYUyKOmAKXxStctj5cGdhWJ9stm9jlNvCk3dINy
 T+cz3anpbbibEYALZDoU+dUWPIsjmygOqnFZ/kNXYh2NtkHdLTAo7hFQsK2GAHJk
X-RazorGate-Vade-Verdict: clean 0
X-CM-Analysis: v=2.4 cv=W7Nb6Tak c=1 sm=1 tr=0 ts=6463913e
 a=4B+q39mD0Bm0IdZjDiNhQQ==:117 a=4B+q39mD0Bm0IdZjDiNhQQ==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=egWC_FjMbW91mSyE6FAA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.181.186.176) by cmx-mtlrgo001.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 645C61A700787B30; Tue, 16 May 2023 10:20:45 -0400
Message-ID: <0c0a6071-d518-4d6c-17be-934e5f1a1199@bell.net>
Date:   Tue, 16 May 2023 10:20:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] parisc: improve cach flushing in arch_sync_dma_for_cpu()
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <ZGJ8ZcPZbckX7VNB@p100>
 <4664024c-1312-64b5-5150-e60bf3fc49bb@bell.net>
 <7bcc14b4-408a-d884-a78c-b0436789e58d@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <7bcc14b4-408a-d884-a78c-b0436789e58d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-05-16 3:09 a.m., Helge Deller wrote:
> On 5/16/23 00:28, John David Anglin wrote:
>> On 2023-05-15 2:39 p.m., Helge Deller wrote:
>>> +    case DMA_BIDIRECTIONAL:
>>> +        flush_kernel_dcache_range(addr, size);
>>> +        purge_kernel_dcache_range_asm(addr, addr + size);
>> I don't think flush and purge are both needed.
>
> I'm not sure...
>
> Just to fully understand it. Is this short summary correct: ?
> - flush_kernel_dcache_range: flush cache back to memory, but keep data in cache.
No.  If present, fdc writes addressed cache line to memory if and only if line is dirty.  It
then invalidates line.  It does not keep data in cache.

Next read loads from memory.
>     Next read fetches the data which is still in the cache, thus the next
>     read doesn't checks if data in memory has been modified in the meantime (e.g. via DMA).
> - purge_kernel_dcache_range_asm: ignore currently cached data & drop any cached data in that range.
>     Even if cache has dirty memory which hasn't been written back yet, drop it and don't write back.
if present, pdc invalidates line.  At privilege level zero, an implementation may optionally write
back a dirty line to memory.  At non-zero privilege levels, fdc and pdc are effectively the same.

I don't know how to determine whether pdc does write back or not. It would be specified in processor
ERS.

>     Next read will fetch data from memory, thus return what DMA could have stored there.

Dave

-- 
John David Anglin  dave.anglin@bell.net


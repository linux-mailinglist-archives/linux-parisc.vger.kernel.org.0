Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4BCB709C04
	for <lists+linux-parisc@lfdr.de>; Fri, 19 May 2023 18:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjESQHR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 May 2023 12:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjESQHQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 May 2023 12:07:16 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-003.bell.net [209.71.212.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA60FFE
        for <linux-parisc@vger.kernel.org>; Fri, 19 May 2023 09:07:09 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.181.186.176]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6455BF200153BFC1
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeihedgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpedvteefhedtgfevheegfedvueegtdelvdefteejleffhfefgefhffeggffggfejhfenucfkphepudegvddrudekuddrudekiedrudejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedugedvrddukedurddukeeirddujeeipdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprghuthhhpghushgvrhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhgvghokffrpeevtedpoffvtefjohhstheptghmgidqthhorhhrghhotddtud
X-CM-Envelope: MS4xfGb9vOy5guLtdiSO8hqxZmQfKMojyDKJQdV2QaopK3DEcp5LG6p6oiNbF88g1FZq2f2oDBEwcFq+l9fJprTkF0brVxuP5P/zbINbwIn1OtschrlZPOvQ
 IV0jm9MJZvlAH0OHhJBQprZsFf7FAE9HFDlGP6wrdcfcVEY84u/QwlHLYtHI6DMeqBlFrJJaFfIyxnAejWm/iGFekSV/Hz8LZaf+H0ew/iNiuzvnlVQFH9j7
 i+95nJkyuvG3jHKm6aZ30eQ7aYbKi1Zbi2Ajg3FXwtKGEieBD8TxBNUl0NMz7qgn
X-RazorGate-Vade-Verdict: clean 0
X-CM-Analysis: v=2.4 cv=UM++oATy c=1 sm=1 tr=0 ts=64679eaa
 a=4B+q39mD0Bm0IdZjDiNhQQ==:117 a=4B+q39mD0Bm0IdZjDiNhQQ==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=Xtu8o_6jWEIk4Ip_fVAA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.181.186.176) by cmx-torrgo001.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 6455BF200153BFC1; Fri, 19 May 2023 12:07:06 -0400
Message-ID: <fe9e116a-a814-36f0-a4d0-fd5dbcb692f6@bell.net>
Date:   Fri, 19 May 2023 12:07:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] parisc: improve cach flushing in arch_sync_dma_for_cpu()
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <ZGJ8ZcPZbckX7VNB@p100>
 <4664024c-1312-64b5-5150-e60bf3fc49bb@bell.net>
 <7bcc14b4-408a-d884-a78c-b0436789e58d@gmx.de>
 <0c0a6071-d518-4d6c-17be-934e5f1a1199@bell.net> <ZGPEwk3JEc/skrBx@p100>
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <ZGPEwk3JEc/skrBx@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-05-16 2:00 p.m., Helge Deller wrote:
> * John David Anglin <dave.anglin@bell.net>:
>> On 2023-05-16 3:09 a.m., Helge Deller wrote:
>>> On 5/16/23 00:28, John David Anglin wrote:
>>>> On 2023-05-15 2:39 p.m., Helge Deller wrote:
>>>>> +    case DMA_BIDIRECTIONAL:
>>>>> +        flush_kernel_dcache_range(addr, size);
>>>>> +        purge_kernel_dcache_range_asm(addr, addr + size);
>>>> I don't think flush and purge are both needed.
>>> I'm not sure...
>>>
>>> Just to fully understand it. Is this short summary correct: ?
>>> - flush_kernel_dcache_range: flush cache back to memory, but keep data in cache.
>> No.  If present, fdc writes addressed cache line to memory if and only if line is dirty.  It
>> then invalidates line.  It does not keep data in cache.
>>
>> Next read loads from memory.
>>>      Next read fetches the data which is still in the cache, thus the next
>>>      read doesn't checks if data in memory has been modified in the meantime (e.g. via DMA).
>>> - purge_kernel_dcache_range_asm: ignore currently cached data & drop any cached data in that range.
>>>      Even if cache has dirty memory which hasn't been written back yet, drop it and don't write back.
>> if present, pdc invalidates line.  At privilege level zero, an implementation may optionally write
>> back a dirty line to memory.  At non-zero privilege levels, fdc and pdc are effectively the same.
>>
>> I don't know how to determine whether pdc does write back or not. It would be specified in processor
>> ERS.
> Thanks for the explanation!
> With that, I've attached an updated (untested) patch below.
Seems to work okay on c8000.  Don't know if it helps performance.

Dave
> [PATCH v2] parisc: improve cach flushing in arch_sync_dma_for_cpu()
>
> Add comment in arch_sync_dma_for_device() and handle the direction flag in
> arch_sync_dma_for_cpu().
>
> When receiving data from the device (DMA_FROM_DEVICE) unconditionally
> purge the data cache in arch_sync_dma_for_cpu().
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
> index ba87f791323b..71ed5391f29d 100644
> --- a/arch/parisc/kernel/pci-dma.c
> +++ b/arch/parisc/kernel/pci-dma.c
> @@ -446,11 +446,27 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
>   void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>   		enum dma_data_direction dir)
>   {
> +	/*
> +	 * fdc: The data cache line is written back to memory, if and only if
> +	 * it is dirty, and then invalidated from the data cache.
> +	 */
>   	flush_kernel_dcache_range((unsigned long)phys_to_virt(paddr), size);
>   }
>
>   void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>   		enum dma_data_direction dir)
>   {
> -	flush_kernel_dcache_range((unsigned long)phys_to_virt(paddr), size);
> +	unsigned long addr = (unsigned long) phys_to_virt(paddr);
> +
> +	switch (dir) {
> +	case DMA_TO_DEVICE:
> +	case DMA_BIDIRECTIONAL:
> +		flush_kernel_dcache_range(addr, size);
> +		return;
> +	case DMA_FROM_DEVICE:
> +		purge_kernel_dcache_range_asm(addr, addr + size);
> +		return;
> +	default:
> +		BUG();
> +	}
>   }


-- 
John David Anglin  dave.anglin@bell.net


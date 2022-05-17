Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA5F52A43C
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 16:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348422AbiEQOFb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 10:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348421AbiEQOFa (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 10:05:30 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-002.bell.net [209.71.208.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 61D3F4C78E
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 07:05:29 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 627CF32E0139DB0D
X-CM-Envelope: MS4xfJ7nWhQlyvWLsTfOqyaG5b3x2f81FDFWBaKvmYWoWyg1ePSjqOIZMlUu/fP2oSoGkaVwCqSSnM5AzgyC7zR9wh1dLwoR4JFawR7u20J7Ncb+IYjXm+A1
 Z5gr63ylAHeaWEt8GeTaG+HSGGpVIFt91SCu7KSgshOxuMdqaUmjj5/agvJcBsnDln6dUUu18Hj4lvX8Ckku7QFQ475PX+0BXlRmpDZR+pEzQMhBibg+Yn8s
 X0voZpNTEFgjmSamqgSfWEajr6/cujZC/EaOkriDZa25n8M5KoBkM5NbLXt9xtZyo+vyQtFqmpQhIsY6wOzzkAa5iv6oFoheRszQjqrKy+yL7uCG2uRSKaMn
 ZB98ANW3IA+dBeayTsfpNmhFB3Er5A==
X-CM-Analysis: v=2.4 cv=YYreWydf c=1 sm=1 tr=0 ts=6283aba3
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=x5izIYeS4UwojOwunX8A:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 627CF32E0139DB0D; Tue, 17 May 2022 10:05:23 -0400
Message-ID: <9baf3f90-0956-0e42-f2e1-2a4765faf417@bell.net>
Date:   Tue, 17 May 2022 10:05:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <4739001.31r3eYUQgx@eto.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <4739001.31r3eYUQgx@eto.sf-tec.de>
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

On 2022-05-17 9:06 a.m., Rolf Eike Beer wrote:
>> @@ -450,10 +452,12 @@ handle_nadtlb_fault(struct pt_regs *regs)
>>   		fallthrough;
>>   	case 0x380:
>>   		/* PDC and FIC instructions */
>> +#ifdef DEBUG_NATLB
>>   		if (printk_ratelimit()) {
>> -			pr_warn("BUG: nullifying cache flush/purge
> instruction\n");
>> +			pr_warn("WARNING: nullifying cache flush/
> purge instruction\n");
>>   			show_regs(regs);
>>   		}
>> +#endif
>>   		if (insn & 0x20) {
>>   			/* Base modification */
>>   			breg = (insn >> 21) & 0x1f;
> This surely deserves it's own commit as it has nothing to do with the actual
> change. I wonder if it is actually intended to go upstream or if this was just
> a local debug hack?
I changed "BUG" to "WARNING" and disabled the message because it triggers occasionally in spite of
the check in flush_cache_page_if_present.

The pte value extracted for the "from" page in copy_user_highpage is racy and occasionally the pte is
cleared before the flush is complete.  I assume that the page is simultaneously flushed by flush_cache_mm
before the pte is cleared as nullifying the fdc doesn't seem to cause problems.

I investigated various locking scenarios but I wasn't able to find a way to sequence the flushes.  This
code is called for every COW break and locks impact performance.

This is related to this patch because we need the pte on PA8800/PA8900 to flush using the vma context.

I have also seen this from copy_to_user_page and copy_from_user_page.

The messages appear infrequently when enabled.

Dave

-- 
John David Anglin  dave.anglin@bell.net


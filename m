Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6913949E735
	for <lists+linux-parisc@lfdr.de>; Thu, 27 Jan 2022 17:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbiA0QQm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 27 Jan 2022 11:16:42 -0500
Received: from mta-tor-004.bell.net ([209.71.212.31]:10718 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229487AbiA0QQm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 27 Jan 2022 11:16:42 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61E5E7EC00D9B576
X-CM-Envelope: MS4xfOum0baCeMHN7L33DWFKlZtuKlZUTwPvER+k2uZR/zhxFA2FPP/8DxK/GGsbRkctFxcDy36vLTCO15x4/DyEoJAKkn3a1S6suHPzsPZ31jVLMc5SMi/J
 /A5iFqFHYJiuAquoEc6rhMO4cfQ+dRtLSkWsaEyBA2KTWq6HdQZmxf0n8ryaTPMyh9Ck1+6ryWaZHpxRlp1XDHuKKGqfa1n8LkVGnLOd9HxDksI4HA/d4JS9
 iaEzY6a8GayqN5gE+z+b3R1G14zrpCZS60PKo9NjOCfueq7C0djaJVusFVaqTfNNo7HjGuAk4vXtmw/gHD9+ioAwhGvcJGcyXlhi9aAIKjSTqk6RHxJVtaq5
 EMPLLP3irFUCklHDP8W5zZZN31jv8A==
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61f2c563
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=QP3IOAiNRi9ulHnG1cMA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61E5E7EC00D9B576; Thu, 27 Jan 2022 11:16:35 -0500
Message-ID: <9cec8558-1b49-5f78-6424-2dd7daa408b7@bell.net>
Date:   Thu, 27 Jan 2022 11:16:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] parisc: Fix data TLB miss in sba_unmap_sg
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Cc:     Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YfGxafKxQdw8GhMc@mx3210.localdomain>
 <11910725.O9o76ZdvQC@eto.sf-tec.de>
 <09ccdfeb-f76b-41c8-a461-549314463f77@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <09ccdfeb-f76b-41c8-a461-549314463f77@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-01-27 1:58 a.m., Helge Deller wrote:
>>> diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
>>> index e60690d38d67..374b9199878d 100644
>>> --- a/drivers/parisc/sba_iommu.c
>>> +++ b/drivers/parisc/sba_iommu.c
>>> @@ -1047,7 +1047,7 @@ sba_unmap_sg(struct device *dev, struct scatterlist
>>> *sglist, int nents, spin_unlock_irqrestore(&ioc->res_lock, flags);
>>>   #endif
>>>
>>> -	while (sg_dma_len(sglist) && nents--) {
>>> +	while (nents && sg_dma_len(sglist)) {
>>>
>> What about:
>>
>> 	for (; nents && sg_dma_len(sglist); nents--) {
> The way how Dave wrote it is more clean, IMHO.
I'm going to leave the change to sba_iommu.c as proposed.  While i'm sure the suggested
for statement would be fine, I looked at how gcc handled the while loop.  It is quite subtle.
Except for an initial test and decrement, the iteration of nents is replaced by a calculation
of the the final value for sglist.

Regarding the newline, the file has several places where newlines precede #ifdef statements.
I think the current style is okay and checkpatch.pl doesn't object to that format.

I think whitespace changes should usually be in separate patches.

Dave

-- 
John David Anglin  dave.anglin@bell.net


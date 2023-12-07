Return-Path: <linux-parisc+bounces-161-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D34B4809682
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 00:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FD7C1C20AD4
	for <lists+linux-parisc@lfdr.de>; Thu,  7 Dec 2023 23:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F004B152;
	Thu,  7 Dec 2023 23:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJoSvK+M"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1591712
	for <linux-parisc@vger.kernel.org>; Thu,  7 Dec 2023 15:21:02 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d04dba2781so12790155ad.3
        for <linux-parisc@vger.kernel.org>; Thu, 07 Dec 2023 15:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701991261; x=1702596061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ojP+dw84rJoSbWff18+mFycgArGPAerA9MgsFA2H520=;
        b=TJoSvK+MPqJvQAB41cnSQIM/kloU/J3OVwuF1rVfNlNZgvWgr7qejzfy0JxlsZekRY
         cEWEQ889eZ6E1GNlc7lzbyDEzbB1wqNZJ1qp+JdWpH6hXjWaWIbggTdoC6LFVe1ng6Cq
         2/W5kJhDhAJX2vhqH/HG+8eHVIUMpZ0cz74yUXlgtgK5Q+T//kHganPkZrAcCRSSJVDw
         oevchtxtJ7c+RR9fwH9/o8aIqzEWMV9KbODBwz5xCtPjZATTIzrVxTvizx1Sgt4b572e
         hfJMnkczp9khymGXTZ5QxVGGZyAd1edBgeA2dwU0B51TKjJlIuC/hCgb+rsYe6vm5dLP
         g9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701991261; x=1702596061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojP+dw84rJoSbWff18+mFycgArGPAerA9MgsFA2H520=;
        b=Fuct0KTpa6q70eyA2cLA3dBakYpZz3r/T17xbPxQTMjfdtskxEExz72k5280JCr0Oi
         S16dGas/KJxgkOsUrzdp+j7RKlR9r4s9b/XUJKOwy8jZLSLKXG8QVJieTapl8bpcPVLh
         +AMK0CosQ0SrfkN40HNalThTEK9FiuIme6N34ZAxoXh2JtrM7+W7Mje9kdxjJK2GQIb1
         17TV8+OkpvR7y+v4WaN1k8g6RUwgndZPLl/I9KQWDLwiyjpaeT78hziU8WReD4FZxVd3
         UIBuMagElsKPvOLSyRBKiPE5sQuFhB+3CTr6swvQG+EBZxf5NUm2gRGKWAc4KLmYjqBF
         MaTw==
X-Gm-Message-State: AOJu0YzDwjjOSQlshn1pSXjfsK+v4g9KOSZEhwb1GxI/aXHjoINILLDS
	ZPDVFDqXygjxK24mqyIYO/A=
X-Google-Smtp-Source: AGHT+IGaZF1DLjn/eN9VpT1iYFic2QMwPV3FH4ePdA9+46g9+ZOMSOG5kGnwjga2PY3dsRdAJowCpQ==
X-Received: by 2002:a17:902:e749:b0:1cf:aff5:8934 with SMTP id p9-20020a170902e74900b001cfaff58934mr3044954plf.48.1701991261377;
        Thu, 07 Dec 2023 15:21:01 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f17-20020a170902ce9100b001cfb99d8b82sm350306plg.136.2023.12.07.15.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 15:21:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <564051f0-37f5-419e-9ac3-84f56f029209@roeck-us.net>
Date: Thu, 7 Dec 2023 15:20:25 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <17dc79fa-4a38-44ee-a8ea-b523b2d99b26@roeck-us.net>
 <a52d08a9-1114-4d0c-8d10-508d6d49627b@bell.net>
 <b1c864a0-cdda-409a-94c2-1a2cb827f7e1@gmx.de>
 <aeceb922-b6e9-4814-919e-6a82fb869f63@roeck-us.net>
 <6199c59b-1307-48c2-ae9a-254ab2d578c0@gmx.de>
 <0f9710fc-8246-4265-a32f-ebc4fa3eefde@roeck-us.net>
 <41052280-bb9f-4fa4-a3d4-ed23a1fcdbd1@gmx.de>
 <c56601c1-f89a-463a-93df-db93133e8315@roeck-us.net>
 <4b6ef6f3-c3db-48fe-a3ee-1d874d510c7e@gmx.de>
 <12740a29-5827-4a62-8acf-a7b1b14f7099@roeck-us.net>
 <11088c05-eaf8-48ca-8767-bc55e78e1350@gmx.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <11088c05-eaf8-48ca-8767-bc55e78e1350@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/7/23 13:47, Helge Deller wrote:
> (looping in Mark Cave-Ayland, since he did some work on qemu esp driver)
> 
> On 12/7/23 22:08, Guenter Roeck wrote:
>> Hi Helge,
>>
>> On 12/6/23 13:43, Helge Deller wrote:
>>> On 12/6/23 21:19, Guenter Roeck wrote:
>>>> On 12/6/23 09:00, Helge Deller wrote:
>>>> [ ... ]
>>>>>> Is it worth testing with multiple CPUs ? I can re-enable it and
>>>>>> check more closely if you think it makes sense. If so, what number
>>>>>> of CPUs would you recommend ?
>>>>>
>>>>> I think 4 CPUs is realistic.
>>>>> But I agree, that you probably see more issues.
>>>>>
>>>>> Generally the assumption was, that the different caches on parisc
>>>>> may trigger SMP issues, but given that those issues can be seen on
>>>>> qemu, it indicates that there are generic SMP issues too.
>>>>>
>>>>
>>>> Ok, I ran some tests overnight with 2-8 CPUs. Turns out the system is quite
>>>> stable,
>>>
>>> cool!
>>>
>>>> with the exception of SCSI controllers. Some fail completely, others
>>>> rarely. Here is a quick summary:
>>>>
>>>> - am53c974 fails with "Spurious irq, sreg=00", followed by "Aborting command"
>>>>    and a hung task crash.
>>>> - megasas and megasas-gen2 fail with
>>>>    "scsi host1: scsi scan: INQUIRY result too short (5), using 36"
>>>>    followed by
>>>>    "megaraid_sas 0000:00:04.0: Unknown command completed!"
>>>>    and a hung task crash
>>>> - mptsas1068 fails completely (no kernel log message seen)
>>>> - dc390 and lsi* report random "Spurious irq, sreg=00" messages and timeouts
>>>
>>> I think none of those drivers have ever been tested
>>> on physical hardware either.
>>> So I'm astonished that it even worked that far :-)
>>>
>> I actually do have a dc390 board somewhere. I used it some time ago to improve
>> the emulation.
> 
> Do you have a physical hppa box too?
> 

No, I used that on an old PC with "real" PCI slots.

>>> Based on kernel sources, the "Spurious irq, sreg=%02x." error can only happen for the
>>> am53c974 driver. Are you sure you see this message for dc390 and lsi* too?
>>>
>> am53c974 and dc390 use the same driver. lsi* doesn't, and doesn't have a problem
>> either. Sorry, I confused that with some old notes.
>>
>> Either case, I think I found the problem. After handling an interrupt, the Linux
>> driver checks if another interrupt is pending. It does that by checking the
>> DMA_DONE bit in the DMA status register. If that bit is set, it re-enters the
>> interrupt handler. Problem with that is that the emulation sets DMA_DONE
>> prematurely, before it sets the command done bit in the interrupt status register
>> and before it sets the interrupt pending bit in the status register. As result,
>> DMA_DONE is set but IRQ_PENDING isn't, and the spurious interrupt is reported.
>> I fixed that up in my code and will test it for some time and with various
>> architectures before I send a patch.
> 
> Thanks for testing.
> But I wonder if the Linux kernel driver needs (on physical hardware!) some more
> cache flushing too. I see it uses dma_alloc_coherent(), but I don't see
> dma_sync_single_for_device() or dma_sync_sg_for_cpu().
> Those are needed for dma on hppa...
> 

Ah, testing that is beyond my capabilities. All I know is that it worked fine on
an old PC running Linux.

Guenter



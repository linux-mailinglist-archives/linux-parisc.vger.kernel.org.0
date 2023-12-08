Return-Path: <linux-parisc+bounces-165-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B8780A9E2
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 17:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 281B61F21008
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 16:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2767E37151;
	Fri,  8 Dec 2023 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIpbmGXz"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3FBBA
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 08:58:44 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3b9dc3215d2so1207884b6e.0
        for <linux-parisc@vger.kernel.org>; Fri, 08 Dec 2023 08:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702054724; x=1702659524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8pElGRGKspE/BuMs+kJkkdFonG3hYaHABz1CCxyXuP0=;
        b=GIpbmGXzCRnVSovjEQSGzLAmVexGCPqjU5ASe+XlSkjjxAAZ8paaIyIBYjeoIefolK
         ASTxAEJvwGaZATNwyXEp372F4SYZIk8brnYiriGMZzWeweXdcoFrkCGsmCZjm5rnmQ5X
         +1GvD/0UIGjFTAxh/4+xadcL73UMWl7a1pqGsEzR8xSDmDFyElGcu0mg0EOE5MRjT2IT
         KGSosH+US0S9FZfY0S1WWYsRbjtLR/6qq5erjsdgxF8bOAk7+B0Z8BM/D0LDRCPkeWl1
         o/MaMiPIeSjQsMYwCHjiGKA6VreY+g0lSEMSgLndMxBnCQkwgVzyHb5cVqKCvBqDC8uu
         +xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702054724; x=1702659524;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pElGRGKspE/BuMs+kJkkdFonG3hYaHABz1CCxyXuP0=;
        b=dl6FQyxewrxf86IlbWxL4YV/7AZhJmSyAqx6tkcCOc2seQ70RMw6lXwjazgOeRXe7O
         1xH6KC6q5SKhawDPbQg6EdbssixRAUS3Nip1i+Yi4FenBcY3DRpt9AFtyo2VdDR7CU/5
         OYEbAUIKyAWv7zKAr56dCnWoPzJNC/fJ2bMETSUEOECva6UjlMGcHxywaL2bGJ/Wj7O9
         y/jnT2/9KjjzwSn0sfu4gwDgIv6CsmcoUG/O3fyvL8MM/Id4i1SMZgj+gWtKBguK6gVM
         8kp+8hrF06LPcNpuXw2O9OyExYWmw+hHYI9c7s3K6iiRlsYYGY9xIqS8wLNnoOy7ph/h
         RQWA==
X-Gm-Message-State: AOJu0YwrKs8H3xbLy3jeUrvrU5BJezESGnYRvjCNxhzoJPk+v770YZGM
	98B1jIhqH2f+707k83tOFqtHRinrcRM=
X-Google-Smtp-Source: AGHT+IGasz8rbNI/I/vLuI1aJGSQnETuufQ+cftFV+66pzihpb7aRxG3tzAlgH1pGLUN49imjJ0Stw==
X-Received: by 2002:a05:6808:169e:b0:3b8:b3b4:679e with SMTP id bb30-20020a056808169e00b003b8b3b4679emr351633oib.39.1702054724198;
        Fri, 08 Dec 2023 08:58:44 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bx33-20020a0568081b2100b003b2f2724c48sm381990oib.11.2023.12.08.08.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 08:58:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8d6e8a92-ae68-4150-b25a-1d371120e6cf@roeck-us.net>
Date: Fri, 8 Dec 2023 08:58:41 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
Content-Language: en-US
To: Helge Deller <deller@gmx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John David Anglin <dave.anglin@bell.net>,
 Parisc List <linux-parisc@vger.kernel.org>
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
 <9e5599dc-06ba-47ca-bdc1-8b612694a95e@ilande.co.uk>
 <5d811129-ca84-4f7f-bbc6-8f5fa0ce06c0@roeck-us.net>
 <55d40485-2aff-4cf5-a379-623bb3b10b7f@gmx.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <55d40485-2aff-4cf5-a379-623bb3b10b7f@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/8/23 07:54, Helge Deller wrote:
[ ... ]

>> FWIW, the change I made to fix the spurious interrupt problem is
>>
>> diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
>> index 6794acaebc..f624398c55 100644
>> --- a/hw/scsi/esp-pci.c
>> +++ b/hw/scsi/esp-pci.c
>> @@ -286,9 +286,6 @@ static void esp_pci_dma_memory_rw(PCIESPState *pci, uint8_t *buf, int len,
>>       /* update status registers */
>>       pci->dma_regs[DMA_WBC] -= len;
>>       pci->dma_regs[DMA_WAC] += len;
>> -    if (pci->dma_regs[DMA_WBC] == 0) {
>> -        pci->dma_regs[DMA_STAT] |= DMA_STAT_DONE;
>> -    }
>>   }
>>
>> I tested that with several platforms. There are no more spurious interrupts
>> after that change, and no other errors either.
>>
>> Regarding TC after reading the interrupt register, I carry the following
>> patch locally.
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index 9b11d8c573..f0cd8705a7 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -986,7 +986,7 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>>            */
>>           val = s->rregs[ESP_RINTR];
>>           s->rregs[ESP_RINTR] = 0;
>> -        s->rregs[ESP_RSTAT] &= ~STAT_TC;
>> +        // s->rregs[ESP_RSTAT] &= ~STAT_TC;
>>
>> The comment above that code says "Clear sequence step, interrupt register
>> and all status bits except TC", which is quite the opposite of what the code
>> is doing because it clears TC and nothing else. I never spent the time
>> trying to figure out how to fix that properly; clearing the other bits
>> like the comment suggests doesn't work (STAT_INT needs to be set for
>> esp_lower_irq() to work, and clearing the other bits results in transfer
>> failures).
> 
> Does qemu-hppa boot for you with those patches?

Yes, tested with both 32 bit and 64 bit kernels.

> Even with those I see the discs are found, but later I get:
> [    8.519780] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787975: comm swapper/0: iget: checksum invalid
> [    8.545363] Starting init: /sbin/init exists but couldn't execute it (error -67)
> [    8.546339] Run /etc/init as init process
> [    8.561422] Run /bin/init as init process
> [    8.574649] Run /bin/sh as init process
> [    8.580495] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787980: comm swapper/0: iget: checksum invalid
> [    8.586170] Starting init: /bin/sh exists but couldn't execute it (error -67)

-67 is EBADMSG on parisc which is used by ext4 for "Bad CRC detected",
so that matches the "checksum invalid" message. I don't see that
with my root file system, but then mine is a simple ext2 file system.
I'll generate an ext4 root file system and let you know how that goes.

Guenter



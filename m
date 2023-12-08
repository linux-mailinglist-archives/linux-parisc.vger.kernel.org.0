Return-Path: <linux-parisc+bounces-166-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CB80AC82
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 19:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A0E51F21006
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 18:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AD141230;
	Fri,  8 Dec 2023 18:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=ilande.co.uk header.i=@ilande.co.uk header.b="yIyMjc5R"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail.ilande.co.uk (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC50611F
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 10:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=paYW0gl/KPX4UI5+0VmrkQJr3zdxSJwsITOe1TqwH48=; b=yIyMjc5RwWMULNCdERidXlANWC
	KAIIN1mdssxehwqDcdsNYQmDGlqtcZ4Aefjchz3gYe5BmdpnLwwSNBeq/bhBuxs0W/0P1JedtYfHv
	eD1K5tekonLefGNlSJx9ZmnX+gOHu/5cH8qUoOp02VfSOUi2KJr3yytrQLlUFchNx6smI1dQ8gqHE
	oWGS2JM8o5aLOC0PyTJ5YaPELk4+GilMlq6KHgbDF2NRkYLJixKnmXkEOYU/t/5TT+2k3NM5OLkAr
	NeW7E8jerbvE/efstX1879A1o4jEvioDdOlN8yy3Zvm35ev7i7HfAqvDPOfocsMWd1iAQ6YW7ozWi
	NGwoQ+8bb+7QLuDKkdRG9yataZIkW10HufEznC6HDLoumLNO1H0YK0R0wmeci7YmTARrlTuAnzJQC
	OfY0BTIKXzHApIknxdiYAqpMp7IcfcDIgWKU0puYh2iEcbsvjhWNTEgDte7jCnv8REMXnJK7V/laj
	mff+VfoqSFM9CG6IrfZMcCuBq5MJCIKj8ztEQKZ3D5+7eJ7Tt18f4B5YKDVbVYuE3b6ns91M5s8kW
	t+UXLPNUYha9keu9ATCflRs5rEMIRy6GLWXa+QgIqVV+jQbNDp0kVpTEr3mDp08Mq/H84AFagtyiC
	SXGGiLKjrM1oTBhP9IRj3lq7E/1VnizNC9frQkraE=;
Received: from [2a00:23c4:8bb0:f100:9601:9e38:9395:46ea]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1rBfyJ-0008YT-L2; Fri, 08 Dec 2023 18:53:15 +0000
Message-ID: <97729a4b-5ef7-42ad-897d-a57cd9a5a5bf@ilande.co.uk>
Date: Fri, 8 Dec 2023 18:53:26 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Guenter Roeck <linux@roeck-us.net>, Helge Deller <deller@gmx.de>,
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
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
In-Reply-To: <5d811129-ca84-4f7f-bbc6-8f5fa0ce06c0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb0:f100:9601:9e38:9395:46ea
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Level: 
Subject: Re: 64-bit userspace root file system for hppa64
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

On 08/12/2023 14:58, Guenter Roeck wrote:

> On 12/8/23 00:01, Mark Cave-Ayland wrote:
>> On 07/12/2023 21:47, Helge Deller wrote:
>>
>>> (looping in Mark Cave-Ayland, since he did some work on qemu esp driver)
>>
>> Thanks for the ping!
>>
>>> On 12/7/23 22:08, Guenter Roeck wrote:
>>>> Hi Helge,
>>>>
>>>> On 12/6/23 13:43, Helge Deller wrote:
>>>>> On 12/6/23 21:19, Guenter Roeck wrote:
>>>>>> On 12/6/23 09:00, Helge Deller wrote:
>>>>>> [ ... ]
>>>>>>>> Is it worth testing with multiple CPUs ? I can re-enable it and
>>>>>>>> check more closely if you think it makes sense. If so, what number
>>>>>>>> of CPUs would you recommend ?
>>>>>>>
>>>>>>> I think 4 CPUs is realistic.
>>>>>>> But I agree, that you probably see more issues.
>>>>>>>
>>>>>>> Generally the assumption was, that the different caches on parisc
>>>>>>> may trigger SMP issues, but given that those issues can be seen on
>>>>>>> qemu, it indicates that there are generic SMP issues too.
>>>>>>>
>>>>>>
>>>>>> Ok, I ran some tests overnight with 2-8 CPUs. Turns out the system is quite
>>>>>> stable,
>>>>>
>>>>> cool!
>>>>>
>>>>>> with the exception of SCSI controllers. Some fail completely, others
>>>>>> rarely. Here is a quick summary:
>>>>>>
>>>>>> - am53c974 fails with "Spurious irq, sreg=00", followed by "Aborting command"
>>>>>>    and a hung task crash.
>>>>>> - megasas and megasas-gen2 fail with
>>>>>>    "scsi host1: scsi scan: INQUIRY result too short (5), using 36"
>>>>>>    followed by
>>>>>>    "megaraid_sas 0000:00:04.0: Unknown command completed!"
>>>>>>    and a hung task crash
>>>>>> - mptsas1068 fails completely (no kernel log message seen)
>>>>>> - dc390 and lsi* report random "Spurious irq, sreg=00" messages and timeouts
>>>>>
>>>>> I think none of those drivers have ever been tested
>>>>> on physical hardware either.
>>>>> So I'm astonished that it even worked that far :-)
>>>>>
>>>> I actually do have a dc390 board somewhere. I used it some time ago to improve
>>>> the emulation.
>>>
>>> Do you have a physical hppa box too?
>>>
>>>>> Based on kernel sources, the "Spurious irq, sreg=%02x." error can only happen 
>>>>> for the
>>>>> am53c974 driver. Are you sure you see this message for dc390 and lsi* too?
>>>>>
>>>> am53c974 and dc390 use the same driver. lsi* doesn't, and doesn't have a problem
>>>> either. Sorry, I confused that with some old notes.
>>>>
>>>> Either case, I think I found the problem. After handling an interrupt, the Linux
>>>> driver checks if another interrupt is pending. It does that by checking the
>>>> DMA_DONE bit in the DMA status register. If that bit is set, it re-enters the
>>>> interrupt handler. Problem with that is that the emulation sets DMA_DONE
>>>> prematurely, before it sets the command done bit in the interrupt status register
>>>> and before it sets the interrupt pending bit in the status register. As result,
>>>> DMA_DONE is set but IRQ_PENDING isn't, and the spurious interrupt is reported.
>>>> I fixed that up in my code and will test it for some time and with various
>>>> architectures before I send a patch.
>>
>> I'm actually in the process of putting the finishing touches to a large rewrite of 
>> QEMU's core ESP emulation since there are a number of known issues with the 
>> existing version. In particular there are problems with the SCSI phase being set 
>> incorrectly after reading ESP_INTR and ESP_RSTAT's STAT_TC not being correct. Note 
>> that this is just the ESP core rather than the ESP PCI device.
>>
>> If you are interested, I could try and find a few minutes to tidy it up a bit more 
>> and push a testing branch to Github?
>>
> 
> Sure, I'll be happy to give your changes a try.
> 
> FWIW, the change I made to fix the spurious interrupt problem is
> 
> diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
> index 6794acaebc..f624398c55 100644
> --- a/hw/scsi/esp-pci.c
> +++ b/hw/scsi/esp-pci.c
> @@ -286,9 +286,6 @@ static void esp_pci_dma_memory_rw(PCIESPState *pci, uint8_t *buf, 
> int len,
>       /* update status registers */
>       pci->dma_regs[DMA_WBC] -= len;
>       pci->dma_regs[DMA_WAC] += len;
> -    if (pci->dma_regs[DMA_WBC] == 0) {
> -        pci->dma_regs[DMA_STAT] |= DMA_STAT_DONE;
> -    }
>   }
> 
> I tested that with several platforms. There are no more spurious interrupts
> after that change, and no other errors either.

I suspect that this is papering over the real issue, since it appears the code being 
removed sets the DMA completion bit when then the PCI DMA transfer counter reaches zero.

> Regarding TC after reading the interrupt register, I carry the following
> patch locally.
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 9b11d8c573..f0cd8705a7 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -986,7 +986,7 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>            */
>           val = s->rregs[ESP_RINTR];
>           s->rregs[ESP_RINTR] = 0;
> -        s->rregs[ESP_RSTAT] &= ~STAT_TC;
> +        // s->rregs[ESP_RSTAT] &= ~STAT_TC;
> 
> The comment above that code says "Clear sequence step, interrupt register
> and all status bits except TC", which is quite the opposite of what the code
> is doing because it clears TC and nothing else. I never spent the time
> trying to figure out how to fix that properly; clearing the other bits
> like the comment suggests doesn't work (STAT_INT needs to be set for
> esp_lower_irq() to work, and clearing the other bits results in transfer
> failures).

Yeah that's one of the many bugs which should be fixed by my latest series. I've 
pushed the current version of my branch with the ESP rewrite to 
https://github.com/mcayland/qemu/tree/esp-rework-testing if you would both like to 
give it a test.


ATB,

Mark.



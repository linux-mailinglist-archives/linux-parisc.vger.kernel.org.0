Return-Path: <linux-parisc+bounces-160-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C38094DF
	for <lists+linux-parisc@lfdr.de>; Thu,  7 Dec 2023 22:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7365281FE8
	for <lists+linux-parisc@lfdr.de>; Thu,  7 Dec 2023 21:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC73C840CA;
	Thu,  7 Dec 2023 21:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="BAxQMnuW"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B79A9
	for <linux-parisc@vger.kernel.org>; Thu,  7 Dec 2023 13:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1701985651; x=1702590451; i=deller@gmx.de;
	bh=M2iw/FwLVLgZsTLvqI5B2D0X6g5AYsh8wB/z/EWNHDk=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=BAxQMnuWDencga9K4F2bpoEtKrpzAbncaaoq7GWfY2XsoHvt0mdFiunOohw+3agX
	 ZlV7YKCNXP2lK/KOPpW1HkTCsLHjLSBUPwvhpsT+VKMGG7ptzQIEvd0SFkvKlBopJ
	 38O+WFpfb44ntpQpciLC4/0NudbzWrbSQ6FJbGAzr5S34rdLuefEa8DWnIFgT5W1K
	 /jZGSDLoxF21u4miMLgkaErUJqD4+sF4vKq1laCyePHjX6XbIkbN9IZ5S321fo1q9
	 pDF+Mbkb+ShCBS2QsM4yzV0q3MWYWgJi0yap09On1Lj57uLeeAgYYSkYe9g+bEL/k
	 dBXldUyXDYHFbuXmOQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.146.189]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwwZd-1rQfAu2cUF-00yQNH; Thu, 07
 Dec 2023 22:47:31 +0100
Message-ID: <11088c05-eaf8-48ca-8767-bc55e78e1350@gmx.de>
Date: Thu, 7 Dec 2023 22:47:30 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
To: Guenter Roeck <linux@roeck-us.net>,
 John David Anglin <dave.anglin@bell.net>,
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
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <12740a29-5827-4a62-8acf-a7b1b14f7099@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6AO3zd3NrM8vIklhxgwO4MDudz9jktl44HT+8I8HdY5cYkdAyNx
 ta5Y62lWdoTYby5JREwDoBFuBclEAPi7SoljM7TZ+AiUxB019zqYxHWeYwvsnJQOmgBEhoL
 CNDl43B7Lra2pYFZBW9ycrYtbsKIF1JpPfJNs5+zfbuE0qkYPKXgmPlMuLUZ5p5LHah3D7a
 l4EsEbtJLFZOBNOPR8CvQ==
UI-OutboundReport: notjunk:1;M01:P0:yiXP7JRN2oo=;dWhBpeSzQVLUeKGAN3bVUNCiHYf
 2rdsOpAOAGx1Nuas6DtM+JS9Hg4WAlDybbwvQQTh0fPte7Buj3RWEcJ4fP6Kf2W2046BkziOJ
 aHKvdPIvp2lj8NJJOHbioxE7ZMH+aR/Iw8Q2nt38yENaoMi9J5wT1TtJVkh/wcxMODvlEhfPB
 jX+/0Jt2QNEK3XgVWKYy6REDH55XBQijOjpHEro8m0TbhKw20480vlNg7AUM20CZi2CCZ9tcn
 FxXfQ7Xm6HgQ3DHDeM+KZkS2qplkOKnNkX4Z8wN2+3Y6+J0ZRl+eUJNL3sklpeML9+UbDXd/V
 pwyewLmDLwrLAtfTpBmVCblRu028IeP/qThK2NroGV+MSohlXD2pGqXvTk+9FXXEBaFKB7nNQ
 7dJ0Lp9iViNWZEHbL/ApLGvkJOXQ2EwgACb4eujn74Qc5R9G/mU1Kajxn7TlxHP5O62tm+1Dn
 9sKTTlVQmGs6iv/0zM0wCW+efc/q9dLojlstKiWUM9LC0mnuOjHilARwtAqcpvnC+0wDwX5zR
 jS4pWdxqzLuhBe9YlSMbU/Td7WlIS8JcJF16fseCFgNfxKBTXr1Q8SuzdWnEbqcL/uP6S+YMf
 Z6b6WsgxupU7s7egrsK86e1d4vS8zl7ejGavLFn7TmjEj2i7wAet5RbcvAhUZgtaWZwQ9c5KK
 w8hUekqzKx+NOnrtPqF/a7H4IRwwHDtWdaVu7IofLJ7a40k5IRNzaHzHmuxgEmyLftd0NvT3A
 1ROCpasCC5y+V75cPpBv0zbsWyI+r0LGRpVjPen3jpoMxYAlthGpvBmjWJJg2bicnF8TP3pdi
 6dj9JSOOmeoj7NMZG/Q5XayMO4VF5omEGWXDnZzgUqen7QjpbH7kzoXpIf9YTFM/Rlhed//GG
 Dor3zKvLFIe9fsaieOdYxEW0DifD7XfNVqiR7JbcE4RFLkr2gkK8O/lgYymwKtrgKrGdpx6Ju
 BriLquwgwvGRlFB2nwCrzmm2j2Y=

(looping in Mark Cave-Ayland, since he did some work on qemu esp driver)

On 12/7/23 22:08, Guenter Roeck wrote:
> Hi Helge,
>
> On 12/6/23 13:43, Helge Deller wrote:
>> On 12/6/23 21:19, Guenter Roeck wrote:
>>> On 12/6/23 09:00, Helge Deller wrote:
>>> [ ... ]
>>>>> Is it worth testing with multiple CPUs ? I can re-enable it and
>>>>> check more closely if you think it makes sense. If so, what number
>>>>> of CPUs would you recommend ?
>>>>
>>>> I think 4 CPUs is realistic.
>>>> But I agree, that you probably see more issues.
>>>>
>>>> Generally the assumption was, that the different caches on parisc
>>>> may trigger SMP issues, but given that those issues can be seen on
>>>> qemu, it indicates that there are generic SMP issues too.
>>>>
>>>
>>> Ok, I ran some tests overnight with 2-8 CPUs. Turns out the system is =
quite
>>> stable,
>>
>> cool!
>>
>>> with the exception of SCSI controllers. Some fail completely, others
>>> rarely. Here is a quick summary:
>>>
>>> - am53c974 fails with "Spurious irq, sreg=3D00", followed by "Aborting=
 command"
>>> =C2=A0=C2=A0 and a hung task crash.
>>> - megasas and megasas-gen2 fail with
>>> =C2=A0=C2=A0 "scsi host1: scsi scan: INQUIRY result too short (5), usi=
ng 36"
>>> =C2=A0=C2=A0 followed by
>>> =C2=A0=C2=A0 "megaraid_sas 0000:00:04.0: Unknown command completed!"
>>> =C2=A0=C2=A0 and a hung task crash
>>> - mptsas1068 fails completely (no kernel log message seen)
>>> - dc390 and lsi* report random "Spurious irq, sreg=3D00" messages and =
timeouts
>>
>> I think none of those drivers have ever been tested
>> on physical hardware either.
>> So I'm astonished that it even worked that far :-)
>>
> I actually do have a dc390 board somewhere. I used it some time ago to i=
mprove
> the emulation.

Do you have a physical hppa box too?

>> Based on kernel sources, the "Spurious irq, sreg=3D%02x." error can onl=
y happen for the
>> am53c974 driver. Are you sure you see this message for dc390 and lsi* t=
oo?
>>
> am53c974 and dc390 use the same driver. lsi* doesn't, and doesn't have a=
 problem
> either. Sorry, I confused that with some old notes.
>
> Either case, I think I found the problem. After handling an interrupt, t=
he Linux
> driver checks if another interrupt is pending. It does that by checking =
the
> DMA_DONE bit in the DMA status register. If that bit is set, it re-enter=
s the
> interrupt handler. Problem with that is that the emulation sets DMA_DONE
> prematurely, before it sets the command done bit in the interrupt status=
 register
> and before it sets the interrupt pending bit in the status register. As =
result,
> DMA_DONE is set but IRQ_PENDING isn't, and the spurious interrupt is rep=
orted.
> I fixed that up in my code and will test it for some time and with vario=
us
> architectures before I send a patch.

Thanks for testing.
But I wonder if the Linux kernel driver needs (on physical hardware!) some=
 more
cache flushing too. I see it uses dma_alloc_coherent(), but I don't see
dma_sync_single_for_device() or dma_sync_sg_for_cpu().
Those are needed for dma on hppa...

Helge


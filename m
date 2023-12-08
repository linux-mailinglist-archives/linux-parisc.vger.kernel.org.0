Return-Path: <linux-parisc+bounces-164-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B880A7F3
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 16:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F15631F21023
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 15:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A69232C97;
	Fri,  8 Dec 2023 15:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="KN/0bdCH"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E193E10CF
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 07:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702050842; x=1702655642; i=deller@gmx.de;
	bh=B3IwRa71Y2qabkOt61Uxy09RPbC3RYippnM5KZAxTLQ=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=KN/0bdCHmsnecP8s8nwk8hdBYwAMTi2DqjTgBxfQY8IeXThchGaoLRL+vibkz2qH
	 wQyPhk44Ndo4BSoOaQ8OKdeTErVo7wHxpgwJh7uHuJs/QTXtKlqowSjS+jWforTrI
	 YZLZi8/R9ouwUMCWn+ORJ56MwQxiPbwNghhyuOk0E220DZ2I9Eg/WIanX1oJXZkIw
	 0x2k9Dgjz68ZURIaZysktiC5hAAP9LNaALksOZbyk+rviRiBEiPf7OyHU/XgkbWiq
	 /Gb2dZX61rT5AIR8VBKvJcvUjkTwFgEQSpHlYwQC4kUTm4amikfpKxfhtqV4ZMK1Q
	 M/LjVAf8CyhVuYPefw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.158.195]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQnP-1r1ORL2Bo5-00GuOn; Fri, 08
 Dec 2023 16:54:02 +0100
Message-ID: <55d40485-2aff-4cf5-a379-623bb3b10b7f@gmx.de>
Date: Fri, 8 Dec 2023 16:54:01 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
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
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <5d811129-ca84-4f7f-bbc6-8f5fa0ce06c0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CHEmUcHRmSWHhz5RhuJ99bG5nquuO94KeZLkqYrQkj/OWii/lVF
 e0Yyfpjd7mpo/13PJW932kk/lLQFft48W/FsVOe4fpNZtkeq7UdCaBHazOC24BLp6vt3jho
 YXPZcJ7oDkZInVucrPMtfqaon6dMLV9ocLh0ypjKaYzvMJxJB5YXoYsvrMQ/m+9vtQpuN9y
 lgwlh8id1n4VNUyeZwm0Q==
UI-OutboundReport: notjunk:1;M01:P0:uATFEQ4thEc=;3ymq4nRV8Zxye0Re1oTPcD7lC41
 rVWVtRIjX3pLlkJyDtUWcDfSGLCWKDFxGYnb778hEqZ3f1CQaU+gnghtWDEgTP1bAbVcY2Ga7
 NqOSPi1fH+Oho1np5TmucDVC3wmuirYGmKBSJhaycJ6IAvzD5SRSeJZEVCQa8gzxBBgB82Z0v
 ry7Yz0FT4vhb6Kxl/Gm6Up8eavN4PCc+osyuWAmk7M4w+QmMlS2OpKznFPrSnHs3bV9pnykXb
 zlOPnkzUy9Y1gekn8qRyCoOwZW/z+Mo2i9W7rV0UdCBSl9zvfIFoHh67pm0/srSmpyRwyGVYU
 tYYFTLs6RerHYIQoK7vQX1vP4mJLRfeXAq8N1jz1h0gkEjQrCzArwLMSq/Lbrci4f8Igv3soB
 PFf6MxGGaEB26yThYktlSDZNq7XmWDb6UOisHEVe5tJJ2pAhdc0ITj9rUVM1plHzVSlzTTr8p
 iaOzdNDuim/4gOewf6LStdFsmexGfUVR6RmpJQsk1kzpnHtolA5srWmvZIpgm4i1RoeijhKoB
 1haoHyrbB70D5z6S9k630LQFp7/sv52aq1aV8k27E5xXU4r8kll/94q1xLsF5kNWcArZkkvkF
 2ZyG0K5MDHdxU5NMDTF4n7hJOqFPKpzCdX7VILuc4mFAN/WvM0HxVYCKuclffvXhxhLeq8OvR
 yLehrrxw3Fw+k3Uta+OJXYdw2a2qPRvTfUEVSgv6/qEGFOeilzNilPHMjFZKLPi+x+qk8k+kz
 6DFQCc/q86fl2d9S3sCWyXDKEoMNwsZBsdp2Ubk/j8Ap6ZwOFmDZFSFlSuYugJSnBaiv7bWgv
 gqS+pa/5czSU/BLgvEF4Ax7vI8LD5kvruuwdeesLdelmX8WMKoJKQtQo70ayTvBpAG7QEnW8R
 8GZ4mDbqKuCXfu9UhOsucMIEOyl/GO0i6MIyc+iHf0OfegonB5FjAMjxWCR+1cvAoac62F7bn
 fSLsjYM21cO+sDYhW+XoAdaiOcQ=

On 12/8/23 15:58, Guenter Roeck wrote:
> On 12/8/23 00:01, Mark Cave-Ayland wrote:
>> On 07/12/2023 21:47, Helge Deller wrote:
>>
>>> (looping in Mark Cave-Ayland, since he did some work on qemu esp drive=
r)
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
>>>>>>>> check more closely if you think it makes sense. If so, what numbe=
r
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
>>>>>> Ok, I ran some tests overnight with 2-8 CPUs. Turns out the system =
is quite
>>>>>> stable,
>>>>>
>>>>> cool!
>>>>>
>>>>>> with the exception of SCSI controllers. Some fail completely, other=
s
>>>>>> rarely. Here is a quick summary:
>>>>>>
>>>>>> - am53c974 fails with "Spurious irq, sreg=3D00", followed by "Abort=
ing command"
>>>>>> =C2=A0=C2=A0 and a hung task crash.
>>>>>> - megasas and megasas-gen2 fail with
>>>>>> =C2=A0=C2=A0 "scsi host1: scsi scan: INQUIRY result too short (5), =
using 36"
>>>>>> =C2=A0=C2=A0 followed by
>>>>>> =C2=A0=C2=A0 "megaraid_sas 0000:00:04.0: Unknown command completed!=
"
>>>>>> =C2=A0=C2=A0 and a hung task crash
>>>>>> - mptsas1068 fails completely (no kernel log message seen)
>>>>>> - dc390 and lsi* report random "Spurious irq, sreg=3D00" messages a=
nd timeouts
>>>>>
>>>>> I think none of those drivers have ever been tested
>>>>> on physical hardware either.
>>>>> So I'm astonished that it even worked that far :-)
>>>>>
>>>> I actually do have a dc390 board somewhere. I used it some time ago t=
o improve
>>>> the emulation.
>>>
>>> Do you have a physical hppa box too?
>>>
>>>>> Based on kernel sources, the "Spurious irq, sreg=3D%02x." error can =
only happen for the
>>>>> am53c974 driver. Are you sure you see this message for dc390 and lsi=
* too?
>>>>>
>>>> am53c974 and dc390 use the same driver. lsi* doesn't, and doesn't hav=
e a problem
>>>> either. Sorry, I confused that with some old notes.
>>>>
>>>> Either case, I think I found the problem. After handling an interrupt=
, the Linux
>>>> driver checks if another interrupt is pending. It does that by checki=
ng the
>>>> DMA_DONE bit in the DMA status register. If that bit is set, it re-en=
ters the
>>>> interrupt handler. Problem with that is that the emulation sets DMA_D=
ONE
>>>> prematurely, before it sets the command done bit in the interrupt sta=
tus register
>>>> and before it sets the interrupt pending bit in the status register. =
As result,
>>>> DMA_DONE is set but IRQ_PENDING isn't, and the spurious interrupt is =
reported.
>>>> I fixed that up in my code and will test it for some time and with va=
rious
>>>> architectures before I send a patch.
>>
>> I'm actually in the process of putting the finishing touches to a large=
 rewrite of QEMU's core ESP emulation since there are a number of known is=
sues with the existing version. In particular there are problems with the =
SCSI phase being set incorrectly after reading ESP_INTR and ESP_RSTAT's ST=
AT_TC not being correct. Note that this is just the ESP core rather than t=
he ESP PCI device.
>>
>> If you are interested, I could try and find a few minutes to tidy it up=
 a bit more and push a testing branch to Github?
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
> @@ -286,9 +286,6 @@ static void esp_pci_dma_memory_rw(PCIESPState *pci, =
uint8_t *buf, int len,
>  =C2=A0=C2=A0=C2=A0=C2=A0 /* update status registers */
>  =C2=A0=C2=A0=C2=A0=C2=A0 pci->dma_regs[DMA_WBC] -=3D len;
>  =C2=A0=C2=A0=C2=A0=C2=A0 pci->dma_regs[DMA_WAC] +=3D len;
> -=C2=A0=C2=A0=C2=A0 if (pci->dma_regs[DMA_WBC] =3D=3D 0) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci->dma_regs[DMA_STAT] |=3D=
 DMA_STAT_DONE;
> -=C2=A0=C2=A0=C2=A0 }
>  =C2=A0}
>
> I tested that with several platforms. There are no more spurious interru=
pts
> after that change, and no other errors either.
>
> Regarding TC after reading the interrupt register, I carry the following
> patch locally.
>
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 9b11d8c573..f0cd8705a7 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -986,7 +986,7 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D s->rregs[ESP_R=
INTR];
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->rregs[ESP_RINTR] =
=3D 0;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->rregs[ESP_RSTAT] &=3D ~ST=
AT_TC;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // s->rregs[ESP_RSTAT] &=3D =
~STAT_TC;
>
> The comment above that code says "Clear sequence step, interrupt registe=
r
> and all status bits except TC", which is quite the opposite of what the =
code
> is doing because it clears TC and nothing else. I never spent the time
> trying to figure out how to fix that properly; clearing the other bits
> like the comment suggests doesn't work (STAT_INT needs to be set for
> esp_lower_irq() to work, and clearing the other bits results in transfer
> failures).

Does qemu-hppa boot for you with those patches?
Even with those I see the discs are found, but later I get:
[    8.519780] EXT4-fs error (device sda5): ext4_lookup:1855: inode #78797=
5: comm swapper/0: iget: checksum invalid
[    8.545363] Starting init: /sbin/init exists but couldn't execute it (e=
rror -67)
[    8.546339] Run /etc/init as init process
[    8.561422] Run /bin/init as init process
[    8.574649] Run /bin/sh as init process
[    8.580495] EXT4-fs error (device sda5): ext4_lookup:1855: inode #78798=
0: comm swapper/0: iget: checksum invalid
[    8.586170] Starting init: /bin/sh exists but couldn't execute it (erro=
r -67)

Helge




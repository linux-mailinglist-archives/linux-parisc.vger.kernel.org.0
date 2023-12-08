Return-Path: <linux-parisc+bounces-169-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E93B80AD4F
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 20:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B4FAB20AEA
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 19:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751CD50241;
	Fri,  8 Dec 2023 19:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=ilande.co.uk header.i=@ilande.co.uk header.b="Re8AZhUf"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail.ilande.co.uk (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB521738
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 11:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=leaRuXoVPsFh+f/i/5VgJ58xiyHEmvhficl2bW9EVfY=; b=Re8AZhUf7dSf2mR91Xe5RDJzxz
	gbU8Yt/U+YAzpBfc4/0Y5mRXUFS06T05ZFu3KEjZsHTtIbLffT6rfEz7xHD+x7gA4WjdgKQIKD1RC
	8+60YnRqgoMKX+axXcxU3N1EwVpM6gBqwZP9PXZbamS60XX4YGcjDMvO4tFARGRKSwQYo3bwVft0G
	S/Z89e1pE+2goYO1sj2JERqSV2vBx7sIa9Il3uTm49UHZ8O0EHWUO2rfh2jIumUsy44/9zjQaZrz0
	giiEpg5DqSqnkkvrRrBe+nDkK8JIe1ILI+KWvv6MF3P22FoMv/KU5TeFL96TiQxHiUxYLwlR7n/PY
	G7HBmPVJyptsMYGeE4ts+euNkrx4/YfLn5Iuet4tLnEYd2Pb8gUzJMzSz4AxO7oiRRDnqDQ+TEeHP
	KBe5PCx1P8M0+pBNgi34sRg9bS53pJKghjT+MjueUM70WO6hYxcwU/3FjzQVf3RBt8SqzbqRZyOF4
	KQRhdXPETv49HRM7ypg/m+Oc54/gwYS0ClW6RO7Cue2GlWv9FBXxNNorY5ZIFsHBwBzJLoP2v9/Rz
	JPVOlw+rzl6BINXtoYdA2quoJabSPJ+PKj9y982Z1OdO9lW7BzGIXTDykyopssZDMkq121V6VULOs
	syH3KGGot/jAP492+6EPuwqF4TXafFGrQKOKJFQTo=;
Received: from [2a00:23c4:8bb0:f100:9601:9e38:9395:46ea]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1rBgmS-0008np-Ml; Fri, 08 Dec 2023 19:45:04 +0000
Message-ID: <60939e7b-643d-497e-a3dd-974513851959@ilande.co.uk>
Date: Fri, 8 Dec 2023 19:45:19 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Guenter Roeck <linux@roeck-us.net>,
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
 <97729a4b-5ef7-42ad-897d-a57cd9a5a5bf@ilande.co.uk>
 <a68b234a-c202-44ca-bb45-5cbb86b5729b@gmx.de>
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
In-Reply-To: <a68b234a-c202-44ca-bb45-5cbb86b5729b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb0:f100:9601:9e38:9395:46ea
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Level: 
Subject: Re: 64-bit userspace root file system for hppa64
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

On 08/12/2023 19:26, Helge Deller wrote:

> On 12/8/23 19:53, Mark Cave-Ayland wrote:
>> On 08/12/2023 14:58, Guenter Roeck wrote:
>>
>>> On 12/8/23 00:01, Mark Cave-Ayland wrote:
>>>> On 07/12/2023 21:47, Helge Deller wrote:
>>>>
>>>>> (looping in Mark Cave-Ayland, since he did some work on qemu esp driver)
>>>>
>>>> Thanks for the ping!
>>>>
>>>>> On 12/7/23 22:08, Guenter Roeck wrote:
>>>>>> Hi Helge,
>>>>>>
>>>>>> On 12/6/23 13:43, Helge Deller wrote:
>>>>>>> On 12/6/23 21:19, Guenter Roeck wrote:
>>>>>>>> On 12/6/23 09:00, Helge Deller wrote:
>>>>>>>> [ ... ]
>>>>>>>>>> Is it worth testing with multiple CPUs ? I can re-enable it and
>>>>>>>>>> check more closely if you think it makes sense. If so, what number
>>>>>>>>>> of CPUs would you recommend ?
>>>>>>>>>
>>>>>>>>> I think 4 CPUs is realistic.
>>>>>>>>> But I agree, that you probably see more issues.
>>>>>>>>>
>>>>>>>>> Generally the assumption was, that the different caches on parisc
>>>>>>>>> may trigger SMP issues, but given that those issues can be seen on
>>>>>>>>> qemu, it indicates that there are generic SMP issues too.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Ok, I ran some tests overnight with 2-8 CPUs. Turns out the system is quite
>>>>>>>> stable,
>>>>>>>
>>>>>>> cool!
>>>>>>>
>>>>>>>> with the exception of SCSI controllers. Some fail completely, others
>>>>>>>> rarely. Here is a quick summary:
>>>>>>>>
>>>>>>>> - am53c974 fails with "Spurious irq, sreg=00", followed by "Aborting command"
>>>>>>>>    and a hung task crash.
>>>>>>>> - megasas and megasas-gen2 fail with
>>>>>>>>    "scsi host1: scsi scan: INQUIRY result too short (5), using 36"
>>>>>>>>    followed by
>>>>>>>>    "megaraid_sas 0000:00:04.0: Unknown command completed!"
>>>>>>>>    and a hung task crash
>>>>>>>> - mptsas1068 fails completely (no kernel log message seen)
>>>>>>>> - dc390 and lsi* report random "Spurious irq, sreg=00" messages and timeouts
>>>>>>>
>>>>>>> I think none of those drivers have ever been tested
>>>>>>> on physical hardware either.
>>>>>>> So I'm astonished that it even worked that far :-)
>>>>>>>
>>>>>> I actually do have a dc390 board somewhere. I used it some time ago to improve
>>>>>> the emulation.
>>>>>
>>>>> Do you have a physical hppa box too?
>>>>>
>>>>>>> Based on kernel sources, the "Spurious irq, sreg=%02x." error can only happen 
>>>>>>> for the
>>>>>>> am53c974 driver. Are you sure you see this message for dc390 and lsi* too?
>>>>>>>
>>>>>> am53c974 and dc390 use the same driver. lsi* doesn't, and doesn't have a problem
>>>>>> either. Sorry, I confused that with some old notes.
>>>>>>
>>>>>> Either case, I think I found the problem. After handling an interrupt, the Linux
>>>>>> driver checks if another interrupt is pending. It does that by checking the
>>>>>> DMA_DONE bit in the DMA status register. If that bit is set, it re-enters the
>>>>>> interrupt handler. Problem with that is that the emulation sets DMA_DONE
>>>>>> prematurely, before it sets the command done bit in the interrupt status register
>>>>>> and before it sets the interrupt pending bit in the status register. As result,
>>>>>> DMA_DONE is set but IRQ_PENDING isn't, and the spurious interrupt is reported.
>>>>>> I fixed that up in my code and will test it for some time and with various
>>>>>> architectures before I send a patch.
>>>>
>>>> I'm actually in the process of putting the finishing touches to a large rewrite 
>>>> of QEMU's core ESP emulation since there are a number of known issues with the 
>>>> existing version. In particular there are problems with the SCSI phase being set 
>>>> incorrectly after reading ESP_INTR and ESP_RSTAT's STAT_TC not being correct. 
>>>> Note that this is just the ESP core rather than the ESP PCI device.
>>>>
>>>> If you are interested, I could try and find a few minutes to tidy it up a bit 
>>>> more and push a testing branch to Github?
>>>>
>>>
>>> Sure, I'll be happy to give your changes a try.
>>>
>>> FWIW, the change I made to fix the spurious interrupt problem is
>>>
>>> diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
>>> index 6794acaebc..f624398c55 100644
>>> --- a/hw/scsi/esp-pci.c
>>> +++ b/hw/scsi/esp-pci.c
>>> @@ -286,9 +286,6 @@ static void esp_pci_dma_memory_rw(PCIESPState *pci, uint8_t 
>>> *buf, int len,
>>>       /* update status registers */
>>>       pci->dma_regs[DMA_WBC] -= len;
>>>       pci->dma_regs[DMA_WAC] += len;
>>> -    if (pci->dma_regs[DMA_WBC] == 0) {
>>> -        pci->dma_regs[DMA_STAT] |= DMA_STAT_DONE;
>>> -    }
>>>   }
>>>
>>> I tested that with several platforms. There are no more spurious interrupts
>>> after that change, and no other errors either.
>>
>> I suspect that this is papering over the real issue, since it appears the code 
>> being removed sets the DMA completion bit when then the PCI DMA transfer counter 
>> reaches zero.
>>
>>> Regarding TC after reading the interrupt register, I carry the following
>>> patch locally.
>>>
>>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>>> index 9b11d8c573..f0cd8705a7 100644
>>> --- a/hw/scsi/esp.c
>>> +++ b/hw/scsi/esp.c
>>> @@ -986,7 +986,7 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>>>            */
>>>           val = s->rregs[ESP_RINTR];
>>>           s->rregs[ESP_RINTR] = 0;
>>> -        s->rregs[ESP_RSTAT] &= ~STAT_TC;
>>> +        // s->rregs[ESP_RSTAT] &= ~STAT_TC;
>>>
>>> The comment above that code says "Clear sequence step, interrupt register
>>> and all status bits except TC", which is quite the opposite of what the code
>>> is doing because it clears TC and nothing else. I never spent the time
>>> trying to figure out how to fix that properly; clearing the other bits
>>> like the comment suggests doesn't work (STAT_INT needs to be set for
>>> esp_lower_irq() to work, and clearing the other bits results in transfer
>>> failures).
>>
>> Yeah that's one of the many bugs which should be fixed by my latest
>> series. I've pushed the current version of my branch with the ESP
>> rewrite to https://github.com/mcayland/qemu/tree/esp-rework-testing
>> if you would both like to give it a test.
> 
> Tried it with qemu-hppa:
> 
> [    1.062381] sym53c8xx 0000:00:00.0: enabling SERR and PARITY (0107 -> 0147)
> [    1.066381] sym0: <895a> rev 0x0 at pci 0000:00:00.0 irq 66
> [    1.073919] sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
> [    1.080618] sym0: SCSI BUS has been reset.
> [    1.085325] scsi host0: sym-2.2.3
> [    4.257547] am53c974 0000:00:04.0: enabling SERR and PARITY (0107 -> 0147)
> [    4.917824] am53c974 0000:00:04.0: esp0: regs[(ptrval):(ptrval)] irq[70]
> [    4.918704] am53c974 0000:00:04.0: esp0: is a AM53C974, 40 MHz (ccf=0), SCSI ID 15
> [    8.010626] scsi host1: esp
> [    8.026345] scsi 1:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    2.5+ PQ: 0 
> ANSI: 5
> [    8.032066] scsi target1:0:0: Beginning Domain Validation
> [    8.043254] scsi target1:0:0: Domain Validation skipping write tests
> [    8.044284] scsi target1:0:0: Ending Domain Validation
> [    8.094991] megasas: 07.727.03.00-rc1
> [    8.097635] mpt3sas version 43.100.00.00 loaded
> [    8.109417] st: Version 20160209, fixed bufsize 32768, s/g segs 256
> [    8.123681] sd 1:0:0:0: Power-on or device reset occurred
> [    8.134707] sd 1:0:0:0: [sda] 209715200 512-byte logical blocks: (107 GB/100 GiB)
> [    8.140043] sd 1:0:0:0: [sda] Write Protect is off
> [    8.144759] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't 
> support DPO or FUA
> [    8.205316]  sda: sda1 sda2 sda3 < sda5 sda6 >
> [    8.222763] sd 1:0:0:0: [sda] Attached SCSI disk
> [    8.231170] sd 1:0:0:0: Attached scsi generic sg0 type 0
> [    8.237107] LASI 82596 driver - Revision: 1.30
> [    8.238440] Fusion MPT base driver 3.04.20
> [    8.239024] Copyright (c) 1999-2008 LSI Corporation
> [    8.240965] Fusion MPT SPI Host driver 3.04.20
> [    8.243040] Fusion MPT SAS Host driver 3.04.20
> [    8.245172] Fusion MPT misc device (ioctl) driver 3.04.20
> [    8.247849] mptctl: Registered with Fusion MPT base driver
> [    8.248791] mptctl: /dev/mptctl @ (major,minor=10,220)
> [    8.258484] HP SDC: No SDC found.
> [    8.271496] rtc-generic rtc-generic: registered as rtc0
> [    8.274606] rtc-generic rtc-generic: setting system clock to 2023-12-08T19:25:10 
> UTC (1702063510)
> [    8.278926] device-mapper: uevent: version 1.0.3
> [    8.284893] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: 
> dm-devel@redhat.com
> [    8.288890] hid: raw HID events driver (C) Jiri Kosina
> [    8.302272] usbcore: registered new interface driver usbhid
> [    8.303494] usbhid: USB HID core driver
> [    8.308155] NET: Registered PF_INET6 protocol family
> [    8.337076] Segment Routing with IPv6
> [    8.338476] In-situ OAM (IOAM) with IPv6
> [    8.340887] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    8.351957] NET: Registered PF_PACKET protocol family
> [    8.596153] EXT4-fs (sda5): mounted filesystem 
> f035d934-31b6-430e-b23d-a818f9baaf2e ro with ordered data mode. Quota mode: none.
> [    8.599184] VFS: Mounted root (ext4 filesystem) readonly on device 8:5.
> [    8.609270] devtmpfs: mounted
> [    8.679666] Freeing unused kernel image (initmem) memory: 3072K
> [    8.680679] Write protected read-only-after-init data: 2k
> [    8.681338] Run /sbin/init as init process
> [    8.731576] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787975: comm 
> swapper/0: iget: checksum invalid
> [    8.736664] scsi host1: Spurious irq, sreg=10.
> [    8.760106] Starting init: /sbin/init exists but couldn't execute it (error -67)
> [    8.760773] Run /etc/init as init process
> [    8.768268] Run /bin/init as init process
> [    8.775050] Run /bin/sh as init process
> [    8.777917] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787980: comm 
> swapper/0: iget: checksum invalid
> [    8.779882] scsi host1: Spurious irq, sreg=10.
> [    8.780532] scsi host1: Spurious irq, sreg=13.
> [    8.781094] Starting init: /bin/sh exists but couldn't execute it (error -67)
> [    8.781934] Kernel panic - not syncing: No working init found.  Try passing init= 
> option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.
> [    8.782740] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.7.0-rc4-32bit #2434
> [    8.782740] Hardware name: 9000/785/C3700
> [    8.782740] Backtrace:
> [    8.782740]  [<104080f0>] show_stack+0x54/0x6c
> [    8.782740]  [<10c09498>] dump_stack_lvl+0x58/0x7c
> [    8.782740]  [<10c094d8>] dump_stack+0x1c/0x2c
> [    8.782740]  [<10bf5698>] panic+0x130/0x2d4
> [    8.782740]  [<10c0a024>] kernel_init+0x14c/0x150
> [    8.782740]  [<1040201c>] ret_from_kernel_thread+0x1c/0x24

Ah that's a shame, I was really hoping that would solve the issue. Unless there is 
something amiss with the esp-pci device? I haven't really spent any time looking at 
the PCI DMA implementation.


ATB,

Mark.



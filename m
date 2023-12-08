Return-Path: <linux-parisc+bounces-167-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A63C80ACF3
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 20:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F1C128122B
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 19:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C71349F97;
	Fri,  8 Dec 2023 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="LoIel5Tl"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A3B1706
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 11:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702063613; x=1702668413; i=deller@gmx.de;
	bh=0gag6iUyXgvyUoPcdTlnySJtYs2wDofczYttcQPeLAM=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=LoIel5TlDzRn+1qks0UJDIXacF4p4t8wIB2iZOKP1pjJ0yk1i3Lt/9f+lq9QselR
	 I6OdaqHSEE6TQqfSQ7ZtzduFl75daKLULt36vMZXxRaSd5sSyDIaITr7WiSzhCBY/
	 MO/umRHnKNwPkXqJ97EUIdJG99sZCsDyzEJQDrnX3GN/fHi4o+/iStYUP1QXKdCTj
	 wOzzxgBJPJUmtVuRWPJEluRe3rj/5dLEwR/pA0Nc8ENy2WhU2pNZJ2pQeYdC8B3Cl
	 JrWNVCzOq2RYhHdm3nc4QHWn9HeHxE34yIk/MHPYC6KEj+cHTuNAqYLa53gItvgSq
	 gzzOhdZ7QwaeGWUE4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.158.195]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUmD-1r5JUw0lA7-00D05s; Fri, 08
 Dec 2023 20:26:53 +0100
Message-ID: <a68b234a-c202-44ca-bb45-5cbb86b5729b@gmx.de>
Date: Fri, 8 Dec 2023 20:26:51 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guenter Roeck <linux@roeck-us.net>, John David Anglin
 <dave.anglin@bell.net>, Parisc List <linux-parisc@vger.kernel.org>
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
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <97729a4b-5ef7-42ad-897d-a57cd9a5a5bf@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/9JziNAh557aLvtNs6yYiD2l7thzF7Nxp8O6I+M8+oO0274I5KL
 4/xIjM9Dwg9/B2YN37o8hkH42+ArVSdzP/JTdCjj0FYhFDUAneQnLf6egoRQn19cxyBxytb
 BufvHX/BJ4ByGQoPFv/meqOVfDNbaZCdqbcSBsrQewIYHxUSuXgei8TJ6MrCDtrcfmNEWpV
 a9Ij1FhI7gXAxhwsOos0g==
UI-OutboundReport: notjunk:1;M01:P0:2TMLjrBDf0k=;I4zkJFKpB37/sTtbV01z6njabY7
 VP/1bLIODqf/fs6ewnCjS8GmmnZ9KX0LD9Q1QfASp2G3ghuJNYSQYk0Pu6mzd9DgDSupT8cOy
 06ZN2bvxryX6aK2sCooXVYxpOFXP5QsfYnSuZQkBVNG2kfYuuT94ieTLaG9x+7wItF1ZoSCgv
 uZgO8B7YWy5gaGCWcywlQiVgmDYds4UC91dA1nHg1DvrOZDFSrpPMyQaGOKHlL5J7RsFXlq3+
 PLwwSOB878HjnodDEhjzLmK8smGxuEXQvSFXaNTghIozNEaGUlw6pJpsyccW+CJDEI18Hg6bu
 eELh6M9NB6RQn/93uH+Qa0le2Vam2CkPJi+F/4cLRSWuw4vMA4hhCZ1ArMXM25tyQrugIiG1N
 v9MCvmPkuAio+CUS4NwPpkInVZfU9GZXiA6JKnZ3WLdCidyrIFEhmebLQUor7DWDT4g5O+/x9
 H/IwVuiq6jUXjxybhNH+J+x6kTtQOuP9cmfCmPLiA0p0SdiNLoq+iuP5kgzd/GNISEpVqFttJ
 uPvUOEhS1jzJ21W5Sm7ilqhARnfjX5g4hqzHgCladng27yN7vThDQ1Cs+qDJrtc5CwVs/Js4v
 c8/6DnOeTcyiKG4C98sYncEujrocXFboAeT2pcXizYJVpNC2ew0STW2eS4i/dHOdKBGsuaEVF
 4NN4+9tKs+IBPwcoAoDyxsMA6kWzTJg7TbqRIJdCW1wBAJQNGpc8LQfvUWzipaGIZQFBaa3Q6
 MiMoC1DM8Pvp2mLRA4+jP6TnVK8kaE8PDZhigFKEOmPIGtDQl7l9R0L9heXaRwZ663whVaYi3
 IWM/JizQ0ZWmNfJp7wNfo4/s5gTMYLrFDekS+LbHXd0JTNF+B6dbJ+e+3YIe1uThA7aF9zWg6
 2pzWpkedUi/UMBYYCjW16mrclTSvJQM9BZJZe4PloeM4Iee9FOxyubyckjKHqjTaCsKP2QrD4
 z5O5Lg==

On 12/8/23 19:53, Mark Cave-Ayland wrote:
> On 08/12/2023 14:58, Guenter Roeck wrote:
>
>> On 12/8/23 00:01, Mark Cave-Ayland wrote:
>>> On 07/12/2023 21:47, Helge Deller wrote:
>>>
>>>> (looping in Mark Cave-Ayland, since he did some work on qemu esp driv=
er)
>>>
>>> Thanks for the ping!
>>>
>>>> On 12/7/23 22:08, Guenter Roeck wrote:
>>>>> Hi Helge,
>>>>>
>>>>> On 12/6/23 13:43, Helge Deller wrote:
>>>>>> On 12/6/23 21:19, Guenter Roeck wrote:
>>>>>>> On 12/6/23 09:00, Helge Deller wrote:
>>>>>>> [ ... ]
>>>>>>>>> Is it worth testing with multiple CPUs ? I can re-enable it and
>>>>>>>>> check more closely if you think it makes sense. If so, what numb=
er
>>>>>>>>> of CPUs would you recommend ?
>>>>>>>>
>>>>>>>> I think 4 CPUs is realistic.
>>>>>>>> But I agree, that you probably see more issues.
>>>>>>>>
>>>>>>>> Generally the assumption was, that the different caches on parisc
>>>>>>>> may trigger SMP issues, but given that those issues can be seen o=
n
>>>>>>>> qemu, it indicates that there are generic SMP issues too.
>>>>>>>>
>>>>>>>
>>>>>>> Ok, I ran some tests overnight with 2-8 CPUs. Turns out the system=
 is quite
>>>>>>> stable,
>>>>>>
>>>>>> cool!
>>>>>>
>>>>>>> with the exception of SCSI controllers. Some fail completely, othe=
rs
>>>>>>> rarely. Here is a quick summary:
>>>>>>>
>>>>>>> - am53c974 fails with "Spurious irq, sreg=3D00", followed by "Abor=
ting command"
>>>>>>> =C2=A0=C2=A0 and a hung task crash.
>>>>>>> - megasas and megasas-gen2 fail with
>>>>>>> =C2=A0=C2=A0 "scsi host1: scsi scan: INQUIRY result too short (5),=
 using 36"
>>>>>>> =C2=A0=C2=A0 followed by
>>>>>>> =C2=A0=C2=A0 "megaraid_sas 0000:00:04.0: Unknown command completed=
!"
>>>>>>> =C2=A0=C2=A0 and a hung task crash
>>>>>>> - mptsas1068 fails completely (no kernel log message seen)
>>>>>>> - dc390 and lsi* report random "Spurious irq, sreg=3D00" messages =
and timeouts
>>>>>>
>>>>>> I think none of those drivers have ever been tested
>>>>>> on physical hardware either.
>>>>>> So I'm astonished that it even worked that far :-)
>>>>>>
>>>>> I actually do have a dc390 board somewhere. I used it some time ago =
to improve
>>>>> the emulation.
>>>>
>>>> Do you have a physical hppa box too?
>>>>
>>>>>> Based on kernel sources, the "Spurious irq, sreg=3D%02x." error can=
 only happen for the
>>>>>> am53c974 driver. Are you sure you see this message for dc390 and ls=
i* too?
>>>>>>
>>>>> am53c974 and dc390 use the same driver. lsi* doesn't, and doesn't ha=
ve a problem
>>>>> either. Sorry, I confused that with some old notes.
>>>>>
>>>>> Either case, I think I found the problem. After handling an interrup=
t, the Linux
>>>>> driver checks if another interrupt is pending. It does that by check=
ing the
>>>>> DMA_DONE bit in the DMA status register. If that bit is set, it re-e=
nters the
>>>>> interrupt handler. Problem with that is that the emulation sets DMA_=
DONE
>>>>> prematurely, before it sets the command done bit in the interrupt st=
atus register
>>>>> and before it sets the interrupt pending bit in the status register.=
 As result,
>>>>> DMA_DONE is set but IRQ_PENDING isn't, and the spurious interrupt is=
 reported.
>>>>> I fixed that up in my code and will test it for some time and with v=
arious
>>>>> architectures before I send a patch.
>>>
>>> I'm actually in the process of putting the finishing touches to a larg=
e rewrite of QEMU's core ESP emulation since there are a number of known i=
ssues with the existing version. In particular there are problems with the=
 SCSI phase being set incorrectly after reading ESP_INTR and ESP_RSTAT's S=
TAT_TC not being correct. Note that this is just the ESP core rather than =
the ESP PCI device.
>>>
>>> If you are interested, I could try and find a few minutes to tidy it u=
p a bit more and push a testing branch to Github?
>>>
>>
>> Sure, I'll be happy to give your changes a try.
>>
>> FWIW, the change I made to fix the spurious interrupt problem is
>>
>> diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
>> index 6794acaebc..f624398c55 100644
>> --- a/hw/scsi/esp-pci.c
>> +++ b/hw/scsi/esp-pci.c
>> @@ -286,9 +286,6 @@ static void esp_pci_dma_memory_rw(PCIESPState *pci,=
 uint8_t *buf, int len,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* update status registers */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci->dma_regs[DMA_WBC] -=3D len;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci->dma_regs[DMA_WAC] +=3D len;
>> -=C2=A0=C2=A0=C2=A0 if (pci->dma_regs[DMA_WBC] =3D=3D 0) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci->dma_regs[DMA_STAT] |=
=3D DMA_STAT_DONE;
>> -=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0}
>>
>> I tested that with several platforms. There are no more spurious interr=
upts
>> after that change, and no other errors either.
>
> I suspect that this is papering over the real issue, since it appears th=
e code being removed sets the DMA completion bit when then the PCI DMA tra=
nsfer counter reaches zero.
>
>> Regarding TC after reading the interrupt register, I carry the followin=
g
>> patch locally.
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index 9b11d8c573..f0cd8705a7 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -986,7 +986,7 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D s->rregs=
[ESP_RINTR];
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->rregs[ESP_RIN=
TR] =3D 0;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->rregs[ESP_RSTAT] &=3D ~S=
TAT_TC;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // s->rregs[ESP_RSTAT] &=3D=
 ~STAT_TC;
>>
>> The comment above that code says "Clear sequence step, interrupt regist=
er
>> and all status bits except TC", which is quite the opposite of what the=
 code
>> is doing because it clears TC and nothing else. I never spent the time
>> trying to figure out how to fix that properly; clearing the other bits
>> like the comment suggests doesn't work (STAT_INT needs to be set for
>> esp_lower_irq() to work, and clearing the other bits results in transfe=
r
>> failures).
>
> Yeah that's one of the many bugs which should be fixed by my latest
> series. I've pushed the current version of my branch with the ESP
> rewrite to https://github.com/mcayland/qemu/tree/esp-rework-testing
> if you would both like to give it a test.

Tried it with qemu-hppa:

[    1.062381] sym53c8xx 0000:00:00.0: enabling SERR and PARITY (0107 -> 0=
147)
[    1.066381] sym0: <895a> rev 0x0 at pci 0000:00:00.0 irq 66
[    1.073919] sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
[    1.080618] sym0: SCSI BUS has been reset.
[    1.085325] scsi host0: sym-2.2.3
[    4.257547] am53c974 0000:00:04.0: enabling SERR and PARITY (0107 -> 01=
47)
[    4.917824] am53c974 0000:00:04.0: esp0: regs[(ptrval):(ptrval)] irq[70=
]
[    4.918704] am53c974 0000:00:04.0: esp0: is a AM53C974, 40 MHz (ccf=3D0=
), SCSI ID 15
[    8.010626] scsi host1: esp
[    8.026345] scsi 1:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    2=
.5+ PQ: 0 ANSI: 5
[    8.032066] scsi target1:0:0: Beginning Domain Validation
[    8.043254] scsi target1:0:0: Domain Validation skipping write tests
[    8.044284] scsi target1:0:0: Ending Domain Validation
[    8.094991] megasas: 07.727.03.00-rc1
[    8.097635] mpt3sas version 43.100.00.00 loaded
[    8.109417] st: Version 20160209, fixed bufsize 32768, s/g segs 256
[    8.123681] sd 1:0:0:0: Power-on or device reset occurred
[    8.134707] sd 1:0:0:0: [sda] 209715200 512-byte logical blocks: (107 G=
B/100 GiB)
[    8.140043] sd 1:0:0:0: [sda] Write Protect is off
[    8.144759] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled=
, doesn't support DPO or FUA
[    8.205316]  sda: sda1 sda2 sda3 < sda5 sda6 >
[    8.222763] sd 1:0:0:0: [sda] Attached SCSI disk
[    8.231170] sd 1:0:0:0: Attached scsi generic sg0 type 0
[    8.237107] LASI 82596 driver - Revision: 1.30
[    8.238440] Fusion MPT base driver 3.04.20
[    8.239024] Copyright (c) 1999-2008 LSI Corporation
[    8.240965] Fusion MPT SPI Host driver 3.04.20
[    8.243040] Fusion MPT SAS Host driver 3.04.20
[    8.245172] Fusion MPT misc device (ioctl) driver 3.04.20
[    8.247849] mptctl: Registered with Fusion MPT base driver
[    8.248791] mptctl: /dev/mptctl @ (major,minor=3D10,220)
[    8.258484] HP SDC: No SDC found.
[    8.271496] rtc-generic rtc-generic: registered as rtc0
[    8.274606] rtc-generic rtc-generic: setting system clock to 2023-12-08=
T19:25:10 UTC (1702063510)
[    8.278926] device-mapper: uevent: version 1.0.3
[    8.284893] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised=
: dm-devel@redhat.com
[    8.288890] hid: raw HID events driver (C) Jiri Kosina
[    8.302272] usbcore: registered new interface driver usbhid
[    8.303494] usbhid: USB HID core driver
[    8.308155] NET: Registered PF_INET6 protocol family
[    8.337076] Segment Routing with IPv6
[    8.338476] In-situ OAM (IOAM) with IPv6
[    8.340887] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    8.351957] NET: Registered PF_PACKET protocol family
[    8.596153] EXT4-fs (sda5): mounted filesystem f035d934-31b6-430e-b23d-=
a818f9baaf2e ro with ordered data mode. Quota mode: none.
[    8.599184] VFS: Mounted root (ext4 filesystem) readonly on device 8:5.
[    8.609270] devtmpfs: mounted
[    8.679666] Freeing unused kernel image (initmem) memory: 3072K
[    8.680679] Write protected read-only-after-init data: 2k
[    8.681338] Run /sbin/init as init process
[    8.731576] EXT4-fs error (device sda5): ext4_lookup:1855: inode #78797=
5: comm swapper/0: iget: checksum invalid
[    8.736664] scsi host1: Spurious irq, sreg=3D10.
[    8.760106] Starting init: /sbin/init exists but couldn't execute it (e=
rror -67)
[    8.760773] Run /etc/init as init process
[    8.768268] Run /bin/init as init process
[    8.775050] Run /bin/sh as init process
[    8.777917] EXT4-fs error (device sda5): ext4_lookup:1855: inode #78798=
0: comm swapper/0: iget: checksum invalid
[    8.779882] scsi host1: Spurious irq, sreg=3D10.
[    8.780532] scsi host1: Spurious irq, sreg=3D13.
[    8.781094] Starting init: /bin/sh exists but couldn't execute it (erro=
r -67)
[    8.781934] Kernel panic - not syncing: No working init found.  Try pas=
sing init=3D option to kernel. See Linux Documentation/admin-guide/init.rs=
t for guidance.
[    8.782740] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.7.0-rc4-32bit #=
2434
[    8.782740] Hardware name: 9000/785/C3700
[    8.782740] Backtrace:
[    8.782740]  [<104080f0>] show_stack+0x54/0x6c
[    8.782740]  [<10c09498>] dump_stack_lvl+0x58/0x7c
[    8.782740]  [<10c094d8>] dump_stack+0x1c/0x2c
[    8.782740]  [<10bf5698>] panic+0x130/0x2d4
[    8.782740]  [<10c0a024>] kernel_init+0x14c/0x150
[    8.782740]  [<1040201c>] ret_from_kernel_thread+0x1c/0x24

Helge


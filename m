Return-Path: <linux-parisc+bounces-193-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5B80B5F0
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Dec 2023 19:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B2CD280DFF
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Dec 2023 18:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89ACB19461;
	Sat,  9 Dec 2023 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=ilande.co.uk header.i=@ilande.co.uk header.b="e5x4ORtA"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail.ilande.co.uk (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F89F12E
	for <linux-parisc@vger.kernel.org>; Sat,  9 Dec 2023 10:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d+wocNnZLmh4MVCBvT9jZL/T7JS/Gvgbl4FY9EKiSwc=; b=e5x4ORtA9qnR11YoIQ8/h9o9Wf
	2N3y0TOwCfUsHDZkxJlqUJF8no3LdUHbUAtnxsgUbm6aoGDckLZkccC/djnHR9Lcorn0vRbxNnNkf
	AOXIlboWjWv+nHQvawLe8oIDDV8A0tALQSDGQVJK7Dd/A5H/LRQ+CyZ37xPiigxMpOUmwDXKy7KPu
	jOcz+BEQDoEtHwRWQAfW9foYrpaN139e+TL62z6De2Crnmgte+NKqkCecXZgKgoV/t0f2wvLefo1I
	WD7WpstGUcK6WBOvy7vXNgvYhaNuJagg2FQgs6IN+hfd3flYQRkNV8seQItSns0F0cu+bT3bfttYo
	n5+w/JlzY7LqdNITJIdt9iv7ZIuHRVydKWzFAm2BvFpyYT0VxxNcLxU9EkTpgGBbTY9Th3oC1/HpU
	LCVBX47bxG8yCiy2ASDBBY8uTFG5bWw9GwRBIymdFxEwvUEwGuP/9S4cq/ziXoIVmUIT8eYBSmp6G
	nuuaKzQC36udGAyKnmljKiZWnDUgVe7kXoDU8W5EJQUwJOotWvRaginVrCI0tLZbrJdwu7/+f/8Cc
	JZ4k7GGpi2EtCZU1KV93L8+mkBHE1S57FK5Z5eDdJiLHO8MO9yvJQo8iATiOlEgGzfLpsY1yzPc5c
	lAeTBC/C+NzHb9vALnuySgT8XvbvzcnHf9r3LPLDk=;
Received: from [2a00:23c4:8bb0:f100:140b:63db:b8d4:eb7a]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1rC2Uu-0006iW-JK; Sat, 09 Dec 2023 18:56:29 +0000
Message-ID: <2924c887-0022-4cab-a986-0afd5f7a50f4@ilande.co.uk>
Date: Sat, 9 Dec 2023 18:56:36 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Helge Deller <deller@gmx.de>, Guenter Roeck <linux@roeck-us.net>,
 John David Anglin <dave.anglin@bell.net>,
 Parisc List <linux-parisc@vger.kernel.org>
References: <17dc79fa-4a38-44ee-a8ea-b523b2d99b26@roeck-us.net>
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
 <ae5e04f4-3979-4a6e-8cff-58f69e41fb08@gmx.de>
 <015b31ba-f440-4fb1-af0c-265f484bc91a@ilande.co.uk>
 <4ba17f2d-632c-4c49-a9d0-46324b5e5d7e@roeck-us.net>
 <68c3b5c9-4986-48c6-9cdb-52da59486e4c@ilande.co.uk>
 <f3777cce-31af-4632-9480-bc1f78285d2f@gmx.de>
 <df586906-2950-4b55-b26a-50e75d25f195@gmx.de>
 <8f1f2bf0-29aa-410a-8ecb-af61ba9c6dad@ilande.co.uk>
 <9d064661-3568-47f8-890c-4c05027e9999@gmx.de>
 <b22d59ff-bb79-4660-834a-ebbcd10c5ac8@gmx.de>
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
In-Reply-To: <b22d59ff-bb79-4660-834a-ebbcd10c5ac8@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb0:f100:140b:63db:b8d4:eb7a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Level: 
Subject: Re: 64-bit userspace root file system for hppa64
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

On 09/12/2023 17:10, Helge Deller wrote:

> On 12/9/23 13:49, Helge Deller wrote:
>> On 12/9/23 13:12, Mark Cave-Ayland wrote:
>>> On 08/12/2023 23:36, Helge Deller wrote:
>>>
>>>> On 12/8/23 23:09, Helge Deller wrote:
>>>>> On 12/8/23 22:25, Mark Cave-Ayland wrote:
>>>>>> On 08/12/2023 20:28, Guenter Roeck wrote:
>>>>>>> On 12/8/23 11:55, Mark Cave-Ayland wrote:
>>>>>>>> On 08/12/2023 19:37, Helge Deller wrote:
>>>>>>>>
>>>>>>>>> On 12/8/23 20:26, Helge Deller wrote:
>>>>>>>>>>> Yeah that's one of the many bugs which should be fixed by my latest
>>>>>>>>>>> series. I've pushed the current version of my branch with the ESP
>>>>>>>>>>> rewrite to https://github.com/mcayland/qemu/tree/esp-rework-testing
>>>>>>>>>>> if you would both like to give it a test.
>>>>>>>>>>
>>>>>>>>>> Tried it with qemu-hppa:
>>>>>>>>>>
>>>>>>>>>> [    4.257547] am53c974 0000:00:04.0: enabling SERR and PARITY (0107 -> 0147)
>>>>>>>>>> [    4.917824] am53c974 0000:00:04.0: esp0: regs[(ptrval):(ptrval)] irq[70]
>>>>>>>>>> [    4.918704] am53c974 0000:00:04.0: esp0: is a AM53C974, 40 MHz (ccf=0), 
>>>>>>>>>> SCSI ID 15
>>>>>>>>>> [    8.010626] scsi host1: esp
>>>>>>>>>> [    8.026345] scsi 1:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    
>>>>>>>>>> 2.5+ PQ: 0 ANSI: 5
>>>>>>>>>> [    8.032066] scsi target1:0:0: Beginning Domain Validation
>>>>>>>>>> [    8.043254] scsi target1:0:0: Domain Validation skipping write tests
>>>>>>>>>> [    8.044284] scsi target1:0:0: Ending Domain Validation
>>>>>>>>>> [    8.123681] sd 1:0:0:0: Power-on or device reset occurred
>>>>>>>>>> [    8.134707] sd 1:0:0:0: [sda] 209715200 512-byte logical blocks: (107 
>>>>>>>>>> GB/100 GiB)
>>>>>>>>>> [    8.140043] sd 1:0:0:0: [sda] Write Protect is off
>>>>>>>>>> [    8.144759] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, 
>>>>>>>>>> doesn't support DPO or FUA
>>>>>>>>>> [    8.205316]  sda: sda1 sda2 sda3 < sda5 sda6 >
>>>>>>>>>> [    8.222763] sd 1:0:0:0: [sda] Attached SCSI disk
>>>>>>>>>> [    8.231170] sd 1:0:0:0: Attached scsi generic sg0 type 0
>>>>>>>>> ...> [    8.679666] Freeing unused kernel image (initmem) memory: 3072K
>>>>>>>>>> [    8.680679] Write protected read-only-after-init data: 2k
>>>>>>>>>> [    8.681338] Run /sbin/init as init process
>>>>>>>>>> [    8.731576] EXT4-fs error (device sda5): ext4_lookup:1855: inode 
>>>>>>>>>> #787975: comm swapper/0: iget: checksum invalid
>>>>>>>>>> [    8.736664] scsi host1: Spurious irq, sreg=10.
>>>>>>>>>> [    8.760106] Starting init: /sbin/init exists but couldn't execute it 
>>>>>>>>>> (error -67)
>>>>>>>>>
>>>>>>>>> The driver isn't so bad in general.
>>>>>>>>>
>>>>>>>>> With my current seabios-hppa from
>>>>>>>>> https://github.com/hdeller/seabios-hppa/tree/devel
>>>>>>>>> and booting like this:
>>>>>>>>>
>>>>>>>>> ./qemu-system-hppa -drive file=../qemu-images/hdd.img.new,if=none,id=d0 
>>>>>>>>> -serial mon:stdio -smp cpus=3  -machine C3700  -nographic  -snapshot -device 
>>>>>>>>> dc390,id=scsi -device scsi-hd,bus=scsi.0,drive=d0  -bios 
>>>>>>>>> ../seabios-hppa/out/hppa-firmware.img
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> it actually can *partly* boot from disc:
>>>>>>>>> ...
>>>>>>>>> Selected kernel: /vmlinux from partition 2
>>>>>>>>> Selected ramdisk: /initrd.img from partition 2
>>>>>>>>> ELF64 executable
>>>>>>>>> Segment 0 load 0x000e0000 size 5171564 mediaptr 0x1000
>>>>>>>>> Segment 1 load 0x01a00000 size 25012 mediaptr 0x4f0000
>>>>>>>>> Loading ramdisk 23869192 bytes @ 3e92a000...
>>>>>>>>>
>>>>>>>>> Decompressing Linux... XZ-compressed data is corrupt
>>>>>>>>>   -- System halted
>>>>>>>>>
>>>>>>>>> So, it can read partition table, even load some sectors, but
>>>>>>>>> the data returned can be corrupt, as the "XZ-compressed data is corrupt"
>>>>>>>>> message states.
>>>>>>>>> This fits with the CRC checksum errors I saw when booting
>>>>>>>>> from ext4 disc.
>>>>>>>>>
>>>>>>>>> Is the dc390/esp driver functional on other big-endian machines?
>>>>>>>>
>>>>>>>> Yes it is, in fact the majority of my test images were from SPARC/m68k 
>>>>>>>> (including a hppa image) and the series in its current form passes all my 
>>>>>>>> boot tests except for an x86 DOS image with ASPI.
>>>>>>>>
>>>>>>>> The command line I used for testing hppa is below:
>>>>>>>>
>>>>>>>> ./qemu-system-hppa \
>>>>>>>>      -kernel vmlinux-parisc \
>>>>>>>>      -no-reboot \
>>>>>>>>      -snapshot \
>>>>>>>>      -device am53c974,id=scsi \
>>>>>>>>      -device scsi-hd,bus=scsi.0,drive=d0 \
>>>>>>>>      -drive file=rootfs.ext2-parisc,format=raw,if=none,id=d0 \
>>>>>>>>      -append "panic=-1 slub_debug=FZPUA root=/dev/sda console=ttyS0,115200" \
>>>>>>>>      -nographic -monitor null
>>>>>>>>
>>>>>>>> If you are still seeing errors then I'd suspect an issue with the hppa CPU 
>>>>>>>> emulation or the esp-pci device.
>>>>>>>>
>>>>>>>
>>>>>>> I suspect it has more to do with ext4 vs. ext2 because ext2 works just fine 
>>>>>>> for me
>>>>>>> while I get unaligned access crashes with ext4. I started some tests with btrfs
>>>>>>> and f2fs in addition to ext2 to see how those are doing.
>>>>>>
>>>>>> That sounds really useful, thanks for testing.
>>>>>
>>>>> I think there are multiple issues.
>>>>> Most likely some CPU emulation bug, maybe happens in CRC checksumming.
>>>>>
>>>>> Nevertheless, with this command:
>>>>> ./qemu-system-hppa -drive file=../qemu-images/hdd.img.new,if=none,id=d0  -serial 
>>>>> mon:stdio -smp cpus=3  -machine C3700  -nographic  -snapshot -device 
>>>>> am53c974,id=scsi -device scsi-hd,bus=scsi.0,drive=d0  -bios 
>>>>> ../seabios-hppa/out/hppa-firmware.img
>>>>> I get this error:
>>>>> Decompressing Linux... XZ-compressed data is corrupt
>>>>>
>>>>> Replacing the scsi driver "am53c974" by "lsi53c895a" does boot.
>>>>> At this stage no linux kernel is loaded yet, it's just the seabios-hppa
>>>>> which loaded some scsi blocks into memory.
>>>>
>>>> Does the esp driver has a limit of only being able to
>>>> load max. 64kb at once (per SCSI command) ?
>>>> By reducing to 64kb, booting directly from Seabios-hppa
>>>> now works for me.
>>>
>>> From a QEMU perspective it should support a maximum 24-bit transfer size.
>>
>> I fixed it now in my Seabio-hppa devel branch.
>> Booting from firmware now works (with your branch), but kernel
>> still shows crc errors, which is probably a cpu emulation bug.
>> Still analyzing.
> 
> If I limit the disc transfer size of am53c974 to just 4K per transaction
> (like the patch below against Linux kernel 6.6.4), then qemu-hppa
> boots up nicely with qemu git head (and Günther's patches applied).

Nice detective work :)

If you're using the esp-rework-testing branch then the only patch you should need is 
the patch to esp-pci.c: otherwise if you also apply Günther's esp.c patch then you 
break the reset of the ESP_RSTAT flags when reading ESP_RINTR. Can you confirm that 
this is the case in your tests?

> No ext4 crc errors in this case.
> Mark, your git tree then still gives IRQ issues and other problems.

Presumably this is just the "Spurious irq, sreg=%02x." errors, or are you seeing 
something else?

> I wonder if this isn't a qemu issue....
> 
> diff --git a/drivers/scsi/am53c974.c b/drivers/scsi/am53c974.c
> index fbb29dbb1e50..f2066544da5e 100644
> --- a/drivers/scsi/am53c974.c
> +++ b/drivers/scsi/am53c974.c
> @@ -251,6 +251,7 @@ static u32 pci_esp_dma_length_limit(struct esp *esp, u32 
> dma_addr, u32 dma_len)
>           */
>          if (esp->config2 & ESP_CONFIG2_FENAB)
>                  dma_limit = 24;
> +dma_limit = 12; // 4096 bytes
> 
>          if (dma_len > (1U << dma_limit))
>                  dma_len = (1U << dma_limit);


ATB,

Mark.



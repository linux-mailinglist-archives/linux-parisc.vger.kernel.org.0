Return-Path: <linux-parisc+bounces-181-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDF580AED9
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 22:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691222810F8
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 21:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A645788B;
	Fri,  8 Dec 2023 21:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=ilande.co.uk header.i=@ilande.co.uk header.b="0aF3mqbo"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail.ilande.co.uk (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E71BA
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 13:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Iu/iRvLWb0ysWpNbNN1UZqTeZIULf+XXEhtiX6yJnE4=; b=0aF3mqboRCg6oPfApKXa2Q7LmM
	+nuk8CmMXwxnBFIaJGdr1MwHMB2pBS3J9f3h5EF2z6uuCGWpM+DmFCQ7mHC+/ZdIJEs+OHItvgXBZ
	E7cQJBRNLsBBxV6zlquM70pWhtnpTCQF0RFVGO04DGrPFrE2mc6hyL+YtnHEtwLP4OU189PCYpFgP
	youck4NRYTsHxJQG+lZuYmWGV+D/os0qzuPkIa85WmWCeuSyGZ8uzWzzf1CRxJ0+6VB3xP7hhdaBd
	4PTZUxQtHdkIP6XReKfZp+JvOmjTzh3c4vbNG+UYZ/oLwbHLTugSSZybl+wfMG43gRJ5qj0Ar3phP
	tx2fIgWqo/j0ajJTOYwtejUkFXkI7t7+HJnMddpzGTyPUv1QLZPsylKeFx8jmcWLZCSMHAQ9BRe2B
	w6iP5ZnswdK/PB90NtKYmdj9YUYmTbrNTw+d+T1DHxctDVObX+W7aZ2iFS7qjRdmMKsSqd5NHFP7N
	CjoUueAt+uw2lhSUDGcLpR/Vyik0Rd9VLi+KGClXbHUhA5CipflSkbF6XVwHfq0z8qcdv2bI+NMNT
	aoZms17wzLgKNr4FDv+jjWvpbQ6jR7ebpxUCXCowF0a+FclWZazypadUSCdvsiEn58c/30AKZBoxw
	y3sbVP+pc+ArBmGshva0ibt5c7M9o6wyiQm+EzOtI=;
Received: from [2a00:23c4:8bb0:f100:9601:9e38:9395:46ea]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1rBiOw-0009L4-Rw; Fri, 08 Dec 2023 21:28:54 +0000
Message-ID: <d7cfbde3-f6dc-4098-ba82-bbaa66745091@ilande.co.uk>
Date: Fri, 8 Dec 2023 21:29:08 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
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
 <97729a4b-5ef7-42ad-897d-a57cd9a5a5bf@ilande.co.uk>
 <a68b234a-c202-44ca-bb45-5cbb86b5729b@gmx.de>
 <ae5e04f4-3979-4a6e-8cff-58f69e41fb08@gmx.de>
 <ace59824-daff-4d6b-a887-0bcce1d46719@roeck-us.net>
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
In-Reply-To: <ace59824-daff-4d6b-a887-0bcce1d46719@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb0:f100:9601:9e38:9395:46ea
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Level: 
Subject: Re: 64-bit userspace root file system for hppa64
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

On 08/12/2023 20:32, Guenter Roeck wrote:

> On 12/8/23 11:37, Helge Deller wrote:
>> On 12/8/23 20:26, Helge Deller wrote:
>>>> Yeah that's one of the many bugs which should be fixed by my latest
>>>> series. I've pushed the current version of my branch with the ESP
>>>> rewrite to https://github.com/mcayland/qemu/tree/esp-rework-testing
>>>> if you would both like to give it a test.
>>>
>>> Tried it with qemu-hppa:
>>>
>>> [    4.257547] am53c974 0000:00:04.0: enabling SERR and PARITY (0107 -> 0147)
>>> [    4.917824] am53c974 0000:00:04.0: esp0: regs[(ptrval):(ptrval)] irq[70]
>>> [    4.918704] am53c974 0000:00:04.0: esp0: is a AM53C974, 40 MHz (ccf=0), SCSI ID 15
>>> [    8.010626] scsi host1: esp
>>> [    8.026345] scsi 1:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    2.5+ PQ: 
>>> 0 ANSI: 5
>>> [    8.032066] scsi target1:0:0: Beginning Domain Validation
>>> [    8.043254] scsi target1:0:0: Domain Validation skipping write tests
>>> [    8.044284] scsi target1:0:0: Ending Domain Validation
>>> [    8.123681] sd 1:0:0:0: Power-on or device reset occurred
>>> [    8.134707] sd 1:0:0:0: [sda] 209715200 512-byte logical blocks: (107 GB/100 GiB)
>>> [    8.140043] sd 1:0:0:0: [sda] Write Protect is off
>>> [    8.144759] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, 
>>> doesn't support DPO or FUA
>>> [    8.205316]  sda: sda1 sda2 sda3 < sda5 sda6 >
>>> [    8.222763] sd 1:0:0:0: [sda] Attached SCSI disk
>>> [    8.231170] sd 1:0:0:0: Attached scsi generic sg0 type 0
>> ...> [    8.679666] Freeing unused kernel image (initmem) memory: 3072K
>>> [    8.680679] Write protected read-only-after-init data: 2k
>>> [    8.681338] Run /sbin/init as init process
>>> [    8.731576] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787975: comm 
>>> swapper/0: iget: checksum invalid
>>> [    8.736664] scsi host1: Spurious irq, sreg=10.
>>> [    8.760106] Starting init: /sbin/init exists but couldn't execute it (error -67)
>>
>> The driver isn't so bad in general.
>>
>> With my current seabios-hppa from
>> https://github.com/hdeller/seabios-hppa/tree/devel
>> and booting like this:
>>
>> ./qemu-system-hppa -drive file=../qemu-images/hdd.img.new,if=none,id=d0  -serial 
>> mon:stdio -smp cpus=3  -machine C3700  -nographic  -snapshot -device dc390,id=scsi 
>> -device scsi-hd,bus=scsi.0,drive=d0  -bios ../seabios-hppa/out/hppa-firmware.img
>>
>>
>> it actually can *partly* boot from disc:
>> ...
>> Selected kernel: /vmlinux from partition 2
>> Selected ramdisk: /initrd.img from partition 2
>> ELF64 executable
>> Segment 0 load 0x000e0000 size 5171564 mediaptr 0x1000
>> Segment 1 load 0x01a00000 size 25012 mediaptr 0x4f0000
>> Loading ramdisk 23869192 bytes @ 3e92a000...
>>
>> Decompressing Linux... XZ-compressed data is corrupt
>>   -- System halted
>>
>> So, it can read partition table, even load some sectors, but
>> the data returned can be corrupt, as the "XZ-compressed data is corrupt"
>> message states.
>> This fits with the CRC checksum errors I saw when booting
>> from ext4 disc.
>>
>> Is the dc390/esp driver functional on other big-endian machines?
>>
> 
> It might make sense to try booting from some other controller. I tried
> various usb variants as well as nvme, sata-cmd646, and sdhci (mmc).
> This would help identifying if the problem has to do with your ext4 image.
> I am not saying that the ext4 image is bad, but it might trigger something
> that the emulation doesn't like.

I've also had cases working on the ESP series whereby an error would corrupt the 
underlying disk image, and then I'd roll back to an earlier commit and wonder why 
things had stopped working again. Restoring the working image from a backup made 
things start to function as expected.

For testing in QEMU I highly recommend using a qcow2 image with the -snapshot option 
so that the original image remains untouched regardless of any bugs in the emulation.


ATB,

Mark.



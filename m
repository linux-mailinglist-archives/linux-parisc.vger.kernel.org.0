Return-Path: <linux-parisc+bounces-189-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C64A80B14A
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Dec 2023 02:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B0891C20A51
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Dec 2023 01:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3973EA2;
	Sat,  9 Dec 2023 01:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2sPo3Xy"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08A51724
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 17:11:03 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6d9fa8f6535so183828a34.0
        for <linux-parisc@vger.kernel.org>; Fri, 08 Dec 2023 17:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702084263; x=1702689063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=m2kbwjHn/KBXpaYlPgbHsS3ZSOWWDLXp/962Pyg+LZM=;
        b=i2sPo3XymCooJazOYYfN/1cGJfgBho09NmbilnvV6F9gqO7ybeSoXwoNG0eBdGT4d3
         KQBomzVThMVwXJ/05XBHPCNdJa9iWL1nfLPqhDV5m+LBLq+gByJha25V6U+26CNmRu+E
         pC4LngjThpp/ORHXDtHdL6wgZ+exZu3QBh206x/JI9KhNff7oztU/dU0EZ5vl3Iuw2K3
         qZ1JzGny4yGuYXQ2QijrAoHb8bZTfP8wNX5T6tBWZbEc/7oR8/BTSedz0fUjXwdYB3T/
         +okXCks9fKIq7OtDC4HS2W95OY6ncMp7uANtOa9SCQP55AgdjxBgf7mvD1aEPWuJHQu3
         Zj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702084263; x=1702689063;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2kbwjHn/KBXpaYlPgbHsS3ZSOWWDLXp/962Pyg+LZM=;
        b=dyV5rMsQ9VBMsqkWCDzUAznMKvI1Qvv8HxBvxnbvAmwvFMrz2Del2suatnhUC1KuAU
         Pj3stDgSTGisHx27HJnSyg7SGGEo3XAU0KmLZjKX/i58ugAH7Q2jxg9IXsIZAD8e3uqg
         Oh9iGg9+MoWw/LsaOBLE/u3kT9mscXYps30cGt+TEd3QcsNHf/vPH+UQ4awzQczE5ynj
         HPLHwEquRAYvLUcUYpnEJ8QFw+iVEWO3Kvx0drBCujnZmSigCP0nssqefwG5F4KwLTi8
         KxH1VMEmpS/+ZhwOMlhsL8yGCjSCCWjGitAx4+NSGdcZx0+eoWbxuCcbVGERkJ7UjBaZ
         evcQ==
X-Gm-Message-State: AOJu0YxhYz1ELfAcBGmSf6aRUXNSpnhOkaVKQ/Y5/XsSumDbg3LAgypW
	CtNAKKasAdBSWBDcFFPev3HvS91anSI=
X-Google-Smtp-Source: AGHT+IHA8HzwV1610CbCpz815BS3wEtZWFcCD7c98cMzi3oBajKmjvr/fs1Lo/pusNQeitf/bEKneg==
X-Received: by 2002:a05:6830:14d2:b0:6d9:aac1:228 with SMTP id t18-20020a05683014d200b006d9aac10228mr907714otq.40.1702084262850;
        Fri, 08 Dec 2023 17:11:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r9-20020a05683001c900b006d7eaaa65a4sm531405ota.71.2023.12.08.17.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 17:11:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e0f7d9a9-a806-452b-afe9-1724dd9e962b@roeck-us.net>
Date: Fri, 8 Dec 2023 17:11:00 -0800
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
 <015b31ba-f440-4fb1-af0c-265f484bc91a@ilande.co.uk>
 <4ba17f2d-632c-4c49-a9d0-46324b5e5d7e@roeck-us.net>
 <68c3b5c9-4986-48c6-9cdb-52da59486e4c@ilande.co.uk>
 <f3777cce-31af-4632-9480-bc1f78285d2f@gmx.de>
 <df586906-2950-4b55-b26a-50e75d25f195@gmx.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <df586906-2950-4b55-b26a-50e75d25f195@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/8/23 15:36, Helge Deller wrote:
> On 12/8/23 23:09, Helge Deller wrote:
>> On 12/8/23 22:25, Mark Cave-Ayland wrote:
>>> On 08/12/2023 20:28, Guenter Roeck wrote:
>>>> On 12/8/23 11:55, Mark Cave-Ayland wrote:
>>>>> On 08/12/2023 19:37, Helge Deller wrote:
>>>>>
>>>>>> On 12/8/23 20:26, Helge Deller wrote:
>>>>>>>> Yeah that's one of the many bugs which should be fixed by my latest
>>>>>>>> series. I've pushed the current version of my branch with the ESP
>>>>>>>> rewrite to https://github.com/mcayland/qemu/tree/esp-rework-testing
>>>>>>>> if you would both like to give it a test.
>>>>>>>
>>>>>>> Tried it with qemu-hppa:
>>>>>>>
>>>>>>> [    4.257547] am53c974 0000:00:04.0: enabling SERR and PARITY (0107 -> 0147)
>>>>>>> [    4.917824] am53c974 0000:00:04.0: esp0: regs[(ptrval):(ptrval)] irq[70]
>>>>>>> [    4.918704] am53c974 0000:00:04.0: esp0: is a AM53C974, 40 MHz (ccf=0), SCSI ID 15
>>>>>>> [    8.010626] scsi host1: esp
>>>>>>> [    8.026345] scsi 1:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    2.5+ PQ: 0 ANSI: 5
>>>>>>> [    8.032066] scsi target1:0:0: Beginning Domain Validation
>>>>>>> [    8.043254] scsi target1:0:0: Domain Validation skipping write tests
>>>>>>> [    8.044284] scsi target1:0:0: Ending Domain Validation
>>>>>>> [    8.123681] sd 1:0:0:0: Power-on or device reset occurred
>>>>>>> [    8.134707] sd 1:0:0:0: [sda] 209715200 512-byte logical blocks: (107 GB/100 GiB)
>>>>>>> [    8.140043] sd 1:0:0:0: [sda] Write Protect is off
>>>>>>> [    8.144759] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>>>>>>> [    8.205316]  sda: sda1 sda2 sda3 < sda5 sda6 >
>>>>>>> [    8.222763] sd 1:0:0:0: [sda] Attached SCSI disk
>>>>>>> [    8.231170] sd 1:0:0:0: Attached scsi generic sg0 type 0
>>>>>> ...> [    8.679666] Freeing unused kernel image (initmem) memory: 3072K
>>>>>>> [    8.680679] Write protected read-only-after-init data: 2k
>>>>>>> [    8.681338] Run /sbin/init as init process
>>>>>>> [    8.731576] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787975: comm swapper/0: iget: checksum invalid
>>>>>>> [    8.736664] scsi host1: Spurious irq, sreg=10.
>>>>>>> [    8.760106] Starting init: /sbin/init exists but couldn't execute it (error -67)
>>>>>>
>>>>>> The driver isn't so bad in general.
>>>>>>
>>>>>> With my current seabios-hppa from
>>>>>> https://github.com/hdeller/seabios-hppa/tree/devel
>>>>>> and booting like this:
>>>>>>
>>>>>> ./qemu-system-hppa -drive file=../qemu-images/hdd.img.new,if=none,id=d0  -serial mon:stdio -smp cpus=3  -machine C3700  -nographic  -snapshot -device dc390,id=scsi -device scsi-hd,bus=scsi.0,drive=d0  -bios ../seabios-hppa/out/hppa-firmware.img
>>>>>>
>>>>>>
>>>>>> it actually can *partly* boot from disc:
>>>>>> ...
>>>>>> Selected kernel: /vmlinux from partition 2
>>>>>> Selected ramdisk: /initrd.img from partition 2
>>>>>> ELF64 executable
>>>>>> Segment 0 load 0x000e0000 size 5171564 mediaptr 0x1000
>>>>>> Segment 1 load 0x01a00000 size 25012 mediaptr 0x4f0000
>>>>>> Loading ramdisk 23869192 bytes @ 3e92a000...
>>>>>>
>>>>>> Decompressing Linux... XZ-compressed data is corrupt
>>>>>>   -- System halted
>>>>>>
>>>>>> So, it can read partition table, even load some sectors, but
>>>>>> the data returned can be corrupt, as the "XZ-compressed data is corrupt"
>>>>>> message states.
>>>>>> This fits with the CRC checksum errors I saw when booting
>>>>>> from ext4 disc.
>>>>>>
>>>>>> Is the dc390/esp driver functional on other big-endian machines?
>>>>>
>>>>> Yes it is, in fact the majority of my test images were from SPARC/m68k (including a hppa image) and the series in its current form passes all my boot tests except for an x86 DOS image with ASPI.
>>>>>
>>>>> The command line I used for testing hppa is below:
>>>>>
>>>>> ./qemu-system-hppa \
>>>>>      -kernel vmlinux-parisc \
>>>>>      -no-reboot \
>>>>>      -snapshot \
>>>>>      -device am53c974,id=scsi \
>>>>>      -device scsi-hd,bus=scsi.0,drive=d0 \
>>>>>      -drive file=rootfs.ext2-parisc,format=raw,if=none,id=d0 \
>>>>>      -append "panic=-1 slub_debug=FZPUA root=/dev/sda console=ttyS0,115200" \
>>>>>      -nographic -monitor null
>>>>>
>>>>> If you are still seeing errors then I'd suspect an issue with the hppa CPU emulation or the esp-pci device.
>>>>>
>>>>
>>>> I suspect it has more to do with ext4 vs. ext2 because ext2 works just fine for me
>>>> while I get unaligned access crashes with ext4. I started some tests with btrfs
>>>> and f2fs in addition to ext2 to see how those are doing.
>>>
>>> That sounds really useful, thanks for testing.
>>
>> I think there are multiple issues.
>> Most likely some CPU emulation bug, maybe happens in CRC checksumming.
>>
>> Nevertheless, with this command:
>> ./qemu-system-hppa -drive file=../qemu-images/hdd.img.new,if=none,id=d0  -serial mon:stdio -smp cpus=3  -machine C3700  -nographic  -snapshot -device am53c974,id=scsi -device scsi-hd,bus=scsi.0,drive=d0  -bios ../seabios-hppa/out/hppa-firmware.img
>> I get this error:
>> Decompressing Linux... XZ-compressed data is corrupt
>>
>> Replacing the scsi driver "am53c974" by "lsi53c895a" does boot.
>> At this stage no linux kernel is loaded yet, it's just the seabios-hppa
>> which loaded some scsi blocks into memory.
> 
> Does the esp driver has a limit of only being able to
> load max. 64kb at once (per SCSI command) ?
> By reducing to 64kb, booting directly from Seabios-hppa
> now works for me.
> 

Larger than 64k transfers are supposedly enabled by setting bit 6 of CNTLREG2.
As fas as I can see, the qemu driver does not check if the bit is set and always
supports large transfers. Unless I am missing something, the linux driver limits
DMA transfer length to 64k, so it is at least questionable if larger transfers
have ever been tested.

Guenter



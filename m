Return-Path: <linux-parisc+bounces-187-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2380B075
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Dec 2023 00:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFD661C20AC2
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 23:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1585733C;
	Fri,  8 Dec 2023 23:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzE2tYrA"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B1C90
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 15:15:30 -0800 (PST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1fb71880f12so1616734fac.0
        for <linux-parisc@vger.kernel.org>; Fri, 08 Dec 2023 15:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702077330; x=1702682130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bNleUVEWLc23CovIHsjpmcnY0KBnSW3n8J8Uq7wqRYM=;
        b=XzE2tYrAo6ifi5+t0U5VSvtFHs411g8bR3JLKtF8cETkp2IBy3fLWi3NMch9EkNAFu
         PuGPEi7ONI1VLmWDQuws4Uu75fIkbfU/bs67kVwiyxYxiVT92w4zcQHt8SzxHidWWw0o
         fm0n+NmcNL7S15zHkm+za/H2ltgxnTuotYYyE5wb9SLmiV1RivQcIiMY+99xd0aK9ecF
         rX4vO8Y6xMCBiKLh6M9zT0x/2xhAzKYzHp71P1KgsPN0E/7gX63nQMxAjZSxNvPhNHNY
         id8daY2ovwVQce91VyGp+4hxZC/CphUd/0dIafDiapIJmth7AKwugQDp3zjMHxy+xlsj
         POyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702077330; x=1702682130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNleUVEWLc23CovIHsjpmcnY0KBnSW3n8J8Uq7wqRYM=;
        b=VfjZ62/UFTZ9jhHo9w471fi8VSJuW/aK1mrHOBHHJIBYDOQ7AgX5yL+b4lkewUegYw
         KMbvw1MHlvny0fvNBiR+LyHCBBumrpTPZT5WDca8lhGp8V027HKp+LQgmS4Zno9DxZtO
         070TJufJws7cZxBQsEyrqg+bByqa3MroBYmgIgr7v0idxRf7HjJjj7p/uho8vKld3JE5
         whCZzqcsaNVny8Ml+MbKLMFSnl1QTdgZVqUGFK1VYrt3rZhhOSM8dTH3smUoq9qcEdGk
         w892QNlGA7qCnuELFSnWxyb2+NeKnzIEbOUOKVxce350GpV554jqZ405J8aTTnI7SLFi
         dxXg==
X-Gm-Message-State: AOJu0YwjoRa8E0O4gbbkQFgMKkikKNBwU1gSaB/u2MlN6q1Y3Ri2jJ5m
	8+nhp5vN1F79P1xZb4vRZ5wzCoMnwvE=
X-Google-Smtp-Source: AGHT+IH1b17OY2T9Z98XPwpYYhkGlJomvWHIVVFx+JVH3c5MZ/8vw0JihpMW7RKmg+QSsS3AoTW/gw==
X-Received: by 2002:a05:6871:a69f:b0:1fb:75a:77b7 with SMTP id wh31-20020a056871a69f00b001fb075a77b7mr900423oab.104.1702077329576;
        Fri, 08 Dec 2023 15:15:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id hg5-20020a056870790500b001fa1db68eecsm665008oab.4.2023.12.08.15.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 15:15:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e08760ee-f99d-4d98-a96e-50cab679cbc0@roeck-us.net>
Date: Fri, 8 Dec 2023 15:15:27 -0800
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
 <8bdc89de-90a5-4b7a-b6d1-2e3bd9fa7314@roeck-us.net>
 <ade25e81-2d1a-416a-9f02-1944aa03261c@ilande.co.uk>
 <c3c70dbd-d139-4fff-8de4-ef531214ac2e@gmx.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <c3c70dbd-d139-4fff-8de4-ef531214ac2e@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/8/23 14:05, Helge Deller wrote:
> On 12/8/23 22:23, Mark Cave-Ayland wrote:
>> On 08/12/2023 20:11, Guenter Roeck wrote:
>>
>>> On 12/8/23 07:54, Helge Deller wrote:
>>> [ ... ]
>>>
>>>>
>>>> Does qemu-hppa boot for you with those patches?
>>>> Even with those I see the discs are found, but later I get:
>>>> [    8.519780] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787975: comm swapper/0: iget: checksum invalid
>>>> [    8.545363] Starting init: /sbin/init exists but couldn't execute it (error -67)
>>>> [    8.546339] Run /etc/init as init process
>>>> [    8.561422] Run /bin/init as init process
>>>> [    8.574649] Run /bin/sh as init process
>>>> [    8.580495] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787980: comm swapper/0: iget: checksum invalid
>>>> [    8.586170] Starting init: /bin/sh exists but couldn't execute it (error -67)
>>>>
>>>
>>> This is what I get when trying to boot from an ext4 file system:
>>>
>>> [   30.664669] Unaligned handler failed, ret = -14
>>> [   30.665314]       _______________________________
>>> [   30.665314]      < Your System ate a SPARC! Gah! >
>>> [   30.665314]       -------------------------------
>>> [   30.665314]              \   ^__^
>>> [   30.665314]                  (__)\       )\/\
>>> [   30.665314]                   U  ||----w |
>>> [   30.665314]                      ||     ||
>>> [   30.665925] ip (pid 689): Unaligned data reference (code 28)
>>> [   30.666282] CPU: 0 PID: 689 Comm: ip Tainted: G                 N 6.7.0-rc4-64bit+ #1
>>> [   30.666487] Hardware name: 9000/785/C3700
>>> [   30.666724]
>>> [   30.666812]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>>> [   30.666978] PSW: 00001000000001001111111100001111 Tainted: G                 N
>>> [   30.667164] r00-03  000000ff0804ff0f 00000000413f57c0 00000000401e15c0 00000000451d8d60
>>> [   30.667351] r04-07  00000000412d5fc0 00000000451d8c78 00000000411bcfe0 00000000417813f8
>>> [   30.667511] r08-11  000000004128e7c0 0000000000000010 00000000000000a0 0000000073c00008
>>> [   30.667665] r12-15  0000000000000000 0000000000000cc0 0000000043086000 0000000041f29640
>>> [   30.667817] r16-19  0000000000000040 00000000451d8a10 0000000041ede0c0 0000000000000000
>>> [   30.667968] r20-23  ffffffffffe00009 0000000073c00008 000000006bc23fd9 000000000fc212c1
>>> [   30.668119] r24-27  0000000000000000 0000000000000008 081e0241371e0200 00000000412d5fc0
>>> [   30.668273] r28-31  0000000000000000 00000000451d8e00 00000000451d8e30 00000000f8ce25bc
>>> [   30.669027] sr00-03  0000000000016c00 0000000000000000 0000000000000000 0000000000016c00
>>> [   30.669292] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>> [   30.669523]
>>> [   30.669615] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401e160c 00000000401e15ec
>>> [   30.669870]  IIR: 0fe010dc    ISR: 0000000000000000  IOR: 00000000f8ce25bc
>>> [   30.670072]  CPU:        0   CR30: 0000000043086000 CR31: 0000000000000000
>>> [   30.670270]  ORIG_R28: 00000000402a48b8
>>> [   30.670407]  IAOQ[0]: unwind_once+0x5dc/0x5e0
>>> [   30.671165]  IAOQ[1]: unwind_once+0x5bc/0x5e0
>>> [   30.671332]  RP(r2): unwind_once+0x590/0x5e0
>>> [   30.671575] Backtrace:
>>> [   30.671804]  [<00000000401e482c>] walk_stackframe.constprop.0+0xb4/0x138
>>> [   30.672059]  [<00000000401e48e8>] arch_stack_walk+0x38/0x50
>>> [   30.672232]  [<00000000402a8a8c>] stack_trace_save+0x5c/0x78
>>> [   30.673233]  [<00000000403b2cc4>] set_track_prepare+0x5c/0xa0
>>> [   30.673694]  [<00000000403ba8ec>] ___slab_alloc+0x554/0x930
>>> [   30.673917]  [<00000000403bad28>] __slab_alloc.constprop.0+0x60/0x88
>>> [   30.674141]  [<00000000403bb354>] kmem_cache_alloc+0xf4/0x280
>>> [   30.674342]  [<0000000040389d10>] __anon_vma_prepare+0x98/0x2d0
>>> [   30.674554]  [<0000000040374f50>] __handle_mm_fault+0x410/0xe00
>>> [   30.674752]  [<0000000040375a6c>] handle_mm_fault+0x12c/0x230
>>> [   30.674947]  [<00000000401cc6e0>] do_page_fault+0x1c0/0x708
>>> [   30.675173]  [<00000000401d0b90>] handle_interruption+0xa88/0xbc0
>>> [   30.675367]  [<00000000411bd000>] arch_atomic64_add+0x20/0xb0
>>>
>>> That is also seen randomly when booting from other controllers, so it is
>>> not specific to the scsi driver.
>>
>> This certainly feels like a CPU emulation bug, for example checksums
>> as used by ext4 may make use of optimised instructions for
>> performance which aren't commonly used.>
> 
> Although CPU emulation bug might be true (I suspect something like that too),
> this specific crash is due to a bug in the unwind_once() function.
> This patch:
> https://github.com/hdeller/linux/commit/3c4092001f4c2e9c842afd60d1391a0b6ed4565e
> should fix it. It's in my for-next tree.

With that patch on top of the mainline kernel (5e3f5b81de80c98) I get

[   16.778983] Run /sbin/init as init process
[   16.795086] process '/bin/busybox' started with executable stack
[   16.906327] CPU: 0 PID: 605 Comm: init Tainted: G                 N 6.7.0-rc4-64bit+ #1
[   16.906577] Hardware name: 9000/785/C3700
[   16.906813]
[   16.906896]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[   16.907042] PSW: 00001000000001101111100000001110 Tainted: G                 N
[   16.907241] r00-03  000000ff0806f80e 00000000413931a0 00000000413564a0 00000000f922f180
[   16.907421] r04-07  000000004135f9a0 0000000043560010 0000000041cd2120 000000004486af90
[   16.907570] r08-11  0000000000000000 00000000435604c0 fffffffffffffe00 000000004138e9a0
[   16.907713] r12-15  000000004020682c fffffffffffffe00 0000000000000006 0000000000000000
[   16.907855] r16-19  0000000000000000 0000000000000000 0000000000000000 00000003ef990eec
[   16.907998] r20-23  0000000000000000 000000006d640000 0000000000000000 0000000041cd2a30
[   16.908141] r24-27  0000000041cd2a30 000000004486af90 0000000043560010 000000004135f9a0
[   16.908283] r28-31  00000000413599a0 0000000043508580 00000000451dc080 ffffffffc0000000
[   16.908443] sr00-03  0000000000000400 0000000000000000 0000000000000000 0000000000000800
[   16.908600] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   16.908600]
[   16.908600] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000413564a0 00000000413564a4
[   16.908600]  IIR: 00000000    ISR: 0000000000000000  IOR: 00000000413564a0
[   16.908600]  CPU:        0   CR30: 000000004486af90 CR31: 0000000000000000
[   16.908600]  ORIG_R28: 0000000000000000
[   16.908600]  IAOQ[0]: sys_vfork_wrapper+0x58/0x60
[   16.908600]  IAOQ[1]: 0x401cae9c00000000
[   16.908600]  RP(r2): sys_vfork_wrapper+0x58/0x60
[   16.908600] Backtrace:

That keeps repeating forever until I abort the emulation.
This is with initramfs, no drives involved.

I also tried your entire for-next branch, but unfortunately that doesn't compile
for me.

Guenter



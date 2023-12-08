Return-Path: <linux-parisc+bounces-174-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CBC80AD97
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 21:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A21D31C2080C
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 20:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7764F8AD;
	Fri,  8 Dec 2023 20:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITnuV+Tu"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F434F1
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 12:11:10 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b9e2d50e61so1207266b6e.2
        for <linux-parisc@vger.kernel.org>; Fri, 08 Dec 2023 12:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702066269; x=1702671069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sf1mgcMu9TuF2qsBJcXMfw2ah23jAu9kzgq0p62xD/A=;
        b=ITnuV+TuYGFpOECzON2gvqP9Bgx+JJk7+q9gDigmGyvhbRBON/zWOANj5JTmJtXRNY
         biV4h7NKktJtH9l+bEP0ajcoLghZuVGyqT4YviOvgLUX86hUhqRUikrceEq3bTfz8kTR
         /Ta9Ur1IQhffl3rzTPNc8SzAiEzFG2j6cmjpOlOSVpaS2GpfBhzfBI+Fnr7TZjmVlG2u
         EismveEAl2s3o7zigk7+MNblAcu9RHwDRlT8pOfSRjg/2TISZRl6fWw8z/exGBPkn3/Y
         peWGdEtr0a7p59B42XXSS2WJxQXjAiOgXncs31v5CegG3l6rMoOWfKsjt8Leb4VZKPwD
         SmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702066269; x=1702671069;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sf1mgcMu9TuF2qsBJcXMfw2ah23jAu9kzgq0p62xD/A=;
        b=OdElBoBd+pie+EDOXRiL8nJoKKAlRhk482G0RNs1P3emG9GDp7QbG9QgUZ42go6S4s
         G0zcidthq1Fy+z888Zvx1eyKVL96Tx9e+HaMyr7NnVcBPKzxwjQME3gkppC5nff2dh8h
         5gl2+kchVpM3Z+gebV5MKoRr4AOrZgU1orCw2hXxGuMswHNH2Ql1ubIjZY3FIoXjSz9K
         ngK/3NeqDSVaKDRs9piINZeKAevTwjsRhnDVzn+Q//Cv/VVbZAresHdFCzQ8b5RojBK4
         uQr69BmAHQq7ebWtoEJc6YGfmSRNOK65XjC0JD80ccYrqNs1gidl4wTLGakZEx6ASinF
         +T7g==
X-Gm-Message-State: AOJu0YzxmYm1ACLVTaFUOhYhXh2X52kwNrBzPZ+tLaPyzCE69jUuWcON
	Fv211C6RzoB1Y0qKuWf2ses=
X-Google-Smtp-Source: AGHT+IGgSzABQ8lw/A+kTnQEAnrO8VlMN2rVoYXcyU5CyMiWIrhTv6hL8KNqO5U2CfatPch40rWYBA==
X-Received: by 2002:a05:6808:1412:b0:3b8:b063:9b6e with SMTP id w18-20020a056808141200b003b8b0639b6emr731690oiv.96.1702066269555;
        Fri, 08 Dec 2023 12:11:09 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h6-20020a056808014600b003b9d5e265f1sm464748oie.2.2023.12.08.12.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 12:11:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8bdc89de-90a5-4b7a-b6d1-2e3bd9fa7314@roeck-us.net>
Date: Fri, 8 Dec 2023 12:11:08 -0800
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

> 
> Does qemu-hppa boot for you with those patches?
> Even with those I see the discs are found, but later I get:
> [    8.519780] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787975: comm swapper/0: iget: checksum invalid
> [    8.545363] Starting init: /sbin/init exists but couldn't execute it (error -67)
> [    8.546339] Run /etc/init as init process
> [    8.561422] Run /bin/init as init process
> [    8.574649] Run /bin/sh as init process
> [    8.580495] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787980: comm swapper/0: iget: checksum invalid
> [    8.586170] Starting init: /bin/sh exists but couldn't execute it (error -67)
> 

This is what I get when trying to boot from an ext4 file system:

[   30.664669] Unaligned handler failed, ret = -14
[   30.665314]       _______________________________
[   30.665314]      < Your System ate a SPARC! Gah! >
[   30.665314]       -------------------------------
[   30.665314]              \   ^__^
[   30.665314]                  (__)\       )\/\
[   30.665314]                   U  ||----w |
[   30.665314]                      ||     ||
[   30.665925] ip (pid 689): Unaligned data reference (code 28)
[   30.666282] CPU: 0 PID: 689 Comm: ip Tainted: G                 N 6.7.0-rc4-64bit+ #1
[   30.666487] Hardware name: 9000/785/C3700
[   30.666724]
[   30.666812]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[   30.666978] PSW: 00001000000001001111111100001111 Tainted: G                 N
[   30.667164] r00-03  000000ff0804ff0f 00000000413f57c0 00000000401e15c0 00000000451d8d60
[   30.667351] r04-07  00000000412d5fc0 00000000451d8c78 00000000411bcfe0 00000000417813f8
[   30.667511] r08-11  000000004128e7c0 0000000000000010 00000000000000a0 0000000073c00008
[   30.667665] r12-15  0000000000000000 0000000000000cc0 0000000043086000 0000000041f29640
[   30.667817] r16-19  0000000000000040 00000000451d8a10 0000000041ede0c0 0000000000000000
[   30.667968] r20-23  ffffffffffe00009 0000000073c00008 000000006bc23fd9 000000000fc212c1
[   30.668119] r24-27  0000000000000000 0000000000000008 081e0241371e0200 00000000412d5fc0
[   30.668273] r28-31  0000000000000000 00000000451d8e00 00000000451d8e30 00000000f8ce25bc
[   30.669027] sr00-03  0000000000016c00 0000000000000000 0000000000000000 0000000000016c00
[   30.669292] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   30.669523]
[   30.669615] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401e160c 00000000401e15ec
[   30.669870]  IIR: 0fe010dc    ISR: 0000000000000000  IOR: 00000000f8ce25bc
[   30.670072]  CPU:        0   CR30: 0000000043086000 CR31: 0000000000000000
[   30.670270]  ORIG_R28: 00000000402a48b8
[   30.670407]  IAOQ[0]: unwind_once+0x5dc/0x5e0
[   30.671165]  IAOQ[1]: unwind_once+0x5bc/0x5e0
[   30.671332]  RP(r2): unwind_once+0x590/0x5e0
[   30.671575] Backtrace:
[   30.671804]  [<00000000401e482c>] walk_stackframe.constprop.0+0xb4/0x138
[   30.672059]  [<00000000401e48e8>] arch_stack_walk+0x38/0x50
[   30.672232]  [<00000000402a8a8c>] stack_trace_save+0x5c/0x78
[   30.673233]  [<00000000403b2cc4>] set_track_prepare+0x5c/0xa0
[   30.673694]  [<00000000403ba8ec>] ___slab_alloc+0x554/0x930
[   30.673917]  [<00000000403bad28>] __slab_alloc.constprop.0+0x60/0x88
[   30.674141]  [<00000000403bb354>] kmem_cache_alloc+0xf4/0x280
[   30.674342]  [<0000000040389d10>] __anon_vma_prepare+0x98/0x2d0
[   30.674554]  [<0000000040374f50>] __handle_mm_fault+0x410/0xe00
[   30.674752]  [<0000000040375a6c>] handle_mm_fault+0x12c/0x230
[   30.674947]  [<00000000401cc6e0>] do_page_fault+0x1c0/0x708
[   30.675173]  [<00000000401d0b90>] handle_interruption+0xa88/0xbc0
[   30.675367]  [<00000000411bd000>] arch_atomic64_add+0x20/0xb0

That is also seen randomly when booting from other controllers, so it is
not specific to the scsi driver.

Guenter



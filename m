Return-Path: <linux-parisc+bounces-179-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E4F80AECB
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 22:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33D92B20A1C
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 21:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDE6563BE;
	Fri,  8 Dec 2023 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=ilande.co.uk header.i=@ilande.co.uk header.b="MLstHTh0"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail.ilande.co.uk (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F25A9
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 13:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AopsQVn8fZsMszgNUfncC1QU6M/wLRZg76AK+nZL4HE=; b=MLstHTh0Idy5N23vHUWJa1aVtK
	Sn4VlBsSk4KYZT+XgDatanF0LooZa4aWEDHtsKWGqScRNiMRrrkIETYT+2UTpopprtnvi1f7qpTcs
	hBYNLjCv+8Gemc/KQyZjdytp6Q0k8QstAebVAHTCfZe7SF17v2omXz60Q1Cd7zdQUsjbhKS2+5tQh
	XYvbtXU4dXNpigJITmrZmFbqtHolS/rREKl5b+Hsjd5Sw1DO92Jy2yAw03LLNy3Ld/k4m9bLnamnL
	0Z+mMBnGS9jzKE1DVJvmFw58BS9pMHcVbUlCecUTO4Syc0nZz5EY4jx81ydsUnXSqXz+L40h0STP6
	DxN1d8x9Ar1m+Q2HycdSeXX0b8GB1LPvAMVYIe5B9ifMX/f2YDT/mEo2a0MYJ/Oommr9ibiwfrMHT
	Cpc1t9f8RkqGSjAMzbQfT1hheYIi8wPQyLJsDIrhFlgaggNmFljvU11H3V59dXDYBeZKdtgBNGn6F
	poKzgpkflUeIMyw8aHWRs+R6SuVIrLXo23oXRlsXm1DH8FCTiQqlU22EvToWYiilCJ/Yriblb3f6I
	NVbd4nwP1TGP0/RiCl3MHTIiSwhs2OMmz6YFcpmMQGo/OZUKOAqaIDVOJBU0ZsshZkHRLpiiWqVrE
	/+adOkZ93RE6rsu2CYZvij9/SjFGyuEYjE6UPsV1g=;
Received: from [2a00:23c4:8bb0:f100:9601:9e38:9395:46ea]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1rBiJD-0009Jb-UQ; Fri, 08 Dec 2023 21:22:56 +0000
Message-ID: <ade25e81-2d1a-416a-9f02-1944aa03261c@ilande.co.uk>
Date: Fri, 8 Dec 2023 21:23:13 +0000
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
 <55d40485-2aff-4cf5-a379-623bb3b10b7f@gmx.de>
 <8bdc89de-90a5-4b7a-b6d1-2e3bd9fa7314@roeck-us.net>
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
In-Reply-To: <8bdc89de-90a5-4b7a-b6d1-2e3bd9fa7314@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb0:f100:9601:9e38:9395:46ea
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Level: 
Subject: Re: 64-bit userspace root file system for hppa64
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

On 08/12/2023 20:11, Guenter Roeck wrote:

> On 12/8/23 07:54, Helge Deller wrote:
> [ ... ]
> 
>>
>> Does qemu-hppa boot for you with those patches?
>> Even with those I see the discs are found, but later I get:
>> [    8.519780] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787975: comm 
>> swapper/0: iget: checksum invalid
>> [    8.545363] Starting init: /sbin/init exists but couldn't execute it (error -67)
>> [    8.546339] Run /etc/init as init process
>> [    8.561422] Run /bin/init as init process
>> [    8.574649] Run /bin/sh as init process
>> [    8.580495] EXT4-fs error (device sda5): ext4_lookup:1855: inode #787980: comm 
>> swapper/0: iget: checksum invalid
>> [    8.586170] Starting init: /bin/sh exists but couldn't execute it (error -67)
>>
> 
> This is what I get when trying to boot from an ext4 file system:
> 
> [   30.664669] Unaligned handler failed, ret = -14
> [   30.665314]       _______________________________
> [   30.665314]      < Your System ate a SPARC! Gah! >
> [   30.665314]       -------------------------------
> [   30.665314]              \   ^__^
> [   30.665314]                  (__)\       )\/\
> [   30.665314]                   U  ||----w |
> [   30.665314]                      ||     ||
> [   30.665925] ip (pid 689): Unaligned data reference (code 28)
> [   30.666282] CPU: 0 PID: 689 Comm: ip Tainted: G                 N 6.7.0-rc4-64bit+ #1
> [   30.666487] Hardware name: 9000/785/C3700
> [   30.666724]
> [   30.666812]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [   30.666978] PSW: 00001000000001001111111100001111 Tainted: G                 N
> [   30.667164] r00-03  000000ff0804ff0f 00000000413f57c0 00000000401e15c0 
> 00000000451d8d60
> [   30.667351] r04-07  00000000412d5fc0 00000000451d8c78 00000000411bcfe0 
> 00000000417813f8
> [   30.667511] r08-11  000000004128e7c0 0000000000000010 00000000000000a0 
> 0000000073c00008
> [   30.667665] r12-15  0000000000000000 0000000000000cc0 0000000043086000 
> 0000000041f29640
> [   30.667817] r16-19  0000000000000040 00000000451d8a10 0000000041ede0c0 
> 0000000000000000
> [   30.667968] r20-23  ffffffffffe00009 0000000073c00008 000000006bc23fd9 
> 000000000fc212c1
> [   30.668119] r24-27  0000000000000000 0000000000000008 081e0241371e0200 
> 00000000412d5fc0
> [   30.668273] r28-31  0000000000000000 00000000451d8e00 00000000451d8e30 
> 00000000f8ce25bc
> [   30.669027] sr00-03  0000000000016c00 0000000000000000 0000000000000000 
> 0000000000016c00
> [   30.669292] sr04-07  0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [   30.669523]
> [   30.669615] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401e160c 
> 00000000401e15ec
> [   30.669870]  IIR: 0fe010dc    ISR: 0000000000000000  IOR: 00000000f8ce25bc
> [   30.670072]  CPU:        0   CR30: 0000000043086000 CR31: 0000000000000000
> [   30.670270]  ORIG_R28: 00000000402a48b8
> [   30.670407]  IAOQ[0]: unwind_once+0x5dc/0x5e0
> [   30.671165]  IAOQ[1]: unwind_once+0x5bc/0x5e0
> [   30.671332]  RP(r2): unwind_once+0x590/0x5e0
> [   30.671575] Backtrace:
> [   30.671804]  [<00000000401e482c>] walk_stackframe.constprop.0+0xb4/0x138
> [   30.672059]  [<00000000401e48e8>] arch_stack_walk+0x38/0x50
> [   30.672232]  [<00000000402a8a8c>] stack_trace_save+0x5c/0x78
> [   30.673233]  [<00000000403b2cc4>] set_track_prepare+0x5c/0xa0
> [   30.673694]  [<00000000403ba8ec>] ___slab_alloc+0x554/0x930
> [   30.673917]  [<00000000403bad28>] __slab_alloc.constprop.0+0x60/0x88
> [   30.674141]  [<00000000403bb354>] kmem_cache_alloc+0xf4/0x280
> [   30.674342]  [<0000000040389d10>] __anon_vma_prepare+0x98/0x2d0
> [   30.674554]  [<0000000040374f50>] __handle_mm_fault+0x410/0xe00
> [   30.674752]  [<0000000040375a6c>] handle_mm_fault+0x12c/0x230
> [   30.674947]  [<00000000401cc6e0>] do_page_fault+0x1c0/0x708
> [   30.675173]  [<00000000401d0b90>] handle_interruption+0xa88/0xbc0
> [   30.675367]  [<00000000411bd000>] arch_atomic64_add+0x20/0xb0
> 
> That is also seen randomly when booting from other controllers, so it is
> not specific to the scsi driver.

This certainly feels like a CPU emulation bug, for example checksums as used by ext4 
may make use of optimised instructions for performance which aren't commonly used.


ATB,

Mark.



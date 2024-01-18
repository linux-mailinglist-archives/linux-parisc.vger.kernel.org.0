Return-Path: <linux-parisc+bounces-374-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278308320FF
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Jan 2024 22:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80EA0B21B97
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Jan 2024 21:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD143173E;
	Thu, 18 Jan 2024 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b="qmBU8Ysd";
	dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b="JnTyWDD3"
X-Original-To: linux-parisc@vger.kernel.org
Received: from domac.alu.hr (domac.alu.unizg.hr [161.53.235.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFA52C197;
	Thu, 18 Jan 2024 21:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.53.235.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705614283; cv=none; b=Qhy5iUscVuqxfdrmQv4gRU6UU++DIgym0+zVaecgPA1bBINAHu1mipNmrfwD7o9vuaxZBT7NY4evA/91/Xc+9iBgKs0D3Of3Zo7gkv9F8Vtn7hCTJydNZ1TpWZBSYHt5unL/FOV12Xaom+uVnDtSOmdvYvphmVUltNDotV+Peo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705614283; c=relaxed/simple;
	bh=IS1yEaRMuerTQxizDzJWXJ8G5cZ1GL+CPG/5u9t2Fnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f18GxhJSe++8HbS3CuzfHCo8dq0mwR/uaRQGjdCyh60II1Dfq+JYKk1RR1wcJYt8kbQWUoPk+FHEZtOCGIxwjlUkXMYYKW1HOvdwutMbhv+LB/Jf5kfWGyXjFNMwpTbC2l1iRjYOXLHBNA44xlvZDFyUmhr9zpJA9DEyTZAezIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alu.unizg.hr; spf=pass smtp.mailfrom=alu.unizg.hr; dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b=qmBU8Ysd; dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b=JnTyWDD3; arc=none smtp.client-ip=161.53.235.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alu.unizg.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alu.unizg.hr
Received: from localhost (localhost [127.0.0.1])
	by domac.alu.hr (Postfix) with ESMTP id 74432601A5;
	Thu, 18 Jan 2024 22:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1705614275; bh=IS1yEaRMuerTQxizDzJWXJ8G5cZ1GL+CPG/5u9t2Fnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qmBU8YsdJIZZgtpi5Zh0hAsUah5INpLoQmhgnJcrXZ31WfutbQzrzUEv2hhsxcr++
	 wVwbxqD4R/rshgVeI5/+J+tHmZ/54tTItW13vrKZXaDgbajqkL20aAZCKLl7bvSTsp
	 8FeOhSn1iP3LPQVcKAVlicTsknY7Go3tQJFSAd0+Zfn528vcc6WgeoUYx2ROQg4JjU
	 yAEB0/gIZ5iN14tWWPoD3Kl5vGMDMoeA0uB5M1RigW0j7YY6QQJaLC+6YZWjcEkYRZ
	 WKkJWfnYjLyK6U9QJFpZJ66+t2i68f4jWaVuoiB6dVtUnq7qouU0bmmM93tOTsxLZl
	 7A10wK6m+7ZKQ==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
	by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hj2rLTFDBh8j; Thu, 18 Jan 2024 22:44:33 +0100 (CET)
Received: from [192.168.178.20] (dh207-40-167.xnet.hr [88.207.40.167])
	by domac.alu.hr (Postfix) with ESMTPSA id BE6CC601A1;
	Thu, 18 Jan 2024 22:44:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1705614272; bh=IS1yEaRMuerTQxizDzJWXJ8G5cZ1GL+CPG/5u9t2Fnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JnTyWDD3kNHEMWtbilVBMLIVc01OSgOF/i6pubmDiBmvxUQZQ0IL1O1f6Vn7IDZqg
	 jXoUKJxyTuliQU8ZPQnDg7v5zAwn/7t4CnUm6vIQQF28dLtCR40gmkKQzEFOs5RTLv
	 qHHdla3+p2+z7MX/Tl7GccPaHie3zXEBJggUtUeUmYqtSQ9OdxQP+ngKJZukfrPYAR
	 /JPakAugRrIsZkWjmsoeJ7oMm69aCSFZR5r5bfutiMo8WS2NccIoVg6F1ijk0H9kUj
	 nvkoPg/hlrmYa0vKxXEp0H8X4DQSB56A6NFF/bCLE7uLToqzAXhtp5nicdJ7fP3Zw1
	 DxXH3D+btMeTw==
Message-ID: <b9ecdb2e-f62c-4661-a786-496804e09606@alu.unizg.hr>
Date: Thu, 18 Jan 2024 22:44:27 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG][BISECTED] Freeze at loading init ramdisk
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Helge Deller <deller@gmx.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Prathu Baronia <prathubaronia2011@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org
References: <8a6aa228-f2da-4dcd-93c1-e34614cd6471@alu.unizg.hr>
 <cc813525-5484-443e-a40a-cb98f2ed4e1f@alu.unizg.hr>
 <gevqxytidg5efylozindaqntkbl4yeoyzqnh5m3ylitmipgum3@sgmv7qieo7rs>
 <1fe9b78c-7fb5-4d7b-a754-afd563950829@alu.unizg.hr>
 <esh5npfi6ahrlralvmcrnqtrfkarlhsqahbtmfnw5pclr2pf2u@xzitdq6wi7of>
Content-Language: en-US
From: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <esh5npfi6ahrlralvmcrnqtrfkarlhsqahbtmfnw5pclr2pf2u@xzitdq6wi7of>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/18/24 22:14, Uwe Kleine-König wrote:
> On Thu, Jan 18, 2024 at 09:04:05PM +0100, Mirsad Todorovac wrote:
>>
>>
>> On 1/18/24 08:45, Uwe Kleine-König wrote:
>>> Hello Mirsad,
>>>
>>> On Wed, Jan 17, 2024 at 07:47:49PM +0100, Mirsad Todorovac wrote:
>>>> On 1/16/24 01:32, Mirsad Todorovac wrote:
>>>>> On the Ubuntu 22.04 LTS Jammy platform, on a mainline vanilla torvalds tree kernel, the boot
>>>>> freezes upon first two lines and before any systemd messages.
>>>>>
>>>>> (Please find the config attached.)
>>>>>
>>>>> Bisecting the bug led to this result:
>>>>>
>>>>> marvin@defiant:~/linux/kernel/linux_torvalds$ git bisect good
>>>>> d97a78423c33f68ca6543de510a409167baed6f5 is the first bad commit
>>>>> commit d97a78423c33f68ca6543de510a409167baed6f5
>>>>> Merge: 61da593f4458 689237ab37c5
>>>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>>>> Date:   Fri Jan 12 14:38:08 2024 -0800
>>>>>
>>>>> [...]
>>>>>
>>>>> Hope this helps.
>>>>
>>>> P.S.
>>>>
>>>> As I see that this is a larger merge commit, with 5K+ lines changed, I don't think I can
>>>> bisect further to determine the culprit.
>>>
>>> Actually it's not that hard. If a merge commit is the first bad commit
>>> for a bisection, either the merge wasn't done correctly (less likely,
>>> looking at d97a78423c33f68ca6543de510a409167baed6f5 I'd bet this isn't
>>> the problem); or changes on different sides conflict or you did
>>> something wrong during bisection.
>>>
>>> To rule out the third option, you can just retest d97a78423c33,
>>> 61da593f4458 and 689237ab37c5. If d97a78423c33 is the only bad one, you
>>> did it right.
>>
>> This was confirmed.
>>
>>> Then to further debug the second option you can find out the offending
>>> commit on each side with a bisection as follows, here for the RHS (i.e.
>>> 689237ab37c5):
>>>
>>> 	git bisect start 689237ab37c5 $(git merge-base 61da593f4458 689237ab37c5)
>>>
>>> and then in each bisection step do:
>>>
>>> 	git merge --no-commit 61da593f4458
>>> 	test if the problem is present
>>> 	git reset --hard
>>> 	git bisect good/bad
>>>
>>> In this case you get merge conflicts in drivers/video/fbdev/amba-clcd.c
>>> and drivers/video/fbdev/vermilion/vermilion.c. In the assumption that
>>> you don't have these enabled in your .config, you can just ignore these.
>>>
>>> Side note: A problem during bisection can be that the .config changes
>>> along the process. You should put your config into (say)
>>> arch/x86/configs/lala_defconfig and do
>>>
>>> 	make lala_defconfig
>>>
>>> before building each step to prevent this.
>>
>> I must have done something wrong:
>>
>> marvin@defiant:~/linux/kernel/linux_torvalds$ git bisect log
>> # bad: [689237ab37c59b9909bc9371d7fece3081683fba] fbdev/intelfb: Remove driver
>> # good: [de927f6c0b07d9e698416c5b287c521b07694cac] Merge tag 's390-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
>> git bisect start '689237ab37c5' 'de927f6c0b07d9e698416c5b287c521b07694cac'
>> # good: [d9f25b59ed85ae45801cf45fe17eb269b0ef3038] fbdev: Remove support for Carillo Ranch driver
>> git bisect good d9f25b59ed85ae45801cf45fe17eb269b0ef3038
>> # good: [e2e0b838a1849f92612a8305c09aaf31bf824350] video/sticore: Remove info field from STI struct
>> git bisect good e2e0b838a1849f92612a8305c09aaf31bf824350
>> # good: [778e73d2411abc8f3a2d60dbf038acaec218792e] drm/hyperv: Remove firmware framebuffers with aperture helper
>> git bisect good 778e73d2411abc8f3a2d60dbf038acaec218792e
>> # good: [df67699c9cb0ceb70f6cc60630ca938c06773eda] firmware/sysfb: Clear screen_info state after consuming it
>> git bisect good df67699c9cb0ceb70f6cc60630ca938c06773eda
>> marvin@defiant:~/linux/kernel/linux_torvalds$
>>
>> with the error:
>>
>> marvin@defiant:~/linux/kernel/linux_torvalds$ git bisect good
>> Bisecting: 0 revisions left to test after this (roughly 0 steps)
>> drivers/video/fbdev/amba-clcd.c: needs merge
>> drivers/video/fbdev/vermilion/vermilion.c: needs merge
>> error: you need to resolve your current index first
> 
> It seems you forgot the "git reset --hard" step.  Doing it in this state
> should still be possible.

Well, it was possible, but I obviously got the wrong result:

marvin@defiant:~/linux/kernel/linux_torvalds$ git bisect log
# bad: [689237ab37c59b9909bc9371d7fece3081683fba] fbdev/intelfb: Remove driver
# good: [de927f6c0b07d9e698416c5b287c521b07694cac] Merge tag 's390-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
git bisect start '689237ab37c5' 'de927f6c0b07d9e698416c5b287c521b07694cac'
# good: [d9f25b59ed85ae45801cf45fe17eb269b0ef3038] fbdev: Remove support for Carillo Ranch driver
git bisect good d9f25b59ed85ae45801cf45fe17eb269b0ef3038
# good: [e2e0b838a1849f92612a8305c09aaf31bf824350] video/sticore: Remove info field from STI struct
git bisect good e2e0b838a1849f92612a8305c09aaf31bf824350
# good: [778e73d2411abc8f3a2d60dbf038acaec218792e] drm/hyperv: Remove firmware framebuffers with aperture helper
git bisect good 778e73d2411abc8f3a2d60dbf038acaec218792e
# good: [df67699c9cb0ceb70f6cc60630ca938c06773eda] firmware/sysfb: Clear screen_info state after consuming it
git bisect good df67699c9cb0ceb70f6cc60630ca938c06773eda
# good: [df67699c9cb0ceb70f6cc60630ca938c06773eda] firmware/sysfb: Clear screen_info state after consuming it
git bisect good df67699c9cb0ceb70f6cc60630ca938c06773eda
# good: [c25a19afb81cfd73dab494ba64f9a434cf1a4499] fbdev/hyperv_fb: Do not clear global screen_info
git bisect good c25a19afb81cfd73dab494ba64f9a434cf1a4499
# first bad commit: [689237ab37c59b9909bc9371d7fece3081683fba] fbdev/intelfb: Remove driver
marvin@defiant:~/linux/kernel/linux_torvalds$ uname -rms
Linux 6.7.0-initrd-retest-02751-g689237ab37c5 x86_64
marvin@defiant:~/linux/kernel/linux_torvalds$

... meaning, I get the 689237ab37c5 as "first bad commit" but it boots.

If you see an obvious error, it would be helpful, otherwise I might retry the bisect, but later.

I am puzzled, but bisecting a merge commit is my first attempt at this.

Best regards,
Mirsad


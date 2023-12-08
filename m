Return-Path: <linux-parisc+bounces-182-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F580AF57
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 23:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30DA828160E
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 22:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556955915C;
	Fri,  8 Dec 2023 22:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="gClqqrHK"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D5E1712
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 14:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702073133; x=1702677933; i=deller@gmx.de;
	bh=Zbu0R3oUR7uRjbR5KgHkgjm1+nkGtTqu8KxzPXN3wWI=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=gClqqrHKsTh8o7cfWiMmohlWuVPyxqSBTNMT7bhrDXueypsDO0WdHajvbBP+WMMA
	 0FIoUiMvIWJyzD5wY8aTfBi5DgogiV6xnVlD15InPNbeUzKJY/bIxM3h8HKjv0SI4
	 NwTFvykiFTbc057jXxHMj3kwdHLldEpyDNQ4gjCd6eN/+l7SLGHwp9XNXqW/3YyB5
	 st98XGoQ45ohvTIixdTelBpo1Jc+I7shXS3FOba9SxBsM+ZGub3I8i98/DelT20Yg
	 0zzmPSamgOgyRjhDopps4siR70i/bxrlxDfpiZNxAVxozuCp+nUHwLjvStDXkgVcv
	 7KnzpdTM4DhH0E/cMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.158.195]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLR1V-1qtMmE1xtD-00IQb9; Fri, 08
 Dec 2023 23:05:33 +0100
Message-ID: <c3c70dbd-d139-4fff-8de4-ef531214ac2e@gmx.de>
Date: Fri, 8 Dec 2023 23:05:32 +0100
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
 <55d40485-2aff-4cf5-a379-623bb3b10b7f@gmx.de>
 <8bdc89de-90a5-4b7a-b6d1-2e3bd9fa7314@roeck-us.net>
 <ade25e81-2d1a-416a-9f02-1944aa03261c@ilande.co.uk>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ade25e81-2d1a-416a-9f02-1944aa03261c@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CEFcNOmHPJhe8vJlcGTTIKFyL7Xk7+02REnItU/dQMaYvX7bWbK
 vISMMGE+0zZEDzfnbgitOw352QYLkI7p2e8WXvOc0QhtSpVaPD7xNrKgvxicvADgNT3ytbA
 ZTFlbvg7cd1IrQptmc8aaOFo+nwKRx+2aqYcg75yiiOGa9cvsU+VX5XGaEYdXrKN4ydwOsd
 9aSBCrH3bvm9WC3GrIS6w==
UI-OutboundReport: notjunk:1;M01:P0:Fe5htfUR/ws=;avDwqnsRdi6lshWtLyQS2hcfzfT
 ZeLr7CCIdo1jhxRi9p68abc4cq5S/qxn2W4S0/0q+MnKMPpJYlE1pXrl8idmTsLuiYH4JGF7G
 iOC+G6dEyjGqjOvduB0H4FjrJH0jqWuTQEkZ4tU5nmmpmEo9KSN8+uYnO7xids3gnI7gnicOz
 +iGkARRGJPAerAj3CMl0GVLbS0CavkAIsfMfru5aQqioi8TE9G1u4uv87ziGQIwMEPt9Kx9cL
 j6j2u1iu5n6Dk9wP9Y5KbA01HN98y37ovAZVsjntTEjzicG3xdey7sPeGHaDydKRjqlxuel4/
 5msjRyo4zfHPbn6gjEBzlhBzzy+XkJKhqXa+GS4GsodTHadCpa/2h5q2EYt7tgW8si66TvJgi
 /TwvcDFuEUCE1dymC/3EgPO4H1g2cTIMwriGE0carusXAg/I3kg14lxciJnbWQ2tZ2twYF5ir
 ZY49etJ6QSDGSRBzqaka/o+pt2rgMMmXlhK9NzXsUtSuYZh4MWpq+WUcZrtHsryiOHSnjJrpV
 x4Sj9BQG+or+RFqTZXLew92dPfRvk/aek2ydoNxt3q09QNhm9//LiP7Hvrcu+x0x9rBttxJdj
 OR+CM/YMxpmoYi2GBMHJrxo9QUIofwu+IyKIvvITZw58WsI1w9j2Q3EIhs11GhXPZ2dxl5Gl7
 YXzCPA4ufndoBTo0WXnmfNV++eDPJv/VsIxcS3XbkLkYlF7pFGHyfhu9JSrOWFMqmL3gvnE0G
 6Vf54TVKSjTbuob4GgcfbnvC9lZ7O3eqSj03AsKFEuJds584XrQbGlIcKLjjjKC7KKWNoJNWv
 yS5QA7gxCkCtIuAsib2SXPnQhE2dRCi8K3s/7+SwMAL9k4fny1KUytYWkXMBhH3X5uDnAf+Vc
 cfbazj66nMG46aCcgZNQdpacbAseNLQlh0H1J9WKwGlO34BkLT8a9BGWhCFJmqRHv+AYScQzv
 DuY4KnK1Z5TfRU2Sp8zd5DqO0wY=

On 12/8/23 22:23, Mark Cave-Ayland wrote:
> On 08/12/2023 20:11, Guenter Roeck wrote:
>
>> On 12/8/23 07:54, Helge Deller wrote:
>> [ ... ]
>>
>>>
>>> Does qemu-hppa boot for you with those patches?
>>> Even with those I see the discs are found, but later I get:
>>> [=C2=A0=C2=A0=C2=A0 8.519780] EXT4-fs error (device sda5): ext4_lookup=
:1855: inode #787975: comm swapper/0: iget: checksum invalid
>>> [=C2=A0=C2=A0=C2=A0 8.545363] Starting init: /sbin/init exists but cou=
ldn't execute it (error -67)
>>> [=C2=A0=C2=A0=C2=A0 8.546339] Run /etc/init as init process
>>> [=C2=A0=C2=A0=C2=A0 8.561422] Run /bin/init as init process
>>> [=C2=A0=C2=A0=C2=A0 8.574649] Run /bin/sh as init process
>>> [=C2=A0=C2=A0=C2=A0 8.580495] EXT4-fs error (device sda5): ext4_lookup=
:1855: inode #787980: comm swapper/0: iget: checksum invalid
>>> [=C2=A0=C2=A0=C2=A0 8.586170] Starting init: /bin/sh exists but couldn=
't execute it (error -67)
>>>
>>
>> This is what I get when trying to boot from an ext4 file system:
>>
>> [=C2=A0=C2=A0 30.664669] Unaligned handler failed, ret =3D -14
>> [=C2=A0=C2=A0 30.665314]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __________=
_____________________
>> [=C2=A0=C2=A0 30.665314]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 < Your System at=
e a SPARC! Gah! >
>> [=C2=A0=C2=A0 30.665314]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----------=
---------------------
>> [=C2=A0=C2=A0 30.665314]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=C2=A0=C2=A0 ^__^
>> [=C2=A0=C2=A0 30.665314]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (__)\=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 )\/\
>> [=C2=A0=C2=A0 30.665314]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 U=C2=A0 ||=
----w |
>> [=C2=A0=C2=A0 30.665314]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ||=C2=A0=C2=A0=C2=A0=C2=A0 ||
>> [=C2=A0=C2=A0 30.665925] ip (pid 689): Unaligned data reference (code 2=
8)
>> [=C2=A0=C2=A0 30.666282] CPU: 0 PID: 689 Comm: ip Tainted: G=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 N 6.7.0-rc4-64bit+ #1
>> [=C2=A0=C2=A0 30.666487] Hardware name: 9000/785/C3700
>> [=C2=A0=C2=A0 30.666724]
>> [=C2=A0=C2=A0 30.666812]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 YZrvWESTHLNXBCVM=
cbcbcbcbOGFRQPDI
>> [=C2=A0=C2=A0 30.666978] PSW: 00001000000001001111111100001111 Tainted:=
 G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 N
>> [=C2=A0=C2=A0 30.667164] r00-03=C2=A0 000000ff0804ff0f 00000000413f57c0=
 00000000401e15c0 00000000451d8d60
>> [=C2=A0=C2=A0 30.667351] r04-07=C2=A0 00000000412d5fc0 00000000451d8c78=
 00000000411bcfe0 00000000417813f8
>> [=C2=A0=C2=A0 30.667511] r08-11=C2=A0 000000004128e7c0 0000000000000010=
 00000000000000a0 0000000073c00008
>> [=C2=A0=C2=A0 30.667665] r12-15=C2=A0 0000000000000000 0000000000000cc0=
 0000000043086000 0000000041f29640
>> [=C2=A0=C2=A0 30.667817] r16-19=C2=A0 0000000000000040 00000000451d8a10=
 0000000041ede0c0 0000000000000000
>> [=C2=A0=C2=A0 30.667968] r20-23=C2=A0 ffffffffffe00009 0000000073c00008=
 000000006bc23fd9 000000000fc212c1
>> [=C2=A0=C2=A0 30.668119] r24-27=C2=A0 0000000000000000 0000000000000008=
 081e0241371e0200 00000000412d5fc0
>> [=C2=A0=C2=A0 30.668273] r28-31=C2=A0 0000000000000000 00000000451d8e00=
 00000000451d8e30 00000000f8ce25bc
>> [=C2=A0=C2=A0 30.669027] sr00-03=C2=A0 0000000000016c00 000000000000000=
0 0000000000000000 0000000000016c00
>> [=C2=A0=C2=A0 30.669292] sr04-07=C2=A0 0000000000000000 000000000000000=
0 0000000000000000 0000000000000000
>> [=C2=A0=C2=A0 30.669523]
>> [=C2=A0=C2=A0 30.669615] IASQ: 0000000000000000 0000000000000000 IAOQ: =
00000000401e160c 00000000401e15ec
>> [=C2=A0=C2=A0 30.669870]=C2=A0 IIR: 0fe010dc=C2=A0=C2=A0=C2=A0 ISR: 000=
0000000000000=C2=A0 IOR: 00000000f8ce25bc
>> [=C2=A0=C2=A0 30.670072]=C2=A0 CPU:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0=C2=A0=C2=A0 CR30: 0000000043086000 CR31: 0000000000000000
>> [=C2=A0=C2=A0 30.670270]=C2=A0 ORIG_R28: 00000000402a48b8
>> [=C2=A0=C2=A0 30.670407]=C2=A0 IAOQ[0]: unwind_once+0x5dc/0x5e0
>> [=C2=A0=C2=A0 30.671165]=C2=A0 IAOQ[1]: unwind_once+0x5bc/0x5e0
>> [=C2=A0=C2=A0 30.671332]=C2=A0 RP(r2): unwind_once+0x590/0x5e0
>> [=C2=A0=C2=A0 30.671575] Backtrace:
>> [=C2=A0=C2=A0 30.671804]=C2=A0 [<00000000401e482c>] walk_stackframe.con=
stprop.0+0xb4/0x138
>> [=C2=A0=C2=A0 30.672059]=C2=A0 [<00000000401e48e8>] arch_stack_walk+0x3=
8/0x50
>> [=C2=A0=C2=A0 30.672232]=C2=A0 [<00000000402a8a8c>] stack_trace_save+0x=
5c/0x78
>> [=C2=A0=C2=A0 30.673233]=C2=A0 [<00000000403b2cc4>] set_track_prepare+0=
x5c/0xa0
>> [=C2=A0=C2=A0 30.673694]=C2=A0 [<00000000403ba8ec>] ___slab_alloc+0x554=
/0x930
>> [=C2=A0=C2=A0 30.673917]=C2=A0 [<00000000403bad28>] __slab_alloc.constp=
rop.0+0x60/0x88
>> [=C2=A0=C2=A0 30.674141]=C2=A0 [<00000000403bb354>] kmem_cache_alloc+0x=
f4/0x280
>> [=C2=A0=C2=A0 30.674342]=C2=A0 [<0000000040389d10>] __anon_vma_prepare+=
0x98/0x2d0
>> [=C2=A0=C2=A0 30.674554]=C2=A0 [<0000000040374f50>] __handle_mm_fault+0=
x410/0xe00
>> [=C2=A0=C2=A0 30.674752]=C2=A0 [<0000000040375a6c>] handle_mm_fault+0x1=
2c/0x230
>> [=C2=A0=C2=A0 30.674947]=C2=A0 [<00000000401cc6e0>] do_page_fault+0x1c0=
/0x708
>> [=C2=A0=C2=A0 30.675173]=C2=A0 [<00000000401d0b90>] handle_interruption=
+0xa88/0xbc0
>> [=C2=A0=C2=A0 30.675367]=C2=A0 [<00000000411bd000>] arch_atomic64_add+0=
x20/0xb0
>>
>> That is also seen randomly when booting from other controllers, so it i=
s
>> not specific to the scsi driver.
>
> This certainly feels like a CPU emulation bug, for example checksums
> as used by ext4 may make use of optimised instructions for
> performance which aren't commonly used.>

Although CPU emulation bug might be true (I suspect something like that to=
o),
this specific crash is due to a bug in the unwind_once() function.
This patch:
https://github.com/hdeller/linux/commit/3c4092001f4c2e9c842afd60d1391a0b6e=
d4565e
should fix it. It's in my for-next tree.
But it doesn't crash on physical hardware, so some kind of emulation bug
is still there too.

Helge


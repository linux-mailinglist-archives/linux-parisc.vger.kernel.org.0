Return-Path: <linux-parisc+bounces-144-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A68A806125
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Dec 2023 22:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31B5AB20FB9
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Dec 2023 21:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35926FCE9;
	Tue,  5 Dec 2023 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="UKN9Zley"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0C71BC
	for <linux-parisc@vger.kernel.org>; Tue,  5 Dec 2023 13:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1701813535; x=1702418335; i=deller@gmx.de;
	bh=91LX44jY/mI2LqKU/DdofWNjRcJhkhpOf0PrlUI7WFg=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=UKN9ZleyHEXEdtrM0Z5IFAil/6XHamfx1FU55jxHJaQkdGc2rIcdJIFBe5jFiWh6
	 QUYrEwSaTAU7f/RiYFV8BK7o/tY4snepcTuFppk4vvYAk8wFiRyLNxYlq3MjJ41Wc
	 GElSt+1o3VABb+uR3CPRQxwJPFP7P5thPiMZz67mY78o4XbiPPrb4WQ7vWgnRWbMs
	 lIOz9HtUmR+W882dA4N80GBQX2TpcJ8XxYh13hcVXVLdtZLsO1OSCOQSi6lRKr3JF
	 XMNdx5WmNgEtoT9CVFfCP1ByZgKn2iw2e0aSy0gSwLFGxANPGCqIY4g3mXVBSA8vc
	 35mMGHimHvgieZXaLw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.147.78]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgesQ-1rklX90e8C-00h86F; Tue, 05
 Dec 2023 22:58:55 +0100
Message-ID: <b1c864a0-cdda-409a-94c2-1a2cb827f7e1@gmx.de>
Date: Tue, 5 Dec 2023 22:58:53 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
Content-Language: en-US
To: John David Anglin <dave.anglin@bell.net>,
 Guenter Roeck <linux@roeck-us.net>,
 Parisc List <linux-parisc@vger.kernel.org>
References: <17dc79fa-4a38-44ee-a8ea-b523b2d99b26@roeck-us.net>
 <a52d08a9-1114-4d0c-8d10-508d6d49627b@bell.net>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <a52d08a9-1114-4d0c-8d10-508d6d49627b@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u2G13rFRCH8Ii+4E+PSvImtj7MJlLv2HIAwztOXkIrUhogSX/DY
 RAcaG34c04TIBEbYb25VTfBwYbS09hzb7cn1O9yKagjWZdgICZtZnWqji+2IQUZUQaY+bIY
 YRmxpeNrgubf4i0/Z3FTD2YyrLbw+un4Jyqx4K3N4qufBALeE9teWoTwN3xhp+7tPpkqbGN
 mz4DjBNR3zZO0aUOVBH8g==
UI-OutboundReport: notjunk:1;M01:P0:OuJzHm6wuws=;sXczFcrVfxAcNTHw+aALMzmbxn3
 GEC6cQ6XO4weGBuBzZ35Cc+vnlTZ5udRF+uVrmNRVCNjRqes50nIDAIbQhHgJPMZRF3klmS8b
 N8TUSaEJParSUedRVwy0OMtiL/0R4e8SxZqOu1xF6dp17KLsELnof6SrjzfDh+oKQdh5KjCko
 aCQhhW43eCZbkQzHiYweucTSStWy+fN4UAMdRTO9eCA9zQdNWdiXZo5aJ8vjzOsQdvMGhPwdZ
 aUqnCleTgzc4VOVyX7R0B5hC1h49Q1T7MXgLG9/wcn6bTYeBc+ZUl/2+Uvti7PUyzOUAlzIu7
 P/kBHbsFdxeZECK36aL5SJ3CTfOxZhrxWDYTp5wa0Hui1OAV218YzXh1Xc/gzVtjj7ovkvzHb
 7Mjm1PIqWfysMAAuRWbLa/OzPfgp/VScZwdkz0gq2w/g+5MDh+ecJfEjl4Oj4iL4Ifwb6dPFO
 /frWk39FewFMyWywvK4l0453a7Lr9YYJBXc5zsUm3iG1a62FVQu4Z0qy0sqjrHfjRQ33Gj4fk
 zx6d0x90FumfjoCjoDP8wEFU+eE5SnFOFJP8pzojjlxERoirBwtYn7wWcaTA87BQXpmyEgBj7
 uWAc0EOyY3OKZroIn5EAknxaWlzEVhUktaISlAAA4DiGgVlHzCP2Ij2Tkr8u+o/ByNywmOsc3
 UVMXodOLmeIHdU95hIEgYKD6oJwuGfpaN1myS2RdAMGEKJ7+lz8K1Y7qI+RnDWNVBeqM9vwDi
 E1UWmQiYYzNDR772HsosM7qUTMGqPH9FnU4fyFwRuGY21odmABi2pCbjNtVwT+uRf0wsNB+6p
 8SRh6un9UJWZhmiuP8gt/AU5zj6vChg6wwCgYRsG0c4ZviHdZg/ELs/r0wVMD9nl7O7OCSudu
 j7x05M7yZlDRJCPUqMNtSpNp1eWX+91OTjTBlyUcyhzUfxGoCCpo9tUbZJbSah4Xf7xq8H7G/
 kK3xmQ==

On 12/5/23 03:39, John David Anglin wrote:
> On 2023-12-04 8:08 p.m., Guenter Roeck wrote:
>> I=C2=A0started=C2=A0to=C2=A0play=C2=A0with=C2=A0the=C2=A0new=C2=A0qemu=
=C2=A0hppa64=C2=A0emulation.

This emulation is in the first row planned to be able to
be used with 64-bit kernels (until we hopefully once get
64-bit userspace).
Sadly there still seems to be a bug in the emulation
so that it fails when the kernel is built with specific
modules.... :-(
I still don't know where the bug is though.

> It=C2=A0works=C2=A0pretty=C2=A0well=C2=A0with=C2=A032-bit
>> userspace=C2=A0images.=C2=A0Unfortunately,=C2=A0I=C2=A0have=C2=A0not=C2=
=A0been=C2=A0able=C2=A0to=C2=A0create=C2=A0a=C2=A064-bit=C2=A0userspace
>> root=C2=A0file=C2=A0system.=C2=A0I=C2=A0am=C2=A0stuck=C2=A0trying=C2=A0=
to=C2=A0build=C2=A0glibc=C2=A0and/or=C2=A0uclibc-ng.
>>
>> Does=C2=A0anyone=C2=A0happen=C2=A0to=C2=A0know=C2=A0how=C2=A0to=C2=A0bu=
ild=C2=A064=C2=A0bit=C2=A0userspace=C2=A0images=C2=A0for=C2=A0hppa64,=C2=
=A0or=C2=A0more
>> specifically=C2=A0how=C2=A0to=C2=A0configure=C2=A0glibc=C2=A0and/or=C2=
=A0uclibc-ng=C2=A0for=C2=A0it=C2=A0?
> As far as I know, no one has ported glibc to hppa64.=C2=A0 I started wor=
king on it a few months
> ago but a lot more work is needed to get it working.
>
> I have a working 64-bit tool chain running on hpux but 64-bit hpux doesn=
't boot yet under qemu.

Yep. 32- and 64-bit HP-UX is currently broken in the 64-bit enabled
qemu.

Helge



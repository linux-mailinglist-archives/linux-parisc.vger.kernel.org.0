Return-Path: <linux-parisc+bounces-152-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B8A8075EE
	for <lists+linux-parisc@lfdr.de>; Wed,  6 Dec 2023 18:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 366E71C209B9
	for <lists+linux-parisc@lfdr.de>; Wed,  6 Dec 2023 17:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902C048CEE;
	Wed,  6 Dec 2023 17:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="tXrUztf6"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6649FD3
	for <linux-parisc@vger.kernel.org>; Wed,  6 Dec 2023 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1701882035; x=1702486835; i=deller@gmx.de;
	bh=R6UncJN3/Ih18od4I7bfQangqONelPCWutW5po9EDoI=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=tXrUztf6wQtubMYHfwf2uCljip+0qclmjnfRfYhnppqQ1ECG1BGPlsFTMBfpQ5+i
	 ZQHumpxohRXc34xtAoLWZfMrsRGi2A47yBEioJNkrp2EXfQgoxCgIGWFNEhj2/iFW
	 W4+uCAKpweF2XJCwdmbd5kgLGv8uJK+/tvuTv2C36j0/WAlzDKeW6OxVw+CxmyFRz
	 ZoLoAl9wZEDFZPruehg662OybYHbwZsQAnUa41n4bg2TbRmM7Uk5MET61lNH2Jdh7
	 oNFkQTkiO/trnCZIEmeDN/FdjTYbAKxbkFP/Nj37TI3LVGuHkIzW19II81bkEYCID
	 9SuqJqVgkPLAiDDPZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.149.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mzyuc-1rPj5J19FO-00x5JG; Wed, 06
 Dec 2023 18:00:35 +0100
Message-ID: <41052280-bb9f-4fa4-a3d4-ed23a1fcdbd1@gmx.de>
Date: Wed, 6 Dec 2023 18:00:33 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 John David Anglin <dave.anglin@bell.net>,
 Parisc List <linux-parisc@vger.kernel.org>
References: <17dc79fa-4a38-44ee-a8ea-b523b2d99b26@roeck-us.net>
 <a52d08a9-1114-4d0c-8d10-508d6d49627b@bell.net>
 <b1c864a0-cdda-409a-94c2-1a2cb827f7e1@gmx.de>
 <aeceb922-b6e9-4814-919e-6a82fb869f63@roeck-us.net>
 <6199c59b-1307-48c2-ae9a-254ab2d578c0@gmx.de>
 <0f9710fc-8246-4265-a32f-ebc4fa3eefde@roeck-us.net>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <0f9710fc-8246-4265-a32f-ebc4fa3eefde@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tIszSL0GUDBXrRwQtrL+MLUasjWfvimgS4cBxRyFAN3Sw8suzGB
 cfokD+tFX82mc0uWMWDxwxQeZrbzu2bkuoiSuMtUEvFoHx0Ba5Zf20Qio6/nswpKE/swm3K
 0V0DtIMMO3TG40xqSlcG9X70JPa2TiE3xuAX8SmpEdb39Ut9Y/qWGriNFlcaEj9fIzckxDG
 COXc3SY2HpAk0x7k9zmtA==
UI-OutboundReport: notjunk:1;M01:P0:cEPHWqkeNWo=;iyDceh3Y5/l4YbXR78vYCUcKUYD
 nvp38oK0yVxeWRWmxTdlHIio1SATw2/1SO+T9C8YRYMJA1XXknppFiEwAwhFYReQANn5vw1s+
 EMsmtpuSrfT53ZcVbdFD192KBMb4EZTD4pBa0hLcCguecFYj391l6nmcOGDZNCGkQvNaW451B
 xQ4r0rx3SueJGON3B9VlTpmYFLMj7V3hKDWNpor3qg3E1Tzfe+GIIy/4ojx8Zpl/SAtHeKCTR
 SP8ZoA35JGLsFV2kYjq0MYqzS9U1Zz7yjZvo/uEwsweL82727x/Re7a+as7l1f+IOZnHPqw3b
 SLqBUAALCYoLnGvQf/0p3wOgftgOIB1KO1sDxGdNBezld9hCU4at2TrnJmvfM0m7fz41uQ0O0
 /d/xK7qXveqkWyHUY20aBWRbQOnRYNYyBtQQKU9m1CwFIO9G45pzjEcqjIEnR50LuHq4lhDlV
 1jskPZBi/OH0B6pq8cv3FFXsPuWJw+vf7luyg1SuEyRYkDGW92+af/9lh5NKBUDFwm42q2be5
 xC+CfA9YgZvyzHtpZP45kVncOEO7l+ocK1RtRXapU3fE5uf0spg4PpEHSHUAWEDzdgYyEHD4L
 igHG5IITXN+mMDAX632gV7BNauAiskMKBmJpSallU0S51VE68aZ6M4P5+6ApI92Z8ScxJoGkJ
 dSHWXpIEHWEH+/i8rZMK6HamSoRWTQ4KjryQVz8Oh2vVQUy+WGeCEHK0RdW8DgR4uFW1WgoXO
 Z+tv2p9lKfUl1hG3jzCv6uE7gMMALYcWFucCUrCRMZfPhZM3/FBGxVYhb+OpSeBVtaJPCfQT7
 i3rj8CnCEf0gb8dfZEMjLSyvIB6sv1BsBDq9vjtZYmFiX08/YGpLaVMZ2a6mEI7nOP8NI6PK4
 DR/a7opjYUGQgrbFh3lbx+cP6HsFne1tWTG3KvNNKWu7a4pFzTyFcNUotYdQtLNTRNzIVLhBQ
 r+sRzVuNizRoWW+PhUyqAWExIx4=

On 12/6/23 01:39, Guenter Roeck wrote:
> On 12/5/23 15:22, Helge Deller wrote:
>> On 12/5/23 23:52, Guenter Roeck wrote:
>>> Hi Helge,
>>>
>>> On 12/5/23 13:58, Helge Deller wrote:
>>>> On 12/5/23 03:39, John David Anglin wrote:
>>>>> On 2023-12-04 8:08 p.m., Guenter Roeck wrote:
>>>>>> I=C2=A0started=C2=A0to=C2=A0play=C2=A0with=C2=A0the=C2=A0new=C2=A0q=
emu=C2=A0hppa64=C2=A0emulation.
>>>>
>>>> This emulation is in the first row planned to be able to
>>>> be used with 64-bit kernels (until we hopefully once get
>>>> 64-bit userspace).
>>>> Sadly there still seems to be a bug in the emulation
>>>> so that it fails when the kernel is built with specific
>>>> modules.... :-(
>>>> I still don't know where the bug is though.
>>>>
>>>
>>> I don't try to build / load modules, so I don't see that problem.
>>
>> Good :-)
>>
>>> Couple of observations:
>>> - There are spurious issues if I enable more than one CPU.
>>
>> Interesting. What kind of issues? Spurious interrupts?
>>
>
> Frankly I didn't check details. I just noticed that I got a high
> percentage of test failures and gave up trying after I realized
> that the real hardware doesn't support more than one CPU.
>
> Is it worth testing with multiple CPUs ? I can re-enable it and
> check more closely if you think it makes sense. If so, what number
> of CPUs would you recommend ?

I think 4 CPUs is realistic.
But I agree, that you probably see more issues.

Generally the assumption was, that the different caches on parisc
may trigger SMP issues, but given that those issues can be seen on
qemu, it indicates that there are generic SMP issues too.

>>> =C2=A0=C2=A0 I am not sure if that is realistic (the emulated systems =
seem to be
>>> =C2=A0=C2=A0 single-CPU systems)
>>
>> Yes, but shouldn't matter.
>>
>>> , so I dropped those tests. Historically
>>> =C2=A0=C2=A0 (with older kernels and/or older versions of qemu), multi=
-core boots
>>> =C2=A0=C2=A0 didn't work at all (they were slower than single-core),
>>
>> Not sure if this is the case here, but for older qemu's you need
>> this option so that the virtual CPUs are put into their own threads/cor=
es:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-accel tcg,thread=3Dmulti
>> This option isn't necessary on newer qemu versions.
>>
>
> Ah, that might explain it. Thanks a lot for the hint.
>
>>> =C2=A0=C2=A0 so there is definitely an improvement, but it isn't stabl=
e enough
>>> =C2=A0=C2=A0 to use for kernel regression testing.
>>> - The e1000 and e1000-82544gc network interfaces don't work
>>> =C2=A0=C2=A0 (those work fine with the 32-bit emulation)
>>> - ne2k_pci doesn't work anywhere. I get either a hang or a spinlock re=
cursion
>>> =C2=A0=C2=A0 error if I try.
>>
>> I will try both, but at least for 64-bit emulation I might have an idea=
.
>>
>>> - Not sure it if is worth mentioning: There may be hung task crashes i=
n
>>> =C2=A0=C2=A0 usb_start_wait_urb/usb_kill_urb during shutdown when boot=
ing from usb
>>> =C2=A0=C2=A0 or when using an usb network interface. That happens with=
 all emulations,
>>> =C2=A0=C2=A0 though, and is not parisc specific.
>>
>> Did you reported it upstream in the bug tracker?
>>
>
> No, because I have no idea if it is an emulation problem or a linux prob=
lem.
> I never had the time to track it down. I just noticed that it seemed to =
be more
> prevalent with 64-bit parisc especially if I boot from usb _and_ use a u=
sb
> network interface. In case you are interested to see how it looks like, =
here
> are a couple of examples:
>
> https://kerneltests.org/builders/qemu-riscv64-5.4/builds/46/steps/qemubu=
ildcommand/logs/stdio
> https://kerneltests.org/builders/qemu-parisc64-6.6/builds/1/steps/qemubu=
ildcommand/logs/stdio

Ok, thanks!
But isn't that more or less expected, as the machine can't simply turn
off USB when root disc is on USB? E.g. otherwise it woulnd't find the shut=
down
executables? Maybe just the warning should be disabled after shutdown?

Helge


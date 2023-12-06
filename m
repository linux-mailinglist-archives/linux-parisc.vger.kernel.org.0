Return-Path: <linux-parisc+bounces-154-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48820807AB0
	for <lists+linux-parisc@lfdr.de>; Wed,  6 Dec 2023 22:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F12CF2824A1
	for <lists+linux-parisc@lfdr.de>; Wed,  6 Dec 2023 21:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9779C41858;
	Wed,  6 Dec 2023 21:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="FGhe4bWl"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C6412F
	for <linux-parisc@vger.kernel.org>; Wed,  6 Dec 2023 13:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1701898987; x=1702503787; i=deller@gmx.de;
	bh=e2HrBVuD/YX0PDvFqbzv7onZNaGNqKgXYNpFTk+E+4s=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=FGhe4bWlEuhws3R2GKVa2AMtACG/z5jthkfxoUJrJ6lGsYZouFV/QZ4NIkK7x4qn
	 4ugkWwA8xy5HQ/axpelHF7SzoQT7l4B2SzIC2g+TObC85J8caSx9JN0x6uHluRPUx
	 pn8m6UWmoR1sFgXKOvq0CJ5roW5IRLVXsXEUyLBq4+vvKwZjL69QpTxDsE9Vfrcqt
	 HxvRh39ZMnaWNg3Qc6fVuuMAr/xatqE7x70vBvaOmZLvHirBtgutratZ6CogtkshM
	 IJ/SPRDXqm8Ftr3PgNA11Sqrl/Ho1QpNTfUjZTzM+RXlNnich0E2lDBYNQbi53ncW
	 HwJL30I86ec45hrPyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.149.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzb8-1ql2WP11UY-00R3Wr; Wed, 06
 Dec 2023 22:43:07 +0100
Message-ID: <4b6ef6f3-c3db-48fe-a3ee-1d874d510c7e@gmx.de>
Date: Wed, 6 Dec 2023 22:43:05 +0100
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
 <41052280-bb9f-4fa4-a3d4-ed23a1fcdbd1@gmx.de>
 <c56601c1-f89a-463a-93df-db93133e8315@roeck-us.net>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <c56601c1-f89a-463a-93df-db93133e8315@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JjjwXI7YVy4SdhD1WKZuDLJt+1qrL1ANgt8+LS7Lh2VksaQpJiV
 lLbkZCTOvkI9MQj9x+eOnbDY5U8lbZgFRAIkU6ZWmNJh8WZsVPmGGEBm+Dmz4vluKJXTiF9
 kGdkIO8jQSuub00DiCW+6yUkd2cyRCoBCESy8Jre4zZHV0sqtIH9/vDX1oM0ebsPfjhmNjF
 IUebmfLs6AlEqE/veo/gQ==
UI-OutboundReport: notjunk:1;M01:P0:8/5Eg/KewH8=;iquig75aNpaWESbOFCJrPnST2is
 HPKTl9j8pQFTYYUFwJ37MlBBTJq9Bn8bHsaZHMY5Bp+7FujYILvlgdGvRoQAirwbftQBiuOO1
 276eSuLbGYfWTTrXKhF5rNYUsHS6LpoBLcFABhoXTCVRqKj6GMpiWmi2ewgTNOQdEKA5v2Sms
 35B8sksEv0VEmx1RFwH2491xtMZBviZg4se4sBgllGkmAfy7FC8NhatRUBflZtNx+zCOO2TUw
 fS5EoWigZ+7KopEAmvIIg/YXzhOcCvsyvsStJpvYmLywWM9vKqAFFZ4pQwpWY5jgUxgPKl+v8
 n6wed+FcMJhTArdoP3vL4tPDs638cH7oAj0HtasxY15XPoQ8L7h0zgOrsv9tcTv48WypGerRs
 m6TPW8FO0U5cyFpUP4M+7KisnQJ2c6VMmGT5zEQWyNW62Qs7txsNGq6UHT1Th0ViA1dIRVGI9
 x3bYi1eJtz47TdYPDhxA59sBPkdJ5CCB1uj5/faGWDw8a28sKRmyjh6mUVsfq80it6JG6NEFD
 Biyzz+KJRfAyqtzq/YHv1/vICqIn0ROZQqxAXL1a8XaQTKUTpA9yy5xLqIx0LepKtTyVmRiRq
 29Fia5IllS8PEiL+xdgxHMs2WiHWImnX7M7zqZExeogsBYqPyNVeQ+fUGPGqK3WsFgehK/RLt
 cJf+okEinCm0gBYsoXi+XIdV7rQ5F+iDesnUtu+2EsnE51OsyUE/JyIfrhNZ/bt0RQr0RJHmI
 WNB5bHpzRSbx9S/KCQNwJwZ++ZsuI7p5yNr2mwmmh6PMPIpeHqgmIJMr91pQwVK9FvbhB4nkm
 waC26To3dDV9ZOtlayFSp8CT6zIEdbLcda500727vUd5qoBetgFIvZnCd4YtcGGV+AFawwgcQ
 C5FX5hYrCma4+8T2GPfbIET6ollzHPilmKnzTtalRGcjKniqVFnjg/jj5pIV60yQr+nIpMVOW
 Ei81i0pOqmgLm6zLkQxUgmbKSxw=

On 12/6/23 21:19, Guenter Roeck wrote:
> On 12/6/23 09:00, Helge Deller wrote:
> [ ... ]
>>> Is it worth testing with multiple CPUs ? I can re-enable it and
>>> check more closely if you think it makes sense. If so, what number
>>> of CPUs would you recommend ?
>>
>> I think 4 CPUs is realistic.
>> But I agree, that you probably see more issues.
>>
>> Generally the assumption was, that the different caches on parisc
>> may trigger SMP issues, but given that those issues can be seen on
>> qemu, it indicates that there are generic SMP issues too.
>>
>
> Ok, I ran some tests overnight with 2-8 CPUs. Turns out the system is qu=
ite
> stable,

cool!

> with the exception of SCSI controllers. Some fail completely, others
> rarely. Here is a quick summary:
>
> - am53c974 fails with "Spurious irq, sreg=3D00", followed by "Aborting c=
ommand"
>  =C2=A0 and a hung task crash.
> - megasas and megasas-gen2 fail with
>  =C2=A0 "scsi host1: scsi scan: INQUIRY result too short (5), using 36"
>  =C2=A0 followed by
>  =C2=A0 "megaraid_sas 0000:00:04.0: Unknown command completed!"
>  =C2=A0 and a hung task crash
> - mptsas1068 fails completely (no kernel log message seen)
> - dc390 and lsi* report random "Spurious irq, sreg=3D00" messages and ti=
meouts

I think none of those drivers have ever been tested
on physical hardware either.
So I'm astonished that it even worked that far :-)

Based on kernel sources, the "Spurious irq, sreg=3D%02x." error can only h=
appen for the
am53c974 driver. Are you sure you see this message for dc390 and lsi* too?

For megaraid_sas I see a Seabios-hppa firmware patch is required.
Could you please give me the full command line how you start qemu?
Esp. since the lsi scsi is still there, how do you assign a disc to the ad=
ditional
megaraid_sas driver?

>>>>> - Not sure it if is worth mentioning: There may be hung task crashes=
 in
>>>>> =C2=A0=C2=A0 usb_start_wait_urb/usb_kill_urb during shutdown when bo=
oting from usb
>>>>> =C2=A0=C2=A0 or when using an usb network interface. That happens wi=
th all emulations,
>>>>> =C2=A0=C2=A0 though, and is not parisc specific.
>>>>
>>>> Did you reported it upstream in the bug tracker?
>>>>
>>>
>>> No, because I have no idea if it is an emulation problem or a linux pr=
oblem.
>>> I never had the time to track it down. I just noticed that it seemed t=
o be more
>>> prevalent with 64-bit parisc especially if I boot from usb _and_ use a=
 usb
>>> network interface. In case you are interested to see how it looks like=
, here
>>> are a couple of examples:
>>>
>>> https://kerneltests.org/builders/qemu-riscv64-5.4/builds/46/steps/qemu=
buildcommand/logs/stdio
>>> https://kerneltests.org/builders/qemu-parisc64-6.6/builds/1/steps/qemu=
buildcommand/logs/stdio
>>
>> Ok, thanks!
>> But isn't that more or less expected, as the machine can't simply turn
>> off USB when root disc is on USB? E.g. otherwise it woulnd't find the s=
hutdown
>> executables? Maybe just the warning should be disabled after shutdown?
>>
>
> Not sure about that, for a number of reasons: It doesn't happen all the =
time,
> and it is more likely to happen if the system is under load. It also see=
ms
> to be associated with OHCI (I am currently running more tests to confirm=
),
> and sometimes the failure is with the network interface. That suggests t=
hat
> some race condition may be involved.

Ok, at least it should be looked at...

Helge


Return-Path: <linux-parisc+bounces-201-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD9B80BC0E
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Dec 2023 16:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B9F0280CD9
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Dec 2023 15:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6594C168A7;
	Sun, 10 Dec 2023 15:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="I9K8zJJS"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416FDF3
	for <linux-parisc@vger.kernel.org>; Sun, 10 Dec 2023 07:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702223249; x=1702828049; i=deller@gmx.de;
	bh=wz83Vgh7cV7vIjxu3sRLEokdSQYAOQ+b0jGcIoaoq2I=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=I9K8zJJSwmLrjTHIJHWSZWIiR+1dFtf/j8hz48HhULMPd3ztM11uBWqWSdjyC7wW
	 d/zSjlke1SRMW4vDaV4NZaiVhNQ+CgH//fIbQ/SOFS29YlRaoFFXOOl86gi9Im4jl
	 OjEmmYOrteNwxdjHJQytavKzpDmazlWM2hWf3u76/pjgtZITOMhsuLyOWp7qC6IoU
	 0UWtW+HywPJNe+rZ8egMpeY8lGHPc8oQ+LTmKl3O9Sckz28/dn8A10EBA5a4k0PJZ
	 IewVefwl5lWK6rEJ03Wh4R07OrlKVvJsYfaeiXA6lI0znAnO7/RLQDuG1NXmgf0jS
	 uLgQSmyF2Q7h/zmCLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.151.132]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmGZ-1qwbOa3PKb-00K7Fu; Sun, 10
 Dec 2023 16:47:29 +0100
Message-ID: <44dec9d0-8715-4ae6-8abc-31159529470d@gmx.de>
Date: Sun, 10 Dec 2023 16:47:28 +0100
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
 <8f1f2bf0-29aa-410a-8ecb-af61ba9c6dad@ilande.co.uk>
 <9d064661-3568-47f8-890c-4c05027e9999@gmx.de>
 <b22d59ff-bb79-4660-834a-ebbcd10c5ac8@gmx.de>
 <2924c887-0022-4cab-a986-0afd5f7a50f4@ilande.co.uk>
 <3b82d9e7-5b26-4154-a253-9bbbb04cf617@gmx.de>
 <4254a11b-d603-4a6c-9c81-ac7403ae940f@roeck-us.net>
 <0284662a-8eaa-495c-96bc-213b719d40a6@gmx.de>
 <8b356e0d-988e-4fb3-a2c6-7b8acb306b9c@ilande.co.uk>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <8b356e0d-988e-4fb3-a2c6-7b8acb306b9c@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NOgMlyuXilQPffT58G8pjAQSua6ORUxxUCJL0F7rAhMNeJlNKXB
 AfHlmY6SxkpLKARixkRl0mXw64PwO/5ziJg58BfuMMvrrBODLbI1iFUnAm6e8x4pFfucSky
 ONBYZgqMjSUeqCScBrXAXnI3oiYSFqVkY6Mg0nT1dVzuxNdV4yTAz4zGugx+BsNxl1rtX0W
 n4H/KLkoobm0X8Tdko6Kg==
UI-OutboundReport: notjunk:1;M01:P0:GM4CbtRl3OY=;ItOLZ+YVFYUxv3pWSl3jytbqwi4
 PvijXbRSZFMpr0fs8JHHaK8qkab+XLRWpTid9YlYwnG8vZibxKXzYXBXXkX2gwgkrhCb2Cc/r
 Vm8HKe2IbdxHv/QH6aFOBFIzCdGvBoApSSPkayynUVrOGRwD2cvNtVpTleRdBZflVjPSEptEY
 BxECKXBN3QByUzFgIg7wS8VnOkJ4c0qOJ6ugCQff72DHxXQQURWMa7fOnP0PWMwwgBn/VY4pt
 1xkXPJy2Axk5XhT5joVQRthJhj+GIq+xG7Yzi+WLioU7UR5tm/JUhF8HnU1cJ2bjLQb0NU8oK
 lk/9+v3OBYiDAaliW9eHK97243z69d335wqe7a+72prVOgHJ79WkDvOgC0yziTKsqErKvmcZP
 D3HqFWhhyF5bkwvvmdJdjBOhQ/xNG1XkIdQ+zyrBr75O/Ot/bNKHc/XO0+/ldMVK2AVmZ4YHD
 jMYlf6xVJpWUgUyjMANkR4cA8UJKQqGPNv9ppXG+Ccd7O5D+7YSyENtYcB+l6a8vA6KiLgf51
 fGSGlN8UJrXek8CLhjSBPphIbOnmr8gV87PohK/jDSipIAl4SVgQdcB+ZK+JMAu/AHYqEuIe5
 QzTuASdvds7OYs2XVhEuzMgG7XnZqOqKaWnsQa9RU+eCBWk/UGfRQIYNVbR7WjmCgStdgtVvA
 lApGJ54sSSW7NWv6KHstREmnQE8DWBhXs9+rarRgdeiF4JQXuidjCJ2A/Y08PS7JTukiYwKMn
 vnSI85K8skis0BXzjpmpehbOSktBSMNgZ4TozmqXIHo51aHg1mZKvNRr/IsDdAx22UuHu2iet
 CLqU0JgN6SsULyytJW9AMxF+zJ4MRVV7xd42FNgGy+D3FE8pEWRWqZ9/F9YFIZECFYbRQld1N
 KR44Gq4mpJCZ46Xih5EdtQ9yGXWsPOjq1+9thvQ8nw8g5tjjPitdbeZ80s8T4B2SvLJ5qmOmZ
 TBAXfKF3WAv9eK30Q55Gw2dQ6+0=


On 12/10/23 01:22, Mark Cave-Ayland wrote:
> On 09/12/2023 23:43, Helge Deller wrote:
>
>> On 12/9/23 23:57, Guenter Roeck wrote:
>>> On 12/9/23 13:58, Helge Deller wrote:
>>>> On 12/9/23 19:56, Mark Cave-Ayland wrote:
>>>>>>>>>>>>> The command line I used for testing hppa is below:
>>>>>>>>>>>>>
>>>>>>>>>>>>> ./qemu-system-hppa \
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -kernel vmlinux-parisc \
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -no-reboot \
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -snapshot \
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -device am53c974,id=3Dscsi \
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -device scsi-hd,bus=3Dscsi.0,drive=
=3Dd0 \
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -drive file=3Drootfs.ext2-parisc,fo=
rmat=3Draw,if=3Dnone,id=3Dd0 \
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -append "panic=3D-1 slub_debug=3DFZ=
PUA root=3D/dev/sda console=3DttyS0,115200" \
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -nographic -monitor null
>>>>>>>>>>>>>
>>>> ...
>>>>>> If I limit the disc transfer size of am53c974 to just 4K per transa=
ction
>>>>>> (like the patch below against Linux kernel 6.6.4), then qemu-hppa
>>>>>> boots up nicely with qemu git head (and G=C3=BCnther's patches appl=
ied).
>>
>> A diff of the qemu traces shows, that at some stage
>> esp_transfer_data transfer() is called for 4k/transaction,
>> but is not started for 12k/transaction...
>>
>> Full traces are here:
>> http://www.dellerweb.de/qemu/qemu-bugs/FAIL
>> http://www.dellerweb.de/qemu/qemu-bugs/OK
>>
>> verify with:
>> =C2=A0=C2=A0diff -u OK FAIL=C2=A0 | vi -
>> and go to line 2496:
>>
>> -STC: 1000=C2=A0=C2=A0=C2=A0 hi/mid/lo: 00/10/00
>> +STC: 3000=C2=A0=C2=A0=C2=A0 hi/mid/lo: 00/30/00
>> =C2=A0=C2=A0esp_dma_enable Raise enable
>> -esp_handle_ti Transfer Information len 4096
>> +esp_handle_ti Transfer Information len 12288
>> =C2=A0=C2=A0esp_raise_irq Raise IRQ
>> =C2=A0=C2=A0esp_lower_drq Lower DREQ
>> -esp_transfer_data transfer 0/4096=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
<<<<<<<<<<< this seems missing for 12k
>> =C2=A0=C2=A0esp_pci_dma_read reg[5]: 0x00000010
>> =C2=A0=C2=A0esp_mem_readb reg[4]: 0x91
>> =C2=A0=C2=A0esp_mem_readb reg[6]: 0x04
>> @@ -8081,21 +7111,22 @@
>
> Thanks for the traces, but it looks as if they are from QEMU git
> master rather than the esp-rework-testing branch?

Yes.

> The existing code has a number of known issues so it would be good to
> eliminate those first if possible.
That's probably true, but I assume your new code is for qemu > 8.2,
while a few small fixes for 8.2 would be good to have too.

Anyway, traces with your esp-rework-testing branch are here:
http://www.dellerweb.de/qemu/qemu-bugs/FAIL-esp-rework-testing-4k
-> transfer limited to 4k, boots up, fails later with spurious irqs
and traces.

http://www.dellerweb.de/qemu/qemu-bugs/FAIL-esp-rework-testing-8k
-> transfers limited to 8k, fails to boot as empty pages are returned.
(same issue as with git head)

Helge


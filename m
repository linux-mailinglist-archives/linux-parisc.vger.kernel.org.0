Return-Path: <linux-parisc+bounces-209-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF2680DD54
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Dec 2023 22:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 456E41F21579
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Dec 2023 21:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152B154F83;
	Mon, 11 Dec 2023 21:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="al7dIGMP"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61D8D5
	for <linux-parisc@vger.kernel.org>; Mon, 11 Dec 2023 13:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702330700; x=1702935500; i=deller@gmx.de;
	bh=ZIEjKyOGtznrQhSh8PeoWWwC7411vm4sUNttXrdmfA8=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=al7dIGMPXSJIz/JSpjvyPDg7f7DQo1L4AHUAj1y1O/MZAFy/CuwnY9CKjl/EM2rK
	 /BW+q7UqFJ0k8085TiVBPG/9DAhWS6VV3Vctyt4xBiZ2pAu3ukJWl8cH9IMUMeSQl
	 Wi+z4VKittaxd/EqHPAEhFhdKD7+kHq50RSOps44qnPYN17n5ARDTX/mxIp3EDZpm
	 BOAJhxTDpniax+h9cVvw0sWD+LZ5w815lG8HCFoKHdN76FhtlUW1+pi1rGobQ2ror
	 phXiD/cLbVSSK/XfVL/6UxhNWgUJoLzafiH8r9r1b2OYI4YRruCaTef878QbroX5U
	 n3gzIIsiX33MBY+ptw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.152.58]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjjCF-1reUAC3qjD-00lCsc; Mon, 11
 Dec 2023 22:38:19 +0100
Message-ID: <09b4445c-421b-4be0-a6bc-33fc05232d6d@gmx.de>
Date: Mon, 11 Dec 2023 22:38:18 +0100
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John David Anglin <dave.anglin@bell.net>,
 Parisc List <linux-parisc@vger.kernel.org>
References: <17dc79fa-4a38-44ee-a8ea-b523b2d99b26@roeck-us.net>
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
 <44dec9d0-8715-4ae6-8abc-31159529470d@gmx.de>
 <046e9f36-5086-4d87-8187-94558f52fef9@ilande.co.uk>
 <17a5173a-a596-4ea8-941b-3c9b5492e4b7@gmx.de>
 <e6420598-df13-41e5-b6f2-e469db5473db@roeck-us.net>
 <d68c9ade-9b5e-4ccc-ba72-4c5ef98750a5@gmx.de>
 <6933d337-9ba8-4336-8638-d74321c7cbd7@roeck-us.net>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <6933d337-9ba8-4336-8638-d74321c7cbd7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G5u8CwqTb1pNNMzJ8s/5Rj66vEBzHkLvpr6XKRGgtpAp4d5UQCP
 ozb8iXp6VHfOOSXiPXZ3rLK1KnHw90ly2FeMxK7Egv779Gs1tNEVFBlvoOwLWlNPuELb6Zt
 CvRg6vneTUuZmH7kg1aJ4DTQSaTHs+8UlxXBDOylozA4QsovraX0iKphJaBlCugY8ZjMiiR
 fVJcMvEOmT4jvcRfFzbYQ==
UI-OutboundReport: notjunk:1;M01:P0:JNocFxXkKHw=;Dp4AgH4J34NWQDjax104P1UBiIn
 PrzooF0p/1fJrpelcO6PROkK7AOpd2PgMVRDLHqZksOJBZ5IWA7fRaddc/sIR1ATI9DW494g9
 r7xWlLi0S6ltOeReefhvBNdCbCeWwfxtBHP+zmyTk2iWVu8CCYvIsMixfrl3oxLR0EI3Uvj9M
 hnQPOzhyVVx5nWbq8YIZUUWihmjruFtzQUXZalEfZ3iFRX9T1buZZ8mx2ThIG70sZJjtauC61
 49F+Y5tkknYPl9Ajk4BJXuK55uJZW4zB17vTl0Q/dzrk7VhEM1sIFdUvtg2ZuLCTvPYZKl4zF
 o8wtGSh0R1C+/CLxilkHVy8Z7rt0vVHJrUrn2hyFX6rN5jfahX78p04WN0Jv7CYEcKrmZCZXj
 oOwfXWPZe7Dhxg9DTByYjkKzd2Du1kWg9uNmekFv6RGeoW7V+ndJk/21i3EbiHn6gks7EVO6c
 uAWJ7EFpvxhD+m1FLSxQUD6A3nUFm+WorQJVY/v4uMcrTlCLT5LuO+DcyzAcwhGnZBL/wVqF7
 pyuel8/6GBEz1vJKYzq0KxfSd0sjkpKCa/BolbLm3La+w0Epbh13G1T40ML/nXuXSprj8oqtK
 lPqXSqxNJdA0CtVUHDYGV3brixLbsvRWM5Y/YVPm1yLB6BZ48ETCEtZ9oQfQEzL9Opz9Ekm5v
 lUPUAnMD/9tZAnd7OfxHOLGqyzM4rqn0U8iP00CJP3IG9UX7HyYwSMfMhFBeUt+eKu2H5ShjW
 wOjnhHoc3Pvyqi5ef6Z6Tbd1e0MtlDQ0ReIE2a29N4JjDiOQtY3HC7Fwud+evqnIIuajFpHZ7
 zWqTzuWLUMWa7uRF1i7EmAXA0FoVLHFt9syF/EPviGO1Z/bY4ysy9auBBC5ijchPIvOsBRQB5
 aVnn4VxK8RPIJvRNyZRvAjWIhwX+iCeqEBOVD7OHrpVsOxFR5sAGwEEZDJA8UO9sCFVzsmJ6V
 pNMk8nVnM46CQ0ut4Qx2W+gnSOQ=

On 12/11/23 18:26, Guenter Roeck wrote:
> On 12/11/23 07:53, Helge Deller wrote:
>> On 12/10/23 22:59, Guenter Roeck wrote:
>>> On 12/10/23 13:42, Helge Deller wrote:
>>> [ ... ]> I actually don't know if null-bytes are transferred.
>>>> But ext4 reports CRC errors, so I added this hunk to the Linux kernel=
:
>>>>
>>>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>>>> index d7732320431a..9b12fbd44e06 100644
>>>> --- a/fs/ext4/inode.c
>>>> +++ b/fs/ext4/inode.c
>>>> @@ -4732,6 +4736,9 @@ struct inode *__ext4_iget(struct super_block *s=
b, unsigned long ino,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto bad_inode;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw_inode =3D ext4_r=
aw_inode(&iloc);
>>>> +// printk("raw_info=C2=A0 provided %px %x\n", &raw_inode->i_checksum=
_lo, raw_inode->i_checksum_lo);
>>>> +// printk("=C2=A0 iloc->bh->b_data %px=C2=A0 iloc->offset %lx\n", il=
oc.bh->b_data, iloc.offset);
>>>> +if (raw_inode->i_checksum_lo =3D=3D 0) asm(".word 0xfffdead0");
>>>>
>>>> The last line immediately stops qemu if the checksum is zero.
>>>> I start qemu with
>>>> =C2=A0=C2=A0./qemu-system-hppa -drive file=3D../qemu-images/hdd.img.n=
ew,if=3Dnone,id=3Dd0 -kernel vmlinux=C2=A0 -append "root=3D/dev/sda5 conso=
le=3DttyS0 single earlycon=3Dpdc"=C2=A0 -serial mon:stdio -smp cpus=3D3=C2=
=A0 -machine C3700=C2=A0 -nographic=C2=A0 -snapshot -device am53c974,id=3D=
scsi -device scsi-hd,bus=3Dscsi.0,drive=3Dd0
>>>>
>>>> qemu aborts with the am53c974 driver.
>>>> If I use exactly the same command, but with the lsi53c895a driver ins=
tead of am53c974, it boots correctly.
>>>>
>>>> Any other idea?
>>>>
>>>
>>> Does your code use scatter-gather DMA ?
>>
>> Which code? The kernel which mounts the ext4 filesystem?
>>
>
> Seabios. Sorry, I thought your problem was with that.

Yes and no.
My main intention was to test with the Linux kernel primarily.
If this works, then it's easier to test the SeaBIOS code too.

>>> If so, that might explain the problem.
>>> I don't think the qemu code implements that properly. I don't mean the=
 MDL version,
>>> that isn't implemented at all. I mean the non-MDL version, where a sin=
gle SCSI
>>> command requires multiple DMA transfers which have to be set up one by=
 one.
>>
>> Is there any way I could test, e.g. by disabling SG ?
>>
>
> No idea, but that makes me wonder if ext4 and other file systems somehow=
 trigger SG
> operation while ext2 doesn't. I'll do some debugging along that line.

Ok, thanks!

Helge



Return-Path: <linux-parisc+bounces-207-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CBD80D01A
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Dec 2023 16:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA8481C2095C
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Dec 2023 15:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CA34BAAA;
	Mon, 11 Dec 2023 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="r7MD5tlS"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E423EA1
	for <linux-parisc@vger.kernel.org>; Mon, 11 Dec 2023 07:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702310037; x=1702914837; i=deller@gmx.de;
	bh=cYtl+juPwlhwzglLQdU2/2aC/DFMzYM1P4bDGKGtbpE=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=r7MD5tlSTbo21oa23iaA29RoohK6hEKgBf6tb+WigcEWCq8yoTjbL6ZXfmRTLNPT
	 pKf8kE533Zen5iSbLlMHupPFRLg/eF+7S6ob4rr9eO0/gRKtbSyiXaQLf7UYkvI8j
	 ClKiKHuqRW0a+4+R2nd2MxTcuf6hqlRbcjeBMfCGrLydGnkskkGMogl9eJSiUtmfC
	 YMVpethKBghofBF2yWLqZljbASwxZXY1/RggQCh4E8bxVq6jsmQEPXQG5SbrlapK2
	 md3DLqcUYVQx6NBhpB118IKMc+0V+UI0fz2aoiehkkeaFmd5Geeuh8aGRqLZRM34w
	 rZxHzM14dCV8RpP7Ow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.152.58]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwYu-1rVdV30LQi-00uMoW; Mon, 11
 Dec 2023 16:53:57 +0100
Message-ID: <d68c9ade-9b5e-4ccc-ba72-4c5ef98750a5@gmx.de>
Date: Mon, 11 Dec 2023 16:53:55 +0100
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
 <44dec9d0-8715-4ae6-8abc-31159529470d@gmx.de>
 <046e9f36-5086-4d87-8187-94558f52fef9@ilande.co.uk>
 <17a5173a-a596-4ea8-941b-3c9b5492e4b7@gmx.de>
 <e6420598-df13-41e5-b6f2-e469db5473db@roeck-us.net>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <e6420598-df13-41e5-b6f2-e469db5473db@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+XrGsWArZwUP2DhPaAtQTKluGkxjq5UWBpVCulQN3TiU9jkcafo
 RZvMahsDUs/ndw4Fj9XVDGGRLzj6FwZMiY1hy8SP8kcY5jhBVOpCnbYbmUlUBPD6YCkmFw0
 MmM29PgayMyN1L4cnDOs1XCfjGT5IPXsXjzXlC0++U84cr7PqCaaI5iLAfU3y+ljxBMwfdB
 S/psEXeWSgxFXGEJKhEHg==
UI-OutboundReport: notjunk:1;M01:P0:GGJTzy8droQ=;9qDwGPKcpEgM9mBNcxqGvkahA25
 8PUWeSl1jELyDn+W/gbtNrmMQkgRyoSpoyW1q/L/BRN2C0zsaWp5xg3A3YNPAQpUjBF2sDRYk
 zqgxvqkOUp0Tctxb6ybYkL5wr/QDl6Qz0rg5rNjX+KkO9NNEtGs4RJB79Aqbzcy+lDc78U7Fp
 ybwEhNExhXCrxRVTHQd9U7mPLgFRpleR3Xymis49ySHbFPAPl+iYjQn6v6+iYeQEeFI2VgZ1r
 uWYHuyFnrU2G+tAjgdV2d48f71+iygDF621fui+izdN81O5GZofILOYGpKFJHfQuELH20Pp7N
 df69gWXngy/18UqP9qLCLlNom1SMYlXbNYeEIWDwsH6i07pPDvVYic+QvkKoc1YEB7cBARAjM
 crRaWNGDz0WBuLhAfYb+CICcWouvSDHhwF2QV+2WJVaQMGJ2DyJLzwY9Q/Dv1H7lKY1zDTqiI
 5hTiFPZ/qFmnmfJsUj6oc4ovKInr6kBEyLlJYW1GQSO+zvkQkewM+RSa6PnZxNL4UEJHGxgoR
 IOWdJJPJ/bNbL6c8nbLehwSVj2gkHnQUs4Ovt+T3XyGZuqTvJy6fgVLmLmXp1cQLCWhWaGl67
 hRZPHXvIEoK1BmKoyoHLXu2Jcp8O1RiqeeTfMikMF4VfogKLZ3gt1ef4aZxIlTAmQ85ovLgcs
 ZKX6cdYD4AHLmGoSOldbg0w1woGLbsdBrrEVZhRTM0BgdDtQSlcgFjnqyBbHYSt73QeM8r+rt
 GCsNZWghF40HLVdiyGVhAX43WqFslTWELWtZ9BiD2FeQr2skGBjLWg+jLN5K0ViXpt8Yq4lb0
 qXqOesXuLmVLfs6DwC1pVPw6I8dVH0v6V/WNijT03tgzy+rPHww8K8tWlt46oFivBFwX29qTs
 oxF8m0/GHlV4EtjiKGMZJOyUwGRYuRlqdljZQqGHv72OgQzdottGt5tgNZX0n0QSgI6fPpaWY
 F+egOA==

On 12/10/23 22:59, Guenter Roeck wrote:
> On 12/10/23 13:42, Helge Deller wrote:
> [ ... ]> I actually don't know if null-bytes are transferred.
>> But ext4 reports CRC errors, so I added this hunk to the Linux kernel:
>>
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index d7732320431a..9b12fbd44e06 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
>> @@ -4732,6 +4736,9 @@ struct inode *__ext4_iget(struct super_block *sb,=
 unsigned long ino,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto bad_inode;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw_inode =3D ext4_raw=
_inode(&iloc);
>> +// printk("raw_info=C2=A0 provided %px %x\n", &raw_inode->i_checksum_l=
o, raw_inode->i_checksum_lo);
>> +// printk("=C2=A0 iloc->bh->b_data %px=C2=A0 iloc->offset %lx\n", iloc=
.bh->b_data, iloc.offset);
>> +if (raw_inode->i_checksum_lo =3D=3D 0) asm(".word 0xfffdead0");
>>
>> The last line immediately stops qemu if the checksum is zero.
>> I start qemu with
>> =C2=A0=C2=A0./qemu-system-hppa -drive file=3D../qemu-images/hdd.img.new=
,if=3Dnone,id=3Dd0 -kernel vmlinux=C2=A0 -append "root=3D/dev/sda5 console=
=3DttyS0 single earlycon=3Dpdc"=C2=A0 -serial mon:stdio -smp cpus=3D3=C2=
=A0 -machine C3700=C2=A0 -nographic=C2=A0 -snapshot -device am53c974,id=3D=
scsi -device scsi-hd,bus=3Dscsi.0,drive=3Dd0
>>
>> qemu aborts with the am53c974 driver.
>> If I use exactly the same command, but with the lsi53c895a driver inste=
ad of am53c974, it boots correctly.
>>
>> Any other idea?
>>
>
> Does your code use scatter-gather DMA ?

Which code? The kernel which mounts the ext4 filesystem?

> If so, that might explain the problem.
> I don't think the qemu code implements that properly. I don't mean the M=
DL version,
> that isn't implemented at all. I mean the non-MDL version, where a singl=
e SCSI
> command requires multiple DMA transfers which have to be set up one by o=
ne.

Is there any way I could test, e.g. by disabling SG ?

Helge



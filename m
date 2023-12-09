Return-Path: <linux-parisc+bounces-197-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 361AF80B6A9
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Dec 2023 22:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48B981C20839
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Dec 2023 21:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2091D549;
	Sat,  9 Dec 2023 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="M+iFQ4NX"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BF4103
	for <linux-parisc@vger.kernel.org>; Sat,  9 Dec 2023 13:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702159124; x=1702763924; i=deller@gmx.de;
	bh=PcloEVtYr0rQYkLMl+csrod5mRgF7Gz/3AyVR2dkk/k=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=M+iFQ4NXqCzn6gQ6PBridd4lCTCcTnbX3a1/q4s/gfmGjXktjE0S6iLT1ltZJLdp
	 Z08CzTbzFWy+9a9TGYLfXIfrzGetcSMIQsCFSBQ0Cea6InoQYLaO6kGDAjTUr65o+
	 aU6afC+KX3mlvmxwAUGHU2+WfPMpwBKFMlhGjrUzYn1d466bxXGHsZxuWI3nYlMW8
	 gyXnEoqd76OvAq3Rw8BtvQHiAtz5M3IIT4TK7pxGPudyWeS80PK40l8XmmWLf/KJT
	 OLGlDSqoEwNsorfqVP5nqJCS+fLi5V+V6v9Z7Tznq/LtpI8p2yb78oiMhUfJJlQa7
	 V5Yac77y3rrUSQPCsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.152.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mjj87-1rfLId1lzn-00lBdG; Sat, 09
 Dec 2023 22:58:44 +0100
Message-ID: <3b82d9e7-5b26-4154-a253-9bbbb04cf617@gmx.de>
Date: Sat, 9 Dec 2023 22:58:42 +0100
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
 <41052280-bb9f-4fa4-a3d4-ed23a1fcdbd1@gmx.de>
 <c56601c1-f89a-463a-93df-db93133e8315@roeck-us.net>
 <4b6ef6f3-c3db-48fe-a3ee-1d874d510c7e@gmx.de>
 <12740a29-5827-4a62-8acf-a7b1b14f7099@roeck-us.net>
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
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <2924c887-0022-4cab-a986-0afd5f7a50f4@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gQsEgfOcZwlF/W3VCwO9jsWPp+Od8bX/SUOEMGWmsf0XIYngH7d
 7xWlygbNuwQphCiKVEKJ68x0IUChzAeua7fRwPQccaPuW91BZaoiMyRfgmMEdyjYZYeAzmA
 KofqO9HY+cPeW+iFY2aObWqNfyeYJVqJQ7CQAb4TgMMNxgsr2Yb7tPEpSLdDbzGeAOuASru
 ByX3jnLGeOuLAEFDaK4YQ==
UI-OutboundReport: notjunk:1;M01:P0:Cx8ASQ8f8aY=;W6TmCIDqpDVNIH634VW2oH/p884
 pdBpsKGs6su5FehiaPcAkYuxPLnx1jsAGISvWbJ/t/Ybn2TBQ8HhVKlnwA+6jA4G6yVzAYN5p
 lj5kOA1DlRqhPff8kplN3mYJLBdx9ZUCsol0m9XiCvQywx4kUj7rxLxtwdldqYo2oy4MNNG2+
 MYEBsPPPN5FHDq/KNjLaZCP2puTtYnsPidm59UYBmrYOXKseYCfEcceDLes6TpAiQCxKr07Tz
 sd1plTPWex4ebHk1TUedG1bfdxsHKPjYQqa3llyyxClMl68TAb7FXTsezciRxRHcx9OBue6nw
 MtSKyabo79eE8Vtq/jw1I3Q3gAoHwRlc3zex4Z+RyxAKKvplm/TRQiZQg27qNQIo5c6mk3AXc
 i2FLSuYAip9PIzfv4m1H791brqJm6Q5vmYS+WmJXt6l0SO0t/5qSBKZw4QoMOMUoc71yPbuAj
 rIAc0y1o95ifpfwWNRmlo+zlbNIdewMHpN2amNRFSqtdlQGl4TTPI3OkikMKYWzDNEXn7f6bH
 8ByVsF2KBfu3oLHpI/C9K199P0aHmNnS9sFQ2e0FWhVRLL0YIFEs2FHuXAc6JqJTmLeT5CiyG
 adWiZtxisvdQoLpbqwkZ8PKcMB5+xqfhwOCccFSjXRO0/kdl+Dpuqesbx5t2D0m7hckw+iVcR
 hSKvWKxNH374BNjad1dAvDz+NvYW3Ku+/BhvAROp23KAHo4KXCUxeFdyrOhXQf2TJvfIjHIe8
 Bmi4Ey7zZSOTa/XQj+kK3JYQpcjSLnnMp+9EZ9Lrt1txYSdtH9uxgMS9I4jqmiK2+aYQb3lRZ
 g/V11WKuBMLPvIZLNWFR5dPd7tY432PPZ5x2WAhYRcH2J1dvVJFRr4iL9oFXUrd/nE7f2TTqE
 1C7rBvSiIKQrjsVe/UCwKoKpS+IwuBevwFCHQ7N5WsK74pX7yvjrgVuRYalt9VtnUSNfvUlaE
 Th4SOA==

On 12/9/23 19:56, Mark Cave-Ayland wrote:
>>>>>>>>> The command line I used for testing hppa is below:
>>>>>>>>>
>>>>>>>>> ./qemu-system-hppa \
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -kernel vmlinux-parisc \
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -no-reboot \
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -snapshot \
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -device am53c974,id=3Dscsi \
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -device scsi-hd,bus=3Dscsi.0,drive=3Dd0=
 \
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -drive file=3Drootfs.ext2-parisc,format=
=3Draw,if=3Dnone,id=3Dd0 \
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -append "panic=3D-1 slub_debug=3DFZPUA =
root=3D/dev/sda console=3DttyS0,115200" \
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -nographic -monitor null
>>>>>>>>>
...
>> If I limit the disc transfer size of am53c974 to just 4K per transactio=
n
>> (like the patch below against Linux kernel 6.6.4), then qemu-hppa
>> boots up nicely with qemu git head (and G=C3=BCnther's patches applied)=
.
>
> Nice detective work :)
>
> If you're using the esp-rework-testing branch then the only patch you sh=
ould need is the patch to esp-pci.c: otherwise if you also apply G=C3=BCnt=
her's esp.c patch then you break the reset of the ESP_RSTAT flags when rea=
ding ESP_RINTR. Can you confirm that this is the case in your tests?
>
>> No ext4 crc errors in this case.
>> Mark, your git tree then still gives IRQ issues and other problems.
>
> Presumably this is just the "Spurious irq, sreg=3D%02x." errors, or are =
you seeing something else?

Mostly spurious irq:

[   41.561399] scsi host1: Spurious irq, sreg=3D10.
[   41.562700] scsi host1: Spurious irq, sreg=3D13.

But later too:

[    **] (1 of 5) Job dev-disk-by\x2duuid-ac=E2=80=A6ice/start running (50=
s / 1min 30s)
[   72.700842] scsi host1: Aborting command [0000000016534e32:2a]
[   72.700842] scsi host1: Current command [00000000320ffcdd:2a]
[   72.700842] scsi host1: Queued command [0000000016534e32:2a]
[   72.700842] scsi host1:  Active command [00000000320ffcdd:2a]
[   72.700842] scsi host1: Dumping command log
[   72.700842] scsi host1: ent[13] CMD val[01] sreg[92] seqreg[01] sreg2[0=
0] ireg[10] ss[00] event[01]
[   72.700842] scsi host1: ent[14] CMD val[10] sreg[92] seqreg[01] sreg2[0=
0] ireg[10] ss[00] event[01]
[   72.700842] scsi host1: ent[15] EVENT val[02] sreg[92] seqreg[01] sreg2=
[00] ireg[10] ss[00] event[01]
[   72.700842] scsi host1: ent[16] EVENT val[0d] sreg[90] seqreg[01] sreg2=
[00] ireg[10] ss[00] event[02]
[   72.700842] scsi host1: ent[17] EVENT val[04] sreg[90] seqreg[01] sreg2=
[00] ireg[10] ss[00] event[0d]
[   72.700842] scsi host1: ent[18] CMD val[90] sreg[90] seqreg[01] sreg2[0=
0] ireg[10] ss[00] event[04]
[   72.700842] scsi host1: ent[19] EVENT val[05] sreg[90] seqreg[01] sreg2=
[00] ireg[10] ss[00] event[04]
[   72.700842] scsi host1: ent[20] CMD val[01] sreg[93] seqreg[01] sreg2[0=
0] ireg[10] ss[00] event[05]
[   72.700842] scsi host1: ent[21] EVENT val[0d] sreg[93] seqreg[01] sreg2=
[00] ireg[10] ss[00] event[05]
[   72.700842] scsi host1: ent[22] CMD val[01] sreg[93] seqreg[01] sreg2[0=
0] ireg[10] ss[00] event[0d]
[   72.700842] scsi host1: ent[23] CMD val[11] sreg[93] seqreg[01] sreg2[0=
0] ireg[10] ss[00] event[0d]
[   72.700842] scsi host1: ent[24] EVENT val[0b] sreg[93] seqreg[01] sreg2=
[00] ireg[10] ss[00] event[0d]
[   72.700842] scsi host1: ent[25] CMD val[12] sreg[97] seqreg[01] sreg2[0=
0] ireg[08] ss[00] event[0b]
[   72.700842] scsi host1: ent[26] EVENT val[0c] sreg[97] seqreg[01] sreg2=
[00] ireg[08] ss[00] event[0b]
[   72.700842] scsi host1: ent[27] CMD val[44] sreg[97] seqreg[00] sreg2[0=
0] ireg[20] ss[00] event[0c]
[   72.700842] scsi host1: ent[28] CMD val[01] sreg[97] seqreg[00] sreg2[0=
0] ireg[20] ss[02] event[0c]
[   72.700842] scsi host1: ent[29] CMD val[43] sreg[97] seqreg[00] sreg2[0=
0] ireg[20] ss[02] event[0c]
[   72.700842] scsi host1: ent[30] EVENT val[0d] sreg[96] seqreg[01] sreg2=
[00] ireg[18] ss[00] event[0c]
[   72.700842] scsi host1: ent[31] EVENT val[09] sreg[96] seqreg[01] sreg2=
[00] ireg[18] ss[00] event[0d]
[   72.700842] scsi host1: ent[0] CMD val[01] sreg[96] seqreg[01] sreg2[00=
] ireg[18] ss[00] event[09]
[   72.700842] scsi host1: ent[1] CMD val[10] sreg[96] seqreg[01] sreg2[00=
] ireg[18] ss[00] event[09]
[   72.700842] scsi host1: ent[2] EVENT val[0a] sreg[96] seqreg[01] sreg2[=
00] ireg[18] ss[00] event[09]
[   72.700842] scsi host1: ent[3] CMD val[00] sreg[92] seqreg[01] sreg2[00=
] ireg[10] ss[00] event[0a]
[   72.700842] scsi host1: ent[4] EVENT val[0d] sreg[92] seqreg[01] sreg2[=
00] ireg[10] ss[00] event[0a]
[   72.700842] scsi host1: ent[5] EVENT val[01] sreg[92] seqreg[01] sreg2[=
00] ireg[10] ss[00] event[0d]
[   72.700842] scsi host1: ent[6] CMD val[01] sreg[92] seqreg[01] sreg2[00=
] ireg[10] ss[00] event[01]
[   72.700842] scsi host1: ent[7] CMD val[10] sreg[92] seqreg[01] sreg2[00=
] ireg[10] ss[00] event[01]
[   72.700842] scsi host1: ent[8] EVENT val[02] sreg[92] seqreg[01] sreg2[=
00] ireg[10] ss[00] event[01]
[   72.700842] scsi host1: ent[9] EVENT val[0d] sreg[90] seqreg[01] sreg2[=
00] ireg[10] ss[00] event[02]
[   72.700842] scsi host1: ent[10] EVENT val[04] sreg[90] seqreg[01] sreg2=
[00] ireg[10] ss[00] event[0d]
[   72.700842] scsi host1: ent[11] CMD val[90] sreg[90] seqreg[01] sreg2[0=
0] ireg[10] ss[00] event[04]
[   72.700842] scsi host1: ent[12] EVENT val[05] sreg[90] seqreg[01] sreg2=
[00] ireg[10] ss[00] event[04]
[   72.759532] scsi host1: Aborting command [00000000320ffcdd:2a]
[   72.760847] scsi host1: Current command [00000000320ffcdd:2a]
[   72.760847] scsi host1:  Active command [00000000320ffcdd:2a]
[   72.760847] scsi host1: Dumping command log
[   72.760847] scsi host1: ent[13] CMD val[01] sreg[92] seqreg[01] sreg2[0=
0] ireg[10] ss[00] event[01]
[   72.760847] scsi host1: ent[14] CMD val[10] sreg[92] seqreg[01] sreg2[0=
0] ireg[10] ss[00] event[01]
[   72.760847] scsi host1: ent[15] EVENT val[02] sreg[92] seqreg[01] sreg2=
[00] ireg[10] ss[00] event[01]
...

Helge


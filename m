Return-Path: <linux-parisc+bounces-168-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE1C80AD2F
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 20:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C8C1B20A04
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 19:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C974CB4D;
	Fri,  8 Dec 2023 19:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="XkZIQXdF"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0BAF98
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 11:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702064261; x=1702669061; i=deller@gmx.de;
	bh=dUj09y3KPl2JEI6QcKn660e2F+Jg58rqERt8zIvNeSk=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
	b=XkZIQXdFQ8sCsWdliImbbc5g7x1LohTR0tajkVapcyyf8JC+hSywHtmvfqpNJ22j
	 3CL337wcM/CzY4xWcVfSAA1hlLgVNgipyj79Z3zXv7Ri0Og8dgbUdSzO3Dl+OohH9
	 h6bi1YNQxGpOQ+lsvmj9QdxYNqKTfTg/g6ENjWZEfQKzQFoq3bp0nEvY45/HqOIWA
	 iOpqwud5m/BZ1FGzt+f8RBmtq8G6EwFuH3ArMkS2Y1IJ1/jLEmoMOBNSvEZuEEVpw
	 kYC/DmSfuX5MhzpTuufl5g28Jp4jDju/9mVxROK5gfRfRfFUoFhOGdz3ecMSB9HpJ
	 vZRS7e3qlXmnnZsoEA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.158.195]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCOE-1qqhuL21ci-00N9Rk; Fri, 08
 Dec 2023 20:37:41 +0100
Message-ID: <ae5e04f4-3979-4a6e-8cff-58f69e41fb08@gmx.de>
Date: Fri, 8 Dec 2023 20:37:40 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
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
 <97729a4b-5ef7-42ad-897d-a57cd9a5a5bf@ilande.co.uk>
 <a68b234a-c202-44ca-bb45-5cbb86b5729b@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <a68b234a-c202-44ca-bb45-5cbb86b5729b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vDEaZXsQgl+/VC48t+7AjuKpwLZ42lB8xyGfkUXloRIRt+3vw9o
 xD5koY5k1sWt02z1QM5SpCn/HJAtJlO76ijD9Q5RR0fWqMsxZ8okivbumgxbGlb1c0hs6xs
 BDVW7qzMkwu1embLn+4frPeXCrfdTZYhvw1zAY2X1SQ+X2BM4eBynCOVfp2bvHkIiu/gprD
 VmOMmfgeVNp7PWt/7giHg==
UI-OutboundReport: notjunk:1;M01:P0:aS8GK4SfFRU=;F1jIRMNC9BYdq1JFxYJbz82yRBR
 uYWAzNhDxR2H2zL7fGOViPUihY3vDuXWjcysIzJXtnVmcmsj7xBbrQtgwk9T0vMTGCoxaLAVK
 IwzDJ7YQz0+29mLNd2ZapcZL7AC+0iLFmBRS+0dOUwOibQOOKsJ2oVjcj2Koudkx/ZqTejVdi
 E7IFeX4ddrXU6ski/922yf08+G6plOWG5PN1gc7pN2fNnLOm0zwocsmuC9oqgiN/0cUhEZhn/
 akvFqFiF0CAIEZFRwLlNwBvRkFejisx9dH2MM3Mu9uZ8wEczKNWP1nA6ov/PHzbOmHJ/3Ow9k
 opFC7QaQ06W+itTlUhOQbJP/a94xutsjVVtjM2JjISycjzNbxTquNcegdPvqACpEmE0wlhw1M
 i27/8Tiwp1p9vXn7pr0Gi2Z6sexbbTJhw3jPzGO/+7GeP8CjSTMLkLxlsTMut0IpJNkB4FW9A
 RTkLi7Mj2fDPnwje4K1OnvCOODe9HzWuFTXMJmpvuTUjbWuLEHNzetxemnG3xNFSOqylIERNo
 0fKbVnwYzwYd4CMPBWsxFzbvI+JggmnoF6cyPj0Dj79SxD/r+mJ5pj9Hnfa2bc7lxJjJ+v5LK
 tDSX65hczkLdnYFazbbK3VZFSzR3icEf6J4KOPkaK8Hi6rJjudIO8wHrG05Fy6fqKX2bpq0yD
 ZLnRKGclqRQ6NdRKOL5GD/o6OZfYrc7Ff57tN1RimvZqXiLUFwwoWADJECRqafA22tDewEFXc
 3QP0ErljKRU62nnHLXyNq5Nx1V91JwovNF9YlSmCESNhNifhRyMiT212eozUrXbhNWl7Od1B8
 uyWNKn8SLR516BqGW+lIexMBwZhI3Q3D1OUzQWwLizNCdHgZq0Bi6r4QmJupYH7HYFaLp0EGr
 ZP1sH2rpLS28jcFVXNd5KlErZJjrEFwv8IxHIaSC9J/89T2cjLARjV5/Y/R9Ncuqu+6EdCagC
 zUdAmlloJk/TirLdpsQW40pzw7s=

On 12/8/23 20:26, Helge Deller wrote:
>> Yeah that's one of the many bugs which should be fixed by my latest
>> series. I've pushed the current version of my branch with the ESP
>> rewrite to https://github.com/mcayland/qemu/tree/esp-rework-testing
>> if you would both like to give it a test.
>
> Tried it with qemu-hppa:
>
> [=C2=A0=C2=A0=C2=A0 4.257547] am53c974 0000:00:04.0: enabling SERR and P=
ARITY (0107 -> 0147)
> [=C2=A0=C2=A0=C2=A0 4.917824] am53c974 0000:00:04.0: esp0: regs[(ptrval)=
:(ptrval)] irq[70]
> [=C2=A0=C2=A0=C2=A0 4.918704] am53c974 0000:00:04.0: esp0: is a AM53C974=
, 40 MHz (ccf=3D0), SCSI ID 15
> [=C2=A0=C2=A0=C2=A0 8.010626] scsi host1: esp
> [=C2=A0=C2=A0=C2=A0 8.026345] scsi 1:0:0:0: Direct-Access=C2=A0=C2=A0=C2=
=A0=C2=A0 QEMU=C2=A0=C2=A0=C2=A0=C2=A0 QEMU HARDDISK=C2=A0=C2=A0=C2=A0 2.5=
+ PQ: 0 ANSI: 5
> [=C2=A0=C2=A0=C2=A0 8.032066] scsi target1:0:0: Beginning Domain Validat=
ion
> [=C2=A0=C2=A0=C2=A0 8.043254] scsi target1:0:0: Domain Validation skippi=
ng write tests
> [=C2=A0=C2=A0=C2=A0 8.044284] scsi target1:0:0: Ending Domain Validation
> [=C2=A0=C2=A0=C2=A0 8.123681] sd 1:0:0:0: Power-on or device reset occur=
red
> [=C2=A0=C2=A0=C2=A0 8.134707] sd 1:0:0:0: [sda] 209715200 512-byte logic=
al blocks: (107 GB/100 GiB)
> [=C2=A0=C2=A0=C2=A0 8.140043] sd 1:0:0:0: [sda] Write Protect is off
> [=C2=A0=C2=A0=C2=A0 8.144759] sd 1:0:0:0: [sda] Write cache: enabled, re=
ad cache: enabled, doesn't support DPO or FUA
> [=C2=A0=C2=A0=C2=A0 8.205316]=C2=A0 sda: sda1 sda2 sda3 < sda5 sda6 >
> [=C2=A0=C2=A0=C2=A0 8.222763] sd 1:0:0:0: [sda] Attached SCSI disk
> [=C2=A0=C2=A0=C2=A0 8.231170] sd 1:0:0:0: Attached scsi generic sg0 type=
 0
...> [=C2=A0=C2=A0=C2=A0 8.679666] Freeing unused kernel image (initmem) m=
emory: 3072K
> [=C2=A0=C2=A0=C2=A0 8.680679] Write protected read-only-after-init data:=
 2k
> [=C2=A0=C2=A0=C2=A0 8.681338] Run /sbin/init as init process
> [=C2=A0=C2=A0=C2=A0 8.731576] EXT4-fs error (device sda5): ext4_lookup:1=
855: inode #787975: comm swapper/0: iget: checksum invalid
> [=C2=A0=C2=A0=C2=A0 8.736664] scsi host1: Spurious irq, sreg=3D10.
> [=C2=A0=C2=A0=C2=A0 8.760106] Starting init: /sbin/init exists but could=
n't execute it (error -67)

The driver isn't so bad in general.

With my current seabios-hppa from
https://github.com/hdeller/seabios-hppa/tree/devel
and booting like this:

./qemu-system-hppa -drive file=3D../qemu-images/hdd.img.new,if=3Dnone,id=
=3Dd0  -serial mon:stdio -smp cpus=3D3  -machine C3700  -nographic  -snaps=
hot -device dc390,id=3Dscsi -device scsi-hd,bus=3Dscsi.0,drive=3Dd0  -bios=
 ../seabios-hppa/out/hppa-firmware.img


it actually can *partly* boot from disc:
...
Selected kernel: /vmlinux from partition 2
Selected ramdisk: /initrd.img from partition 2
ELF64 executable
Segment 0 load 0x000e0000 size 5171564 mediaptr 0x1000
Segment 1 load 0x01a00000 size 25012 mediaptr 0x4f0000
Loading ramdisk 23869192 bytes @ 3e92a000...

Decompressing Linux... XZ-compressed data is corrupt
  -- System halted

So, it can read partition table, even load some sectors, but
the data returned can be corrupt, as the "XZ-compressed data is corrupt"
message states.
This fits with the CRC checksum errors I saw when booting
from ext4 disc.

Is the dc390/esp driver functional on other big-endian machines?

Helge


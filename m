Return-Path: <linux-parisc+bounces-183-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB77080AF6D
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 23:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B0991C20A30
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Dec 2023 22:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9186C5915B;
	Fri,  8 Dec 2023 22:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="luwG1MKS"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B3710E0
	for <linux-parisc@vger.kernel.org>; Fri,  8 Dec 2023 14:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702073351; x=1702678151; i=deller@gmx.de;
	bh=/0Eub2aKNZqDbOfNLvnmPBfpuA/tzPw5waqefUl6riQ=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=luwG1MKSidtGhAUuOr7gAKSgdW2Syx461oEkV2W8Rf8xNMLCugzHGTrUAx4CppKo
	 F9wezEzGIUn4t5MmHwv37p8ah7efZHcY5c0DJCj18oMrm852w5+dmN6Y3Opa9yVii
	 9bv/sc4dH6qGZDxEVG1oI0PXixQb2OUY7j8FywjJuHz89WOHHuCXixjOTjgRPeGNU
	 r1u9uVd+pYTiMHIGTDgRqXA61FaH4wKZkgdPhqR7aFJ4DBw/chjI43VRmDHdOp1nj
	 ePQbw9loWsVnZK8OLpv7q6nbdbPnqgfxzLLdwQOWcqDBG5TNOsdh2gZ/GrssMcS1X
	 TUMnS+1yn9zJb9F7mg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.158.195]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZTmO-1qhYsD3HYE-00WVw6; Fri, 08
 Dec 2023 23:09:11 +0100
Message-ID: <f3777cce-31af-4632-9480-bc1f78285d2f@gmx.de>
Date: Fri, 8 Dec 2023 23:09:11 +0100
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
 <97729a4b-5ef7-42ad-897d-a57cd9a5a5bf@ilande.co.uk>
 <a68b234a-c202-44ca-bb45-5cbb86b5729b@gmx.de>
 <ae5e04f4-3979-4a6e-8cff-58f69e41fb08@gmx.de>
 <015b31ba-f440-4fb1-af0c-265f484bc91a@ilande.co.uk>
 <4ba17f2d-632c-4c49-a9d0-46324b5e5d7e@roeck-us.net>
 <68c3b5c9-4986-48c6-9cdb-52da59486e4c@ilande.co.uk>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <68c3b5c9-4986-48c6-9cdb-52da59486e4c@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GSs5tWn1ZiNAcs/k45hSILGebL++Hsk/4Hz53xUas+l0cTcNFRk
 3hhH1s5lOw/KOcaWtiPBSbxzkrXnFDLGMBdPi87tou0LNIx6+5Rlbk742DbnwY7U1oGc7Nx
 YGVTY+vl9vMz5HotwDpmw2YsXdxj1ipzLWwuDo0x3rSysmoOPwyyv/hz0IFq/bxH6ep2G13
 22TIYU3HhCcJXWhSLJM9w==
UI-OutboundReport: notjunk:1;M01:P0:fE9DhVgcPFQ=;r28y6DWLLdxDkKOxkOKjAMYRF8q
 Yze1gXohmRecJ43vH9bFC04yP/lCXYsndnZleh+PLRho/EmxXU6AJysALmMzKz/haLqyv5XRc
 tKTGc0Dh0GQiNhZlw+ncoKjniE8qhpFAhPaI+xHQEqlbalUa+AGLvRHyesGNO6ryfcq1PTlr0
 7lu3fWF+ndEJKPg4bqh0KAIYhZkqK8bpbvKUXIbnBoJScCGWg095mFaDVqgFNxo3u9VBZNvs6
 Iw/NeaKEEDZJoeb8hUmrqLATTlcxwVpUx+tfTuyHZCyoolHu/zzDiHr+6CxBrDkSx4T3MK7rs
 /4H1Dcwu8+uSYSAUibKNIpUYX42fPqgsWkCtNjo0M1gghTzIdCyEhH1p5W6agsUIMmNKehL/v
 18EYrVlKhfRcWVrICs4YzyXmADIaDyd01e0bhKudSPM5bL4E73XvBkzh6Ml+kXVf/kKNPoH+e
 F6+BQU2KV00LJEXEKPKWzHBOPGLylQD7hBJZ/MldPZb3t7YznkVkwbT5Csa3mr6ole3Cwh8I1
 CjBzMMW6enNs9ku7hMyKIrHQKVuHY6tC2ECDEOBeWf/Wfj7EUt/ZpyYVMPpMv6eGq6hF7GtIY
 YSl2JJyUX3fENAsSEWfOOw70bwtvomERSNsQuwqtJyobjskOxjSmF6LYM2gmE8Jox4qQrWzaf
 whje8GjUyMjp6UBrcjHlldbTJcJoxzFiP+Vqm11tai7LRmuqXZkjkXIS/mDSN44FaugDE+C31
 twG3gBOtw8jcUuoQmEUPFPY4vPL3hJRbUT+X/JbyOdECnCwrmAoI+ut3zU04i8dusVWNfpgnc
 s4toAipeNl4btbcxcfePbeC0mSIXr6BEtc60KNSAz7OI78hRnG/udEiJEe7S4cQqcY2PXFAlo
 qa1/1b4tk8V7tb2XefW3CTMJBFOjMEWtG2x262dR9hdgsVlsMdZrTgVCtCst1YbbeaOLxdgnZ
 Iiijbg==

On 12/8/23 22:25, Mark Cave-Ayland wrote:
> On 08/12/2023 20:28, Guenter Roeck wrote:
>> On 12/8/23 11:55, Mark Cave-Ayland wrote:
>>> On 08/12/2023 19:37, Helge Deller wrote:
>>>
>>>> On 12/8/23 20:26, Helge Deller wrote:
>>>>>> Yeah that's one of the many bugs which should be fixed by my latest
>>>>>> series. I've pushed the current version of my branch with the ESP
>>>>>> rewrite to https://github.com/mcayland/qemu/tree/esp-rework-testing
>>>>>> if you would both like to give it a test.
>>>>>
>>>>> Tried it with qemu-hppa:
>>>>>
>>>>> [=C2=A0=C2=A0=C2=A0 4.257547] am53c974 0000:00:04.0: enabling SERR a=
nd PARITY (0107 -> 0147)
>>>>> [=C2=A0=C2=A0=C2=A0 4.917824] am53c974 0000:00:04.0: esp0: regs[(ptr=
val):(ptrval)] irq[70]
>>>>> [=C2=A0=C2=A0=C2=A0 4.918704] am53c974 0000:00:04.0: esp0: is a AM53=
C974, 40 MHz (ccf=3D0), SCSI ID 15
>>>>> [=C2=A0=C2=A0=C2=A0 8.010626] scsi host1: esp
>>>>> [=C2=A0=C2=A0=C2=A0 8.026345] scsi 1:0:0:0: Direct-Access=C2=A0=C2=
=A0=C2=A0=C2=A0 QEMU=C2=A0=C2=A0=C2=A0=C2=A0 QEMU HARDDISK=C2=A0=C2=A0=C2=
=A0 2.5+ PQ: 0 ANSI: 5
>>>>> [=C2=A0=C2=A0=C2=A0 8.032066] scsi target1:0:0: Beginning Domain Val=
idation
>>>>> [=C2=A0=C2=A0=C2=A0 8.043254] scsi target1:0:0: Domain Validation sk=
ipping write tests
>>>>> [=C2=A0=C2=A0=C2=A0 8.044284] scsi target1:0:0: Ending Domain Valida=
tion
>>>>> [=C2=A0=C2=A0=C2=A0 8.123681] sd 1:0:0:0: Power-on or device reset o=
ccurred
>>>>> [=C2=A0=C2=A0=C2=A0 8.134707] sd 1:0:0:0: [sda] 209715200 512-byte l=
ogical blocks: (107 GB/100 GiB)
>>>>> [=C2=A0=C2=A0=C2=A0 8.140043] sd 1:0:0:0: [sda] Write Protect is off
>>>>> [=C2=A0=C2=A0=C2=A0 8.144759] sd 1:0:0:0: [sda] Write cache: enabled=
, read cache: enabled, doesn't support DPO or FUA
>>>>> [=C2=A0=C2=A0=C2=A0 8.205316]=C2=A0 sda: sda1 sda2 sda3 < sda5 sda6 =
>
>>>>> [=C2=A0=C2=A0=C2=A0 8.222763] sd 1:0:0:0: [sda] Attached SCSI disk
>>>>> [=C2=A0=C2=A0=C2=A0 8.231170] sd 1:0:0:0: Attached scsi generic sg0 =
type 0
>>>> ...> [=C2=A0=C2=A0=C2=A0 8.679666] Freeing unused kernel image (initm=
em) memory: 3072K
>>>>> [=C2=A0=C2=A0=C2=A0 8.680679] Write protected read-only-after-init d=
ata: 2k
>>>>> [=C2=A0=C2=A0=C2=A0 8.681338] Run /sbin/init as init process
>>>>> [=C2=A0=C2=A0=C2=A0 8.731576] EXT4-fs error (device sda5): ext4_look=
up:1855: inode #787975: comm swapper/0: iget: checksum invalid
>>>>> [=C2=A0=C2=A0=C2=A0 8.736664] scsi host1: Spurious irq, sreg=3D10.
>>>>> [=C2=A0=C2=A0=C2=A0 8.760106] Starting init: /sbin/init exists but c=
ouldn't execute it (error -67)
>>>>
>>>> The driver isn't so bad in general.
>>>>
>>>> With my current seabios-hppa from
>>>> https://github.com/hdeller/seabios-hppa/tree/devel
>>>> and booting like this:
>>>>
>>>> ./qemu-system-hppa -drive file=3D../qemu-images/hdd.img.new,if=3Dnone=
,id=3Dd0=C2=A0 -serial mon:stdio -smp cpus=3D3=C2=A0 -machine C3700=C2=A0 =
-nographic=C2=A0 -snapshot -device dc390,id=3Dscsi -device scsi-hd,bus=3Ds=
csi.0,drive=3Dd0=C2=A0 -bios ../seabios-hppa/out/hppa-firmware.img
>>>>
>>>>
>>>> it actually can *partly* boot from disc:
>>>> ...
>>>> Selected kernel: /vmlinux from partition 2
>>>> Selected ramdisk: /initrd.img from partition 2
>>>> ELF64 executable
>>>> Segment 0 load 0x000e0000 size 5171564 mediaptr 0x1000
>>>> Segment 1 load 0x01a00000 size 25012 mediaptr 0x4f0000
>>>> Loading ramdisk 23869192 bytes @ 3e92a000...
>>>>
>>>> Decompressing Linux... XZ-compressed data is corrupt
>>>> =C2=A0=C2=A0-- System halted
>>>>
>>>> So, it can read partition table, even load some sectors, but
>>>> the data returned can be corrupt, as the "XZ-compressed data is corru=
pt"
>>>> message states.
>>>> This fits with the CRC checksum errors I saw when booting
>>>> from ext4 disc.
>>>>
>>>> Is the dc390/esp driver functional on other big-endian machines?
>>>
>>> Yes it is, in fact the majority of my test images were from SPARC/m68k=
 (including a hppa image) and the series in its current form passes all my=
 boot tests except for an x86 DOS image with ASPI.
>>>
>>> The command line I used for testing hppa is below:
>>>
>>> ./qemu-system-hppa \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -kernel vmlinux-parisc \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -no-reboot \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -snapshot \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -device am53c974,id=3Dscsi \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -device scsi-hd,bus=3Dscsi.0,drive=3Dd0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -drive file=3Drootfs.ext2-parisc,format=3Draw=
,if=3Dnone,id=3Dd0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -append "panic=3D-1 slub_debug=3DFZPUA root=
=3D/dev/sda console=3DttyS0,115200" \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -nographic -monitor null
>>>
>>> If you are still seeing errors then I'd suspect an issue with the hppa=
 CPU emulation or the esp-pci device.
>>>
>>
>> I suspect it has more to do with ext4 vs. ext2 because ext2 works just =
fine for me
>> while I get unaligned access crashes with ext4. I started some tests wi=
th btrfs
>> and f2fs in addition to ext2 to see how those are doing.
>
> That sounds really useful, thanks for testing.

I think there are multiple issues.
Most likely some CPU emulation bug, maybe happens in CRC checksumming.

Nevertheless, with this command:
./qemu-system-hppa -drive file=3D../qemu-images/hdd.img.new,if=3Dnone,id=
=3Dd0  -serial mon:stdio -smp cpus=3D3  -machine C3700  -nographic  -snaps=
hot -device am53c974,id=3Dscsi -device scsi-hd,bus=3Dscsi.0,drive=3Dd0  -b=
ios ../seabios-hppa/out/hppa-firmware.img
I get this error:
Decompressing Linux... XZ-compressed data is corrupt

Replacing the scsi driver "am53c974" by "lsi53c895a" does boot.
At this stage no linux kernel is loaded yet, it's just the seabios-hppa
which loaded some scsi blocks into memory.

Helge


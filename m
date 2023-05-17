Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E74770734C
	for <lists+linux-parisc@lfdr.de>; Wed, 17 May 2023 22:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjEQUop (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 17 May 2023 16:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjEQUoo (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 May 2023 16:44:44 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639CE6E8B
        for <linux-parisc@vger.kernel.org>; Wed, 17 May 2023 13:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684356274; i=deller@gmx.de;
        bh=1BolOUzAmMU1naSdqp1UF/fkOr8sZU/8tBhDwYjqmc8=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=rCGE9lNH3ahfwEUqHzcLbYMr6f9UkTpOUVKCMWaqI8wD5HsvLp2LeOa5xBu2Bm0ul
         azSBiJ1/j5V1JsOvNtbL1KDmF+KlDVh6rx1aoBqZdRnALpVbP0tIZhb7yfXjVr/Xzp
         j1I5TeaoAghz39+pCKg+3kwRYNp5ji6UJg2au1o3TSn7WOxkVGG714HKdjma/5k1a4
         QjO1/BTGIm2W9p4/+QOylvYVGrJu/5+JZkM5VLKDWKeY/L8QTKR3p9dz/Y557uLtyZ
         f2VGUKQyeehLEDSpu7zZ0X5c797w2DyMOgs+FnpoKKO5uRH3wjoBugCihvtXplvwoO
         LY7k0cext/GOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.155.177]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72oB-1q58N3334p-008a6V; Wed, 17
 May 2023 22:44:34 +0200
Message-ID: <fcbba765-49e1-76f2-2ae7-4bc88970221e@gmx.de>
Date:   Wed, 17 May 2023 22:44:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC] more progress with radeon on C8000
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <ZGJ7bTYEBGtYMNiA@p100> <ZGPsMKZQCdu5+c59@p100>
 <e7cd632a-7f9d-bb55-8357-bef82f9b7249@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <e7cd632a-7f9d-bb55-8357-bef82f9b7249@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DzZ1KAwSTWqaeK5dG1YpBhEXm68OBq3EvjT+xR5LKSK6k5bZ3tj
 2fXN8SDbdlKfu4qgmGHUXRQdaDie6zSfhuvZL98omVOo59M53IJfDMzyRZIbCWJG7Hurta0
 r1+UPPAoXWX7cLF60TLV8xuxSAOvnbo4/IgkTPqVHl9WOIVe3kmtIIQU+CgIv2CrcbQHp+v
 gbmtNW2bk+d7sHQSaP2Qw==
UI-OutboundReport: notjunk:1;M01:P0:RWNiZK3jzZA=;fu5t7yP9swAgY4uT/EGMkK/kobc
 eAKUAM6cRJKVwIBZVL/Dm6/4HpQwFCDBspIcSZyvaYwgxvVpUhZriAXQ+TQaFGi2Zls06HwfS
 mE5updQNjHPMydg5n31Ety4wEJCf0j1/MTSDcjp+EL2ACzh0LNwCnqQGt7fMladnKmzGnUHM0
 WkErll9JY6KL/aDSyz7ucjkiHczpYHcbpbpxoMz1twznQJadVbeXXYnFmShIKWlC08yO/KY0X
 IuJesw4NOY7ajD1PemY33TGIzDdIwiXyDWSnof5MpRcZaI8OqgQ1cIvh+ztB8mnWRcp2yANoJ
 TGBAwRMlCFVAY7bw24iZLoRU5VBgKfqVlXD1+U4kEuMzkBnjEMYqRx4iOUbfE6AKIWCg9GeEI
 EnAvuYkd2qjYpKRWgyYtSdPpNYutvTvnWNJtmUtONIrp9bsJvZVXsAS14clIoHRSl3EFAbVy7
 hTXjAwDcGuAZkIPoXoXEorpfSc9tCznPii9piGHjk2zMxgrm6jUpL5PRrSPmBxTrlZLZVtqN0
 mURWf94fU0XremnNb0nYzHOcUqYkO2HmmwHt2Pm6UzeeizzLpUyH576OnNJZoTQW3ZulousBU
 YVhxNjB14Jv1cajRmtOuUMh3aq1/lvdC8WDoG/eMFW5EGMSA7gPzji/Xv4Snci/miGR0jK+TL
 yR99L7902579AloK4IS4yxpoH6UaTeUmW7XhJsGTO1BcHQ9QwJQS402jxzbhfs3l+inp4Ilei
 EE9owsSXNR02PSF2uW8Td5+mUWEzraRZmbjNKRxWWwtqrpfJixOhoLgjnjd9ZaptHPDjX180U
 GNs7yFpqJBB6ie5QyT5FQS9FKBncACOYV42YI6cws6g6WWrL4asnRUIpiFgrhoXF4mF8/El93
 SUCuBTwSMWO/kUjvKygzXuxrL0MOw/A/zoZi+frt458zRMolrHynqJoSlgKuO+syIYfkvq5Gt
 yVtoO93G+IW+5pQq0BoTwH5WDI4=
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/17/23 21:59, John David Anglin wrote:
> On 2023-05-16 4:48 p.m., Helge Deller wrote:
>> * Helge Deller<deller@gmx.de>:
>>> There have been various approaches to fix the radeon graphic cards
>>> on C8000 workstations, e.g. this is the last thread:
>>> https://marc.info/?l=3Dlinux-parisc&m=3D156971832128700&w=3D2
>>>
>>> With the patch below the radeon ring and ib tests don't fail any longe=
r.
>>> It uses (relatively) lightweight pdc/fdc instructions.
>>>
>>> The patch below
>>> - uses the pdc instruction (purge data cache) before reading back the
>>> =C2=A0=C2=A0 ring test result from memory.
>>> - modifies the parisc-agp code, based on Thomas patch
>>>
>>> The patch is not intended to by applied as-is.
>> attached is a cleaned up version of the patch.
> I tried this change on c8000 with kernel 6.3.3:
>
> [=C2=A0=C2=A0 89.531274] drm_kms_helper alternatives: applied 0 out of 2=
7 patches
> [=C2=A0=C2=A0 89.630885] ipmi_si alternatives: applied 0 out of 8 patche=
s
> [=C2=A0=C2=A0 89.731041] ipmi_si: IPMI System Interface driver
> [=C2=A0=C2=A0 89.821872] drm_display_helper alternatives: applied 0 out =
of 6 patches
> [=C2=A0=C2=A0 89.833885] ipmi_si: Adding device-tree-specified kcs state=
 machine
> [=C2=A0=C2=A0 89.971367] ipmi_si: Trying device-tree-specified kcs state=
 machine at mem address 0xfffffff0f05b0000, slave address 0x0, irq 0
> [=C2=A0=C2=A0 90.271358] ttm alternatives: applied 0 out of 13 patches
> [=C2=A0=C2=A0 90.421083] drm_ttm_helper alternatives: applied 0 out of 2=
 patches
> [=C2=A0=C2=A0 90.881506] radeon alternatives: applied 0 out of 4803 patc=
hes
> [=C2=A0=C2=A0 90.980838] [drm] radeon kernel modesetting enabled.
> [=C2=A0=C2=A0 91.041955] [drm] initializing kernel modesetting (RV350 0x=
1002:0x4154 0x1002:0x0002 0x80).
> [=C2=A0=C2=A0 91.140773] [drm] Forcing AGP to PCI mode
> [=C2=A0=C2=A0 91.290915] [drm] GPU not posted. posting now...
> [=C2=A0=C2=A0 91.551801] [drm] Generation 2 PCI interface, using max acc=
essible memory
> [=C2=A0=C2=A0 91.620801] radeon 0000:80:00.0: VRAM: 128M 0xFFFFFFFFC0000=
000 - 0xFFFFFFFFC7FFFFFF (128M used)
> [=C2=A0=C2=A0 91.671141] ipmi 16: IPMI message handler: Found new BMC (m=
an_id: 0x00000b, prod_id: 0x8201, dev_id: 0x32)
> [=C2=A0=C2=A0 91.710747] radeon 0000:80:00.0: GTT: 512M 0xFFFFFFFFA00000=
00 - 0xFFFFFFFFBFFFFFFF
> [=C2=A0=C2=A0 91.814064] ipmi 16: IPMI kcs interface initialized
> [=C2=A0=C2=A0 91.880842] [drm] Detected VRAM RAM=3D128M, BAR=3D128M
> [=C2=A0=C2=A0 91.970765] [drm] RAM width 128bits DDR
> [=C2=A0=C2=A0 91.971192] [drm] radeon: 128M of VRAM memory ready
> [=C2=A0=C2=A0 92.050830] [drm] radeon: 512M of GTT memory ready.
> [=C2=A0=C2=A0 92.110946] [drm] GART: num cpu pages 131072, num gpu pages=
 131072
> [=C2=A0=C2=A0 92.222903] [drm] radeon: 1 quad pipes, 1 Z pipes initializ=
ed
> [=C2=A0=C2=A0 92.290747] [drm] PCI GART of 512M enabled (table at 0x0000=
000047040000).
> [=C2=A0=C2=A0 92.370907] radeon 0000:80:00.0: WB enabled
> [=C2=A0=C2=A0 92.431273] radeon 0000:80:00.0: fence driver on ring 0 use=
 gpu addr 0xffffffffa0000000
> [=C2=A0=C2=A0 92.531273] [drm] radeon: irq initialized.
> [=C2=A0=C2=A0 92.560906] [drm] Loading R300 Microcode
> [=C2=A0=C2=A0 92.631141] radeon 0000:80:00.0: Direct firmware load for r=
adeon/R300_cp.bin failed with error -2
> [=C2=A0=C2=A0 92.743052] radeon_cp: Failed to load firmware "radeon/R300=
_cp.bin"
> [=C2=A0=C2=A0 92.819159] [drm:r100_cp_init [radeon]] *ERROR* Failed to l=
oad firmware!
> [=C2=A0=C2=A0 92.890738] radeon 0000:80:00.0: failed initializing CP (-2=
).
> [=C2=A0=C2=A0 92.960765] radeon 0000:80:00.0: Disabling GPU acceleration
> [=C2=A0=C2=A0 93.030744] [drm] radeon: cp finalized
> [=C2=A0=C2=A0 93.142149] [drm] Radeon Display Connectors
> [=C2=A0=C2=A0 93.170762] [drm] Connector 0:
> [=C2=A0=C2=A0 93.170771] [drm]=C2=A0=C2=A0 VGA-1
> [=C2=A0=C2=A0 93.170775] [drm]=C2=A0=C2=A0 DDC: 0x60 0x60 0x60 0x60 0x60=
 0x60 0x60 0x60
> [=C2=A0=C2=A0 93.170786] [drm]=C2=A0=C2=A0 Encoders:
> [=C2=A0=C2=A0 93.290760] [drm]=C2=A0=C2=A0=C2=A0=C2=A0 CRT1: INTERNAL_DA=
C1
> [=C2=A0=C2=A0 93.340770] [drm] Connector 1:
> [=C2=A0=C2=A0 93.380749] [drm]=C2=A0=C2=A0 DVI-I-1
> [=C2=A0=C2=A0 93.410745] [drm]=C2=A0=C2=A0 HPD1
> [=C2=A0=C2=A0 93.440846] [drm]=C2=A0=C2=A0 DDC: 0x64 0x64 0x64 0x64 0x64=
 0x64 0x64 0x64
> [=C2=A0=C2=A0 93.520737] [drm]=C2=A0=C2=A0 Encoders:
> [=C2=A0=C2=A0 93.559678] [drm]=C2=A0=C2=A0=C2=A0=C2=A0 CRT2: INTERNAL_DA=
C2
> [=C2=A0=C2=A0 93.590733] [drm]=C2=A0=C2=A0=C2=A0=C2=A0 DFP1: INTERNAL_TM=
DS1
> [=C2=A0=C2=A0 93.853779] [drm] fb mappable at 0xFFFFFFFFC0040000
> [=C2=A0=C2=A0 93.900758] [drm] vram apper at 0xFFFFFFFFC0000000
> [=C2=A0=C2=A0 93.940732] [drm] size 5242880
> [=C2=A0=C2=A0 93.960731] [drm] fb depth is 24
> [=C2=A0=C2=A0 93.981757] [drm]=C2=A0=C2=A0=C2=A0 pitch is 5120
> [=C2=A0=C2=A0 94.080657] Console: switching to colour frame buffer devic=
e 160x64
> [=C2=A0=C2=A0 94.290810] radeon 0000:80:00.0: [drm] fb0: radeondrmfb fra=
me buffer device
> [=C2=A0=C2=A0 94.420892] [drm] Initialized radeon 2.50.0 20080528 for 00=
00:80:00.0 on minor 0
>
> 80:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI=
] RV350 GL [FireGL T2] (rev 80) (prog-if 00 [VGA controller])
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: Advanced Micro De=
vices, Inc. [AMD/ATI] RV350 GL [FireGL T2]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O+ Mem+ BusMaster=
+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz+ UDF- Fas=
tB2B+ ParErr- DEVSEL=3Dmedium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INT=
x-
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 192 (2000ns min), C=
ache Line Size: 128 bytes
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interrupt: pin A routed to I=
RQ 75
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: Memory at ffffffff=
c0000000 (32-bit, prefetchable) [size=3D128M]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 1: I/O ports at 3c000=
 [size=3D256]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 2: Memory at ffffffff=
c8020000 (32-bit, non-prefetchable) [size=3D64K]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Expansion ROM at ffffffffc80=
00000 [disabled] [size=3D128K]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: <access denied=
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use: radeon
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel modules: radeon
>
> Firmware still fails to load

You need to install the debian firware package:
apt install firmware-linux-nonfree firmware-linux-free

> and acceleration is disabled.

Yes, if firware isn't loaded the acceleration will be disabled too.
But even with firmware loaded the ring tests will fail on AGP cards.


> Maybe this is also a cache flush issue?

Probably.
Interestingly the radeon driver doesn't use the parisc-agp driver,
but it's internal GART. Since it works with radeon-PCI cards,
maybe it's not useable on parisc and we would need the parisc-agp
driver.

> FB console looks okay.
>
> This is a significant advance =F0=9F=98=81

Not really :-(
The unaccelerated FB console comes up even without my patch.
The latest patch I sent also missed the hunk below.
With that ugly patch, my radeon *PCI* (not AGP) card seems to work.
Additionally it's unclear how to cope with user-mapped memory.

Helge

@@ -3689,6 +3690,16 @@ void r100_ring_ib_execute(struct radeon_device *rde=
v, struct radeon_ib *ib)
  {
  	struct radeon_ring *ring =3D &rdev->ring[RADEON_RING_TYPE_GFX_INDEX];

+	u32 *ptr;
+	int len;
+	ptr =3D ib->ptr;
+	len =3D ib->length_dw;
+	while (len >=3D 0) {
+		asm_io_fdc(ptr);
+		ptr++;
+		len--;
+	}
+
  	if (ring->rptr_save_reg) {
  		u32 next_rptr =3D ring->wptr + 2 + 3;
  		radeon_ring_write(ring, PACKET0(ring->rptr_save_reg, 0));


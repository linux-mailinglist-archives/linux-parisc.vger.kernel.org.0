Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC6F57072AA
	for <lists+linux-parisc@lfdr.de>; Wed, 17 May 2023 22:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjEQUAH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 17 May 2023 16:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjEQUAG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 May 2023 16:00:06 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF055B8E
        for <linux-parisc@vger.kernel.org>; Wed, 17 May 2023 13:00:03 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.181.186.176]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 645FE0CF005DA3DB
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeiuddgudegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceugffnnfdpqfgfvfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpeehfefgtdehvedthfegleehheektdfhkeffvdehgfetleejieevhedtveegheeltdenucffohhmrghinhepmhgrrhgtrdhinhhfohenucfkphepudegvddrudekuddrudekiedrudejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedugedvrddukedurddukeeirddujeeipdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvhgvnhhssehsthgrtghkfhhrrghmvgdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghn
        khgvnhdruggvpdgruhhthhgpuhhsvghrpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvth
X-CM-Envelope: MS4xfLJmPR3HMpPDAItnPEVbYJ4Lqx00OkMUEuiO9uyV9w4eOk21IyPAEh+xHG+d1NlKhT6ziPhtZA8crOUd/VwyHYfpSCCjK5C56ixUUhy0hkWWw0rl3YvG
 q1XuS+cl2QgYgWnwtClSygFeBT/jHcrIY5befm1gbbtI6IF5QkOgH59ucLenLEMW7B8Fkxcjx5uks1hEJkdRIZUbJH14fK9Clyr+oSB38wDAVYdYtgIN6FSn
 BrbUDaRICecuFcyAzdj0A05j1AUCWHKj61/IKMqDP18yaNsYsrkhbJvtvb8Ndyybpkw+bwbGl31XKOTUDpZqhekBzLhVEM0ftMhE08wi0y7gQjdQ6jJzxk2o
 sc0G7kvH
X-RazorGate-Vade-Verdict: clean 0
X-CM-Analysis: v=2.4 cv=Tf71CTch c=1 sm=1 tr=0 ts=6465323f
 a=4B+q39mD0Bm0IdZjDiNhQQ==:117 a=4B+q39mD0Bm0IdZjDiNhQQ==:17
 a=IkcTkHD0fZMA:10 a=gu6fZOg2AAAA:8 a=FBHGMhGWAAAA:8 a=fF_fgehDyeweL9kA8coA:9
 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=2RSlZUUhi9gRBrsHwhhZ:22
 a=9gvnlMMaQFpL9xblJ6ne:22
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.181.186.176) by cmx-mtlrgo002.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 645FE0CF005DA3DB; Wed, 17 May 2023 15:59:59 -0400
Message-ID: <e7cd632a-7f9d-bb55-8357-bef82f9b7249@bell.net>
Date:   Wed, 17 May 2023 15:59:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC] more progress with radeon on C8000
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <ZGJ7bTYEBGtYMNiA@p100> <ZGPsMKZQCdu5+c59@p100>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <ZGPsMKZQCdu5+c59@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-05-16 4:48 p.m., Helge Deller wrote:
> * Helge Deller<deller@gmx.de>:
>> There have been various approaches to fix the radeon graphic cards
>> on C8000 workstations, e.g. this is the last thread:
>> https://marc.info/?l=linux-parisc&m=156971832128700&w=2
>>
>> With the patch below the radeon ring and ib tests don't fail any longer.
>> It uses (relatively) lightweight pdc/fdc instructions.
>>
>> The patch below
>> - uses the pdc instruction (purge data cache) before reading back the
>>    ring test result from memory.
>> - modifies the parisc-agp code, based on Thomas patch
>>
>> The patch is not intended to by applied as-is.
> attached is a cleaned up version of the patch.
I tried this change on c8000 with kernel 6.3.3:

[   89.531274] drm_kms_helper alternatives: applied 0 out of 27 patches
[   89.630885] ipmi_si alternatives: applied 0 out of 8 patches
[   89.731041] ipmi_si: IPMI System Interface driver
[   89.821872] drm_display_helper alternatives: applied 0 out of 6 patches
[   89.833885] ipmi_si: Adding device-tree-specified kcs state machine
[   89.971367] ipmi_si: Trying device-tree-specified kcs state machine at mem address 0xfffffff0f05b0000, slave address 0x0, irq 0
[   90.271358] ttm alternatives: applied 0 out of 13 patches
[   90.421083] drm_ttm_helper alternatives: applied 0 out of 2 patches
[   90.881506] radeon alternatives: applied 0 out of 4803 patches
[   90.980838] [drm] radeon kernel modesetting enabled.
[   91.041955] [drm] initializing kernel modesetting (RV350 0x1002:0x4154 0x1002:0x0002 0x80).
[   91.140773] [drm] Forcing AGP to PCI mode
[   91.290915] [drm] GPU not posted. posting now...
[   91.551801] [drm] Generation 2 PCI interface, using max accessible memory
[   91.620801] radeon 0000:80:00.0: VRAM: 128M 0xFFFFFFFFC0000000 - 0xFFFFFFFFC7FFFFFF (128M used)
[   91.671141] ipmi 16: IPMI message handler: Found new BMC (man_id: 0x00000b, prod_id: 0x8201, dev_id: 0x32)
[   91.710747] radeon 0000:80:00.0: GTT: 512M 0xFFFFFFFFA0000000 - 0xFFFFFFFFBFFFFFFF
[   91.814064] ipmi 16: IPMI kcs interface initialized
[   91.880842] [drm] Detected VRAM RAM=128M, BAR=128M
[   91.970765] [drm] RAM width 128bits DDR
[   91.971192] [drm] radeon: 128M of VRAM memory ready
[   92.050830] [drm] radeon: 512M of GTT memory ready.
[   92.110946] [drm] GART: num cpu pages 131072, num gpu pages 131072
[   92.222903] [drm] radeon: 1 quad pipes, 1 Z pipes initialized
[   92.290747] [drm] PCI GART of 512M enabled (table at 0x0000000047040000).
[   92.370907] radeon 0000:80:00.0: WB enabled
[   92.431273] radeon 0000:80:00.0: fence driver on ring 0 use gpu addr 0xffffffffa0000000
[   92.531273] [drm] radeon: irq initialized.
[   92.560906] [drm] Loading R300 Microcode
[   92.631141] radeon 0000:80:00.0: Direct firmware load for radeon/R300_cp.bin failed with error -2
[   92.743052] radeon_cp: Failed to load firmware "radeon/R300_cp.bin"
[   92.819159] [drm:r100_cp_init [radeon]] *ERROR* Failed to load firmware!
[   92.890738] radeon 0000:80:00.0: failed initializing CP (-2).
[   92.960765] radeon 0000:80:00.0: Disabling GPU acceleration
[   93.030744] [drm] radeon: cp finalized
[   93.142149] [drm] Radeon Display Connectors
[   93.170762] [drm] Connector 0:
[   93.170771] [drm]   VGA-1
[   93.170775] [drm]   DDC: 0x60 0x60 0x60 0x60 0x60 0x60 0x60 0x60
[   93.170786] [drm]   Encoders:
[   93.290760] [drm]     CRT1: INTERNAL_DAC1
[   93.340770] [drm] Connector 1:
[   93.380749] [drm]   DVI-I-1
[   93.410745] [drm]   HPD1
[   93.440846] [drm]   DDC: 0x64 0x64 0x64 0x64 0x64 0x64 0x64 0x64
[   93.520737] [drm]   Encoders:
[   93.559678] [drm]     CRT2: INTERNAL_DAC2
[   93.590733] [drm]     DFP1: INTERNAL_TMDS1
[   93.853779] [drm] fb mappable at 0xFFFFFFFFC0040000
[   93.900758] [drm] vram apper at 0xFFFFFFFFC0000000
[   93.940732] [drm] size 5242880
[   93.960731] [drm] fb depth is 24
[   93.981757] [drm]    pitch is 5120
[   94.080657] Console: switching to colour frame buffer device 160x64
[   94.290810] radeon 0000:80:00.0: [drm] fb0: radeondrmfb frame buffer device
[   94.420892] [drm] Initialized radeon 2.50.0 20080528 for 0000:80:00.0 on minor 0

80:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] RV350 GL [FireGL T2] (rev 80) (prog-if 00 [VGA controller])
         Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RV350 GL [FireGL T2]
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
         Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 192 (2000ns min), Cache Line Size: 128 bytes
         Interrupt: pin A routed to IRQ 75
         Region 0: Memory at ffffffffc0000000 (32-bit, prefetchable) [size=128M]
         Region 1: I/O ports at 3c000 [size=256]
         Region 2: Memory at ffffffffc8020000 (32-bit, non-prefetchable) [size=64K]
         Expansion ROM at ffffffffc8000000 [disabled] [size=128K]
         Capabilities: <access denied>
         Kernel driver in use: radeon
         Kernel modules: radeon

Firmware still fails to load and acceleration is disabled.  Maybe this is also a cache flush issue?

FB console looks okay.

This is a significant advance 😁

Dave

-- 
John David Anglin  dave.anglin@bell.net


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84DD82952FC
	for <lists+linux-parisc@lfdr.de>; Wed, 21 Oct 2020 21:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504785AbgJUTck (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 21 Oct 2020 15:32:40 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:56872 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504781AbgJUTck (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 21 Oct 2020 15:32:40 -0400
X-Greylist: delayed 556 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Oct 2020 15:32:39 EDT
Subject: Re: Kernel 5.8 and 5.9 fail to boot on C8000
To:     Helge Deller <deller@gmx.de>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-parisc@vger.kernel.org
References: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <f6cd5c30-8fa7-2b66-9ead-3fb42afd6c0b@linux.ee>
Date:   Wed, 21 Oct 2020 22:23:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

20.10.20 16:45 Helge Deller wrote:
> Latest Linux kernels v5.8 and v5.9 fail to boot for me on the C8000
> machines with this error:
>   mptspi: probe of 0000:40:01.0 failed with error -12
>   mptbase: ioc1: ERROR - Insufficient memory to add adapter!
>   mptspi: probe of 0000:40:01.1 failed with error -12
> 
> The c8000 has a built-in Broadcom / LSI 53c1030 PCI-X Fusion-MPT Dual
> Ultra320 SCSI controller.
> 
> Do other people see this as well?

Works for me on a rp2470 with this card but no disks attached (gcc-10.2 from Gentoo, this test machine has usually been stable):

lspci:
00:00.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
00:01.0 SCSI storage controller: Broadcom / LSI 53C896/897 (rev 07)
00:01.1 SCSI storage controller: Broadcom / LSI 53C896/897 (rev 07)
00:02.0 SCSI storage controller: Broadcom / LSI 53c875 (rev 37)
00:02.1 SCSI storage controller: Broadcom / LSI 53c875 (rev 37)
00:04.0 System peripheral: Hewlett-Packard Company Diva [GSP] Management Board (rev 01)
00:04.1 Serial controller: Hewlett-Packard Company Diva Serial [GSP] Multiport UART (rev 03)
10:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Mach64 GT-B [3D Rage II+ DVD] (rev 9a)
20:00.0 SCSI storage controller: Broadcom / LSI 53c1010 66MHz  Ultra3 SCSI Adapter (rev 01)
20:00.1 SCSI storage controller: Broadcom / LSI 53c1010 66MHz  Ultra3 SCSI Adapter (rev 01)
30:00.0 SCSI storage controller: Adaptec AIC-7870P/7881U [AHA-2940U/UW/D/S76] (rev 01)
30:02.0 SCSI storage controller: Broadcom / LSI 53c1030 PCI-X Fusion-MPT Dual Ultra320 SCSI (rev 08)
30:02.1 SCSI storage controller: Broadcom / LSI 53c1030 PCI-X Fusion-MPT Dual Ultra320 SCSI (rev 08)

dmesg:
[    0.000000] Linux version 5.9.0 (mroos@rp2470) (hppa64-unknown-linux-gnu-gcc (Gentoo 10.2.0 p1) 10.2.0, GNU ld (Gentoo 2.33.1 p1) 2.33.1) #248 Mon Oct 12 19:01:45 EEST 2020
...
[    2.623778] pci 0000:30:02.0: [1000:0030] type 00 class 0x010000
[    2.625453] pci 0000:30:02.0: reg 0x10: [io  0x30000-0x300ff]
[    2.625712] pci 0000:30:02.0: reg 0x14: [mem 0x00000000-0x0001ffff 64bit]
[    2.627793] pci 0000:30:02.0: reg 0x1c: [mem 0x00000000-0x0001ffff 64bit]
[    2.630015] pci 0000:30:02.0: reg 0x30: [mem 0x00000000-0x000fffff pref]
[    2.630532] pci 0000:30:02.0: supports D1 D2
[    2.632633] pci 0000:30:02.1: [1000:0030] type 00 class 0x010000
[    2.632909] pci 0000:30:02.1: reg 0x10: [io  0x30000-0x300ff]
[    2.647585] pci 0000:30:02.1: reg 0x14: [mem 0x00000000-0x0001ffff 64bit]
[    2.650580] pci 0000:30:02.1: reg 0x1c: [mem 0x00000000-0x0001ffff 64bit]
[    2.650876] pci 0000:30:02.1: reg 0x30: [mem 0x00000000-0x000fffff pref]
[    2.655192] pci 0000:30:02.1: supports D1 D2
[    2.657716] pci 0000:30:02.0: can't claim BAR 0 [io  0x30000-0x300ff]: address conflict with 0000:30:00.0 [io  0x30000-0x300ff]
[    2.659477] pci 0000:30:02.1: can't claim BAR 0 [io  0x30000-0x300ff]: address conflict with 0000:30:00.0 [io  0x30000-0x300ff]
[    2.661856] pci 0000:30:02.0: BAR 6: assigned [mem 0xfffffffffb000000-0xfffffffffb0fffff pref]
[    2.664079] pci 0000:30:02.1: BAR 6: assigned [mem 0xfffffffffb100000-0xfffffffffb1fffff pref]
[    2.666330] pci 0000:30:02.0: BAR 1: assigned [mem 0xfffffffffb200000-0xfffffffffb21ffff 64bit]
[    2.674350] pci 0000:30:02.0: BAR 3: assigned [mem 0xfffffffffb220000-0xfffffffffb23ffff 64bit]
[    2.674679] pci 0000:30:02.1: BAR 1: assigned [mem 0xfffffffffb240000-0xfffffffffb25ffff 64bit]
[    2.676975] pci 0000:30:02.1: BAR 3: assigned [mem 0xfffffffffb260000-0xfffffffffb27ffff 64bit]
[    2.679263] pci 0000:30:00.0: BAR 6: assigned [mem 0xfffffffffb280000-0xfffffffffb28ffff pref]
[    2.681484] pci 0000:30:00.0: BAR 1: assigned [mem 0xfffffffffb290000-0xfffffffffb290fff]
[    2.683749] pci 0000:30:02.0: BAR 0: assigned [io  0x30100-0x301ff]
[    2.829064] pci 0000:30:02.1: BAR 0: assigned [io  0x30200-0x302ff]
...
[   59.788086] Fusion MPT SPI Host driver 3.04.20
[   59.788436] mptspi 0000:30:02.0: enabling device (0000 -> 0002)
[   59.912240] mptspi 0000:30:02.0: enabling SERR and PARITY (0002 -> 0142)
[   61.848400] scsi host7: ioc0: LSI53C1030 C0, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=26
[   62.541761] mptspi 0000:30:02.1: enabling device (0000 -> 0002)
[   62.542024] mptspi 0000:30:02.1: enabling SERR and PARITY (0002 -> 0142)
[   62.548157] mptbase: ioc1: Initiating bringup
[   63.272365] ioc1: LSI53C1030 C0: Capabilities={Initiator,Target}
[   64.020620] scsi host8: ioc1: LSI53C1030 C0, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=27

-- 
Meelis Roos <mroos@linux.ee>

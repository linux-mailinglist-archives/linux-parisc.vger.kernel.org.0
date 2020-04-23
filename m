Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E821B6619
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Apr 2020 23:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgDWVVG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 Apr 2020 17:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgDWVVF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 Apr 2020 17:21:05 -0400
X-Greylist: delayed 1057 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Apr 2020 14:21:05 PDT
Received: from wp441.webpack.hosteurope.de (wp441.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:85d2::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79810C09B042
        for <linux-parisc@vger.kernel.org>; Thu, 23 Apr 2020 14:21:05 -0700 (PDT)
Received: from [2a02:2028:62b:4200:21c:c4ff:fe1f:fd93] (helo=valdese.nms.ulrich-teichert.org); authenticated
        by wp441.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1jRj0H-0006Wv-7W; Thu, 23 Apr 2020 23:03:25 +0200
Received: from valdese.nms.ulrich-teichert.org (localhost [127.0.0.1])
        by valdese.nms.ulrich-teichert.org (8.15.2/8.15.2/Debian-8) with ESMTPS id 03NL3Ojh008745
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-parisc@vger.kernel.org>; Thu, 23 Apr 2020 23:03:24 +0200
Received: (from ut@localhost)
        by valdese.nms.ulrich-teichert.org (8.15.2/8.15.2/Submit) id 03NL3OBS008743
        for linux-parisc@vger.kernel.org; Thu, 23 Apr 2020 23:03:24 +0200
Message-Id: <202004232103.03NL3OBS008743@valdese.nms.ulrich-teichert.org>
Subject: STI init_graph failed on J6700
To:     linux-parisc@vger.kernel.org (PA-RISC Linux Mailinglist)
Date:   Thu, 23 Apr 2020 23:03:24 +0200 (CEST)
From:   Ulrich Teichert <krypton@ulrich-teichert.org>
X-Mailer: ELM [version 2.5 PL8]
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;ut@ulrich-teichert.org;1587676865;792e91ef;
X-HE-SMSGID: 1jRj0H-0006Wv-7W
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

I've recently acquired a J6700 (8 GB, 2 CPUs) and I'm happly running Linux
on it, so thanks to all who are still caring about HPPA :-)

I've noticed a kernel warning on bootup, though:
...
[    8.789817] PDC Stable Storage facility v0.30
[    9.167048] STI GSC/PCI core graphics driver Version 0.9b
[    9.219224] STI PCI graphic ROM found at fffffffff5000000 (2048 kB), fb at fffffffffa000000 (32 MB)
[    9.387078] STI ROM supports 32 and 64 bit firmware functions.
[    9.447064] STI selected 8x16 framebuffer font VGA8x16 for sticon
[    9.507118]     id 35acda30-9a02587, conforms to spec rev. 8.0d
[    9.571080] ------------[ cut here ]------------
[    9.611040] Out of 32bit-range pointers!
[    9.611152] WARNING: CPU: 1 PID: 1 at drivers/video/console/sticore.c:1106 sti_call+0xcc/0xd8
[    9.743055] Modules linked in:
[    9.767055] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc2 #1
[    9.831044] Hardware name: 9000/785/J6700

[    9.867078]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[    9.911044] PSW: 00001000000001001111111100001110 Not tainted
[    9.971061] r00-03  000000ff0804ff0e 0000000040a58720 000000004066e86c 000000113fcb4cd0
[   10.059075] r04-07  0000000040a37f20 000000113fd66d00 000000113fda1000 000000113fda1000
[   10.147058] r08-11  0000000040c372c8 000000000800000f 0000000040c8ca08 0000000040a93f20
[   10.235047] r12-15  000000113fcb4ca0 0000000000000030 0000000000000014 000000113fd66dc0
[   10.323075] r16-19  000000113fda1010 000000113fd66d68 0000000040a93f20 0000000001c3c000
[   10.411047] r20-23  000000000800000e 0000000000000000 00000000002aaaab 0000000040d5490c
[   10.499057] r24-27  0000000000000000 0000000040d54524 0000000040d5490c 0000000040a37f20
[   10.587075] r28-31  000000000000001c 000000113fcb5050 000000113fcb4d60 0000000000000000
[   10.675058] sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   10.767047] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

[   10.859043] IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004066e86c 000000004066e870
[   10.951045]  IIR: 03ffe01f    ISR: 0000000010240000  IOR: 000000076cdb3298
[   11.023058]  CPU:        1   CR30: 000000113fcb4000 CR31: 0000000011111111
[   11.095043]  ORIG_R28: 0000000040a93f20
[   11.131060]  IAOQ[0]: sti_call+0xcc/0xd8
[   11.163076]  IAOQ[1]: sti_call+0xd0/0xd8
[   11.199065]  RP(r2): sti_call+0xcc/0xd8
[   11.231055] Backtrace:
[   11.247058]  [<00000000406702b4>] sti_try_rom_generic+0x504/0x740
[   11.307076]  [<000000004066f16c>] sticore_pci_init+0x13c/0x260
[   11.367064]  [<000000004064603c>] pci_device_probe+0x16c/0x280
[   11.427076]  [<00000000406d5f20>] really_probe+0x1b0/0x618
[   11.483061]  [<00000000406d66ec>] driver_probe_device+0x154/0x168
[   11.547074]  [<00000000406d6ab0>] device_driver_attach+0xc8/0xd8
[   11.607058]  [<00000000406d6b78>] __driver_attach+0xb8/0x1e8
[   11.667074]  [<00000000406d2150>] bus_for_each_dev+0xd8/0x140
[   11.723059]  [<00000000406d5340>] driver_attach+0x48/0x60
[   11.779048]  [<00000000406d471c>] bus_add_driver+0x31c/0x428
[   11.835065]  [<00000000406d7910>] driver_register+0xb0/0x238
[   11.891049]  [<00000000406451fc>] __pci_register_driver+0x74/0x88
[   11.955065]  [<000000004066e76c>] sti_get_rom+0x14c/0x180
[   12.007052]  [<00000000401310fc>] sticonsole_init+0x54/0x150
[   12.067067]  [<000000004017e258>] do_one_initcall+0xf0/0x2d0
[   12.123065]  [<0000000040102c8c>] kernel_init_freeable+0x3d4/0x4e8
[   12.187065]  [<00000000409a7220>] kernel_init+0x30/0x2e0
[   12.239054]  [<0000000040189020>] ret_from_kernel_thread+0x20/0x28

[   12.307052] ---[ end trace db6f7bccbf9663af ]---
[   12.351047] STI init_graph failed (ret -1, errno 0)
[   12.399046] Unable to handle STI device '0000:01:01.0'
...

Kernel 5.7-rc2 (but happens too with 5.4.28), serial console, gcc 9.2.0,
SMP, 64 bit kernel. System.map and .config available on request.
The installed graphic card is (according to lspci):

01:01.0 Display controller: Hewlett-Packard Company Visualize FX (rev 02)

As I'm using the serial console, I have not noticed any ill effects,
despite the warning. My theory is that the card gets mapped into
a 64bit-only accessible range and that the STI driver can not manage
that type of addressing? Can it handle that card anyway?

TIA,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               | Syndrome 81: Le Condor De La Rade, The Briefs:
24539 Neumuenster, Germany| She's The Rat, The Bellrays: Bad Reaction

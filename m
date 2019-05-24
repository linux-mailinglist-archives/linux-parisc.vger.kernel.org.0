Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB6A729164
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 08:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388460AbfEXG6y (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 02:58:54 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:58300 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388260AbfEXG6x (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 02:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Type:MIME-Version:Message-ID:Subject:To:
        From:Date; bh=JPKqi856DM4d2nOjxAmOpv77JKHT/8h242iTTFnL5h0=; b=VhHBTI4mvjpxJ6v
        dWDlaG+0/EpgMRE2kd8bqhMqs0M49jRLtOThuoEp6gPPY+onuXUXgDhLUlDvMBgPGu6Muhr5IBs7z
        es1+n0SFjJe7wJvBN0FvFKIDS9D5JQ5cOQBW9ZbbbzBDxwblk57M1BU5brKzCZle46QgfdozRjhjt
        rA=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hU4AF-0003AV-I4
        for linux-parisc@vger.kernel.org; Fri, 24 May 2019 08:58:51 +0200
Date:   Fri, 24 May 2019 08:58:50 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: PCI HPMC on C240 with alternatives Patching
Message-ID: <20190524065850.GA9849@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi List,

i recently got my hands on an old C240. I see a Kernel oops pretty early when
alternatives patching is enabled:

[   40.810794] sym53c8xx 0000:00:13.0: enabling device (0150 -> 0153)
[   40.894350] sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 22
[   41.047461] sym0: No NVRAM, ID 7, Fast-20, SE, parity checking


[   50.337981] Backtrace:
[   50.366087]  [<105b61bc>] sym_hcb_attach+0x668/0x840
[   50.425150]  [<105af6c4>] sym_attach.constprop.0+0x188/0x378
[   50.492476]  [<105ae518>] sym2_probe+0x40c/0x4c4
[   50.547424]  [<104e52e4>] pci_device_probe+0xb0/0x150
[   50.607543]  [<1056cab0>] really_probe+0x2ac/0x3f8
[   50.664530]  [<1056d2f4>] driver_probe_device+0x51c/0x534
[   50.728743]  [<1056d614>] device_driver_attach+0x54/0x98
[   50.791921]  [<1056d7a0>] __driver_attach+0x148/0x160
[   50.852010]  [<1056a2dc>] bus_for_each_dev+0x7c/0xbc
[   50.911067]  [<1056c100>] driver_attach+0x2c/0x4c
[   50.967022]  [<1056b95c>] bus_add_driver+0x1b4/0x210
[   51.026071]  [<1056dfb8>] driver_register+0xdc/0x12c
[   51.085129]  [<104e4894>] __pci_register_driver+0x4c/0x6c
[   51.149385]  [<10137d4c>] sym2_init+0xc0/0x134
[   51.202244]  [<1018b81c>] do_one_initcall+0x84/0x1c0
[   51.261301]  [<1010158c>] kernel_init_freeable+0x2b8/0x2d0
[   51.326580]  [<107e6040>] kernel_init+0x20/0x140
[   51.381523]  [<1019301c>] ret_from_kernel_thread+0x1c/0x24
[   51.464420]
[   51.482098] High Priority Machine Check (HPMC): Code=1 (High-priority machine check (HPMC)) at addr 00000000
[   51.599065] CPU: 0 PID: 1 Comm: swapper Not tainted 5.2.0-rc1-32bit+ #83
[   51.678775] Hardware name: 9000/782/C240+
[   51.726427]
[   51.744090]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[   51.800018] PSW: 00000000000001001111111100001111 Not tainted
[   51.868370] r00-03  0004ff0f 109f07c4 105b61bc 2fcc09c0
[   51.930512] r04-07  2f44a000 108ced74 0098967f 00000008
[   51.992659] r08-11  00988000 01000000 00000002 2f44a3d4
[   52.054804] r12-15  10a57fc4 109e5800 000000fd f0100000
[   52.116948] r16-19  f000168c f000020c f0000204 0001602c
[   52.179094] r20-23  2f44a000 0000000f 2fc19870 2f44a920
[   52.241238] r24-27  00000040 0001602c 00016014 108fc7c4
[   52.303381] r28-31  0000001f 00000000 2fcc0a00 00000000
[   52.365519] sr00-03  00000000 00000000 00000000 00000000
[   52.428693] sr04-07  00000000 00000000 00000000 00000000
[   52.491854]
[   52.509524] IASQ: 00000000 00000000 IAOQ: 104d5708 104d570c
[   52.575798]  IIR: 48623fd9    ISR: 0024007f  IOR: 300c09ac
[   52.641036]  CPU:        0   CR30: 2fcc0000 CR31: ffff1558
[   52.706270]  ORIG_R28: 00000000
[   52.743614]  IAOQ[0]: ioread8+0x34/0x5c
[   52.789215]  IAOQ[1]: ioread8+0x38/0x5c
[   52.834821]  RP(r2): sym_hcb_attach+0x668/0x840
[   52.888676] Backtrace:
[   52.916709]  [<105b61bc>] sym_hcb_attach+0x668/0x840
[   52.975765]  [<105af6c4>] sym_attach.constprop.0+0x188/0x378
[   53.043088]  [<105ae518>] sym2_probe+0x40c/0x4c4
[   53.098009]  [<104e52e4>] pci_device_probe+0xb0/0x150
[   53.158101]  [<1056cab0>] really_probe+0x2ac/0x3f8
[   53.215080]  [<1056d2f4>] driver_probe_device+0x51c/0x534
[   53.279292]  [<1056d614>] device_driver_attach+0x54/0x98
[   53.342472]  [<1056d7a0>] __driver_attach+0x148/0x160
[   53.402557]  [<1056a2dc>] bus_for_each_dev+0x7c/0xbc
[   53.461616]  [<1056c100>] driver_attach+0x2c/0x4c
[   53.517569]  [<1056b95c>] bus_add_driver+0x1b4/0x210
[   53.576612]  [<1056dfb8>] driver_register+0xdc/0x12c
[   53.635669]  [<104e4894>] __pci_register_driver+0x4c/0x6c
[   53.699896]  [<10137d4c>] sym2_init+0xc0/0x134
[   53.752740]  [<1018b81c>] do_one_initcall+0x84/0x1c0
[   53.811785]  [<1010158c>] kernel_init_freeable+0x2b8/0x2d0
[   53.877046]  [<107e6040>] kernel_init+0x20/0x140
[   53.931969]  [<1019301c>] ret_from_kernel_thread+0x1c/0x24
[   53.997196]
[   54.016034] Kernel panic - not syncing: High Priority Machine Check (HPMC)
[   54.111012] Rebooting in 10 seconds..

The full dmesg can be found at https://stackframe.org/crashlog.txt

This also happens sometimes with the tulip driver, so it's likely not related to
sym53c8xx itself. The crash location in source is:

0x1059e394 is in sym_hcb_attach (/home/svens/parisc-linux/src/drivers/scsi/sym53c8xx_2/sym_hipd.c:1038).
1029		/*
1030		*  Start script (exchange values)
1031		*/
1032		OUTL(np, nc_dsa, np->hcb_ba);
1033		OUTL_DSP(np, pc);
1034		/*
1035		 *  Wait 'til done (with timeout)
1036		 */
1037		for (i=0; i<SYM_SNOOP_TIMEOUT; i++)
1038			if (INB(np, nc_istat) & (INTF|SIP|DIP))  <-- crash
1039				break;
1040		if (i>=SYM_SNOOP_TIMEOUT) {
1041			printf ("CACHE TEST FAILED: timeout.\n");
1042			return (0x20);

My (wild) guess is that we're patching away some memory barrier or cache flush
so the SCRIPTS engine in the SCSI controller starts executing garbage and triggers
a PCI bus read/write to an invalid address. The reason the INB() is given as the
HPMC location is likely caused by the delay between writing DSPS and the chip actually
starting to fetch insn/data.

Does that ring any bell for someone on the list? Otherwise i can check the
alternatives patching over the weekend, i think there are not that many locations.

The good thing is it's reproducible - it always crashes. Either in SCSI or in
Tulip.

Regards
Sven

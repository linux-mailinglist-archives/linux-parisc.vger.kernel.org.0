Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9333CC1241
	for <lists+linux-parisc@lfdr.de>; Sat, 28 Sep 2019 23:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbfI1Vok (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 28 Sep 2019 17:44:40 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:33546 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbfI1Vok (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 28 Sep 2019 17:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:
        To:From:Date; bh=9rJ231OWdSYPaienHzuTnmy3cd0BFQDwTdQFXqxUAfE=; b=W6ihYnoviT+8
        GJUG8VIEJmjObd0WREX6V5OWms90E7LIV5GQgvarIQhD/JbmVs5B5noJDP2hIhmbx547ZLtkISzep
        WkSAZDjiPacQo6WOv0HCFj6mYmOiwfmdEBUdba5ra8HtVIXPsSKjscZTyMegTEZ2OgVLnkcwzOX2O
        ceT5w=;
Received: from [2001:470:70c5:1111:5054:ff:febf:83e1] (helo=stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1iEKW6-00043Q-9x; Sat, 28 Sep 2019 23:44:38 +0200
Date:   Sat, 28 Sep 2019 23:44:36 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc@vger.kernel.org
Cc:     deller@gmx.de
Subject: some progress with radeon on C8000
Message-ID: <20190928214436.GC18685@stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi List,

i've spent quite some time this evening debugging why the Fire GL
doesn't work in my C8000. As reading debug output didn't give me
much insights, i decided to throw some Hardware at the Problem and
connect a Logic Analyzer to the C8000. For that i switched to an old
PCI Radeon 7000 which shows the same ring test failure.

I captured a few traces:

First, from the card in a x86 PC where it's working:

https://stackframe.org/radeon.png

We can clearly see the radeon fetches the Ring descriptor via
DMA here. Note the DEADBEEF in the trace which is the value
written to the scratch register during the ring test.

On C8000, we can see reading the DMA descriptor fails, radeon
reads all zero:

https://stackframe.org/c8000_radeon.png

I had already a flush_cache_all() for testing in WREG32(), but it looks
like this wasn't enough. Adding one to radeon_ring_write() makes the
radeon happy:

https://stackframe.org/c8000_fixed.png

My assumption was that the zx1 chipset takes care about cache coherency,
but it looks like that's not happening. Does that problem ring any
bells for someone? Otherwise i'll continue investigating tomorrow.
(Almost midnight here)

dmesg looks better now, althought i don't consider adding
flush_cache_all() as a fix ;-)

[   21.186924] Linux agpgart interface v0.103
[   21.236890] quicksilver: IO PDIR shared with sba_iommu
[   21.343142]  (null): AGP aperture is 512M @ 0x60000000
[   21.397054] [drm] radeon kernel modesetting enabled.
[   21.457024] radeon 0000:60:04.0: remove_conflicting_pci_framebuffers: bar 0: 0xffffffffb0000000 -> 0xffffffffb7ffffff
[   21.586863] radeon 0000:60:04.0: remove_conflicting_pci_framebuffers: bar 2: 0xffffffffb80c0000 -> 0xffffffffb80cffff
[   21.719672] [drm] initializing kernel modesetting (RV100
0x1002:0x5159 0x1014:0x029A 0x00).
[   21.856909] __ioremap: ffffffffb80c0000 -> 0000000000050000
[   21.966904] __ioremap: ffffffffb0000000 -> 0000000010240000
[   22.066905] __ioremap: ffffffffb8080000 -> 00000000040a0000
[   22.136898] radeon 0000:60:04.0: Invalid PCI ROM header signature: expecting 0xaa55, got 0x0000
[   22.276907] __ioremap: ffffffffb8080000 -> 0000000008120000
[   22.439336] radeon 0000:60:04.0: VRAM: 128M 0xFFFFFFFFB0000000 - 0xFFFFFFFFB7FFFFFF (8M used)
[   22.536865] radeon 0000:60:04.0: GTT: 512M 0xFFFFFFFF90000000 - 0xFFFFFFFFAFFFFFFF
[   22.626946] [drm] Detected VRAM RAM=128M, BAR=128M
[   22.686876] [drm] RAM width 32bits DDR
[   22.736874] [TTM] Zone  kernel: Available graphics memory: 2046222
KiB
[   22.806868] [TTM] Initializing pool allocator
[   22.866971] [drm] radeon: 8M of VRAM memory ready
[   22.916877] [drm] radeon: 512M of GTT memory ready.
[   22.976922] [drm] GART: num cpu pages 131072, num gpu pages 131072
[   23.161879] [drm] PCI GART of 512M enabled (table at 0x00000000400C0000).
[   23.236987] kmap: 000000413ee4f000
[   23.276887] radeon 0000:60:04.0: WB disabled
[   23.336865] radeon 0000:60:04.0: fence driver on ring 0 use gpu addr 0xffffffff90000000 and cpu addr 0x000000413ee4f000
[   23.466867] [drm] Supports vblank timestamp caching Rev 2
(21.10.2013).
[   23.536871] [drm] Driver supports precise vblank timestamp query.
[   23.616942] [drm] radeon: irq initialized.
[   23.666932] [drm] Loading R100 Microcode
[   23.756861] [drm] radeon: ring at 0xFFFFFFFF90001000
(debug dropped)
[   27.206908] [drm] ring test succeeded in 0 usecs
(debug dropped)
[   30.696921] [drm] ib test succeeded in 0 usecs
[   30.754178] [drm] No TV DAC info found in BIOS
[   30.806921] [drm] Radeon Display Connectors
[   30.856862] [drm] Connector 0:
[   30.886880] [drm]   VGA-1
[   30.916861] [drm]   DDC: 0x60 0x60 0x60 0x60 0x60 0x60 0x60 0x60
[   30.996861] [drm]   Encoders:
[   31.026877] [drm]     CRT1: INTERNAL_DAC1
[   31.076861] [drm] Connector 1:
[   31.116866] [drm]   DVI-I-1
[   31.146877] [drm]   HPD2
[   31.176860] [drm]   DDC: 0x6c 0x6c 0x6c 0x6c 0x6c 0x6c 0x6c 0x6c
[   31.246877] [drm]   Encoders:
[   31.286865] [drm]     CRT2: INTERNAL_DAC2
[   31.336860] [drm]     DFP1: INTERNAL_TMDS1
[   31.476904] __ioremap: ffffffffb0040000 -> 0000000010700000
[   31.580409] [drm] fb mappable at 0xFFFFFFFFB0040000
[   31.636856] [drm] vram apper at 0xFFFFFFFFB0000000
[   31.696854] [drm] size 786432
[   31.726855] [drm] fb depth is 8
[   31.766854] [drm]    pitch is 1024
[   32.006860] Console: switching to colour frame buffer device 128x48
[   32.119230] radeon 0000:60:04.0: fb0: radeondrmfb frame buffer device
[   32.197017] [drm] Initialized radeon 2.50.0 20080528 for 0000:60:04.0
on minor 0

Regards
Sven

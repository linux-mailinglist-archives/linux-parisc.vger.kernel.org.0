Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A244D273785
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Sep 2020 02:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729036AbgIVAeA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 21 Sep 2020 20:34:00 -0400
Received: from box.techtravels.org ([162.243.220.157]:57919 "EHLO
        box.techtravels.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbgIVAeA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Sep 2020 20:34:00 -0400
X-Greylist: delayed 322 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 20:34:00 EDT
Received: from authenticated-user (box.techtravels.org [162.243.220.157])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by box.techtravels.org (Postfix) with ESMTPSA id 112773F1EC;
        Mon, 21 Sep 2020 20:28:38 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=techtravels.org;
        s=mail; t=1600734518;
        bh=okl0A75V/smSSx5YlYH5P/+kitTdpYu9u9Yj4ojJQqs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=n1l4XG3GL4AxviSWgBVtVUmTdy2Pwn+H4MlR/jIOlZD4pHpvsV9YbEfsYpLo1GCGm
         znAv/VJF02scuVULFEvyPR/XQFG4acZ0Mx7U89739Jn+wfa0oLFGFN5U89jOWQ2FRJ
         ApxurOg0Es+77Ggnqr4u1vkP/18RhGGZmSPysU4jA4Bxye4Q1E9hwg18hYwvDj/Ohl
         T1I8ilXia6WlNvawFztoPFQ5+EIHd3b9mmkuEJ35H1F1ma5LnyYALpYvYPf09O2p5V
         BCizHz6IdvMQkdwQ45oy1ITsx4rO5plr01kmufhwPeEtTzsaVPEMOo6eaZjCr/L89/
         f2lOYamcxHTew==
Subject: Re: HPPA support for IGNITE-UX install discs
To:     Helge Deller <deller@gmx.de>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Sven Schnelle <svens@stackframe.org>
Cc:     qemu-discuss@nongnu.org, Richard Henderson <rth@twiddle.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <fad1bbcf-51c4-f381-87cf-23d5f9787df3@techtravels.org>
 <69e13e3a-f236-871c-0491-bb8d53c74a18@amsat.org>
 <d84eea18-3bd6-bda9-3e63-749a96e1ed94@gmx.de>
From:   Keith Monahan <keith@techtravels.org>
Message-ID: <daaf28c5-c0d6-87bd-3b60-2687913e7a12@techtravels.org>
Date:   Mon, 21 Sep 2020 20:28:38 -0400
MIME-Version: 1.0
In-Reply-To: <d84eea18-3bd6-bda9-3e63-749a96e1ed94@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Helge,

Thanks for looking a this!

Responses in-line


On 9/21/2020 10:46 AM, Helge Deller wrote:

 > The 9000/779 seems to be like an RDI PrecisionBook:
 > https://www.openpa.net/systems/rdi_precisionbook.html
 > which is quite similiar to a B160L.
 >
 > There is even an entry for your logic analyzer:
 > https://www.openpa.net/systems/hp_16600_16700_logic_agilent.html

I haven't heard of those precisionbooks! Portable HP-UX. Pretty cool!

My conversations with Paul W over there at the beginning of the year led 
to the creation of that page. He did all the hard work, I provided a 
minor correction here or there.

 > In qemu the B160L emulation isn't complete yet.
 > The SCSI disc is emulated by a "virtual built-in" PCI SCSI card, while
 > the original B160L has a NCR 53C710 SCSI chip internal in the LASI 
controller.
 > Additionally the LASI emulation isn't complete either.

Thanks for this.

I have another project I'm working on that is semi-related. The 
NCR53C710 megacell as implemented in LASI is limited to 5MB/s. This 
logic analyzer has no (physical) PCI slots, but has TE/AMP connectors 
that are electrically PCI. I'm attempting to make a small adapter that 
will convert that AMP to a standard 32-bit white PCI slot. The first 
thing I'd like to do is try a 53C875E card.....to increase disk speeds.

There's a card that sits on that same bus which is wired directly to a 
chip's PCI interface.....so I'm pretty sure this is the case.

I'm also pretty sure it's DINO that's bridging the processor/GSC bus to 
PCI and exposing it on these connectors.

I've created a breakout board that takes the TE/AMP connector and 
provides 20-pin connectors for a termination adapter to attach, which 
then goes to a(nother) logic analyzer.

 > My assumption is, that your Install CD for the analyzer will only detect
 > real LASI/53C710 chips and ignore the virtual PCI card. That's why it 
doesn't
 > detect any discs.

Right. I wonder if it's simply the matter of drivers. Do you know if 
this scan is actually "ioscan -C disk" ?

Here's the ioscan from the actual hardware

no_hostname:/> ioscan
H/W Path    Class                   Description
===============================================
             bc
8           bc                      Pseudo Bus Converter
8/0             ba                  PCI Bus Bridge
8/0/15.0              instrument    PCI(103c1650)
8/16            ba                  Core I/O Adapter
8/16/0             ext_bus          Built-in Parallel Interface
8/16/1             audio            Built-in Audio
8/16/4             tty              Built-in RS-232C
8/16/5             ext_bus          Built-in SCSI
8/16/5.0              target
8/16/5.0.0               disk        codesrc         SCSI2SD
8/16/5.6              target
8/16/5.6.0               disk        codesrc         SCSI2SD
8/16/5.7              target
8/16/5.7.0               ctl        Initiator
8/16/6             lan              Built-in LAN
8/16/7             ps2              Built-in Keyboard/Mouse
8/16/10            pc               Built-in Floppy Drive
8/16/10.1             floppy        HP_PC_FDC_FLOPPY
8/24            graphics            Graphics
8/27            unknown
62          processor               Processor
63          memory                  Memory


 >>>         * Scanning system for IO devices...
 >>> NOTE:    There were no disk devices found during the scan.  Make sure
 >>> that the
 >>>           destination disks are connected and powered on.  You may 
choose to
 >>>           scan for more disk drives from next menu on the console.
 >>> WARNING: Could not verify access to LAN interface: 8/0/1/0
 >>> ERROR:   could not find source device 8/0/0/0 in ioscan output
 >
 > That's strange.... I think 8/... might be LASI.
 >
 > Maybe it's possible to install HP-UX from another install CD and
 > install the Analyzer packages afterwards?
 >
 > Helge
 >

Well it likely is. What I'm trying to do, however, have a sandbox that 
very closely matches the LA that I can play around with, reset, break, 
try again, and so on. There's other ways of accomplishing this, but most 
involve physical hardware, re-burning SD cards, time, presence, and so on.

For my purposes, I don't know how much the LA's HP-UX installation 
matches a standard one. And having the LA software might be nice as well.

For what it's worth, and I'm guessing you guys also have the bug --- 
there's just something about taking a 25-year old CD, popping it in 
software on a modern computer, and duplicating the experience. The mix 
of old and new just does it for me! Hard to explain, but it's just so cool!

Thanks
Keith

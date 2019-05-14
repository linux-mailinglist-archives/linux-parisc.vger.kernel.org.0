Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 036F71C8AF
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2019 14:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfENM3j (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 14 May 2019 08:29:39 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:41209 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfENM3j (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 14 May 2019 08:29:39 -0400
Received: by mail-yw1-f65.google.com with SMTP id o65so13805358ywd.8
        for <linux-parisc@vger.kernel.org>; Tue, 14 May 2019 05:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eud1uKWmnCZig3xj+dAh6c25TuIoqTT9tFQPE6ufz/c=;
        b=m95wOM+bfco0umy8E/uUif5NBw45qWdmQ0ib/RWsVUA+nbuyvsmG8RhumOd5oWBY1o
         mtcBMQwyOB6xt7RuXgVuU45nIHo02og1NyXHfBro0dQC7jmU2Usys8ExvoQb02UdNkQ/
         JbgoXEwUicpBUaGa8j+b5GQ65JIw5rPJ1+zp5hXY76m5Zn78y0AhdbX66BzqbGQ7LwXd
         dDUCenkcPc5Blq7q+yMRZWkVD3tT9AQoYhACeoiXdTGcTUMJ9NuHbef9OcQhdprvPX4s
         KU0NVO1UC6JOrkFUUpLxvO/r0ySuv/D4bLsA9x7G79o9npU2RvlMUn7iPhxJFOtUzCuI
         RpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eud1uKWmnCZig3xj+dAh6c25TuIoqTT9tFQPE6ufz/c=;
        b=NXCk3zQcWOANdFswtjbbncLBj6dJyZXuSKe/y14WF/I37RqmIeuUsh+jdX4MpLFGHa
         bwLTcXaBc9/iMXaFuncncmikwkIf2NQdGrXJ7VWEDNmWpXRXUg22VtwJwOAQvYEmtUPm
         ZEHO4HZs8wI6U5WAM2cTtbtR63tmfS5pgKGAKri8EcByvG1ZGkOe+wsvcatnXWYfIx1+
         fwZYRlVDCMfHzOxgtESM/Bkq7ivC537ZFQ+cVL6NGZMv4WiZL4ni8JZvC9Odl2x8LD2X
         bJOpIB1itjnuFJe7x/hBfD+zR0/RCNWSotumTJUuHj6Dr+pcj4JTCbYqz0bZKuzq69N4
         v2aA==
X-Gm-Message-State: APjAAAXm3GcSuvYrJb0biEwxls4LPkRQiEk+APlhJTEpqqVkiCS65vVL
        9srxZyI2JW5rdO/HOMRpPnlSwDNruxzy3/rHRqWprEUf
X-Google-Smtp-Source: APXvYqxmSxhc00thJ6Dek/D2Xu/2XT7NSxflV/vYKbUjqFWv+Fc5hyw3n86rZyCrIoZkO1A1z+jlpIn88DG+5nesFpc=
X-Received: by 2002:a25:2706:: with SMTP id n6mr16424204ybn.181.1557836978679;
 Tue, 14 May 2019 05:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net> <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net> <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
 <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
 <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net> <CA+QBN9CgMRFmv+isvH-Y=FCCFwKhmD5_5s5u32xg+wk-gTLK5A@mail.gmail.com>
 <44c01dbf-4b6c-c37d-d5cc-844e5679dea5@bell.net>
In-Reply-To: <44c01dbf-4b6c-c37d-d5cc-844e5679dea5@bell.net>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Tue, 14 May 2019 14:29:07 +0200
Message-ID: <CA+QBN9BqufJM+8Jm-x_zMgMo0cLHKxHCxuYPrLgbvGsbdQofvw@mail.gmail.com>
Subject: Re: C3600, sata controller
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> I had listed these cards because they are PCI64 and the Adaptec site didn't say Intel
> architecture was required.

Adaptec AAR-2410SA was tested on x86, C3600, and Apple PowerMac G4
MDD. It worked only on x86.

01:10:15.0 RAID bus controller: Adaptec AAC-RAID (rev 01)
        Subsystem: Adaptec AAR-2410SA PCI SATA 4ch (Jaguar II)
        Flags: 66MHz, slow devsel, IRQ 58
        Memory at 84000000 (32-bit, prefetchable) [size=64M]
        Expansion ROM at 80088000 [disabled] [size=32K]
        Capabilities: [80] Power Management version 2

Alan Cox explained some reasons for this. His email is long, and not
public, so I summarize what I have understood.

as soon as the computer bootstraps, the firmware in its BIOS scans
every PCI-peripherical for any BIOS-extension, it finds then there is
a BIOS-extension ROM on the SATA-card, and it loads and executes it:
the flash-chip on the card contains x86 opcode! The ROM initializes
some features on the SATA-card and loads and bootstraps a firmware
there (the firmware is contained in the flash, but it somehow requires
to be launched by the PC, dunno how/what), the PC goes ahead and
bootstrap the OS-loader (Grub? Lilo? ... this stuff), the Linux kernel
is loaded and bootstrapped too, the kernel is now running, and it
probes for the SATA-controller device and it finds it, so the
kernel-driver finds the SATA-controller already configured and - it's
running its own firmware - so, when the kernel issues commands, it
responds properly!

So, if you put the Adaptec AAR-2410SA SATA-card into a non-x86
computer ... the BIOS extension is not expected, and the Linux kernel
does not find the SATA correctly configured-card, in fact, the kernel
complains the card is not even found running its own firmware running,
and this can't be fixed unless you do a full reverse-engineering of
flash-code, in order to create a new kernel-driver able to directly
initialize the card instead of waiting for the job done by the
PC-BIOS.

hardware RAID cards are usually problematic for the same reason.

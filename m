Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E93271C49B
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2019 10:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbfENIXO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 14 May 2019 04:23:14 -0400
Received: from mail-yw1-f42.google.com ([209.85.161.42]:34695 "EHLO
        mail-yw1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfENIXO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 14 May 2019 04:23:14 -0400
Received: by mail-yw1-f42.google.com with SMTP id n76so13348956ywd.1
        for <linux-parisc@vger.kernel.org>; Tue, 14 May 2019 01:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BZiOETr3R52R+4nWq5LZK0qr4G1D2Lua+41YHvuOcv4=;
        b=fTZErhygREWaQvzjHDazEN/yQJPoFR6CUPkYPhXNrQnFwPRCuIbkg0L17mCAmU0G77
         vJpOgmCVegE81cfGjKkxtN9fZuyffA9f++q7ZfM8jV4xbe+C3jcIOuDZm7/RgJpEjuRm
         YofblQ25UmacH0JEKM6ObL2BQdyi0pMpwER9ASKg9j+oB3UH5JrJ27z4ie6NcUR1LdF8
         xGZtqsSuQ/1XzlVYC0KVnWV4shuxB5RE813w8g247z9SEXiRYZ3CQLIJ9aZYzL1+TgnR
         UjJ5/Aa1ahVvfPjPhInXuz8HyvWZOaFzyyb4BpzMXFNxkSKgWnia10QpIXGUvhT5GcAj
         lawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BZiOETr3R52R+4nWq5LZK0qr4G1D2Lua+41YHvuOcv4=;
        b=sLYWeR1y/edABr658dM4/17VOU1Y9dGzNmXKYCsCIsdfRAN/X+dnfgap35WnoopF7c
         T8CUH4JVRGFyBvyL4UblmhR5BkV3SXU89OsAeLGjq/tbK5Ox/vyBzo+GPRWD0ZrYcQPA
         OED4+BW4Qez2CNHjBf48UvmFG7Gf5SdQyNL0wMt14Dxf4NMr1Z8e+avODbp/rUGpkFMF
         TMxjfjHJIzGj/UxC6wPC0fyajrerIeiUXCupfGk/dPu5t2B+Pbn5dcn8PxHPDOTm+Rwc
         ynqk9qL4ulfvi3EG+PBORUzj1WKAs2IAUmtgO7i0o+EXZnN/sDEbmaDSimZfNGSbe0SV
         zb4w==
X-Gm-Message-State: APjAAAUYOADRwt65DeuhmKv9dJB7j+mcHJj9dzl3vGFhWhihLIp6WdFk
        8df7R/Q/6h0qwyPRvbt74uziyKngMwbwSQzIydU=
X-Google-Smtp-Source: APXvYqzeVV08cYSGt4aAMB2p8XRXOtJrOsg2PoCkcnKFTFSZ6s37Odre/LNYD4Qa3UQclzQ0pjW9MvpAOkwBzT7B7Cw=
X-Received: by 2002:a81:3411:: with SMTP id b17mr16334179ywa.280.1557822193520;
 Tue, 14 May 2019 01:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net> <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net> <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
 <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com> <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net>
In-Reply-To: <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Tue, 14 May 2019 10:22:43 +0200
Message-ID: <CA+QBN9BfXWN1Wd3jMo_z8e0nbYLuSEH+Zz1MVbAfjF=uzGnusw@mail.gmail.com>
Subject: Re: C3600, sata controller
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> "In PCI, a transaction that cannot be completed immediately
>

I think this *is* the only reason for failure, and it's compatible
with what I observe. The failure usually happens only when moving big
files.

one day ago, on a second C3600 (yes, we have two workstations), we
spent 10 hours at moving small files (<10Mbyte) on a "SY-PCX40009"
"Silicon Image Sil3124" SIL24 card, with a sleep of 2 seconds between
each copy, and we registered zero failures.

Whereas, when copying a file bigger than 8Gbyte files we had a
probability of 0.97 to end with a PCI error on the bus, and repeating
the test, this usually happened within 10 minutes.

results were the same if the card was plugged in PCI_SLOT2 (3.3V), or
PCI_SLOT1 (5V): all the same behavior!

what do I conclude? the voltage of signals is OK, the onboard
voltage-level-shifter was doing a good job, so I think that it all a
timing problem: the less an I/O task takes the PCI bus busy, the best
it is.

maybe, interrupt problem? some got lost? how to investigate the exact
reason for the failure?
did a PCI transaction fail when recycled? or did it fail due to interrupt lost?

The MSI stuff is too complex and I haven't understood it, the wiki
seems confusing to me, and we do not have it enabled in the kernel
config.

anyway, if it's a firmware problem, all related to the firmware
running the SATA card, it may be fixed by a kernel driver forcing the
chip into PCI64 mode.

I am surprised that a PCI-X chip isn't able to switch into PCI64 mode.
Cards are usually declared "backward compatible", and it would be just
a matter of "how" to handle the finite state machine that drives the
PCI, plus the onboard PLL and synchronization.


> Here are some Adaptec 64-bit cards that I found.
> https://storage.microsemi.com/en-us/support/raid/sata/aar-2410sa/
> https://storage.microsemi.com/en-us/support/raid/sata/aar-21610sa/

as written here (1), we have already tested Adaptec 2410SA, and I have
also recently received an email by AlanCox confirming that the card is
x86-only!

        Subsystem: Adaptec AAR-2410SA PCI SATA 4ch (Jaguar II)

It fails on every non-x86 machine because it relies on PC-BIOS
extension for the initialization of the onboard Intel i960 chip, and
we do not have any Linux kernel driver able to do what the PC-BIOS
does.

I had opened a BUG report to a Linux mailing list, and Alan Cox
replied to me privately.

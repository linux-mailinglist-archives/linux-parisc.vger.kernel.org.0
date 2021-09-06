Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E22540212B
	for <lists+linux-parisc@lfdr.de>; Mon,  6 Sep 2021 23:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234543AbhIFVug (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 6 Sep 2021 17:50:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:48774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229766AbhIFVug (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 6 Sep 2021 17:50:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 178BD6108D
        for <linux-parisc@vger.kernel.org>; Mon,  6 Sep 2021 21:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630964971;
        bh=Lz7NcJIc9aGLkOiqBJwrAERgX3klGvGAHelFVTGXkVY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lconPiEpils1U2pHlI5W3LYbOOj+58lS3BbHkkNSgpnp8C/oG4ssXivSG/EUp9cdj
         jqpbotjjR+7Gn6Ni62dkTwBT77vhw2vLqZGzKnWPOffdha3FEARBk3c8lCy2iyIRmg
         mu8OL926phqBtV7NgGNHB0UdJ/GSmjjPGhp5dPuprCrrsjLMDer0EdqNpHC2MZfFt1
         GyDrbu85XYqk/O9o/FF3pFgW+Sv+Y86tOnNoe5qcfhVQ3y029+OcBNhF5ccmv21Hod
         eq1seRXMdkBGzKI48RLYaKnLXEZLzTFl2tVYkKVlppzsiUPQVXsB/5tbtkr9swCyq0
         ri4/SPODTXeNA==
Received: by mail-wr1-f53.google.com with SMTP id t18so786019wrb.0
        for <linux-parisc@vger.kernel.org>; Mon, 06 Sep 2021 14:49:31 -0700 (PDT)
X-Gm-Message-State: AOAM531y1wkSYOM9OkFp3LqsaSZp5BdYtU2ls3DzaarcE1WycfqlZGjK
        UJl8aOsog7jSC8d65mTTuesYxIIIfQ6y37EStJg=
X-Google-Smtp-Source: ABdhPJy6If8XNrN3LgBzPrbiANZrWCrZy9bAJzsTf4YjANLl1Y3+ww4VNypmXmLbt3WhyQYbH8Uo++wbtWWM4OP84O8=
X-Received: by 2002:adf:914e:: with SMTP id j72mr15371229wrj.428.1630964969762;
 Mon, 06 Sep 2021 14:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <YS6VGsZ7fZtZeu/i@ls3530> <YTDaZAMvAipdvkaB@ls3530>
 <CAK8P3a0zwnEUK_ztPRBx0H9VGBoPVY-+aASFV97zSKrL=diXUA@mail.gmail.com>
 <51d6b8cb-a64f-0cf7-1545-4c2fee89799e@gmx.de> <CAK8P3a3oJo496dXpAWHQKG=Sdr+RSfScYbWKyGrk8HNfH5G1CQ@mail.gmail.com>
 <41e38a49-5a11-4f93-6771-b67d8184a673@gmx.de> <CAK8P3a0Tzi8L3+7YypPMukjDM+D8a_dxK1q7fOK357LATsouoA@mail.gmail.com>
 <97c68f9c-b646-042d-a865-1be9b28ed24e@gmx.de>
In-Reply-To: <97c68f9c-b646-042d-a865-1be9b28ed24e@gmx.de>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 6 Sep 2021 23:49:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1PKttBDpSEwRzoke070tMRq_MCZRCi-C+97=htZ784cw@mail.gmail.com>
Message-ID: <CAK8P3a1PKttBDpSEwRzoke070tMRq_MCZRCi-C+97=htZ784cw@mail.gmail.com>
Subject: Re: [PATCH v2] parisc: Fix boot with kernel v5.14
To:     Helge Deller <deller@gmx.de>
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Sep 6, 2021 at 10:15 PM Helge Deller <deller@gmx.de> wrote:
> On 9/6/21 12:54 PM, Arnd Bergmann wrote:
> > Ideally however you would
> > change the linker script to insert a
> >
> >      . = ALIGN(4);
> >
> > before the output to make the variable properly aligned according to
> > the ABI. See 'git log arch/arm/kernel/vmlinux.lds.S' for a long history
> > of alignment changes we did there.
>
> This here is a special case and it's not just parisc.
> This happens when the linux kernel gets compressed, and at the end of
> the compressed file bzip/gzip/lz4 and such gets added the size of the
> compressed file.
> See in generic Makefile scripts/Makefile.lib, line 392ff.
> During make then this happens (for lz4 compression):
>   { cat arch/parisc/boot/compressed/vmlinux.bin | lz4c -l -c1 stdin stdout; printf \\350\\044\\232\\000; } > arch/parisc/boot/compressed/vmlinux.bin.lz4
> which is then later added as binary input to the linker to generate final file.

Ok, I see. It looks like x86 rewrote this part in 02a884c0fe7e ("x86, boot:
determine compressed code offset at compile time") to parse the size
at compile time, but recreating this on parisc and the other architectures
that have the vmlinux.scr linker script would be a lot of work for little
benefit.

       Arnd

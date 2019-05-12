Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D08A81AE29
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2019 22:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfELUts (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 May 2019 16:49:48 -0400
Received: from mail-yw1-f47.google.com ([209.85.161.47]:33109 "EHLO
        mail-yw1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfELUtr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 May 2019 16:49:47 -0400
Received: by mail-yw1-f47.google.com with SMTP id q11so9381316ywb.0
        for <linux-parisc@vger.kernel.org>; Sun, 12 May 2019 13:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=CQS5rVb5A7Wokw7HTdpc5JzdEFnMZc3iivC7IhZNIic=;
        b=BJU4NUo9A2C30NphLgpiHZCNDLVx3uT5H0nD3FdqJqJmXBVDUpeiMYTbkK8zwiKBou
         yT7mdbVyeyEy5zVbw9k043OUpInGHp/kgZIy9+csYP2SBd8W2z3nhWpWLYDw2My0bdP2
         V0zamYBM+k6CblucA7YWW70cfxJ0JCN10RlvEzTKjDhDSFtKrH2y1D1xg6plmf0+pyVW
         HwdDfQ3EqeZUu7GveNJEws5glsbue3pmKhrKxOaPxRT2ZZYtLGDQzNtLZFX1u0sF24CQ
         7qw1A8PmHMdXxG/mCyDHwyQFPhk34DW4y6Pitqlh905nb1gM4bQq92HRzk2xMZ7YgJWg
         WnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=CQS5rVb5A7Wokw7HTdpc5JzdEFnMZc3iivC7IhZNIic=;
        b=nXMNzNwfKR+m4JrHJ/Jwo6Vxy2HRKkuDpqre+qKJybsSthosvOWgAXkxPosyabPw/P
         5tLR3MRWxEu7O81UqpaigaTDzKu32VVZ8Xw68PcKUw/dqD4mettr/ExAeJMOijDHjoO4
         ugKJpli+SX9hSI4Gulc0YUuzi4bXvPnJHbZApTcG8i1AsqPvwoLiABgbb7Hr7J6NWYEB
         XZ57XDyPyjtJ1UHuhTK+7HJOL3E7hRWvAqpRRYSRXz6LJ5xmTvFmUX5Ds3G0bP72yMJ0
         RK4z3dIuFPHWKHxXMbJqo1zRlaCtkH6/IO7KMtDvjrXy8ovkRa/vZp7zKMc72ha0FYsI
         sczg==
X-Gm-Message-State: APjAAAXp5kwaPbqPYJdxN14ttqpk+5n2CPUIS6/Xv+vsjuz9s6T/0Clg
        VTO3p08vdgPKI+GopYhilKNm82zdlyXVXAb2Aj+OYIxq
X-Received: by 2002:a81:4985:: with SMTP id w127mt11498836ywa.144.1557694186996;
 Sun, 12 May 2019 13:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
In-Reply-To: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sun, 12 May 2019 22:49:18 +0200
Message-ID: <CA+QBN9BcrrgT-ThOMwSjugTVRqoU10d8juOibLMMROvWvJqd4g@mail.gmail.com>
Subject: Re: C3600, sata controller
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

kernel's config and dmesg are here

http://www.downthebunker.com/chunk_of/stuff/public/projects/workstations/hppa/c3600/kernel/5.1-git-v5.2-64bit/

http://www.downthebunker.com/chunk_of/stuff/public/projects/workstations/hppa/c3600/kernel/4.16.2-64bit/

Il giorno dom 12 mag 2019 alle ore 22:44 Carlo Pisani
<carlojpisani@gmail.com> ha scritto:
>
> guys,
> I asked a friend to lend us his card, which is the card2 listed below
> and not things are becoming really weird
>
> card1, Silicon Image, Inc. Adaptec AAR-1210SA
> card2, Silicon Image, Inc. SiI 3124 PCI-X Serial ATA
>
> the card1 is a PCI32 bit card, and uses the "sata_sil" driver
> the card2 is a PCI64 bit card, and uses the "sata_sil24" driver
>
> card1 is installed in a PCI32 slot, and it's moving 32Gbyte in a loop
> without any issue
>
> I have just tested card2 in each of the PCI-X slot (including the 3.3V
> one) and ... it has always triggered the HPMC unit, crashing the
> machine
>
> the hardware is different, and drivers are also different, but  ....
> maybe the problem is related to 32 vs 64bit?
>
> I am going to repeat the test with card2 installed in a PCI32 slot.
> This should force it to 32bit: will it work correctly?
> (hope this makes sense)
>
> ---
>
> we have also checked if the kernel is correctly handling the ram
> we have a C3600 with 8Gbyte of ram
>
> mount -t tmpfs -o size=7G tmpfs /mnt/ramdrive/
> dd if=/dev/zero of=/mnt/ramdrive/test.bin
> badblocks -swv /mnt/ramdrive/test.bin
>
> checking for bad blocks in read-write mode
> From block 0 to 7340031
> Testing with pattern 0xaa: done
> Reading and comparing: done
> Testing with pattern 0x55: done
> Reading and comparing: done
> Testing with pattern 0xff: done
> Reading and comparing: done
> Testing with pattern 0x00: done
> Reading and comparing: done
> Pass completed, 0 bad blocks found.
>
> no problems found

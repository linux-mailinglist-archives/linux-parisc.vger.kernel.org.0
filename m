Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD8B401187
	for <lists+linux-parisc@lfdr.de>; Sun,  5 Sep 2021 22:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhIEUe4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 Sep 2021 16:34:56 -0400
Received: from mout.gmx.net ([212.227.17.22]:60603 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230217AbhIEUez (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 Sep 2021 16:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630874024;
        bh=ItNwfd5QrlJvqaqq0YfVWS2FcHJQ8dkUltawpxzlB+g=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=MHWTu7USjHPHKwFCQLPjhCq27humXYBDYCsZLi/BAxqd79bZYvSJ4SCUOQm0RQu5S
         qcGsd9/LHT94Zah7ExwtVZ8ap5MUx9yeEKXYaeh+XLHkFCeJF/Dz4wWPdWmU3pIN65
         GlIE8vZFhYKGmYzDVdSWJy/UQCeVNoRP8ujE0wZ0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.147.61] ([80.187.121.82]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhlKy-1mrvs80abA-00dpz7; Sun, 05
 Sep 2021 22:33:44 +0200
Subject: Re: Virtualizing HP PA-RISC unix station other than B160L
To:     Richard Henderson <richard.henderson@linaro.org>,
        thierry.briot@gmail.com
Cc:     "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <00d401d7a230$56842630$038c7290$@gmail.com>
 <CAFXwXrmt-u9iO_xY3y=ite1rPsvdm77w_s3Fw1G5C=fag0KP1w@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <2db9d592-8115-1206-68e4-71a9fd25b45d@gmx.de>
Date:   Sun, 5 Sep 2021 22:32:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFXwXrmt-u9iO_xY3y=ite1rPsvdm77w_s3Fw1G5C=fag0KP1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pYfO96URKeBbPpUYB4U2dTQTdCxkV6Ni/0S4zTh0eWFEv6HswXT
 W2GqWk4F3X0aYTUowcbYfEoEdFJ6DiMUyZujqFCgqF1n6PHNWkMUWEwONo3ExBW/64vfJCT
 ihFqrlPBBP+THejc50k9YdipSVcYy9IH86zgT3xMscQVa2mSXx8+WhlCiBzQrTjZj4z0WB+
 opAxH8NFnd09Ba6DcvNWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:INaeD/xMXV0=:3PAWAjyoMP5Qnw5uLJCxfb
 kFK0RB8ywG/EvA4oDiAGmoDw7uxWVGgqC4+0kJR50mq7ldHcsQnC/RZRwSd1Mlr/8/SokBx71
 fDK6b45PxCBPIwYg/j6VBy83Pgl8Uybsu62pnTiNn0W5xFfG62qXqkE7alCvuSdlkiSjA/VYp
 hh7Hb0+x2YcpAKe1pk0R1t77YI4LvGKCU6fE1mApsChPGeI0O+4K7eswH7URYajSaP8JHJBeu
 IGGnt80rMHW0b+w7VRJXsb+YmsctHvRGd9dY/VABWdE22jdnaqpLoAoAxDldKB9ZBc+8TbzMq
 ePyD/AbDa1jhAzUnOmuIFMj5YH8sjKSLlN8HNZb4xFLRBSP5limuUuvRyAcsfAPQaq7GS6H8T
 rDH+ixWbDwbzNNXnIe41B9CxdSs4JUo6Wgf9kyO8A0fS13B7lAwtzvTBkmj6rozeTXo9jnfrS
 sN7IuWyPYwa6jKwXo5l0apE/puMEGjm6ygGQMH2GWz1OlAIzFTA/8v7SdKW5tNBTd74g44FiI
 E9WI9Upq9Z+t5/ue7FcD4grl4weGdP/FU4hSWhQjoNXBkh/uJkFj6khEojZmTjStGlfDmkeuO
 ZlBNX5wlRWimrU5Xnr3Mmw6J2VYBIJdxD8j05ngiARMjTwaUXZc81Zx9oGbauJ4rayIPt6JQQ
 FQ+HCkUmYo7ZS7GqQP3OrLDVoWrhMCrx8mYz+PHltAgMv0AKREzkvPnWJI4Gb/ZHtJIVkgOVJ
 WteIIKT/NPIgb4FzZkdoyNi91cs5i+xylLGW5ep9tUWnMuAx5ck3w8GxjZMhUlb6vXzkUT0jy
 WnTdt2YyGM1ITnTcFwQdMNDZMsHtH+cWwJB94zII9tM6OgjOH8Cb81YMSHaaKkKICaQoPlaLf
 oZot/00KtURJv8ruqV8UEPDdK3B6fm/QILhnTn46Y5pT2KMQMU3KZavH1rL2imsAPGZ1tvAg7
 LVNw9qkp8YqLTV4PtUyzrytS+z78Ndz2x7PoMFC978TnH/HwFfFy3JIBaq++y6NjVe3WpmPeF
 kbcsbhZpjc4raKBsKk+vqEFJULyzy7JJQDd4nZBtTb8qGYdUUBO66qti/7X1SQRCLcHyEWLnN
 M1IqediSZVS4ZixqC/JfhMkX5FqkWAui0Y66wL4JC3KbzgBcyykrPnzyQ==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Thierry,

On 9/5/21 3:24 PM, Richard Henderson wrote:
> On Sun, 5 Sep 2021, 10:30 , <thierry.briot@gmail.com <mailto:thierry.bri=
ot@gmail.com>> wrote:
> For my company (Nexter Systems, France), I am using qemu-system-hppa
> for virtualizing HP PA-RISC workstations. That works well. You have
> made a very good job !

Thanks.

> But my machines are other than B160L (for example B180L), and I have
> to completely reinstall HP-UX on each emulated machine.
> If I do an iso system disk image of my B180L, this iso isn't bootable
> on qemu-system-hppa.
>
> Thus, my questions are :
>
> * Is it planned to emulate other HP unix workstations than B160L (for
> example B180L) ?

Maybe at some point a 64-bit capable system, e.g. C3000, and maybe
an older 32-bit system, e.g. 715/64.
For the 64bit system additions to the emulated firmware and additional
64-bit qemu support is necessary,
and for the 715/64 we need an additional NCR710 SCSI driver.
Both are lots of work.

The B180L is exactly the same as the B160L, with just a faster CPU:
https://www.openpa.net/systems/hp-visualize_b132l_b160l_b180l.html

> * Or, what changes should I make to my iso image to do it usable ? If
> I replace the /boot filesystem of the B180L image with the B160L one,
> I get a kernel panic at boot time.

I don't know HP-UX so well. I could imagine that your physical machines
have different SCSI controller cards which are used by HP-UX, and which
aren't emulated in qemu yet. That's maybe why qemu can't boot your already
installed images.
If you post the output I maybe can give more info.

> Helge is the one that did all the hw support, I just did the CPU.
> There are no real plans to do another machine. I'm not familiar with
> the specs between the HP machines to know how much work that would
> be.

There is a very good overview of the various HP machines at openPA:
https://www.openpa.net/systems/

Helge

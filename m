Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD592753D
	for <lists+linux-parisc@lfdr.de>; Thu, 23 May 2019 06:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbfEWEnX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 May 2019 00:43:23 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:42754 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbfEWEnW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 May 2019 00:43:22 -0400
Received: by mail-ot1-f44.google.com with SMTP id i2so4211735otr.9
        for <linux-parisc@vger.kernel.org>; Wed, 22 May 2019 21:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YuqufgVVeAOGCpxkKbTgC8JrNpTgMtgIwu/Qt17UiVA=;
        b=sTN5QPdLFC1/bJ5CUEpz5WqxG7VWGDdPmVdCk+gJ6bc6qv3TAxtZz57Q420Y0qLVgF
         /0Qpudh0b/cAQGCHdHaX02LmGWj01uokQd4KiTY7SvsjLcgiB4fBzYKeN6YRGb1UmYCj
         79wTBfnax6RmKUljHNFZGb0m0GUP+XKVbD8p6V3LOF5yyfjg2ELw4avcs8rI0W45BEBn
         5fFTw2tFUYNX8RhTPqJ5Ch9KOZmrfzSKQBoOjk66paYSTdTWdl/PVi7mH6VxN8dDjoDx
         32S9+rwqfAOzdKu1RLjP4nnuD8kQFqV7jN41thVW3NgtG/XPQoqTSWs1puL/ciS6NDeu
         Ezgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YuqufgVVeAOGCpxkKbTgC8JrNpTgMtgIwu/Qt17UiVA=;
        b=PuiolBGConiVnjTGe/Cxv7XDOu20JXup5ynBsGSYdHCdTlDeX5CGByVY+Zycv0wEMd
         WmLXu1es6UmL5i51sESpPkUPEX95AuOX9w9h/i99/Gx4bgbENTAKEt8n934TbbAbXyrn
         4yVroW9IFq9RT+j3i3ye196u+AZiqh5f/+0HhQNwhd8jOItg3FFSJlTUqRxuon5Ghiqe
         6NExry9GFFcRM7y4MXy10Sh4CkAENXAZfRz3UeF17s6WBFsUNVlQU3gRzr80712rxqv6
         2Y7l2wIxMg75U2TCDlgappA+Dav1nylMpQ/1VK5zvaQ7yJsDxKAx/WSSPOLLj6680pYO
         wZ+g==
X-Gm-Message-State: APjAAAWs3dkwlzD/j59XL+heTgfbSGm4gnxqBKz9KH1lFAl/sqsct/L5
        4Qk/7RC7RPg8mKyqg52YXU5e5HdUW1LHmtSv9Uo=
X-Google-Smtp-Source: APXvYqy4L/EhX1UGswxoms78TPoTKiwSqstURAxWJskyhBpwYNdH9DbWQK1EWnFNRmZvI27uI5qWnNXZUDxhA4Bup/g=
X-Received: by 2002:a9d:60d9:: with SMTP id b25mr3327170otk.133.1558586601832;
 Wed, 22 May 2019 21:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com> <21dcf273-929a-6fb1-7978-37145ea62301@bell.net>
In-Reply-To: <21dcf273-929a-6fb1-7978-37145ea62301@bell.net>
From:   Grant Grundler <grantgrundler@gmail.com>
Date:   Wed, 22 May 2019 21:43:10 -0700
Message-ID: <CAP6odjiwmUXd8m2w-wf7R4t+qT60xiA5bE79RfBMP07xdvCpaw@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

[resending as plain-text. :(  gmail is such a PITA - it should just
know by now that anything going to vger needs to be plain text. :/ ]

On Wed, May 22, 2019 at 6:09 PM John David Anglin <dave.anglin@bell.net> wrote:
>
> On 2019-05-22 8:38 p.m., Grant Grundler wrote:
> > While PCI bus type is the same, most problems with device drivers are
> > at DMA Coherency/Memory ordering level.  C3600 has PA8600 processor
> > and you might learn more about PA-8600 processor, Astro (IOMMU), and
> > Elroy (PCI host controller) from
> > https://www.openpa.net/systems/hp-visualize_b1000_c3000_c3600.html
> >
> > If you can try some experiments, start adding mb() calls after the
> > driver adds or removes an IO request from any list or queue.
> That's an interesting comment.

I was also being very lazy and imprecise. :)

More specifically, I was thinking the mb() should be placed AFTER
adding any IOs to data structure in memory the device will read but
BEFORE the driver tells the device more IO requests.   I didn't look
if such sequences even exist in the drivers mentioned. If the devices
use "mail boxes", completely different issues around ordering can come
up.

> On a UP kernel, mb() is currently just a compiler
> memory barrier.  On a SMP kernel, mb() generates a "sync" instruction.  We also
> use "ldcw" as a barrier in spinlocks.

Yeah, I'm not sure how strong the mb() needs to be and maybe I'm
giving the wrong advice: use dma_wmb() for the case I've described
above.  Then use dma_rmb() before reading data structures updated by
the device. See examples in the existing code:
   https://elixir.bootlin.com/linux/v4.20/ident/dma_wmb

[It's interesting that mostly networking drivers are using these
memory barriers and very few block devices do.]

OTOH, limiting the compiler is often sufficient to get "expected
behavior" since the caches and memory controllers usually aren't that
busy/backlogged that memory accesses can get very much out of order -
especially memory reads.  Especially for drivers only tested on x86
where everything is pretty strongly ordered and compiler doesn't have
many registers to work with. These older drivers are more likely to
have issues with RISC compiler ordering accesses into sequences that
are "unexpected" (even if perfectly correct from compilers PoV).

> I'm thinking dma_rmb() and dma_wmb() may need to be stronger.  Is "sync" or "syncdma"
> a better choice for these defines?

Hrm, maybe but seems like we should be using dma_*mb() calls since
they are available.

cheers,
grant

>
> Cheers,
> Dave
>
> --
> John David Anglin  dave.anglin@bell.net
>

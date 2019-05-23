Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2368328DB3
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 01:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388068AbfEWXSb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 May 2019 19:18:31 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32963 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387693AbfEWXSb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 May 2019 19:18:31 -0400
Received: by mail-oi1-f194.google.com with SMTP id q186so5708659oia.0
        for <linux-parisc@vger.kernel.org>; Thu, 23 May 2019 16:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dhCRA0l0q9+XsJtJ7xcL4psIukNmCta9PJGSGgenRPg=;
        b=d0+BYROLfCQYqzJILmQpC9OKBq3/lzeSHekpuJ5NeSxI8cW0Oo3wBjnlQKvEevSwTJ
         tGI820QIdxQvgmJGlrNkKOLlp5FnNgpjG73F+OzmEg+veMB7YZ+ssY9BzL/nbyUdmizQ
         9FRqaGmGVc7FiOXlnrA7uaqai00u6D1CgNDJ1174X63jUNoO/7gUVgu5wdPwh2axkMnh
         LCfZArnqxMVe1pnmhqF80NH5GpdM3r2VbDn4UbJtBMx6oSBAjcmpeBN8ivjm8tzk00Or
         FzTU09+s1fHaOXwAtKrbANXL5RKNBfKhCASPGV39DqJKda7oi31ULbGorb1sAkS4BBHZ
         Am6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dhCRA0l0q9+XsJtJ7xcL4psIukNmCta9PJGSGgenRPg=;
        b=QDSFkn35AjYvoVLDqntFz+Wy23d8uEZ71dvKTkQCt4cCUHWDQScFxz9DFI1B/L9fJ6
         VPfHGtvMPHKl1ZZLmxoFOZjS9kNm71OAyKqlr4RGVdMA534fmwBCU8G1kY4mqf0798YC
         QSyDvVfmaWg1OQatDn4cASKOhJYlZkNfDBksQiiGJ4Vm0DWL860AKR/pc0A6KXR4xfhi
         eDviKYyE89ZbTdemYFAySJt3c+c9+tmSK8VKYphegLq1xrON2ez/+i12X6RLYKJA+q+z
         PZA6hDMIUlYpvDKYj5m5bcNfXxhdgQML1Fdobq6j/9TqNjXHkCmW/ZS36azsLB2HBe1p
         5l0g==
X-Gm-Message-State: APjAAAXpv7tU1vE3/ZU9Mkbli284Sye83i02NxnM2S6rmS05OEAnZeX8
        FQNOYvWQj+IFCg/Vjky7e+Ee/wJip8JR3YGAvWw=
X-Google-Smtp-Source: APXvYqzrRHpQopmEUBrqNu8Npznjygh75Kkc/8hGLmC1JrjxGU5rI1UJs1rWNP0XHZApPfZdvFuaSoKeV1GVs4nh3IQ=
X-Received: by 2002:aca:4c4e:: with SMTP id z75mr2760684oia.117.1558653510208;
 Thu, 23 May 2019 16:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net> <CAP6odjiwmUXd8m2w-wf7R4t+qT60xiA5bE79RfBMP07xdvCpaw@mail.gmail.com>
 <7d252322-51dc-07ff-8843-b28cdc5a6762@bell.net>
In-Reply-To: <7d252322-51dc-07ff-8843-b28cdc5a6762@bell.net>
From:   Grant Grundler <grantgrundler@gmail.com>
Date:   Thu, 23 May 2019 16:18:18 -0700
Message-ID: <CAP6odjhM=uvhY-kEmf=fCm3Wk2h8Xo61r9yUFsL8x5UALwKnug@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, May 23, 2019 at 9:10 AM John David Anglin <dave.anglin@bell.net> wrote:
>
> On 2019-05-23 12:43 a.m., Grant Grundler wrote:
> >> On a UP kernel, mb() is currently just a compiler
> >> memory barrier.  On a SMP kernel, mb() generates a "sync" instruction.  We also
> >> use "ldcw" as a barrier in spinlocks.
> > Yeah, I'm not sure how strong the mb() needs to be and maybe I'm
> > giving the wrong advice: use dma_wmb() for the case I've described
> > above.  Then use dma_rmb() before reading data structures updated by
> > the device. See examples in the existing code:
> >    https://elixir.bootlin.com/linux/v4.20/ident/dma_wmb
> >
> Looking at arm and arm64, I think sync should be used for mb(), rmb() and wmb().  Possibly,
> ldcw can be used for dma_rmb() and dma_wmb() although sync should be okay.  Sync is heavier
> than ldcw.  The __smp barriers could use ldcw.
>
> Arm64 doesn't distinguish between UP and SMP.  32-bit arm has this config option,
> CONFIG_ARM_DMA_MEM_BUFFERABLE, that enables stronger barriers when defined.  I think we
> should use the same barriers on UP and SMP on parisc to ensure we properly synchronize I/O
> operations.

dma_wmb/rmb were added to linux kernel in 2014 - well after I stopped
working on this. So I never had to think about this while details of
parisc internals were a bit fresher in my brain. Helge might know
enough to determine this.

I suspect ARMs approach is correct: CPU memory model doesn't change
depending on whether kernel is compiled for UP or SMP. Using same type
of barriers for DMA makes sense.  Just becareful that the
implementation for something called "sync" could be completely
different on ARM64 - even on different ARM64 implementations.

cheers,
grant

>
> Dave
> --
> John David Anglin  dave.anglin@bell.net

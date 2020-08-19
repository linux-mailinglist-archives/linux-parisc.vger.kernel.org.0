Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC15F24A893
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Aug 2020 23:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgHSVfg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Aug 2020 17:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgHSVfg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Aug 2020 17:35:36 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6604C061757
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 14:35:35 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id b17so242858ion.7
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 14:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WAP7x8x0foqdAgUJXCUbXtNF5KKqkXgkWQ24I3dADlA=;
        b=SFRjK/3Rk8PcHuB/L93zfgQzVwqX5kDbHpUIb0oL2BGbijiRO1S+hC6HUSDKA2BJx9
         JE6BGXjHLEcwAUZYCKcjZHUqeWnlxWZVPNebaBd6HhiNIsx/9qBiki7pmlZyevmZZ+vt
         K+oKIbFI+dAJdUk1VbRoYqeLVtH7VVH/lpQQpOoWbgGojlqBDBjoCIzyPTPae27y5M5k
         9RQ0ZhPbRZQXpQ8MX/7cOQHF+PGSdyl92s+L6b44SSJyyWBb4ngxsIg65vDeZy9ddU3l
         /AO3BDe7da3Euj4PHqUeA8tw3TOF8LzdbllPqm/UkuO9KTdrGZ3Zmkh2lUSz0OZRUliU
         QzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WAP7x8x0foqdAgUJXCUbXtNF5KKqkXgkWQ24I3dADlA=;
        b=jrNurYpkvkMfsJWwkj7albfRlMS6mAtxlKlpD04jAEo4iRBh2UDTvLaVHSxhEVMkih
         AcW0NpB9Smy+aB/qqc1RTlNdc6Cv4nZkT4/mp+VubIcRSdkJDufBYyMsGtORZUDeFMes
         mhrTHKjvIkNOS5/yBamOLK2xXVeHbSdgF6LihD9J5mdotBC8w430onaHLWyCj4t2+F2d
         Q3wuagEe2x5fZHHQTK28X9I1r+iS9RfyjftASebGkiToOdrQ9oPPHIA9ICvkboc/T7hW
         SeF24fr4Me8EPx9KZYKtHZDhhyD+Aut8nDFiiaYe00evJOT7xcjMqiFc2/APxcdREkYB
         w1lA==
X-Gm-Message-State: AOAM530xQ3Ift3KFnhmu40bkFRqbeO5zqcq2L/u6PCznWepncsHgwN1D
        pqzSMo7qxsFdVS0IkLDLHSewYDCnvwiKZ7nhK6v1fQ==
X-Google-Smtp-Source: ABdhPJywK64kEgYlf9g65it0YFXG84UBvWyptMMPeq3iPvTXG67vDOt8P/aosOE1T16rmASnV1GGpF0zYCd09abuvBM=
X-Received: by 2002:a6b:b2cb:: with SMTP id b194mr22278287iof.105.1597872934959;
 Wed, 19 Aug 2020 14:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597720138.git.pcc@google.com> <691510496a422023a2934d42b068493ed2d60ccc.1597720138.git.pcc@google.com>
 <20200819103000.GE6642@arm.com>
In-Reply-To: <20200819103000.GE6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Wed, 19 Aug 2020 14:35:23 -0700
Message-ID: <CAMn1gO4y3x4y-RmvTXxVd-V5cxXmFDedDkvBCpAuGk9AFwYqgQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] arch: move SA_* definitions to generic headers
To:     Dave Martin <Dave.Martin@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-parisc@vger.kernel.org,
        Andrey Konovalov <andreyknvl@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        David Spickett <david.spickett@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Aug 19, 2020 at 3:30 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Mon, Aug 17, 2020 at 08:33:47PM -0700, Peter Collingbourne wrote:
> > Most architectures with the exception of alpha, mips, parisc and
> > sparc use the same values for these flags. Move their definitions into
> > asm-generic/signal-defs.h and allow the architectures with non-standard
> > values to override them. Also, document the non-standard flag values
> > in order to make it easier to add new generic flags in the future.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > View this change in Gerrit: https://linux-review.googlesource.com/q/Ia3849f18b8009bf41faca374e701cdca36974528
> >
> >  arch/alpha/include/uapi/asm/signal.h   | 14 --------
> >  arch/arm/include/uapi/asm/signal.h     | 28 ++-------------
> >  arch/h8300/include/uapi/asm/signal.h   | 24 -------------
> >  arch/ia64/include/uapi/asm/signal.h    | 24 -------------
> >  arch/m68k/include/uapi/asm/signal.h    | 24 -------------
> >  arch/mips/include/uapi/asm/signal.h    | 12 -------
> >  arch/parisc/include/uapi/asm/signal.h  | 13 -------
> >  arch/powerpc/include/uapi/asm/signal.h | 24 -------------
> >  arch/s390/include/uapi/asm/signal.h    | 24 -------------
> >  arch/sparc/include/uapi/asm/signal.h   |  4 +--
> >  arch/x86/include/uapi/asm/signal.h     | 24 -------------
> >  arch/xtensa/include/uapi/asm/signal.h  | 24 -------------
> >  include/uapi/asm-generic/signal-defs.h | 47 ++++++++++++++++++++++++++
> >  include/uapi/asm-generic/signal.h      | 29 ----------------
> >  14 files changed, 51 insertions(+), 264 deletions(-)
>
> Nice diffstat!
>
> >
> > diff --git a/arch/alpha/include/uapi/asm/signal.h b/arch/alpha/include/uapi/asm/signal.h
> > index 74c750bf1c1a..a69dd8d080a8 100644
> > --- a/arch/alpha/include/uapi/asm/signal.h
> > +++ b/arch/alpha/include/uapi/asm/signal.h
> > @@ -60,20 +60,6 @@ typedef unsigned long sigset_t;
> >  #define SIGRTMIN     32
> >  #define SIGRTMAX     _NSIG
> >
> > -/*
> > - * SA_FLAGS values:
> > - *
> > - * SA_ONSTACK indicates that a registered stack_t will be used.
> > - * SA_RESTART flag to get restarting signals (which were the default long ago)
> > - * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
> > - * SA_RESETHAND clears the handler when the signal is delivered.
> > - * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
> > - * SA_NODEFER prevents the current signal from being masked in the handler.
> > - *
> > - * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
> > - * Unix names RESETHAND and NODEFER respectively.
> > - */
> > -
> >  #define SA_ONSTACK   0x00000001
> >  #define SA_RESTART   0x00000002
> >  #define SA_NOCLDSTOP 0x00000004
> > diff --git a/arch/arm/include/uapi/asm/signal.h b/arch/arm/include/uapi/asm/signal.h
> > index 9b4185ba4f8a..7727f0984d26 100644
> > --- a/arch/arm/include/uapi/asm/signal.h
> > +++ b/arch/arm/include/uapi/asm/signal.h
> > @@ -60,33 +60,11 @@ typedef unsigned long sigset_t;
> >  #define SIGSWI               32
> >
> >  /*
> > - * SA_FLAGS values:
> > - *
> > - * SA_NOCLDSTOP              flag to turn off SIGCHLD when children stop.
> > - * SA_NOCLDWAIT              flag on SIGCHLD to inhibit zombies.
> > - * SA_SIGINFO                deliver the signal with SIGINFO structs
> > - * SA_THIRTYTWO              delivers the signal in 32-bit mode, even if the task
> > - *                   is running in 26-bit.
> > - * SA_ONSTACK                allows alternate signal stacks (see sigaltstack(2)).
> > - * SA_RESTART                flag to get restarting signals (which were the default long ago)
> > - * SA_NODEFER                prevents the current signal from being masked in the handler.
> > - * SA_RESETHAND              clears the handler when the signal is delivered.
> > - *
> > - * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
> > - * Unix names RESETHAND and NODEFER respectively.
> > + * SA_THIRTYTWO historically meant deliver the signal in 32-bit mode, even if
> > + * the task is running in 26-bit. But since the kernel no longer supports
> > + * 26-bit mode, the flag has no effect.
> >   */
> > -#define SA_NOCLDSTOP 0x00000001
> > -#define SA_NOCLDWAIT 0x00000002
> > -#define SA_SIGINFO   0x00000004
> >  #define SA_THIRTYTWO 0x02000000
>
> Can we add a placeholder for this in the common header?  We don't want
> people accidentally defining a new generic flag that clashes with this.

This flag (bit 25) is covered by the comment in
include/uapi/asm-generic/signal-defs.h that reads:

/*
 * The following bits are used in architecture-specific SA_* definitions and
 * should be avoided for new generic flags: 3, 4, 5, 6, 7, 8, 9, 16, 24, 25, 26.
 */

Peter

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6709624AC18
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Aug 2020 02:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgHTAXm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Aug 2020 20:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgHTAXk (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Aug 2020 20:23:40 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7145C061757
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 17:23:40 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t13so303280ile.9
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 17:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ee7+k1tvC79GWOhjNchBTu89HS2C1/zTEci+Enoxro0=;
        b=FcE8F5Gc5BTDoBdePi61itl/5hiiPLmkR/Q7cwoWSYjof9WQHkncUAQVOj7nbbWpi1
         5zJybJVIA644YjGISSfwM98Xqjt6SnabCpX0NoExKfRWXsktPTmTrvsWL9FcUpaVXCLC
         fFzKvHT9UomrFE11cJgvWbdtMsCl07yKDfn0P/quxtXkrtQn5C3KGmbxsDmR5cawQetf
         eezGFKuFXd0oxzPuwS9w1NFQQn8ma2dhrFRGorke5pmnHr16XzXnlQwthurY8f3yKxSR
         jLS8t4k7HZWrfY5Ktz+nUt74na0EyhllUftNE56DvjgIZ5FZJvmGFb6oJ36xgcSq/7Mk
         ZFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ee7+k1tvC79GWOhjNchBTu89HS2C1/zTEci+Enoxro0=;
        b=msPM+0KAA4J/0x7pKx1I0lifoJ71+8R2NaZf2vJmfSxYXK/QXvVx4O0m6K03B7sEn7
         nWU/pbSbHeU/77R+oz5Qf6iZ3D7HW3/5meqDzemBkzOaNT0AifqXspzOLexUbk/8S6XH
         kEY0FpYigdKF5g+hUdrv80cBBYIz+t3Uk5+Tywn5CM+Fm9G38Ud+N122LMHy7hSnMjWO
         ELppSqJ7nSPB15RNtQdQ9Ss7MgtfMygL04PKx8uUCZwKWuHlvtS/ipn+gueo6E5WBFJT
         QgbifR2kQTgs/1xNnscf6ju1UdUBmwg+3IcR88L70WQHq5IKPIB1AaGkCsUR8lyIRfgO
         9tSw==
X-Gm-Message-State: AOAM530lkzbrItzT3nhpwxaKDnUwErne9vZQGfxS19ntgJmFQvWLrmEr
        DQ2035XjlAFPcDG0Ijc2UlwSHn/1v47GpjtJRxtkeQ==
X-Google-Smtp-Source: ABdhPJxN1hLPUX9IIZx9T7PD42cQh/DfWiTMSqSCI2pz5szeXpH0xRZuZHVpbhQ63CHmfTMo9UctFG7JpW71lZrvKHA=
X-Received: by 2002:a05:6e02:ef2:: with SMTP id j18mr539962ilk.2.1597883019685;
 Wed, 19 Aug 2020 17:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597720138.git.pcc@google.com> <d93b503a926f45e752178bb61f451a426a558260.1597720138.git.pcc@google.com>
 <20200819145112.GG6642@arm.com>
In-Reply-To: <20200819145112.GG6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Wed, 19 Aug 2020 17:23:25 -0700
Message-ID: <CAMn1gO6Z1VECtC84fjjw2KYNHox1KcoZ01A7nkk8D1F3g9mzJA@mail.gmail.com>
Subject: Re: [PATCH v9 4/6] signal: define the SA_UNSUPPORTED bit in sa_flags
To:     Dave Martin <Dave.Martin@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>,
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

On Wed, Aug 19, 2020 at 7:51 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Mon, Aug 17, 2020 at 08:33:49PM -0700, Peter Collingbourne wrote:
> > This bit will never be supported in the uapi. The purpose of this flag
> > bit is to allow userspace to distinguish an old kernel that does not
> > clear unknown sa_flags bits from a kernel that supports every flag bit.
> >
> > In other words, if userspace finds that this bit remains set in
> > oldact.sa_flags, it means that the kernel cannot be trusted to have
> > cleared unknown flag bits from sa_flags, so no assumptions about flag
> > bit support can be made.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > View this change in Gerrit: https://linux-review.googlesource.com/q/Ic2501ad150a3a79c1cf27fb8c99be342e9dffbcb
> >
> >  include/uapi/asm-generic/signal-defs.h | 7 +++++++
> >  kernel/signal.c                        | 6 ++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
> > index 91000b6b97e0..c30a9c1a77b2 100644
> > --- a/include/uapi/asm-generic/signal-defs.h
> > +++ b/include/uapi/asm-generic/signal-defs.h
> > @@ -13,6 +13,12 @@
> >   * SA_RESETHAND clears the handler when the signal is delivered.
> >   * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
> >   * SA_NODEFER prevents the current signal from being masked in the handler.
> > + * SA_UNSUPPORTED is a flag bit that will never be supported. Kernels from
> > + * before the introduction of SA_UNSUPPORTED did not clear unknown bits from
> > + * sa_flags when read using the oldact argument to sigaction and rt_sigaction,
> > + * so this bit allows flag bit support to be detected from userspace while
> > + * allowing an old kernel to be distinguished from a kernel that supports every
> > + * flag bit.
> >   *
> >   * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
> >   * Unix names RESETHAND and NODEFER respectively.
> > @@ -42,6 +48,7 @@
> >   * The following bits are used in architecture-specific SA_* definitions and
> >   * should be avoided for new generic flags: 3, 4, 5, 6, 7, 8, 9, 16, 24, 25, 26.
> >   */
> > +#define SA_UNSUPPORTED       0x00000400
>
> This concept confused me a bit initially, since in a sense this flag is
> supported, just with a rather peculiar meaning.

Hmm. Maybe it should be named "SA_UNKNOWN" to mean that the bit will
always be "unknown" to the kernel in the sense that it shall be
treated in the same way as any other "unknown" bit. Then we can define
the kernel's behavior in terms of what happens if a bit is "known". I
don't know if this is just shuffling terms around though. At any rate,
this seems like a problem to be solved with documentation.

> Since the main (only) purpose of this bit will be to check whether

I wouldn't necessarily say that it is the only purpose. If another new
sa_flags bit were to be introduced in the future, SA_UN(whatever)
could be used to detect kernel support for that bit in the same way as
SA_XFLAGS.

> SA_XFLAGS is actually supported, I wonder whether it makes sense to weld
> the two together, say:
>
> #define SA_REQUEST_XFLAGS       0x00000c00
> #define SA_XFLAGS_MASK          0x00000c00
> #define SA_HAVE_XFLAGS          0x00000800
>
> This is a departure from the current style of definitions though.
>
>         sa.sa_flags |= SA_REQUEST_XFLAGS;
>         sigaction(..., &sa, &sa);
>         if ((sa.sa_flags & SA_XFLAGS_MASK) == SA_HAVE_XFLAGS)
>                 /* xflags available */
>
>
> This would require some juggling of the way SA_UAPI_FLAGS works though.
> Maybe not worth it, so long as the semantics get clearly documented.

I'm not sure about this. I personally think that it would be clearer
to keep the flags orthogonal.

Peter

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B6F250DD5
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Aug 2020 02:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgHYAvs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 24 Aug 2020 20:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgHYAvq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 24 Aug 2020 20:51:46 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78C8C061574
        for <linux-parisc@vger.kernel.org>; Mon, 24 Aug 2020 17:51:46 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id u131so2891813vsu.11
        for <linux-parisc@vger.kernel.org>; Mon, 24 Aug 2020 17:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PeVX8ExeWwDlQ+laxgTBiqAfQ/O+O4FDMxG7WD+zKK0=;
        b=L9h5coovd8vtz3aBDLTv1PLj2Yc8DL3ZPNz2omm8yLbtaFi3i56/55qG2DOF4wdkji
         YtzhppudYb/sbFm6A0faRwUZGBS7004q00J4vS9w34DaLgzyaGLS71RS4ZmPzslxNxvc
         rao60wmKonf4Bn0f9vQ9Yt0c8WLn0uVQDE7toqlX4bLl77rPL3SO/xsGn2TfBvgIQ2bE
         X9HgmRR1jBfVBzEZQQBqlFSY9ci3Lt+b07mpKM6hSE+YFw29xp5cWuNtC161AOVg6vBe
         fXnqUiC/smyQgkiO6lU8G13OMmo/M8tp4rHGzM4HYomOeOC9Hp3OfIWBqSd5+bPXm8d2
         8oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PeVX8ExeWwDlQ+laxgTBiqAfQ/O+O4FDMxG7WD+zKK0=;
        b=lfJLwigayuC7Tcg30snZ9WOLIXiXPKphp5k4MNlXktrMRls3ET36puBQGDJrtoCWym
         P8l6Mk7kph8fFL1NQ2vTkGu57T7xFS/K4CzvLEvSsBr1oNxL1ZSWPLNy4VOBgQFVHY98
         WD2k+x8fzA90sDRGrHhrAJgVLKnXMzLU+ESUBL84odOjiI0uMbDjd4Dvc8de/y36sNY+
         YYtBLfr4VsxqssnSRgHxSBfNkrKl+jQKgWUEEmOY+BtCiGbC5KQNR1x4C7SUXhygEQvu
         oGzXLaOMOWk4a9XRsaEKVpGh3+vIEs65O9wn3LZL9jBbPX3XiORDis0G/4Ar5CKYaeil
         +SMw==
X-Gm-Message-State: AOAM531YepamQN4yTjDwORL12Ga+evLkloVZ3/QbQNt0ODqsQTicOQmG
        A220Db+pNDzhGuDilCznaSRBh/p2fBfhS3tOygPsEA==
X-Google-Smtp-Source: ABdhPJx2u/0Uy+pEUKVf9JhHTTFHZwN8dME63LkC7/YYv5RF6d2VMzLNB+CC9fOmbp07M00Ixm8RLqTAkFBC9rgQvJk=
X-Received: by 2002:a67:f5ce:: with SMTP id t14mr4458139vso.240.1598316705361;
 Mon, 24 Aug 2020 17:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597720138.git.pcc@google.com> <68bd2d6544fb17bbe2fb90862e28ec38e079549a.1597720138.git.pcc@google.com>
 <20200819103948.GF6642@arm.com> <CAMn1gO5dW8MyPyOvZKk0Au8ggeqJA=mkvZpXZDWuJDLuZh2Fpg@mail.gmail.com>
 <20200824134000.GK6642@arm.com>
In-Reply-To: <20200824134000.GK6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Mon, 24 Aug 2020 17:51:34 -0700
Message-ID: <CAMn1gO59zV1QNNf9pLyQfp87xL0OR3eZgP9izn6m8xQSv6dNEg@mail.gmail.com>
Subject: Re: [PATCH v9 3/6] signal: clear non-uapi flag bits when
 passing/returning sa_flags
To:     Dave Martin <Dave.Martin@arm.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Oleg Nesterov <oleg@redhat.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Kostya Serebryany <kcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        David Spickett <david.spickett@linaro.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>,
        Evgenii Stepanov <eugenis@google.com>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Aug 24, 2020 at 6:40 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Wed, Aug 19, 2020 at 04:39:53PM -0700, Peter Collingbourne wrote:
> > On Wed, Aug 19, 2020 at 3:39 AM Dave Martin <Dave.Martin@arm.com> wrote:
> > >
> > > On Mon, Aug 17, 2020 at 08:33:48PM -0700, Peter Collingbourne wrote:
> > >
> > > Nit: please say what the patch does.  Subject line should summarise
> > > what is done, but should not add new information that is not present in
> > > the description proper.
> > >
> > > (Same for all the other patches.)
> >
> > Will do.
>
> Thanks
>
> [...]
>
> > > > diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
> > > > index 65530a042009..d1070a783993 100644
> > > > --- a/arch/arm/include/asm/signal.h
> > > > +++ b/arch/arm/include/asm/signal.h
> > > > @@ -17,6 +17,10 @@ typedef struct {
> > > >       unsigned long sig[_NSIG_WORDS];
> > > >  } sigset_t;
> > > >
> > > > +#define SA_UAPI_FLAGS                                                          \
> > > > +     (SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_THIRTYTWO |             \
> > > > +      SA_RESTORER | SA_ONSTACK | SA_RESTART | SA_NODEFER | SA_RESETHAND)
> > > > +
> > >
> > > I wonder whether all these per-arch definitions will tend to bitrot when
> > > people add new common flags.
> > >
> > > Can we have a common definition for the common bits, and just add the
> > > extra arch-specific ones here?
> >
> > I think so. We could have something like:
> >
> > #define ARCH_UAPI_SA_FLAGS SA_THIRTYTWO
> >
> > here. Then in signal_types.h we can do:
> >
> > #ifndef ARCH_UAPI_SA_FLAGS
> > #define ARCH_UAPI_SA_FLAGS 0
> > #endif
> >
> > #define UAPI_SA_FLAGS (... | ARCH_UAPI_SA_FLAGS)
> >
> > I'll do that in v10.
>
> Yes, something like that would be fine, I should think.
>
> > > Also, I wonder whether we should avoid the "SA_" prefix here.  Maybe
> > > UAPI_SA_FLAGS?
> >
> > Sounds good to me.
>
> OK, great.
>
> [...]
>
> > > > diff --git a/kernel/signal.c b/kernel/signal.c
> > > > index 42b67d2cea37..348b7981f1ff 100644
> > > > --- a/kernel/signal.c
> > > > +++ b/kernel/signal.c
> > > > @@ -3984,6 +3984,16 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
> > > >       if (oact)
> > > >               *oact = *k;
> > > >
> > > > +     /*
> > > > +      * Clear unknown flag bits in order to allow userspace to detect missing
> > > > +      * support for flag bits and to allow the kernel to use non-uapi bits
> > > > +      * internally.
> > > > +      */
> > > > +     if (act)
> > > > +             act->sa.sa_flags &= SA_UAPI_FLAGS;
> > > > +     if (oact)
> > > > +             oact->sa.sa_flags &= SA_UAPI_FLAGS;
> > > > +
> > >
> > > Seems reasonable.
> >
> > Thanks. I also decided to check how other operating systems handle
> > unknown flag bits in sigaction.sa_flags. It looks like OpenBSD and
> > illumos also accept unknown bits but (implicitly, as a result of using
> > a different internal representation) end up clearing them in oldact:
> >
> > https://github.com/openbsd/src/blob/f634a6a4b5bf832e9c1de77f7894ae2625e74484/sys/kern/kern_sig.c#L278
> > https://github.com/illumos/illumos-gate/blob/76f19f5fdc974fe5be5c82a556e43a4df93f1de1/usr/src/uts/common/syscall/sigaction.c#L86

XNU does the same:

https://github.com/apple/darwin-xnu/blob/a449c6a3b8014d9406c2ddbdc81795da24aa7443/bsd/kern/kern_sig.c#L480

> >
> > and FreeBSD and NetBSD fail the syscall if unknown bits are set:
> >
> > https://github.com/freebsd/freebsd/blob/eded70c37057857c6e23fae51f86b8f8f43cd2d0/sys/kern/kern_sig.c#L699
> > https://github.com/NetBSD/src/blob/3365779becdcedfca206091a645a0e8e22b2946e/sys/kern/sys_sig.c#L473
> >
> > So there is some precedent for doing what we're planning to do here,
> > which makes it yet more likely that we'll be okay doing this.
>
> Ack, it's good to have that extra evidence to support this approach.
>
> This also means that other OSes could adopt the new Linux flag(s) with
> comatible semantics, if they wanted to.  Or have I misunderstood
> something there?

The other OSs could adopt SA_XFLAGS, but they would probably have no
need for SA_UNSUPPORTED because they already have a protocol for
detecting missing flag support in the kernel (Linux is really the odd
one out here in not supporting such a protocol from the start).
Userspace programs running on OpenBSD, illumos and XNU could use the
Linux protocol without the SA_UNSUPPORTED part, while programs running
on FreeBSD and NetBSD could do something like:

static bool has_xflags = true;
[...]
struct sigaction act;
act.sa_flags = SA_SIGINFO | SA_XFLAGS;
if (sigaction(SIGSEGV, &act, 0) != 0) {
  has_xflags = false;
  act.sa_flags = SA_SIGINFO;
  if (sigaction(SIGSEGV, &act, 0) != 0)
    perror("sigaction");
}

It would probably be possible to write a unified function that would
support all three protocols.

Peter

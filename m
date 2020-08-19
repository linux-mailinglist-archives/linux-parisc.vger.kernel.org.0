Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4B024A9FE
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Aug 2020 01:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgHSXkI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Aug 2020 19:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgHSXkI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Aug 2020 19:40:08 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A5AC061757
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 16:40:07 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id y8so223386vsq.8
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 16:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KhiCG1w9GuR0gbWinCTK5o/KvX/CL8jWKufJDJ+qAqY=;
        b=m+JdwNcJonu4+ObU6gfwHqeAIyM7d+7C7UGfcWp2mXREHaVOQq5MgAM8Kot1Zul/Is
         KeWLoR9j3TN2vdPcvqwoHYPxcuMvLwVjcyz9mJsCGmP3oUtv4hJr35uRiRM0bu1dDYw+
         evWES2ktlkTpnKu/3iIBYVHJtwPKmlLhQKS+S52vXmEypX4xOqOZ8wBSlF0LQm0ZsB7d
         j29VCucJKCVHfTQJC3MPjTRUrEC5wvUKqCWgIA7qlzpATEGgcvAK4fe2LlD64U5va9GH
         r05LSr4hLihPjEFWIa0EX2GG4CGwwPtFREw93GGWPdo/bU+vunL3uMHJ7Y7gutXezPH7
         Jywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KhiCG1w9GuR0gbWinCTK5o/KvX/CL8jWKufJDJ+qAqY=;
        b=I/lOSYRZhRE3M+8+ViZJ+HxVINF3EeUYwz2fqE8RvlLHzjlhkcqCtpiTrXr265CPap
         /mtyLBOPtWRwzB3buv9byjEwHv7rj8t6XHZZjjUxvI/XjfMlhyS3g5FzQTHvHMLjcwVz
         p5p+GmeY8Enu/Wm6RSdjBuaOBWgq92Yob74UBRf6skF9wFDCkGpuAydJXeDvDY17dd+N
         WarrpefouFDBn3ELeX5Z7OUcvX5iJPenxcP3+gdOD37aNPqEHXyltcLqY0BdvzHFOxcL
         /uvbY6pHQzpm1ZDrJBjLUAxsnovSN47yM3KWlbvBg9yR6bgLK5g2Rus4nT3bZPz4eToY
         Kbww==
X-Gm-Message-State: AOAM530E4U9o2jI8DJrw17RmYvIw3aermtWiCqeahlQwBD1n9DugQRja
        i6Lj13y9GUrKwqWgKW/ovwoGvAQzsCJj89V7FrFCIQ==
X-Google-Smtp-Source: ABdhPJysZE+IyEq37xBzcwadGupZNoKlhwL4mOGmNYvVh9lUJ678hgZFOOse2O7iOHBUFhLN//pTCVNt2FBoxVbA/Js=
X-Received: by 2002:a67:69c3:: with SMTP id e186mr455373vsc.20.1597880405201;
 Wed, 19 Aug 2020 16:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597720138.git.pcc@google.com> <68bd2d6544fb17bbe2fb90862e28ec38e079549a.1597720138.git.pcc@google.com>
 <20200819103948.GF6642@arm.com>
In-Reply-To: <20200819103948.GF6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Wed, 19 Aug 2020 16:39:53 -0700
Message-ID: <CAMn1gO5dW8MyPyOvZKk0Au8ggeqJA=mkvZpXZDWuJDLuZh2Fpg@mail.gmail.com>
Subject: Re: [PATCH v9 3/6] signal: clear non-uapi flag bits when
 passing/returning sa_flags
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

On Wed, Aug 19, 2020 at 3:39 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Mon, Aug 17, 2020 at 08:33:48PM -0700, Peter Collingbourne wrote:
>
> Nit: please say what the patch does.  Subject line should summarise
> what is done, but should not add new information that is not present in
> the description proper.
>
> (Same for all the other patches.)

Will do.

> > This allows userspace to detect missing support for flag bits and
> > allows the kernel to use non-uapi bits internally, as we are already
> > doing in arch/x86 for two flag bits. Now that this change is in
> > place, we no longer need the code in arch/x86 that was hiding these
> > bits from userspace, so remove it.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > View this change in Gerrit: https://linux-review.googlesource.com/q/I35aab6f5be932505d90f3b3450c083b4db1eca86
> >
> >  arch/arm/include/asm/signal.h    |  4 ++++
> >  arch/parisc/include/asm/signal.h |  4 ++++
> >  arch/x86/kernel/signal_compat.c  |  7 -------
> >  include/linux/signal_types.h     | 12 ++++++++++++
> >  kernel/signal.c                  | 10 ++++++++++
> >  5 files changed, 30 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
> > index 65530a042009..d1070a783993 100644
> > --- a/arch/arm/include/asm/signal.h
> > +++ b/arch/arm/include/asm/signal.h
> > @@ -17,6 +17,10 @@ typedef struct {
> >       unsigned long sig[_NSIG_WORDS];
> >  } sigset_t;
> >
> > +#define SA_UAPI_FLAGS                                                          \
> > +     (SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_THIRTYTWO |             \
> > +      SA_RESTORER | SA_ONSTACK | SA_RESTART | SA_NODEFER | SA_RESETHAND)
> > +
>
> I wonder whether all these per-arch definitions will tend to bitrot when
> people add new common flags.
>
> Can we have a common definition for the common bits, and just add the
> extra arch-specific ones here?

I think so. We could have something like:

#define ARCH_UAPI_SA_FLAGS SA_THIRTYTWO

here. Then in signal_types.h we can do:

#ifndef ARCH_UAPI_SA_FLAGS
#define ARCH_UAPI_SA_FLAGS 0
#endif

#define UAPI_SA_FLAGS (... | ARCH_UAPI_SA_FLAGS)

I'll do that in v10.

> Also, I wonder whether we should avoid the "SA_" prefix here.  Maybe
> UAPI_SA_FLAGS?

Sounds good to me.

>
> >  #define __ARCH_HAS_SA_RESTORER
> >
> >  #include <asm/sigcontext.h>
> > diff --git a/arch/parisc/include/asm/signal.h b/arch/parisc/include/asm/signal.h
> > index 715c96ba2ec8..ad06e14f6e8a 100644
> > --- a/arch/parisc/include/asm/signal.h
> > +++ b/arch/parisc/include/asm/signal.h
> > @@ -21,6 +21,10 @@ typedef struct {
> >       unsigned long sig[_NSIG_WORDS];
> >  } sigset_t;
> >
> > +#define SA_UAPI_FLAGS                                                          \
> > +     (SA_ONSTACK | SA_RESETHAND | SA_NOCLDSTOP | SA_SIGINFO | SA_NODEFER |  \
> > +      SA_RESTART | SA_NOCLDWAIT | _SA_SIGGFAULT)
> > +
> >  #include <asm/sigcontext.h>
> >
> >  #endif /* !__ASSEMBLY */
> > diff --git a/arch/x86/kernel/signal_compat.c b/arch/x86/kernel/signal_compat.c
> > index 9ccbf0576cd0..c599013ae8cb 100644
> > --- a/arch/x86/kernel/signal_compat.c
> > +++ b/arch/x86/kernel/signal_compat.c
> > @@ -165,16 +165,9 @@ void sigaction_compat_abi(struct k_sigaction *act, struct k_sigaction *oact)
> >  {
> >       signal_compat_build_tests();
> >
> > -     /* Don't leak in-kernel non-uapi flags to user-space */
> > -     if (oact)
> > -             oact->sa.sa_flags &= ~(SA_IA32_ABI | SA_X32_ABI);
> > -
> >       if (!act)
> >               return;
> >
> > -     /* Don't let flags to be set from userspace */
> > -     act->sa.sa_flags &= ~(SA_IA32_ABI | SA_X32_ABI);
> > -
> >       if (in_ia32_syscall())
> >               act->sa.sa_flags |= SA_IA32_ABI;
> >       if (in_x32_syscall())
> > diff --git a/include/linux/signal_types.h b/include/linux/signal_types.h
> > index f8a90ae9c6ec..e792f29b5846 100644
> > --- a/include/linux/signal_types.h
> > +++ b/include/linux/signal_types.h
> > @@ -68,4 +68,16 @@ struct ksignal {
> >       int sig;
> >  };
> >
> > +#ifndef SA_UAPI_FLAGS
> > +#ifdef SA_RESTORER
> > +#define SA_UAPI_FLAGS                                                          \
> > +     (SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
> > +      SA_NODEFER | SA_RESETHAND | SA_RESTORER)
> > +#else
> > +#define SA_UAPI_FLAGS                                                          \
> > +     (SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
> > +      SA_NODEFER | SA_RESETHAND)
> > +#endif
> > +#endif
> > +
> >  #endif /* _LINUX_SIGNAL_TYPES_H */
> > diff --git a/kernel/signal.c b/kernel/signal.c
> > index 42b67d2cea37..348b7981f1ff 100644
> > --- a/kernel/signal.c
> > +++ b/kernel/signal.c
> > @@ -3984,6 +3984,16 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
> >       if (oact)
> >               *oact = *k;
> >
> > +     /*
> > +      * Clear unknown flag bits in order to allow userspace to detect missing
> > +      * support for flag bits and to allow the kernel to use non-uapi bits
> > +      * internally.
> > +      */
> > +     if (act)
> > +             act->sa.sa_flags &= SA_UAPI_FLAGS;
> > +     if (oact)
> > +             oact->sa.sa_flags &= SA_UAPI_FLAGS;
> > +
>
> Seems reasonable.

Thanks. I also decided to check how other operating systems handle
unknown flag bits in sigaction.sa_flags. It looks like OpenBSD and
illumos also accept unknown bits but (implicitly, as a result of using
a different internal representation) end up clearing them in oldact:

https://github.com/openbsd/src/blob/f634a6a4b5bf832e9c1de77f7894ae2625e74484/sys/kern/kern_sig.c#L278
https://github.com/illumos/illumos-gate/blob/76f19f5fdc974fe5be5c82a556e43a4df93f1de1/usr/src/uts/common/syscall/sigaction.c#L86

and FreeBSD and NetBSD fail the syscall if unknown bits are set:

https://github.com/freebsd/freebsd/blob/eded70c37057857c6e23fae51f86b8f8f43cd2d0/sys/kern/kern_sig.c#L699
https://github.com/NetBSD/src/blob/3365779becdcedfca206091a645a0e8e22b2946e/sys/kern/sys_sig.c#L473

So there is some precedent for doing what we're planning to do here,
which makes it yet more likely that we'll be okay doing this.

Peter

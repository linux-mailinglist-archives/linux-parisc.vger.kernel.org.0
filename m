Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F251124FF18
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Aug 2020 15:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgHXNkY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 24 Aug 2020 09:40:24 -0400
Received: from foss.arm.com ([217.140.110.172]:34190 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727066AbgHXNkG (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 24 Aug 2020 09:40:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F2971FB;
        Mon, 24 Aug 2020 06:40:05 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DAC63F66B;
        Mon, 24 Aug 2020 06:40:03 -0700 (PDT)
Date:   Mon, 24 Aug 2020 14:40:01 +0100
From:   Dave Martin <Dave.Martin@arm.com>
To:     Peter Collingbourne <pcc@google.com>
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
Subject: Re: [PATCH v9 3/6] signal: clear non-uapi flag bits when
 passing/returning sa_flags
Message-ID: <20200824134000.GK6642@arm.com>
References: <cover.1597720138.git.pcc@google.com>
 <68bd2d6544fb17bbe2fb90862e28ec38e079549a.1597720138.git.pcc@google.com>
 <20200819103948.GF6642@arm.com>
 <CAMn1gO5dW8MyPyOvZKk0Au8ggeqJA=mkvZpXZDWuJDLuZh2Fpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO5dW8MyPyOvZKk0Au8ggeqJA=mkvZpXZDWuJDLuZh2Fpg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Aug 19, 2020 at 04:39:53PM -0700, Peter Collingbourne wrote:
> On Wed, Aug 19, 2020 at 3:39 AM Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Mon, Aug 17, 2020 at 08:33:48PM -0700, Peter Collingbourne wrote:
> >
> > Nit: please say what the patch does.  Subject line should summarise
> > what is done, but should not add new information that is not present in
> > the description proper.
> >
> > (Same for all the other patches.)
> 
> Will do.

Thanks

[...]

> > > diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
> > > index 65530a042009..d1070a783993 100644
> > > --- a/arch/arm/include/asm/signal.h
> > > +++ b/arch/arm/include/asm/signal.h
> > > @@ -17,6 +17,10 @@ typedef struct {
> > >       unsigned long sig[_NSIG_WORDS];
> > >  } sigset_t;
> > >
> > > +#define SA_UAPI_FLAGS                                                          \
> > > +     (SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_THIRTYTWO |             \
> > > +      SA_RESTORER | SA_ONSTACK | SA_RESTART | SA_NODEFER | SA_RESETHAND)
> > > +
> >
> > I wonder whether all these per-arch definitions will tend to bitrot when
> > people add new common flags.
> >
> > Can we have a common definition for the common bits, and just add the
> > extra arch-specific ones here?
> 
> I think so. We could have something like:
> 
> #define ARCH_UAPI_SA_FLAGS SA_THIRTYTWO
> 
> here. Then in signal_types.h we can do:
> 
> #ifndef ARCH_UAPI_SA_FLAGS
> #define ARCH_UAPI_SA_FLAGS 0
> #endif
> 
> #define UAPI_SA_FLAGS (... | ARCH_UAPI_SA_FLAGS)
> 
> I'll do that in v10.

Yes, something like that would be fine, I should think.

> > Also, I wonder whether we should avoid the "SA_" prefix here.  Maybe
> > UAPI_SA_FLAGS?
> 
> Sounds good to me.

OK, great.

[...]

> > > diff --git a/kernel/signal.c b/kernel/signal.c
> > > index 42b67d2cea37..348b7981f1ff 100644
> > > --- a/kernel/signal.c
> > > +++ b/kernel/signal.c
> > > @@ -3984,6 +3984,16 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
> > >       if (oact)
> > >               *oact = *k;
> > >
> > > +     /*
> > > +      * Clear unknown flag bits in order to allow userspace to detect missing
> > > +      * support for flag bits and to allow the kernel to use non-uapi bits
> > > +      * internally.
> > > +      */
> > > +     if (act)
> > > +             act->sa.sa_flags &= SA_UAPI_FLAGS;
> > > +     if (oact)
> > > +             oact->sa.sa_flags &= SA_UAPI_FLAGS;
> > > +
> >
> > Seems reasonable.
> 
> Thanks. I also decided to check how other operating systems handle
> unknown flag bits in sigaction.sa_flags. It looks like OpenBSD and
> illumos also accept unknown bits but (implicitly, as a result of using
> a different internal representation) end up clearing them in oldact:
> 
> https://github.com/openbsd/src/blob/f634a6a4b5bf832e9c1de77f7894ae2625e74484/sys/kern/kern_sig.c#L278
> https://github.com/illumos/illumos-gate/blob/76f19f5fdc974fe5be5c82a556e43a4df93f1de1/usr/src/uts/common/syscall/sigaction.c#L86
> 
> and FreeBSD and NetBSD fail the syscall if unknown bits are set:
> 
> https://github.com/freebsd/freebsd/blob/eded70c37057857c6e23fae51f86b8f8f43cd2d0/sys/kern/kern_sig.c#L699
> https://github.com/NetBSD/src/blob/3365779becdcedfca206091a645a0e8e22b2946e/sys/kern/sys_sig.c#L473
> 
> So there is some precedent for doing what we're planning to do here,
> which makes it yet more likely that we'll be okay doing this.

Ack, it's good to have that extra evidence to support this approach.

This also means that other OSes could adopt the new Linux flag(s) with
comatible semantics, if they wanted to.  Or have I misunderstood
something there?

Cheers
---Dave

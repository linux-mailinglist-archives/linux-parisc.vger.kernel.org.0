Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668EC24FF7B
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Aug 2020 16:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHXOD1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 24 Aug 2020 10:03:27 -0400
Received: from foss.arm.com ([217.140.110.172]:34632 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgHXODY (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 24 Aug 2020 10:03:24 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D68A81FB;
        Mon, 24 Aug 2020 07:03:23 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0156B3F71F;
        Mon, 24 Aug 2020 07:03:21 -0700 (PDT)
Date:   Mon, 24 Aug 2020 15:03:19 +0100
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
Subject: Re: [PATCH v9 5/6] signal: define the field siginfo.si_xflags
Message-ID: <20200824140319.GM6642@arm.com>
References: <cover.1597720138.git.pcc@google.com>
 <e26271d2b3767cdbd265033e6f7eb28f828f3a28.1597720138.git.pcc@google.com>
 <20200819154028.GH6642@arm.com>
 <CAMn1gO5DebvFmUPcY=i_wKNZpdaybpCOdbZrDPsTQ32N5UQg7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO5DebvFmUPcY=i_wKNZpdaybpCOdbZrDPsTQ32N5UQg7g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Aug 19, 2020 at 06:37:25PM -0700, Peter Collingbourne wrote:
> On Wed, Aug 19, 2020 at 8:40 AM Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Mon, Aug 17, 2020 at 08:33:50PM -0700, Peter Collingbourne wrote:
> > > This field will contain flags that may be used by signal handlers to
> > > determine whether other fields in the _sigfault portion of siginfo are
> > > valid. An example use case is the following patch, which introduces
> > > the si_addr_ignored_bits{,_mask} fields.
> > >
> > > A new sigcontext flag, SA_XFLAGS, is introduced in order to allow
> > > a signal handler to require the kernel to set the field (but note
> > > that the field will be set anyway if the kernel supports the flag,
> > > regardless of its value). In combination with the previous patches,
> > > this allows a userspace program to determine whether the kernel will
> > > set the field.
> > >
> > > Ideally this field could have just been named si_flags, but that
> > > name was already taken by ia64, so a different name was chosen.
> > >
> > > Alternatively, we may consider making ia64's si_flags a generic field
> > > and having it appear at the end of _sigfault (in the same place as
> > > this patch has si_xflags) on non-ia64, keeping it in the same place
> > > on ia64. ia64's si_flags is a 32-bit field with only one flag bit
> > > allocated, so we would have 31 bits to use if we do this.
> >
> > For clarity, is the new si_xflags field supposed to be valid for all
> > signal types, or just certain signals and si_codes?
> 
> It is intended to be valid for all signal types that use the _sigfault
> union member of siginfo. As listed in siginfo.h these are: SIGILL,
> SIGFPE, SIGSEGV, SIGBUS, SIGTRAP, SIGEMT.

SIGSYS is similar to SIGILL, is that included also?

> > What happens for things like a rt_sigqueueinfo() from userspace?
> 
> Hmm. Let's enumerate each of these things, which I believe are all of
> the call sites of the function copy_siginfo_from_user and related
> functions (correct me if I'm wrong):
> 
> - ptrace(PTRACE_SETSIGINFO)
> - pidfd_send_signal
> - rt_sigqueueinfo
> - rt_tgsigqueueinfo
> 
> We can handle the last three by observing that the kernel forbids
> sending a signal with these syscalls if si_code >= 0, so we can say
> that the value of si_xflags is only valid if si_code >= 0.

Hmmm, that's what the code says (actually >= 0 or SI_TKILL), but it's
illogical.  Those are user signals, so there's no obvious reason why
userspace shouldn't be allowed to generate their siginfo.  It would
probably be better for the kernel to police si_pid etc. in the SI_USER
and SI_TKILL cases rather than flatly refusing, but I guess that's a
discussion for another day.

I guess the combination of SI_FROMKERNEL() and the signal number being a
known fault signal if probably sufficient for now.


It might be helpful to have a helper to identify fault signals, but we
don't have this today, and it's unlikely that a new kind of fault signal
will crop up any time soon.

Handlers that handle specific signal types won't care, but debuggers and
generic backtracer code would have to be hand-hacked to add new kinds of
fault signal today -- not a huge priority though, and orthogonal to this
series.

> As for the first one, it's more tricky. Arguably something like a
> debugger should be able to send arbitrary signals to a debuggee, and
> there's no reason why it shouldn't be able to set si_xflags in
> siginfo, but on the other hand who knows how existing debuggers end up
> setting this field today. Maybe all that we can do is have the kernel
> clear si_xflags if it detects that the signal uses _sigfault, and let
> si_xflags aware debuggers opt out of this behavior, perhaps by
> introducing a PTRACE_SETSIGINFO2 or something.

Most likely a debugger usually amends an existing siginfo from a trapped
signal than generating a new one from scratch.

Given the other things that ptrace can do to the target process I don't
think we need to police here, but your suggestion about a
PTRACE_SETSIGINFO2 or similar, and zeroing this field by default with
PTRACE_SETSIGINFO, does make sense.

[...]

> > > diff --git a/kernel/signal.c b/kernel/signal.c
> > > index 664a6c31137e..72182eed1b8d 100644
> > > --- a/kernel/signal.c
> > > +++ b/kernel/signal.c

[...]

> > > @@ -3377,6 +3389,7 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
> > >               to->si_trapno = from->si_trapno;
> > >  #endif
> > >               to->si_addr_lsb = from->si_addr_lsb;
> > > +             to->si_xflags = from->si_xflags;
> > >               break;
> > >       case SIL_FAULT_BNDERR:
> > >               to->si_addr = compat_ptr(from->si_addr);
> > > @@ -3385,6 +3398,7 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
> > >  #endif
> > >               to->si_lower = compat_ptr(from->si_lower);
> > >               to->si_upper = compat_ptr(from->si_upper);
> > > +             to->si_xflags = from->si_xflags;
> > >               break;
> > >       case SIL_FAULT_PKUERR:
> > >               to->si_addr = compat_ptr(from->si_addr);
> > > @@ -3392,6 +3406,7 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
> > >               to->si_trapno = from->si_trapno;
> > >  #endif
> > >               to->si_pkey = from->si_pkey;
> > > +             to->si_xflags = from->si_xflags;
> >
> > How did you figure out the list of places to make these changes?  I'm
> > not sure how to confirm that it's exhaustive.
> 
> I looked for all places in the kernel where the si_addr field was
> being assigned to (basically: git grep '\bsi_addr\s*=') and added my
> code there.
> 
> > It's a shame if we can't simply apply the change in one place.
> > Would the refactoring be too invasive to accomplish that?
> 
> I believe that Eric mentioned that kernel/signal.c is supposed to be
> "the" file that knows about all of the fields of siginfo (I'm not sure
> what's going on in arch/powerpc, I think that's a recent regression).
> Maybe it's possible to eliminate the duplication between the various
> SIL_FAULT* cases, but aside from that it looks like there wouldn't be
> much duplication in the rest of the code.

If it's all contained in signal.c I guess it's not quite so bad,
especially if powerpc can be brought back into the fold.

Cheers
---Dave

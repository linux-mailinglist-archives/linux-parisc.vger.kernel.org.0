Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B362834A0
	for <lists+linux-parisc@lfdr.de>; Mon,  5 Oct 2020 13:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgJELG6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 5 Oct 2020 07:06:58 -0400
Received: from foss.arm.com ([217.140.110.172]:44228 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgJELG6 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 5 Oct 2020 07:06:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2000D106F;
        Mon,  5 Oct 2020 04:06:57 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D21B3F66B;
        Mon,  5 Oct 2020 04:06:55 -0700 (PDT)
Date:   Mon, 5 Oct 2020 12:06:52 +0100
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
Subject: Re: [PATCH v10 2/7] arch: move SA_* definitions to generic headers
Message-ID: <20201005110651.GR6642@arm.com>
References: <cover.1598072840.git.pcc@google.com>
 <f5b9b91e7401d82c899fb6d1bb7fb2158103e5f3.1598072840.git.pcc@google.com>
 <20200908151223.GS6642@arm.com>
 <CAMn1gO7uBVL64KPv947AKSoOv9F1ghXkyB+c2St6g-pQnVPHDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO7uBVL64KPv947AKSoOv9F1ghXkyB+c2St6g-pQnVPHDQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Oct 02, 2020 at 06:14:01PM -0700, Peter Collingbourne wrote:
> On Tue, Sep 8, 2020 at 8:12 AM Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Fri, Aug 21, 2020 at 10:10:12PM -0700, Peter Collingbourne wrote:
> > > Most architectures with the exception of alpha, mips, parisc and
> > > sparc use the same values for these flags. Move their definitions into
> > > asm-generic/signal-defs.h and allow the architectures with non-standard
> > > values to override them. Also, document the non-standard flag values
> > > in order to make it easier to add new generic flags in the future.
> > >
> > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> >
> > While this looks reasonable, I've just realised that you strip the "U"
> > from some arches' definitions here.
> >
> > So, on powerpc and x86, this changes the type of flags other than
> > SA_RESETHAND from unsigned int to int.
> >
> > While I can't see this breaking any sensible use of these flags, there's
> > a chance that there is software relying on this distinction by
> > accident.
> 
> While it's true that it's technically possible that making these
> signed could change semantics, I'm having trouble seeing a realistic
> way in which software could be relying on this. Can you see one? I can
> think of cases like if the code does something like left shifts one of
> the flag bits into the sign bit (technically undefined behavior) and
> then right shifts it back (in C this would need to all be done in a
> single expression without storing to a variable; in C++ I suppose you
> could use auto to preserve the signedness in a variable's type). For
> example:
> 
> int x = (SA_NODEFER << 1) >> 1;
> 
> would give a different value to x if we made SA_NODEFER signed. But I
> wouldn't really expect software to be doing this sort of thing even
> accidentally, or much more than or'ing the flags together and
> assigning them to a variable, or passing them as a parameter, or some
> other operation which would fix the type.

I couldn't come up with a very good, non-contrived example I admit.

> I believe that the kernel's uapi guarantee applies at the binary
> level, not at the source level. If that were not the case, I think we
> would not be allowed to add any new declaration to an existing .h file
> for fear of conflicting with a user program's identically spelled
> declaration. And that seems more likely to me than software that would
> do this sort of thing.

The behaviour of source code making legitimate use of the kernel headers
still shouldn't be changed without good reason, especially if the change
could lead to subtle bugs that the compiler won't detect.

However this doesn't mean that decrufting unintentional inconsistencies
in the headers is a bad idea ... and see my response below.

> > I wonder whether it's worth doing something like
> >
> >         #ifdef ARCH_WANT_STRICTLY_UNSIGNED_SA_FLAGS
> >         #define __SA_FLAG_VAL(x) x ## U
> >         #else
> >         #define __SA_FLAG_VAL(x) x
> >         #endif
> >
> >         #ifndef SA_NOCLDSTOP
> >         #define SA_NOCLDSTOP __SA_FLAG_VAL(0x00000001)
> >         #endif
> >
> >         /* ... */
> 
> If we do this I would mildly prefer to keep the existing #defines in
> the arch-specific headers as if the arch had different flag values, as
> this would leave the arch-specific legacy cruft in the arch-specific
> headers where it belongs.
> 
> > Mind you, the historical situation also has issues, e.g. because
> > sa_flags in struct sigaction is an int, assigning
> >
> >         struct sigaction sa;
> >
> >         sa.sa_flags = SA_RESETHAND;
> >
> > implies an overflow and so isn't portably safe (at least in theory).  I
> > guess we are getting away with it today.  Preserving the situation by
> > keeping the "U"s where appropriate would at least avoid making the
> > situation worse.
> 
> I believe that the result of this assignment (involving an unsigned to
> signed conversion) is implementation defined and not undefined (which
> would be problematic). And in all the implementations that matter, as
> well as the C++ standard starting with C++20, this is a no-op cast
> assuming two's complement. I'm not sure what this has to do with
> making the constants signed because, as you pointed out, SA_RESETHAND
> would remain unsigned despite the absence of 'U' because its value
> does not fit in an int.


I generally agree with your analysis here, and yes, the de facto langue
does define the behaviour for signed integer overflow in practice, even
if the C standards demur on this issue.


I actually got my argument a little backwards: the problem here is not
that SA_RESETHAND unexpectedly becomes a (negative) int, but that the
other values become ints: but those nonetheless remain positive because
they aren't big enough to alias the sign bit.

So the main way for things to go wrong seems to be if the values are
shifted up, as you observe.  But (a) that is a strange thing to do, and
(b) there is an obvious need for a cast if doing things like:

#define ENCODE_SIGNAL(int sig, int flags) ((u64)(flags) << 8 | (sig))

Code lacking the cast would already be wrong, since SA_RESETHAND etc.
would simply get shifted off.


I think it's worth drawing attention to the issue in the commit message,
but if nobody else objects then I guess I am not too concerned about the
change.

Cheers
---Dave

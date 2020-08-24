Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C81724FFC2
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Aug 2020 16:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgHXOXy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 24 Aug 2020 10:23:54 -0400
Received: from foss.arm.com ([217.140.110.172]:34940 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgHXOXy (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 24 Aug 2020 10:23:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAE2A1FB;
        Mon, 24 Aug 2020 07:23:53 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C995F3F71F;
        Mon, 24 Aug 2020 07:23:51 -0700 (PDT)
Date:   Mon, 24 Aug 2020 15:23:49 +0100
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
Subject: Re: [PATCH v9 6/6] arm64: expose FAR_EL1 tag bits in siginfo
Message-ID: <20200824142348.GN6642@arm.com>
References: <cover.1597720138.git.pcc@google.com>
 <9df0de08df310052df01d63bc8bddc5dd71c2bdb.1597720138.git.pcc@google.com>
 <20200819155650.GI6642@arm.com>
 <CAMn1gO5pFUGDLJEWe1uOetz0ohE1-pdWGvz7_XxOMZROOfO=ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO5pFUGDLJEWe1uOetz0ohE1-pdWGvz7_XxOMZROOfO=ag@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Aug 19, 2020 at 06:49:01PM -0700, Peter Collingbourne wrote:
> On Wed, Aug 19, 2020 at 8:56 AM Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Mon, Aug 17, 2020 at 08:33:51PM -0700, Peter Collingbourne wrote:
> > > The kernel currently clears the tag bits (i.e. bits 56-63) in the fault
> > > address exposed via siginfo.si_addr and sigcontext.fault_address. However,
> > > the tag bits may be needed by tools in order to accurately diagnose
> > > memory errors, such as HWASan [1] or future tools based on the Memory
> > > Tagging Extension (MTE).
> > >
> > > We should not stop clearing these bits in the existing fault address
> > > fields, because there may be existing userspace applications that are
> > > expecting the tag bits to be cleared. Instead, create a new pair of
> > > union fields in siginfo._sigfault, and store the tag bits of FAR_EL1
> > > there, together with a mask specifying which bits are valid.
> > >
> > > A flag is added to si_xflags to allow userspace to determine whether
> > > the values in the fields are valid.
> > >
> > > [1] http://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html
> > >
> > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > ---

[...]

> > > diff --git a/kernel/signal.c b/kernel/signal.c
> > > index 72182eed1b8d..1f1e42adc57d 100644
> > > --- a/kernel/signal.c
> > > +++ b/kernel/signal.c

[...]

> > > @@ -1706,7 +1722,9 @@ int send_sig_fault(int sig, int code, void __user *addr
> > >       return send_sig_info(info.si_signo, &info, t);
> > >  }
> > >
> > > -int force_sig_mceerr(int code, void __user *addr, short lsb)
> > > +int force_sig_mceerr(int code, void __user *addr, short lsb,
> > > +                  unsigned long addr_ignored_bits,
> > > +                  unsigned long addr_ignored_bits_mask)
> >
> > Rather than having to pass these extra arguments all over the place, can
> > we just pass the far for addr, and have an arch-specific hook for
> > splitting the ignored from non-ignored bits.  For now at least, I expect
> > that ignored bits mask to be constant for a given platform and kernel.
> 
> That sounds like a good idea. I think that for MTE we will want to
> make it conditional on the si_code (so SEGV_MTESERR would get 0xf <<
> 56 while everything else would get 0xff << 56) so I can hook that up
> at the same time.

OK, I think that's reasonable.

Mind you, we seem to have 3 kinds of bits here, so I'm starting to
wonder whether this is really sufficient:

	1) address bits used in the faulted access
	2) attribute/permission bits used in the faulted access
	3) unavailable bits.

si_addr contains (1).

si_addr_ignored_bits contains (2).

The tag bits from non-MTE faults seem to fall under case (3).  Code that
looks for these bits in si_addr_ignored_bits won't find them.


So perhaps it would make sense to amend the design a bit.  We'd have

	si_addr = address bits only
	si_attr = attribute bits only
	si_attr_mask = mask of valid bits in si_addr

Thinking about it, I've just shortened/changed some named and changed
the meaning of the mask, so it's very similar to what you already have.

The mask of valid bits in si_addr is decided by architectural
convention (i.e., ~0xffUL << 56), but we could also expose

	si_addr_mask = mask of valid bits in si_addr

This is a bit redundant though.  I think people would already assume
that all bits required for classifying the faulting location accurately
must already be provided there.

> 
> > >  {
> > >       struct kernel_siginfo info;
> > >
> > > @@ -1717,7 +1735,9 @@ int force_sig_mceerr(int code, void __user *addr, short lsb)
> > >       info.si_code = code;
> > >       info.si_addr = addr;
> > >       info.si_addr_lsb = lsb;
> > > -     info.si_xflags = 0;
> > > +     info.si_xflags = SI_XFLAG_IGNORED_BITS;
> >
> > Maybe drop the first _, so that this becomes
> >
> >         SIXFLAG_IGNORED_BITS
> >
> > ?  This may help to avoid anyone thinking this might be an si_code
> > value.  Maybe ..._IGNORED_ADDR_BITS would also help make it clearer what
> > this bit is referring to.
> 
> Yes, it should have been spelled the same way as the field name (i.e.
> SIXFLAG_ADDR_IGNORED_BITS), that was my mistake. I don't have a strong
> opinion on whether to keep the underscore in the middle or not.

Fair enough (modulo possible changes above).

[...]

> > >       case SIL_FAULT_BNDERR:
> > >               to->si_addr = compat_ptr(from->si_addr);
> > > @@ -3399,6 +3431,8 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
> > >               to->si_lower = compat_ptr(from->si_lower);
> > >               to->si_upper = compat_ptr(from->si_upper);
> > >               to->si_xflags = from->si_xflags;
> > > +             to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> > > +             to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;
> > >               break;
> > >       case SIL_FAULT_PKUERR:
> > >               to->si_addr = compat_ptr(from->si_addr);
> > > @@ -3407,6 +3441,8 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
> > >  #endif
> > >               to->si_pkey = from->si_pkey;
> > >               to->si_xflags = from->si_xflags;
> > > +             to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> > > +             to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;
> >
> > Again, can you justify why this is exhaustive?  If there any way to
> > factor this so as to reduce the number of places we need to hack this
> > in?
> 
> Addressed on the other patch. Once I've factored the various
> SIL_FAULT* cases there should be only a handful of places requiring
> changes.

And that looked like a reasonable justification.

Cheers
---Dave

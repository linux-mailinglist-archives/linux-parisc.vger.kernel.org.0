Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E21D251BBD
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Aug 2020 17:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHYPCL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 25 Aug 2020 11:02:11 -0400
Received: from foss.arm.com ([217.140.110.172]:60772 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726230AbgHYPCL (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 25 Aug 2020 11:02:11 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBF1531B;
        Tue, 25 Aug 2020 08:02:09 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1755C3F71F;
        Tue, 25 Aug 2020 08:02:07 -0700 (PDT)
Date:   Tue, 25 Aug 2020 16:02:06 +0100
From:   Dave Martin <Dave.Martin@arm.com>
To:     Peter Collingbourne <pcc@google.com>
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Evgenii Stepanov <eugenis@google.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Kostya Serebryany <kcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        David Spickett <david.spickett@linaro.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v9 6/6] arm64: expose FAR_EL1 tag bits in siginfo
Message-ID: <20200825150204.GS6642@arm.com>
References: <cover.1597720138.git.pcc@google.com>
 <9df0de08df310052df01d63bc8bddc5dd71c2bdb.1597720138.git.pcc@google.com>
 <20200819155650.GI6642@arm.com>
 <CAMn1gO5pFUGDLJEWe1uOetz0ohE1-pdWGvz7_XxOMZROOfO=ag@mail.gmail.com>
 <20200824142348.GN6642@arm.com>
 <CAMn1gO7DErthDi5EGQh=-MVBP9x_MTsfPHdP_wnS2=xY7kpt2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO7DErthDi5EGQh=-MVBP9x_MTsfPHdP_wnS2=xY7kpt2g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Aug 24, 2020 at 07:18:19PM -0700, Peter Collingbourne wrote:
> On Mon, Aug 24, 2020 at 7:23 AM Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Wed, Aug 19, 2020 at 06:49:01PM -0700, Peter Collingbourne wrote:
> > > On Wed, Aug 19, 2020 at 8:56 AM Dave Martin <Dave.Martin@arm.com> wrote:
> > > >
> > > > On Mon, Aug 17, 2020 at 08:33:51PM -0700, Peter Collingbourne wrote:
> > > > > The kernel currently clears the tag bits (i.e. bits 56-63) in the fault
> > > > > address exposed via siginfo.si_addr and sigcontext.fault_address. However,
> > > > > the tag bits may be needed by tools in order to accurately diagnose
> > > > > memory errors, such as HWASan [1] or future tools based on the Memory
> > > > > Tagging Extension (MTE).
> > > > >
> > > > > We should not stop clearing these bits in the existing fault address
> > > > > fields, because there may be existing userspace applications that are
> > > > > expecting the tag bits to be cleared. Instead, create a new pair of
> > > > > union fields in siginfo._sigfault, and store the tag bits of FAR_EL1
> > > > > there, together with a mask specifying which bits are valid.
> > > > >
> > > > > A flag is added to si_xflags to allow userspace to determine whether
> > > > > the values in the fields are valid.
> > > > >
> > > > > [1] http://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html
> > > > >
> > > > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > > > ---
> >
> > [...]
> >
> > > > > diff --git a/kernel/signal.c b/kernel/signal.c
> > > > > index 72182eed1b8d..1f1e42adc57d 100644
> > > > > --- a/kernel/signal.c
> > > > > +++ b/kernel/signal.c
> >
> > [...]
> >
> > > > > @@ -1706,7 +1722,9 @@ int send_sig_fault(int sig, int code, void __user *addr
> > > > >       return send_sig_info(info.si_signo, &info, t);
> > > > >  }
> > > > >
> > > > > -int force_sig_mceerr(int code, void __user *addr, short lsb)
> > > > > +int force_sig_mceerr(int code, void __user *addr, short lsb,
> > > > > +                  unsigned long addr_ignored_bits,
> > > > > +                  unsigned long addr_ignored_bits_mask)
> > > >
> > > > Rather than having to pass these extra arguments all over the place, can
> > > > we just pass the far for addr, and have an arch-specific hook for
> > > > splitting the ignored from non-ignored bits.  For now at least, I expect
> > > > that ignored bits mask to be constant for a given platform and kernel.
> > >
> > > That sounds like a good idea. I think that for MTE we will want to
> > > make it conditional on the si_code (so SEGV_MTESERR would get 0xf <<
> > > 56 while everything else would get 0xff << 56) so I can hook that up
> > > at the same time.
> >
> > OK, I think that's reasonable.
> >
> > Mind you, we seem to have 3 kinds of bits here, so I'm starting to
> > wonder whether this is really sufficient:
> >
> >         1) address bits used in the faulted access
> >         2) attribute/permission bits used in the faulted access
> >         3) unavailable bits.
> >
> > si_addr contains (1).
> >
> > si_addr_ignored_bits contains (2).
> >
> > The tag bits from non-MTE faults seem to fall under case (3).  Code that
> > looks for these bits in si_addr_ignored_bits won't find them.
> 
> I'm reasonably sure that the tag bits are available for non-MTE
> faults. From https://developer.arm.com/docs/ddi0595/h/aarch64-system-registers/far_el1
> :
> "For a Data Abort or Watchpoint exception, if address tagging is
> enabled for the address accessed by the data access that caused the
> exception, then this field includes the tag."

Right, but I wonder whether it would still be good idea to have a way to
tell userspace which bits are valid.

Collecting and synchronising all the correct information for reporting a
fault is notoriously easy to mess up in the implementation, and
misreporting of the tag bits might be regarded as a tolerable fail.

We also don't get tag bits for prefetch aborts (which may be reported
via SIGSEGV).  Arguably the architecture doesn't allow a nonzero tag
(BR etc. likely just throw those bits on the floor).  But it might be
nice to be explicit about this.

Other architectures may also have other reasons why the additional bits
are sometimes available, sometimes not.

> This language applies to non-tag-check-fault data aborts but is
> superseded by the following paragraph for tag check faults:
> "For a synchronous Tag Check Fault abort, bits[63:60] are UNKNOWN."

Right, so in this case we should squash those bits and not report them
in the mask.  Currently are you implying that these are address bits,
because you exclude them from si_addr_ignored_mask?

> > So perhaps it would make sense to amend the design a bit.  We'd have
> >
> >         si_addr = address bits only
> >         si_attr = attribute bits only
> >         si_attr_mask = mask of valid bits in si_addr
> >
> > Thinking about it, I've just shortened/changed some named and changed
> > the meaning of the mask, so it's very similar to what you already have.
> 
> Did you mean "si_attr_mask = mask of valid bits in si_attr"? I assume

Yeah, my bad.

> so because below you talk about si_addr_mask also being the mask of
> valid bits in si_addr, but I don't think this is a change in meaning
> for the mask field as I specified it. Maybe, given your claim above
> that the tag bits are unavailable for non-tag check faults, you
> misunderstood why I am setting si_addr_ignored_bits_mask to 0xf << 56
> for tag check faults and 0xff << 56 for non-tag check faults?

Possibly.  I'll read your respin.

> That being said, maybe we can make the names shorter with something
> like your suggestion.
> 
> > The mask of valid bits in si_addr is decided by architectural
> > convention (i.e., ~0xffUL << 56), but we could also expose
> >
> >         si_addr_mask = mask of valid bits in si_addr
> >
> > This is a bit redundant though.  I think people would already assume
> > that all bits required for classifying the faulting location accurately
> > must already be provided there.
> 
> I think it's fine for this to be an architectural convention. If we
> really wanted to expose something like this to userspace then I think
> we should expose TASK_SIZE (this is something that I've wanted in the
> past). But that's really a separate discussion.

Agreed.

Cheers
---Dave

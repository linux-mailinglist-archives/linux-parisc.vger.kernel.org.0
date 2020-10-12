Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2370428BA87
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Oct 2020 16:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgJLOOd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Oct 2020 10:14:33 -0400
Received: from foss.arm.com ([217.140.110.172]:49480 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726897AbgJLOOd (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Oct 2020 10:14:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03023101E;
        Mon, 12 Oct 2020 07:14:32 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 204393F66B;
        Mon, 12 Oct 2020 07:14:30 -0700 (PDT)
Date:   Mon, 12 Oct 2020 15:14:27 +0100
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
Subject: Re: [PATCH v10 7/7] arm64: expose FAR_EL1 tag bits in siginfo
Message-ID: <20201012141426.GG32292@arm.com>
References: <cover.1598072840.git.pcc@google.com>
 <5370542d2ab88a9713ff548359e422337cdac1ee.1598072840.git.pcc@google.com>
 <20200908151347.GX6642@arm.com>
 <CAMn1gO6d0C5j6EbKQwhUpGfErWkrbD6bS-OqT-_fEB9ZrFZo9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO6d0C5j6EbKQwhUpGfErWkrbD6bS-OqT-_fEB9ZrFZo9Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Oct 07, 2020 at 07:54:46PM -0700, Peter Collingbourne wrote:
> On Tue, Sep 8, 2020 at 8:13 AM Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Fri, Aug 21, 2020 at 10:10:17PM -0700, Peter Collingbourne wrote:
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
> > > View this change in Gerrit: https://linux-review.googlesource.com/q/Ia8876bad8c798e0a32df7c2ce1256c4771c81446
> > >
> > > v10:
> > > - rename the flag to SIXFLAG_ADDR_IGNORED_BITS
> > > - use an arch hook to specify which bits are ignored, instead
> > >   of passing them explicitly
> > > - while refactoring for the arch hook, noticed that my previous
> > >   patches missed a case involving cache maintenance instructions,
> > >   so expose the tag bits for that signal as well
> > >
> > > v9:
> > > - make the ignored bits fields generic
> > > - add some new dependent patches that prepare us to store the
> > >   field in such a way that userspace can detect their presence
> > >
> > > v8:
> > > - rebase onto 5.8rc2
> > >
> > > v7:
> > > - switch to a new siginfo field instead of using sigcontext
> > > - merge the patch back into one since the other patches are now
> > >   unnecessary
> > >
> > > v6:
> > > - move fault address and fault code into the kernel_siginfo data structure
> > > - split the patch in three since it was getting large and now has
> > >   generic and arch-specific parts
> > >
> > > v5:
> > > - add padding to fault_addr_top_byte_context in order to ensure the correct
> > >   size and preserve sp alignment
> > >
> > > v4:
> > > - expose only the tag bits in the context instead of the entire FAR_EL1
> > > - remove mention of the new context from the sigcontext.__reserved[] note
> > >
> > > v3:
> > > - add documentation to tagged-pointers.rst
> > > - update comments in sigcontext.h
> > >
> > > v2:
> > > - revert changes to hw_breakpoint.c
> > > - rename set_thread_esr to set_thread_far_esr
> > >
> > >  Documentation/arm64/tagged-pointers.rst | 21 ++++++---
> > >  arch/arm64/include/asm/exception.h      |  2 +-
> > >  arch/arm64/include/asm/signal.h         | 17 +++++++
> > >  arch/arm64/include/asm/system_misc.h    |  2 +-
> > >  arch/arm64/include/asm/traps.h          |  6 +--
> > >  arch/arm64/kernel/debug-monitors.c      |  5 +--
> > >  arch/arm64/kernel/entry-common.c        |  2 -
> > >  arch/arm64/kernel/ptrace.c              |  7 +--
> > >  arch/arm64/kernel/sys_compat.c          |  5 +--
> > >  arch/arm64/kernel/traps.c               | 29 ++++++------
> > >  arch/arm64/mm/fault.c                   | 59 +++++++++++++------------
> > >  arch/x86/kernel/signal_compat.c         |  4 +-
> > >  include/linux/compat.h                  |  2 +
> > >  include/linux/signal.h                  |  8 ++++
> > >  include/uapi/asm-generic/siginfo.h      | 10 +++++
> > >  kernel/signal.c                         | 14 +++++-
> > >  16 files changed, 122 insertions(+), 71 deletions(-)
> > >  create mode 100644 arch/arm64/include/asm/signal.h
> > >
> > > diff --git a/Documentation/arm64/tagged-pointers.rst b/Documentation/arm64/tagged-pointers.rst
> > > index eab4323609b9..14273160b38b 100644
> > > --- a/Documentation/arm64/tagged-pointers.rst
> > > +++ b/Documentation/arm64/tagged-pointers.rst
> > > @@ -53,12 +53,21 @@ visibility.
> > >  Preserving tags
> > >  ---------------
> > >
> > > -Non-zero tags are not preserved when delivering signals. This means that
> > > -signal handlers in applications making use of tags cannot rely on the
> > > -tag information for user virtual addresses being maintained for fields
> > > -inside siginfo_t. One exception to this rule is for signals raised in
> > > -response to watchpoint debug exceptions, where the tag information will
> > > -be preserved.
> > > +Non-zero tags are not preserved in the fault address fields
> > > +siginfo.si_addr or sigcontext.fault_address when delivering
> > > +signals. This means that signal handlers in applications making use
> > > +of tags cannot rely on the tag information for user virtual addresses
> > > +being maintained in these fields. One exception to this rule is for
> > > +signals raised in response to watchpoint debug exceptions, where the
> > > +tag information will be preserved.
> > > +
> > > +The fault address tag is preserved in the si_addr_ignored_bits field
> > > +of siginfo, which is set for signals raised in response to data aborts
> > > +and instruction aborts. The si_addr_ignored_bits_mask field indicates
> > > +which bits of the field are valid. The validity of these fields is
> > > +indicated by the SIXFLAG_ADDR_IGNORED_BITS flag in siginfo.si_xflags,
> > > +and the validity of si_xflags in turn is indicated by the kernel
> > > +indicating support for the sigaction.sa_flags flag SA_XFLAGS.
> > >
> > >  The architecture prevents the use of a tagged PC, so the upper byte will
> > >  be set to a sign-extension of bit 55 on exception return.
> > > diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
> > > index 7577a754d443..950d55dae948 100644
> > > --- a/arch/arm64/include/asm/exception.h
> > > +++ b/arch/arm64/include/asm/exception.h
> > > @@ -32,7 +32,7 @@ static inline u32 disr_to_esr(u64 disr)
> > >  }
> > >
> > >  asmlinkage void enter_from_user_mode(void);
> > > -void do_mem_abort(unsigned long addr, unsigned int esr, struct pt_regs *regs);
> > > +void do_mem_abort(unsigned long far, unsigned int esr, struct pt_regs *regs);
> > >  void do_undefinstr(struct pt_regs *regs);
> > >  void do_bti(struct pt_regs *regs);
> > >  asmlinkage void bad_mode(struct pt_regs *regs, int reason, unsigned int esr);
> >
> > [...]
> >
> > > diff --git a/include/linux/compat.h b/include/linux/compat.h
> > > index 55d4228dfd88..273146cf30fd 100644
> > > --- a/include/linux/compat.h
> > > +++ b/include/linux/compat.h
> > > @@ -234,6 +234,8 @@ typedef struct compat_siginfo {
> > >                               compat_uptr_t _pad[6];
> > >                       };
> > >                       compat_uptr_t _xflags;
> > > +                     compat_uptr_t _addr_ignored_bits;
> > > +                     compat_uptr_t _addr_ignored_bits_mask;
> > >               } _sigfault;
> > >
> > >               /* SIGPOLL */
> > > diff --git a/include/linux/signal.h b/include/linux/signal.h
> > > index 3edbf54493ee..b4c473c12a9b 100644
> > > --- a/include/linux/signal.h
> > > +++ b/include/linux/signal.h
> > > @@ -480,4 +480,12 @@ struct seq_file;
> > >  extern void render_sigset_t(struct seq_file *, const char *, sigset_t *);
> > >  #endif
> >
> > Can we have a comment here explaining what this helper needs to do, if
> > defined?
> 
> Will add.
> 
> > > +#ifndef arch_addr_ignored_bits_mask
> > > +static inline unsigned long arch_addr_ignored_bits_mask(unsigned long sig,
> > > +                                                     unsigned long si_code)
> > > +{
> > > +     return 0;
> > > +}
> > > +#endif
> > > +
> > >  #endif /* _LINUX_SIGNAL_H */
> > > diff --git a/include/uapi/asm-generic/siginfo.h b/include/uapi/asm-generic/siginfo.h
> > > index 1fbd88d64f38..e314a38ce2d0 100644
> > > --- a/include/uapi/asm-generic/siginfo.h
> > > +++ b/include/uapi/asm-generic/siginfo.h
> > > @@ -94,6 +94,8 @@ union __sifields {
> > >                       void *_pad[6];
> > >               };
> > >               unsigned long _xflags;
> > > +             unsigned long _addr_ignored_bits;
> > > +             unsigned long _addr_ignored_bits_mask;
> > >       } _sigfault;
> > >
> > >       /* SIGPOLL */
> > > @@ -156,6 +158,8 @@ typedef struct siginfo {
> > >  #define si_addr_lsb  _sifields._sigfault._addr_lsb
> > >  /* si_xflags is only valid if 0 <= si_code < SI_KERNEL */
> > >  #define si_xflags    _sifields._sigfault._xflags
> > > +#define si_addr_ignored_bits         _sifields._sigfault._addr_ignored_bits
> > > +#define si_addr_ignored_bits_mask    _sifields._sigfault._addr_ignored_bits_mask
> > >  #define si_lower     _sifields._sigfault._addr_bnd._lower
> > >  #define si_upper     _sifields._sigfault._addr_bnd._upper
> > >  #define si_pkey              _sifields._sigfault._addr_pkey._pkey
> > > @@ -296,6 +300,12 @@ typedef struct siginfo {
> > >  #define EMT_TAGOVF   1       /* tag overflow */
> > >  #define NSIGEMT              1
> > >
> > > +/*
> > > + * SIGILL, SIGFPE, SIGSEGV, SIGBUS, SIGTRAP, SIGEMT si_xflags
> > > + */
> > > +#define SIXFLAG_ADDR_IGNORED_BITS    1
> > > +/* si_addr_ignored_bits{,_mask} fields valid */
> > > +
> >
> > I'm still uneasy about the "ignored bits" nomenclature, because the bits
> > aren't ignored, and because at the C language level above, they
> > generally _are_ considered part of the address.
> >
> > I don't have a great suggestion for a new name, though.  If we just
> > consider the si_addr_ignored_bits to be attributes that accompany the
> > address, it might make sense to call it
> >
> >         si_addr_attr_bits_mask
> >
> > or similar.
> >
> > That may or may not be considered to be less confusing.
> 
> Hmm, I wasn't entirely comfortable with "ignored" either because, as
> you point out, once MTE arrives some of the bits won't be ignored any
> more. Maybe since folks who are going to be working with these bits
> will probably be at least a little familiar with their use on arm64
> with MTE and the tagged address ABI, we should just borrow the
> nomenclature from arm64 and call it:
> 
>   si_addr_tag_bits
>   si_addr_tag_bits_mask
>   SIXFLAG_ADDR_TAG_BITS

My view on this is that the affected bits are really not address bits.

They can be thrown away precisely because they never distinguish one
valid memory location from another valid memory location, nor an
unmapped address from a mapped address: i.e, they make no difference
to the vma (if any) the address maps to or the page within the vma, nor
the offset within page (down to some granularity not coarser than the
access size).

Addresses that differ only in these bits would either behave
identically, be at least partially coherent (in the case of attribute
flags that influence caching, for example), or would trigger some kind
of check failure.

That might motivate names such as

	si_addr_non_addr_bits
	si_addr_valid_bits
	si_addr_attr_bits


My line of reasoning might be a bit obscure though, so perhaps names of
this sort are not as helpful as I'd like to think.


> 
> > >  /*
> > >   * sigevent definitions
> > >   *
> > > diff --git a/kernel/signal.c b/kernel/signal.c
> > > index 4259903b95cb..29654652d3aa 100644
> > > --- a/kernel/signal.c
> > > +++ b/kernel/signal.c
> > > @@ -1652,11 +1652,17 @@ void force_sigsegv(int sig)
> > >  static void set_sigfault_common_fields(struct kernel_siginfo *info, int sig,
> > >                                      int code, void __user *addr)
> > >  {
> > > +     unsigned long addr_long = (unsigned long)addr;
> > > +     unsigned long ignored_bits_mask =
> > > +             arch_addr_ignored_bits_mask(sig, code);
> > > +
> > >       info->si_signo = sig;
> > >       info->si_errno = 0;
> > >       info->si_code = code;
> > > -     info->si_addr = addr;
> > > -     info->si_xflags = 0;
> > > +     info->si_addr = (void __user *)(addr_long & ~ignored_bits_mask);
> > > +     info->si_xflags = SIXFLAG_ADDR_IGNORED_BITS;
> > > +     info->si_addr_ignored_bits = addr_long & ignored_bits_mask;
> > > +     info->si_addr_ignored_bits_mask = ignored_bits_mask;
> >
> > Could we report the ignored bits optionally?
> >
> > i.e., if arch_addr_ignored_bits_mask() == 0, then we could perhaps leave
> > SIXFLAG_ADDR_IGNORED_BITS clear in si_xflags, and just set
> > si_addr_ignored_bits{,_mask} to zeros.
> >
> > I can't decide myself whether this would be a good idea or not...
> 
> Since having the bit clear should be equivalent from the user's point
> of view to having it set with the mask equal to 0, I think I would
> favor the solution that would make the kernel code simpler, i.e. what
> I have implemented.

OK, that's reasonable.


> > >  }
> > >
> > >  int force_sig_fault_to_task(int sig, int code, void __user *addr
> > > @@ -3271,6 +3277,8 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
> > >               to->si_trapno = from->si_trapno;
> > >  #endif
> > >               to->si_xflags = from->si_xflags;
> > > +             to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> > > +             to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;
> >
> > What happens if we're delivering a signal to a compat process?
> >
> > It looks like we apply all the usual logic, but si_addr_ignored_bits and
> > si_addr_ignored_bits_mask simply get truncated.
> >
> > That might be reasonable -- we don't care about bits that don't exist
> > for compat, irrespective of what they mean for native -- but it's
> > probably worth a comment.
> 
> If the signal originates from a compat process then I would expect the
> addresses involved in the fault to be 32 bits wide, so I would not
> expect there to be any truncation in practice. The situation is the
> same for si_addr I think. I can leave a comment here.

OK, sounds fair.

We generally don't see 32-bit arches repurposing bits in the address,
since they tend to need all of them for addressing (unless, possibly,
when running some kind of low-footprint binary environment where
backwards compatibility isn't a concern -- not likely to be applicable
to Linux userspace).

> > >       }
> > >
> > >       switch (layout) {
> > > @@ -3347,6 +3355,8 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
> > >               to->si_trapno = from->si_trapno;
> > >  #endif
> > >               to->si_xflags = from->si_xflags;
> > > +             to->si_addr_ignored_bits = from->si_addr_ignored_bits;
> > > +             to->si_addr_ignored_bits_mask = from->si_addr_ignored_bits_mask;
> >
> > Otherwise, the patch looks reasonable.
> 
> Thanks for the review.
> 
> Peter

Cheers
---Dave

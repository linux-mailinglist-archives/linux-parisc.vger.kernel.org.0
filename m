Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B5E253497
	for <lists+linux-parisc@lfdr.de>; Wed, 26 Aug 2020 18:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgHZQQE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 26 Aug 2020 12:16:04 -0400
Received: from foss.arm.com ([217.140.110.172]:48552 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726946AbgHZQPk (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 26 Aug 2020 12:15:40 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9E97101E;
        Wed, 26 Aug 2020 09:15:38 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D91843F68F;
        Wed, 26 Aug 2020 09:15:36 -0700 (PDT)
Date:   Wed, 26 Aug 2020 17:15:34 +0100
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
Message-ID: <20200826161532.GU6642@arm.com>
References: <cover.1597720138.git.pcc@google.com>
 <e26271d2b3767cdbd265033e6f7eb28f828f3a28.1597720138.git.pcc@google.com>
 <20200819154028.GH6642@arm.com>
 <CAMn1gO5DebvFmUPcY=i_wKNZpdaybpCOdbZrDPsTQ32N5UQg7g@mail.gmail.com>
 <20200824140319.GM6642@arm.com>
 <CAMn1gO7KiL4e-O=-bj1Ur1CLKQJ=pOuVnwDBUma0jyE443ODeg@mail.gmail.com>
 <20200825144735.GR6642@arm.com>
 <CAMn1gO5vncjmSuhEYOkqTyA3rfesR8xLyxgRaNp6Vs=F1NeW7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO5vncjmSuhEYOkqTyA3rfesR8xLyxgRaNp6Vs=F1NeW7A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Aug 25, 2020 at 01:08:35PM -0700, Peter Collingbourne wrote:
> On Tue, Aug 25, 2020 at 7:47 AM Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Mon, Aug 24, 2020 at 06:27:51PM -0700, Peter Collingbourne wrote:
> > > On Mon, Aug 24, 2020 at 7:03 AM Dave Martin <Dave.Martin@arm.com> wrote:
> > > >
> > > > On Wed, Aug 19, 2020 at 06:37:25PM -0700, Peter Collingbourne wrote:
> > > > > On Wed, Aug 19, 2020 at 8:40 AM Dave Martin <Dave.Martin@arm.com> wrote:
> > > > > >
> > > > > > On Mon, Aug 17, 2020 at 08:33:50PM -0700, Peter Collingbourne wrote:
> > > > > > > This field will contain flags that may be used by signal handlers to
> > > > > > > determine whether other fields in the _sigfault portion of siginfo are
> > > > > > > valid. An example use case is the following patch, which introduces
> > > > > > > the si_addr_ignored_bits{,_mask} fields.
> > > > > > >
> > > > > > > A new sigcontext flag, SA_XFLAGS, is introduced in order to allow
> > > > > > > a signal handler to require the kernel to set the field (but note
> > > > > > > that the field will be set anyway if the kernel supports the flag,
> > > > > > > regardless of its value). In combination with the previous patches,
> > > > > > > this allows a userspace program to determine whether the kernel will
> > > > > > > set the field.
> > > > > > >
> > > > > > > Ideally this field could have just been named si_flags, but that
> > > > > > > name was already taken by ia64, so a different name was chosen.
> > > > > > >
> > > > > > > Alternatively, we may consider making ia64's si_flags a generic field
> > > > > > > and having it appear at the end of _sigfault (in the same place as
> > > > > > > this patch has si_xflags) on non-ia64, keeping it in the same place
> > > > > > > on ia64. ia64's si_flags is a 32-bit field with only one flag bit
> > > > > > > allocated, so we would have 31 bits to use if we do this.
> > > > > >
> > > > > > For clarity, is the new si_xflags field supposed to be valid for all
> > > > > > signal types, or just certain signals and si_codes?
> > > > >
> > > > > It is intended to be valid for all signal types that use the _sigfault
> > > > > union member of siginfo. As listed in siginfo.h these are: SIGILL,
> > > > > SIGFPE, SIGSEGV, SIGBUS, SIGTRAP, SIGEMT.
> > > >
> > > > SIGSYS is similar to SIGILL, is that included also?
> > >
> > > I think that SIGSYS is covered by a separate _sigsys union member.
> > >
> > > > > > What happens for things like a rt_sigqueueinfo() from userspace?
> > > > >
> > > > > Hmm. Let's enumerate each of these things, which I believe are all of
> > > > > the call sites of the function copy_siginfo_from_user and related
> > > > > functions (correct me if I'm wrong):
> > > > >
> > > > > - ptrace(PTRACE_SETSIGINFO)
> > > > > - pidfd_send_signal
> > > > > - rt_sigqueueinfo
> > > > > - rt_tgsigqueueinfo
> > > > >
> > > > > We can handle the last three by observing that the kernel forbids
> > > > > sending a signal with these syscalls if si_code >= 0, so we can say
> > > > > that the value of si_xflags is only valid if si_code >= 0.
> > > >
> > > > Hmmm, that's what the code says (actually >= 0 or SI_TKILL), but it's
> > > > illogical.  Those are user signals, so there's no obvious reason why
> > > > userspace shouldn't be allowed to generate their siginfo.  It would
> > > > probably be better for the kernel to police si_pid etc. in the SI_USER
> > > > and SI_TKILL cases rather than flatly refusing, but I guess that's a
> > > > discussion for another day.
> > > >
> > > > I guess the combination of SI_FROMKERNEL() and the signal number being a
> > > > known fault signal if probably sufficient for now.
> > >
> > > In v10 I ended up adding a comment saying that si_xflags is only valid
> > > if 0 <= si_code < SI_KERNEL (the SI_KERNEL part was due to my
> > > discovery of kernel code that was calling force_sig(SIGSEGV) where
> > > force_sig uses the _kill union member). Your comment about SI_USER
> >
> > Although it's been there a long time, is this a bug?
> >
> > sigaction(2) says that SI_KERNEL can be reported for any signal, but
> > doesn't say how/why.  It also says that si_addr is [unconditionally]
> > valid for [kernel-generated] SIGSEGV.  ([] are my insertions).
> >
> > While it may be reasonable to expect userspace code to filter out user
> > signals before assuming that siginfo fields are value, requiring user
> > code to check for specific si_codes is a bit nastier.
> >
> > I rather suspect that little or no code out there is explicity checking
> > for SI_KERNEL before assuming that si_addr etc. are valid today.
> 
> Right, but maybe that can be attributed to poor documentation (in the
> man page), so maybe the right thing to do here is to make the
> documentation more explicit. The kernel code itself is fairly clear
> that SI_KERNEL does not use the _sigfault layout:
> https://github.com/torvalds/linux/blob/6a9dc5fd6170d0a41c8a14eb19e63d94bea5705a/kernel/signal.c#L3173
> 
> And note that force_sig does not make the si_addr field valid either,
> it sets it to 0 (on most architectures, as a result of si_addr
> overlapping si_pid/si_uid which get set to 0 by that function), which
> is not necessarily the correct value. For example, on 64-bit x86,
> executing this code:
> 
>   volatile auto ptr = (char *)0xfedcba9876543210;
>   *ptr = 42;
> 
> (i.e. accessing outside of the TASK_SIZE limit) will result in a call
> to force_sig(SIGSEGV) setting si_addr=0. But this is clearly not an
> accurate fault address. I don't know how x86 reports the fault address
> to the kernel in this case but maybe it simply isn't available for
> addresses larger than TASK_SIZE, so the right thing for the kernel to
> do would be to indicate that the address is unavailable (for example,
> by setting si_code=SI_KERNEL, as it is already doing). Then through
> documentation updates, userspace can know that si_code=SI_KERNEL means
> that the address is unavailable.
> 
> > > made me realize that is not exactly true (since kill and
> > > pidfd_send_signal can send a fault signal with si_code == SI_USER). I
> > > was not aware of the SI_FROMKERNEL() macro. In v11 I will update the
> > > comment to say that SI_FROMKERNEL(si) && si->si_code != SI_KERNEL must
> > > be true in order for si_xflags to be valid.
> >
> > Given the above, maybe it would be better to say nothing explicit about
> > SI_KERNEL, but make sure that the additional siginfo fields are sanely
> > zeroed anyway.
> 
> I think that for si_addr this happens as a result of setting
> si_pid/si_uid, and for the other fields this happens as a result of
> zeroing the padding between fields. I know that we'd prefer not to
> rely on zeroing padding, but perhaps the zero padding can more be seen
> as a last resort for keeping things working in case userspace fails to
> check for SI_KERNEL.

Yes, I think this is reasonable -- slightly icky, but it should work in
practice.

As you say, things are already a bit of a mess in this area, so the best
we can reasonably aim for just now is to avoid making it the situation
worse.


So, can we make the condition something like:

For a given signal delivery, si_xflags exists if and only if:

	a) the sigaction() trickery worked, _and_
	b) si_addr exists.


We could provide a helper macro for this test, but the condition for (b)
will be fragile and tend to bitrot unless the problem is addressed more
broadly.  Seems out of scope for this series, though.


[--- This is a digression, but:

Yielding SI_KERNEL for SIGSEGV seems to be against POSIX, unless
SI_KERNEL provides si_addr -- see [1]:

	[...] the following signal-specific information shall be
	available: [...] SIGSEGV, SIGBUS: void *si_addr: Address of
	faulting memory references.

(stated unconditionally).  Though, also:

	For some implementations, the value of si_addr may be
	inaccurate.

IMHO, raising SIGSEGV from the kernel with an si_code that doesn't
provide an si_addr (contents notwithstanding) is simply wrong, and in
some of the affected cases (such as access to kernel memory) it's wrong
to use non-POSIX codes at all.  This is obviously just access to a duff
address, so we should probably use SEGV_MAPERR for this.  POSIX permits
that si_addr is not always "accurate", so we could happily yield
si_addr == 0 for such cases, if we don't have the address or would
rather not expose it (though if the address came from userspace, it
probably doesn't hurt to expose it).

AFAICT, SI_KERNEL most naturally applies to situations that closely
resemble kill(2) but don't originate from userspace, such as when the
OOM killer kills a task.  It doesn't seem right to be reporting any such
thing via SIGSEGV.

Anyway, this is a separate discussion from this series...

 --

[1] SUSv7, signal.h:
https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/signal.h.html

---]

> 
> > For kernel-generated signals we can guarantee this, so I
> > think that requiring userspace to check explicitly for SI_KERNEL is too
> > unrealistic (i.e., 90% of the time, people will forget ... and 99% of
> > the time they will get away with it).
> 
> It's unfortunate that the conditions for accessing these fields are so
> complex, but again this seems like part of the hand that we've been
> dealt with this API. Fortunately the requirement to check for
> SI_KERNEL should only really apply in practice to code accessing our
> new fields. We can make it retroactively apply to existing fields, but
> since that wouldn't be a change to the kernel code, just the
> documentation, existing code will continue to operate in the same way
> as it did before.

Agreed.  Again, we should try not to make things worse, but that's all.

si_code stinks generally, because it's so inextensible.  There's no way
to add new values without leaving software utterly baffled (or more
likely mistaken, since software often ignores si_code or doesn't check
it exhaustively, before relying on si_* fields).

[...]

Cheers
---Dave

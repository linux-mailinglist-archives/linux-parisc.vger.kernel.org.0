Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBE0252197
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Aug 2020 22:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgHYUIt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 25 Aug 2020 16:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgHYUIt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 25 Aug 2020 16:08:49 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F67BC061574
        for <linux-parisc@vger.kernel.org>; Tue, 25 Aug 2020 13:08:48 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id g11so18249ual.2
        for <linux-parisc@vger.kernel.org>; Tue, 25 Aug 2020 13:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EgzlA7htx66WvBN/oEQucOqyepOa6sliaP0+MpnwaBQ=;
        b=qsNYf3GmVDFZ5z9Cko3jLpPQcY4NUn6P0u1gROK+P+p8ZeQe0/z4Bq3zUeDkeYJS36
         tH/OWxWWAw36oWNNFO+2EmJW7XuQadrlQZjlYeXFMWQpDeJtLd5yAGBHgcoWsANSJBbP
         uKXHl89aj3TRgFr9SKnCbGxMQ/7i3NuCpHkhIJZQb07ML2WEUl0345DXwnTYmjTT4Pjo
         iF/qo1wY9f+EFqh16h74bnOi+1V199brF7a5yG3PkuN7yN4RsVm8T5U+xTuXbzlFeCRH
         DdgqfXMXNh0RWThJfraT4qlsEWbWBibMAQzMZYX30G7Rr/fub90PQVmVGNCnIlYC1zGi
         nODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EgzlA7htx66WvBN/oEQucOqyepOa6sliaP0+MpnwaBQ=;
        b=YFaK1RgLHAO3cNm17RxfHPgUutIijYIe4F/R8QZ/SkolLil8QAXOPqwddHe5fkJzAW
         gDR0LRR8gcGpk3vhSlF3RW6qQtm618zb//NOrx9AO4xFlgL11TjokTGmm6g2tnvoxvdQ
         cr0yetnlSfdLS53hilfrfoQW5auuU4VI/zHssYt3ojNiAN7ridq/tpQ9duRNGTfG7qs/
         YDZCQcNMvrpS0w2MTrU8FALCTlvnozrbUqOz8FeJgjkxToLLNrPFYK1NbUpih31TdZvz
         iHJdVoLPxOha2sN2kNmJZQrBf8rMGGRA4TR3eRTvtNSVMNq9o5cboUVMOUY8D4+Ho5Ac
         6u0A==
X-Gm-Message-State: AOAM532YZCJCyuKVH39Z88GNp/fbNmskKt0h5WurfXEm0ujSTSGWhQxo
        W/yar8dMikuZmCtKTk/CVU0a81J2TKZc65UAdxU0Fg==
X-Google-Smtp-Source: ABdhPJzXYFbULjrWMb267Q9X+jr8RVqPKAc+OzObADwBRyQxqi5O/t8Tp9y5r/CrjFSHLKCf5oECxlU6L6I2Rr7qmFQ=
X-Received: by 2002:ab0:60d7:: with SMTP id g23mr6695091uam.122.1598386127418;
 Tue, 25 Aug 2020 13:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597720138.git.pcc@google.com> <e26271d2b3767cdbd265033e6f7eb28f828f3a28.1597720138.git.pcc@google.com>
 <20200819154028.GH6642@arm.com> <CAMn1gO5DebvFmUPcY=i_wKNZpdaybpCOdbZrDPsTQ32N5UQg7g@mail.gmail.com>
 <20200824140319.GM6642@arm.com> <CAMn1gO7KiL4e-O=-bj1Ur1CLKQJ=pOuVnwDBUma0jyE443ODeg@mail.gmail.com>
 <20200825144735.GR6642@arm.com>
In-Reply-To: <20200825144735.GR6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Tue, 25 Aug 2020 13:08:35 -0700
Message-ID: <CAMn1gO5vncjmSuhEYOkqTyA3rfesR8xLyxgRaNp6Vs=F1NeW7A@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] signal: define the field siginfo.si_xflags
To:     Dave Martin <Dave.Martin@arm.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Aug 25, 2020 at 7:47 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Mon, Aug 24, 2020 at 06:27:51PM -0700, Peter Collingbourne wrote:
> > On Mon, Aug 24, 2020 at 7:03 AM Dave Martin <Dave.Martin@arm.com> wrote:
> > >
> > > On Wed, Aug 19, 2020 at 06:37:25PM -0700, Peter Collingbourne wrote:
> > > > On Wed, Aug 19, 2020 at 8:40 AM Dave Martin <Dave.Martin@arm.com> wrote:
> > > > >
> > > > > On Mon, Aug 17, 2020 at 08:33:50PM -0700, Peter Collingbourne wrote:
> > > > > > This field will contain flags that may be used by signal handlers to
> > > > > > determine whether other fields in the _sigfault portion of siginfo are
> > > > > > valid. An example use case is the following patch, which introduces
> > > > > > the si_addr_ignored_bits{,_mask} fields.
> > > > > >
> > > > > > A new sigcontext flag, SA_XFLAGS, is introduced in order to allow
> > > > > > a signal handler to require the kernel to set the field (but note
> > > > > > that the field will be set anyway if the kernel supports the flag,
> > > > > > regardless of its value). In combination with the previous patches,
> > > > > > this allows a userspace program to determine whether the kernel will
> > > > > > set the field.
> > > > > >
> > > > > > Ideally this field could have just been named si_flags, but that
> > > > > > name was already taken by ia64, so a different name was chosen.
> > > > > >
> > > > > > Alternatively, we may consider making ia64's si_flags a generic field
> > > > > > and having it appear at the end of _sigfault (in the same place as
> > > > > > this patch has si_xflags) on non-ia64, keeping it in the same place
> > > > > > on ia64. ia64's si_flags is a 32-bit field with only one flag bit
> > > > > > allocated, so we would have 31 bits to use if we do this.
> > > > >
> > > > > For clarity, is the new si_xflags field supposed to be valid for all
> > > > > signal types, or just certain signals and si_codes?
> > > >
> > > > It is intended to be valid for all signal types that use the _sigfault
> > > > union member of siginfo. As listed in siginfo.h these are: SIGILL,
> > > > SIGFPE, SIGSEGV, SIGBUS, SIGTRAP, SIGEMT.
> > >
> > > SIGSYS is similar to SIGILL, is that included also?
> >
> > I think that SIGSYS is covered by a separate _sigsys union member.
> >
> > > > > What happens for things like a rt_sigqueueinfo() from userspace?
> > > >
> > > > Hmm. Let's enumerate each of these things, which I believe are all of
> > > > the call sites of the function copy_siginfo_from_user and related
> > > > functions (correct me if I'm wrong):
> > > >
> > > > - ptrace(PTRACE_SETSIGINFO)
> > > > - pidfd_send_signal
> > > > - rt_sigqueueinfo
> > > > - rt_tgsigqueueinfo
> > > >
> > > > We can handle the last three by observing that the kernel forbids
> > > > sending a signal with these syscalls if si_code >= 0, so we can say
> > > > that the value of si_xflags is only valid if si_code >= 0.
> > >
> > > Hmmm, that's what the code says (actually >= 0 or SI_TKILL), but it's
> > > illogical.  Those are user signals, so there's no obvious reason why
> > > userspace shouldn't be allowed to generate their siginfo.  It would
> > > probably be better for the kernel to police si_pid etc. in the SI_USER
> > > and SI_TKILL cases rather than flatly refusing, but I guess that's a
> > > discussion for another day.
> > >
> > > I guess the combination of SI_FROMKERNEL() and the signal number being a
> > > known fault signal if probably sufficient for now.
> >
> > In v10 I ended up adding a comment saying that si_xflags is only valid
> > if 0 <= si_code < SI_KERNEL (the SI_KERNEL part was due to my
> > discovery of kernel code that was calling force_sig(SIGSEGV) where
> > force_sig uses the _kill union member). Your comment about SI_USER
>
> Although it's been there a long time, is this a bug?
>
> sigaction(2) says that SI_KERNEL can be reported for any signal, but
> doesn't say how/why.  It also says that si_addr is [unconditionally]
> valid for [kernel-generated] SIGSEGV.  ([] are my insertions).
>
> While it may be reasonable to expect userspace code to filter out user
> signals before assuming that siginfo fields are value, requiring user
> code to check for specific si_codes is a bit nastier.
>
> I rather suspect that little or no code out there is explicity checking
> for SI_KERNEL before assuming that si_addr etc. are valid today.

Right, but maybe that can be attributed to poor documentation (in the
man page), so maybe the right thing to do here is to make the
documentation more explicit. The kernel code itself is fairly clear
that SI_KERNEL does not use the _sigfault layout:
https://github.com/torvalds/linux/blob/6a9dc5fd6170d0a41c8a14eb19e63d94bea5705a/kernel/signal.c#L3173

And note that force_sig does not make the si_addr field valid either,
it sets it to 0 (on most architectures, as a result of si_addr
overlapping si_pid/si_uid which get set to 0 by that function), which
is not necessarily the correct value. For example, on 64-bit x86,
executing this code:

  volatile auto ptr = (char *)0xfedcba9876543210;
  *ptr = 42;

(i.e. accessing outside of the TASK_SIZE limit) will result in a call
to force_sig(SIGSEGV) setting si_addr=0. But this is clearly not an
accurate fault address. I don't know how x86 reports the fault address
to the kernel in this case but maybe it simply isn't available for
addresses larger than TASK_SIZE, so the right thing for the kernel to
do would be to indicate that the address is unavailable (for example,
by setting si_code=SI_KERNEL, as it is already doing). Then through
documentation updates, userspace can know that si_code=SI_KERNEL means
that the address is unavailable.

> > made me realize that is not exactly true (since kill and
> > pidfd_send_signal can send a fault signal with si_code == SI_USER). I
> > was not aware of the SI_FROMKERNEL() macro. In v11 I will update the
> > comment to say that SI_FROMKERNEL(si) && si->si_code != SI_KERNEL must
> > be true in order for si_xflags to be valid.
>
> Given the above, maybe it would be better to say nothing explicit about
> SI_KERNEL, but make sure that the additional siginfo fields are sanely
> zeroed anyway.

I think that for si_addr this happens as a result of setting
si_pid/si_uid, and for the other fields this happens as a result of
zeroing the padding between fields. I know that we'd prefer not to
rely on zeroing padding, but perhaps the zero padding can more be seen
as a last resort for keeping things working in case userspace fails to
check for SI_KERNEL.

> For kernel-generated signals we can guarantee this, so I
> think that requiring userspace to check explicitly for SI_KERNEL is too
> unrealistic (i.e., 90% of the time, people will forget ... and 99% of
> the time they will get away with it).

It's unfortunate that the conditions for accessing these fields are so
complex, but again this seems like part of the hand that we've been
dealt with this API. Fortunately the requirement to check for
SI_KERNEL should only really apply in practice to code accessing our
new fields. We can make it retroactively apply to existing fields, but
since that wouldn't be a change to the kernel code, just the
documentation, existing code will continue to operate in the same way
as it did before.

> I'm not sure that SI_FROMKERNEL() is standard btw, but I observed that
> it is present in the Linux UAPI header.
>
> The "si_code < 0 means userspace" convention seems well established, but
> I haven't found anywhere that this is clearly specified.
>
> >
> > > It might be helpful to have a helper to identify fault signals, but we
> > > don't have this today, and it's unlikely that a new kind of fault signal
> > > will crop up any time soon.
> > >
> > > Handlers that handle specific signal types won't care, but debuggers and
> > > generic backtracer code would have to be hand-hacked to add new kinds of
> > > fault signal today -- not a huge priority though, and orthogonal to this
> > > series.
> > >
> > > > As for the first one, it's more tricky. Arguably something like a
> > > > debugger should be able to send arbitrary signals to a debuggee, and
> > > > there's no reason why it shouldn't be able to set si_xflags in
> > > > siginfo, but on the other hand who knows how existing debuggers end up
> > > > setting this field today. Maybe all that we can do is have the kernel
> > > > clear si_xflags if it detects that the signal uses _sigfault, and let
> > > > si_xflags aware debuggers opt out of this behavior, perhaps by
> > > > introducing a PTRACE_SETSIGINFO2 or something.
> > >
> > > Most likely a debugger usually amends an existing siginfo from a trapped
> > > signal than generating a new one from scratch.
> >
> > Right, but it could have copied the fields by hand from a
> > kernel-supplied siginfo before amending it.
>
> It could have, but we can't cover every eventuality.  With a
> PTRACE_SETSIGINFO2, we at least get a promise from userspace that it
> processed the fields correctly.  (If userspace is wrong, or lying,
> that's its own funeral.  The ptracer is as good as root from the point
> of view of the traced process anyway.)

Agreed.


Peter

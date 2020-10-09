Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82C52890AB
	for <lists+linux-parisc@lfdr.de>; Fri,  9 Oct 2020 20:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732138AbgJISUI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 9 Oct 2020 14:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731198AbgJISUI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 9 Oct 2020 14:20:08 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D93CC0613D2
        for <linux-parisc@vger.kernel.org>; Fri,  9 Oct 2020 11:20:08 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id y10so378714vkl.5
        for <linux-parisc@vger.kernel.org>; Fri, 09 Oct 2020 11:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RBwQ/ACJfMQzCtlXjrFB+MA2iTp6k2IYutl22wTfq6o=;
        b=AUOCJ8NeBHUJIv5orrxdtVV1F1kH7kMHyr9ho0RAkmW1o6EC+rWlPw296Q//TQe3vm
         GinBVuYI+2f7lwxvkDGMeM18WT72kCeJYwnKD8LyGEl5xjqyIbUfTaACNWsLVqLsFvAS
         HIrQEuwUBiQJf48xZwB64Gi2NAQO6bjuXdBQHLTZ96zP7BIrCORGy5BCS0/PaOE26BZI
         c9eqjrXSh1Hj6l2G3+zAMZ5DHnOlUbvnv6N+VeHtrt4xLAW77xYgZfsa9rJKuwepHj8S
         C5R1BZzu1fTuzKvjSrx2RpBG43hKiFpuDCvGgO+8HISfsuOyKRgl/g6YR4ki4GG1PlX/
         s0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RBwQ/ACJfMQzCtlXjrFB+MA2iTp6k2IYutl22wTfq6o=;
        b=PrzBRZh9zzsa1VlOf4mnEcuZlVhlW28oOwZtOhxpV/6Ad8/bzUs8SqZ1DyVTlJ0uVn
         UFdTK+pD34VzyIEHTcO+s9jqwOUaTHo6CY9Y9YrtdCGx9h3RGPiA5nhzUdDq+Aqao/Fr
         0j3BGGgVtqfHi1kBGs0SNTVGVxwf8XAQfuLuVzYtrAK1qx/JrEpHgtHq1YhNu1X9AaXi
         4nCCkNjQmJZZdRTG1henEcj59m0sX15vRy3o+Z5DZc2qrCdetynyCx29Hv/A+E+CvyaB
         lN1tSZh5zOqXQgP6//+ke9ilgjfKhZsMFsJD6VS4sdHImG9vtDX5ocpph6Qb6PhKdXU7
         ratQ==
X-Gm-Message-State: AOAM531hgvZhpjP0CAXeEERedaXOMONsbq0b5ArxDRzwwgLcwR1zsY2a
        /LOTVqFl4jrap5EQgGE0PMqx9XV85N1vctntUAf1fQ==
X-Google-Smtp-Source: ABdhPJwDZoZ/zIgNOaJ0bYchJ+z5WPrkZUGCdWkH4H91X9XpwfymNggG0KKou1mQwlFqlcIcY460jewsT5dpe5iWDEM=
X-Received: by 2002:a1f:5341:: with SMTP id h62mr8195739vkb.24.1602267606589;
 Fri, 09 Oct 2020 11:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598072840.git.pcc@google.com> <8a12152d54ea782f47bc55d791b064abe478473e.1598072840.git.pcc@google.com>
 <20200908151337.GW6642@arm.com> <CAMn1gO5ZyHxvNNRpRhqE7fOY_O1QkH37K0ShT2sq7vbo_J-RZA@mail.gmail.com>
In-Reply-To: <CAMn1gO5ZyHxvNNRpRhqE7fOY_O1QkH37K0ShT2sq7vbo_J-RZA@mail.gmail.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Fri, 9 Oct 2020 11:19:55 -0700
Message-ID: <CAMn1gO6inoGhmoqCb4A_yR3UakU3JsJ4jpsKa5aBqAPhDoPvSg@mail.gmail.com>
Subject: Re: [PATCH v10 6/7] signal: define the field siginfo.si_xflags
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
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Oct 7, 2020 at 7:11 PM Peter Collingbourne <pcc@google.com> wrote:
>
> On Tue, Sep 8, 2020 at 8:13 AM Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Fri, Aug 21, 2020 at 10:10:16PM -0700, Peter Collingbourne wrote:
> >
> > [ Add a new siginfo member sa_xflags, for fault signals. ]
>
> Will fix.
>
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
> > > It is possible for an si_xflags-unaware program to cause a signal
> > > handler in an si_xflags-aware program to be called with a provided
> > > siginfo data structure by using one of the following syscalls:
> > >
> > > - ptrace(PTRACE_SETSIGINFO)
> > > - pidfd_send_signal
> > > - rt_sigqueueinfo
> > > - rt_tgsigqueueinfo
> > >
> > > So we need to prevent the si_xflags-unaware program from causing an
> > > uninitialized read of si_xflags in the si_xflags-aware program when
> > > it uses one of these syscalls.
> > >
> > > The last three cases can be handled by observing that each of these
> > > syscalls fails if si_code >= 0, so we define si_xflags to only be
> > > valid if si_code >= 0.
> >
> > I would say >.  0 is SI_USER, and the fact that those other interfaces
> > reject SI_USER seems inconsistent or a bug.
> >
> > We can always relax the rule later.
> >
> > Since si_xflags only makes sense for "real" fault signals, it would
> > never be applicable in combination with SI_USER.  Or am I missing
> > something?
> >
> > Either way, I think this is just a documentation ossue in practice.
>
> I think you're right. kill(2) and tgkill(2) set si_code to SI_USER, so
> excluding SI_USER seems to be necessary to avoid an invalid read via
> either of these syscalls. I will update the comment to say > 0.
>
> > >
> > > There is no such check on si_code in ptrace(PTRACE_SETSIGINFO), so
> > > we make ptrace(PTRACE_SETSIGINFO) clear the si_xflags field if it
> > > detects that the signal would use the _sigfault layout, and introduce
> > > a new ptrace request type, PTRACE_SETSIGINFO2, that a si_xflags-aware
> > > program may use to opt out of this behavior.
> >
> > Will we need to introduce PTRACE_SETSIGINFO3, 4 etc., every time a new
> > field comes up?
> >
> > I wonder whether we should make this more flexible, say accepting some
> > flags argument to say which fields the caller understands (and so
> > doesn't want clobbered).  Maybe we can (ab)use the sa_flags bit
> > definitions for indicating which extensions the caller understands.
>
> I'd be okay with adding a flags argument here, to be passed via the
> addr argument to PTRACE_SETSIGINFO2. (Confusingly, in some of the
> ptrace request types including the ones that deal with siginfo "data"
> is the argument that takes an address and "addr" is the one that takes
> something else! My new request type will do the same to make things
> consistently confusing.)
>
> I guess we would only require a new "out of band" signaling mechanism
> if we were adding a field to a different union member (presumably a
> flags field to support the kind of future expansion that we anticipate
> for sigfault), since for sigfault we may indicate presence of new
> fields using si_xflags. Presumably such a field would come at the same
> time as a new SA_* bit for detecting its presence, so I suppose that
> we could use the sa_flags bits here as well. I'm not entirely
> comfortable with that though because the other SA_* bits wouldn't make
> sense to be passed as an argument here (and because of the
> architecture dependence that made it so hard to find free SA_* bits to
> add, we would be unnecessarily restricted in the number of bits that
> we could easily add here), and in the future someone may come up with
> a reason to pass a new flag here that wouldn't correspond to an SA_*
> bit. So I would mildly prefer a new set of bit definitions.
>
> It's unfortunate that the addr argument for PTRACE_SETSIGINFO was
> specified to be ignored rather than causing an error for non-zero
> values, as otherwise we could have used it as the flags argument to
> the existing request type and avoided adding a new one. Of course,
> this is the same issue that has caused us so much grief with
> sigaction. But for the new request type we can do things properly and
> require addr to have only recognized bits set.
>
> > > It is also possible for the kernel to inject a signal specified to
> > > use _sigfault by calling force_sig (e.g. there are numerous calls to
> > > force_sig(SIGSEGV)). In this case si_code is set to SI_KERNEL and the
> > > _kill union member is used, so document that si_code must be < SI_KERNEL.
> >
> > Ack.  I'm still wondering if some of those SIGSEGV/SI_KERNEL instances
> > should be changed to one of the standard SIGSEGV codes, but either way,
> > having si_xflags validity require si_code < SI_KERNEL seems appropriate.
> >
> >
> > > Ideally this field could have just been named si_flags, but that
> > > name was already taken by ia64, so a different name was chosen.
> > >
> > > Alternatively, we may consider making ia64's si_flags a generic field
> > > and having it appear at the end of _sigfault (in the same place as
> > > this patch has si_xflags) on non-ia64, keeping it in the same place
> > > on ia64. ia64's si_flags is a 32-bit field with only one flag bit
> > > allocated, so we would have 31 bits to use if we do this.
> >
> > Hmm, that might be an idea.
> >
> > It would mean that x86 would have different rules from other
> > architectures regarding how to know when the field is valid, which might
> > lull x86-first projects into a false sense of security.  Perhaps we could
>
> ia64 is Itanium, not x86. And ia64 is almost dead (I heard that gcc
> was planning to remove support some time next year [1], which I expect
> would be followed soon after by dropping kernel support). So I
> wouldn't expect there to be a lot of ia64-first projects out there.
>
> [1] https://www.phoronix.com/scan.php?page=news_item&px=Intel-IA-64-GCC-Deprecation
>
> > refuse to expose any of the arch-independent flags in si_flags unless
> > explicitly requested via SA_XFLAGS, but that would be a departure from
> > what this series implements today.
> >
> > So maybe it's simpler to keep the two fields separate, unless somebody
> > objects.
>
> Notwithstanding the above, I would be mildly in favor of keeping them
> separate in order to avoid the complexity implied by entangling them,
> since it's complex enough to add fields here as it is.
>
> > >
> > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > ---
> > > View this change in Gerrit: https://linux-review.googlesource.com/q/Ide155ce29366c3eab2a944ae4c51205982e5b8b2
> > >
> > > v10:
> > > - make the new field compatible with the various ways
> > >   that a siginfo can be injected from another process
> > > - eliminate some duplication by adding a refactoring patch
> > >   before this one
> > >
> > >  arch/powerpc/platforms/powernv/vas-fault.c |  1 +
> > >  arch/x86/kernel/signal_compat.c            |  4 +--
> > >  include/linux/compat.h                     |  2 ++
> > >  include/linux/signal_types.h               |  2 +-
> > >  include/uapi/asm-generic/siginfo.h         |  4 +++
> > >  include/uapi/asm-generic/signal-defs.h     |  4 +++
> > >  include/uapi/linux/ptrace.h                |  2 ++
> > >  kernel/ptrace.c                            | 29 ++++++++++++++++++++++
> > >  kernel/signal.c                            |  3 +++
> > >  9 files changed, 48 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
> > > index 3d21fce254b7..3bbb335561f5 100644
> > > --- a/arch/powerpc/platforms/powernv/vas-fault.c
> > > +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> > > @@ -154,6 +154,7 @@ static void update_csb(struct vas_window *window,
> > >       info.si_errno = EFAULT;
> > >       info.si_code = SEGV_MAPERR;
> > >       info.si_addr = csb_addr;
> > > +     info.si_xflags = 0;
> > >
> > >       /*
> > >        * process will be polling on csb.flags after request is sent to
> > > diff --git a/arch/x86/kernel/signal_compat.c b/arch/x86/kernel/signal_compat.c
> > > index c599013ae8cb..6b99f0c8a068 100644
> > > --- a/arch/x86/kernel/signal_compat.c
> > > +++ b/arch/x86/kernel/signal_compat.c
> > > @@ -121,8 +121,8 @@ static inline void signal_compat_build_tests(void)
> > >  #endif
> > >
> > >       CHECK_CSI_OFFSET(_sigfault);
> > > -     CHECK_CSI_SIZE  (_sigfault, 4*sizeof(int));
> > > -     CHECK_SI_SIZE   (_sigfault, 8*sizeof(int));
> > > +     CHECK_CSI_SIZE  (_sigfault, 8*sizeof(int));
> > > +     CHECK_SI_SIZE   (_sigfault, 16*sizeof(int));
> >
> > (Yuk, but at least you make this no worse.)
> >
> > >
> > >       BUILD_BUG_ON(offsetof(siginfo_t, si_addr) != 0x10);
> > >       BUILD_BUG_ON(offsetof(compat_siginfo_t, si_addr) != 0x0C);
> > > diff --git a/include/linux/compat.h b/include/linux/compat.h
> > > index d38c4d7e83bd..55d4228dfd88 100644
> > > --- a/include/linux/compat.h
> > > +++ b/include/linux/compat.h
> > > @@ -231,7 +231,9 @@ typedef struct compat_siginfo {
> > >                                       char _dummy_pkey[__COMPAT_ADDR_BND_PKEY_PAD];
> > >                                       u32 _pkey;
> > >                               } _addr_pkey;
> > > +                             compat_uptr_t _pad[6];
> > >                       };
> > > +                     compat_uptr_t _xflags;
> >
> > Should we have the same type here for native and compat?
> >
> > I don't have a very strong opinion on this, but currently native on
> > 64-bit arches will have 32 extra bits in _xflags that can never be used
> > (or have to be defined differently for compat).
>
> Good point. I will make this a u64 (although I think 32 bits will
> probably be more than enough, the distance between si_xflags and
> si_addr_ignored_bits will be 8 bytes on 64-bit architectures due to
> alignment so we may as well make all of the bits available).

It turns out that we can't actually make this a u64 because on 32-bit
platforms this increases the alignment of the union to 8, which breaks
layout for the other fields in the union. In v12 I will make this a
u32 so that we don't end up with unusable bits.

Peter

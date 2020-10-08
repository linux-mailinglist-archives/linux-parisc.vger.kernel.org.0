Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080EF286CB6
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Oct 2020 04:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbgJHCXl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 7 Oct 2020 22:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbgJHCXl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 7 Oct 2020 22:23:41 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FAAC061755
        for <linux-parisc@vger.kernel.org>; Wed,  7 Oct 2020 19:23:40 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id n7so986247vkq.5
        for <linux-parisc@vger.kernel.org>; Wed, 07 Oct 2020 19:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aEOC1zGrh9uQAdWKzhAO+5ZHwG6suHJHRXmgVVDJ/uM=;
        b=RTy9zesPficb9WAP+EMHlp5QGOOm0qXO7OXL+NOdaJ/xm3PP9eMFAMkk1pS1NhDdBD
         hHi6eSqlRHByBNdCHI6d9hEfHtvag3GoZiRDzsWRmWZTx8w55fe9qsQ15uUuw6UvpYUh
         wkkXr8wzNuKjS1Ku7Lt7RWOF2nAjdXTU/lOq0tutL5mf/7zSDg6mPBFQQ/LpezjZlw0f
         gapybXSzNux4KNwwFH9KfsdTs2ddbm0JaQZeCjd/hiUFEpMn4EQj88GVS7kfE1PRK6zQ
         WTkrAqqzBTK1j4ZNFr6IwSMgeXQJzd/DDaHQ/e7ThAv1KsHtqYEatFK/MmDA9kAF+2gD
         3JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aEOC1zGrh9uQAdWKzhAO+5ZHwG6suHJHRXmgVVDJ/uM=;
        b=F4a10OyrsJCeUmUvGQaFBf/GpoVSB+0Y4LTfBgnn5OXtPEnXazNOU82bZc9mwjes9N
         iHoH0uDLkvp/Xv6+EDn6eUHqg9HZec75j4Lmai9vbnsCZ3PnhcjK2gz5DBtIYfVJDKUx
         jLMpEOKLrLsUd5UVeu+TIWOkbhhnDtMxIne2B7EJiFlKJ3LJRA6M4M4qqN/+t0RYeGKB
         Tsz5EW+Ov8ePs/0pWaNR4fW7zUfGrzVsUjuGe2qh48oMq/7IrV/vX+dmt4IPVoAcm1Sw
         vICGNVIGWYc62RlSe7CQ02N0mcM7i2lxsJ1oKgq4Ior3XdGgtN4l4bSYZ4QX3ytfntOx
         mcxQ==
X-Gm-Message-State: AOAM530pxEVxPSKqzgNC7VLJrU/s7YJ93nDIaBb1Q2knHOOOSa+nImr5
        icaK1CFdzu1i/hQblpl38knUZ+OqPKNSDdgoEl2xcA==
X-Google-Smtp-Source: ABdhPJxTw3HbIqgdQRFcs5mY9k6uZR4sx40STW7sEqc+Reetusnmx7GtuAiQ5v4/KL4ivy7pLEH0xg6uScN0b0nSotg=
X-Received: by 2002:a1f:ae85:: with SMTP id x127mr85363vke.8.1602123818884;
 Wed, 07 Oct 2020 19:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598072840.git.pcc@google.com> <868b8a89e4050d3f2d079bf28a18786e92b9c680.1598072840.git.pcc@google.com>
 <20200908151235.GT6642@arm.com>
In-Reply-To: <20200908151235.GT6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Wed, 7 Oct 2020 19:23:27 -0700
Message-ID: <CAMn1gO5ni9M9ja3gMcf1SACG_V2uc8WgFyVPEv_DLMV6HpHrwg@mail.gmail.com>
Subject: Re: [PATCH v10 3/7] signal: clear non-uapi flag bits when
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
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Sep 8, 2020 at 8:12 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Fri, Aug 21, 2020 at 10:10:13PM -0700, Peter Collingbourne wrote:
> > Previously we were not clearing non-uapi flag bits in
> > sigaction.sa_flags when storing the userspace-provided sa_flags or
> > when returning them via oldact. Start doing so.
> >
> > This allows userspace to detect missing support for flag bits and
> > allows the kernel to use non-uapi bits internally, as we are already
> > doing in arch/x86 for two flag bits. Now that this change is in
> > place, we no longer need the code in arch/x86 that was hiding these
> > bits from userspace, so remove it.
> >
> > This is technically a userspace-visible behavior change for sigaction, as
> > the unknown bits returned via oldact.sa_flags are no longer set. However,
> > we are free to define the behavior for unknown bits exactly because
> > their behavior is currently undefined, so for now we can define the
> > meaning of each of them to be "clear the bit in oldact.sa_flags unless
> > the bit becomes known in the future". Furthermore, this behavior is
> > consistent with OpenBSD [1], illumos [2] and XNU [3] (FreeBSD [4] and
> > NetBSD [5] fail the syscall if unknown bits are set). So there is some
> > precedent for this behavior in other kernels, and in particular in XNU,
> > which is probably the most popular kernel among those that I looked at,
> > which means that this change is less likely to be a compatibility issue.
> >
> > Link: [1] https://github.com/openbsd/src/blob/f634a6a4b5bf832e9c1de77f7894ae2625e74484/sys/kern/kern_sig.c#L278
> > Link: [2] https://github.com/illumos/illumos-gate/blob/76f19f5fdc974fe5be5c82a556e43a4df93f1de1/usr/src/uts/common/syscall/sigaction.c#L86
> > Link: [3] https://github.com/apple/darwin-xnu/blob/a449c6a3b8014d9406c2ddbdc81795da24aa7443/bsd/kern/kern_sig.c#L480
> > Link: [4] https://github.com/freebsd/freebsd/blob/eded70c37057857c6e23fae51f86b8f8f43cd2d0/sys/kern/kern_sig.c#L699
> > Link: [5] https://github.com/NetBSD/src/blob/3365779becdcedfca206091a645a0e8e22b2946e/sys/kern/sys_sig.c#L473
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > View this change in Gerrit: https://linux-review.googlesource.com/q/I35aab6f5be932505d90f3b3450c083b4db1eca86
> >
> > v10:
> > - rename SA_UAPI_FLAGS -> UAPI_SA_FLAGS
> > - refactor how we define it to avoid mentioning flags more
> >   than once
> >
> >  arch/arm/include/asm/signal.h    |  2 ++
> >  arch/parisc/include/asm/signal.h |  2 ++
> >  arch/x86/kernel/signal_compat.c  |  7 -------
> >  include/linux/signal_types.h     | 12 ++++++++++++
> >  kernel/signal.c                  | 10 ++++++++++
> >  5 files changed, 26 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
> > index 65530a042009..430be7774402 100644
> > --- a/arch/arm/include/asm/signal.h
> > +++ b/arch/arm/include/asm/signal.h
> > @@ -17,6 +17,8 @@ typedef struct {
> >       unsigned long sig[_NSIG_WORDS];
> >  } sigset_t;
> >
> > +#define __ARCH_UAPI_SA_FLAGS (SA_THIRTYTWO | SA_RESTORER)
> > +
> >  #define __ARCH_HAS_SA_RESTORER
> >
> >  #include <asm/sigcontext.h>
> > diff --git a/arch/parisc/include/asm/signal.h b/arch/parisc/include/asm/signal.h
> > index 715c96ba2ec8..30dd1e43ef88 100644
> > --- a/arch/parisc/include/asm/signal.h
> > +++ b/arch/parisc/include/asm/signal.h
> > @@ -21,6 +21,8 @@ typedef struct {
> >       unsigned long sig[_NSIG_WORDS];
> >  } sigset_t;
> >
> > +#define __ARCH_UAPI_SA_FLAGS _SA_SIGGFAULT
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
> > index f8a90ae9c6ec..a7887ad84d36 100644
> > --- a/include/linux/signal_types.h
> > +++ b/include/linux/signal_types.h
> > @@ -68,4 +68,16 @@ struct ksignal {
> >       int sig;
> >  };
> >
> > +#ifndef __ARCH_UAPI_SA_FLAGS
> > +#ifdef SA_RESTORER
> > +#define __ARCH_UAPI_SA_FLAGS SA_RESTORER
> > +#else
> > +#define __ARCH_UAPI_SA_FLAGS 0
> > +#endif
> > +#endif
> > +
> > +#define UAPI_SA_FLAGS                                                          \
> > +     (SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
> > +      SA_NODEFER | SA_RESETHAND | __ARCH_UAPI_SA_FLAGS)
> > +
>
> Part of me wants this to be closer to the common flag definitions.  But
> we don't really want to define this in the UAPI headers.

Agreed on keeping this out of uapi, otherwise I would have defined this inline.

> Unless you can think of another good place to put it, this is probably
> OK as-is.

Ack.

Peter

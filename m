Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968ED24ACA9
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Aug 2020 03:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgHTBhk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Aug 2020 21:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgHTBhi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Aug 2020 21:37:38 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C4DDC061757
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 18:37:38 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id o2so93679vkn.9
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 18:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gKTvb6rRSqMXDEBh8nSVMNQ9jlhlU4u1Q4WR4YaB9wo=;
        b=IkjCJE206Ry5PJPeWgXvpDJGyI8y8rGreXFCa5wAmKD72Q5qkPZQZBZIJG+b3a49oh
         SjX961QlAoL1MGo0v50RXPNYxWGOlQRIIQj+xujXPnDZg6l7v10MMq7Oi9R+7GDndufn
         EtEkr8sTfS5t7bJKDqcc4UTpZNgSgPVl/iq4bLjvg0oKVhq7YEycf4/OCiLat6IgI8RX
         HsFeLSzRG2G7lxksYLLsl7ckNzG/95N6CybljqQ/jeEEIHKVHxsBFVdhoLfBjETCkWob
         JGCpvnAJi7tCnUFYLCNbMrrrwJRQeGowspST5dbf4Jr5KoBiTUT/x92BJYHBuHY/oyXB
         Z1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKTvb6rRSqMXDEBh8nSVMNQ9jlhlU4u1Q4WR4YaB9wo=;
        b=rIgICxu9291O4bKxDs/dUhFA9yZ8lgtvDOXGINh/0E/LPjHGRHWXewzsOvBHlP+4Wz
         bnmlHzMa54p/ron1lAWZQ+ybkZOCdb6XNxVPA05iCYOAnc3+1dOKdq56RHdkrXlFxhrY
         ZdHmzj3i/ArDovuYSz69SqGkDRfRY5f42nriGgebWImIp4zSndzpQFZ0KfM4MqJLyKjD
         ZfgmqeEWdfrLN2lHiavhgOPN85q8Ydx4lIdl76utzvza//oZ1x/aUrLpml7zbdKeRBWe
         FmLJwn3Sgk2Hs2EPayKsvUOB7qjHJgPKkRAA8IngliHtb2yGvBqfWzl389HFLzIH6bR0
         Xjcw==
X-Gm-Message-State: AOAM531yyZVXoAJdk2rv6UwM5emuHOtM7Vu78NRgO9+JRb3zFOBc1LJB
        QP+6SitNYLTNI09wJVJe+yKyL+ghEOsg1ll2dD0AlQ==
X-Google-Smtp-Source: ABdhPJyOtCD6v4SUKtRTOzkaV5aVGEPqEAosmrbXvx4kcWCcTPfhegBfC3FNOHpDZ3CQ5pyGYKrv9PJEESkI5Bn3zlI=
X-Received: by 2002:ac5:ccdb:: with SMTP id j27mr287239vkn.43.1597887456981;
 Wed, 19 Aug 2020 18:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597720138.git.pcc@google.com> <e26271d2b3767cdbd265033e6f7eb28f828f3a28.1597720138.git.pcc@google.com>
 <20200819154028.GH6642@arm.com>
In-Reply-To: <20200819154028.GH6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Wed, 19 Aug 2020 18:37:25 -0700
Message-ID: <CAMn1gO5DebvFmUPcY=i_wKNZpdaybpCOdbZrDPsTQ32N5UQg7g@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] signal: define the field siginfo.si_xflags
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
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Aug 19, 2020 at 8:40 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Mon, Aug 17, 2020 at 08:33:50PM -0700, Peter Collingbourne wrote:
> > This field will contain flags that may be used by signal handlers to
> > determine whether other fields in the _sigfault portion of siginfo are
> > valid. An example use case is the following patch, which introduces
> > the si_addr_ignored_bits{,_mask} fields.
> >
> > A new sigcontext flag, SA_XFLAGS, is introduced in order to allow
> > a signal handler to require the kernel to set the field (but note
> > that the field will be set anyway if the kernel supports the flag,
> > regardless of its value). In combination with the previous patches,
> > this allows a userspace program to determine whether the kernel will
> > set the field.
> >
> > Ideally this field could have just been named si_flags, but that
> > name was already taken by ia64, so a different name was chosen.
> >
> > Alternatively, we may consider making ia64's si_flags a generic field
> > and having it appear at the end of _sigfault (in the same place as
> > this patch has si_xflags) on non-ia64, keeping it in the same place
> > on ia64. ia64's si_flags is a 32-bit field with only one flag bit
> > allocated, so we would have 31 bits to use if we do this.
>
> For clarity, is the new si_xflags field supposed to be valid for all
> signal types, or just certain signals and si_codes?

It is intended to be valid for all signal types that use the _sigfault
union member of siginfo. As listed in siginfo.h these are: SIGILL,
SIGFPE, SIGSEGV, SIGBUS, SIGTRAP, SIGEMT.

> What happens for things like a rt_sigqueueinfo() from userspace?

Hmm. Let's enumerate each of these things, which I believe are all of
the call sites of the function copy_siginfo_from_user and related
functions (correct me if I'm wrong):

- ptrace(PTRACE_SETSIGINFO)
- pidfd_send_signal
- rt_sigqueueinfo
- rt_tgsigqueueinfo

We can handle the last three by observing that the kernel forbids
sending a signal with these syscalls if si_code >= 0, so we can say
that the value of si_xflags is only valid if si_code >= 0.

As for the first one, it's more tricky. Arguably something like a
debugger should be able to send arbitrary signals to a debuggee, and
there's no reason why it shouldn't be able to set si_xflags in
siginfo, but on the other hand who knows how existing debuggers end up
setting this field today. Maybe all that we can do is have the kernel
clear si_xflags if it detects that the signal uses _sigfault, and let
si_xflags aware debuggers opt out of this behavior, perhaps by
introducing a PTRACE_SETSIGINFO2 or something.

> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > View this change in Gerrit: https://linux-review.googlesource.com/q/Ide155ce29366c3eab2a944ae4c51205982e5b8b2
> >
> >  arch/arm/include/asm/signal.h              |  3 ++-
> >  arch/parisc/include/asm/signal.h           |  2 +-
> >  arch/powerpc/platforms/powernv/vas-fault.c |  1 +
> >  include/linux/compat.h                     |  2 ++
> >  include/linux/signal_types.h               |  4 ++--
> >  include/uapi/asm-generic/siginfo.h         |  3 +++
> >  include/uapi/asm-generic/signal-defs.h     |  4 ++++
> >  kernel/signal.c                            | 15 +++++++++++++++
> >  8 files changed, 30 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
> > index d1070a783993..6b2630dfe1df 100644
> > --- a/arch/arm/include/asm/signal.h
> > +++ b/arch/arm/include/asm/signal.h
> > @@ -19,7 +19,8 @@ typedef struct {
> >
> >  #define SA_UAPI_FLAGS                                                          \
> >       (SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_THIRTYTWO |             \
> > -      SA_RESTORER | SA_ONSTACK | SA_RESTART | SA_NODEFER | SA_RESETHAND)
> > +      SA_RESTORER | SA_ONSTACK | SA_RESTART | SA_NODEFER | SA_RESETHAND |   \
> > +      SA_XFLAGS)
> >
> >  #define __ARCH_HAS_SA_RESTORER
> >
> > diff --git a/arch/parisc/include/asm/signal.h b/arch/parisc/include/asm/signal.h
> > index ad06e14f6e8a..3582bce44520 100644
> > --- a/arch/parisc/include/asm/signal.h
> > +++ b/arch/parisc/include/asm/signal.h
> > @@ -23,7 +23,7 @@ typedef struct {
> >
> >  #define SA_UAPI_FLAGS                                                          \
> >       (SA_ONSTACK | SA_RESETHAND | SA_NOCLDSTOP | SA_SIGINFO | SA_NODEFER |  \
> > -      SA_RESTART | SA_NOCLDWAIT | _SA_SIGGFAULT)
> > +      SA_RESTART | SA_NOCLDWAIT | _SA_SIGGFAULT | SA_XFLAGS)
> >
> >  #include <asm/sigcontext.h>
> >
> > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
> > index 3d21fce254b7..3bbb335561f5 100644
> > --- a/arch/powerpc/platforms/powernv/vas-fault.c
> > +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> > @@ -154,6 +154,7 @@ static void update_csb(struct vas_window *window,
> >       info.si_errno = EFAULT;
> >       info.si_code = SEGV_MAPERR;
> >       info.si_addr = csb_addr;
> > +     info.si_xflags = 0;
> >
> >       /*
> >        * process will be polling on csb.flags after request is sent to
> > diff --git a/include/linux/compat.h b/include/linux/compat.h
> > index d38c4d7e83bd..55d4228dfd88 100644
> > --- a/include/linux/compat.h
> > +++ b/include/linux/compat.h
> > @@ -231,7 +231,9 @@ typedef struct compat_siginfo {
> >                                       char _dummy_pkey[__COMPAT_ADDR_BND_PKEY_PAD];
> >                                       u32 _pkey;
> >                               } _addr_pkey;
> > +                             compat_uptr_t _pad[6];
> >                       };
> > +                     compat_uptr_t _xflags;
> >               } _sigfault;
> >
> >               /* SIGPOLL */
> > diff --git a/include/linux/signal_types.h b/include/linux/signal_types.h
> > index e792f29b5846..cd3d08dde47a 100644
> > --- a/include/linux/signal_types.h
> > +++ b/include/linux/signal_types.h
> > @@ -72,11 +72,11 @@ struct ksignal {
> >  #ifdef SA_RESTORER
> >  #define SA_UAPI_FLAGS                                                          \
> >       (SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
> > -      SA_NODEFER | SA_RESETHAND | SA_RESTORER)
> > +      SA_NODEFER | SA_RESETHAND | SA_RESTORER | SA_XFLAGS)
> >  #else
> >  #define SA_UAPI_FLAGS                                                          \
> >       (SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
> > -      SA_NODEFER | SA_RESETHAND)
> > +      SA_NODEFER | SA_RESETHAND | SA_XFLAGS)
> >  #endif
> >  #endif
> >
> > diff --git a/include/uapi/asm-generic/siginfo.h b/include/uapi/asm-generic/siginfo.h
> > index cb3d6c267181..413d804623c0 100644
> > --- a/include/uapi/asm-generic/siginfo.h
> > +++ b/include/uapi/asm-generic/siginfo.h
> > @@ -91,7 +91,9 @@ union __sifields {
> >                               char _dummy_pkey[__ADDR_BND_PKEY_PAD];
> >                               __u32 _pkey;
> >                       } _addr_pkey;
> > +                     void *_pad[6];
> >               };
> > +             unsigned long _xflags;
> >       } _sigfault;
> >
> >       /* SIGPOLL */
> > @@ -152,6 +154,7 @@ typedef struct siginfo {
> >  #define si_trapno    _sifields._sigfault._trapno
> >  #endif
> >  #define si_addr_lsb  _sifields._sigfault._addr_lsb
> > +#define si_xflags    _sifields._sigfault._xflags
> >  #define si_lower     _sifields._sigfault._addr_bnd._lower
> >  #define si_upper     _sifields._sigfault._addr_bnd._upper
> >  #define si_pkey              _sifields._sigfault._addr_pkey._pkey
> > diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
> > index c30a9c1a77b2..aeee6bb0763b 100644
> > --- a/include/uapi/asm-generic/signal-defs.h
> > +++ b/include/uapi/asm-generic/signal-defs.h
> > @@ -19,6 +19,9 @@
> >   * so this bit allows flag bit support to be detected from userspace while
> >   * allowing an old kernel to be distinguished from a kernel that supports every
> >   * flag bit.
> > + * SA_XFLAGS indicates that the signal handler requires the siginfo.si_xflags
> > + * field to be valid. Note that if the kernel supports SA_XFLAGS, the field will
> > + * be valid regardless of the value of this flag.
> >   *
> >   * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
> >   * Unix names RESETHAND and NODEFER respectively.
> > @@ -49,6 +52,7 @@
> >   * should be avoided for new generic flags: 3, 4, 5, 6, 7, 8, 9, 16, 24, 25, 26.
> >   */
> >  #define SA_UNSUPPORTED       0x00000400
> > +#define SA_XFLAGS    0x00000800
> >
> >  #define SA_NOMASK    SA_NODEFER
> >  #define SA_ONESHOT   SA_RESETHAND
> > diff --git a/kernel/signal.c b/kernel/signal.c
> > index 664a6c31137e..72182eed1b8d 100644
> > --- a/kernel/signal.c
> > +++ b/kernel/signal.c
> > @@ -1669,6 +1669,7 @@ int force_sig_fault_to_task(int sig, int code, void __user *addr
> >       info.si_flags = flags;
> >       info.si_isr = isr;
> >  #endif
> > +     info.si_xflags = 0;
> >       return force_sig_info_to_task(&info, t);
> >  }
> >
> > @@ -1701,6 +1702,7 @@ int send_sig_fault(int sig, int code, void __user *addr
> >       info.si_flags = flags;
> >       info.si_isr = isr;
> >  #endif
> > +     info.si_xflags = 0;
> >       return send_sig_info(info.si_signo, &info, t);
> >  }
> >
> > @@ -1715,6 +1717,7 @@ int force_sig_mceerr(int code, void __user *addr, short lsb)
> >       info.si_code = code;
> >       info.si_addr = addr;
> >       info.si_addr_lsb = lsb;
> > +     info.si_xflags = 0;
> >       return force_sig_info(&info);
> >  }
> >
> > @@ -1729,6 +1732,7 @@ int send_sig_mceerr(int code, void __user *addr, short lsb, struct task_struct *
> >       info.si_code = code;
> >       info.si_addr = addr;
> >       info.si_addr_lsb = lsb;
> > +     info.si_xflags = 0;
> >       return send_sig_info(info.si_signo, &info, t);
> >  }
> >  EXPORT_SYMBOL(send_sig_mceerr);
> > @@ -1744,6 +1748,7 @@ int force_sig_bnderr(void __user *addr, void __user *lower, void __user *upper)
> >       info.si_addr  = addr;
> >       info.si_lower = lower;
> >       info.si_upper = upper;
> > +     info.si_xflags = 0;
> >       return force_sig_info(&info);
> >  }
> >
> > @@ -1758,6 +1763,7 @@ int force_sig_pkuerr(void __user *addr, u32 pkey)
> >       info.si_code  = SEGV_PKUERR;
> >       info.si_addr  = addr;
> >       info.si_pkey  = pkey;
> > +     info.si_xflags = 0;
> >       return force_sig_info(&info);
> >  }
> >  #endif
> > @@ -1774,6 +1780,7 @@ int force_sig_ptrace_errno_trap(int errno, void __user *addr)
> >       info.si_errno = errno;
> >       info.si_code  = TRAP_HWBKPT;
> >       info.si_addr  = addr;
> > +     info.si_xflags = 0;
> >       return force_sig_info(&info);
> >  }
> >
> > @@ -3290,6 +3297,7 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
> >  #ifdef __ARCH_SI_TRAPNO
> >               to->si_trapno = from->si_trapno;
> >  #endif
> > +             to->si_xflags = from->si_xflags;
> >               break;
> >       case SIL_FAULT_MCEERR:
> >               to->si_addr = ptr_to_compat(from->si_addr);
> > @@ -3297,6 +3305,7 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
> >               to->si_trapno = from->si_trapno;
> >  #endif
> >               to->si_addr_lsb = from->si_addr_lsb;
> > +             to->si_xflags = from->si_xflags;
> >               break;
> >       case SIL_FAULT_BNDERR:
> >               to->si_addr = ptr_to_compat(from->si_addr);
> > @@ -3305,6 +3314,7 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
> >  #endif
> >               to->si_lower = ptr_to_compat(from->si_lower);
> >               to->si_upper = ptr_to_compat(from->si_upper);
> > +             to->si_xflags = from->si_xflags;
> >               break;
> >       case SIL_FAULT_PKUERR:
> >               to->si_addr = ptr_to_compat(from->si_addr);
> > @@ -3312,6 +3322,7 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
> >               to->si_trapno = from->si_trapno;
> >  #endif
> >               to->si_pkey = from->si_pkey;
> > +             to->si_xflags = from->si_xflags;
> >               break;
> >       case SIL_CHLD:
> >               to->si_pid = from->si_pid;
> > @@ -3370,6 +3381,7 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
> >  #ifdef __ARCH_SI_TRAPNO
> >               to->si_trapno = from->si_trapno;
> >  #endif
> > +             to->si_xflags = from->si_xflags;
> >               break;
> >       case SIL_FAULT_MCEERR:
> >               to->si_addr = compat_ptr(from->si_addr);
> > @@ -3377,6 +3389,7 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
> >               to->si_trapno = from->si_trapno;
> >  #endif
> >               to->si_addr_lsb = from->si_addr_lsb;
> > +             to->si_xflags = from->si_xflags;
> >               break;
> >       case SIL_FAULT_BNDERR:
> >               to->si_addr = compat_ptr(from->si_addr);
> > @@ -3385,6 +3398,7 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
> >  #endif
> >               to->si_lower = compat_ptr(from->si_lower);
> >               to->si_upper = compat_ptr(from->si_upper);
> > +             to->si_xflags = from->si_xflags;
> >               break;
> >       case SIL_FAULT_PKUERR:
> >               to->si_addr = compat_ptr(from->si_addr);
> > @@ -3392,6 +3406,7 @@ static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
> >               to->si_trapno = from->si_trapno;
> >  #endif
> >               to->si_pkey = from->si_pkey;
> > +             to->si_xflags = from->si_xflags;
>
> How did you figure out the list of places to make these changes?  I'm
> not sure how to confirm that it's exhaustive.

I looked for all places in the kernel where the si_addr field was
being assigned to (basically: git grep '\bsi_addr\s*=') and added my
code there.

> It's a shame if we can't simply apply the change in one place.
> Would the refactoring be too invasive to accomplish that?

I believe that Eric mentioned that kernel/signal.c is supposed to be
"the" file that knows about all of the fields of siginfo (I'm not sure
what's going on in arch/powerpc, I think that's a recent regression).
Maybe it's possible to eliminate the duplication between the various
SIL_FAULT* cases, but aside from that it looks like there wouldn't be
much duplication in the rest of the code.

Peter

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F33284534
	for <lists+linux-parisc@lfdr.de>; Tue,  6 Oct 2020 07:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgJFFHQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 6 Oct 2020 01:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgJFFHP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 6 Oct 2020 01:07:15 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2168EC0613A7
        for <linux-parisc@vger.kernel.org>; Mon,  5 Oct 2020 22:07:14 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id d18so3000350uae.0
        for <linux-parisc@vger.kernel.org>; Mon, 05 Oct 2020 22:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hWLjhGkqbZFC6nOFVa9ywMvgz97NjS3ZmWCK+dVIjPc=;
        b=YZHSNlaSMkhK9ejBzmStkTNtd0c8Wp3eL6TzgfeDEcrgHSJnVwhVogZgUCjTqsg//6
         543puwoQuyoWaNZIyrsI5O/jIRUZUk5/RlVIkPrY+kPeWB+VE7ldgOkvZO3YY2ZJ8ra/
         rKvMSzV6/R+Rd8eZCBWZb7Aja6J0iDaqnZa+Q4QI9Tb3rsgB+ChdjfoBTS91krctDNaK
         5xOq+ijfTcr1Y6me5wa1Z0OawTgryglKgYESkUeQyMXbtmIarT983XrlWDmajpHZzTNR
         cNOXOUTa11xYDNSIGAraAjecfmQGnfq91j//fpXRdsst0v1JBFoshbLPwNfR8/aLRRsH
         v2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hWLjhGkqbZFC6nOFVa9ywMvgz97NjS3ZmWCK+dVIjPc=;
        b=eBWOwxmMJ0z1R5QBC8rOBbQl78eUhYVXzsfo6zgGL3fBplXutGWNMMvhyZ3+3mLOLJ
         aqaDM8aMdlQpFXfbO1XT+v8ggp8JtTwo/A4WScGeqSlwk77nq68B1jLWpl8+lrFArHFe
         JR52XwDRlURjb9XIZA2WpGPKLYe3b/vPIqvEtZNwad+ePyiI3Zvv/ABHpc35tr+SN5b+
         JBFzk36oVHkBOvRlcfUXsrgWmsxrf2Q9hij/gcjBYABDM4rbrhgg1C7C3Jy0DGG/JnJa
         /G6b8mio9nNIeRT1S6dwBi7ySaB6nZWauQe1U6yhyXbBu4ZD2dyRaoBsOxB39QBPUaao
         /Inw==
X-Gm-Message-State: AOAM531o4fDbcxBjVaEt6hcZKdhEloFeK0f9Dn+bHTTHG3dhoQ9VO4S2
        jlpxMrAXol93J/6DszAUGzQwQL1hfI7xQ+4ewtrf9g==
X-Google-Smtp-Source: ABdhPJyQLxOLJ7mdK7++OOOyQxYjkyvnR+aK0AE3LH66ksxwpExJGkFzOe2pq90oJMFm8b2cuHii0SJvUeiLLHbNaIw=
X-Received: by 2002:ab0:7718:: with SMTP id z24mr1941926uaq.92.1601960833001;
 Mon, 05 Oct 2020 22:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598072840.git.pcc@google.com> <a360ad2d44d0971f5864033022b53fbdcf105b90.1598072840.git.pcc@google.com>
 <20200908151326.GV6642@arm.com>
In-Reply-To: <20200908151326.GV6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Mon, 5 Oct 2020 22:07:01 -0700
Message-ID: <CAMn1gO42arQKGBj1Nnbs86TGYyogpRR_t73H=GbTmQrbAbV30A@mail.gmail.com>
Subject: Re: [PATCH v10 5/7] signal: deduplicate code dealing with common
 _sigfault fields
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

On Tue, Sep 8, 2020 at 8:13 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Fri, Aug 21, 2020 at 10:10:15PM -0700, Peter Collingbourne wrote:
> > We're about to add more common _sigfault fields, so deduplicate the
> > existing code for initializing _sigfault fields in {send,force}_sig_*,
> > and for copying _sigfault fields in copy_siginfo_to_external32 and
> > post_copy_siginfo_from_user32, to reduce the number of places that
> > will need to be updated by upcoming changes.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > View this change in Gerrit: https://linux-review.googlesource.com/q/I4f56174e1b7b2bf4a3c8139e6879cbfd52750a24
> >
> >  include/linux/signal.h |  13 ++++++
> >  kernel/signal.c        | 101 ++++++++++++++++-------------------------
> >  2 files changed, 53 insertions(+), 61 deletions(-)
> >
> > diff --git a/include/linux/signal.h b/include/linux/signal.h
> > index 6bb1a3f0258c..3edbf54493ee 100644
> > --- a/include/linux/signal.h
> > +++ b/include/linux/signal.h
> > @@ -50,6 +50,19 @@ enum siginfo_layout {
> >
> >  enum siginfo_layout siginfo_layout(unsigned sig, int si_code);
> >
> > +static inline bool siginfo_layout_is_fault(enum siginfo_layout layout)
> > +{
> > +     switch (layout) {
> > +     case SIL_FAULT:
> > +     case SIL_FAULT_MCEERR:
> > +     case SIL_FAULT_BNDERR:
> > +     case SIL_FAULT_PKUERR:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> >  /*
> >   * Define some primitives to manipulate sigset_t.
> >   */
> > diff --git a/kernel/signal.c b/kernel/signal.c
> > index c80e70bde11d..4ee9dc03f20f 100644
> > --- a/kernel/signal.c
> > +++ b/kernel/signal.c
> > @@ -1649,6 +1649,15 @@ void force_sigsegv(int sig)
> >       force_sig(SIGSEGV);
> >  }
> >
> > +static void set_sigfault_common_fields(struct kernel_siginfo *info, int sig,
> > +                                    int code, void __user *addr)
> > +{
> > +     info->si_signo = sig;
> > +     info->si_errno = 0;
> > +     info->si_code = code;
> > +     info->si_addr = addr;
> > +}
> > +
> >  int force_sig_fault_to_task(int sig, int code, void __user *addr
> >       ___ARCH_SI_TRAPNO(int trapno)
> >       ___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr)
> > @@ -1657,10 +1666,7 @@ int force_sig_fault_to_task(int sig, int code, void __user *addr
> >       struct kernel_siginfo info;
> >
> >       clear_siginfo(&info);
> > -     info.si_signo = sig;
> > -     info.si_errno = 0;
> > -     info.si_code  = code;
> > -     info.si_addr  = addr;
> > +     set_sigfault_common_fields(&info, sig, code, addr);
> >  #ifdef __ARCH_SI_TRAPNO
> >       info.si_trapno = trapno;
> >  #endif
> > @@ -1689,10 +1695,7 @@ int send_sig_fault(int sig, int code, void __user *addr
> >       struct kernel_siginfo info;
> >
> >       clear_siginfo(&info);
> > -     info.si_signo = sig;
> > -     info.si_errno = 0;
> > -     info.si_code  = code;
> > -     info.si_addr  = addr;
> > +     set_sigfault_common_fields(&info, sig, code, addr);
> >  #ifdef __ARCH_SI_TRAPNO
> >       info.si_trapno = trapno;
> >  #endif
> > @@ -1710,10 +1713,7 @@ int force_sig_mceerr(int code, void __user *addr, short lsb)
> >
> >       WARN_ON((code != BUS_MCEERR_AO) && (code != BUS_MCEERR_AR));
> >       clear_siginfo(&info);
> > -     info.si_signo = SIGBUS;
> > -     info.si_errno = 0;
> > -     info.si_code = code;
> > -     info.si_addr = addr;
> > +     set_sigfault_common_fields(&info, SIGBUS, code, addr);
> >       info.si_addr_lsb = lsb;
> >       return force_sig_info(&info);
> >  }
> > @@ -1724,10 +1724,7 @@ int send_sig_mceerr(int code, void __user *addr, short lsb, struct task_struct *
> >
> >       WARN_ON((code != BUS_MCEERR_AO) && (code != BUS_MCEERR_AR));
> >       clear_siginfo(&info);
> > -     info.si_signo = SIGBUS;
> > -     info.si_errno = 0;
> > -     info.si_code = code;
> > -     info.si_addr = addr;
> > +     set_sigfault_common_fields(&info, SIGBUS, code, addr);
> >       info.si_addr_lsb = lsb;
> >       return send_sig_info(info.si_signo, &info, t);
> >  }
> > @@ -1738,10 +1735,7 @@ int force_sig_bnderr(void __user *addr, void __user *lower, void __user *upper)
> >       struct kernel_siginfo info;
> >
> >       clear_siginfo(&info);
> > -     info.si_signo = SIGSEGV;
> > -     info.si_errno = 0;
> > -     info.si_code  = SEGV_BNDERR;
> > -     info.si_addr  = addr;
> > +     set_sigfault_common_fields(&info, SIGSEGV, SEGV_BNDERR, addr);
> >       info.si_lower = lower;
> >       info.si_upper = upper;
> >       return force_sig_info(&info);
> > @@ -1753,10 +1747,7 @@ int force_sig_pkuerr(void __user *addr, u32 pkey)
> >       struct kernel_siginfo info;
> >
> >       clear_siginfo(&info);
> > -     info.si_signo = SIGSEGV;
> > -     info.si_errno = 0;
> > -     info.si_code  = SEGV_PKUERR;
> > -     info.si_addr  = addr;
> > +     set_sigfault_common_fields(&info, SIGSEGV, SEGV_PKUERR, addr);
> >       info.si_pkey  = pkey;
> >       return force_sig_info(&info);
> >  }
> > @@ -1770,10 +1761,8 @@ int force_sig_ptrace_errno_trap(int errno, void __user *addr)
> >       struct kernel_siginfo info;
> >
> >       clear_siginfo(&info);
> > -     info.si_signo = SIGTRAP;
> > +     set_sigfault_common_fields(&info, SIGTRAP, TRAP_HWBKPT, addr);
> >       info.si_errno = errno;
> > -     info.si_code  = TRAP_HWBKPT;
> > -     info.si_addr  = addr;
> >       return force_sig_info(&info);
> >  }
> >
> > @@ -3266,12 +3255,23 @@ int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from)
> >  void copy_siginfo_to_external32(struct compat_siginfo *to,
> >               const struct kernel_siginfo *from)
> >  {
> > +     enum siginfo_layout layout =
> > +             siginfo_layout(from->si_signo, from->si_code);
> > +
> >       memset(to, 0, sizeof(*to));
> >
> >       to->si_signo = from->si_signo;
> >       to->si_errno = from->si_errno;
> >       to->si_code  = from->si_code;
> > -     switch(siginfo_layout(from->si_signo, from->si_code)) {
> > +
> > +     if (siginfo_layout_is_fault(layout)) {
> > +             to->si_addr = ptr_to_compat(from->si_addr);
> > +#ifdef __ARCH_SI_TRAPNO
> > +             to->si_trapno = from->si_trapno;
> > +#endif
> > +     }
> > +
> > +     switch (layout) {
>
> I find the code flow slightly awkward with this change, because the
> fault signal fields are populated partly in the if() above and partly
> in the switch().  Previously, only the universal stuff was done outside.
>
> Would this be easier on future maintainers if we pulled the common
> stuff out into a helper and then called it from the appropriate switch
> cases?  The compiler will probably output some duplicated code in that
> case (depending on how clever it is at undoing the duplication), but
> the amount of affected code is small.

I'm not sure about that. One advantage of the current code structure
is that we end up with siginfo_layout_is_fault containing our single
canonical list of layouts that use the sigfault union member. With
your proposed code structure, the only caller of
siginfo_layout_is_fault would be the code that the next patch adds to
kernel/ptrace.c, which needs to know which layouts use sigfault so
that it can clear si_xflags, and that could relatively easily get out
of sync by accident since it's dealing with a less common case.

That being said, perhaps we could say that a caller of
ptrace(PTRACE_SETSIGINFO) is by definition old, so it wouldn't be
using that API to send signals with new siginfo layouts. That would
preclude a client from upgrading its knowledge of si_xflags
independently of its knowledge of new layouts though, and there would
be nothing preventing a new caller of siginfo_layout_is_fault being
added that would be exposed to new user code.

Peter

> >       case SIL_KILL:
> >               to->si_pid = from->si_pid;
> >               to->si_uid = from->si_uid;
> > @@ -3286,31 +3286,15 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
> >               to->si_fd   = from->si_fd;
> >               break;
> >       case SIL_FAULT:
> > -             to->si_addr = ptr_to_compat(from->si_addr);
> > -#ifdef __ARCH_SI_TRAPNO
> > -             to->si_trapno = from->si_trapno;
> > -#endif
> >               break;
> >       case SIL_FAULT_MCEERR:
> > -             to->si_addr = ptr_to_compat(from->si_addr);
> > -#ifdef __ARCH_SI_TRAPNO
> > -             to->si_trapno = from->si_trapno;
> > -#endif
> >               to->si_addr_lsb = from->si_addr_lsb;
> >               break;
> >       case SIL_FAULT_BNDERR:
> > -             to->si_addr = ptr_to_compat(from->si_addr);
> > -#ifdef __ARCH_SI_TRAPNO
> > -             to->si_trapno = from->si_trapno;
> > -#endif
> >               to->si_lower = ptr_to_compat(from->si_lower);
> >               to->si_upper = ptr_to_compat(from->si_upper);
> >               break;
> >       case SIL_FAULT_PKUERR:
> > -             to->si_addr = ptr_to_compat(from->si_addr);
> > -#ifdef __ARCH_SI_TRAPNO
> > -             to->si_trapno = from->si_trapno;
> > -#endif
> >               to->si_pkey = from->si_pkey;
> >               break;
> >       case SIL_CHLD:
> > @@ -3347,11 +3331,22 @@ int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
> >  static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
> >                                        const struct compat_siginfo *from)
> >  {
> > +     enum siginfo_layout layout =
> > +             siginfo_layout(from->si_signo, from->si_code);
> > +
> >       clear_siginfo(to);
> >       to->si_signo = from->si_signo;
> >       to->si_errno = from->si_errno;
> >       to->si_code  = from->si_code;
> > -     switch(siginfo_layout(from->si_signo, from->si_code)) {
> > +
> > +     if (siginfo_layout_is_fault(layout)) {
> > +             to->si_addr = compat_ptr(from->si_addr);
> > +#ifdef __ARCH_SI_TRAPNO
> > +             to->si_trapno = from->si_trapno;
> > +#endif
> > +     }
> > +
> > +     switch (layout) {
>
> Same comment as for copy_siginfo_to_external32()?
>
> [...]
>
> Otherwise, looks reasonable.
>
> Cheers
> ---Dave

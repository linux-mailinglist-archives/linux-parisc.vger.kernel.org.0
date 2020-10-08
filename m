Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D962286CAF
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Oct 2020 04:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbgJHCVi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 7 Oct 2020 22:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbgJHCVi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 7 Oct 2020 22:21:38 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D7BC061755
        for <linux-parisc@vger.kernel.org>; Wed,  7 Oct 2020 19:21:37 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id 5so2244969vsu.5
        for <linux-parisc@vger.kernel.org>; Wed, 07 Oct 2020 19:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Axxhf8ZkvoK3/mfrSUKF8oGt4VS3vK3Lrcneu1e8L88=;
        b=v+1peSPo8jWRRDNt+oe7uWRGJT1Cx+rKqW0VmqyLko+/LFp7ZVm27l70gJmLzMkpKg
         1LIFFF+v+WZNEF/apGUKuGTVGWqT/U70lmugwnSM+R7z5SDGp+rdkNd2+b2PU+R3xg/O
         aldSoTPSH98TA465gGvx93g2yzMLMr94MUugxgAFMDAjo5N3MNGaChBddyY//4X8xUb4
         BJtQkBIVZ6C/12b2GzZwyzQXaffY+8pdQ3QvgByeEMf9RFFF7kpnK4N18U5tYbfoe8P7
         lwZBxatmXdI48DEb9BovyFsmEOfroWIyhhHOyIwOzgHU/mrwrgrBrn/tAyKL3DmFm9Eh
         snKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Axxhf8ZkvoK3/mfrSUKF8oGt4VS3vK3Lrcneu1e8L88=;
        b=YjzKPUWxNRT/OpQhPLpXsG7KPN871lqL0HjdB7kNPKYa3QjVMK/Qql8zJrncfU2ztp
         feWiZc3b4t/dgEcI0tryrt8nhR1OE3/LIrRKudsFglXLXydVhoki5ekSUPmKmLpnHAi1
         J37gvDFTCd6YSk9anNAlJICSvMBlSsTFt5ADCKI+VLnTqBjIPj1GtppHvxE6PeLDzPZX
         emf5SRBd8tqQVmnPDq5aiZ0wg2DehFCvOVI3PvSObuSynANN8V1VrUsSvj30hDdEic60
         AxF4RRR09cZXjBP3WiC7zKjoBkkCZKp+IE5NBhojVCFwbu4mFvZ7PpDkviL2VJQUvT0s
         Kzzg==
X-Gm-Message-State: AOAM5308gt/w3vZmJMYFYAqe0DNy+y+pTdJHuiEC+yznUCTJ0BugXBWs
        pvLYUrgHpQZq/VCVkoEKWbM4KIKnqu7IFCUT+Nw06w==
X-Google-Smtp-Source: ABdhPJymxAJWqwBnUdup+hN8zHGr6Ar4GjhvxJInxM3dkRrFARGBivPvUPWt8CZqxM+Ty4+UTbt++dw3MDraOFOq33c=
X-Received: by 2002:a67:d84:: with SMTP id 126mr3398875vsn.51.1602123696606;
 Wed, 07 Oct 2020 19:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598072840.git.pcc@google.com> <f37a8b86c53be4cc440a73be4123e0419deefe5f.1598072840.git.pcc@google.com>
 <20200908151306.GU6642@arm.com>
In-Reply-To: <20200908151306.GU6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Wed, 7 Oct 2020 19:21:25 -0700
Message-ID: <CAMn1gO6rNqb-_Rm=7zXaRdP-QvcO5JfnUSBqj3E1uYe2T+YAiw@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] signal: define the SA_UNSUPPORTED bit in sa_flags
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
> On Fri, Aug 21, 2020 at 10:10:14PM -0700, Peter Collingbourne wrote:
>
> Nit: no statement of the chage being made (other than in the subject
> line).

Will fix.

> > This bit will never be supported in the uapi. The purpose of this flag
> > bit is to allow userspace to distinguish an old kernel that does not
> > clear unknown sa_flags bits from a kernel that supports every flag bit.
> >
> > In other words, if userspace finds that this bit remains set in
> > oldact.sa_flags, it means that the kernel cannot be trusted to have
> > cleared unknown flag bits from sa_flags, so no assumptions about flag
> > bit support can be made.
>
> This isn't quite right?  After a single sigaction() call, oact will
> contain the sa_flags for the previously registered handler.  So a
> second sigaction() call would be needed to find out the newly effective
> sa_flags.

You're right, this is unclear to say the least. In v11 I will reword like so:

    In other words, if userspace does something like:

      act.sa_flags |= SA_UNSUPPORTED;
      sigaction(SIGSEGV, &act, 0);
      sigaction(SIGSEGV, 0, &oldact);

    and finds that SA_UNSUPPORTED remains set in oldact.sa_flags, it means
    that the kernel cannot be trusted to have cleared unknown flag bits
    from sa_flags, so no assumptions about flag bit support can be made.

> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > View this change in Gerrit: https://linux-review.googlesource.com/q/Ic2501ad150a3a79c1cf27fb8c99be342e9dffbcb
> >
> >  include/uapi/asm-generic/signal-defs.h | 7 +++++++
> >  kernel/signal.c                        | 6 ++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
> > index 319628058a53..e853cbe8722d 100644
> > --- a/include/uapi/asm-generic/signal-defs.h
> > +++ b/include/uapi/asm-generic/signal-defs.h
> > @@ -14,6 +14,12 @@
> >   * SA_RESTART flag to get restarting signals (which were the default long ago)
> >   * SA_NODEFER prevents the current signal from being masked in the handler.
> >   * SA_RESETHAND clears the handler when the signal is delivered.
> > + * SA_UNSUPPORTED is a flag bit that will never be supported. Kernels from
> > + * before the introduction of SA_UNSUPPORTED did not clear unknown bits from
> > + * sa_flags when read using the oldact argument to sigaction and rt_sigaction,
> > + * so this bit allows flag bit support to be detected from userspace while
> > + * allowing an old kernel to be distinguished from a kernel that supports every
> > + * flag bit.
> >   *
> >   * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
> >   * Unix names RESETHAND and NODEFER respectively.
> > @@ -42,6 +48,7 @@
> >  #ifndef SA_RESETHAND
> >  #define SA_RESETHAND 0x80000000
> >  #endif
> > +#define SA_UNSUPPORTED       0x00000400
>
> I guess people may debate which bit is chosen, but your consolidation
> of these definitions should help to reduce the possibility of future
> collisions.  This bit appears unused for now, so I guess I don't have a
> strong opinion.
>
> >  #define SA_NOMASK    SA_NODEFER
> >  #define SA_ONESHOT   SA_RESETHAND
> > diff --git a/kernel/signal.c b/kernel/signal.c
> > index f802c82c7bcc..c80e70bde11d 100644
> > --- a/kernel/signal.c
> > +++ b/kernel/signal.c
> > @@ -3984,6 +3984,12 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
> >       if (oact)
> >               *oact = *k;
> >
> > +     /*
> > +      * Make sure that we never accidentally claim to support SA_UNSUPPORTED,
> > +      * e.g. by having an architecture use the bit in their uapi.
> > +      */
> > +     BUILD_BUG_ON(UAPI_SA_FLAGS & SA_UNSUPPORTED);
> > +
>
> Seems reasonable.
>
> With the above rewording in the commit message to clarify that a second
> sigaction() is needed:
>
> Reviewed-by: Dave Martin <Dave.Martin@arm.com>

Thanks for the review.

Peter

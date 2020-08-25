Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57F1250E33
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Aug 2020 03:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgHYB2F (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 24 Aug 2020 21:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgHYB2F (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 24 Aug 2020 21:28:05 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA72C061795
        for <linux-parisc@vger.kernel.org>; Mon, 24 Aug 2020 18:28:04 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id t13so9021241ile.9
        for <linux-parisc@vger.kernel.org>; Mon, 24 Aug 2020 18:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SB8RWE8ob3xziaFEC5nb8LonIMAGKaY28tqmr0Th24c=;
        b=qXuM3pHfe0kHwiTDrvp2DWLFrlwDf9OcxJIUjYVOucVyCH8qnvat8Xek+nt3jRmWYv
         aWDzr41uCPwuYV52G3HDITw499mkkFoPhphdckHas//Yf15SBSauN13ERNPkYRILydhV
         gPYGmx1cNqjNJUI+HZZzwQtk2HgbbZLSAYAUC7sEf8Skwzj3ACOYenChwGDdM5HCJs50
         RX1SAmLfZaaIJ3x2EOeRLj+fdZIXNoV+puknu5EWbGyxMImKjF8IfJ89tHxKiAvdZOHb
         pN1V5k0/dGZWPiQ7oThyfR8e29Stv8ODWqqOHK5HHQvK2DYVTjnR/tbbar/fcvRkN2oB
         VBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SB8RWE8ob3xziaFEC5nb8LonIMAGKaY28tqmr0Th24c=;
        b=YoD8Ln64yTmEv6qZ/Ymku34t9IYZFdgUvA7uky0ydkxGUZ/MBhN7PgIVjcUYJskhb5
         PYf3BQeeJRC6uSayMhNwQel8f3CTjzzFW40ijMZ2L264EVZlQXBlviyMmizKQkbYh04K
         EEexHldqNzmBOM/ObgVeMFcFxY/58gC+VI8o3t2KuxzgqE0PG2bcCm1En0sdEE8wG/es
         rhkTR6QofmZeSgJJQLBgRq13CDDUv+/UTWSot8uJ0e/EHERX1KTxEG3DN20C9pYVTUD5
         nH3ZWInVSa+QlVipBFYOWDMft19AKqFNio7N0D7XTa3JzPL09yDPm6vxWAe5wBaDKfZE
         hOqg==
X-Gm-Message-State: AOAM531y1wXELOw64934QOepOTWfJLpK6eM8LsL0SkaTbpEMCi7Q5DbJ
        2jgfLRq9A/bMmnxBJGT3+uyRPjbXXzYKZn2NhExGs2FAxodbkysf
X-Google-Smtp-Source: ABdhPJw4Ra3YVZRlknonk35uFgRIq2XYFcZLP6dJh15CNrzEJIXVKTpQezzKApl5WJmOgL1wXivfZhNC54QsjvTEMZw=
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr7464958ilq.145.1598318882712;
 Mon, 24 Aug 2020 18:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597720138.git.pcc@google.com> <e26271d2b3767cdbd265033e6f7eb28f828f3a28.1597720138.git.pcc@google.com>
 <20200819154028.GH6642@arm.com> <CAMn1gO5DebvFmUPcY=i_wKNZpdaybpCOdbZrDPsTQ32N5UQg7g@mail.gmail.com>
 <20200824140319.GM6642@arm.com>
In-Reply-To: <20200824140319.GM6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Mon, 24 Aug 2020 18:27:51 -0700
Message-ID: <CAMn1gO7KiL4e-O=-bj1Ur1CLKQJ=pOuVnwDBUma0jyE443ODeg@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] signal: define the field siginfo.si_xflags
To:     Dave Martin <Dave.Martin@arm.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Aug 24, 2020 at 7:03 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Wed, Aug 19, 2020 at 06:37:25PM -0700, Peter Collingbourne wrote:
> > On Wed, Aug 19, 2020 at 8:40 AM Dave Martin <Dave.Martin@arm.com> wrote:
> > >
> > > On Mon, Aug 17, 2020 at 08:33:50PM -0700, Peter Collingbourne wrote:
> > > > This field will contain flags that may be used by signal handlers to
> > > > determine whether other fields in the _sigfault portion of siginfo are
> > > > valid. An example use case is the following patch, which introduces
> > > > the si_addr_ignored_bits{,_mask} fields.
> > > >
> > > > A new sigcontext flag, SA_XFLAGS, is introduced in order to allow
> > > > a signal handler to require the kernel to set the field (but note
> > > > that the field will be set anyway if the kernel supports the flag,
> > > > regardless of its value). In combination with the previous patches,
> > > > this allows a userspace program to determine whether the kernel will
> > > > set the field.
> > > >
> > > > Ideally this field could have just been named si_flags, but that
> > > > name was already taken by ia64, so a different name was chosen.
> > > >
> > > > Alternatively, we may consider making ia64's si_flags a generic field
> > > > and having it appear at the end of _sigfault (in the same place as
> > > > this patch has si_xflags) on non-ia64, keeping it in the same place
> > > > on ia64. ia64's si_flags is a 32-bit field with only one flag bit
> > > > allocated, so we would have 31 bits to use if we do this.
> > >
> > > For clarity, is the new si_xflags field supposed to be valid for all
> > > signal types, or just certain signals and si_codes?
> >
> > It is intended to be valid for all signal types that use the _sigfault
> > union member of siginfo. As listed in siginfo.h these are: SIGILL,
> > SIGFPE, SIGSEGV, SIGBUS, SIGTRAP, SIGEMT.
>
> SIGSYS is similar to SIGILL, is that included also?

I think that SIGSYS is covered by a separate _sigsys union member.

> > > What happens for things like a rt_sigqueueinfo() from userspace?
> >
> > Hmm. Let's enumerate each of these things, which I believe are all of
> > the call sites of the function copy_siginfo_from_user and related
> > functions (correct me if I'm wrong):
> >
> > - ptrace(PTRACE_SETSIGINFO)
> > - pidfd_send_signal
> > - rt_sigqueueinfo
> > - rt_tgsigqueueinfo
> >
> > We can handle the last three by observing that the kernel forbids
> > sending a signal with these syscalls if si_code >= 0, so we can say
> > that the value of si_xflags is only valid if si_code >= 0.
>
> Hmmm, that's what the code says (actually >= 0 or SI_TKILL), but it's
> illogical.  Those are user signals, so there's no obvious reason why
> userspace shouldn't be allowed to generate their siginfo.  It would
> probably be better for the kernel to police si_pid etc. in the SI_USER
> and SI_TKILL cases rather than flatly refusing, but I guess that's a
> discussion for another day.
>
> I guess the combination of SI_FROMKERNEL() and the signal number being a
> known fault signal if probably sufficient for now.

In v10 I ended up adding a comment saying that si_xflags is only valid
if 0 <= si_code < SI_KERNEL (the SI_KERNEL part was due to my
discovery of kernel code that was calling force_sig(SIGSEGV) where
force_sig uses the _kill union member). Your comment about SI_USER
made me realize that is not exactly true (since kill and
pidfd_send_signal can send a fault signal with si_code == SI_USER). I
was not aware of the SI_FROMKERNEL() macro. In v11 I will update the
comment to say that SI_FROMKERNEL(si) && si->si_code != SI_KERNEL must
be true in order for si_xflags to be valid.

> It might be helpful to have a helper to identify fault signals, but we
> don't have this today, and it's unlikely that a new kind of fault signal
> will crop up any time soon.
>
> Handlers that handle specific signal types won't care, but debuggers and
> generic backtracer code would have to be hand-hacked to add new kinds of
> fault signal today -- not a huge priority though, and orthogonal to this
> series.
>
> > As for the first one, it's more tricky. Arguably something like a
> > debugger should be able to send arbitrary signals to a debuggee, and
> > there's no reason why it shouldn't be able to set si_xflags in
> > siginfo, but on the other hand who knows how existing debuggers end up
> > setting this field today. Maybe all that we can do is have the kernel
> > clear si_xflags if it detects that the signal uses _sigfault, and let
> > si_xflags aware debuggers opt out of this behavior, perhaps by
> > introducing a PTRACE_SETSIGINFO2 or something.
>
> Most likely a debugger usually amends an existing siginfo from a trapped
> signal than generating a new one from scratch.

Right, but it could have copied the fields by hand from a
kernel-supplied siginfo before amending it.

> Given the other things that ptrace can do to the target process I don't
> think we need to police here, but your suggestion about a
> PTRACE_SETSIGINFO2 or similar, and zeroing this field by default with
> PTRACE_SETSIGINFO, does make sense.

Ack. I've implemented that in v10.

Peter

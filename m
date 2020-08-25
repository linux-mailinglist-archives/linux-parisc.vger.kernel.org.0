Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82D8250EE2
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Aug 2020 04:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgHYCSc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 24 Aug 2020 22:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgHYCSb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 24 Aug 2020 22:18:31 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898C0C061574
        for <linux-parisc@vger.kernel.org>; Mon, 24 Aug 2020 19:18:31 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id b26so5538996vsa.13
        for <linux-parisc@vger.kernel.org>; Mon, 24 Aug 2020 19:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VVcpc40yOHQYM+GLqCfQnefB/67Yjln2EQHPU82TFFw=;
        b=jKvZkOvfgeusuUaekDee3JNQ8i6+H69qB1txWoM2jSeRVhQP9ZMD2xpjVsctXPz0lf
         diCrLTa/oyQUwqVpWawiW1ZYwK0tPubxx21uIHLa+zCfwoiFN/9AdLLUKipTGXcDqe+n
         WelUjQh9jfYMTH0UZTLfULWPglUSV2vk3AnSrMsZMyQkN13beO4NeUA1XcTQQceQoa0J
         lMUVJwp2nR7A2Wj3mf1a6CLbJfvYFwdg5tc0ypH5nPkVgj/Q1wmq1ps/BUCjrI1MwRAD
         rsr/CXqc9D/Gg8JWqtx3qoGUXgu6OuDBaodkls1mku0ehMFJGXRbEXdfrO6TRUaqZ/DA
         9J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VVcpc40yOHQYM+GLqCfQnefB/67Yjln2EQHPU82TFFw=;
        b=VLcExP3ME3LbhXPPdKxp7WK5K4QUeJKNGI39/JNEZwjq4nBh0z7bULV6TMZU75fb8x
         PzSdMf+qk381pvaXN8PzqLBrJ2SXHVbzOECWm0DH5OKAn+jPsLfPCetct+SUpdQDqoCD
         HYIndiYOXfJ+uCjAeE22GvQ/YToRSW2iZ87WGW8nhAp92x/n33K+ZTjB2tiX70QHCppW
         Z6lZ0FIrvI4+dENUQ27f2Dm8jIIK8QmoQR044xJNlbxe4k4fZDZFhRsTT77Qdf4bbqKw
         LpnH8LITnQrsOge//ZJUP8yICgwxzHOTeJxa1kuMogA2TG57tmkSHloxa4vc/zmKctd3
         2n9Q==
X-Gm-Message-State: AOAM5316W2ClMKO1eSLtUaIE8qSH6e8ve/AmhQj7UoUIBP0Eg+4tTBMg
        XMEnAHy/nqTeI+KyAMq1yzHzpCXILv9buav7Ju8Y3Q==
X-Google-Smtp-Source: ABdhPJyQB1i6jjivS0ELmsCHBFpKrK32cgTfEukhHY510u3PhQRaNYyxPZjvC7xPEnYHQ8mAWbqf3ReMeVzRPAp3VMo=
X-Received: by 2002:a67:fdc4:: with SMTP id l4mr4457300vsq.51.1598321909764;
 Mon, 24 Aug 2020 19:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597720138.git.pcc@google.com> <9df0de08df310052df01d63bc8bddc5dd71c2bdb.1597720138.git.pcc@google.com>
 <20200819155650.GI6642@arm.com> <CAMn1gO5pFUGDLJEWe1uOetz0ohE1-pdWGvz7_XxOMZROOfO=ag@mail.gmail.com>
 <20200824142348.GN6642@arm.com>
In-Reply-To: <20200824142348.GN6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Mon, 24 Aug 2020 19:18:19 -0700
Message-ID: <CAMn1gO7DErthDi5EGQh=-MVBP9x_MTsfPHdP_wnS2=xY7kpt2g@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] arm64: expose FAR_EL1 tag bits in siginfo
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

On Mon, Aug 24, 2020 at 7:23 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Wed, Aug 19, 2020 at 06:49:01PM -0700, Peter Collingbourne wrote:
> > On Wed, Aug 19, 2020 at 8:56 AM Dave Martin <Dave.Martin@arm.com> wrote:
> > >
> > > On Mon, Aug 17, 2020 at 08:33:51PM -0700, Peter Collingbourne wrote:
> > > > The kernel currently clears the tag bits (i.e. bits 56-63) in the fault
> > > > address exposed via siginfo.si_addr and sigcontext.fault_address. However,
> > > > the tag bits may be needed by tools in order to accurately diagnose
> > > > memory errors, such as HWASan [1] or future tools based on the Memory
> > > > Tagging Extension (MTE).
> > > >
> > > > We should not stop clearing these bits in the existing fault address
> > > > fields, because there may be existing userspace applications that are
> > > > expecting the tag bits to be cleared. Instead, create a new pair of
> > > > union fields in siginfo._sigfault, and store the tag bits of FAR_EL1
> > > > there, together with a mask specifying which bits are valid.
> > > >
> > > > A flag is added to si_xflags to allow userspace to determine whether
> > > > the values in the fields are valid.
> > > >
> > > > [1] http://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html
> > > >
> > > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > > ---
>
> [...]
>
> > > > diff --git a/kernel/signal.c b/kernel/signal.c
> > > > index 72182eed1b8d..1f1e42adc57d 100644
> > > > --- a/kernel/signal.c
> > > > +++ b/kernel/signal.c
>
> [...]
>
> > > > @@ -1706,7 +1722,9 @@ int send_sig_fault(int sig, int code, void __user *addr
> > > >       return send_sig_info(info.si_signo, &info, t);
> > > >  }
> > > >
> > > > -int force_sig_mceerr(int code, void __user *addr, short lsb)
> > > > +int force_sig_mceerr(int code, void __user *addr, short lsb,
> > > > +                  unsigned long addr_ignored_bits,
> > > > +                  unsigned long addr_ignored_bits_mask)
> > >
> > > Rather than having to pass these extra arguments all over the place, can
> > > we just pass the far for addr, and have an arch-specific hook for
> > > splitting the ignored from non-ignored bits.  For now at least, I expect
> > > that ignored bits mask to be constant for a given platform and kernel.
> >
> > That sounds like a good idea. I think that for MTE we will want to
> > make it conditional on the si_code (so SEGV_MTESERR would get 0xf <<
> > 56 while everything else would get 0xff << 56) so I can hook that up
> > at the same time.
>
> OK, I think that's reasonable.
>
> Mind you, we seem to have 3 kinds of bits here, so I'm starting to
> wonder whether this is really sufficient:
>
>         1) address bits used in the faulted access
>         2) attribute/permission bits used in the faulted access
>         3) unavailable bits.
>
> si_addr contains (1).
>
> si_addr_ignored_bits contains (2).
>
> The tag bits from non-MTE faults seem to fall under case (3).  Code that
> looks for these bits in si_addr_ignored_bits won't find them.

I'm reasonably sure that the tag bits are available for non-MTE
faults. From https://developer.arm.com/docs/ddi0595/h/aarch64-system-registers/far_el1
:
"For a Data Abort or Watchpoint exception, if address tagging is
enabled for the address accessed by the data access that caused the
exception, then this field includes the tag."

This language applies to non-tag-check-fault data aborts but is
superseded by the following paragraph for tag check faults:
"For a synchronous Tag Check Fault abort, bits[63:60] are UNKNOWN."

> So perhaps it would make sense to amend the design a bit.  We'd have
>
>         si_addr = address bits only
>         si_attr = attribute bits only
>         si_attr_mask = mask of valid bits in si_addr
>
> Thinking about it, I've just shortened/changed some named and changed
> the meaning of the mask, so it's very similar to what you already have.

Did you mean "si_attr_mask = mask of valid bits in si_attr"? I assume
so because below you talk about si_addr_mask also being the mask of
valid bits in si_addr, but I don't think this is a change in meaning
for the mask field as I specified it. Maybe, given your claim above
that the tag bits are unavailable for non-tag check faults, you
misunderstood why I am setting si_addr_ignored_bits_mask to 0xf << 56
for tag check faults and 0xff << 56 for non-tag check faults?

That being said, maybe we can make the names shorter with something
like your suggestion.

> The mask of valid bits in si_addr is decided by architectural
> convention (i.e., ~0xffUL << 56), but we could also expose
>
>         si_addr_mask = mask of valid bits in si_addr
>
> This is a bit redundant though.  I think people would already assume
> that all bits required for classifying the faulting location accurately
> must already be provided there.

I think it's fine for this to be an architectural convention. If we
really wanted to expose something like this to userspace then I think
we should expose TASK_SIZE (this is something that I've wanted in the
past). But that's really a separate discussion.

Peter

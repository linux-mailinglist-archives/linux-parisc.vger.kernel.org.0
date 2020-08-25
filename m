Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1724E252354
	for <lists+linux-parisc@lfdr.de>; Wed, 26 Aug 2020 00:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHYWGw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 25 Aug 2020 18:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgHYWGw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 25 Aug 2020 18:06:52 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9A3C061574
        for <linux-parisc@vger.kernel.org>; Tue, 25 Aug 2020 15:06:52 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id g11so118608ual.2
        for <linux-parisc@vger.kernel.org>; Tue, 25 Aug 2020 15:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UdUIzyEEx/bKfLnKhLmenBJvgOvQPod37NsVLWS9PYc=;
        b=F4VVzzSL3QOR4N2TBABCmI9MxPwO3AZV1jD2wxEf8FX3avz4sALiwl16KtkOrJvDzb
         EJrxJe0blCoZZmbiNmTtcwxLPUEAXnh3C8na5TetNz7VsxZHfj88Wr0KdIEkO8RSvbai
         hd2CJ/y3O3I6moLKGN6hu72S2+augg7ZznFfTcMfEuhwARJ73L1XQAHk3hLUfZnfEnA9
         agjmOKH7RX2sW3ZWaHgZD6Z3somLAqZTa2X5/CeQLJJv6IIRZl6NqnMGHFGNj7NX78l0
         tv4vFOXXLMONl1LVvu/fWf9IlBLgEtEvyVyvy3vRT9Bq5XszrRLwwlbHQPJR97jGJhs6
         yRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UdUIzyEEx/bKfLnKhLmenBJvgOvQPod37NsVLWS9PYc=;
        b=SOtJof3AlHpqCubl9E0ulC/IuRLY5VcgQwbqU0o4JnGe8c5WnUFHNfBLSIywtNTKkF
         B4fm7ofnzUqCrOfRi3wENhlbwDbnwWtLkR3qri3P/3dNZ1rk+bYnthTQO465BsU8c1PV
         WGOyq47laMRFXfBFyXYerk/bUIdgjMKPfC7do2fYTi0q8YgAfjmOpN7JWAOfC6V1LYgo
         YDLZPdmtntEUPhV8wVaLKZSqnWKE1okPGlH53GusUVXoggTCwLk5fDXSvCVDlMccDfN8
         TUj61LjF0dhRN1OIzUQuhZiGmAYgxWaaAm/+MSiUzIRMWqvKYWJmC3A1+/pxDZE3myhL
         zCgA==
X-Gm-Message-State: AOAM53123sG60qkn4An/bt9Qeu5a3926nbqmqYGeiNljTm+fjhZF1HYw
        snOBacIx5t32HV3uS1ectUlJCB73JjlsbRsABCllQg==
X-Google-Smtp-Source: ABdhPJyoWoOK5LPoopf7O9U/0JM0TsusuJGhmLzprxKAJ1roGRR6NnTf9FdRTjukcAn0r4k7hLwimLRdYL0KZe9++Ag=
X-Received: by 2002:ab0:2996:: with SMTP id u22mr6954698uap.108.1598393211158;
 Tue, 25 Aug 2020 15:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597720138.git.pcc@google.com> <9df0de08df310052df01d63bc8bddc5dd71c2bdb.1597720138.git.pcc@google.com>
 <20200819155650.GI6642@arm.com> <CAMn1gO5pFUGDLJEWe1uOetz0ohE1-pdWGvz7_XxOMZROOfO=ag@mail.gmail.com>
 <20200824142348.GN6642@arm.com> <CAMn1gO7DErthDi5EGQh=-MVBP9x_MTsfPHdP_wnS2=xY7kpt2g@mail.gmail.com>
 <20200825150204.GS6642@arm.com>
In-Reply-To: <20200825150204.GS6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Tue, 25 Aug 2020 15:06:39 -0700
Message-ID: <CAMn1gO69WBanZ0awr=xMsH8NJXmaQRfnGnX04t-vJTLiYpjx3g@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] arm64: expose FAR_EL1 tag bits in siginfo
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

On Tue, Aug 25, 2020 at 8:02 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Mon, Aug 24, 2020 at 07:18:19PM -0700, Peter Collingbourne wrote:
> > On Mon, Aug 24, 2020 at 7:23 AM Dave Martin <Dave.Martin@arm.com> wrote:
> > >
> > > On Wed, Aug 19, 2020 at 06:49:01PM -0700, Peter Collingbourne wrote:
> > > > On Wed, Aug 19, 2020 at 8:56 AM Dave Martin <Dave.Martin@arm.com> wrote:
> > > > >
> > > > > On Mon, Aug 17, 2020 at 08:33:51PM -0700, Peter Collingbourne wrote:
> > > > > > The kernel currently clears the tag bits (i.e. bits 56-63) in the fault
> > > > > > address exposed via siginfo.si_addr and sigcontext.fault_address. However,
> > > > > > the tag bits may be needed by tools in order to accurately diagnose
> > > > > > memory errors, such as HWASan [1] or future tools based on the Memory
> > > > > > Tagging Extension (MTE).
> > > > > >
> > > > > > We should not stop clearing these bits in the existing fault address
> > > > > > fields, because there may be existing userspace applications that are
> > > > > > expecting the tag bits to be cleared. Instead, create a new pair of
> > > > > > union fields in siginfo._sigfault, and store the tag bits of FAR_EL1
> > > > > > there, together with a mask specifying which bits are valid.
> > > > > >
> > > > > > A flag is added to si_xflags to allow userspace to determine whether
> > > > > > the values in the fields are valid.
> > > > > >
> > > > > > [1] http://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html
> > > > > >
> > > > > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > > > > ---
> > >
> > > [...]
> > >
> > > > > > diff --git a/kernel/signal.c b/kernel/signal.c
> > > > > > index 72182eed1b8d..1f1e42adc57d 100644
> > > > > > --- a/kernel/signal.c
> > > > > > +++ b/kernel/signal.c
> > >
> > > [...]
> > >
> > > > > > @@ -1706,7 +1722,9 @@ int send_sig_fault(int sig, int code, void __user *addr
> > > > > >       return send_sig_info(info.si_signo, &info, t);
> > > > > >  }
> > > > > >
> > > > > > -int force_sig_mceerr(int code, void __user *addr, short lsb)
> > > > > > +int force_sig_mceerr(int code, void __user *addr, short lsb,
> > > > > > +                  unsigned long addr_ignored_bits,
> > > > > > +                  unsigned long addr_ignored_bits_mask)
> > > > >
> > > > > Rather than having to pass these extra arguments all over the place, can
> > > > > we just pass the far for addr, and have an arch-specific hook for
> > > > > splitting the ignored from non-ignored bits.  For now at least, I expect
> > > > > that ignored bits mask to be constant for a given platform and kernel.
> > > >
> > > > That sounds like a good idea. I think that for MTE we will want to
> > > > make it conditional on the si_code (so SEGV_MTESERR would get 0xf <<
> > > > 56 while everything else would get 0xff << 56) so I can hook that up
> > > > at the same time.
> > >
> > > OK, I think that's reasonable.
> > >
> > > Mind you, we seem to have 3 kinds of bits here, so I'm starting to
> > > wonder whether this is really sufficient:
> > >
> > >         1) address bits used in the faulted access
> > >         2) attribute/permission bits used in the faulted access
> > >         3) unavailable bits.
> > >
> > > si_addr contains (1).
> > >
> > > si_addr_ignored_bits contains (2).
> > >
> > > The tag bits from non-MTE faults seem to fall under case (3).  Code that
> > > looks for these bits in si_addr_ignored_bits won't find them.
> >
> > I'm reasonably sure that the tag bits are available for non-MTE
> > faults. From https://developer.arm.com/docs/ddi0595/h/aarch64-system-registers/far_el1
> > :
> > "For a Data Abort or Watchpoint exception, if address tagging is
> > enabled for the address accessed by the data access that caused the
> > exception, then this field includes the tag."
>
> Right, but I wonder whether it would still be good idea to have a way to
> tell userspace which bits are valid.

I'm a bit confused by this. si_addr_ignored_bits_mask is exactly the
mechanism for telling userspace which bits are valid. Or maybe you're
arguing that we should consider *not* having the mask of valid bits in
siginfo?

> Collecting and synchronising all the correct information for reporting a
> fault is notoriously easy to mess up in the implementation, and
> misreporting of the tag bits might be regarded as a tolerable fail.

It really depends. Imagine that a future change to the architecture
exposes bits 60-63 in FAR_EL1 in tag fault errors (we have a number of
ideas for how to use these bits to distinguish between different
use-after-frees in error reports). It would be nice for userspace to
be able to distinguish between the situation where bits 60-63 are 0
and the situation where the bits are unknown, in order to avoid
producing an incorrect/misleading report.

> We also don't get tag bits for prefetch aborts (which may be reported
> via SIGSEGV).  Arguably the architecture doesn't allow a nonzero tag
> (BR etc. likely just throw those bits on the floor).  But it might be
> nice to be explicit about this.

If we view the PC as being a 64-bit value where the architecture does
not allow setting bits 56-63, I think it would be correct to claim
that addresses derived from the PC have bits 56-63 clear.

> Other architectures may also have other reasons why the additional bits
> are sometimes available, sometimes not.

If this is the case for an architecture, it can always report the bits
to be unavailable until it can figure out in which cases the bits are
available.

> > This language applies to non-tag-check-fault data aborts but is
> > superseded by the following paragraph for tag check faults:
> > "For a synchronous Tag Check Fault abort, bits[63:60] are UNKNOWN."
>
> Right, so in this case we should squash those bits and not report them
> in the mask.  Currently are you implying that these are address bits,
> because you exclude them from si_addr_ignored_mask?

My intent was that these are implied to be unavailable bits, as they
are not set in the architecturally-defined si_addr mask ~(0xff << 56)
nor in si_addr_ignored_mask.

Peter

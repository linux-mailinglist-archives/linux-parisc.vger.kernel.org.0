Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7640024FF34
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Aug 2020 15:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgHXNmJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 24 Aug 2020 09:42:09 -0400
Received: from foss.arm.com ([217.140.110.172]:34246 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728000AbgHXNlw (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 24 Aug 2020 09:41:52 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 600BF1FB;
        Mon, 24 Aug 2020 06:41:51 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 801CB3F66B;
        Mon, 24 Aug 2020 06:41:49 -0700 (PDT)
Date:   Mon, 24 Aug 2020 14:41:47 +0100
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
Subject: Re: [PATCH v9 4/6] signal: define the SA_UNSUPPORTED bit in sa_flags
Message-ID: <20200824134146.GL6642@arm.com>
References: <cover.1597720138.git.pcc@google.com>
 <d93b503a926f45e752178bb61f451a426a558260.1597720138.git.pcc@google.com>
 <20200819145112.GG6642@arm.com>
 <CAMn1gO6Z1VECtC84fjjw2KYNHox1KcoZ01A7nkk8D1F3g9mzJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO6Z1VECtC84fjjw2KYNHox1KcoZ01A7nkk8D1F3g9mzJA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Aug 19, 2020 at 05:23:25PM -0700, Peter Collingbourne wrote:
> On Wed, Aug 19, 2020 at 7:51 AM Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Mon, Aug 17, 2020 at 08:33:49PM -0700, Peter Collingbourne wrote:
> > > This bit will never be supported in the uapi. The purpose of this flag
> > > bit is to allow userspace to distinguish an old kernel that does not
> > > clear unknown sa_flags bits from a kernel that supports every flag bit.
> > >
> > > In other words, if userspace finds that this bit remains set in
> > > oldact.sa_flags, it means that the kernel cannot be trusted to have
> > > cleared unknown flag bits from sa_flags, so no assumptions about flag
> > > bit support can be made.
> > >
> > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > ---
> > > View this change in Gerrit: https://linux-review.googlesource.com/q/Ic2501ad150a3a79c1cf27fb8c99be342e9dffbcb
> > >
> > >  include/uapi/asm-generic/signal-defs.h | 7 +++++++
> > >  kernel/signal.c                        | 6 ++++++
> > >  2 files changed, 13 insertions(+)
> > >
> > > diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
> > > index 91000b6b97e0..c30a9c1a77b2 100644
> > > --- a/include/uapi/asm-generic/signal-defs.h
> > > +++ b/include/uapi/asm-generic/signal-defs.h
> > > @@ -13,6 +13,12 @@
> > >   * SA_RESETHAND clears the handler when the signal is delivered.
> > >   * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
> > >   * SA_NODEFER prevents the current signal from being masked in the handler.
> > > + * SA_UNSUPPORTED is a flag bit that will never be supported. Kernels from
> > > + * before the introduction of SA_UNSUPPORTED did not clear unknown bits from
> > > + * sa_flags when read using the oldact argument to sigaction and rt_sigaction,
> > > + * so this bit allows flag bit support to be detected from userspace while
> > > + * allowing an old kernel to be distinguished from a kernel that supports every
> > > + * flag bit.
> > >   *
> > >   * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
> > >   * Unix names RESETHAND and NODEFER respectively.
> > > @@ -42,6 +48,7 @@
> > >   * The following bits are used in architecture-specific SA_* definitions and
> > >   * should be avoided for new generic flags: 3, 4, 5, 6, 7, 8, 9, 16, 24, 25, 26.
> > >   */
> > > +#define SA_UNSUPPORTED       0x00000400
> >
> > This concept confused me a bit initially, since in a sense this flag is
> > supported, just with a rather peculiar meaning.
> 
> Hmm. Maybe it should be named "SA_UNKNOWN" to mean that the bit will
> always be "unknown" to the kernel in the sense that it shall be
> treated in the same way as any other "unknown" bit. Then we can define
> the kernel's behavior in terms of what happens if a bit is "known". I
> don't know if this is just shuffling terms around though. At any rate,
> this seems like a problem to be solved with documentation.
> 
> > Since the main (only) purpose of this bit will be to check whether
> 
> I wouldn't necessarily say that it is the only purpose. If another new
> sa_flags bit were to be introduced in the future, SA_UN(whatever)
> could be used to detect kernel support for that bit in the same way as
> SA_XFLAGS.
> 
> > SA_XFLAGS is actually supported, I wonder whether it makes sense to weld
> > the two together, say:
> >
> > #define SA_REQUEST_XFLAGS       0x00000c00
> > #define SA_XFLAGS_MASK          0x00000c00
> > #define SA_HAVE_XFLAGS          0x00000800
> >
> > This is a departure from the current style of definitions though.
> >
> >         sa.sa_flags |= SA_REQUEST_XFLAGS;
> >         sigaction(..., &sa, &sa);
> >         if ((sa.sa_flags & SA_XFLAGS_MASK) == SA_HAVE_XFLAGS)
> >                 /* xflags available */
> >
> >
> > This would require some juggling of the way SA_UAPI_FLAGS works though.
> > Maybe not worth it, so long as the semantics get clearly documented.
> 
> I'm not sure about this. I personally think that it would be clearer
> to keep the flags orthogonal.

Fair enough.  I didn't think my approach was a whole lot better tbh.

Cheers
---Dave

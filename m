Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68571261E55
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Sep 2020 21:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730808AbgIHTuy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 8 Sep 2020 15:50:54 -0400
Received: from foss.arm.com ([217.140.110.172]:56344 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730804AbgIHPuk (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:50:40 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 429DA16F2;
        Tue,  8 Sep 2020 08:13:42 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 610C23F73C;
        Tue,  8 Sep 2020 08:13:40 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:13:38 +0100
From:   Dave Martin <Dave.Martin@arm.com>
To:     Peter Collingbourne <pcc@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-parisc@vger.kernel.org,
        Andrey Konovalov <andreyknvl@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        David Spickett <david.spickett@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v10 6/7] signal: define the field siginfo.si_xflags
Message-ID: <20200908151337.GW6642@arm.com>
References: <cover.1598072840.git.pcc@google.com>
 <8a12152d54ea782f47bc55d791b064abe478473e.1598072840.git.pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a12152d54ea782f47bc55d791b064abe478473e.1598072840.git.pcc@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Aug 21, 2020 at 10:10:16PM -0700, Peter Collingbourne wrote:

[ Add a new siginfo member sa_xflags, for fault signals. ]

> This field will contain flags that may be used by signal handlers to
> determine whether other fields in the _sigfault portion of siginfo are
> valid. An example use case is the following patch, which introduces
> the si_addr_ignored_bits{,_mask} fields.
> 
> A new sigcontext flag, SA_XFLAGS, is introduced in order to allow
> a signal handler to require the kernel to set the field (but note
> that the field will be set anyway if the kernel supports the flag,
> regardless of its value). In combination with the previous patches,
> this allows a userspace program to determine whether the kernel will
> set the field.
> 
> It is possible for an si_xflags-unaware program to cause a signal
> handler in an si_xflags-aware program to be called with a provided
> siginfo data structure by using one of the following syscalls:
> 
> - ptrace(PTRACE_SETSIGINFO)
> - pidfd_send_signal
> - rt_sigqueueinfo
> - rt_tgsigqueueinfo
> 
> So we need to prevent the si_xflags-unaware program from causing an
> uninitialized read of si_xflags in the si_xflags-aware program when
> it uses one of these syscalls.
> 
> The last three cases can be handled by observing that each of these
> syscalls fails if si_code >= 0, so we define si_xflags to only be
> valid if si_code >= 0.

I would say >.  0 is SI_USER, and the fact that those other interfaces
reject SI_USER seems inconsistent or a bug.

We can always relax the rule later.

Since si_xflags only makes sense for "real" fault signals, it would
never be applicable in combination with SI_USER.  Or am I missing
something?

Either way, I think this is just a documentation ossue in practice.

> 
> There is no such check on si_code in ptrace(PTRACE_SETSIGINFO), so
> we make ptrace(PTRACE_SETSIGINFO) clear the si_xflags field if it
> detects that the signal would use the _sigfault layout, and introduce
> a new ptrace request type, PTRACE_SETSIGINFO2, that a si_xflags-aware
> program may use to opt out of this behavior.

Will we need to introduce PTRACE_SETSIGINFO3, 4 etc., every time a new
field comes up?

I wonder whether we should make this more flexible, say accepting some
flags argument to say which fields the caller understands (and so
doesn't want clobbered).  Maybe we can (ab)use the sa_flags bit
definitions for indicating which extensions the caller understands.

> It is also possible for the kernel to inject a signal specified to
> use _sigfault by calling force_sig (e.g. there are numerous calls to
> force_sig(SIGSEGV)). In this case si_code is set to SI_KERNEL and the
> _kill union member is used, so document that si_code must be < SI_KERNEL.

Ack.  I'm still wondering if some of those SIGSEGV/SI_KERNEL instances
should be changed to one of the standard SIGSEGV codes, but either way,
having si_xflags validity require si_code < SI_KERNEL seems appropriate.


> Ideally this field could have just been named si_flags, but that
> name was already taken by ia64, so a different name was chosen.
> 
> Alternatively, we may consider making ia64's si_flags a generic field
> and having it appear at the end of _sigfault (in the same place as
> this patch has si_xflags) on non-ia64, keeping it in the same place
> on ia64. ia64's si_flags is a 32-bit field with only one flag bit
> allocated, so we would have 31 bits to use if we do this.

Hmm, that might be an idea.

It would mean that x86 would have different rules from other
architectures regarding how to know when the field is valid, which might
lull x86-first projects into a false sense of security.  Perhaps we could
refuse to expose any of the arch-independent flags in si_flags unless
explicitly requested via SA_XFLAGS, but that would be a departure from
what this series implements today.

So maybe it's simpler to keep the two fields separate, unless somebody
objects.

> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
> View this change in Gerrit: https://linux-review.googlesource.com/q/Ide155ce29366c3eab2a944ae4c51205982e5b8b2
> 
> v10:
> - make the new field compatible with the various ways
>   that a siginfo can be injected from another process
> - eliminate some duplication by adding a refactoring patch
>   before this one
> 
>  arch/powerpc/platforms/powernv/vas-fault.c |  1 +
>  arch/x86/kernel/signal_compat.c            |  4 +--
>  include/linux/compat.h                     |  2 ++
>  include/linux/signal_types.h               |  2 +-
>  include/uapi/asm-generic/siginfo.h         |  4 +++
>  include/uapi/asm-generic/signal-defs.h     |  4 +++
>  include/uapi/linux/ptrace.h                |  2 ++
>  kernel/ptrace.c                            | 29 ++++++++++++++++++++++
>  kernel/signal.c                            |  3 +++
>  9 files changed, 48 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
> index 3d21fce254b7..3bbb335561f5 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -154,6 +154,7 @@ static void update_csb(struct vas_window *window,
>  	info.si_errno = EFAULT;
>  	info.si_code = SEGV_MAPERR;
>  	info.si_addr = csb_addr;
> +	info.si_xflags = 0;
>  
>  	/*
>  	 * process will be polling on csb.flags after request is sent to
> diff --git a/arch/x86/kernel/signal_compat.c b/arch/x86/kernel/signal_compat.c
> index c599013ae8cb..6b99f0c8a068 100644
> --- a/arch/x86/kernel/signal_compat.c
> +++ b/arch/x86/kernel/signal_compat.c
> @@ -121,8 +121,8 @@ static inline void signal_compat_build_tests(void)
>  #endif
>  
>  	CHECK_CSI_OFFSET(_sigfault);
> -	CHECK_CSI_SIZE  (_sigfault, 4*sizeof(int));
> -	CHECK_SI_SIZE   (_sigfault, 8*sizeof(int));
> +	CHECK_CSI_SIZE  (_sigfault, 8*sizeof(int));
> +	CHECK_SI_SIZE   (_sigfault, 16*sizeof(int));

(Yuk, but at least you make this no worse.)

>  
>  	BUILD_BUG_ON(offsetof(siginfo_t, si_addr) != 0x10);
>  	BUILD_BUG_ON(offsetof(compat_siginfo_t, si_addr) != 0x0C);
> diff --git a/include/linux/compat.h b/include/linux/compat.h
> index d38c4d7e83bd..55d4228dfd88 100644
> --- a/include/linux/compat.h
> +++ b/include/linux/compat.h
> @@ -231,7 +231,9 @@ typedef struct compat_siginfo {
>  					char _dummy_pkey[__COMPAT_ADDR_BND_PKEY_PAD];
>  					u32 _pkey;
>  				} _addr_pkey;
> +				compat_uptr_t _pad[6];
>  			};
> +			compat_uptr_t _xflags;

Should we have the same type here for native and compat?

I don't have a very strong opinion on this, but currently native on
64-bit arches will have 32 extra bits in _xflags that can never be used
(or have to be defined differently for compat).


>  		} _sigfault;
>  
>  		/* SIGPOLL */
> diff --git a/include/linux/signal_types.h b/include/linux/signal_types.h
> index a7887ad84d36..75ca861d982a 100644
> --- a/include/linux/signal_types.h
> +++ b/include/linux/signal_types.h
> @@ -78,6 +78,6 @@ struct ksignal {
>  
>  #define UAPI_SA_FLAGS                                                          \
>  	(SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
> -	 SA_NODEFER | SA_RESETHAND | __ARCH_UAPI_SA_FLAGS)
> +	 SA_NODEFER | SA_RESETHAND | SA_XFLAGS | __ARCH_UAPI_SA_FLAGS)
>  
>  #endif /* _LINUX_SIGNAL_TYPES_H */
> diff --git a/include/uapi/asm-generic/siginfo.h b/include/uapi/asm-generic/siginfo.h
> index cb3d6c267181..1fbd88d64f38 100644
> --- a/include/uapi/asm-generic/siginfo.h
> +++ b/include/uapi/asm-generic/siginfo.h
> @@ -91,7 +91,9 @@ union __sifields {
>  				char _dummy_pkey[__ADDR_BND_PKEY_PAD];
>  				__u32 _pkey;
>  			} _addr_pkey;
> +			void *_pad[6];

6?

Obviously we'll need something here, but I'm curious as to where this
value came from.

(Same for compat.)

>  		};
> +		unsigned long _xflags;
>  	} _sigfault;
>  
>  	/* SIGPOLL */
> @@ -152,6 +154,8 @@ typedef struct siginfo {
>  #define si_trapno	_sifields._sigfault._trapno
>  #endif
>  #define si_addr_lsb	_sifields._sigfault._addr_lsb
> +/* si_xflags is only valid if 0 <= si_code < SI_KERNEL */
> +#define si_xflags	_sifields._sigfault._xflags
>  #define si_lower	_sifields._sigfault._addr_bnd._lower
>  #define si_upper	_sifields._sigfault._addr_bnd._upper
>  #define si_pkey		_sifields._sigfault._addr_pkey._pkey
> diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
> index e853cbe8722d..bdbe1fe7a779 100644
> --- a/include/uapi/asm-generic/signal-defs.h
> +++ b/include/uapi/asm-generic/signal-defs.h
> @@ -20,6 +20,9 @@
>   * so this bit allows flag bit support to be detected from userspace while
>   * allowing an old kernel to be distinguished from a kernel that supports every
>   * flag bit.
> + * SA_XFLAGS indicates that the signal handler requires the siginfo.si_xflags
> + * field to be valid. Note that if the kernel supports SA_XFLAGS, the field will

Maybe "valid for fault signals (SIGSEGV etc.)"

[...]

Otherwise, this looks sensible overall to me.

Cheers
---Dave

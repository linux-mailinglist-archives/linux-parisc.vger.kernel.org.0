Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A16F249A8D
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Aug 2020 12:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgHSKj4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Aug 2020 06:39:56 -0400
Received: from foss.arm.com ([217.140.110.172]:60598 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727943AbgHSKjx (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Aug 2020 06:39:53 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AACC101E;
        Wed, 19 Aug 2020 03:39:52 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C3483F6CF;
        Wed, 19 Aug 2020 03:39:50 -0700 (PDT)
Date:   Wed, 19 Aug 2020 11:39:48 +0100
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
Subject: Re: [PATCH v9 3/6] signal: clear non-uapi flag bits when
 passing/returning sa_flags
Message-ID: <20200819103948.GF6642@arm.com>
References: <cover.1597720138.git.pcc@google.com>
 <68bd2d6544fb17bbe2fb90862e28ec38e079549a.1597720138.git.pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68bd2d6544fb17bbe2fb90862e28ec38e079549a.1597720138.git.pcc@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Aug 17, 2020 at 08:33:48PM -0700, Peter Collingbourne wrote:

Nit: please say what the patch does.  Subject line should summarise
what is done, but should not add new information that is not present in
the description proper.

(Same for all the other patches.)

> This allows userspace to detect missing support for flag bits and
> allows the kernel to use non-uapi bits internally, as we are already
> doing in arch/x86 for two flag bits. Now that this change is in
> place, we no longer need the code in arch/x86 that was hiding these
> bits from userspace, so remove it.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
> View this change in Gerrit: https://linux-review.googlesource.com/q/I35aab6f5be932505d90f3b3450c083b4db1eca86
> 
>  arch/arm/include/asm/signal.h    |  4 ++++
>  arch/parisc/include/asm/signal.h |  4 ++++
>  arch/x86/kernel/signal_compat.c  |  7 -------
>  include/linux/signal_types.h     | 12 ++++++++++++
>  kernel/signal.c                  | 10 ++++++++++
>  5 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
> index 65530a042009..d1070a783993 100644
> --- a/arch/arm/include/asm/signal.h
> +++ b/arch/arm/include/asm/signal.h
> @@ -17,6 +17,10 @@ typedef struct {
>  	unsigned long sig[_NSIG_WORDS];
>  } sigset_t;
>  
> +#define SA_UAPI_FLAGS                                                          \
> +	(SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_THIRTYTWO |             \
> +	 SA_RESTORER | SA_ONSTACK | SA_RESTART | SA_NODEFER | SA_RESETHAND)
> +

I wonder whether all these per-arch definitions will tend to bitrot when
people add new common flags.

Can we have a common definition for the common bits, and just add the
extra arch-specific ones here?


Also, I wonder whether we should avoid the "SA_" prefix here.  Maybe
UAPI_SA_FLAGS?

>  #define __ARCH_HAS_SA_RESTORER
>  
>  #include <asm/sigcontext.h>
> diff --git a/arch/parisc/include/asm/signal.h b/arch/parisc/include/asm/signal.h
> index 715c96ba2ec8..ad06e14f6e8a 100644
> --- a/arch/parisc/include/asm/signal.h
> +++ b/arch/parisc/include/asm/signal.h
> @@ -21,6 +21,10 @@ typedef struct {
>  	unsigned long sig[_NSIG_WORDS];
>  } sigset_t;
>  
> +#define SA_UAPI_FLAGS                                                          \
> +	(SA_ONSTACK | SA_RESETHAND | SA_NOCLDSTOP | SA_SIGINFO | SA_NODEFER |  \
> +	 SA_RESTART | SA_NOCLDWAIT | _SA_SIGGFAULT)
> +
>  #include <asm/sigcontext.h>
>  
>  #endif /* !__ASSEMBLY */
> diff --git a/arch/x86/kernel/signal_compat.c b/arch/x86/kernel/signal_compat.c
> index 9ccbf0576cd0..c599013ae8cb 100644
> --- a/arch/x86/kernel/signal_compat.c
> +++ b/arch/x86/kernel/signal_compat.c
> @@ -165,16 +165,9 @@ void sigaction_compat_abi(struct k_sigaction *act, struct k_sigaction *oact)
>  {
>  	signal_compat_build_tests();
>  
> -	/* Don't leak in-kernel non-uapi flags to user-space */
> -	if (oact)
> -		oact->sa.sa_flags &= ~(SA_IA32_ABI | SA_X32_ABI);
> -
>  	if (!act)
>  		return;
>  
> -	/* Don't let flags to be set from userspace */
> -	act->sa.sa_flags &= ~(SA_IA32_ABI | SA_X32_ABI);
> -
>  	if (in_ia32_syscall())
>  		act->sa.sa_flags |= SA_IA32_ABI;
>  	if (in_x32_syscall())
> diff --git a/include/linux/signal_types.h b/include/linux/signal_types.h
> index f8a90ae9c6ec..e792f29b5846 100644
> --- a/include/linux/signal_types.h
> +++ b/include/linux/signal_types.h
> @@ -68,4 +68,16 @@ struct ksignal {
>  	int sig;
>  };
>  
> +#ifndef SA_UAPI_FLAGS
> +#ifdef SA_RESTORER
> +#define SA_UAPI_FLAGS                                                          \
> +	(SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
> +	 SA_NODEFER | SA_RESETHAND | SA_RESTORER)
> +#else
> +#define SA_UAPI_FLAGS                                                          \
> +	(SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
> +	 SA_NODEFER | SA_RESETHAND)
> +#endif
> +#endif
> +
>  #endif /* _LINUX_SIGNAL_TYPES_H */
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 42b67d2cea37..348b7981f1ff 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -3984,6 +3984,16 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
>  	if (oact)
>  		*oact = *k;
>  
> +	/*
> +	 * Clear unknown flag bits in order to allow userspace to detect missing
> +	 * support for flag bits and to allow the kernel to use non-uapi bits
> +	 * internally.
> +	 */
> +	if (act)
> +		act->sa.sa_flags &= SA_UAPI_FLAGS;
> +	if (oact)
> +		oact->sa.sa_flags &= SA_UAPI_FLAGS;
> +

Seems reasonable.

Cheers
---Dave

>  	sigaction_compat_abi(act, oact);
>  
>  	if (act) {
> -- 
> 2.28.0.220.ged08abb693-goog
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

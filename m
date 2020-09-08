Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B302261FB5
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Sep 2020 22:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgIHUGH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 8 Sep 2020 16:06:07 -0400
Received: from foss.arm.com ([217.140.110.172]:55394 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729576AbgIHPVm (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:21:42 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72B54169C;
        Tue,  8 Sep 2020 08:12:39 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92E213F73C;
        Tue,  8 Sep 2020 08:12:37 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:12:35 +0100
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
Subject: Re: [PATCH v10 3/7] signal: clear non-uapi flag bits when
 passing/returning sa_flags
Message-ID: <20200908151235.GT6642@arm.com>
References: <cover.1598072840.git.pcc@google.com>
 <868b8a89e4050d3f2d079bf28a18786e92b9c680.1598072840.git.pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868b8a89e4050d3f2d079bf28a18786e92b9c680.1598072840.git.pcc@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Aug 21, 2020 at 10:10:13PM -0700, Peter Collingbourne wrote:
> Previously we were not clearing non-uapi flag bits in
> sigaction.sa_flags when storing the userspace-provided sa_flags or
> when returning them via oldact. Start doing so.
> 
> This allows userspace to detect missing support for flag bits and
> allows the kernel to use non-uapi bits internally, as we are already
> doing in arch/x86 for two flag bits. Now that this change is in
> place, we no longer need the code in arch/x86 that was hiding these
> bits from userspace, so remove it.
> 
> This is technically a userspace-visible behavior change for sigaction, as
> the unknown bits returned via oldact.sa_flags are no longer set. However,
> we are free to define the behavior for unknown bits exactly because
> their behavior is currently undefined, so for now we can define the
> meaning of each of them to be "clear the bit in oldact.sa_flags unless
> the bit becomes known in the future". Furthermore, this behavior is
> consistent with OpenBSD [1], illumos [2] and XNU [3] (FreeBSD [4] and
> NetBSD [5] fail the syscall if unknown bits are set). So there is some
> precedent for this behavior in other kernels, and in particular in XNU,
> which is probably the most popular kernel among those that I looked at,
> which means that this change is less likely to be a compatibility issue.
> 
> Link: [1] https://github.com/openbsd/src/blob/f634a6a4b5bf832e9c1de77f7894ae2625e74484/sys/kern/kern_sig.c#L278
> Link: [2] https://github.com/illumos/illumos-gate/blob/76f19f5fdc974fe5be5c82a556e43a4df93f1de1/usr/src/uts/common/syscall/sigaction.c#L86
> Link: [3] https://github.com/apple/darwin-xnu/blob/a449c6a3b8014d9406c2ddbdc81795da24aa7443/bsd/kern/kern_sig.c#L480
> Link: [4] https://github.com/freebsd/freebsd/blob/eded70c37057857c6e23fae51f86b8f8f43cd2d0/sys/kern/kern_sig.c#L699
> Link: [5] https://github.com/NetBSD/src/blob/3365779becdcedfca206091a645a0e8e22b2946e/sys/kern/sys_sig.c#L473
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
> View this change in Gerrit: https://linux-review.googlesource.com/q/I35aab6f5be932505d90f3b3450c083b4db1eca86
> 
> v10:
> - rename SA_UAPI_FLAGS -> UAPI_SA_FLAGS
> - refactor how we define it to avoid mentioning flags more
>   than once
> 
>  arch/arm/include/asm/signal.h    |  2 ++
>  arch/parisc/include/asm/signal.h |  2 ++
>  arch/x86/kernel/signal_compat.c  |  7 -------
>  include/linux/signal_types.h     | 12 ++++++++++++
>  kernel/signal.c                  | 10 ++++++++++
>  5 files changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
> index 65530a042009..430be7774402 100644
> --- a/arch/arm/include/asm/signal.h
> +++ b/arch/arm/include/asm/signal.h
> @@ -17,6 +17,8 @@ typedef struct {
>  	unsigned long sig[_NSIG_WORDS];
>  } sigset_t;
>  
> +#define __ARCH_UAPI_SA_FLAGS	(SA_THIRTYTWO | SA_RESTORER)
> +
>  #define __ARCH_HAS_SA_RESTORER
>  
>  #include <asm/sigcontext.h>
> diff --git a/arch/parisc/include/asm/signal.h b/arch/parisc/include/asm/signal.h
> index 715c96ba2ec8..30dd1e43ef88 100644
> --- a/arch/parisc/include/asm/signal.h
> +++ b/arch/parisc/include/asm/signal.h
> @@ -21,6 +21,8 @@ typedef struct {
>  	unsigned long sig[_NSIG_WORDS];
>  } sigset_t;
>  
> +#define __ARCH_UAPI_SA_FLAGS	_SA_SIGGFAULT
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
> index f8a90ae9c6ec..a7887ad84d36 100644
> --- a/include/linux/signal_types.h
> +++ b/include/linux/signal_types.h
> @@ -68,4 +68,16 @@ struct ksignal {
>  	int sig;
>  };
>  
> +#ifndef __ARCH_UAPI_SA_FLAGS
> +#ifdef SA_RESTORER
> +#define __ARCH_UAPI_SA_FLAGS	SA_RESTORER
> +#else
> +#define __ARCH_UAPI_SA_FLAGS	0
> +#endif
> +#endif
> +
> +#define UAPI_SA_FLAGS                                                          \
> +	(SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |  \
> +	 SA_NODEFER | SA_RESETHAND | __ARCH_UAPI_SA_FLAGS)
> +

Part of me wants this to be closer to the common flag definitions.  But
we don't really want to define this in the UAPI headers.

Unless you can think of another good place to put it, this is probably
OK as-is.

>  #endif /* _LINUX_SIGNAL_TYPES_H */
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 42b67d2cea37..f802c82c7bcc 100644
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
> +		act->sa.sa_flags &= UAPI_SA_FLAGS;
> +	if (oact)
> +		oact->sa.sa_flags &= UAPI_SA_FLAGS;
> +

Seems reasonable.

[...]

Cheers
---Dave

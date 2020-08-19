Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B9B249A67
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Aug 2020 12:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgHSKaG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Aug 2020 06:30:06 -0400
Received: from foss.arm.com ([217.140.110.172]:60378 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726466AbgHSKaF (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Aug 2020 06:30:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5727101E;
        Wed, 19 Aug 2020 03:30:04 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE9BF3F6CF;
        Wed, 19 Aug 2020 03:30:02 -0700 (PDT)
Date:   Wed, 19 Aug 2020 11:30:00 +0100
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
Subject: Re: [PATCH v9 2/6] arch: move SA_* definitions to generic headers
Message-ID: <20200819103000.GE6642@arm.com>
References: <cover.1597720138.git.pcc@google.com>
 <691510496a422023a2934d42b068493ed2d60ccc.1597720138.git.pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <691510496a422023a2934d42b068493ed2d60ccc.1597720138.git.pcc@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Aug 17, 2020 at 08:33:47PM -0700, Peter Collingbourne wrote:
> Most architectures with the exception of alpha, mips, parisc and
> sparc use the same values for these flags. Move their definitions into
> asm-generic/signal-defs.h and allow the architectures with non-standard
> values to override them. Also, document the non-standard flag values
> in order to make it easier to add new generic flags in the future.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
> View this change in Gerrit: https://linux-review.googlesource.com/q/Ia3849f18b8009bf41faca374e701cdca36974528
> 
>  arch/alpha/include/uapi/asm/signal.h   | 14 --------
>  arch/arm/include/uapi/asm/signal.h     | 28 ++-------------
>  arch/h8300/include/uapi/asm/signal.h   | 24 -------------
>  arch/ia64/include/uapi/asm/signal.h    | 24 -------------
>  arch/m68k/include/uapi/asm/signal.h    | 24 -------------
>  arch/mips/include/uapi/asm/signal.h    | 12 -------
>  arch/parisc/include/uapi/asm/signal.h  | 13 -------
>  arch/powerpc/include/uapi/asm/signal.h | 24 -------------
>  arch/s390/include/uapi/asm/signal.h    | 24 -------------
>  arch/sparc/include/uapi/asm/signal.h   |  4 +--
>  arch/x86/include/uapi/asm/signal.h     | 24 -------------
>  arch/xtensa/include/uapi/asm/signal.h  | 24 -------------
>  include/uapi/asm-generic/signal-defs.h | 47 ++++++++++++++++++++++++++
>  include/uapi/asm-generic/signal.h      | 29 ----------------
>  14 files changed, 51 insertions(+), 264 deletions(-)

Nice diffstat!

> 
> diff --git a/arch/alpha/include/uapi/asm/signal.h b/arch/alpha/include/uapi/asm/signal.h
> index 74c750bf1c1a..a69dd8d080a8 100644
> --- a/arch/alpha/include/uapi/asm/signal.h
> +++ b/arch/alpha/include/uapi/asm/signal.h
> @@ -60,20 +60,6 @@ typedef unsigned long sigset_t;
>  #define SIGRTMIN	32
>  #define SIGRTMAX	_NSIG
>  
> -/*
> - * SA_FLAGS values:
> - *
> - * SA_ONSTACK indicates that a registered stack_t will be used.
> - * SA_RESTART flag to get restarting signals (which were the default long ago)
> - * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
> - * SA_RESETHAND clears the handler when the signal is delivered.
> - * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
> - * SA_NODEFER prevents the current signal from being masked in the handler.
> - *
> - * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
> - * Unix names RESETHAND and NODEFER respectively.
> - */
> -
>  #define SA_ONSTACK	0x00000001
>  #define SA_RESTART	0x00000002
>  #define SA_NOCLDSTOP	0x00000004
> diff --git a/arch/arm/include/uapi/asm/signal.h b/arch/arm/include/uapi/asm/signal.h
> index 9b4185ba4f8a..7727f0984d26 100644
> --- a/arch/arm/include/uapi/asm/signal.h
> +++ b/arch/arm/include/uapi/asm/signal.h
> @@ -60,33 +60,11 @@ typedef unsigned long sigset_t;
>  #define SIGSWI		32
>  
>  /*
> - * SA_FLAGS values:
> - *
> - * SA_NOCLDSTOP		flag to turn off SIGCHLD when children stop.
> - * SA_NOCLDWAIT		flag on SIGCHLD to inhibit zombies.
> - * SA_SIGINFO		deliver the signal with SIGINFO structs
> - * SA_THIRTYTWO		delivers the signal in 32-bit mode, even if the task 
> - *			is running in 26-bit.
> - * SA_ONSTACK		allows alternate signal stacks (see sigaltstack(2)).
> - * SA_RESTART		flag to get restarting signals (which were the default long ago)
> - * SA_NODEFER		prevents the current signal from being masked in the handler.
> - * SA_RESETHAND		clears the handler when the signal is delivered.
> - *
> - * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
> - * Unix names RESETHAND and NODEFER respectively.
> + * SA_THIRTYTWO historically meant deliver the signal in 32-bit mode, even if
> + * the task is running in 26-bit. But since the kernel no longer supports
> + * 26-bit mode, the flag has no effect.
>   */
> -#define SA_NOCLDSTOP	0x00000001
> -#define SA_NOCLDWAIT	0x00000002
> -#define SA_SIGINFO	0x00000004
>  #define SA_THIRTYTWO	0x02000000

Can we add a placeholder for this in the common header?  We don't want
people accidentally defining a new generic flag that clashes with this.

> -#define SA_RESTORER	0x04000000
> -#define SA_ONSTACK	0x08000000
> -#define SA_RESTART	0x10000000
> -#define SA_NODEFER	0x40000000
> -#define SA_RESETHAND	0x80000000
> -
> -#define SA_NOMASK	SA_NODEFER
> -#define SA_ONESHOT	SA_RESETHAND
>  
>  #define MINSIGSTKSZ	2048
>  #define SIGSTKSZ	8192

[...]

Otherwise, looks like a sensible cleanup.

Cheers
---Dave

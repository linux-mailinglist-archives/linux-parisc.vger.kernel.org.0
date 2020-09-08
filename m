Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82A5261345
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Sep 2020 17:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730239AbgIHPO5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 8 Sep 2020 11:14:57 -0400
Received: from foss.arm.com ([217.140.110.172]:54986 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730224AbgIHPOV (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:14:21 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B79E1169E;
        Tue,  8 Sep 2020 08:13:10 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7DE03F73C;
        Tue,  8 Sep 2020 08:13:08 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:13:06 +0100
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
Subject: Re: [PATCH v10 4/7] signal: define the SA_UNSUPPORTED bit in sa_flags
Message-ID: <20200908151306.GU6642@arm.com>
References: <cover.1598072840.git.pcc@google.com>
 <f37a8b86c53be4cc440a73be4123e0419deefe5f.1598072840.git.pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f37a8b86c53be4cc440a73be4123e0419deefe5f.1598072840.git.pcc@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Aug 21, 2020 at 10:10:14PM -0700, Peter Collingbourne wrote:

Nit: no statement of the chage being made (other than in the subject
line).

> This bit will never be supported in the uapi. The purpose of this flag
> bit is to allow userspace to distinguish an old kernel that does not
> clear unknown sa_flags bits from a kernel that supports every flag bit.
> 
> In other words, if userspace finds that this bit remains set in
> oldact.sa_flags, it means that the kernel cannot be trusted to have
> cleared unknown flag bits from sa_flags, so no assumptions about flag
> bit support can be made.

This isn't quite right?  After a single sigaction() call, oact will
contain the sa_flags for the previously registered handler.  So a
second sigaction() call would be needed to find out the newly effective
sa_flags.

> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
> View this change in Gerrit: https://linux-review.googlesource.com/q/Ic2501ad150a3a79c1cf27fb8c99be342e9dffbcb
> 
>  include/uapi/asm-generic/signal-defs.h | 7 +++++++
>  kernel/signal.c                        | 6 ++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
> index 319628058a53..e853cbe8722d 100644
> --- a/include/uapi/asm-generic/signal-defs.h
> +++ b/include/uapi/asm-generic/signal-defs.h
> @@ -14,6 +14,12 @@
>   * SA_RESTART flag to get restarting signals (which were the default long ago)
>   * SA_NODEFER prevents the current signal from being masked in the handler.
>   * SA_RESETHAND clears the handler when the signal is delivered.
> + * SA_UNSUPPORTED is a flag bit that will never be supported. Kernels from
> + * before the introduction of SA_UNSUPPORTED did not clear unknown bits from
> + * sa_flags when read using the oldact argument to sigaction and rt_sigaction,
> + * so this bit allows flag bit support to be detected from userspace while
> + * allowing an old kernel to be distinguished from a kernel that supports every
> + * flag bit.
>   *
>   * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
>   * Unix names RESETHAND and NODEFER respectively.
> @@ -42,6 +48,7 @@
>  #ifndef SA_RESETHAND
>  #define SA_RESETHAND	0x80000000
>  #endif
> +#define SA_UNSUPPORTED	0x00000400

I guess people may debate which bit is chosen, but your consolidation
of these definitions should help to reduce the possibility of future
collisions.  This bit appears unused for now, so I guess I don't have a
strong opinion.

>  #define SA_NOMASK	SA_NODEFER
>  #define SA_ONESHOT	SA_RESETHAND
> diff --git a/kernel/signal.c b/kernel/signal.c
> index f802c82c7bcc..c80e70bde11d 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -3984,6 +3984,12 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
>  	if (oact)
>  		*oact = *k;
>  
> +	/*
> +	 * Make sure that we never accidentally claim to support SA_UNSUPPORTED,
> +	 * e.g. by having an architecture use the bit in their uapi.
> +	 */
> +	BUILD_BUG_ON(UAPI_SA_FLAGS & SA_UNSUPPORTED);
> +

Seems reasonable.

With the above rewording in the commit message to clarify that a second
sigaction() is needed:

Reviewed-by: Dave Martin <Dave.Martin@arm.com>

[...]

Cheers
---Dave

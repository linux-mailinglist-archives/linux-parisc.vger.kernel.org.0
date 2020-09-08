Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E53F261F2A
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Sep 2020 22:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731075AbgIHUAF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 8 Sep 2020 16:00:05 -0400
Received: from foss.arm.com ([217.140.110.172]:55914 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730480AbgIHPfg (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:35:36 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 579E91045;
        Tue,  8 Sep 2020 08:12:05 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 760ED3F73C;
        Tue,  8 Sep 2020 08:12:03 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:12:01 +0100
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
Subject: Re: [PATCH v10 1/7] parisc: start using signal-defs.h
Message-ID: <20200908151200.GR6642@arm.com>
References: <cover.1598072840.git.pcc@google.com>
 <efdbcb5fc45a2dbdf1e2363d68ab0f7b5a276980.1598072840.git.pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efdbcb5fc45a2dbdf1e2363d68ab0f7b5a276980.1598072840.git.pcc@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Aug 21, 2020 at 10:10:11PM -0700, Peter Collingbourne wrote:
> We currently include signal-defs.h on all architectures except parisc.
> Make parisc fall in line. This will make maintenance easier once the
> flag bits are moved here.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
> View this change in Gerrit: https://linux-review.googlesource.com/q/If03a5135fb514fe96548fb74610e6c3586a04064
> 
>  arch/parisc/include/uapi/asm/signal.h  | 9 +--------
>  include/uapi/asm-generic/signal-defs.h | 6 ++++++
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/uapi/asm/signal.h
> index d38563a394f2..92a1c7ea44b4 100644
> --- a/arch/parisc/include/uapi/asm/signal.h
> +++ b/arch/parisc/include/uapi/asm/signal.h
> @@ -69,14 +69,7 @@
>  #define MINSIGSTKSZ	2048
>  #define SIGSTKSZ	8192
>  
> -
> -#define SIG_BLOCK          0	/* for blocking signals */
> -#define SIG_UNBLOCK        1	/* for unblocking signals */
> -#define SIG_SETMASK        2	/* for setting the signal mask */
> -
> -#define SIG_DFL	((__sighandler_t)0)	/* default signal handling */
> -#define SIG_IGN	((__sighandler_t)1)	/* ignore signal */
> -#define SIG_ERR	((__sighandler_t)-1)	/* error return from signal */
> +#include <asm/signal-defs.h>
>  
>  # ifndef __ASSEMBLY__
>  
> diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
> index e9304c95ceea..ecdf6312bfa5 100644
> --- a/include/uapi/asm-generic/signal-defs.h
> +++ b/include/uapi/asm-generic/signal-defs.h
> @@ -15,8 +15,14 @@
>  #endif
>  
>  #ifndef __ASSEMBLY__
> +#ifndef __hppa__
> +/*
> + * These have a special definition on parisc, see:
> + * arch/parisc/include/uapi/asm/signal.h
> + */
>  typedef void __signalfn_t(int);
>  typedef __signalfn_t __user *__sighandler_t;
> +#endif

Could we do something like

	#ifndef __sighandler_t
	/* ... */
	#define __sighandler_t __sighandler_t
	#endif

Then we don't have to have anything parisc-specific in the common
header, and arches can override this definition independently.

Not a big deal either way, though, and best to keep the comment about
why this is here in any case.

Cheers
---Dave

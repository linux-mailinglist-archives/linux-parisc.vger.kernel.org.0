Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C55DEAF1A
	for <lists+linux-parisc@lfdr.de>; Thu, 31 Oct 2019 12:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfJaLm1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 31 Oct 2019 07:42:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:51736 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726462AbfJaLm1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 31 Oct 2019 07:42:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 83BABAF7A;
        Thu, 31 Oct 2019 11:42:25 +0000 (UTC)
Date:   Thu, 31 Oct 2019 12:42:23 +0100
From:   Torsten Duwe <duwe@suse.de>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, Jessica Yu <jeyu@kernel.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-kernel@vger.kernel.org, amit.kachhap@arm.com,
        catalin.marinas@arm.com, james.morse@arm.com, jpoimboe@redhat.com,
        jthierry@redhat.com, linux-parisc@vger.kernel.org,
        mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org,
        svens@stackframe.org, takahiro.akashi@linaro.org, will@kernel.org
Subject: Re: [PATCHv2 2/8] module/ftrace: handle patchable-function-entry
Message-ID: <20191031114223.GA11684@suse.de>
References: <20191029165832.33606-1-mark.rutland@arm.com>
 <20191029165832.33606-3-mark.rutland@arm.com>
 <20191030150302.GA965@suse.de>
 <20191031090231.GA3340@blommer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031090231.GA3340@blommer>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Oct 31, 2019 at 09:02:32AM +0000, Mark Rutland wrote:
> On Wed, Oct 30, 2019 at 04:03:02PM +0100, Torsten Duwe wrote:
> > On Tue, Oct 29, 2019 at 04:58:26PM +0000, Mark Rutland wrote:
> > > 
> > > I built parisc generic-{32,64}bit_defconfig with DYNAMIC_FTRACE enabled,
> > > and verified that the section made it into the .ko files for modules.
> > 
> > This is because of remaining #ifdeffery in include/asm-generic/vmlinux.lds.h:
> > 
> > #ifdef CC_USING_PATCHABLE_FUNCTION_ENTRY
> > #define MCOUNT_REC()    . = ALIGN(8);                           \
> >                         __start_mcount_loc = .;                 \
> >                         KEEP(*(__patchable_function_entries))   \
> >                         __stop_mcount_loc = .;
> > #else
> > #define MCOUNT_REC()    . = ALIGN(8);                           \
> >                         __start_mcount_loc = .;                 \
> >                         KEEP(*(__mcount_loc))                   \
> >                         __stop_mcount_loc = .;
> > #endif
> 
> For modules we use a combination of scripts/module-common.lds and an
> architecture's own module.lds, not vmlinux.lds.h. So I don't think the above is
> relevant for modules.

Sure, this is only loosely related,...

> I agree that the CC_USING_PATCHABLE_FUNCTION_ENTRY ifdeffery could be
> simplified, and that it would be nice to consistently use
> FTRACE_CALLSITE_SECTION if we can. However, the generic linker script doesn't
> include anything, and I don't see a good location for that to live.
> 
> What I could do is add an explicit comment:
> 
> /*
>  * The ftrace call sites are logged to a section whose name depends on the
>  * compiler option used. A given kernel image will only use one, AKA
>  * FTRACE_CALLSITE_SECTION. We capture all of them here to avoid header
>  * dependencies.
>  */
> #define MCOUNT_REC()						\
> 			. = ALIGN(8);				\
> 			__start_mcount_loc = .;			\
> 			KEEP(*(__patchable_function_entries))   \
> 			KEEP(*(__mcount_loc))                   \
> 			__stop_mcount_loc = .;			
> 
> ... which should make the dependency clear. Does that sound good to you?

Beautiful. I just didn't want to miss the opportunity to have this cleaned
up as well, and deemed this patch "closest" because of the definition of 
FTRACE_CALLSITE_SECTION. Put it where you see it fit best.

Thanks,

	Torsten

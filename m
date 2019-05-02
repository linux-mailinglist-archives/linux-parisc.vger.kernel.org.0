Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 030F711277
	for <lists+linux-parisc@lfdr.de>; Thu,  2 May 2019 07:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbfEBFFP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 2 May 2019 01:05:15 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:60975 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfEBFFP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 2 May 2019 01:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=0RtjFSmgLRdxHjCEHh7NcsnVmctsc7Iq146I2xQcU6s=; b=oyv7slPF6VDYLt5KA3qkNMmo7c
        WqwR7ERxJCQX+1pzEHXZzdnsTV3B1FDvFmFQL3rj11hVIsDLTn/wunCrY0KLLEqgNxU2BXNvdRp0R
        6sEq9WH8IFSgpNAtot6UNOWh35pJgs0RbIJghc5IECkUQoGYD5Qko70pki24XS+kwQzs=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hM3uC-0005t4-0j; Thu, 02 May 2019 07:05:12 +0200
Date:   Thu, 2 May 2019 07:05:10 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Add static branch / JUMP_LABEL feature
Message-ID: <20190502050510.GA10924@t470p.stackframe.org>
References: <20190501200231.GA7087@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501200231.GA7087@ls3530.dellerweb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On Wed, May 01, 2019 at 10:02:31PM +0200, Helge Deller wrote:
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index 49212f31b461..bdd4fea0150b 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -45,6 +45,8 @@ config PARISC
>  	select HAVE_DEBUG_STACKOVERFLOW
>  	select HAVE_ARCH_AUDITSYSCALL
>  	select HAVE_ARCH_HASH
> +	select HAVE_ARCH_JUMP_LABEL
> +	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>  	select HAVE_ARCH_SECCOMP_FILTER
>  	select HAVE_ARCH_TRACEHOOK
>  	select HAVE_REGS_AND_STACK_ACCESS_API
> diff --git a/arch/parisc/include/asm/jump_label.h b/arch/parisc/include/asm/jump_label.h
> new file mode 100644
> index 000000000000..2d82368b6ed3
> --- /dev/null
> +++ b/arch/parisc/include/asm/jump_label.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_PARISC_JUMP_LABEL_H
> +#define _ASM_PARISC_JUMP_LABEL_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/types.h>
> +#include <asm/assembly.h>
> +
> +#define JUMP_LABEL_NOP_SIZE 4
> +
> +static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
> +{
> +	asm_volatile_goto("1:\n\t"
> +		 "nop\n\t"
> +		 ".pushsection __jump_table,  \"aw\"\n\t"
> +		 ".word 1b - ., %l[l_yes] - .\n\t"
> +		 __stringify(ASM_ULONG_INSN) " %c0\n\t"
> +		 ".popsection\n\t"
> +		 : :  "i" (&((char *)key)[branch]) :  : l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +static __always_inline bool arch_static_branch_jump(struct static_key *key, bool branch)
> +{
> +	asm_volatile_goto("1:\n\t"
> +		 "b,n %l[l_yes]\n\t"
> +		 ".pushsection __jump_table,  \"aw\"\n\t"
> +		 ".word 1b - ., %l[l_yes] - .\n\t"
> +		 __stringify(ASM_ULONG_INSN) " %c0\n\t"
> +		 ".popsection\n\t"
> +		 : :  "i" (&((char *)key)[branch]) :  : l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +#endif  /* __ASSEMBLY__ */
> +#endif
> diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
> index b818b28c8a99..fc0df5c44468 100644
> --- a/arch/parisc/kernel/Makefile
> +++ b/arch/parisc/kernel/Makefile
> @@ -33,5 +33,6 @@ obj-$(CONFIG_64BIT)	+= perf.o perf_asm.o $(obj64-y)
>  obj-$(CONFIG_PARISC_CPU_TOPOLOGY)	+= topology.o
>  obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o
>  obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
> +obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
>  obj-$(CONFIG_KGDB)			+= kgdb.o
>  obj-$(CONFIG_KPROBES)			+= kprobes.o
> diff --git a/arch/parisc/kernel/jump_label.c b/arch/parisc/kernel/jump_label.c
> new file mode 100644
> index 000000000000..0d077c6d3ca7
> --- /dev/null
> +++ b/arch/parisc/kernel/jump_label.c
> @@ -0,0 +1,37 @@
> +/*
> + * Copyright (C) 2019 Helge Deller <deller@gmx.de>
> + *
> + * Based on arch/arm64/kernel/jump_label.c
> + */
> +#include <linux/kernel.h>
> +#include <linux/jump_label.h>
> +#include <asm/alternative.h>
> +#include <asm/patch.h>
> +
> +void arch_jump_label_transform(struct jump_entry *entry,
> +			       enum jump_label_type type)
> +{
> +	void *addr = (void *)jump_entry_code(entry);
> +	u32 insn;
> +
> +	if (type == JUMP_LABEL_JMP) {
> +		void *target = (void *)jump_entry_target(entry);
> +		unsigned len = target - addr;
> +		insn = 0xe8000002 + (len-2)*8; /* "b,n .+8" */

I don't know the maximum jump distance here that could be encountered, but this
won't work for negative offsets and offsets > 2^11 bits due to the weird
immediate encoding PA-RISC uses. I think this should use proper bit shifting
to match the immediate encoding and have a BUG_ON(len < $MAX_NEG_DISTANCE ||
len > $MAX_POS_DISTANCE) to make sure we're not patching invalid branch
instructions into the Kernel.

> +	} else {
> +		insn = INSN_NOP;
> +	}
> +
> +	patch_text(addr, insn); // nosync ?
> +}
> +
> +void arch_jump_label_transform_static(struct jump_entry *entry,
> +				      enum jump_label_type type)
> +{
> +	/*
> +	 * We use the architected NOP in arch_static_branch, so there's no
> +	 * need to patch an identical NOP over the top of it here. The core
> +	 * will call arch_jump_label_transform from a module notifier if the
> +	 * NOP needs to be replaced by a branch.
> +	 */
> +}
> diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
> index c3b1b9c24ede..a8be7a47fcc0 100644
> --- a/arch/parisc/kernel/vmlinux.lds.S
> +++ b/arch/parisc/kernel/vmlinux.lds.S
> @@ -18,6 +18,9 @@
>  				*(.data..vm0.pgd) \
>  				*(.data..vm0.pte)
> 
> +/* No __ro_after_init data in the .rodata section - which will always be ro */
> +#define RO_AFTER_INIT_DATA
> +
>  #include <asm-generic/vmlinux.lds.h>
> 
>  /* needed for the processor specific cache alignment size */

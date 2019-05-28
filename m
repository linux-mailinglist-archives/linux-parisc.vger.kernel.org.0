Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33EBE2C10D
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 10:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfE1ITx (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 04:19:53 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:33035 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbfE1ITx (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 04:19:53 -0400
Received: (qmail 12975 invoked from network); 28 May 2019 08:19:17 -0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69]:57058 HELO webmail.sf-mail.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <svens@stackframe.org>; Tue, 28 May 2019 10:19:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 May 2019 10:19:11 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     deller@gmx.de, linux-parisc@vger.kernel.org,
        linux-parisc-owner@vger.kernel.org
Subject: Re: [PATCH 1/6] parisc: add support for patching multiple words
In-Reply-To: <20190527190450.14988-2-svens@stackframe.org>
References: <20190527190450.14988-1-svens@stackframe.org>
 <20190527190450.14988-2-svens@stackframe.org>
Message-ID: <60af38a74323a665da28f2de08529a23@sf-tec.de>
X-Sender: eike-kernel@sf-tec.de
User-Agent: Roundcube Webmail/1.3.8
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Sven Schnelle wrote:
> add patch_text_multiple() which allows to patch multiple
> text words in memory. This can be used to copy functions.
> 
> Signed-off-by: Sven Schnelle <svens@stackframe.org>
> ---
>  arch/parisc/include/asm/patch.h |  4 +-
>  arch/parisc/kernel/patch.c      | 75 ++++++++++++++++++++++++++-------
>  2 files changed, 62 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/parisc/include/asm/patch.h 
> b/arch/parisc/include/asm/patch.h
> index 685b58a13968..1156fe11249a 100644
> --- a/arch/parisc/include/asm/patch.h
> +++ b/arch/parisc/include/asm/patch.h
> @@ -4,8 +4,10 @@
> 
>  /* stop machine and patch kernel text */
>  void patch_text(void *addr, unsigned int insn);
> +void patch_text_multiple(void *addr, u32 *insn, int len);
> 
>  /* patch kernel text with machine already stopped (e.g. in kgdb) */
> -void __patch_text(void *addr, unsigned int insn);
> +void __patch_text(void *addr, u32 insn);
> +void __patch_text_multiple(void *addr, u32 *insn, int len);

A signed length always looks suspicious to me.

>  #endif
> diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
> index cdcd981278b3..eaef5515f5b6 100644
> --- a/arch/parisc/kernel/patch.c
> +++ b/arch/parisc/kernel/patch.c
> @@ -17,15 +17,18 @@
> 
>  struct patch {
>  	void *addr;
> -	unsigned int insn;
> +	u32 *insn;
> +	int len;
>  };
> 
> -static void __kprobes *patch_map(void *addr, int fixmap)
> -{
> +static DEFINE_RAW_SPINLOCK(patch_lock);
> +
> +static void __kprobes *patch_map(void *addr, int fixmap, int 
> *need_unmap)
>  	unsigned long uintaddr = (uintptr_t) addr;
>  	bool module = !core_kernel_text(uintaddr);
>  	struct page *page;
> 
> +	*need_unmap = 0;
>  	if (module && IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
>  		page = vmalloc_to_page(addr);
>  	else if (!module && IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> @@ -33,6 +36,7 @@ static void __kprobes *patch_map(void *addr, int 
> fixmap)
>  	else
>  		return addr;
> 
> +	*need_unmap = 1;
>  	set_fixmap(fixmap, page_to_phys(page));
> 
>  	return (void *) (__fix_to_virt(fixmap) + (uintaddr & ~PAGE_MASK));
> @@ -43,34 +47,73 @@ static void __kprobes patch_unmap(int fixmap)
>  	clear_fixmap(fixmap);
>  }
> 
> -void __kprobes __patch_text(void *addr, unsigned int insn)
> +void __kprobes __patch_text_multiple(void *addr, u32 *insn, int len)
> +{
> +	unsigned long start = (unsigned long)addr;
> +	unsigned long end = (unsigned long)addr + len;
> +	u32 *p, *fixmap;
> +	int mapped;
> +
> +	/* Make sure we don't have any aliases in cache */
> +	flush_kernel_vmap_range(addr, len);
> +	flush_icache_range(start, end);
> +
> +	p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &mapped);
> +
> +	while (len > 0) {
> +		*p++ = *insn++;
> +		addr += 4;
> +		len -= sizeof(u32);

I wonder if this can't just use memcpy inside the pages? If not there 
should
be a comment describing what's going on here.

Another nitpick: the "+4" and "-sizeof(u32)" are just the same at the 
end, but
why do they use entirely different wording? What do we need "addr" for 
anyway,
one could just look at "p" which would cross a page boundary at the same 
time, no?

> +		if (len && !((unsigned long)addr & ~PAGE_MASK)) {
> +			/*
> +			 * We're crossing a page boundary, so
> +			 * need to remap
> +			 */
> +			flush_kernel_vmap_range((void *)fixmap,
> +						(p-fixmap) * sizeof(*p));
> +			if (mapped)
> +				patch_unmap(FIX_TEXT_POKE0);
> +			p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &mapped);
> +		}
> +	}
> +
> +	flush_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
> +	if (mapped)
> +		patch_unmap(FIX_TEXT_POKE0);
> +	flush_icache_range(start, end);
> +}
> +
> +void __kprobes __patch_text(void *addr, u32 insn)
>  {
> -	void *waddr = addr;
> -	int size;
> -
> -	waddr = patch_map(addr, FIX_TEXT_POKE0);
> -	*(u32 *)waddr = insn;
> -	size = sizeof(u32);
> -	flush_kernel_vmap_range(waddr, size);
> -	patch_unmap(FIX_TEXT_POKE0);
> -	flush_icache_range((uintptr_t)(addr),
> -			   (uintptr_t)(addr) + size);
> +	__patch_text_multiple(addr, &insn, sizeof(insn));
>  }
> 
>  static int __kprobes patch_text_stop_machine(void *data)
>  {
>  	struct patch *patch = data;
> 
> -	__patch_text(patch->addr, patch->insn);
> -
> +	__patch_text_multiple(patch->addr, patch->insn, patch->len);
>  	return 0;
>  }
> 
>  void __kprobes patch_text(void *addr, unsigned int insn)
>  {
> +	struct patch patch = {
> +		.addr = addr,
> +		.insn = &insn,
> +		.len = 4
> +	};

sizeof(insn)? I don't know if this makes it more readable, I personally 
tend
to understand where the number is coming from faster if it's written 
this way.

> +	stop_machine_cpuslocked(patch_text_stop_machine, &patch, NULL);
> +}
> +
> +void __kprobes patch_text_multiple(void *addr, u32 *insn, int len)
> +{
> +
>  	struct patch patch = {
>  		.addr = addr,
>  		.insn = insn,
> +		.len = len
>  	};
> 
>  	stop_machine_cpuslocked(patch_text_stop_machine, &patch, NULL);

Eike

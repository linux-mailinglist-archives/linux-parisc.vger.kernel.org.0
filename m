Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76FD3EE1B3
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Nov 2019 14:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbfKDNzr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 4 Nov 2019 08:55:47 -0500
Received: from foss.arm.com ([217.140.110.172]:43552 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727838AbfKDNzr (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 4 Nov 2019 08:55:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D21141FB;
        Mon,  4 Nov 2019 05:55:44 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 976583F6C4;
        Mon,  4 Nov 2019 05:55:42 -0800 (PST)
Date:   Mon, 4 Nov 2019 13:55:40 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Amit Daniel Kachhap <amit.kachhap@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, deller@gmx.de, duwe@suse.de,
        James.Bottomley@HansenPartnership.com, james.morse@arm.com,
        jeyu@kernel.org, jpoimboe@redhat.com, jthierry@redhat.com,
        linux-parisc@vger.kernel.org, mingo@redhat.com,
        peterz@infradead.org, rostedt@goodmis.org, svens@stackframe.org,
        takahiro.akashi@linaro.org, will@kernel.org
Subject: Re: [PATCHv2 4/8] arm64: module/ftrace: intialize PLT at load time
Message-ID: <20191104135540.GH45140@lakrids.cambridge.arm.com>
References: <20191029165832.33606-1-mark.rutland@arm.com>
 <20191029165832.33606-5-mark.rutland@arm.com>
 <d22b27b5-6b76-6124-efff-fd577a8f482e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d22b27b5-6b76-6124-efff-fd577a8f482e@arm.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Nov 02, 2019 at 05:50:02PM +0530, Amit Daniel Kachhap wrote:
> On 10/29/19 10:28 PM, Mark Rutland wrote:
> > @@ -485,24 +486,33 @@ static const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
> >   	return NULL;
> >   }
> > +int module_init_ftrace_plt(const Elf_Ehdr *hdr,
> > +			   const Elf_Shdr *sechdrs,
> > +			   struct module *mod)
> I think this function can be made static as it is not used anywhere.

It's only called by module_finalize() below, so making it static makese
sense; done.

Thanks
Mark.

> > +{
> > +#if defined(CONFIG_ARM64_MODULE_PLTS) && defined(CONFIG_DYNAMIC_FTRACE)
> > +	const Elf_Shdr *s;
> > +	struct plt_entry *plt;
> > +
> > +	s = find_section(hdr, sechdrs, ".text.ftrace_trampoline");
> > +	if (!s)
> > +		return -ENOEXEC;
> > +
> > +	plt = (void *)s->sh_addr;
> > +	*plt = get_plt_entry(FTRACE_ADDR, plt);
> > +	mod->arch.ftrace_trampoline = plt;
> > +#endif
> > +	return 0;
> > +}
> > +
> >   int module_finalize(const Elf_Ehdr *hdr,
> >   		    const Elf_Shdr *sechdrs,
> >   		    struct module *me)
> >   {
> >   	const Elf_Shdr *s;
> > -
> >   	s = find_section(hdr, sechdrs, ".altinstructions");
> >   	if (s)
> >   		apply_alternatives_module((void *)s->sh_addr, s->sh_size);
> > -#ifdef CONFIG_ARM64_MODULE_PLTS
> > -	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE)) {
> > -		s = find_section(hdr, sechdrs, ".text.ftrace_trampoline");
> > -		if (!s)
> > -			return -ENOEXEC;
> > -		me->arch.ftrace_trampoline = (void *)s->sh_addr;
> > -	}
> > -#endif
> > -
> > -	return 0;
> > +	return module_init_ftrace_plt(hdr, sechdrs, me);
> >   }
> > 

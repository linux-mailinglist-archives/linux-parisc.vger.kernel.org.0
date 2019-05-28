Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB9552C126
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 10:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfE1IZI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 04:25:08 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:39741 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726631AbfE1IZI (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 04:25:08 -0400
Received: (qmail 13226 invoked from network); 28 May 2019 08:24:32 -0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69]:57104 HELO webmail.sf-mail.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <svens@stackframe.org>; Tue, 28 May 2019 10:24:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 May 2019 10:24:32 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     deller@gmx.de, linux-parisc@vger.kernel.org,
        linux-parisc-owner@vger.kernel.org
Subject: Re: [PATCH 4/6] parisc: use pr_debug() in kernel/module.c
In-Reply-To: <20190527190450.14988-5-svens@stackframe.org>
References: <20190527190450.14988-1-svens@stackframe.org>
 <20190527190450.14988-5-svens@stackframe.org>
Message-ID: <d1ada6ef8eb96dd679b8ba973ded263a@sf-tec.de>
X-Sender: eike-kernel@sf-tec.de
User-Agent: Roundcube Webmail/1.3.8
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Sven Schnelle wrote:
> Instead of using our own version, switch to the generic
> pr_() calls.
> 
> Signed-off-by: Sven Schnelle <svens@stackframe.org>
> ---
>  arch/parisc/kernel/module.c | 44 ++++++++++++++++---------------------
>  1 file changed, 19 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
> index 43778420614b..3ff3b48df6e6 100644
> --- a/arch/parisc/kernel/module.c
> +++ b/arch/parisc/kernel/module.c
> @@ -48,9 +48,9 @@
>   *	However, SEGREL32 is used only for PARISC unwind entries, and we 
> want
>   *	those entries to have an absolute address, and not just an offset.
>   *
> - *	The unwind table mechanism has the ability to specify an offset for
> + *	The unwind table mechanism has the ability to specify an offset for
>   *	the unwind table; however, because we split off the init functions 
> into
> - *	a different piece of memory, it is not possible to do this using a
> + *	a different piece of memory, it is not possible to do this using a
>   *	single offset. Instead, we use the above hack for now.
>   */
> 
> @@ -315,7 +309,7 @@ unsigned int arch_mod_section_prepend(struct module 
> *mod,
>  		* sizeof(struct stub_entry);
>  }
> 
> -#define CONST
> +#define CONST
>  int module_frob_arch_sections(CONST Elf_Ehdr *hdr,
>  			      CONST Elf_Shdr *sechdrs,
>  			      CONST char *secstrings,
> @@ -619,7 +613,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
>  			/* See note about special handling of SEGREL32 at
>  			 * the beginning of this file.
>  			 */
> -			*loc = fsel(val, addend);
> +			*loc = fsel(val, addend);
>  			break;
>  		case R_PARISC_SECREL32:
>  			/* 32-bit section relative address. */

You are sneaking in unrelated whitespace fixes. I just want to let you 
know that
you got caught ;)

Eike

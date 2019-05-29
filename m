Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F65F2E3ED
	for <lists+linux-parisc@lfdr.de>; Wed, 29 May 2019 19:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfE2RyJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 29 May 2019 13:54:09 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:51076 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2RyJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 29 May 2019 13:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=PFUk5NE0XNpR9JTlks7ZQyHvLdGylwnc5+oU5hw39O4=; b=LXrZrvLivY9Ba8FO69liyItj2g
        k07fuLxn4lUHewJOs/uo4mPaoAkbJGj51ZVLmTvFOspEOn7YmRL2PGprKkpAgfWCfjP7+yPYeXqHM
        7Tm6gCyCzJApnX1lckHUWuv1/eewCch/KFIGJcDc0kQDZwQv/H4aO8Pe4E9nw5Pniij8=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hW2m7-00042M-Kk; Wed, 29 May 2019 19:54:07 +0200
Date:   Wed, 29 May 2019 19:54:06 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     deller@gmx.de, linux-parisc@vger.kernel.org,
        linux-parisc-owner@vger.kernel.org
Subject: Re: [PATCH 4/6] parisc: use pr_debug() in kernel/module.c
Message-ID: <20190529175406.GC15295@t470p.stackframe.org>
References: <20190527190450.14988-1-svens@stackframe.org>
 <20190527190450.14988-5-svens@stackframe.org>
 <d1ada6ef8eb96dd679b8ba973ded263a@sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1ada6ef8eb96dd679b8ba973ded263a@sf-tec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Tue, May 28, 2019 at 10:24:32AM +0200, Rolf Eike Beer wrote:
> > -#define CONST
> > +#define CONST
> >  int module_frob_arch_sections(CONST Elf_Ehdr *hdr,
> >  			      CONST Elf_Shdr *sechdrs,
> >  			      CONST char *secstrings,
> > @@ -619,7 +613,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
> >  			/* See note about special handling of SEGREL32 at
> >  			 * the beginning of this file.
> >  			 */
> > -			*loc = fsel(val, addend);
> > +			*loc = fsel(val, addend);
> >  			break;
> >  		case R_PARISC_SECREL32:
> >  			/* 32-bit section relative address. */
> 
> You are sneaking in unrelated whitespace fixes. I just want to let you know
> that you got caught ;)

Not contributing often to the linux kernel i'm not sure what the policy is. IMHO
it's okay to fix whitespace errors when working on patches. If Helge says this
is a problem i remove the whitespace changes.

Regards
Sven

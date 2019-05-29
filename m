Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1F5F2E3E7
	for <lists+linux-parisc@lfdr.de>; Wed, 29 May 2019 19:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfE2Rtj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 29 May 2019 13:49:39 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:36966 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfE2Rtj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 29 May 2019 13:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=FwU+iS9fde0uUez+7123ScvIFvcrgmugUUZFhjnGt+c=; b=eoZmqOkqkdZgnhhXpUWArfD9zc
        c+GhLTNglppA3BowQPE5WAHXehTGvN6A1HBgG0WNF60sW25tmBXz4I5S+1Qo28Zl5FydJj78p5JgN
        7vtu+B69jXceaoLYKdGnAueZfwgVGkXf4O+PPKuG0hNz/SFIPj1H1HY4hTHc3Fl/XdwA=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hW2hl-0003wX-R1; Wed, 29 May 2019 19:49:37 +0200
Date:   Wed, 29 May 2019 19:49:36 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     deller@gmx.de, linux-parisc@vger.kernel.org,
        linux-parisc-owner@vger.kernel.org
Subject: Re: [PATCH 1/6] parisc: add support for patching multiple words
Message-ID: <20190529174936.GB15295@t470p.stackframe.org>
References: <20190527190450.14988-1-svens@stackframe.org>
 <20190527190450.14988-2-svens@stackframe.org>
 <60af38a74323a665da28f2de08529a23@sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60af38a74323a665da28f2de08529a23@sf-tec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Tue, May 28, 2019 at 10:19:11AM +0200, Rolf Eike Beer wrote:
> Sven Schnelle wrote:
> > add patch_text_multiple() which allows to patch multiple
> > text words in memory. This can be used to copy functions.
> > +void __patch_text(void *addr, u32 insn);
> > +void __patch_text_multiple(void *addr, u32 *insn, int len);
> 
> A signed length always looks suspicious to me.

Agreed. Will change.

> > +	p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &mapped);
> > +
> > +	while (len > 0) {
> > +		*p++ = *insn++;
> > +		addr += 4;
> > +		len -= sizeof(u32);
> 
> I wonder if this can't just use memcpy inside the pages?

I think using memcpy here makes things just more complicated and harder to read.
We would need to extract the amount of bytes to copy, and call memcpy multiple
times. As this code is not performance critical and usually only copies only
a few bytes i doubt that it's worth the effort.

> If not there should be a comment describing what's going on here.

Is it that complicated? It's just a copy loop like in every C beginner book,
the only things that makes things more complicated is the need to remap when
crossing a page.

> Another nitpick: the "+4" and "-sizeof(u32)" are just the same at the end,
> but why do they use entirely different wording? What do we need "addr" for
> anyway, one could just look at "p" which would cross a page boundary at the
> same time, no?

You can't, because of the patch_map() call below which updates the fixed mapping.
That call needs the real virtual address, while *p holds the virtual address of
the fixed mapping for patching.

> > +		if (len && !((unsigned long)addr & ~PAGE_MASK)) {
> > +			/*
> > +			 * We're crossing a page boundary, so
> > +			 * need to remap
> > +			 */
> > +			flush_kernel_vmap_range((void *)fixmap,
> > +						(p-fixmap) * sizeof(*p));
> > +			if (mapped)
> > +				patch_unmap(FIX_TEXT_POKE0);
> > +			p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &mapped);
> > +		}
> > +	}
> > +

Regards
Sven

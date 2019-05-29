Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57ED32E452
	for <lists+linux-parisc@lfdr.de>; Wed, 29 May 2019 20:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbfE2SSQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 29 May 2019 14:18:16 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:44843 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2SSP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 29 May 2019 14:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=YcOV1+5iezsCbm8rPktzeZw6PhwVSk0yJwRpqMZhBaY=; b=BaUTeZmYydcISrbwCS5y5od7Q8
        E8wlPD1tP649ig1KBVMwRUGGv3Yyxjec6JYK1f5S4R+5Kt04oK/V4KU8lc8Cn6y/bxXN6QDIqNAV6
        8I16/0sv+fGeQO73N68swtSyEQ+hJU38lnPSf7FpGku3ZzKtBC8z5FsB1+Sa7/fA7a0Q=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hW39S-0004kg-IA; Wed, 29 May 2019 20:18:14 +0200
Date:   Wed, 29 May 2019 20:18:13 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH 1/6] parisc: add support for patching multiple words
Message-ID: <20190529181813.GD15295@t470p.stackframe.org>
References: <20190527190450.14988-1-svens@stackframe.org>
 <60af38a74323a665da28f2de08529a23@sf-tec.de>
 <20190529174936.GB15295@t470p.stackframe.org>
 <3453931.8BTnNjY2jm@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3453931.8BTnNjY2jm@daneel.sf-tec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, May 29, 2019 at 07:58:57PM +0200, Rolf Eike Beer wrote:
> Sven Schnelle wrote:
> > On Tue, May 28, 2019 at 10:19:11AM +0200, Rolf Eike Beer wrote:
> > > Another nitpick: the "+4" and "-sizeof(u32)" are just the same at the end,
> > > but why do they use entirely different wording? What do we need "addr" for
> > > anyway, one could just look at "p" which would cross a page boundary at
> > > the
> > > same time, no?
> > 
> > You can't, because of the patch_map() call below which updates the fixed
> > mapping. That call needs the real virtual address, while *p holds the
> > virtual address of the fixed mapping for patching.
> 
> Can that remapping really place it at a non-zero offset regarding to the 
> underlying page? That it moves the page descriptor around is normal, but it 
> will keep the low order bits intact, so the page boundary crossing will be 
> still the same, no?

For the page crossing check it doesn't make a difference whether you check p or
addr, but for the patch_map() you can only use addr. So we have to update both
variables.

Regards
Sven



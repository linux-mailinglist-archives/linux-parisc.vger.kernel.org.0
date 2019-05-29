Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13FDB2E3F6
	for <lists+linux-parisc@lfdr.de>; Wed, 29 May 2019 19:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfE2R7E (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 29 May 2019 13:59:04 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:44879 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbfE2R7E (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 29 May 2019 13:59:04 -0400
Received: (qmail 12181 invoked from network); 29 May 2019 17:58:24 -0000
Received: from dslb-088-071-109-181.088.071.pools.vodafone-ip.de ([::ffff:88.71.109.181]:52672 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <svens@stackframe.org>; Wed, 29 May 2019 19:58:24 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH 1/6] parisc: add support for patching multiple words
Date:   Wed, 29 May 2019 19:58:57 +0200
Message-ID: <3453931.8BTnNjY2jm@daneel.sf-tec.de>
In-Reply-To: <20190529174936.GB15295@t470p.stackframe.org>
References: <20190527190450.14988-1-svens@stackframe.org> <60af38a74323a665da28f2de08529a23@sf-tec.de> <20190529174936.GB15295@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2467595.nSV29tU0fa"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2467595.nSV29tU0fa
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Sven Schnelle wrote:
> On Tue, May 28, 2019 at 10:19:11AM +0200, Rolf Eike Beer wrote:
> > Sven Schnelle wrote:
> > > +	p = fixmap = patch_map(addr, FIX_TEXT_POKE0, &mapped);
> > > +
> > > +	while (len > 0) {
> > > +		*p++ = *insn++;
> > > +		addr += 4;
> > > +		len -= sizeof(u32);
> > 
> > I wonder if this can't just use memcpy inside the pages?
> 
> I think using memcpy here makes things just more complicated and harder to
> read. We would need to extract the amount of bytes to copy, and call memcpy
> multiple times. As this code is not performance critical and usually only
> copies only a few bytes i doubt that it's worth the effort.
> 
> > If not there should be a comment describing what's going on here.
> 
> Is it that complicated? It's just a copy loop like in every C beginner book,
> the only things that makes things more complicated is the need to remap
> when crossing a page.

The copy loop not. But things like "why are you doing it backwards" come to 
mind. Be careful when you change the length to unsigned, your loop will not 
work this way anymore afterwards.

> > Another nitpick: the "+4" and "-sizeof(u32)" are just the same at the end,
> > but why do they use entirely different wording? What do we need "addr" for
> > anyway, one could just look at "p" which would cross a page boundary at
> > the
> > same time, no?
> 
> You can't, because of the patch_map() call below which updates the fixed
> mapping. That call needs the real virtual address, while *p holds the
> virtual address of the fixed mapping for patching.

Can that remapping really place it at a non-zero offset regarding to the 
underlying page? That it moves the page descriptor around is normal, but it 
will keep the low order bits intact, so the page boundary crossing will be 
still the same, no?

Eike
--nextPart2467595.nSV29tU0fa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXO7IYQAKCRBcpIk+abn8
TthfAJ9reesffV0mXQ650vZ78GxFgJXhuwCfUXMJyumELYHAyxzSwVTDMmmUqlU=
=l6JX
-----END PGP SIGNATURE-----

--nextPart2467595.nSV29tU0fa--




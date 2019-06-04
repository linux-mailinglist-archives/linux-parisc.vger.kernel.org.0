Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15FB335032
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jun 2019 21:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfFDTVp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jun 2019 15:21:45 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:53655 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbfFDTVp (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jun 2019 15:21:45 -0400
Received: (qmail 7696 invoked from network); 4 Jun 2019 19:20:46 -0000
Received: from dslb-178-011-220-157.178.011.pools.vodafone-ip.de ([::ffff:178.11.220.157]:44118 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <svens@stackframe.org>; Tue, 04 Jun 2019 21:20:46 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     deller@gmx.de, linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] parisc: add support for patching multiple words
Date:   Tue, 04 Jun 2019 21:21:34 +0200
Message-ID: <3798054.dHnqrmMtG0@daneel.sf-tec.de>
In-Reply-To: <20190604183435.20175-2-svens@stackframe.org>
References: <20190604183435.20175-1-svens@stackframe.org> <20190604183435.20175-2-svens@stackframe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2551712.O07LNKGo3I"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2551712.O07LNKGo3I
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Sven Schnelle wrote:
> +	while (len >= 4) {
> +		*p++ = *insn++;
> +		addr += sizeof(u32);
> +		len -= sizeof(u32);
> +		if (len && !((unsigned long)addr & ~PAGE_MASK)) {

if (len && offset_in_page(addr) == 0)

This is a bit more obvious to me. YMMV.

Eike
--nextPart2551712.O07LNKGo3I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXPbEvgAKCRBcpIk+abn8
TlZ2AJ9d+U5EzoV2BAncsrOKZ5qYGT+9CQCcCWNYXfH/LfTnUm9PSssbePJ3h28=
=aZTV
-----END PGP SIGNATURE-----

--nextPart2551712.O07LNKGo3I--




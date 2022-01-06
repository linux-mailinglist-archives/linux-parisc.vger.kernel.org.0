Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A454862A5
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Jan 2022 11:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236802AbiAFKEu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 6 Jan 2022 05:04:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236677AbiAFKEu (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 6 Jan 2022 05:04:50 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2EF7C061245
        for <linux-parisc@vger.kernel.org>; Thu,  6 Jan 2022 02:04:49 -0800 (PST)
Received: (qmail 13129 invoked from network); 6 Jan 2022 10:04:32 -0000
Received: from p200300cf0713cf00183e67d29ced1f8c.dip0.t-ipconnect.de ([2003:cf:713:cf00:183e:67d2:9ced:1f8c]:38760 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Thu, 06 Jan 2022 11:04:32 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH 2/2] parisc: Provide a trivial PDC-based io_module for kgdb
Date:   Thu, 06 Jan 2022 11:04:40 +0100
Message-ID: <1881841.PYKUYFuaPT@daneel.sf-tec.de>
In-Reply-To: <20220105214552.590606-2-deller@gmx.de>
References: <20220105214552.590606-1-deller@gmx.de> <20220105214552.590606-2-deller@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart21321444.EfDdHjke4D"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart21321444.EfDdHjke4D
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 5. Januar 2022, 22:45:52 CET schrieb Helge Deller:
> Add a simple keyboard driver for usage of PDC I/O functions
> with kgdb. This driver makes it possible to use KGDB with QEMU.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  arch/parisc/kernel/toc.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/parisc/kernel/toc.c b/arch/parisc/kernel/toc.c
> index 18327611cf8f..dfe7cccc086f 100644
> --- a/arch/parisc/kernel/toc.c
> +++ b/arch/parisc/kernel/toc.c
> @@ -109,3 +109,30 @@ static __init int setup_toc(void)
>  	return 0;
>  }
>  early_initcall(setup_toc);
> +
> +

double newline

> +#ifdef CONFIG_KGDB_KDB
> +/* read a character, return -1 if no char can be polled. */
> +static int kgdbpdc_read_char(void)
> +{
> +	return pdc_iodc_getc();
> +}
> +
> +static void kgdbpdc_write_char(u8 chr)
> +{
> +	/* no need to print char. kdb will do it. */

kgdb?

Eike
--nextPart21321444.EfDdHjke4D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYda+uAAKCRBcpIk+abn8
TlavAJ96eWRvPKSKFSTubiiRn96miJuU2QCgpdx+yyb0Z+U8DSGtLmPzuaWo/K0=
=eSqy
-----END PGP SIGNATURE-----

--nextPart21321444.EfDdHjke4D--




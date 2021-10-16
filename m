Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 332384303D2
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Oct 2021 18:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241330AbhJPQvw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Oct 2021 12:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241351AbhJPQvw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Oct 2021 12:51:52 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C925BC061570
        for <linux-parisc@vger.kernel.org>; Sat, 16 Oct 2021 09:49:43 -0700 (PDT)
Received: (qmail 19284 invoked from network); 16 Oct 2021 16:49:40 -0000
Received: from p200300cf0748140059f6c3d7a8675c0c.dip0.t-ipconnect.de ([2003:cf:748:1400:59f6:c3d7:a867:5c0c]:45312 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <deller@gmx.de>; Sat, 16 Oct 2021 18:49:40 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH v3 4/4] parisc: add support for TOC (transfer of control)
Date:   Sat, 16 Oct 2021 18:49:34 +0200
Message-ID: <2081016.irdbgypaU6@daneel.sf-tec.de>
In-Reply-To: <20211014194916.13901-5-svens@stackframe.org>
References: <20211014194916.13901-1-svens@stackframe.org> <20211014194916.13901-5-svens@stackframe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12873580.uLZWGnKmhe"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart12873580.uLZWGnKmhe
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Sven Schnelle wrote:

> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index 27a8b49af11f..97a889eaffe1 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -288,6 +288,20 @@ config SMP
> 
>  	  If you don't know what to do here, say N.
> 
> +config TOC
> +	bool "Support TOC switch"
> +	default y if 64BIT || !SMP
> +	help
> +	  Most PA-RISC machines have either a switch at the back of the 
machine
> +	  or a command in BMC to trigger a TOC interrupt. If you say Y here 
a
> +	  handler will be installed which will either show a backtrace on 
all
> +	  CPUs, or enter a possible configured debugger like kgdb/kdb.
> +
> +	  Note that with this option enabled, the kernel will use an 
additional
> 16KB +	  per possible CPU as a special stack for the TOC handler.
> +
> +	  If you don't want to debug the Kernel, so N.

so -> say?

> +void notrace __noreturn __cold toc_intr(struct pt_regs *regs)
> +{
> +	struct pdc_toc_pim_20 pim_data20;
> +	struct pdc_toc_pim_11 pim_data11;
> +
> +	nmi_enter();
> +
> +	if (boot_cpu_data.cpu_type >= pcxu) {
> +		if (pdc_pim_toc20(&pim_data20))
> +			panic("Failed to get PIM data");
> +		toc20_to_pt_regs(regs, &pim_data20);
> +	} else {
> +		if (pdc_pim_toc11(&pim_data11))
> +			panic("Failed to get PIM data");
> +		toc11_to_pt_regs(regs, &pim_data11);
> +	}

As I said elsewhere because I had missed v3: move the variables in the if 
branches.

Eike
--nextPart12873580.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYWsCngAKCRBcpIk+abn8
TmoKAKCIlbDP2YCy3T2fidpy5gE5e3zNRwCeIqWNKjRA0fQ0Aj6/UI4mpwOtZzY=
=M2y5
-----END PGP SIGNATURE-----

--nextPart12873580.uLZWGnKmhe--




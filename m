Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F8E42F807
	for <lists+linux-parisc@lfdr.de>; Fri, 15 Oct 2021 18:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241255AbhJOQYc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 15 Oct 2021 12:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241232AbhJOQYb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 15 Oct 2021 12:24:31 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205E3C061570
        for <linux-parisc@vger.kernel.org>; Fri, 15 Oct 2021 09:22:25 -0700 (PDT)
Received: (qmail 9601 invoked from network); 15 Oct 2021 16:22:21 -0000
Received: from p200300cf070b1e0059f6c3d7a8675c0c.dip0.t-ipconnect.de ([2003:cf:70b:1e00:59f6:c3d7:a867:5c0c]:57478 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <deller@gmx.de>; Fri, 15 Oct 2021 18:22:21 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH 2/2] parisc: add support for TOC (transfer of control)
Date:   Fri, 15 Oct 2021 18:22:16 +0200
Message-ID: <5507009.DvuYhMxLoT@daneel.sf-tec.de>
In-Reply-To: <20211010183815.5780-3-svens@stackframe.org>
References: <20211010183815.5780-1-svens@stackframe.org> <20211010183815.5780-3-svens@stackframe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5758896.lOV4Wx5bFT"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart5758896.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> +void notrace toc_intr(struct pt_regs *regs)
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
> +

You can move the variables into the if/else branches as they are not used 
outside. That would also reduce stack usage.

Eike
--nextPart5758896.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYWmquAAKCRBcpIk+abn8
Tv9cAJ0WTAz1kqbH6IvcelsjDwa4PEWnMwCgic/33XM27FnDJzox6siH0A4vaBw=
=mMZt
-----END PGP SIGNATURE-----

--nextPart5758896.lOV4Wx5bFT--




Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03D44292D0
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Oct 2021 17:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbhJKPHZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 11 Oct 2021 11:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbhJKPHZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 11 Oct 2021 11:07:25 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D04C061745
        for <linux-parisc@vger.kernel.org>; Mon, 11 Oct 2021 08:05:24 -0700 (PDT)
Received: (qmail 17745 invoked from network); 11 Oct 2021 15:05:20 -0000
Received: from p200300cf07110c00f032864a1b601834.dip0.t-ipconnect.de ([2003:cf:711:c00:f032:864a:1b60:1834]:36562 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <deller@gmx.de>; Mon, 11 Oct 2021 17:05:20 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH 1/2] parisc/firmware: add functions to retrieve TOC data
Date:   Mon, 11 Oct 2021 17:05:13 +0200
Message-ID: <11844080.O9o76ZdvQC@daneel.sf-tec.de>
In-Reply-To: <20211010183815.5780-2-svens@stackframe.org>
References: <20211010183815.5780-1-svens@stackframe.org> <20211010183815.5780-2-svens@stackframe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5505320.DvuYhMxLoT"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart5505320.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> --- a/arch/parisc/include/uapi/asm/pdc.h
> +++ b/arch/parisc/include/uapi/asm/pdc.h
> @@ -689,6 +689,28 @@ struct pdc_hpmc_pim_20 { /* PDC_PIM */
>  	unsigned long long fr[32];
>  };
> 
> +struct pdc_toc_pim_11 {
> +	unsigned int gr[32];
> +	unsigned int cr[32];
> +	unsigned int sr[8];
> +	unsigned int iasq_back;
> +	unsigned int iaoq_back;
> +	unsigned int check_type;
> +	unsigned int hversion;
> +	unsigned int cpu_state;
> +};
> +
> +struct pdc_toc_pim_20 {
> +	unsigned long long gr[32];
> +	unsigned long long cr[32];
> +	unsigned long long sr[8];
> +	unsigned long long iasq_back;
> +	unsigned long long iaoq_back;
> +	unsigned int check_type;
> +	unsigned int hversion;
> +	unsigned int cpu_state;
> +};
> +
>  #endif /* !defined(__ASSEMBLY__) */

Since these are defined by the hardware and have a well defined size I suggest 
using u32 and u64 to cover this.

> diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
> index 7034227dbdf3..9179b4409b63 100644
> --- a/arch/parisc/kernel/firmware.c
> +++ b/arch/parisc/kernel/firmware.c
> @@ -1061,6 +1061,38 @@ int pdc_mem_pdt_read_entries(struct pdc_mem_read_pdt
> *pret, return retval;
>  }
> 
> +/**
> + * pdc_pim_toc11 - Fetch TOC PIM 1.1 data from firmware.
> + * @ret: pointer to return buffer
> + */
> +int pdc_pim_toc11(struct pdc_toc_pim_11 *ret)
> +{
> +	int retval;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pdc_lock, flags);
> +	retval = mem_pdc_call(PDC_PIM, PDC_PIM_TOC, __pa(pdc_result),
> +			      __pa(ret), sizeof(struct 
pdc_toc_pim_11));
sizeof(*ret)

> +	spin_unlock_irqrestore(&pdc_lock, flags);
> +	return retval;
> +}
> +
> +/**
> + * pdc_pim_toc20 - Fetch TOC PIM 2.0 data from firmware.
> + * @ret: pointer to return buffer
> + */
> +int pdc_pim_toc20(struct pdc_toc_pim_20 *ret)
> +{
> +	int retval;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pdc_lock, flags);
> +	retval = mem_pdc_call(PDC_PIM, PDC_PIM_TOC, __pa(pdc_result),
> +			      __pa(ret), sizeof(struct 
pdc_toc_pim_20));
sizeof(*ret)

> +	spin_unlock_irqrestore(&pdc_lock, flags);
> +	return retval;
> +}
> +
>  /**
>   * pdc_tod_set - Set the Time-Of-Day clock.
>   * @sec: The number of seconds since epoch.


--nextPart5505320.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYWRSqQAKCRBcpIk+abn8
TsRPAJ4wea/M/MkVjcZ+FjwOHR42X8gZnwCeOZwvTrUhR1YyLRI0TYLcjtt63yI=
=LKJv
-----END PGP SIGNATURE-----

--nextPart5505320.DvuYhMxLoT--




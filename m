Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F28C4FC8C
	for <lists+linux-parisc@lfdr.de>; Sun, 23 Jun 2019 18:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfFWQBy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 23 Jun 2019 12:01:54 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:50113 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbfFWQBy (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 23 Jun 2019 12:01:54 -0400
Received: (qmail 18769 invoked from network); 23 Jun 2019 16:01:36 -0000
Received: from dslb-092-076-185-040.092.076.pools.vodafone-ip.de ([::ffff:92.76.185.40]:33320 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <efremov@linux.com>; Sun, 23 Jun 2019 18:01:36 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Denis Efremov <efremov@linux.com>
Cc:     "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] parisc: asm: psw.h: missing header guard
Date:   Sun, 23 Jun 2019 18:01:41 +0200
Message-ID: <8264763.oMOxLtkXCx@daneel.sf-tec.de>
In-Reply-To: <20190623150920.26422-1-efremov@linux.com>
References: <20190623150920.26422-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8051854.DE1LrJNj9i"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart8051854.DE1LrJNj9i
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Denis Efremov wrote:
> The psw.h header file contains #ifndef directive of the guard,
> but the complimentary #define directive is missing. The patch
> adds the appropriate #define to fix the header guard.
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  arch/parisc/include/asm/psw.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/parisc/include/asm/psw.h b/arch/parisc/include/asm/psw.h
> index 76c301146c31..7a175e866ed0 100644
> --- a/arch/parisc/include/asm/psw.h
> +++ b/arch/parisc/include/asm/psw.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _PARISC_PSW_H
> +#define _PARISC_PSW_H
> 
> 
>  #define	PSW_I	0x00000001

You could have removed one of the 2 empty lines then.

Eike
--nextPart8051854.DE1LrJNj9i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXQ+iZQAKCRBcpIk+abn8
Tq+ZAJ0ShaFX1qk7lxyzXG0d4+P4iEcUMQCgjAcANB3MxFvxsDrfK5u76TCdHDo=
=xLAY
-----END PGP SIGNATURE-----

--nextPart8051854.DE1LrJNj9i--




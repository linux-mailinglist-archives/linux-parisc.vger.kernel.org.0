Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C0325671D
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Aug 2020 13:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgH2LaA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 29 Aug 2020 07:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbgH2L2G (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 29 Aug 2020 07:28:06 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91494C061236
        for <linux-parisc@vger.kernel.org>; Sat, 29 Aug 2020 04:27:17 -0700 (PDT)
Received: (qmail 12636 invoked from network); 29 Aug 2020 11:26:31 -0000
Received: from p548c7d1a.dip0.t-ipconnect.de ([::ffff:84.140.125.26]:38076 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sat, 29 Aug 2020 13:26:31 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Drop HP-UX specifix fcntl and signal flags
Date:   Sat, 29 Aug 2020 13:26:57 +0200
Message-ID: <8645899.CDJkKcVGEf@daneel.sf-tec.de>
In-Reply-To: <20200829105112.GA863@ls3530.fritz.box>
References: <20200829105112.GA863@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3003713.5fSG56mABF"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart3003713.5fSG56mABF
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 29. August 2020, 12:51:12 CEST schrieb Helge Deller:
> Those flags are nowhere used in the Linux kernel and were added when we
> still wanted to support HP-UX in a compat mode. Since we never will
> support HP-UX, drop those flags.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/include/uapi/asm/fcntl.h
> b/arch/parisc/include/uapi/asm/fcntl.h index 03ce20e5ad7d..4289ee732c4c
> 100644
> --- a/arch/parisc/include/uapi/asm/fcntl.h
> +++ b/arch/parisc/include/uapi/asm/fcntl.h
> @@ -3,7 +3,6 @@
>  #define _PARISC_FCNTL_H
> 
>  #define O_APPEND	000000010
> -#define O_BLKSEEK	000000100 /* HPUX only */
>  #define O_CREAT		000000400 /* not fcntl */
>  #define O_EXCL		000002000 /* not fcntl */
>  #define O_LARGEFILE	000004000
> @@ -12,13 +11,11 @@
>  #define O_NONBLOCK	000200004 /* HPUX has separate NDELAY & NONBLOCK */
>  #define O_NOCTTY	000400000 /* not fcntl */
>  #define O_DSYNC		001000000 /* HPUX only */
> -#define O_RSYNC		002000000 /* HPUX only */

So, what about O_DSYNC? Either it should go away the same if it is HPUX only, 
or the comment needs to be fixed.

Eike
--nextPart3003713.5fSG56mABF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCX0o7gQAKCRBcpIk+abn8
TiEwAJsEu0R4mgLdTaEroV9nv2+fq56D9ACdHmTPxPFE9fKGjGf5QZo9Z+qWw8g=
=/d5p
-----END PGP SIGNATURE-----

--nextPart3003713.5fSG56mABF--




Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80167296A4D
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Oct 2020 09:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375697AbgJWHZX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Oct 2020 03:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S375696AbgJWHZX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 03:25:23 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A116AC0613CE
        for <linux-parisc@vger.kernel.org>; Fri, 23 Oct 2020 00:25:22 -0700 (PDT)
Received: (qmail 18927 invoked from network); 23 Oct 2020 07:21:16 -0000
Received: from p548d4414.dip0.t-ipconnect.de ([::ffff:84.141.68.20]:48386 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <jer@xs4all.nl>; Fri, 23 Oct 2020 09:21:16 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Jeroen Roovers <jer@xs4all.nl>, Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [RFC PATCH] parisc: Add wrapper syscalls to fix O_NONBLOCK flag usage
Date:   Fri, 23 Oct 2020 09:25:07 +0200
Message-ID: <5650648.lOV4Wx5bFT@eto.sf-tec.de>
In-Reply-To: <20201022164007.GA10653@ls3530.fritz.box>
References: <20200829122017.GA3988@ls3530.fritz.box> <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de> <20201022164007.GA10653@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4599117.31r3eYUQgx"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart4599117.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> +#define O_NONBLOCK_OLD		000200004
> +#define O_NONBLOCK_MASK_OUT	(O_NONBLOCK_OLD & ~O_NONBLOCK)
> +static int FIX_O_NONBLOCK(int flags)
> +{
> +	if (flags & O_NONBLOCK_MASK_OUT) {
> +		struct task_struct *tsk = current;
> +		pr_warn("%s(%d) uses old O_NONBLOCK value. "
> +			"Please recompile the application.\n",
> +			tsk->comm, tsk->pid);
> +	}
> +	return flags & ~O_NONBLOCK_MASK_OUT;
> +}

This will also trigger if I just pass 0x4 in flags, no? The check should be 

	if ((flags & O_NONBLOCK_OLD) == O_NONBLOCK_OLD)

because that would correctly reject a bare 0x4, at least I hope that this 
would already happen with the strict checking you mentioned.

Would a pr_warn_once make sense? Otherwise your log may get flooded by them if 
e.g. sudo is the problem and my nagios comes every minute to check something.

Eike
--nextPart4599117.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCX5KFUwAKCRBcpIk+abn8
TjWBAJwP02KRGeWftgbYsS+CuvvJwF4FtwCfS1qG1V6N8Mmtlk4VQgiesMv09vM=
=p8yk
-----END PGP SIGNATURE-----

--nextPart4599117.31r3eYUQgx--




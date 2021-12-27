Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A194747FDD0
	for <lists+linux-parisc@lfdr.de>; Mon, 27 Dec 2021 15:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237160AbhL0OaT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 Dec 2021 09:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234125AbhL0OaT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 Dec 2021 09:30:19 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B45DC06173E
        for <linux-parisc@vger.kernel.org>; Mon, 27 Dec 2021 06:30:18 -0800 (PST)
Received: (qmail 26397 invoked from network); 27 Dec 2021 14:30:42 -0000
Received: from p200300cf071195002d44b0807b269561.dip0.t-ipconnect.de ([2003:cf:711:9500:2d44:b080:7b26:9561]:47254 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Mon, 27 Dec 2021 15:30:42 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: pagefaults and hang with 5.15.11
Date:   Mon, 27 Dec 2021 15:30:10 +0100
Message-ID: <12921974.uLZWGnKmhe@daneel.sf-tec.de>
In-Reply-To: <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net>
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de> <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2808213.e9J7NaK4W3"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2808213.e9J7NaK4W3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 26. Dezember 2021, 18:22:12 CET schrieb John David Anglin:
> On 2021-12-26 11:21 a.m., Rolf Eike Beer wrote:
> > [139181.966881] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613
> > rcu_eqs_enter.constprop.0+0x8c/0x98
> This is probably not reproducible. You might try this change from Sven

At least this time the git testsuite has finished, but with some errors as 
usual.

> diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
> index cf92ece20b75..0cd97fa004c5 100644
> --- a/arch/parisc/kernel/smp.c
> +++ b/arch/parisc/kernel/smp.c
> @@ -228,11 +228,13 @@ static inline void
>   send_IPI_allbutself(enum ipi_message_type op)
>   {
>          int i;
> -
> +
> +       preempt_disable();
>          for_each_online_cpu(i) {
>                  if (i != smp_processor_id())
>                          send_IPI_single(i, op);
>          }
> +       preempt_enable();
>   }
> 
>   #ifdef CONFIG_KGDB

I'll add this and see what happens.

> and my "[PATCH v3] parisc: Rewrite light-weight syscall and futex code"
> change. Page faults in the LWS code can mess up scheduling.

But that would be nothing new. At least the machine has been quite stable in 
the last time.

> I haven't found 5.15.11 to be stable.

Ok, so I'll keep this in the queue for hppa and try again later.

Eike
--nextPart2808213.e9J7NaK4W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYcnN8gAKCRBcpIk+abn8
Tn9tAJ0ZSbi3ROGJj1mTOgw6q1JqaXqZlgCgnbPlhATiRCu5p+h+Jx8tfPU2eR8=
=+ql1
-----END PGP SIGNATURE-----

--nextPart2808213.e9J7NaK4W3--




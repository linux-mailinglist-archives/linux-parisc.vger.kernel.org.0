Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4008C4E7955
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 17:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358504AbiCYQyL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 12:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241225AbiCYQyL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 12:54:11 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B33C12EC
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 09:52:36 -0700 (PDT)
Received: (qmail 2449 invoked from network); 25 Mar 2022 16:52:33 -0000
Received: from p200300cf070e1300b9c188bfe20b0b3e.dip0.t-ipconnect.de ([2003:cf:70e:1300:b9c1:88bf:e20b:b3e]:45762 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 17:52:33 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 03/12] parisc: Move store_cpu_topology() into __cpuinit section
Date:   Fri, 25 Mar 2022 17:52:35 +0100
Message-ID: <3161280.aeNJFYEL58@daneel.sf-tec.de>
In-Reply-To: <20220325143833.402631-3-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de> <20220325143833.402631-3-deller@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3167340.44csPzL39Z"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart3167340.44csPzL39Z
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Freitag, 25. M=E4rz 2022, 15:38:24 CET schrieb Helge Deller:
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  arch/parisc/kernel/topology.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/parisc/kernel/topology.c b/arch/parisc/kernel/topology.c
> index 72d9aeb54fbe..dc766fb55491 100644
> --- a/arch/parisc/kernel/topology.c
> +++ b/arch/parisc/kernel/topology.c
> @@ -16,17 +16,18 @@
>  #include <linux/cpu.h>
>=20
>  #include <asm/topology.h>
> +#include <asm/sections.h>
>=20
>  static DEFINE_PER_CPU(struct cpu, cpu_devices);
>=20
> -static int dualcores_found __initdata;
> +static int dualcores_found;

I wonder if that should not be something like __cpuinit_data.

--nextPart3167340.44csPzL39Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYj3zUwAKCRBcpIk+abn8
Tpk/AJ0clD/Z979pY7IsfYRYLHuf/lXAoACgmW2D8H/0EsIBW8EQYKLczeEnBkc=
=tF5h
-----END PGP SIGNATURE-----

--nextPart3167340.44csPzL39Z--




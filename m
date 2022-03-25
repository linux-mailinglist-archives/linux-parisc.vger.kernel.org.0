Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5764E7933
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 17:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350657AbiCYQsM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 12:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377020AbiCYQsJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 12:48:09 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7400BE3397
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 09:46:34 -0700 (PDT)
Received: (qmail 2257 invoked from network); 25 Mar 2022 16:46:31 -0000
Received: from p200300cf070e1300b9c188bfe20b0b3e.dip0.t-ipconnect.de ([2003:cf:70e:1300:b9c1:88bf:e20b:b3e]:42864 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 17:46:31 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 01/12] parisc: Switch from GENERIC_CPU_DEVICES to GENERIC_ARCH_TOPOLOGY
Date:   Fri, 25 Mar 2022 17:46:26 +0100
Message-ID: <2098073.irdbgypaU6@daneel.sf-tec.de>
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12981920.uLZWGnKmhe"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart12981920.uLZWGnKmhe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Freitag, 25. M=E4rz 2022, 15:38:22 CET schrieb Helge Deller:
> Switch away from the own cpu topology code to common code which is used
> by ARM64 and RISCV. That allows us to enable hotplug later on too.

> diff --git a/arch/parisc/kernel/topology.c b/arch/parisc/kernel/topology.c
> index e88a6ce7c96d..72d9aeb54fbe 100644
> --- a/arch/parisc/kernel/topology.c
> +++ b/arch/parisc/kernel/topology.c
> @@ -71,6 +37,12 @@ void __init store_cpu_topology(unsigned int cpuid)
>  	if (cpuid_topo->core_id !=3D -1)
>  		return;
>=20
> +#ifdef CONFIG_HOTPLUG_CPU
> +	per_cpu(cpu_devices, cpuid).hotpluggable =3D 1;
> +#endif
> +	if (register_cpu(&per_cpu(cpu_devices, cpuid), cpuid))
> +		printk("Failed to register CPU device");
> +

This seems to be missing a level, and I think also printing the id of the=20
failing CPU wouldn't hurt either.


--nextPart12981920.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYj3x4gAKCRBcpIk+abn8
Tp7KAKCfrSZFsyOig8FWqYP96zhPYdB7jgCfezRR4mu8xhbjX1JZUNk7T0cQ13U=
=qZre
-----END PGP SIGNATURE-----

--nextPart12981920.uLZWGnKmhe--




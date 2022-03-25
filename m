Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFBF54E795E
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 17:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241225AbiCYQzU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 12:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377031AbiCYQzT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 12:55:19 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263EE3CA44
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 09:53:45 -0700 (PDT)
Received: (qmail 2525 invoked from network); 25 Mar 2022 16:53:42 -0000
Received: from p200300cf070e1300b9c188bfe20b0b3e.dip0.t-ipconnect.de ([2003:cf:70e:1300:b9c1:88bf:e20b:b3e]:46316 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 17:53:42 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 04/12] parisc: Move start_cpu_itimer() into __cpuinit section
Date:   Fri, 25 Mar 2022 17:53:43 +0100
Message-ID: <10053922.nUPlyArG6x@daneel.sf-tec.de>
In-Reply-To: <20220325143833.402631-4-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de> <20220325143833.402631-4-deller@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2178199.iZASKD2KPV"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2178199.iZASKD2KPV
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Freitag, 25. M=E4rz 2022, 15:38:25 CET schrieb Helge Deller:
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  arch/parisc/kernel/time.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
> index 061119a56fbe..4101392bf74d 100644
> --- a/arch/parisc/kernel/time.c
> +++ b/arch/parisc/kernel/time.c
> @@ -150,7 +150,7 @@ static struct clocksource clocksource_cr16 =3D {
>  	.flags			=3D CLOCK_SOURCE_IS_CONTINUOUS,
>  };
>=20
> -void __init start_cpu_itimer(void)
> +void __cpuinit start_cpu_itimer(void)
>  {
>  	unsigned int cpu =3D smp_processor_id();
>  	unsigned long next_tick =3D mfctl(16) + clocktick;

I would have squashed this and 5, 7, and 8 together. None of these patches=
=20
adds any sensible description and all do the same.
--nextPart2178199.iZASKD2KPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYj3zmAAKCRBcpIk+abn8
TqgjAJ9io6fBYkBT2MIAVbH+F+q1JXGceACfTvfEdUXDQF/9W+JSeS7UyOv07WM=
=xITa
-----END PGP SIGNATURE-----

--nextPart2178199.iZASKD2KPV--




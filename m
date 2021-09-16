Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CD240ECBA
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Sep 2021 23:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbhIPVkZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 16 Sep 2021 17:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbhIPVkY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 16 Sep 2021 17:40:24 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D388C061574
        for <linux-parisc@vger.kernel.org>; Thu, 16 Sep 2021 14:39:03 -0700 (PDT)
Received: (qmail 1185 invoked from network); 16 Sep 2021 21:39:00 -0000
Received: from p200300cf071b000028fa271ecebc7847.dip0.t-ipconnect.de ([2003:cf:71b::28fa:271e:cebc:7847]:48750 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Thu, 16 Sep 2021 23:39:00 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: Cycle offset is larger than allowed by the 'jiffies' clock's max_cycles value
Date:   Thu, 16 Sep 2021 23:38:54 +0200
Message-ID: <1795824.tdWV9SEqCh@daneel.sf-tec.de>
In-Reply-To: <11708426.O9o76ZdvQC@eto.sf-tec.de>
References: <11708426.O9o76ZdvQC@eto.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2078054.irdbgypaU6"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2078054.irdbgypaU6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Montag, 1. M=E4rz 2021, 17:25:18 CEST schrieb Rolf Eike Beer:
> After upgrade to 5.11 get this multiple times per second on my C8000:
>=20
> [   36.998702] WARNING: timekeeping: Cycle offset (29) is larger than
> allowed by the 'jiffies' clock's max_cycles value (10): time overflow
> danger [   36.998705]          timekeeping: Your kernel is sick, but tries
> to cope by capping time updates

This has nothing to do with the kernel version. For whatever reason=20
CONFIG_DEBUG_TIMEKEEPING was flipped on in the newer versions, no idea why =
and=20
how I did that.

However, that "may have a (very small) performance impact" in the Kconfig=20
isn't exactly true. When output through my 9600 serial line it slows the=20
kernel down to a crawl, so much that it doesn't even boot.

So, everything is fine for now.

Regards,

Eike
--nextPart2078054.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYUO5bgAKCRBcpIk+abn8
Tm/iAJ9P5C8z6/AgiiZZZ1z6zNsTGXyR6wCfTKZt1T5vC9jFPxF4m7qZUpb0Adw=
=n74g
-----END PGP SIGNATURE-----

--nextPart2078054.irdbgypaU6--




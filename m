Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66A64E8023
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Mar 2022 09:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbiCZJAT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 26 Mar 2022 05:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231671AbiCZJAS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 26 Mar 2022 05:00:18 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E9D29E4C8
        for <linux-parisc@vger.kernel.org>; Sat, 26 Mar 2022 01:58:41 -0700 (PDT)
Received: (qmail 26588 invoked from network); 26 Mar 2022 08:58:38 -0000
Received: from p200300cf0748ae0076d435fffeb7be92.dip0.t-ipconnect.de ([2003:cf:748:ae00:76d4:35ff:feb7:be92]:44430 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sat, 26 Mar 2022 09:58:38 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 09/12] parisc: Ensure set_firmware_width() is called only once
Date:   Sat, 26 Mar 2022 09:58:33 +0100
Message-ID: <2623688.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <20220325143833.402631-9-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de> <20220325143833.402631-9-deller@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11947298.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart11947298.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Freitag, 25. M=E4rz 2022, 15:38:30 CET schrieb Helge Deller:
> Make sure, that set_firmware_width() is only called once at
> runtime. This prevents that if secondary CPUs are started later
> get stuck in spinlocks.

The second sentence seems to be missing a word.
--nextPart11947298.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYj7VuQAKCRBcpIk+abn8
TtCLAJ9IU6ZR40I3ZQfSzXhk8oyP/prq1QCfWbLuEPqN/qfoNreEFkcwy1vYD8k=
=bVNE
-----END PGP SIGNATURE-----

--nextPart11947298.O9o76ZdvQC--




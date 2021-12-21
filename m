Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2718C47C6DD
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Dec 2021 19:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237256AbhLUSpp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Dec 2021 13:45:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbhLUSpp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Dec 2021 13:45:45 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5E0C061574
        for <linux-parisc@vger.kernel.org>; Tue, 21 Dec 2021 10:45:44 -0800 (PST)
Received: (qmail 13369 invoked from network); 21 Dec 2021 18:46:07 -0000
Received: from p200300cf071d93002c70fd508d773e21.dip0.t-ipconnect.de ([2003:cf:71d:9300:2c70:fd50:8d77:3e21]:46026 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Tue, 21 Dec 2021 19:46:07 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH] parisc: Fix mask used to select futex spinlock
Date:   Tue, 21 Dec 2021 19:45:37 +0100
Message-ID: <5778770.lOV4Wx5bFT@daneel.sf-tec.de>
In-Reply-To: <8186e8fe-1c64-c9fd-ca3c-f7514fb40428@bell.net>
References: <8186e8fe-1c64-c9fd-ca3c-f7514fb40428@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4703189.31r3eYUQgx"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart4703189.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 21. Dezember 2021, 19:33:16 CET schrieb John David Anglin:
> Fix mask used to select futex spinlock.
> 
> The address bits used to select the futex spinlock need to match those used
> in the LWS code in syscall.S. The mask 0x3f8 only selects 7 bits.  It
> should select 8 bits.

This change looks like this should become a helper macro or something like 
that so the code will stay in sync. Can the mask be shared with the LWS code 
with a constant while at it so it will also include that?

Eike
--nextPart4703189.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYcIg0QAKCRBcpIk+abn8
Tv6CAJsEOR4uCZeI2Sh3bYuGrCLKPH/ziACfQ0kzVNTZKmCSG+OQUyAlggyQBxw=
=PFvB
-----END PGP SIGNATURE-----

--nextPart4703189.31r3eYUQgx--




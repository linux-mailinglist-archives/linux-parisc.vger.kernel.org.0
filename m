Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC3347C698
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Dec 2021 19:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbhLUS3S (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Dec 2021 13:29:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhLUS3S (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Dec 2021 13:29:18 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B99C061574
        for <linux-parisc@vger.kernel.org>; Tue, 21 Dec 2021 10:29:17 -0800 (PST)
Received: (qmail 12729 invoked from network); 21 Dec 2021 18:29:39 -0000
Received: from p200300cf071d93002c70fd508d773e21.dip0.t-ipconnect.de ([2003:cf:71d:9300:2c70:fd50:8d77:3e21]:45962 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Tue, 21 Dec 2021 19:29:39 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH] parisc: Correct completer in lws start
Date:   Tue, 21 Dec 2021 19:29:07 +0100
Message-ID: <2611217.mvXUDI8C0e@daneel.sf-tec.de>
In-Reply-To: <44843798-7888-345f-84b6-f961960867fa@bell.net>
References: <44843798-7888-345f-84b6-f961960867fa@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11888591.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart11888591.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 21. Dezember 2021, 19:21:22 CET schrieb John David Anglin:
> Correct completer in lws start.
> 
> The completer in the "or,ev   %r1,%r30,%r30" instruction is reversed, so we
> are not clipping the LWS number when we are called from a 32-bit process
> (W=0). We need to nulify the depdi instruction when the least-significant
> bit of %r30 is 1.

I'm curious: what effect has this bug? Since this is syscall code I guess it 
can somehow be exposed from userspace, but how?

Maybe some sort of explanation like this can even be added to the commit 
message?

Eike
--nextPart11888591.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYcIc8wAKCRBcpIk+abn8
TrcrAKCKrFprOFBeuTW4Qx9qkQyOmvnF5ACeKlAkPtcskQmIBcRlE6s7jd1fVrE=
=Hovi
-----END PGP SIGNATURE-----

--nextPart11888591.O9o76ZdvQC--




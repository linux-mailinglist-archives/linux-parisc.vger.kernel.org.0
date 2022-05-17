Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA0EB52AAC2
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 20:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352216AbiEQS2v (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 14:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352289AbiEQS2o (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 14:28:44 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797A752508
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 11:28:36 -0700 (PDT)
Received: (qmail 14172 invoked from network); 17 May 2022 18:28:34 -0000
Received: from p200300cf071fc0006c0e7f8c8a4e3647.dip0.t-ipconnect.de ([2003:cf:71f:c000:6c0e:7f8c:8a4e:3647]:55968 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <dave.anglin@bell.net>; Tue, 17 May 2022 20:28:34 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Date:   Tue, 17 May 2022 20:28:27 +0200
Message-ID: <4399477.LvFx2qVVIh@daneel.sf-tec.de>
In-Reply-To: <5ea9b91f-1d64-027a-b00d-53e0ad2302ff@gmx.de>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain> <aa7e15ff-3e74-1b9d-4d65-235517b26675@bell.net> <5ea9b91f-1d64-027a-b00d-53e0ad2302ff@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2240253.ElGaqSPkdT"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2240253.ElGaqSPkdT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 17. Mai 2022, 20:11:38 CEST schrieb Helge Deller:

> I can easily split out the pr_warn("WARNING").

Would make sense IMHO.

> Moving the get_ptep() back to the original place seems ok, and I'll keep
> the strange indenting which checkpatch want.

If its back at the original place then there is no need to change as 
checkpatch will not complain on unmodified lines. If it needs to be moved and 
changed then I would say do it in it's own patch as well.

Eike
--nextPart2240253.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYoPpSwAKCRBcpIk+abn8
To+EAJ48gmgWdAhfphbwy90H7lJMxOs1ygCeKuANw/f4wDwTn2lCFSFsUOqmA/g=
=b6Y8
-----END PGP SIGNATURE-----

--nextPart2240253.ElGaqSPkdT--




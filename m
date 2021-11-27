Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256B945FE33
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Nov 2021 11:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233454AbhK0LBq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 27 Nov 2021 06:01:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235472AbhK0K7q (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Nov 2021 05:59:46 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705C9C061757
        for <linux-parisc@vger.kernel.org>; Sat, 27 Nov 2021 02:56:31 -0800 (PST)
Received: (qmail 5898 invoked from network); 27 Nov 2021 10:56:40 -0000
Received: from p200300cf072ea900047574fffec7eb88.dip0.t-ipconnect.de ([2003:cf:72e:a900:475:74ff:fec7:eb88]:34126 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 11:56:40 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     dri-devel@lists.freedesktop.org,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Kyle McMartin <kyle@mcmartin.ca>,
        David Airlie <airlied@linux.ie>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: Re: [PATCH] agp: parisc-agp: fix section mismatch warning
Date:   Sat, 27 Nov 2021 11:56:08 +0100
Message-ID: <2606759.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <20211127045757.27908-1-rdunlap@infradead.org>
References: <20211127045757.27908-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11872250.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart11872250.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 27. November 2021, 05:57:57 CET schrieb Randy Dunlap:
> Fix section mismatch warning in parisc-agp:

Too late ;)

https://lore.kernel.org/linux-parisc/20211126154754.263487-1-deller@gmx.de/

--nextPart11872250.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYaIOyAAKCRBcpIk+abn8
Tvi7AKClZxKBcLo3VyWARYzLALhDJxyLawCcCedq1ebV0hyjSRfwACH3OmSKeO4=
=75tg
-----END PGP SIGNATURE-----

--nextPart11872250.O9o76ZdvQC--




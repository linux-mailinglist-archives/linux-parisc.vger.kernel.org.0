Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3C75AFEB
	for <lists+linux-parisc@lfdr.de>; Sun, 30 Jun 2019 15:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfF3NnN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 30 Jun 2019 09:43:13 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:60889 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726500AbfF3NnN (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 30 Jun 2019 09:43:13 -0400
Received: (qmail 10454 invoked from network); 30 Jun 2019 13:42:34 -0000
Received: from dyn.ipv6.net-htp.de ([2a02:560:42e9:3c00:b904:f442:46c3:9705]:51922 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sun, 30 Jun 2019 15:42:34 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
Date:   Sun, 30 Jun 2019 15:43:01 +0200
Message-ID: <2240883.3K8JbTncdJ@daneel.sf-tec.de>
In-Reply-To: <16444139.ehY7rFqKE1@daneel.sf-tec.de>
References: <11946948.1Lt8Nslq4k@devpool21> <16444139.ehY7rFqKE1@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1786194.FuS0qg2YHQ"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart1786194.FuS0qg2YHQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 30. Juni 2019, 12:05:46 CEST schrieb Rolf Eike Beer:
> Am Donnerstag, 25. Januar 2018, 09:59:03 CEST schrieb Rolf Eike Beer:
> > The last message I had for the crash below is:
> > 
> > Running
> > /var/tmp/portage/sys-devel/gdb-7.12.1/work/gdb-7.12.1/gdb/testsuite/gdb.ba
> > s
> > e/bp-permanent.exp ...
> 
> I just have been told it's still happening with the gdb 8.3 testsuite on the
> Gentoo test machine:
> 
> Linux hake 4.19.52-gentoo #2 Tue Jun 18 13:51:01 EDT 2019 parisc PA8600
> (PCX-W +) 9000/785/C3600 GNU/Linux

This seems to be a minimal reproducer:

https://481768.bugs.gentoo.org/attachment.cgi?id=361728

Eike
--nextPart1786194.FuS0qg2YHQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXRi8ZQAKCRBcpIk+abn8
Tm/SAKCByXi8BjG/NSyecPJLx/mONsiwLwCgnofnD1uj+cWYA/HAmys1tCUOrH8=
=HduP
-----END PGP SIGNATURE-----

--nextPart1786194.FuS0qg2YHQ--




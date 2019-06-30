Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0845AF9C
	for <lists+linux-parisc@lfdr.de>; Sun, 30 Jun 2019 12:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfF3KFy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 30 Jun 2019 06:05:54 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:59039 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbfF3KFy (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 30 Jun 2019 06:05:54 -0400
Received: (qmail 3408 invoked from network); 30 Jun 2019 10:05:15 -0000
Received: from dyn.ipv6.net-htp.de ([2a02:560:42e9:3c00:b904:f442:46c3:9705]:51526 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sun, 30 Jun 2019 12:05:15 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
Date:   Sun, 30 Jun 2019 12:05:46 +0200
Message-ID: <16444139.ehY7rFqKE1@daneel.sf-tec.de>
In-Reply-To: <11946948.1Lt8Nslq4k@devpool21>
References: <11946948.1Lt8Nslq4k@devpool21>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4679515.lFrMZkWn1x"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart4679515.lFrMZkWn1x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 25. Januar 2018, 09:59:03 CEST schrieb Rolf Eike Beer:
> The last message I had for the crash below is:
> 
> Running
> /var/tmp/portage/sys-devel/gdb-7.12.1/work/gdb-7.12.1/gdb/testsuite/gdb.bas
> e/bp-permanent.exp ...

I just have been told it's still happening with the gdb 8.3 testsuite on the 
Gentoo test machine:

Linux hake 4.19.52-gentoo #2 Tue Jun 18 13:51:01 EDT 2019 parisc PA8600 (PCX-W
+) 9000/785/C3600 GNU/Linux

Eike
--nextPart4679515.lFrMZkWn1x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXRiJegAKCRBcpIk+abn8
TptQAKCPk3tR3UWLl7eUm2FyIKJkRFsyEwCff2Ssf/C8lKH2X5C/dB2Wk1ruFwU=
=FtFb
-----END PGP SIGNATURE-----

--nextPart4679515.lFrMZkWn1x--




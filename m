Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E8B1A8EF
	for <lists+linux-parisc@lfdr.de>; Sat, 11 May 2019 19:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbfEKRur (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 11 May 2019 13:50:47 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:57795 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbfEKRuq (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 11 May 2019 13:50:46 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Sat, 11 May 2019 13:50:46 EDT
Received: (qmail 25471 invoked from network); 11 May 2019 17:40:52 -0000
Received: from dyn.ipv6.net-htp.de ([2a02:560:42ac:5000:399c:bb18:66f6:1ef9]:50590 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.34dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sat, 11 May 2019 19:40:52 +0200
From:   Rolf Eike Beer <eike@sf-mail.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: 5.2 hppa merge seems to work on my machines
Date:   Sat, 11 May 2019 19:43:55 +0200
Message-ID: <11714378.QMnzgogxCp@daneel.sf-tec.de>
In-Reply-To: <ac66dab9-6686-c03c-603b-eda4ce0e3e4f@gmx.de>
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee> <3f99216a-a653-3552-a347-9c645d274b98@bell.net> <ac66dab9-6686-c03c-603b-eda4ce0e3e4f@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1842083.qIz37b5VqQ"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart1842083.qIz37b5VqQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 11. Mai 2019, 17:43:23 CEST schrieb Helge Deller:
> On 11.05.19 17:27, John David Anglin wrote:
> > On 2019-05-11 6:47 a.m., Helge Deller wrote:
> >>> I am testing a few sata controllers, see here
> >>> http://www.downthebunker.com/reloaded/space/viewtopic.php?f=50&p=1563
> >> 
> >> In one of our buildds we use a
> >> Silicon Image, Inc. SiI 3112 Serial ATA Controller (rev 02)
> >> PCI card.
> > 
> > This Syba card also works:
> > 00:01.0 RAID bus controller: Silicon Image, Inc. SiI 3124 PCI-X Serial ATA
> > Controller (rev 02)
> I've added both to a new Wiki section "SATA Controllers":
> https://parisc.wiki.kernel.org/index.php/Hardware_support

You can add this one:

40:03.0 RAID bus controller: VIA Technologies, Inc. VT6421 IDE/SATA Controller 
(rev 50)

I have been using it for years, first in my C3600, now in my C8000.

Eike
--nextPart1842083.qIz37b5VqQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXNcJ2wAKCRBcpIk+abn8
Th9eAJ41QQbRz8OwhaUARWkeAcWENCFa6gCeLZUKpWG5L8FOLUU5ul7+c95BEuU=
=edow
-----END PGP SIGNATURE-----

--nextPart1842083.qIz37b5VqQ--




Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63E286C0A7
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Jul 2019 19:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbfGQRw2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 17 Jul 2019 13:52:28 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:45699 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727140AbfGQRw2 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 Jul 2019 13:52:28 -0400
Received: (qmail 17666 invoked from network); 17 Jul 2019 17:50:56 -0000
Received: from dslb-088-071-103-253.088.071.pools.vodafone-ip.de ([::ffff:88.71.103.253]:54122 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Wed, 17 Jul 2019 19:50:56 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
Date:   Wed, 17 Jul 2019 19:52:20 +0200
Message-ID: <1957442.0sSArhqTEx@daneel.sf-tec.de>
In-Reply-To: <5e2ad677-7062-98d2-a6c5-577df02132d4@gmx.de>
References: <11946948.1Lt8Nslq4k@devpool21> <029de4f5-62db-7d74-7619-3c7888ce4f9c@gmx.de> <5e2ad677-7062-98d2-a6c5-577df02132d4@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2986770.BkX77FEQCQ"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2986770.BkX77FEQCQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Helge wrote:
> Hi Rolf,
> 
> On 02.07.19 17:59, Helge Deller wrote:
> >>> This seems to be a minimal reproducer:
> >>> https://481768.bugs.gentoo.org/attachment.cgi?id=361728
> > 
> > That's a REALLY nasty bug!
> 
> I think I finally fixed the issues for 32- and 64-bit kernels.
> 
> Can you please test the three patches in my ptrace-bugfix3 git tree?
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/
> ?h=ptrace-bugfix3

I applied them on top of 5.2.0 and tested it on my C8000, it survived the 
whole gdb 8.1.2 testsuite. The results are horrible, but the machine is still 
up and running, just a couple of these:

[ 4481.730278] INEQUIVALENT ALIASES 0x41000000 and 0x42e81000 in file kill-
detach-inferiors-cmd
[ 8944.224759] INEQUIVALENT ALIASES 0x41ed2000 and 0x4171c000 in file multi-
attach

So feel free to add my Tested-by.

Eike
--nextPart2986770.BkX77FEQCQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXS9gVAAKCRBcpIk+abn8
Tky4AJ4jx48BKNui8bK/ti9yehIHER3jywCdG8acJxMQ/Nxsc2MkUOqZuQvXuxQ=
=iWE6
-----END PGP SIGNATURE-----

--nextPart2986770.BkX77FEQCQ--




Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C49D1FB4D4
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Jun 2020 16:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgFPOqo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Jun 2020 10:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbgFPOqn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Jun 2020 10:46:43 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C313CC061573
        for <linux-parisc@vger.kernel.org>; Tue, 16 Jun 2020 07:46:41 -0700 (PDT)
Received: (qmail 5978 invoked from network); 16 Jun 2020 14:45:42 -0000
Received: from p548d4959.dip0.t-ipconnect.de ([::ffff:84.141.73.89]:59740 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Tue, 16 Jun 2020 16:45:42 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: [PATCH] parisc: Prevent optimization of loads and stores in atomic operations
Date:   Tue, 16 Jun 2020 16:46:29 +0200
Message-ID: <2690783.z6zax5hIIu@daneel.sf-tec.de>
In-Reply-To: <55841e49-cf36-e49a-5b33-7b60d3275e56@bell.net>
References: <55841e49-cf36-e49a-5b33-7b60d3275e56@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1597910.IeInXdVt9Q"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart1597910.IeInXdVt9Q
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> The fix is to use a volatile pointer for the accesses in spinlocks.  This
> prevents gcc from optimizing the accesses.
> 
> I have now run 5.6.1[78] kernels for about 4 days without a stall or any
> other obvious kernel issue.

It does not cleanly apply to 5.7.2, but the parts that do apply have made my 
C8000 run longer in the gcc testsuite than before. I will run it for a few 
days more to be sure, but it looks good so far.

My testcase is: run several CMake nightlies every day by cron, run emerge jobs 
for Gentoo stabilization in a chroot. For the last few attempts it always 
tried to run the gcc 8.4.0 testsuite at the end, which killed the machine 
eventually.

Eike
--nextPart1597910.IeInXdVt9Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXujbRQAKCRBcpIk+abn8
TmPRAJ4r/xmXI0lM7ajKU8JPNL18EiDBnQCfZqKcAuaPbJRcrCI0BR56qF48IKA=
=k8mv
-----END PGP SIGNATURE-----

--nextPart1597910.IeInXdVt9Q--




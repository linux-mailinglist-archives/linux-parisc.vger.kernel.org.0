Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B9C1FD575
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Jun 2020 21:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgFQTbw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 17 Jun 2020 15:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgFQTbw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 Jun 2020 15:31:52 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F489C06174E
        for <linux-parisc@vger.kernel.org>; Wed, 17 Jun 2020 12:31:51 -0700 (PDT)
Received: (qmail 31687 invoked from network); 17 Jun 2020 19:30:50 -0000
Received: from p548d49c5.dip0.t-ipconnect.de ([::ffff:84.141.73.197]:35202 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Wed, 17 Jun 2020 21:30:50 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: [PATCH] parisc: Prevent optimization of loads and stores in atomic operations
Date:   Wed, 17 Jun 2020 21:31:40 +0200
Message-ID: <69241344.BnyGGfobf6@daneel.sf-tec.de>
In-Reply-To: <2843d7e4-9088-8f83-9401-8fa04d9f935a@bell.net>
References: <55841e49-cf36-e49a-5b33-7b60d3275e56@bell.net> <02835c09-8b8f-6e48-11b5-162c5fa94b83@bell.net> <2843d7e4-9088-8f83-9401-8fa04d9f935a@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3700307.YuncqRlg4q"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart3700307.YuncqRlg4q
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 17. Juni 2020, 16:41:44 CEST schrieb John David Anglin:
> On 2020-06-16 10:57 a.m., John David Anglin wrote:I will post an updated
> patch against trunk in a day or two.  The debian gcc-snapshot package is
> > building on mx3210 and phantom.  This package almost always failed to
> > build on phantom.
> Sadly, the patch doesn't fix problem:

Whatever is still the issue, for me it makes things much better. So you may 
add:

Tested-by: Rolf Eike Beer <eike-kernel@sf-tec.de>

Greetings

Eike
--nextPart3700307.YuncqRlg4q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXupvnAAKCRBcpIk+abn8
Tnx4AJ9crFt++cGHHNMdbL/g1XZ+iCQy6ACdE5u79pAgVx/iWeeOWJs1VXeWN4s=
=66BA
-----END PGP SIGNATURE-----

--nextPart3700307.YuncqRlg4q--




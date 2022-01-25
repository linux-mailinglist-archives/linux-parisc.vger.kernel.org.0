Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5252649B976
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Jan 2022 17:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235054AbiAYQ65 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 25 Jan 2022 11:58:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383094AbiAYQ4s (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 25 Jan 2022 11:56:48 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D8BC061794
        for <linux-parisc@vger.kernel.org>; Tue, 25 Jan 2022 08:54:32 -0800 (PST)
Received: (qmail 10763 invoked from network); 25 Jan 2022 16:53:22 -0000
Received: from p200300cf0713e20076d435fffeb7be92.dip0.t-ipconnect.de ([2003:cf:713:e200:76d4:35ff:feb7:be92]:48796 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Tue, 25 Jan 2022 17:53:22 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: pagefaults and hang with 5.15.11
Date:   Tue, 25 Jan 2022 17:54:29 +0100
Message-ID: <4711347.31r3eYUQgx@eto.sf-tec.de>
In-Reply-To: <a23a26c3-6760-33e1-a390-5f51b103dd17@bell.net>
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de> <f872b4fc-2d26-5b89-c985-261966c9f49d@bell.net> <a23a26c3-6760-33e1-a390-5f51b103dd17@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4373265.LvFx2qVVIh"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart4373265.LvFx2qVVIh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 24. Januar 2022, 18:41:27 CET schrieb John David Anglin:
> On 2022-01-24 12:24 p.m., John David Anglin wrote:
> > Faulting instruction is "ldw 18(r3),r24".  Address in $r3 (and $r5) seems 
> > bad.  Think the sglist argument
> > to sba_unmap_sg() is bad.  Don't have a clue as to why this might be.
> Maybe try interchanging operands of following &&
> 
>          while (sg_dma_len(sglist) && nents--) {
> 
> so nents is checked first.

But nents would be increased then even for the case that sg_dma_len() returns 
false, which may or may not be wanted.
--nextPart4373265.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYfArRQAKCRBcpIk+abn8
TgIoAJ0V6uZH0R3nG4ZHv7/MlFC3iG0cFwCfcB9D4HycozWKFgwzQ1Vuq8G+fd8=
=4VyJ
-----END PGP SIGNATURE-----

--nextPart4373265.LvFx2qVVIh--




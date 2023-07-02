Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5C6D744E48
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Jul 2023 17:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjGBPR4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jul 2023 11:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjGBPR4 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jul 2023 11:17:56 -0400
X-Greylist: delayed 400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 02 Jul 2023 08:17:44 PDT
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB91EE67
        for <linux-parisc@vger.kernel.org>; Sun,  2 Jul 2023 08:17:44 -0700 (PDT)
Received: (qmail 14905 invoked from network); 2 Jul 2023 15:10:10 -0000
Received: from unknown ([2001:9e8:6dce:5600:400c:48ff:fe8b:bd]:35786 HELO  =?ISO-8859-1?Q?=20eto?=
        =?ISO-8859-1?Q?.sf-tec.de=04?=
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sun, 02 Jul 2023 17:10:10 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Subject: Re: [GIT PULL] parisc architecture fixes & updates for v6.5-rc1
Date:   Sun, 02 Jul 2023 17:10:56 +0200
Message-ID: <2687291.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <ZKGOzzDGM1925iYg@p100>
References: <ZKGOzzDGM1925iYg@p100>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12237308.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_20,NO_DNS_FOR_FROM,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart12237308.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Date: Sun, 02 Jul 2023 17:10:56 +0200
Message-ID: <2687291.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <ZKGOzzDGM1925iYg@p100>
References: <ZKGOzzDGM1925iYg@p100>

>       parisc: Default to 8 CPUs for 64-bit kernel

I wonder which machine that is, given that most of us are using C8000 or 
rp3440 that only support 2x2 CPUs, or even older cruft.

Eike
--nextPart12237308.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCZKGTgAAKCRBcpIk+abn8
TprbAJ9bmEFT/WpND8NxWBfNR4aI4qXXbQCdFuICVkdycI9PCKJLIJOiCH2T3RY=
=4nR7
-----END PGP SIGNATURE-----

--nextPart12237308.O9o76ZdvQC--




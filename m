Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 560B84D3164
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Mar 2022 16:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbiCIPEb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 9 Mar 2022 10:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiCIPEa (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 9 Mar 2022 10:04:30 -0500
X-Greylist: delayed 401 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Mar 2022 07:03:29 PST
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CEFB251F
        for <linux-parisc@vger.kernel.org>; Wed,  9 Mar 2022 07:03:29 -0800 (PST)
Received: (qmail 22413 invoked from network); 9 Mar 2022 14:56:46 -0000
Received: from p200300cf070a5100184079fffeaff4d2.dip0.t-ipconnect.de ([2003:cf:70a:5100:1840:79ff:feaf:f4d2]:44836 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Wed, 09 Mar 2022 15:56:46 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: support for DEBUG_VM_PGTABLE
Date:   Wed, 09 Mar 2022 15:56:41 +0100
Message-ID: <2621439.mvXUDI8C0e@eto.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11936862.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart11936862.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Some recent patches made me aware of DEBUG_VM_PGTABLE. Has anyone tried to get 
this working on hppa? Given the constant problems with caches and memory it 
may help find some subtle bugs in the code.

Greetings,

Eike
--nextPart11936862.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYijAKQAKCRBcpIk+abn8
TmcWAJ9dl+UeujwR5Leiyz2UuHVMsACUogCdH6PVeun1pm+vON8TlOPsTZVWmuc=
=ZNfN
-----END PGP SIGNATURE-----

--nextPart11936862.O9o76ZdvQC--




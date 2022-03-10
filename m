Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3FF4D4D63
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Mar 2022 16:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344487AbiCJPOe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Mar 2022 10:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346434AbiCJPOB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Mar 2022 10:14:01 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68564A0BC6
        for <linux-parisc@vger.kernel.org>; Thu, 10 Mar 2022 07:12:20 -0800 (PST)
Received: (qmail 8802 invoked from network); 10 Mar 2022 15:12:18 -0000
Received: from p548d4591.dip0.t-ipconnect.de ([::ffff:84.141.69.145]:36954 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Thu, 10 Mar 2022 16:12:18 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: support for DEBUG_VM_PGTABLE
Date:   Thu, 10 Mar 2022 16:12:12 +0100
Message-ID: <2621624.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <c32d97c8-b5f1-ec33-06e0-2659b0875004@gmx.de>
References: <2621439.mvXUDI8C0e@eto.sf-tec.de> <c32d97c8-b5f1-ec33-06e0-2659b0875004@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11937542.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart11937542.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Donnerstag, 10. M=E4rz 2022, 11:24:19 CET schrieb Helge Deller:
> Hi Eike,
>=20
> On 3/9/22 15:56, Rolf Eike Beer wrote:
> > Some recent patches made me aware of DEBUG_VM_PGTABLE. Has anyone tried=
 to
> > get this working on hppa?
>=20
> No, I haven't tried yet.
>=20
> > Given the constant problems with caches and memory it
> > may help find some subtle bugs in the code.
>=20
> I'm sure it makes sense to make it work and test it once.
> Will you try?

I fear my knowledge about the hppa internals is not deep enough to really=20
understand what's going on there. Plus the usual excuses about missing time.

The only thing I can really offer is testing and reviews.

Eike
--nextPart11937542.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYioVTAAKCRBcpIk+abn8
TkUCAKCBji5P0Nc4VkTNjkNc7OkQRHc+QQCgide0eM89NCozdYBBUANmezSMYAw=
=zbZ8
-----END PGP SIGNATURE-----

--nextPart11937542.O9o76ZdvQC--




Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B228529DB6
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 20:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfEXSGR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 14:06:17 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:47709 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726071AbfEXSGR (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 14:06:17 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Fri, 24 May 2019 14:06:16 EDT
Received: (qmail 22955 invoked from network); 24 May 2019 17:59:11 -0000
Received: from dslb-088-071-174-030.088.071.pools.vodafone-ip.de ([::ffff:88.71.174.30]:44384 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Fri, 24 May 2019 19:59:11 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: PCI HPMC on C240 with alternatives Patching
Date:   Fri, 24 May 2019 19:59:29 +0200
Message-ID: <2566102.OSG4xBkCuZ@daneel.sf-tec.de>
In-Reply-To: <20190524153819.GA778@t470p.stackframe.org>
References: <20190524065850.GA9849@t470p.stackframe.org> <20190524113241.GA11609@t470p.stackframe.org> <20190524153819.GA778@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5437709.d4PlakjzyC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart5437709.d4PlakjzyC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> diff --git a/arch/parisc/include/asm/hardware.h
> b/arch/parisc/include/asm/hardware.h index 9d3d7737c58b..5fb7a3c3eb46
> 100644
> --- a/arch/parisc/include/asm/hardware.h
> +++ b/arch/parisc/include/asm/hardware.h
> @@ -121,6 +121,7 @@ extern void init_parisc_bus(void);
>  extern struct device *hwpath_to_device(struct hardware_path *modpath);
>  extern void device_to_hwpath(struct device *dev, struct hardware_path
> *path); extern int machine_has_merced_bus(void);
> +extern int machine_has_ioa(void);

This could return bool.
--nextPart5437709.d4PlakjzyC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXOgxAQAKCRBcpIk+abn8
TnIlAKCkLsf3VJF5bHTxEHFj/p0BrWpB4gCfRmYnshzksYxkZxgIsggcGm1d96s=
=NyNa
-----END PGP SIGNATURE-----

--nextPart5437709.d4PlakjzyC--




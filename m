Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA17C6A501B
	for <lists+linux-parisc@lfdr.de>; Tue, 28 Feb 2023 01:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjB1AUp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 Feb 2023 19:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjB1AUo (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 Feb 2023 19:20:44 -0500
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671C01A96D
        for <linux-parisc@vger.kernel.org>; Mon, 27 Feb 2023 16:20:43 -0800 (PST)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_61B96087-3F55-4777-9491-A770255F919D";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH] parisc: Ensure page-aligned addresses in cache flush and
 copy functions
From:   Sam James <sam@gentoo.org>
In-Reply-To: <20230127213941.83967-1-deller@gmx.de>
Date:   Tue, 28 Feb 2023 00:20:22 +0000
Cc:     linux-parisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Ira Weiny <ira.weiny@intel.com>,
        "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Message-Id: <71A3B07F-296F-4017-B2EE-710590637107@gentoo.org>
References: <20230127213941.83967-1-deller@gmx.de>
To:     Helge Deller <deller@gmx.de>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Apple-Mail=_61B96087-3F55-4777-9491-A770255F919D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 27 Jan 2023, at 21:39, Helge Deller <deller@gmx.de> wrote:
>=20
> Matthew Wilcox noticed, that if ARCH_HAS_FLUSH_ON_KUNMAP is defined
> (which is the case for PA-RISC), __kunmap_local() calls
> kunmap_flush_on_unmap(), which may call the parisc flush functions =
with
> a non-page-aligned address and thus the page might not be fully =
flushed.
>=20
> To prevent similiar cases, page-align any given address in the
> following parisc low-level calls:
> - clear_page_asm(),
> - copy_page_asm(),
> - copy_user_page_asm(),
> - clear_user_page_asm(),
> - flush_kernel_dcache_page_asm(),
> - purge_kernel_dcache_page_asm() and
> - flush_kernel_icache_page()
>=20
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Is this patch obsolete as of =
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dfor-next&id=3D76008c1008dca3cdd7709f4a468b0c3ff9787632
or still relevant?

Asking because I want to know if I should carry on testing with it or =
not.

Thanks!

--Apple-Mail=_61B96087-3F55-4777-9491-A770255F919D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iNUEARYKAH0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCY/1IyF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MAAKCRBzhAn1IN+R
kMrbAQCWYdP/5MPN/YgCt3PLPC5Xp3kRfc2rBMDMi03OMgmcQwD/bOBbU4qb6cld
+L7PmmvVEJF5l3PtnxXIOPsTy8/TlQA=
=MnTP
-----END PGP SIGNATURE-----

--Apple-Mail=_61B96087-3F55-4777-9491-A770255F919D--

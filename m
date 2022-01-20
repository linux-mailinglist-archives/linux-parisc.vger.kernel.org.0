Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926F6494540
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Jan 2022 01:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiATA4F (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Jan 2022 19:56:05 -0500
Received: from mta-tor-002.bell.net ([209.71.212.29]:17146 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230426AbiATA4F (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Jan 2022 19:56:05 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61E6FD76002AF725
X-CM-Envelope: MS4xfIVYlbxgt/5nr7/vyAgh2aCvFtNttkPT2KrrC73z4xu4RgYDlqIiruejFf/trwF3374x22sSioWhXmBCBpu985M7BhvqKVlmPaJLlT3rGUdtiGY6zDYz
 5fw+awpHOvyWbhCiuwYoFlARzZxqRRbGUCvEgX2WF7bOYPz6KzCEBWA9H3sdvCFSXCNfIPBh+KVkA4mpB3uX18GjfoRmnbORiR3nfaHgUY0Bp18GHq51mnMS
 Sa8sF3wKBVcjYxdQI91X7iPu9+kl36sra9i0HXSrgNGUOYukNIOQJ5o+b50z8MgGxfGNbt8o+ihKwddj8Rk34HGeouAlfpdadMfaPs5UZapTdVxZ/T4K9Xp+
 efJzYCpsgLflGDqd5Cj4/mMkQVhaY2uK5Vbm6jHvctuILHoDnEZZDBcMZ7iGeLeNOAXdRABQAmLQLOJvZ3cW+z7EPDYI6eKTA4UZ6csL12tcbAb2ciCFsBSY
 OeQGna6yF+uNZuwz5WLB/esgxMPL59WmQ7wZftvwxga9eCrbiJJTK1lsxZ3ZLW9RNc+RLj344S/CUp2HXDEMVNPuLLwS3gDhA6Rfw4yQkPdLN6rwT1IzPqZQ
 c6Jr9pJ7oLHV9gyW15IIfbgJZRaDrjBK3gi1ulm7x0pVmA==
X-CM-Analysis: v=2.4 cv=W7Vb6Tak c=1 sm=1 tr=0 ts=61e8b312
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=DghFqjY3_ZEA:10 a=FBHGMhGWAAAA:8 a=2oCxmd4MbWu7oaBBeJcA:9 a=CjuIK1q_8ugA:10
 a=WBo9P5VBDFbwtsgBEzMA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61E6FD76002AF725; Wed, 19 Jan 2022 19:55:46 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id A6BC4220115; Thu, 20 Jan 2022 00:55:45 +0000 (UTC)
Date:   Thu, 20 Jan 2022 00:55:45 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Drop __init from map_pages declaration
Message-ID: <YeizEbZ6JftgFyw1@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Lc+5zmV9N+BKm02X"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Lc+5zmV9N+BKm02X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

With huge kernel pages, we randomly eat a SPARC in map_pages(). This
is fixed by dropping __init from the declaration.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 1ae31db9988f..b90d7e408b0d 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -337,7 +337,7 @@ static void __init setup_bootmem(void)
=20
 static bool kernel_set_to_readonly;
=20
-static void __init map_pages(unsigned long start_vaddr,
+static void map_pages(unsigned long start_vaddr,
 			     unsigned long start_paddr, unsigned long size,
 			     pgprot_t pgprot, int force)
 {


--Lc+5zmV9N+BKm02X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmHoswgACgkQXb/Nrl8Z
TfGnnBAAgIwEgQPp7qT2xlHdhvpNaqFo8214Q27MBY9Ogr3th5WD6fv7pNb6dmNS
JbdzX9DvqhHqyZxlZRFSd9J9mjHExPFClZhnk0HNfigaOS1HfnF0Gr4sDvEkdJSt
J/RnxOb5t9PHjcJgRaVSI90dAqJRJjEvMWsOBx7ES+AGFqko2GhAADfo482MbNoA
sxAWWpzEZv2o8eVtfakiNZE/0FIjsJgOCtjQ/w0sGM8r1m49iRaO13VjRjs4gA7v
tOsBWOdjCfIEBmomNT1f+l1TrJfX1hBmPwAO3Js3Xp22hF4lf24ne1voXr6NRE1i
sy+sxG1Cu95JKHxzUonmf3QtruA7JenAHQ4o9uZRFWGWSWPP1KZAFq16kb2gX07R
Ac4SP5AvXB03hiPP5dUdAjTRwheyn0NQ054vslzAj3Uedr9uQlnRNnOiheDSbbog
i/wxsTbUTKEWkl2d0YSHiA9l3+HiqjMB+xHK/KdwJywAh7I+s+wS+xlk6a5Ra3Ko
x6/7OcZh9EhVqnD297HvxBQplrMlsQe0yCiF9RojK+/30fIL9hZNdNFBpY5a3RWY
R1qAiGwBUfh6oTQ3pnNgphLbB2Xvb7KWjbVEzLy9v5TBQwoBYaRnYwXptPaIMqPv
UqzIcXlKsso8gQpMHVF7BmkYxukwMxkeDQ8OuMz7lkS4Ip/pg4c=
=9WEE
-----END PGP SIGNATURE-----

--Lc+5zmV9N+BKm02X--

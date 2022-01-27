Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA8849EE22
	for <lists+linux-parisc@lfdr.de>; Thu, 27 Jan 2022 23:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241008AbiA0WeE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 27 Jan 2022 17:34:04 -0500
Received: from mta-mtl-003.bell.net ([209.71.208.13]:26806 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S239018AbiA0WeE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 27 Jan 2022 17:34:04 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61E9B8D000908B4A
X-CM-Envelope: MS4xfIOrTKdufD3UM+ssI63W2ayr/UsO+BgK0D7duqoQLUBk7TOYXm5y47USlq2hgd/p2/9dTYU22g/dJpwFm2zCz61oKK9IHgYWSDhSY6g4CTXaT9dL4z08
 pRChzGGrhxuj1Ew4EKCJgE6EwR71aHutB3fPdRBiGpAEcsvfkUKg9Wr2diyoualWLoOmFvWym2P62anfb8ceWa16Le7tuxpJKC+a706wa7sDIjCpcdyzYndx
 tZmnzcqCf6kiHJdZcFezNq+sm1PEhbnly2o3j2mqpwwADwD6HuruWryMvDnBBBH8PsMnBuItjlQjnZ1zhGexhbvyu495Gxt1a58ds2RXVmZTTQEgJ4QoBsQj
 3RgEEO+2Tu1Fi+mhSlgRHHpdrOrL+dyi37mmcBfjKI2O9+UogwrizywpoDSw4sJGqgfI8QValP8SNZgHzpqJEbFzMXEIFwna3JdwvwCgYbHF38hb0b1qaMQv
 MzzbUvt7GtLCx13KswiJmVnv+DbuURiGoBjreP3Wi2j5+eWN/f2vjLC1/Cv+km8UDWIIV8R0WuajAaNruFoLmtW9ltlyYQujm5WC2wgFONuTxuSA9cUF33Ut
 3oGJE6dmSqEfRd/t+Ho0FeaEH6NOE6oKYAy8xY9nPEKaDA==
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61f31dc6
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=DghFqjY3_ZEA:10 a=FBHGMhGWAAAA:8 a=HblYpiq5tT6TEsmxS5EA:9 a=CjuIK1q_8ugA:10
 a=_TZt9d5dLS8edx5Vtu8A:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61E9B8D000908B4A; Thu, 27 Jan 2022 17:33:42 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id C4106220116; Thu, 27 Jan 2022 22:33:41 +0000 (UTC)
Date:   Thu, 27 Jan 2022 22:33:41 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Fix sglist access in ccio-dma.c
Message-ID: <YfMdxa0qXdPDSUAr@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7FAfvi9dH1s/WA9v"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--7FAfvi9dH1s/WA9v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patch implements the same change to ccio-dma.c as to sba_iommu.c.
This ensures that only the allocated entries of the sglist are accessed.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 059566f54429..9be007c9420f 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1003,7 +1003,7 @@ ccio_unmap_sg(struct device *dev, struct scatterlist =
*sglist, int nents,
 	ioc->usg_calls++;
 #endif
=20
-	while(sg_dma_len(sglist) && nents--) {
+	while (nents && sg_dma_len(sglist)) {
=20
 #ifdef CCIO_COLLECT_STATS
 		ioc->usg_pages +=3D sg_dma_len(sglist) >> PAGE_SHIFT;
@@ -1011,6 +1011,7 @@ ccio_unmap_sg(struct device *dev, struct scatterlist =
*sglist, int nents,
 		ccio_unmap_page(dev, sg_dma_address(sglist),
 				  sg_dma_len(sglist), direction, 0);
 		++sglist;
+		nents--;
 	}
=20
 	DBG_RUN_SG("%s() DONE (nents %d)\n", __func__, nents);

--7FAfvi9dH1s/WA9v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmHzHboACgkQXb/Nrl8Z
TfFz3g//cVpbEVWEzsXMI7/Q0lIlnf5HJSY5JbS76E6TGiIwgpWhQBpaMzN7iwUy
bRyiISuo+mJQf1cVJ1D5jSdLDPgV6/ZjoAgtH50aPOPotYktZnXpoKb2VPnpUVVi
hkKnNuBu/SWqj60sUHHm+pOzDPdtQZwoDYF39BH4rsDE7NRKcKcHGglFjFstgrN+
kws5IBmgGlvp/30USPlfY1D1SPwh4CmzvvWlbuui7JUOH24j7AnEUojoGSo+om6c
sk7R4GWeihrOdxWfOBWnqZhWnpoxuIQuPUZDAomqJZB3jOPesKhOeKHoa4t3zw28
/IlZEnRsTDwKbKKAbQZaoup4iVx6OG10LsU7m91Bs5AO6cY9UtVr8xaM6TkCsp5h
CC/qoGQwRisbhMTfnX8JwscZBldYNT7rtHIPArfsKcDo33HZTUO4yD50+zrMFmEW
7b1Z4EsiDC4OozRfgY/qRh99CDxU/5QbbZ+I5NYLEXQMydLfbOJfqDsJS7qDGMnR
2wnCNvzVxSPgZIrXkvnn9YZpRiIYReLPEpB6ELHiZA9dolkvbSTxeH+bq5GH+fT8
HGNvB466FwaUTLg4j7+O6SaauZKsbXMiEvcaJPRf9G9ALIShrXT9sfZioamtZNrC
tpJQFyONV46+t6HQwzkMorlh7D7bb4/yDpLYuSabxpIo8Cp/sfE=
=8CY8
-----END PGP SIGNATURE-----

--7FAfvi9dH1s/WA9v--

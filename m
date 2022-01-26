Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20FD49D3C0
	for <lists+linux-parisc@lfdr.de>; Wed, 26 Jan 2022 21:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbiAZUjW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 26 Jan 2022 15:39:22 -0500
Received: from mta-tor-004.bell.net ([209.71.212.31]:16660 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229657AbiAZUjV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 26 Jan 2022 15:39:21 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61E5E7EC00C90E23
X-CM-Envelope: MS4xfA5ItqVPzKDcgSgs1Nm+4uiH+x2gEs1pxLUXkqZqH53Hs3JqC36BYd03TxpbEwPNGyI9WTlVaUlZUKeBYZaGesI3xr7EdHzdHF1L/m61rsM0FS5sXcKY
 MulDG3qGb7yqm4QjQL1IclF9wlmk0qq6K21WZECSadj4T9+At9A3b9WI3xGtqxPoex0mVFm96r0VmWZ3Cklcywes4XjRtiIBXh6P6WUOHcpIv9myVTn4RDD6
 TJjNtnjee889SrD8mk+pU9aGcveY9Q6Gw+8Wgg3nYG/lRyY5xbwerja73ZbqluJYiKVjxphAotRa6rJ98Ty0DDBwVqHR5mgwGCA0eirXsyPV4VUposrtPWwt
 a6b1sPQ8Ni2qBgvsISv841FJ/KPdU8GNkWtG8xHKlzPLBfsWO6Ua1yYDMr8BSKAg6GlXgSPE4Gh6hdMuXY8YTgbtLLB+Yaus18nty6F/1mj9W03PXNnrYUjK
 eKoraHwp2zh/3nzT550svrYHGAUrG9wYAuGfbg7G/a95VNb3i2gW57OI9t4J4LUVM2SiwHQaL3FuG7xHRpE+VXggfNprsdC6ivAMPBzL85Rq/VfNIXVT6+Xy
 PlELknQsw4GrtAWOfGA2nDY6ix8oVkNmriT/pxXIfYlUbA==
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61f1b16d
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=DghFqjY3_ZEA:10 a=FBHGMhGWAAAA:8 a=8jVkOq4aYRBOpPyIG1UA:9 a=CjuIK1q_8ugA:10
 a=MEoStP4QSrq0QcJlXZsA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61E5E7EC00C90E23; Wed, 26 Jan 2022 15:39:09 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id BAEB6220116; Wed, 26 Jan 2022 20:39:05 +0000 (UTC)
Date:   Wed, 26 Jan 2022 20:39:05 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Fix data TLB miss in sba_unmap_sg
Message-ID: <YfGxafKxQdw8GhMc@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RywJwN26T4POf5Et"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--RywJwN26T4POf5Et
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rolf Eike Beer reported the following bug:

[1274934.746891] Bad Address (null pointer deref?): Code=3D15 (Data TLB mis=
s fault) at addr 0000004140000018
[1274934.746891] CPU: 3 PID: 5549 Comm: cmake Not tainted 5.15.4-gentoo-par=
isc64 #4
[1274934.746891] Hardware name: 9000/785/C8000
[1274934.746891]
[1274934.746891]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[1274934.746891] PSW: 00001000000001001111111000001110 Not tainted
[1274934.746891] r00-03  000000ff0804fe0e 0000000040bc9bc0 00000000406760e4=
 0000004140000000
[1274934.746891] r04-07  0000000040b693c0 0000004140000000 000000004a2b08b0=
 0000000000000001
[1274934.746891] r08-11  0000000041f98810 0000000000000000 000000004a0a7000=
 0000000000000001
[1274934.746891] r12-15  0000000040bddbc0 0000000040c0cbc0 0000000040bddbc0=
 0000000040bddbc0
[1274934.746891] r16-19  0000000040bde3c0 0000000040bddbc0 0000000040bde3c0=
 0000000000000007
[1274934.746891] r20-23  0000000000000006 000000004a368950 0000000000000000=
 0000000000000001
[1274934.746891] r24-27  0000000000001fff 000000000800000e 000000004a1710f0=
 0000000040b693c0
[1274934.746891] r28-31  0000000000000001 0000000041f988b0 0000000041f98840=
 000000004a171118
[1274934.746891] sr00-03  00000000066e5800 0000000000000000 000000000000000=
0 00000000066e5800
[1274934.746891] sr04-07  0000000000000000 0000000000000000 000000000000000=
0 0000000000000000
[1274934.746891]
[1274934.746891] IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004067=
60e8 00000000406760ec
[1274934.746891]  IIR: 48780030    ISR: 0000000000000000  IOR: 000000414000=
0018
[1274934.746891]  CPU:        3   CR30: 00000040e3a9c000 CR31: ffffffffffff=
ffff
[1274934.746891]  ORIG_R28: 0000000040acdd58
[1274934.746891]  IAOQ[0]: sba_unmap_sg+0xb0/0x118
[1274934.746891]  IAOQ[1]: sba_unmap_sg+0xb4/0x118
[1274934.746891]  RP(r2): sba_unmap_sg+0xac/0x118
[1274934.746891] Backtrace:
[1274934.746891]  [<00000000402740cc>] dma_unmap_sg_attrs+0x6c/0x70
[1274934.746891]  [<000000004074d6bc>] scsi_dma_unmap+0x54/0x60
[1274934.746891]  [<00000000407a3488>] mptscsih_io_done+0x150/0xd70
[1274934.746891]  [<0000000040798600>] mpt_interrupt+0x168/0xa68
[1274934.746891]  [<0000000040255a48>] __handle_irq_event_percpu+0xc8/0x278
[1274934.746891]  [<0000000040255c34>] handle_irq_event_percpu+0x3c/0xd8
[1274934.746891]  [<000000004025ecb4>] handle_percpu_irq+0xb4/0xf0
[1274934.746891]  [<00000000402548e0>] generic_handle_irq+0x50/0x70
[1274934.746891]  [<000000004019a254>] call_on_stack+0x18/0x24
[1274934.746891]
[1274934.746891] Kernel panic - not syncing: Bad Address (null pointer dere=
f?)

The bug is caused by overrunning the sglist and incorrectly testing
sg_dma_len(sglist) before nents. Normally this doesn't cause a crash,
but in this case sglist crossed a page boundary. This occurs in the
following code:

	while (sg_dma_len(sglist) && nents--) {

The fix is simply to test nents first and move the decrement of nents
into the loop.

Reported-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index e60690d38d67..374b9199878d 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -1047,7 +1047,7 @@ sba_unmap_sg(struct device *dev, struct scatterlist *=
sglist, int nents,
 	spin_unlock_irqrestore(&ioc->res_lock, flags);
 #endif
=20
-	while (sg_dma_len(sglist) && nents--) {
+	while (nents && sg_dma_len(sglist)) {
=20
 		sba_unmap_page(dev, sg_dma_address(sglist), sg_dma_len(sglist),
 				direction, 0);
@@ -1056,6 +1056,7 @@ sba_unmap_sg(struct device *dev, struct scatterlist *=
sglist, int nents,
 		ioc->usingle_calls--;	/* kluge since call is unmap_sg() */
 #endif
 		++sglist;
+		nents--;
 	}
=20
 	DBG_RUN_SG("%s() DONE (nents %d)\n", __func__,  nents);

--RywJwN26T4POf5Et
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmHxsWAACgkQXb/Nrl8Z
TfH49A/9Hnk5WGA54KEO/rPbShz7+TfJAP2YsZBY8e2c5PpUthSkbm4Qnzqrrpil
AB508aYwUgFTVKvXZDqxo6VIBlFF6PnmlXuI59X+C3/a4DMLnbrmeCXvCUv1rXg+
tV2VRgxg/+6Ypz6OHvFtplTBVZABowWyYC/twKmOXgb0YdwrloPDpwildcdgVeE0
UtDbXj+C1Iz4XRPwoJP6WORG7gQgZdlIfOcEAN+IR4HlAx5sP9vqDmRfHxWSJUvr
/eChsOdmcNsHoSUtXig6Ul+thkGUPl5FcIvVW9RN0YKfaqJVOtJMppvNF5oO1ERS
0ehmlnUinx+o59O9M4mjsmkBqeXx84As+mFTxtOWFh/+v/rux6wPHtxScpWyOK8p
UjZoE2YO2h1twq+POOnAUzKUal1wQ13vq2Lvo3Bxtez35wvb9YIBhko8S5h0PoOd
Gd+dQALN48l6Ms1Oq9/7b70Qe+R6h+pXdZNiJRZ7106lA1/GwwJ2BTPH6J6qBkmE
HCqiy6M1AImFn/FvoRvWqQfl079A+B7auiuT449K1LfxNxU7jRWIOIiPKYb/0KA6
16Px6MjgrvESVXyBpOKzVaAU3TgZWWtUq7CJoBGpB8tmGDoh06TCA/YveuQ0xjs2
5rsIXaXpLRbuBt6CuGX/Cg1vFD0QXQs9mq0YW1/VPd2GT97skmc=
=xTw5
-----END PGP SIGNATURE-----

--RywJwN26T4POf5Et--

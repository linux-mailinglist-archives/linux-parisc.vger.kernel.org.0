Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD29E3F52E9
	for <lists+linux-parisc@lfdr.de>; Mon, 23 Aug 2021 23:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbhHWVi7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 23 Aug 2021 17:38:59 -0400
Received: from out07.smtpout.orange.fr ([193.252.22.91]:31343 "EHLO
        out.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232797AbhHWVi6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 23 Aug 2021 17:38:58 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d73 with ME
        id l9Wh250043riaq2039WhxJ; Mon, 23 Aug 2021 23:30:43 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 23 Aug 2021 23:30:43 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     James.Bottomley@HansenPartnership.com, deller@gmx.de,
        sudipm.mukherjee@gmail.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc:     linux-parisc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] parisc/parport_gsc: switch from 'pci_' to 'dma_' API
Date:   Mon, 23 Aug 2021 23:30:39 +0200
Message-Id: <93b21629db55629ec3d384e8184c4a9dd0270c11.1629754126.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below.

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If needed, see post from Christoph Hellwig on the kernel-janitors ML:
   https://marc.info/?l=kernel-janitors&m=158745678307186&w=4

This has *NOT* been compile tested because I don't have the needed
configuration.
ssdfs
---
 drivers/parport/parport_gsc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index 1e43b3f399a8..db912fa6b6df 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -390,9 +390,8 @@ static int __exit parport_remove_chip(struct parisc_device *dev)
 		if (p->irq != PARPORT_IRQ_NONE)
 			free_irq(p->irq, p);
 		if (priv->dma_buf)
-			pci_free_consistent(priv->dev, PAGE_SIZE,
-					    priv->dma_buf,
-					    priv->dma_handle);
+			dma_free_coherent(&priv->dev->dev, PAGE_SIZE,
+					  priv->dma_buf, priv->dma_handle);
 		kfree (p->private_data);
 		parport_put_port(p);
 		kfree (ops); /* hope no-one cached it */
-- 
2.30.2


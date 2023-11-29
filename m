Return-Path: <linux-parisc+bounces-96-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B97FDB55
	for <lists+linux-parisc@lfdr.de>; Wed, 29 Nov 2023 16:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E7821C20818
	for <lists+linux-parisc@lfdr.de>; Wed, 29 Nov 2023 15:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A1C34541;
	Wed, 29 Nov 2023 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KSMNxT4G"
X-Original-To: linux-parisc@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id E5EC026A4;
	Wed, 29 Nov 2023 07:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=UPZvZWVao0sExJphY6
	iK/2uDTmwrQQRv+cgzaIF0dp0=; b=KSMNxT4GPPRCEOpgve90N0x7jjZoVu2qry
	2BhIkk3wUy3OKVvpgFMX9h68DRlGIbjTMsKndt0x5I8Mwys54dLhi9C7EVzYQRXr
	k2TVDarBI+IxfdN0xD9eb+EiIYPgYB2g0WeF/zn32lna0q7+m2Mnspc0QU1ETvIr
	Hoyhc3kc0=
Received: from localhost.localdomain (unknown [39.144.190.126])
	by zwqz-smtp-mta-g1-0 (Coremail) with SMTP id _____wD3v+H7V2dlgmDOBQ--.15191S2;
	Wed, 29 Nov 2023 23:25:48 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: James.Bottomley@HansenPartnership.com
Cc: deller@gmx.de,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] [parisc] superio: Add error handling for request_region in superio_init
Date: Wed, 29 Nov 2023 07:25:46 -0800
Message-Id: <20231129152546.34962-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3v+H7V2dlgmDOBQ--.15191S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1xWr47GFy3tr15GFWUtwb_yoW8Zry5pa
	y3Cws5ArW8Zw1xZ34kXa93XFnY9anayFyUG3ZrK34fZF4rGrWjyr4rt3WYvFy5u3y7Jw13
	ZFn8GryfCF1jva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ptg4zPUUUUU=
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiwhw3glc661-fYAAAsN
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

This patch introduces error handling for the request_region call in the
superio_init function within drivers/parisc/superio.c. Prior to this patch,
the function did not handle the scenario where request_region might fail,
potentially leading to resource conflicts.

Although the error addressed by this patch may not occur in the current
environment, I still suggest implementing these error handling routines
if the function is not highly time-sensitive. As the environment evolves
or the code gets reused in different contexts, there's a possibility that
these errors might occur. Addressing them now can prevent potential
debugging efforts in the future, which could be quite resource-intensive.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/parisc/superio.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index e973c6893203..36c01e70671d 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -187,9 +187,23 @@ superio_init(struct pci_dev *pcidev)
 	sio->acpi_base &= ~1;
 	printk(KERN_INFO PFX "ACPI at 0x%x\n", sio->acpi_base);
 
-	request_region (IC_PIC1, 0x1f, "pic1");
-	request_region (IC_PIC2, 0x1f, "pic2");
-	request_region (sio->acpi_base, 0x1f, "acpi");
+	if (!request_region(IC_PIC1, 0x1f, "pic1")) {
+		printk(KERN_ERR PFX "request_region failed for pic1\n");
+		return;
+	}
+
+	if (!request_region(IC_PIC2, 0x1f, "pic2")) {
+		printk(KERN_ERR PFX "request_region failed for pic2\n");
+		release_region(IC_PIC1, 0x1f);
+		return;
+	}
+
+	if (!request_region(sio->acpi_base, 0x1f, "acpi")) {
+		printk(KERN_ERR PFX "request_region failed for acpi\n");
+		release_region(IC_PIC1, 0x1f);
+		release_region(IC_PIC2, 0x1f);
+		return;
+	}
 
 	/* Enable the legacy I/O function */
 	pci_read_config_word (pdev, PCI_COMMAND, &word);
-- 
2.17.1



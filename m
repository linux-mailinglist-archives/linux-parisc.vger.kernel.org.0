Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21EFC782D59
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Aug 2023 17:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235487AbjHUPeU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 21 Aug 2023 11:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236402AbjHUPeU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Aug 2023 11:34:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6023102
        for <linux-parisc@vger.kernel.org>; Mon, 21 Aug 2023 08:34:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4C5AE63BFB
        for <linux-parisc@vger.kernel.org>; Mon, 21 Aug 2023 15:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04458C433C8;
        Mon, 21 Aug 2023 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692632056;
        bh=paDPbBcYLNwi1T/Agurv7+nBjGB2WmlZKdZW4wbfJIg=;
        h=From:To:Cc:Subject:Date:From;
        b=Lww4LDbSbhIu3Fcv2FiTJF72bjDG3wnaJ1Qnj3iWuyFKySFIubgRGaV0aE0hbi7RM
         Y1kyVWLQVTRphPvZ+ymy9KWBwEWgLR6Cj9HKQmacaCf++pAoDrxJs/lt11y9y6tiTk
         smG7lclUC4IyAty9RQ5VGDxFaLm0gHAJG13SjvRsYaF1khQMmXkjlB0qZXDGh/xN9u
         /c1hc4q8Myq0fAteI8uL1gUrgV3io/q+tKmwNALfQL6pMJrUdOt7NUwfg8dwJGdYQk
         xWWLz1Jn3gTD15L95nYKAd5Mto+70qRy9+oY2UghCmUhBreDBMbUvXOxUMJ+Or35KA
         Fj6Om2EVcu9tw==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Avoid ioremap() for same addresss in iosapic_register()
Date:   Mon, 21 Aug 2023 17:33:58 +0200
Message-ID: <20230821153358.55791-1-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Helge Deller <deller@gmx.de>

The LBA has already called ioremap() to get it's virtual address,
which can be used for the IOSAPIC as well.
Avoid calling ioremap() again and just reuse the correct
iomem address for the IOSAPIC.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/ropes.h | 2 +-
 drivers/parisc/iosapic.c        | 4 ++--
 drivers/parisc/lba_pci.c        | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/include/asm/ropes.h b/arch/parisc/include/asm/ropes.h
index 8e51c775c80a..fd96706c7234 100644
--- a/arch/parisc/include/asm/ropes.h
+++ b/arch/parisc/include/asm/ropes.h
@@ -252,7 +252,7 @@ static inline int agp_mode_mercury(void __iomem *hpa) {
 ** fixup_irq is to initialize PCI IRQ line support and
 ** virtualize pcidev->irq value. To be called by pci_fixup_bus().
 */
-extern void *iosapic_register(unsigned long hpa);
+extern void *iosapic_register(unsigned long hpa, void __iomem *vaddr);
 extern int iosapic_fixup_irq(void *obj, struct pci_dev *pcidev);
 
 #define LBA_FUNC_ID	0x0000	/* function id */
diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index bcc1dae00780..27478e9f4e84 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -890,7 +890,7 @@ iosapic_rd_version(struct iosapic_info *isi)
 **	o allocate and initialize isi_vector[]
 **	o allocate irq region
 */
-void *iosapic_register(unsigned long hpa)
+void *iosapic_register(unsigned long hpa, void __iomem *vaddr)
 {
 	struct iosapic_info *isi = NULL;
 	struct irt_entry *irte = irt_cell;
@@ -919,7 +919,7 @@ void *iosapic_register(unsigned long hpa)
 		return NULL;
 	}
 
-	isi->addr = ioremap(hpa, 4096);
+	isi->addr = vaddr;
 	isi->isi_hpa = hpa;
 	isi->isi_version = iosapic_rd_version(isi);
 	isi->isi_num_vectors = IOSAPIC_IRDT_MAX_ENTRY(isi->isi_version) + 1;
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 702bfd64e6e1..9e22b117fb3a 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1535,7 +1535,8 @@ lba_driver_probe(struct parisc_device *dev)
 	}
 
 	/* Tell I/O SAPIC driver we have a IRQ handler/region. */
-	tmp_obj = iosapic_register(dev->hpa.start + LBA_IOSAPIC_BASE);
+	tmp_obj = iosapic_register(dev->hpa.start + LBA_IOSAPIC_BASE,
+						addr + LBA_IOSAPIC_BASE);
 
 	/* NOTE: PCI devices (e.g. 103c:1005 graphics card) which don't
 	**	have an IRT entry will get NULL back from iosapic code.
-- 
2.41.0


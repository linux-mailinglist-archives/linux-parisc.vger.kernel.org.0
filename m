Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D384D241E09
	for <lists+linux-parisc@lfdr.de>; Tue, 11 Aug 2020 18:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbgHKQTa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 11 Aug 2020 12:19:30 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:56370 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728797AbgHKQT3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 11 Aug 2020 12:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ePGcjyXMqlG+HlALytqtbIej462UcIp2F+vaMfDx26U=; b=BDZF80e26kDFwoPyKCzKVYywUK
        sUYSa1WI3DT5eI1L0b+Nz4vppsPh+R6aJvKVQgl0doP69fRbuEFwx8SsyJgSS5JupzZC7mFNnGoJl
        4idTuc83RysRaLXJNwnRVUVj5sTLYXLgbRlk4qGmFv2q2K7tyBStpzCH7HO0o9zgu9UY=;
Received: from hsi-kbw-091-089-248-125.hsi2.kabel-badenwuerttemberg.de ([91.89.248.125] helo=x280.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.90_1)
        (envelope-from <svens@stackframe.org>)
        id 1k5Wzn-00047o-CE; Tue, 11 Aug 2020 18:19:27 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: mask out enable and reserved bits from sba imask
Date:   Tue, 11 Aug 2020 18:19:19 +0200
Message-Id: <20200811161919.27657-1-svens@stackframe.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When using kexec the SBA IOMMU IBASE might still have the RE
bit set. This triggers a WARN_ON when trying to write back the
IBASE register later, and it also makes some mask calculations fail.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 drivers/parisc/sba_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 5368452eb5a6..d4314fba0269 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -1270,7 +1270,7 @@ sba_ioc_init_pluto(struct parisc_device *sba, struct ioc *ioc, int ioc_num)
 	** (one that doesn't overlap memory or LMMIO space) in the
 	** IBASE and IMASK registers.
 	*/
-	ioc->ibase = READ_REG(ioc->ioc_hpa + IOC_IBASE);
+	ioc->ibase = READ_REG(ioc->ioc_hpa + IOC_IBASE) & ~0x1fffffULL;
 	iova_space_size = ~(READ_REG(ioc->ioc_hpa + IOC_IMASK) & 0xFFFFFFFFUL) + 1;
 
 	if ((ioc->ibase < 0xfed00000UL) && ((ioc->ibase + iova_space_size) > 0xfee00000UL)) {
-- 
2.27.0


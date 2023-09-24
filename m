Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187677AC923
	for <lists+linux-parisc@lfdr.de>; Sun, 24 Sep 2023 15:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbjIXNZf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 24 Sep 2023 09:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbjIXNYp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 24 Sep 2023 09:24:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EF659ED;
        Sun, 24 Sep 2023 06:20:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361BFC433C7;
        Sun, 24 Sep 2023 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695561654;
        bh=9KF0fi7Qe4SXj5sAMqCnS3R32AdSZNyzqrHcEAZ2XVo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YEHjQfyqc1DDVQmOso3BhwXhmlvwFwccowvI9ivmyC6JuU/npT9q0YTUP6Gj6lU6d
         Y74EJojnLaLdiS73b3LYEoP/1hyUtRuCuBeZGEfq6UmGslvJ4lumJWVTMfTJBiQuC3
         QhWezAusV0Gj/amxzXtp5k5SN9mMCCLVxp+1u25+sm6Zcb9cGhz2D3hFLzDI1HUugH
         pNi4SNJ2CwCowemkPeX3MGsT04uERXjHizd4hCEY9t+7eJvgeAGAEUne8B3MdYC0fO
         VecVGACfV1lGyKH+QFUGdjWStRyIBNqOEnvvsNmj/IDhRubDXoXytpjKjqyZNessqm
         C+vVvqITg9K5g==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Sasha Levin <sashal@kernel.org>,
        James.Bottomley@HansenPartnership.com, linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 2/6] parisc: iosapic.c: Fix sparse warnings
Date:   Sun, 24 Sep 2023 09:20:45 -0400
Message-Id: <20230924132050.1277021-2-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924132050.1277021-1-sashal@kernel.org>
References: <20230924132050.1277021-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.326
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Helge Deller <deller@gmx.de>

[ Upstream commit 927c6c8aa27c284a799b8c18784e37d3373af908 ]

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/parisc/iosapic.c         | 4 ++--
 drivers/parisc/iosapic_private.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index eb9137faccf74..4cc08d13b82fa 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -216,9 +216,9 @@ static inline void iosapic_write(void __iomem *iosapic, unsigned int reg, u32 va
 
 static DEFINE_SPINLOCK(iosapic_lock);
 
-static inline void iosapic_eoi(void __iomem *addr, unsigned int data)
+static inline void iosapic_eoi(__le32 __iomem *addr, __le32 data)
 {
-	__raw_writel(data, addr);
+	__raw_writel((__force u32)data, addr);
 }
 
 /*
diff --git a/drivers/parisc/iosapic_private.h b/drivers/parisc/iosapic_private.h
index 6e05e30a2450a..7a928c03d5201 100644
--- a/drivers/parisc/iosapic_private.h
+++ b/drivers/parisc/iosapic_private.h
@@ -132,8 +132,8 @@ struct iosapic_irt {
 struct vector_info {
 	struct iosapic_info *iosapic;	/* I/O SAPIC this vector is on */
 	struct irt_entry *irte;		/* IRT entry */
-	u32 __iomem *eoi_addr;		/* precalculate EOI reg address */
-	u32	eoi_data;		/* IA64: ?       PA: swapped txn_data */
+	__le32 __iomem *eoi_addr;	/* precalculate EOI reg address */
+	__le32	eoi_data;		/* IA64: ?       PA: swapped txn_data */
 	int	txn_irq;		/* virtual IRQ number for processor */
 	ulong	txn_addr;		/* IA64: id_eid  PA: partial HPA */
 	u32	txn_data;		/* CPU interrupt bit */
-- 
2.40.1


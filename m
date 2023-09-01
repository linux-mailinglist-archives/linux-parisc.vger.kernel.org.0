Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5645A78F856
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Sep 2023 08:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234233AbjIAGEp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 1 Sep 2023 02:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348341AbjIAGEp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 1 Sep 2023 02:04:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526A510CE
        for <linux-parisc@vger.kernel.org>; Thu, 31 Aug 2023 23:04:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D76A261C61
        for <linux-parisc@vger.kernel.org>; Fri,  1 Sep 2023 06:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B7DC433C7;
        Fri,  1 Sep 2023 06:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693548281;
        bh=dhqjQZOfZuCwV4bxHzmp7Ql2/m3cU1koqyCdIayfpQI=;
        h=From:To:Cc:Subject:Date:From;
        b=dWTlzjN5AGOuDoIQtW1xSemQ4uxltsrJsHNvdmqIxTfHrMDsSS1wzgry2XVqVMW1h
         Ho/XwK4EudvMjNjUZSbxqFtyD3PUDykF8+aQxfx1I9qMTC+lDPLT7ih+L0R7xZAr08
         /6BDufYX7M6qBs8j8HZeXZCPneZcN2DzXVzgLz6i8eq9Val1Y5qTZ4NoPOKF9XufXa
         Ya6QL7WcbuYhWoyN5D/k1Kp/hPQTpR4T6mMsXC+En3XFO74cmLVVJSORSbugRmkgga
         nI0cdISVazSc9RzdJUJbmCT5ULT8p/Jl+jk1CXa5kbG8go89TitsfmysRfLcpixVJY
         rNoEpBJgSo55g==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: shmparam.h: Document aliasing requirements of PA-RISC
Date:   Fri,  1 Sep 2023 08:04:31 +0200
Message-ID: <20230901060431.6170-1-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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

Add some documentation why PA-RISC uses SHMLBA and SHM_COLOUR.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/shmparam.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/parisc/include/asm/shmparam.h b/arch/parisc/include/asm/shmparam.h
index 74f74e4d35b7..5a95b0f62b87 100644
--- a/arch/parisc/include/asm/shmparam.h
+++ b/arch/parisc/include/asm/shmparam.h
@@ -2,6 +2,21 @@
 #ifndef _ASMPARISC_SHMPARAM_H
 #define _ASMPARISC_SHMPARAM_H
 
+/*
+ * PA-RISC uses virtually indexed & physically tagged (VIPT) caches
+ * which has strict requirements when two pages to the same physical
+ * address are accessed through different mappings. Read the section
+ * "Address Aliasing" in the arch docs for more detail:
+ * PA-RISC 1.1 (page 3-6):
+ * https://parisc.wiki.kernel.org/images-parisc/6/68/Pa11_acd.pdf
+ * PA-RISC 2.0 (page F-5):
+ * https://parisc.wiki.kernel.org/images-parisc/7/73/Parisc2.0.pdf
+ *
+ * For Linux we allow kernel and userspace to map pages on page size
+ * granularity (SHMLBA) but have to ensure that, if two pages are
+ * mapped to the same physical address, the virtual and physical
+ * addresses modulo SHM_COLOUR are identical.
+ */
 #define SHMLBA	   PAGE_SIZE	/* attach addr a multiple of this */
 #define SHM_COLOUR 0x00400000	/* shared mappings colouring */
 
-- 
2.41.0


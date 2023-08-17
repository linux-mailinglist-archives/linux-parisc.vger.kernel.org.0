Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B7F78001B
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Aug 2023 23:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355408AbjHQVpd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Aug 2023 17:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355427AbjHQVpO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Aug 2023 17:45:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0398D1FC3
        for <linux-parisc@vger.kernel.org>; Thu, 17 Aug 2023 14:45:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8D02D6540B
        for <linux-parisc@vger.kernel.org>; Thu, 17 Aug 2023 21:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A085C433C8;
        Thu, 17 Aug 2023 21:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692308712;
        bh=Ycne5p+Zb5M0VpTwmM0yB9wizBb2ZvWSNDhzmSi8z/w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tZS1OLAiK7wL6vIKC+mcmzNWqo3k1tVQfsxMighUh56g6rY4/WiZ6RXufF/iyalbR
         Nwpb4KpBfEzas+RcbyUOGGt4fY+nWYiQPyVryRfhvvHO5KhHywYd0K4lg78iGbphpp
         p8lDm98+Pr/fk5Muzn5YQdVZcA1mLLM92jcKsU3SXYjSOJDrOnmXhGimukZXj1djdm
         ZND4GFAYv8MJ70RPtc7VmU0Bnp2r+0F3jSYUj0JD9QoZdmxzLvSahs2CgAVu+ZZOwH
         0Z3wD23SMQTjetMFBmLl7UeWDujFizbccMn+DrE3Ggfr+Biyme01C09mPw5wbdTxA3
         NyZP2WDkSZBag==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH 4/5] parisc: Fix comment on Elf64 Function descriptor
Date:   Thu, 17 Aug 2023 23:45:01 +0200
Message-ID: <20230817214503.108660-5-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817214503.108660-1-deller@kernel.org>
References: <20230817214503.108660-1-deller@kernel.org>
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

The format of the Elf64 Function descriptor is defined by the ABI.
Mention the various use cases in the comment.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/elf.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/elf.h b/arch/parisc/include/asm/elf.h
index cc426d365892..140eaa97bf21 100644
--- a/arch/parisc/include/asm/elf.h
+++ b/arch/parisc/include/asm/elf.h
@@ -163,8 +163,7 @@ typedef struct elf32_fdesc {
 
 /* Format for the Elf64 Function descriptor */
 typedef struct elf64_fdesc {
-	__u64	dummy[2]; /* FIXME: nothing uses these, why waste
-			   * the space */
+	__u64	dummy[2]; /* used by 64-bit eBPF and tracing functions */
 	__u64	addr;
 	__u64	gp;
 } Elf64_Fdesc;
-- 
2.41.0


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD0F42E22E
	for <lists+linux-parisc@lfdr.de>; Thu, 14 Oct 2021 21:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbhJNTva (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 14 Oct 2021 15:51:30 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:52112 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbhJNTv3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 14 Oct 2021 15:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Z/UXtRTZ3htH/Rs4948+fdY1CufZPACIm+u6vgh0HDc=; b=E2vRbZykkd+G8C1YuLgEXm34ON
        IgulBeQpZeynX3LzGQDBlEeveyXicLRVkidQvFCGgdHNUy2/vvTrmS8roWBU2dbIJsIPTDed2/Gsv
        0hZ31yuUixuvL/P6QuWV0/egj3xjBm+ntp8psTZN+0jp1WHOurB31FcYFKiENpAxtFfY=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mb6jC-0006Sn-0u; Thu, 14 Oct 2021 21:49:22 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v3 2/4] parisc: add PIM TOC data structures
Date:   Thu, 14 Oct 2021 21:49:14 +0200
Message-Id: <20211014194916.13901-3-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014194916.13901-1-svens@stackframe.org>
References: <20211014194916.13901-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

These data structures describe the TOC data we get from firmware
when issuing a PDC_PIM_TOC request.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/uapi/asm/pdc.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi/asm/pdc.h
index 15211723ebf5..ad51df8ba952 100644
--- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -689,6 +689,28 @@ struct pdc_hpmc_pim_20 { /* PDC_PIM */
 	unsigned long long fr[32];
 };
 
+struct pdc_toc_pim_11 {
+	unsigned int gr[32];
+	unsigned int cr[32];
+	unsigned int sr[8];
+	unsigned int iasq_back;
+	unsigned int iaoq_back;
+	unsigned int check_type;
+	unsigned int hversion;
+	unsigned int cpu_state;
+};
+
+struct pdc_toc_pim_20 {
+	unsigned long long gr[32];
+	unsigned long long cr[32];
+	unsigned long long sr[8];
+	unsigned long long iasq_back;
+	unsigned long long iaoq_back;
+	unsigned int check_type;
+	unsigned int hversion;
+	unsigned int cpu_state;
+};
+
 #endif /* !defined(__ASSEMBLY__) */
 
 #endif /* _UAPI_PARISC_PDC_H */
-- 
2.33.0


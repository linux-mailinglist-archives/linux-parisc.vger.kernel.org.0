Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87044282F5
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Oct 2021 20:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbhJJSkU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 10 Oct 2021 14:40:20 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:55038 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbhJJSkT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 10 Oct 2021 14:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cghcDNqh+OBdFVkBqeznLeGMAmxNwho3s8sgLzWKEIo=; b=m4jrNZefBR9R8L6ClMTkbsk6Yy
        HiAKxlYi2jszaw7i7KsHRqhqxZTCeMh7crHiPCsDe04iVXI/buRwIahnX02w6W0xV+1BlAIXLW7fW
        RF8xWf5Newz236jO4jDX9FUc1+33CojWx3trDo+RBpaM+c8WS4OBq09Ij1yJSyIU/ZPs=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZdiF-000661-7M; Sun, 10 Oct 2021 20:38:19 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH 1/2] parisc/firmware: add functions to retrieve TOC data
Date:   Sun, 10 Oct 2021 20:38:14 +0200
Message-Id: <20211010183815.5780-2-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211010183815.5780-1-svens@stackframe.org>
References: <20211010183815.5780-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add functions to retrieve TOC data from firmware both
for 1.1 and 2.0 PDC.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/pdc.h      |  2 ++
 arch/parisc/include/uapi/asm/pdc.h | 22 ++++++++++++++++++++
 arch/parisc/kernel/firmware.c      | 32 ++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index b388d8176588..18b957a8630d 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -51,6 +51,8 @@ int pdc_spaceid_bits(unsigned long *space_bits);
 int pdc_btlb_info(struct pdc_btlb_info *btlb);
 int pdc_mem_map_hpa(struct pdc_memory_map *r_addr, struct pdc_module_path *mod_path);
 #endif /* !CONFIG_PA20 */
+int pdc_pim_toc11(struct pdc_toc_pim_11 *ret);
+int pdc_pim_toc20(struct pdc_toc_pim_20 *ret);
 int pdc_lan_station_id(char *lan_addr, unsigned long net_hpa);
 
 int pdc_stable_read(unsigned long staddr, void *memaddr, unsigned long count);
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
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 7034227dbdf3..9179b4409b63 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1061,6 +1061,38 @@ int pdc_mem_pdt_read_entries(struct pdc_mem_read_pdt *pret,
 	return retval;
 }
 
+/**
+ * pdc_pim_toc11 - Fetch TOC PIM 1.1 data from firmware.
+ * @ret: pointer to return buffer
+ */
+int pdc_pim_toc11(struct pdc_toc_pim_11 *ret)
+{
+	int retval;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_PIM, PDC_PIM_TOC, __pa(pdc_result),
+			      __pa(ret), sizeof(struct pdc_toc_pim_11));
+	spin_unlock_irqrestore(&pdc_lock, flags);
+	return retval;
+}
+
+/**
+ * pdc_pim_toc20 - Fetch TOC PIM 2.0 data from firmware.
+ * @ret: pointer to return buffer
+ */
+int pdc_pim_toc20(struct pdc_toc_pim_20 *ret)
+{
+	int retval;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_PIM, PDC_PIM_TOC, __pa(pdc_result),
+			      __pa(ret), sizeof(struct pdc_toc_pim_20));
+	spin_unlock_irqrestore(&pdc_lock, flags);
+	return retval;
+}
+
 /**
  * pdc_tod_set - Set the Time-Of-Day clock.
  * @sec: The number of seconds since epoch.
-- 
2.33.0


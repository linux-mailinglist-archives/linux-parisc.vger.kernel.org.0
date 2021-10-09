Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1FE427DBA
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Oct 2021 23:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhJIVlE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Oct 2021 17:41:04 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:54508 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhJIVlD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Oct 2021 17:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cghcDNqh+OBdFVkBqeznLeGMAmxNwho3s8sgLzWKEIo=; b=DnM68hBY9MhsR9OYwpstsKRSws
        RyxcFzdS+Gp3Dw7/y+SpiPNuHETIWybh4pfQ3FSWEImgirnfHNgyD1qFICSflQDiOpLza0KO1tYtA
        +QkdKlhe7nH6XyC9nr+KjNc3O7JbcnMF2g0NrEbDmyAccqSm+u1RLxZvsei3HjAsnlLg=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZK3b-0003R2-Tf; Sat, 09 Oct 2021 23:39:04 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH 1/2] parisc/firmware: add functions to retrieve TOC data
Date:   Sat,  9 Oct 2021 23:38:55 +0200
Message-Id: <20211009213856.3326-2-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009213856.3326-1-svens@stackframe.org>
References: <20211009213856.3326-1-svens@stackframe.org>
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


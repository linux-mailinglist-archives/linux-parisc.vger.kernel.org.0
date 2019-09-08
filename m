Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCF5ACBCE
	for <lists+linux-parisc@lfdr.de>; Sun,  8 Sep 2019 11:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbfIHJdS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 8 Sep 2019 05:33:18 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:37785 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbfIHJdS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 8 Sep 2019 05:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=JgaHsqO265HFcXHpqfk7/sqmAzsS799mrqCuMa9d4TQ=; b=TmQ8hSNFBLoJO39li7LOY2PhC6
        F+RV92SSN3ei+son4MXV+MWL2M7JwK3OSvmizGsY1xZFZ0svBcdFRSKpGJkhTwEFm/NWPgIdTIFai
        iWhpd7wEfBe4RsuENfg0Okd7qOEqrzSTMJs0eSPMt8p6NGRouSHy5N+cwuwszHmtd65s=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de ([46.5.233.221] helo=x280.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1i6tZM-0005Ro-Qx; Sun, 08 Sep 2019 11:33:16 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 1/4] parisc: add __pdc_cpu_rendezvous()
Date:   Sun,  8 Sep 2019 11:33:03 +0200
Message-Id: <20190908093306.31455-2-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190908093306.31455-1-svens@stackframe.org>
References: <20190908093306.31455-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When stopping SMP cpus send them into rendezvous, so we can
start them again later (when kexec'ing a new kernel).

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/pdc.h |  1 +
 arch/parisc/kernel/firmware.c | 13 +++++++++++++
 arch/parisc/kernel/smp.c      |  1 +
 3 files changed, 15 insertions(+)

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index 19bb2e46cd36..b388d8176588 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -91,6 +91,7 @@ int pdc_sti_call(unsigned long func, unsigned long flags,
                  unsigned long inptr, unsigned long outputr,
                  unsigned long glob_cfg);
 
+int __pdc_cpu_rendezvous(void);
 static inline char * os_id_to_string(u16 os_id) {
 	switch(os_id) {
 	case OS_ID_NONE:	return "No OS";
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 58cc08e7fd12..1d976f2ebff0 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -311,6 +311,19 @@ int pdc_chassis_disp(unsigned long disp)
 	return retval;
 }
 
+/**
+ * pdc_cpu_rendenzvous - Stop currently executing CPU
+ * @retval: -1 on error, 0 on success
+ */
+int __pdc_cpu_rendezvous(void)
+{
+	if (is_pdc_pat())
+		return mem_pdc_call(PDC_PAT_CPU, PDC_PAT_CPU_RENDEZVOUS);
+	else
+		return mem_pdc_call(PDC_PROC, 1, 0);
+}
+
+
 /**
  * pdc_chassis_warn - Fetches chassis warnings
  * @retval: -1 on error, 0 on success
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index cbd074ba22da..e202c37e56af 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -109,6 +109,7 @@ halt_processor(void)
 	/* REVISIT : does PM *know* this CPU isn't available? */
 	set_cpu_online(smp_processor_id(), false);
 	local_irq_disable();
+	__pdc_cpu_rendezvous();
 	for (;;)
 		;
 }
-- 
2.23.0.rc1


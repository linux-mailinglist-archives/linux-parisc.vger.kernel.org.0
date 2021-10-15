Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB3242FCA0
	for <lists+linux-parisc@lfdr.de>; Fri, 15 Oct 2021 21:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242902AbhJOT6b (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 15 Oct 2021 15:58:31 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:36740 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242901AbhJOT60 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 15 Oct 2021 15:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vB43eDcNoSwMJQd2EdjJnuAb6at/EdtW4fboZt6BE1A=; b=Q/8zBMU9IOjTrziH9iHIyTJ3td
        Di4E3+cmIXNFF0NYNWFSJmMdys+RZj/IZk/sw4WDOXCB8z5MKCvV4+la7wvodVzPoMtiPCXeWYg2k
        AnPbKDMsj5TmhUA8RgCF/eUCvDNPrIYhiD4823bljlWBrFKbGDA3JmgxVeo7Fpce5xcg=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mbTJP-00039t-S8; Fri, 15 Oct 2021 21:56:16 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: don't enable irqs unconditionally in handle_interruption()
Date:   Fri, 15 Oct 2021 21:56:12 +0200
Message-Id: <20211015195612.25203-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

If the previous context had interrupts disabled, we should better
keep them disabled. This was noticed in the unwinding code where
a copy_from_kernel_nofault() triggered a page fault, and after
the fixup by the page fault handler interrupts where suddenly
enabled.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/traps.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 690e6abcaf22..3c5d968da415 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -480,9 +480,9 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 	int si_code;
 
 	if (code == 1)
-	    pdc_console_restart();  /* switch back to pdc if HPMC */
-	else
-	    local_irq_enable();
+		pdc_console_restart();  /* switch back to pdc if HPMC */
+	else if (!irqs_disabled_flags(regs->gr[0]))
+		local_irq_enable();
 
 	/* Security check:
 	 * If the priority level is still user, and the
-- 
2.33.0


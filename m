Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E31D1427CA8
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Oct 2021 20:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhJIS0t (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Oct 2021 14:26:49 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:45732 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbhJIS0t (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Oct 2021 14:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NRZLbVYtbqTzMEvUTRV/83DJyzg6trhIBb8yH3RTIx4=; b=sZ31D6XCX6ep1N6Xx27ZNH/D4b
        2Saj5vUrorDT8xxt+QjmQr333kAqmUOK8z1aLgfq/C1LL3MGzYiNHFxlNMuoXHiab7x+kLAHPk6wN
        kXA0ENI42LPJ6WfscQU/9xJ5Y8E4iGIOanJF+dCgEco7Yyo2+rmJjBQtDsVmad7BzXus=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZH1e-0001dj-B0; Sat, 09 Oct 2021 20:24:50 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v2 4/5] parisc: disable preemption in send_IPI_allbutself()
Date:   Sat,  9 Oct 2021 20:24:38 +0200
Message-Id: <20211009182439.30016-5-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009182439.30016-1-svens@stackframe.org>
References: <20211009182439.30016-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Otherwise we might not stop all other CPUs.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/smp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 1405b603b91b..3413e6949c87 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -219,11 +219,13 @@ static inline void
 send_IPI_allbutself(enum ipi_message_type op)
 {
 	int i;
-	
+
+	preempt_disable();
 	for_each_online_cpu(i) {
 		if (i != smp_processor_id())
 			send_IPI_single(i, op);
 	}
+	preempt_enable();
 }
 
 
-- 
2.33.0


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73B292BA7D
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 21:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbfE0TFJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 15:05:09 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:50332 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbfE0TFJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 15:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=5YGYDUkYdAUpfT0Xr+s3BY3YgmF/shWOzJW/ii8TAfo=; b=W/5JH2vvKo9RI+xvh9lgO3e0um
        //HY5RKn0bG1SfTQAM63s2z+YFF4KaS71RciHk+vPenvmHnGQMRcef6Zb2P5tu2jy0GaQSYL8opeV
        aeeoK1PWxtyEODcjEZxCJeC4EAsWsN7A209twhnKwRM4IYNCqfFlTGgJHCq6uFPOys4I=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hVKvj-0005jT-2M; Mon, 27 May 2019 21:05:07 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 3/6] parisc: add WARN_ON() to clear_fixmap
Date:   Mon, 27 May 2019 21:04:47 +0200
Message-Id: <20190527190450.14988-4-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527190450.14988-1-svens@stackframe.org>
References: <20190527190450.14988-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Calling clear_fixmap() on an already cleared fixed mapping is
a bad thing to do. Add a WARN_ON() to catch such issues.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/mm/fixmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
index c8d41b54fb19..36321bcd75ba 100644
--- a/arch/parisc/mm/fixmap.c
+++ b/arch/parisc/mm/fixmap.c
@@ -35,6 +35,9 @@ void clear_fixmap(enum fixed_addresses idx)
 	pmd_t *pmd = pmd_offset(pgd, vaddr);
 	pte_t *pte = pte_offset_kernel(pmd, vaddr);
 
+	if (WARN_ON(pte_none(*pte)))
+		return;
+
 	pte_clear(&init_mm, vaddr, pte);
 
 	flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE);
-- 
2.20.1


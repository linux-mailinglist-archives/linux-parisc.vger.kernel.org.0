Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958BE4156FC
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Sep 2021 05:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239258AbhIWDpX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 22 Sep 2021 23:45:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:42110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239172AbhIWDnf (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 22 Sep 2021 23:43:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D07661283;
        Thu, 23 Sep 2021 03:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632368444;
        bh=xv9DuXWs5WL1PmyNHaQZJwzBB+tS7goqT7N4UKTv3vE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uJxybAPvlpncNhMD1TMS/8Dbf4ofaRGB8+Bi/cnU2iAuUGV3zaAj54T0rHACgbVfK
         5eb4yZ2kLzKky+TWPTrY4p6Bnfr9JOeXCWafxJq3UJoTVBlVsyJRXlLWCAMgT1fJUh
         FbdwutAasuwdSftsh7p8SneRH+fTDkhFhu8GWLnKXn6DdJRft0gOVF7iuxGGEaEGYg
         volulsqJ76+mb6VfYUzsTdpDkNCprDR9QfCqL932lucZ2sUl8RmVG6rv8GM0xfL62D
         x3ID2bcaFipbrV7ErBiB7Rlbb9Vn0KnCoNxmNKn60dzCdQQ+lFJueIYVOkvaO5jTBw
         q6AWebeh8JUbw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Guenter Roeck <linux@roeck-us.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Sasha Levin <sashal@kernel.org>,
        James.Bottomley@HansenPartnership.com, dave.anglin@bell.net,
        linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 07/11] parisc: Use absolute_pointer() to define PAGE0
Date:   Wed, 22 Sep 2021 23:40:23 -0400
Message-Id: <20210923034028.1421876-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210923034028.1421876-1-sashal@kernel.org>
References: <20210923034028.1421876-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Helge Deller <deller@gmx.de>

[ Upstream commit 90cc7bed1ed19f869ae7221a6b41887fe762a6a3 ]

Use absolute_pointer() wrapper for PAGE0 to avoid this compiler warning:

  arch/parisc/kernel/setup.c: In function 'start_parisc':
  error: '__builtin_memcmp_eq' specified bound 8 exceeds source size 0

Signed-off-by: Helge Deller <deller@gmx.de>
Co-Developed-by: Guenter Roeck <linux@roeck-us.net>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/parisc/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index 80e742a1c162..088888fcf8df 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -174,7 +174,7 @@ extern int npmem_ranges;
 #include <asm-generic/getorder.h>
 #include <asm/pdc.h>
 
-#define PAGE0   ((struct zeropage *)__PAGE_OFFSET)
+#define PAGE0   ((struct zeropage *)absolute_pointer(__PAGE_OFFSET))
 
 /* DEFINITION OF THE ZERO-PAGE (PAG0) */
 /* based on work by Jason Eckhardt (jason@equator.com) */
-- 
2.30.2


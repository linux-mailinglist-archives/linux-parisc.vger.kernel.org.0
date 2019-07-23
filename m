Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 590DA720EA
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jul 2019 22:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388897AbfGWUiB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 Jul 2019 16:38:01 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:37614 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389153AbfGWUiB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 Jul 2019 16:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=uwLxBY80USIeRF3LpNlVU4E3cPhwRKycoN+c/b3BV08=; b=Jo/WCSKNwajkR7jVElbR9rbSl/
        V4Uv1iULCVwoh+WUMFrdDpzf4HBTmKsdZbv7850I7L+IoKLqXWDQQYs+iHWPevZaz63oihanIHH1D
        JJKXI+oYZbkoe5bBNcWDaqx4qOMtDJ+mpaEfe1qcVlQeLLBkddWdtvuGZTqr6hkTKZlI=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hq1Xq-0002i7-MS; Tue, 23 Jul 2019 22:37:58 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 3/4] parisc: Update feature list
Date:   Tue, 23 Jul 2019 22:37:53 +0200
Message-Id: <20190723203754.7126-4-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723203754.7126-1-svens@stackframe.org>
References: <20190723203754.7126-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add jump labels to the list of supported features.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 Documentation/features/core/jump-labels/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/core/jump-labels/arch-support.txt b/Documentation/features/core/jump-labels/arch-support.txt
index 7fc2e243dee9..cae7be2f7725 100644
--- a/Documentation/features/core/jump-labels/arch-support.txt
+++ b/Documentation/features/core/jump-labels/arch-support.txt
@@ -21,7 +21,7 @@
     |       nds32: | TODO |
     |       nios2: | TODO |
     |    openrisc: | TODO |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: |  ok  |
-- 
2.20.1


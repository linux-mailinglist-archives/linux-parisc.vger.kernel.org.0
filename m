Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976FF41E074
	for <lists+linux-parisc@lfdr.de>; Thu, 30 Sep 2021 20:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352949AbhI3SBr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 30 Sep 2021 14:01:47 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:44264 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352948AbhI3SBq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 30 Sep 2021 14:01:46 -0400
X-Greylist: delayed 2034 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 Sep 2021 14:01:46 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=eRakFi0RguLdNgG/jWLQErbrW3srOwzhtHjHK5GRrsE=; b=Az3bIdG0fZD75cDNWLcpXavMY1
        +VN+XBechNKH8y8tH5APJPSdCFRgea3AREU0OR6eiDwVTHeYHXIqhklS+9YWFG/k0LGwDlwGk9ukG
        aedIXo9cutjidwsP7/7Ic4abliUv2ygqdCal7cNGO743KHZ+/CHER1w5MfcOZAyt4dxU=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mVzot-0003hw-PU; Thu, 30 Sep 2021 19:26:08 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc/unwind: use copy_from_kernel_nofault()
Date:   Thu, 30 Sep 2021 19:26:03 +0200
Message-Id: <20210930172603.5763-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I have no idea why get_user() is used there, but we're unwinding the
kernel stack, so we should use copy_from_kernel_nofault().

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/unwind.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 87ae476d1c4f..889d5889203a 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -302,7 +302,8 @@ static void unwind_frame_regs(struct unwind_frame_info *info)
 				break;
 			}
 
-			if (get_user(tmp, (unsigned long *)(info->prev_sp - RP_OFFSET))) 
+			if (copy_from_kernel_nofault(&tmp,
+			    (void *)info->prev_sp - RP_OFFSET, sizeof(tmp)))
 				break;
 			info->prev_ip = tmp;
 			sp = info->prev_sp;
-- 
2.33.0


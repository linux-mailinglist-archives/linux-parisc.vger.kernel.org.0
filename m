Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 227D5491C11
	for <lists+linux-parisc@lfdr.de>; Tue, 18 Jan 2022 04:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347240AbiARDNX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 17 Jan 2022 22:13:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353288AbiARDBc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 17 Jan 2022 22:01:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8867AC028C26;
        Mon, 17 Jan 2022 18:47:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 502E6B8125F;
        Tue, 18 Jan 2022 02:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091F9C36AE3;
        Tue, 18 Jan 2022 02:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642474019;
        bh=Z6LnLnvpzRXBhuAU39DeUE7li7MEBSuYocwLtie5v+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sT/uzE2/PhHm0zvaJnBEIRRS2DYid3rfJVv/tPrwmLvdAGFXnBbMZw8VOsLGB2/HW
         so1DxNGKBYtH5jE5FMSWq4PBG+YEeAuwt2wD6Pee1yhpEXNgYrBFO6mUUZUpjwa7Hj
         IEb37XhAJE+mp+1mKlP1Cic4tjEMHL29H+pZ31pnNIBNVlD/+0hutFTo62pSY8js//
         pbdQX461rNJlJCINEsKPVhC9ABYfOVddR6nB2ciMlqrooMZcLBSX/eUWCMqs3ytTXw
         VbyJb6OOyK2F9KAVov65YqyFksbdZFJnPfvtOEEcdUawGF949UvS6n0+Rb6caZGOYL
         ZMTtGnobvUiXQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>, Sasha Levin <sashal@kernel.org>,
        James.Bottomley@HansenPartnership.com, svens@stackframe.org,
        wangkefeng.wang@huawei.com, ebiederm@xmission.com,
        rmk+kernel@armlinux.org.uk, linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 73/73] parisc: Avoid calling faulthandler_disabled() twice
Date:   Mon, 17 Jan 2022 21:44:32 -0500
Message-Id: <20220118024432.1952028-73-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118024432.1952028-1-sashal@kernel.org>
References: <20220118024432.1952028-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: John David Anglin <dave.anglin@bell.net>

[ Upstream commit 9e9d4b460f23bab61672eae397417d03917d116c ]

In handle_interruption(), we call faulthandler_disabled() to check whether the
fault handler is not disabled. If the fault handler is disabled, we immediately
call do_page_fault(). It then calls faulthandler_disabled(). If disabled,
do_page_fault() attempts to fixup the exception by jumping to no_context:

no_context:

        if (!user_mode(regs) && fixup_exception(regs)) {
                return;
        }

        parisc_terminate("Bad Address (null pointer deref?)", regs, code, address);

Apart from the error messages, the two blocks of code perform the same
function.

We can avoid two calls to faulthandler_disabled() by a simple revision
to the code in handle_interruption().

Note: I didn't try to fix the formatting of this code block.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/parisc/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 82fc011894889..2a1060d747a5d 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -783,7 +783,7 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 	     * unless pagefault_disable() was called before.
 	     */
 
-	    if (fault_space == 0 && !faulthandler_disabled())
+	    if (faulthandler_disabled() || fault_space == 0)
 	    {
 		/* Clean up and return if in exception table. */
 		if (fixup_exception(regs))
-- 
2.34.1


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2636A720ED
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jul 2019 22:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391790AbfGWUiB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 Jul 2019 16:38:01 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:56577 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389110AbfGWUiA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 Jul 2019 16:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=uWYQCS4+OXGp7HDcx0dWXW6mx1GtvDygu9BJ+JGNXEE=; b=cS/siwqpwT570QHrsSWH9cavjq
        +ZJqRo/B+zwPiSUQ2wGNEy/kjc5CVlcnHheEd1ALNoiSQ4eHyVngfa4FcMPvDZ/U03fuT3hK9hVJY
        0b+NO144gp2IKkmeGTocOT811z5jg3nUtzPxplhUHShnz1jWuTbLPjDof1/XlaAPH47k=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hq1Xq-0002i7-S5; Tue, 23 Jul 2019 22:37:58 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 4/4] parisc: fix race condition in patching code
Date:   Tue, 23 Jul 2019 22:37:54 +0200
Message-Id: <20190723203754.7126-5-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723203754.7126-1-svens@stackframe.org>
References: <20190723203754.7126-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Assume the following ftrace code sequence that was patched in earlier by
ftrace_make_call():

PAGE A:
ffc:	addr of ftrace_caller()
PAGE B:
000:	0x6fc10080 /* stw,ma r1,40(sp) */
004:	0x48213fd1 /* ldw -18(r1),r1 */
008:	0xe820c002 /* bv,n r0(r1) */
00c:	0xe83f1fdf /* b,l,n .-c,r1 */

When a Code sequences that is to be patched spans a page break, we might
have already cleared the part on the PAGE A. If an interrupt is coming in
during the remap of the fixed mapping to PAGE B, it might execute the
patched function with only parts of the FTRACE code cleared. To prevent
this, clear the jump to our mini trampoline first, and clear the remaining
parts after this. This might also happen when patch_text() patches a
function that it calls during remap.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/ftrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 2c6086dbfe68..b836fc61a24f 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -194,8 +194,9 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 	for (i = 0; i < ARRAY_SIZE(insn); i++)
 		insn[i] = INSN_NOP;
 
+	__patch_text((void *)rec->ip, INSN_NOP);
 	__patch_text_multiple((void *)rec->ip + 4 - sizeof(insn),
-			      insn, sizeof(insn));
+			      insn, sizeof(insn)-4);
 	return 0;
 }
 #endif
-- 
2.20.1


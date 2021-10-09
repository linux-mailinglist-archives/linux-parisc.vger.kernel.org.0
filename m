Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 674E7427CA7
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Oct 2021 20:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhJIS0s (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Oct 2021 14:26:48 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:45728 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhJIS0s (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Oct 2021 14:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+BjgNCV0/lu3CDm1NJ8AzlrRox5HQiErnYXfhWVfoBc=; b=qmcg468DZLyOUZTJ0NrZyUAgYO
        Ft/Z634bY/eK6JfeNZoG1R8E4JrL4cBl3UfWhG8LJMZKUT6DbcOOYaSXODrNIrHGYwBXEmT73sUF8
        CHdypldQXEvMz20ObzZbJTdbZwPgUan3IOwmXHcSD7eknHBa6DZouke4EpqvnrsE/u7U=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZH1d-0001dj-Eo; Sat, 09 Oct 2021 20:24:49 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v2 3/5] parisc: fix preempt_count() check in entry.S
Date:   Sat,  9 Oct 2021 20:24:37 +0200
Message-Id: <20211009182439.30016-4-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009182439.30016-1-svens@stackframe.org>
References: <20211009182439.30016-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

preempt_count in struct thread_info is unsigned int,
but the entry.S code used LDREG, which generates a 64 bit
load when compiled for 64 bit. Fix this to use an ldw and
also change the condition in the compare one line below
to only compares 32 bits, although ldw zero extends, and
that should work with a 64 bit compare.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 9f939afe6b88..e9e598c18cb0 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -974,8 +974,8 @@ intr_do_preempt:
 
 	/* current_thread_info()->preempt_count */
 	mfctl	%cr30, %r1
-	LDREG	TI_PRE_COUNT(%r1), %r19
-	cmpib,COND(<>)	0, %r19, intr_restore	/* if preempt_count > 0 */
+	ldw	TI_PRE_COUNT(%r1), %r19
+	cmpib,<>	0, %r19, intr_restore	/* if preempt_count > 0 */
 	nop				/* prev insn branched backwards */
 
 	/* check if we interrupted a critical path */
-- 
2.33.0


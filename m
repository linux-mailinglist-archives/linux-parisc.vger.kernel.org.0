Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BCF42E230
	for <lists+linux-parisc@lfdr.de>; Thu, 14 Oct 2021 21:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhJNTv3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 14 Oct 2021 15:51:29 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:52106 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233126AbhJNTv2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 14 Oct 2021 15:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZH5hqZy0UFuuVQr0yub7p3oN4aIAumkh9QmT0QMFtzM=; b=cC3Aj9jqEawu75wy3T+dI/z6f1
        yWLvtBMyyNLruSrF3jFAsLdIu9WViWmbLBwNKwHx83eSTsF0aqQiVbYyQyCT5fZbcOW2EjmBbBZzm
        CKUTV424kJuoSUNjDplAL33NjU/pJvnUBHFs4weUv4D7bnhKR/9NE7tVwZBLywtyIT1c=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mb6jB-0006Sn-AR; Thu, 14 Oct 2021 21:49:21 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v3 1/4] parisc: move virt_map macro to assembly.h
Date:   Thu, 14 Oct 2021 21:49:13 +0200
Message-Id: <20211014194916.13901-2-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014194916.13901-1-svens@stackframe.org>
References: <20211014194916.13901-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This macro will also be used by the TOC code, so move it
into asm/assembly.h to avoid duplication.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/assembly.h | 25 +++++++++++++++++++++++++
 arch/parisc/kernel/entry.S         | 24 ------------------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
index a39250cb7dfc..d1d16d7b3607 100644
--- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -71,6 +71,7 @@
 #include <asm/types.h>
 
 #include <asm/asmregs.h>
+#include <asm/psw.h>
 
 	sp	=	30
 	gp	=	27
@@ -497,6 +498,30 @@
 	nop	/* 7 */
 	.endm
 
+	/* Switch to virtual mapping, trashing only %r1 */
+	.macro  virt_map
+	/* pcxt_ssm_bug */
+	rsm	PSW_SM_I, %r0		/* barrier for "Relied upon Translation */
+	mtsp	%r0, %sr4
+	mtsp	%r0, %sr5
+	mtsp	%r0, %sr6
+	tovirt_r1 %r29
+	load32	KERNEL_PSW, %r1
+
+	rsm     PSW_SM_QUIET,%r0	/* second "heavy weight" ctl op */
+	mtctl	%r0, %cr17		/* Clear IIASQ tail */
+	mtctl	%r0, %cr17		/* Clear IIASQ head */
+	mtctl	%r1, %ipsw
+	load32	4f, %r1
+	mtctl	%r1, %cr18		/* Set IIAOQ tail */
+	ldo	4(%r1), %r1
+	mtctl	%r1, %cr18		/* Set IIAOQ head */
+	rfir
+	nop
+4:
+	.endm
+
+
 	/*
 	 * ASM_EXCEPTIONTABLE_ENTRY
 	 *
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 9f939afe6b88..91e0540e5213 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -51,30 +51,6 @@
 	extrd,u \spc,(64 - (SPACEID_SHIFT)),32,\prot
 	.endm
 #endif
-
-	/* Switch to virtual mapping, trashing only %r1 */
-	.macro  virt_map
-	/* pcxt_ssm_bug */
-	rsm	PSW_SM_I, %r0	/* barrier for "Relied upon Translation */
-	mtsp	%r0, %sr4
-	mtsp	%r0, %sr5
-	mtsp	%r0, %sr6
-	tovirt_r1 %r29
-	load32	KERNEL_PSW, %r1
-
-	rsm     PSW_SM_QUIET,%r0	/* second "heavy weight" ctl op */
-	mtctl	%r0, %cr17	/* Clear IIASQ tail */
-	mtctl	%r0, %cr17	/* Clear IIASQ head */
-	mtctl	%r1, %ipsw
-	load32	4f, %r1
-	mtctl	%r1, %cr18	/* Set IIAOQ tail */
-	ldo	4(%r1), %r1
-	mtctl	%r1, %cr18	/* Set IIAOQ head */
-	rfir
-	nop
-4:
-	.endm
-
 	/*
 	 * The "get_stack" macros are responsible for determining the
 	 * kernel stack value.
-- 
2.33.0


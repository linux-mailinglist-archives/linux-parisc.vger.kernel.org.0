Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A05B411FAE6
	for <lists+linux-parisc@lfdr.de>; Sun, 15 Dec 2019 20:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfLOT65 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 15 Dec 2019 14:58:57 -0500
Received: from shroom.duncanthrax.net ([178.63.180.169]:44263 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfLOT65 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 15 Dec 2019 14:58:57 -0500
X-Greylist: delayed 2960 seconds by postgrey-1.27 at vger.kernel.org; Sun, 15 Dec 2019 14:58:56 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=47fWiPhKtE1AfSFvodmwX9GavC6h0C0K+wyAoQdbTos=; b=SZvx+5WT+JFvCEeMI79pAZBFsN
        8tusCSEmuq3J6RIzgh7oxIewWMLcK13Lkyi/jFTdeu1EMWIecdISiyUJuUOX+w4JzUe9acqdwirMn
        UJfCtJq/O48bov0ZzYtbGxPKZyl5MKCa5qFCNyhtkH+prUD94Ulmgmelz0yRJZHJCMus=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de ([46.5.233.221] helo=x280.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.90_1)
        (envelope-from <svens@stackframe.org>)
        id 1igZHv-0001Jl-2P; Sun, 15 Dec 2019 20:10:43 +0100
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] parisc: fix compilation when KEXEC=n and KEXEC_FILE=y
Date:   Sun, 15 Dec 2019 20:10:39 +0100
Message-Id: <20191215191039.29920-1-svens@stackframe.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix compilation when the CONFIG_KEXEC_FILE=y and
CONFIG_KEXEC=n.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/kexec.h | 4 ----
 arch/parisc/kernel/Makefile     | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/parisc/include/asm/kexec.h b/arch/parisc/include/asm/kexec.h
index a99ea747d7ed..87e174006995 100644
--- a/arch/parisc/include/asm/kexec.h
+++ b/arch/parisc/include/asm/kexec.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_PARISC_KEXEC_H
 #define _ASM_PARISC_KEXEC_H
 
-#ifdef CONFIG_KEXEC
-
 /* Maximum physical address we can use pages from */
 #define KEXEC_SOURCE_MEMORY_LIMIT (-1UL)
 /* Maximum address we can reach in physical address mode */
@@ -32,6 +30,4 @@ static inline void crash_setup_regs(struct pt_regs *newregs,
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* CONFIG_KEXEC */
-
 #endif /* _ASM_PARISC_KEXEC_H */
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 2663c8f8be11..068d90950d93 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -37,5 +37,5 @@ obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
 obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
 obj-$(CONFIG_KGDB)			+= kgdb.o
 obj-$(CONFIG_KPROBES)			+= kprobes.o
-obj-$(CONFIG_KEXEC)			+= kexec.o relocate_kernel.o
+obj-$(CONFIG_KEXEC_CORE)		+= kexec.o relocate_kernel.o
 obj-$(CONFIG_KEXEC_FILE)		+= kexec_file.o
-- 
2.24.0


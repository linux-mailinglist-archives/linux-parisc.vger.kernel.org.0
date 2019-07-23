Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 056E5720F2
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jul 2019 22:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389216AbfGWUiA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 Jul 2019 16:38:00 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:37630 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388963AbfGWUh7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 Jul 2019 16:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=jUE56y310vhD3oXAQ+7PEI6ULZqDx5fzbpcOrXQlmWM=; b=GWL6U9KnDxBEyUWsOaiO2lN/Iy
        o2F0/TthdvDRq9NaBoHayNPJoUBcqIK2p5Fz6nIjRuKnWoO4vgT5QMfGhPYJknTfSFwWIcnBHsUJN
        6uy+klOYw1qJz+/MCjgBzsmd1dxBI3tLDqLScuHS4z3v8hhDxZmkO9AsZPfzdKzomx6U=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hq1Xq-0002i7-Bb; Tue, 23 Jul 2019 22:37:58 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 1/4] parisc/ftrace: Add ARCH_SUPPORTS_FTRACE_OPS support
Date:   Tue, 23 Jul 2019 22:37:51 +0200
Message-Id: <20190723203754.7126-2-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723203754.7126-1-svens@stackframe.org>
References: <20190723203754.7126-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Pass ftrace_ops to ftrace functions to ftrace_trace_function().

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/ftrace.h | 1 +
 arch/parisc/kernel/ftrace.c      | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/ftrace.h b/arch/parisc/include/asm/ftrace.h
index 958c0aa5dbb2..a7cf0d05ccf4 100644
--- a/arch/parisc/include/asm/ftrace.h
+++ b/arch/parisc/include/asm/ftrace.h
@@ -8,6 +8,7 @@ extern void mcount(void);
 #define MCOUNT_ADDR		((unsigned long)mcount)
 #define MCOUNT_INSN_SIZE	4
 #define CC_USING_NOP_MCOUNT
+#define ARCH_SUPPORTS_FTRACE_OPS 1
 extern unsigned long sys_call_table[];
 
 extern unsigned long return_address(unsigned int);
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index d784ccdd8fef..ea5c50de0b65 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -53,8 +53,12 @@ void notrace __hot ftrace_function_trampoline(unsigned long parent,
 #ifndef CONFIG_DYNAMIC_FTRACE
 	extern ftrace_func_t ftrace_trace_function;
 #endif
-	if (ftrace_trace_function != ftrace_stub)
-		ftrace_trace_function(self_addr, parent, NULL, NULL);
+	extern struct ftrace_ops *function_trace_op;
+
+	if (function_trace_op->flags & FTRACE_OPS_FL_ENABLED &&
+	    ftrace_trace_function != ftrace_stub)
+		ftrace_trace_function(self_addr, parent,
+				function_trace_op, NULL);
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	if (ftrace_graph_return != (trace_func_graph_ret_t) ftrace_stub ||
-- 
2.20.1


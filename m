Return-Path: <linux-parisc+bounces-64-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5847F76C1
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 15:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F1BB1C210F4
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 14:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F812D7B5;
	Fri, 24 Nov 2023 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2T28N5t"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEB82D781
	for <linux-parisc@vger.kernel.org>; Fri, 24 Nov 2023 14:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7F6C433C9;
	Fri, 24 Nov 2023 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700837008;
	bh=PLcYTiIlDBjMEojfPH4+Bm2d8yNNnrTTzmz7PUXkJIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D2T28N5tmilOysUorZD1wsjaVlWHw7QYfCqqK+V53l9szRtggyj2vCfWndpUDA10f
	 Fe1KW9pa/TXISI2yAGBkmg+egoHo+i5sGez5eQb77C/hYM4NvEwVINnRippsuDnUw9
	 3JhzwcIlLXNQCXYIGtFRBMM/0TXJL9/mW+nKuPeAfmdbwNtxQEtt60SRi/3u7Gxtmo
	 eKw6+SiWLDDIS+Jbv0Oi5JEC0GC7AqYzP53qhIcUIElEAXzfF/owXLEPpw/2NHKJB8
	 kWrpCnsxAKG6cBraY1ZyUEJN1C+tbnh4XrBtEmseqZF6w+AL6UGrrt4a0i6lqSu6K0
	 hx1RGHjQZ0/eQ==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 6/8] parisc: Use correct alignment in __bug_table
Date: Fri, 24 Nov 2023 15:41:10 +0100
Message-ID: <20231124144158.158993-13-deller@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231124144158.158993-1-deller@kernel.org>
References: <20231124144158.158993-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Make sure that the __bug_table section gets 32- or 64-bit aligned,
depending if a 32- or 64-bit kernel is being built.
Mark the ____bug_table not writeable, and use .blockz instead of
.org assembler directive to pad the struct.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/bug.h | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 4b6d60b94124..b9cad0bb4461 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -28,13 +28,15 @@
 	do {								\
 		asm volatile("\n"					\
 			     "1:\t" PARISC_BUG_BREAK_ASM "\n"		\
-			     "\t.pushsection __bug_table,\"aw\"\n"	\
+			     "\t.pushsection __bug_table,\"a\"\n"	\
+			     "\t.align %4\n"				\
 			     "2:\t" ASM_WORD_INSN "1b, %c0\n"		\
-			     "\t.short %c1, %c2\n"			\
-			     "\t.org 2b+%c3\n"				\
+			     "\t.short %1, %2\n"			\
+			     "\t.blockz %3-2*%4-2*2\n"			\
 			     "\t.popsection"				\
 			     : : "i" (__FILE__), "i" (__LINE__),	\
-			     "i" (0), "i" (sizeof(struct bug_entry)) ); \
+			     "i" (0), "i" (sizeof(struct bug_entry)),	\
+			     "i" (sizeof(long)) );			\
 		unreachable();						\
 	} while(0)
 
@@ -51,27 +53,31 @@
 	do {								\
 		asm volatile("\n"					\
 			     "1:\t" PARISC_BUG_BREAK_ASM "\n"		\
-			     "\t.pushsection __bug_table,\"aw\"\n"	\
+			     "\t.pushsection __bug_table,\"a\"\n"	\
+			     "\t.align %4\n"				\
 			     "2:\t" ASM_WORD_INSN "1b, %c0\n"		\
-			     "\t.short %c1, %c2\n"			\
-			     "\t.org 2b+%c3\n"				\
+			     "\t.short %1, %2\n"			\
+			     "\t.blockz %3-2*%4-2*2\n"			\
 			     "\t.popsection"				\
 			     : : "i" (__FILE__), "i" (__LINE__),	\
 			     "i" (BUGFLAG_WARNING|(flags)),		\
-			     "i" (sizeof(struct bug_entry)) );		\
+			     "i" (sizeof(struct bug_entry)),		\
+			     "i" (sizeof(long)) );			\
 	} while(0)
 #else
 #define __WARN_FLAGS(flags)						\
 	do {								\
 		asm volatile("\n"					\
 			     "1:\t" PARISC_BUG_BREAK_ASM "\n"		\
-			     "\t.pushsection __bug_table,\"aw\"\n"	\
+			     "\t.pushsection __bug_table,\"a\"\n"	\
+			     "\t.align %2\n"				\
 			     "2:\t" ASM_WORD_INSN "1b\n"		\
-			     "\t.short %c0\n"				\
-			     "\t.org 2b+%c1\n"				\
+			     "\t.short %0\n"				\
+			     "\t.blockz %1-%2-2\n"			\
 			     "\t.popsection"				\
 			     : : "i" (BUGFLAG_WARNING|(flags)),		\
-			     "i" (sizeof(struct bug_entry)) );		\
+			     "i" (sizeof(struct bug_entry)),		\
+			     "i" (sizeof(long)) );			\
 	} while(0)
 #endif
 
-- 
2.42.0



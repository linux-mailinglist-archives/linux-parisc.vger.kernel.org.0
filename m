Return-Path: <linux-parisc+bounces-66-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 313FE7F76C3
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 15:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC0D8B21328
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 14:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E564F2D7B5;
	Fri, 24 Nov 2023 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbuLnQ1O"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E82286B6
	for <linux-parisc@vger.kernel.org>; Fri, 24 Nov 2023 14:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076B2C433CA;
	Fri, 24 Nov 2023 14:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700837021;
	bh=A5jorDEldyCVDWSZyZ0AJHq11wmlWXwFBpIDRg8t55Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DbuLnQ1OeUxAgMncDrcR0Hji4J17P63s9Xv8bjH8WSh9oKgZgzDiJ+EYUcivgn/Zw
	 Vn4XX+OJxaXGI7sTIi2hzr/mOyIFBdqnDY2CQHo2kDzao0gr1jxcnK7ejdtn9J2o8R
	 0MX+BrcXs/2kfR1KKT952opkTD4p5HzxHOamMxClmgeXfOGbcEXlhPX20aEKQsWDS2
	 M8B3uyvlX5KMVC1IKkxVX81JosnazYOhoy+9PakvO/SvkHvxsLvvdARpbU5LgPBWgi
	 pS8D73o7+T6rin8U+JiI87yB/kC7Fd4QlY22ztd+nuFKGlxgkwTiHvOzwibwbFaLPo
	 yyBwYfPWms6NQ==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 8/8] parisc: Reduce size of __bug_table[] on 64-bit kernel by half
Date: Fri, 24 Nov 2023 15:41:13 +0100
Message-ID: <20231124144158.158993-16-deller@kernel.org>
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

Enable GENERIC_BUG_RELATIVE_POINTERS which will store 32-bit relative
offsets to the bug address and the source file name instead of 64-bit
absolute addresses. This effectively reduces the size of the
__bug_table[] array by half on 64-bit kernels.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/Kconfig           |  7 +++++--
 arch/parisc/include/asm/bug.h | 34 +++++++++++++++++-----------------
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index a7c9c0e69e5a..d14ccc948a29 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -115,9 +115,12 @@ config ARCH_HAS_ILOG2_U64
 	default n
 
 config GENERIC_BUG
-	bool
-	default y
+	def_bool y
 	depends on BUG
+	select GENERIC_BUG_RELATIVE_POINTERS if 64BIT
+
+config GENERIC_BUG_RELATIVE_POINTERS
+	bool
 
 config GENERIC_HWEIGHT
 	bool
diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index b9cad0bb4461..1641ff9a8b83 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -17,26 +17,27 @@
 #define	PARISC_BUG_BREAK_ASM	"break 0x1f, 0x1fff"
 #define	PARISC_BUG_BREAK_INSN	0x03ffe01f  /* PARISC_BUG_BREAK_ASM */
 
-#if defined(CONFIG_64BIT)
-#define ASM_WORD_INSN		".dword\t"
+#ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
+# define __BUG_REL(val) ".word " __stringify(val) " - ."
 #else
-#define ASM_WORD_INSN		".word\t"
+# define __BUG_REL(val) ".word " __stringify(val)
 #endif
 
+
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #define BUG()								\
 	do {								\
 		asm volatile("\n"					\
 			     "1:\t" PARISC_BUG_BREAK_ASM "\n"		\
 			     "\t.pushsection __bug_table,\"a\"\n"	\
-			     "\t.align %4\n"				\
-			     "2:\t" ASM_WORD_INSN "1b, %c0\n"		\
+			     "\t.align 4\n"				\
+			     "2:\t" __BUG_REL(1b) "\n"			\
+			     "\t" __BUG_REL(%c0)  "\n"			\
 			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*%4-2*2\n"			\
+			     "\t.blockz %3-2*4-2*2\n"			\
 			     "\t.popsection"				\
 			     : : "i" (__FILE__), "i" (__LINE__),	\
-			     "i" (0), "i" (sizeof(struct bug_entry)),	\
-			     "i" (sizeof(long)) );			\
+			     "i" (0), "i" (sizeof(struct bug_entry)) );	\
 		unreachable();						\
 	} while(0)
 
@@ -54,15 +55,15 @@
 		asm volatile("\n"					\
 			     "1:\t" PARISC_BUG_BREAK_ASM "\n"		\
 			     "\t.pushsection __bug_table,\"a\"\n"	\
-			     "\t.align %4\n"				\
-			     "2:\t" ASM_WORD_INSN "1b, %c0\n"		\
+			     "\t.align 4\n"				\
+			     "2:\t" __BUG_REL(1b) "\n"			\
+			     "\t" __BUG_REL(%c0)  "\n"			\
 			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*%4-2*2\n"			\
+			     "\t.blockz %3-2*4-2*2\n"			\
 			     "\t.popsection"				\
 			     : : "i" (__FILE__), "i" (__LINE__),	\
 			     "i" (BUGFLAG_WARNING|(flags)),		\
-			     "i" (sizeof(struct bug_entry)),		\
-			     "i" (sizeof(long)) );			\
+			     "i" (sizeof(struct bug_entry)) );		\
 	} while(0)
 #else
 #define __WARN_FLAGS(flags)						\
@@ -71,13 +72,12 @@
 			     "1:\t" PARISC_BUG_BREAK_ASM "\n"		\
 			     "\t.pushsection __bug_table,\"a\"\n"	\
 			     "\t.align %2\n"				\
-			     "2:\t" ASM_WORD_INSN "1b\n"		\
+			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t.short %0\n"				\
-			     "\t.blockz %1-%2-2\n"			\
+			     "\t.blockz %1-4-2\n"			\
 			     "\t.popsection"				\
 			     : : "i" (BUGFLAG_WARNING|(flags)),		\
-			     "i" (sizeof(struct bug_entry)),		\
-			     "i" (sizeof(long)) );			\
+			     "i" (sizeof(struct bug_entry)) );		\
 	} while(0)
 #endif
 
-- 
2.42.0



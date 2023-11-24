Return-Path: <linux-parisc+bounces-62-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E87F76BE
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 15:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A731C21237
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 14:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB1F2D62A;
	Fri, 24 Nov 2023 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XELMk8G6"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7882C1AE
	for <linux-parisc@vger.kernel.org>; Fri, 24 Nov 2023 14:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F4BC433D9;
	Fri, 24 Nov 2023 14:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700836992;
	bh=a4Mn1QYYA/uopMseqH+xj88L0ZG+tJXc6R8hkX10Qzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XELMk8G6sZAtSdbH7TX7s2vfv/d2pWkTccYb39cmg0ovej0Qs/2KsALvAKmyRooj7
	 02gxINOUz5+mjfrEwXpK2+ytYAxIVpujg+m/DeuzFaUR0CD4fmENtPae2qorArQM3l
	 kbmT4TVzPemOV6QTHsOjYNNVAuhxqMdNj4c83SI3QqbysxCLbrdv/7jSIkaMmQjGhq
	 +9A7uNzp3N/DHkMsc1OfXz0IkK1uyhm23gU2C389EsObyyDWYupAI9vgAhhf1nmI1y
	 GUlHC4wddpLGceo2JvOQUwbdv3owL41LyAVgFe6kqWAmR77GDXVd0+LWL4yyMhoK71
	 7lA0jY2F92hyw==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 4/8] parisc: Mark altinstructions 32-bit aligned
Date: Fri, 24 Nov 2023 15:41:06 +0100
Message-ID: <20231124144158.158993-9-deller@kernel.org>
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

Make sure that the altinstruction section gets 32-bit aligned.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/alternative.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/alternative.h b/arch/parisc/include/asm/alternative.h
index 1ed45fd085d3..1eb488f25b83 100644
--- a/arch/parisc/include/asm/alternative.h
+++ b/arch/parisc/include/asm/alternative.h
@@ -34,7 +34,8 @@ void apply_alternatives(struct alt_instr *start, struct alt_instr *end,
 
 /* Alternative SMP implementation. */
 #define ALTERNATIVE(cond, replacement)		"!0:"	\
-	".section .altinstructions, \"aw\"	!"	\
+	".section .altinstructions, \"a\"	!"	\
+	".align 4				!"	\
 	".word (0b-4-.)				!"	\
 	".hword 1, " __stringify(cond) "	!"	\
 	".word " __stringify(replacement) "	!"	\
@@ -44,7 +45,8 @@ void apply_alternatives(struct alt_instr *start, struct alt_instr *end,
 
 /* to replace one single instructions by a new instruction */
 #define ALTERNATIVE(from, to, cond, replacement)\
-	.section .altinstructions, "aw"	!	\
+	.section .altinstructions, "a"	!	\
+	.align 4			!	\
 	.word (from - .)		!	\
 	.hword (to - from)/4, cond	!	\
 	.word replacement		!	\
@@ -52,7 +54,8 @@ void apply_alternatives(struct alt_instr *start, struct alt_instr *end,
 
 /* to replace multiple instructions by new code */
 #define ALTERNATIVE_CODE(from, num_instructions, cond, new_instr_ptr)\
-	.section .altinstructions, "aw"	!	\
+	.section .altinstructions, "a"	!	\
+	.align 4			!	\
 	.word (from - .)		!	\
 	.hword -num_instructions, cond	!	\
 	.word (new_instr_ptr - .)	!	\
-- 
2.42.0



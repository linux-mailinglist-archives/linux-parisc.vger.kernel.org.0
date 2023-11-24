Return-Path: <linux-parisc+bounces-63-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E60FC7F76C0
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 15:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 232121C210F4
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 14:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F612D781;
	Fri, 24 Nov 2023 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdiwAg++"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB712D635
	for <linux-parisc@vger.kernel.org>; Fri, 24 Nov 2023 14:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A788C433C7;
	Fri, 24 Nov 2023 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700837000;
	bh=mJ3o+Ukg3wgT8ohKU9ICvT4tbdf+dY1Tp/KomgS4yhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VdiwAg++u58TkeYfxQEka2vO9ICaQlO+qhHquvdqpDvcaDBR3Ma3I0MHHSP+oaoCj
	 469waMmy023JEKSkrfzMQRAbxFqjs+ynmx1hi1uyp9UbveB6zO6VEXY4hmFBXOuxL3
	 JEDINx5sIbSF9Vwe6BYk37hou+H63/9Z/hkIcr4F0l5eD5c/7zlCKjVo8qFzFWXzo4
	 JudJNEE5+OfLWv7J3sljkWkgoN1BmOpZjLimkLg94X0KS30ALhn2G7lMmsCzdlKLyq
	 b/sqN2kJ/s3vZ8ChnkCz6GTocZ0sv8V2Kn4uwEddQddN9WHYoLwZO1zkVvO4zu73jd
	 Xvh/e+3Eo9W9Q==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 5/8] parisc: Mark __jump_table aligned to CPU long width
Date: Fri, 24 Nov 2023 15:41:08 +0100
Message-ID: <20231124144158.158993-11-deller@kernel.org>
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

The __jump_table stores two 32-bit words and one 32- or 64-bit word
(for 64-bit kernel).
Ensure that the third word is correctly 64-bit aligned by aligning the
whole structure correctly.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/jump_label.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/jump_label.h b/arch/parisc/include/asm/jump_label.h
index af2a598bc0f8..94428798b6aa 100644
--- a/arch/parisc/include/asm/jump_label.h
+++ b/arch/parisc/include/asm/jump_label.h
@@ -15,10 +15,12 @@ static __always_inline bool arch_static_branch(struct static_key *key, bool bran
 	asm_volatile_goto("1:\n\t"
 		 "nop\n\t"
 		 ".pushsection __jump_table,  \"aw\"\n\t"
+		 ".align %1\n\t"
 		 ".word 1b - ., %l[l_yes] - .\n\t"
 		 __stringify(ASM_ULONG_INSN) " %c0 - .\n\t"
 		 ".popsection\n\t"
-		 : :  "i" (&((char *)key)[branch]) :  : l_yes);
+		 : : "i" (&((char *)key)[branch]), "i" (sizeof(long))
+		 : : l_yes);
 
 	return false;
 l_yes:
@@ -30,10 +32,12 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
 	asm_volatile_goto("1:\n\t"
 		 "b,n %l[l_yes]\n\t"
 		 ".pushsection __jump_table,  \"aw\"\n\t"
+		 ".align %1\n\t"
 		 ".word 1b - ., %l[l_yes] - .\n\t"
 		 __stringify(ASM_ULONG_INSN) " %c0 - .\n\t"
 		 ".popsection\n\t"
-		 : :  "i" (&((char *)key)[branch]) :  : l_yes);
+		 : : "i" (&((char *)key)[branch]), "i" (sizeof(long))
+		 : : l_yes);
 
 	return false;
 l_yes:
-- 
2.42.0



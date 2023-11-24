Return-Path: <linux-parisc+bounces-60-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6FA7F76BC
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 15:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 405DE280C0B
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 14:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB32286B6;
	Fri, 24 Nov 2023 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4P9BOaH"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC6228376
	for <linux-parisc@vger.kernel.org>; Fri, 24 Nov 2023 14:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08EEC433CD;
	Fri, 24 Nov 2023 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700836976;
	bh=ioypnsK8PrReCgZUGbLHH0MpBeBFgbC8elgt1qnCDKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S4P9BOaHMwC6n2kH8sRs15sgrrKCpPourXYR4ruiLokC5xmxlYcwlR0kXXwKtrxJa
	 YXD06I1m4Qv39W0aRxtS74u4aJMndlwPAYptzf4rW9xInZvNJWVrNxK56OXo4dCocE
	 xNfQieJuWmoEIvGivM99B6W2F32iqmN+Em5sM/2xQO5tJF9yWAn5kYhR0a9j1/KTp+
	 +TmeF/K4t3TP39YWfJkr33ceWxgl1y2yLZlUR4ZK7FXLBWLpu2s+Nstlo9OKiym1tz
	 kfEhbIeco3CcUJRsQ8tASLUDfJwi8Dbx3R1BOTI6FkKSl2YT2luLh8vQSa4qt1+Skv
	 XbDyIl82yoi+A==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 2/8] parisc: Mark __ex_table entries 32-bit aligned in uaccess.h
Date: Fri, 24 Nov 2023 15:41:02 +0100
Message-ID: <20231124144158.158993-5-deller@kernel.org>
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

Add an align statement to tell the linker that all __ex_table entries and as
such the whole __ex_table section should be 32-bit aligned in vmlinux and modules.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/uaccess.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 2bf660eabe42..4165079898d9 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -41,6 +41,7 @@ struct exception_table_entry {
 
 #define ASM_EXCEPTIONTABLE_ENTRY( fault_addr, except_addr )\
 	".section __ex_table,\"aw\"\n"			   \
+	".align 4\n"					   \
 	".word (" #fault_addr " - .), (" #except_addr " - .)\n\t" \
 	".previous\n"
 
-- 
2.42.0



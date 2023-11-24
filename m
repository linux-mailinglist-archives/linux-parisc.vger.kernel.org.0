Return-Path: <linux-parisc+bounces-59-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 164AA7F76B9
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 15:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47D3A1C2127F
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 14:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A73E2D624;
	Fri, 24 Nov 2023 14:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZiPaGoD"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD2E2C1A3
	for <linux-parisc@vger.kernel.org>; Fri, 24 Nov 2023 14:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C29C43391;
	Fri, 24 Nov 2023 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700836966;
	bh=5U8vgQMmddJWLlu0O09AXMbfAn+9mQzPX3eO30HQxrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TZiPaGoDiCWhAMz0DfQWY7whcdtsP65f4rMT0nrgiXRcNI0O9wWme2jv3zJ1LbSQE
	 6yjv1pciRWBJ3LrTDMMExEWgHUPqRKea8Ie8Natei4wVdQYpTG3dFO0yIkIECYu0O7
	 +xPaT8mYu9k5ut19tv/vTySJR2iwsRRxQpqXo3hw3YxVdTydrmrcRijpp+3or+rFww
	 mxW1Hmxgph34VVtquOY1yW0/CUQZcbBdARrQu/juxmT/LDudoyV7NdBh2+HaaybnN8
	 cRm6Ioh94+dEtC6jlatLJfJm7QEaHOxscfS/2cvIQ6vo5me78S9xMPmiJ3xMS6Nxy9
	 2ML9LF9ZT9HJQ==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/8] parisc: Mark __ex_table entries 32-bit aligned in assembly.h
Date: Fri, 24 Nov 2023 15:41:00 +0100
Message-ID: <20231124144158.158993-3-deller@kernel.org>
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
 arch/parisc/include/asm/assembly.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
index 75677b526b2b..74d17d7e759d 100644
--- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -574,6 +574,7 @@
 	 */
 #define ASM_EXCEPTIONTABLE_ENTRY(fault_addr, except_addr)	\
 	.section __ex_table,"aw"			!	\
+	.align 4					!	\
 	.word (fault_addr - .), (except_addr - .)	!	\
 	.previous
 
-- 
2.42.0



Return-Path: <linux-parisc+bounces-61-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D75C17F76BD
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 15:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14A931C2124C
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Nov 2023 14:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFF322314;
	Fri, 24 Nov 2023 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgsE1pDK"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509411CFB7
	for <linux-parisc@vger.kernel.org>; Fri, 24 Nov 2023 14:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21241C43397;
	Fri, 24 Nov 2023 14:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700836984;
	bh=OUOiPVPzvznK0kb0DanuBVTlFgEspIRBW9U2myAjTMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mgsE1pDKlXNUzi8YVNs/K7Qy+iVW5RMBD28rLvkVGL7fJ7B7Vdmk0hlL3LlpUkcFT
	 23ULma8gWJvMxZKb2/sR8Yf6t0lYSmyQTRGDCY8tdT2Efhb7T4mcgb5KEttJwjIjam
	 TeC1TrBAypXRq9XGIpU2bpSxPrq3SERwpK6SLvfqi31BQ/kQPgS0Jjn8ETVOW8mk/Z
	 MxgMMsXt0HJAS6hrZ2PL0Vds0joUwl0y59LfbYhqRVQ0d+WJfRdmsPCQ8OmYZ3IfgA
	 HfXt19e0cfn/0yvWtkbX/cmaIfWGrZJmkVNdoeT9FB+VG447cO8Z/f13518t8nI9aC
	 +U1F/5z9ixJOw==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 3/8] parisc: Specify alignments for .PARISC.unwind and .data..lock_aligned
Date: Fri, 24 Nov 2023 15:41:04 +0100
Message-ID: <20231124144158.158993-7-deller@kernel.org>
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

Make sure the unwind section will be 32-bit aligned.

Explicitely mark the .data..lock_aligned explicitely 16-byte aligned
in vmlinux.lds.S although the previous ALIGN(16) statement already
does it right.

Add __aligned(16) to __lock_aligned define to ensure that such
variables will have an alignment of 16 in the sections of the object
files.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/ldcw.h   | 2 +-
 arch/parisc/kernel/vmlinux.lds.S | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/ldcw.h b/arch/parisc/include/asm/ldcw.h
index ee9e071859b2..47ebc4c91eaf 100644
--- a/arch/parisc/include/asm/ldcw.h
+++ b/arch/parisc/include/asm/ldcw.h
@@ -55,7 +55,7 @@
 })
 
 #ifdef CONFIG_SMP
-# define __lock_aligned __section(".data..lock_aligned")
+# define __lock_aligned __section(".data..lock_aligned") __aligned(16)
 #endif
 
 #endif /* __PARISC_LDCW_H */
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 58694d1989c2..190e623e3ade 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -130,7 +130,7 @@ SECTIONS
 	RO_DATA(8)
 
 	/* unwind info */
-	.PARISC.unwind : {
+	.PARISC.unwind ALIGN(4) : {
 		__start___unwind = .;
 		*(.PARISC.unwind)
 		__stop___unwind = .;
@@ -149,7 +149,7 @@ SECTIONS
 
 	/* PA-RISC locks requires 16-byte alignment */
 	. = ALIGN(16);
-	.data..lock_aligned : {
+	.data..lock_aligned ALIGN(16) : {
 		*(.data..lock_aligned)
 	}
 
-- 
2.42.0



Return-Path: <linux-parisc+bounces-3521-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73015A7B2F8
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Apr 2025 02:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1743A189B351
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Apr 2025 00:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87CE1991D2;
	Fri,  4 Apr 2025 00:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdUm4e1e"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D30E199FB2;
	Fri,  4 Apr 2025 00:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725071; cv=none; b=B2RDqNg8FjTl+mUtE4iTTx+oGEafnywyEebqKfg+NI2tcmqOtGsNrt2q2fW+f19ceGCooCGB2gSmoiApTletB+b6hKz2nusgH8F3fIz+SXNair3xjBaOgQDu3jfScuu6+yfPttlqpwd3JMDFr5PVeZ0vkTb1KN1zYSD89+lUzq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725071; c=relaxed/simple;
	bh=JeYzyS+9qEg8sDXUXVHebHJrZohuDT77IkPlS6VTL9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F1UIXv55tZ9gDauJ+WIeyulPZJAdmvIAbg0c7XDU5lqLQhcGBo1EDlJR1ubZYVFTuzxuJuL3ub8zIb9SqMTJjr1CnzQXd1Vwc6lwLB2ciIl2LwNPdlzXQv/EX/Jk45uq5YgUGtnE1Kk1vkNV2pksrC/piOQxo3wb1qN0qc1HAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdUm4e1e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C5BC4CEE3;
	Fri,  4 Apr 2025 00:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725071;
	bh=JeYzyS+9qEg8sDXUXVHebHJrZohuDT77IkPlS6VTL9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KdUm4e1e07WHU8VLs0mKTNrrydX688vYwoQvEK0YOP+eIBIRleBmZ/gWHvQElCQNn
	 /mX2bnq3Vzz4/uj5UM8GXd8E3K+T2omlvsoPkw26p3aB6KSZ3P5FUQF1WqiRUzhNiy
	 eMP0DLgeDTfS5tiB3TPiEQcLG9LrLF6cwEiFTzV4988cV5wutcZlkDucH0Dhws2enl
	 CmqknQQ35pnX9c5/gKH4M8tUeKYtXdLpIsV7H78/rDkMmM5YahQkKWqjQwlET4gVM6
	 0t8vesAPOxqPyIdVY2EpH0jyO6GzS8cTDaCM2MQCbWg4POChipuK0AhK+8peLKQOWB
	 Vy3KoWUOW3znQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	James.Bottomley@HansenPartnership.com,
	linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 13/23] parisc: PDT: Fix missing prototype warning
Date: Thu,  3 Apr 2025 20:03:50 -0400
Message-Id: <20250404000402.2688049-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404000402.2688049-1-sashal@kernel.org>
References: <20250404000402.2688049-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit

From: Yu-Chun Lin <eleanor15x@gmail.com>

[ Upstream commit b899981750dcb958ceffa4462d903963ee494aa2 ]

As reported by the kernel test robot, the following error occurs:

arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
      65 | void arch_report_meminfo(struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~

arch_report_meminfo() is declared in include/linux/proc_fs.h and only
defined when CONFIG_PROC_FS is enabled. Wrap its definition in #ifdef
CONFIG_PROC_FS to fix the -Wmissing-prototypes warning.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502082315.IPaHaTyM-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/parisc/kernel/pdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index 0f9b3b5914cf6..b70b67adb855f 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -63,6 +63,7 @@ static unsigned long pdt_entry[MAX_PDT_ENTRIES] __page_aligned_bss;
 #define PDT_ADDR_PERM_ERR	(pdt_type != PDT_PDC ? 2UL : 0UL)
 #define PDT_ADDR_SINGLE_ERR	1UL
 
+#ifdef CONFIG_PROC_FS
 /* report PDT entries via /proc/meminfo */
 void arch_report_meminfo(struct seq_file *m)
 {
@@ -74,6 +75,7 @@ void arch_report_meminfo(struct seq_file *m)
 	seq_printf(m, "PDT_cur_entries: %7lu\n",
 			pdt_status.pdt_entries);
 }
+#endif
 
 static int get_info_pat_new(void)
 {
-- 
2.39.5



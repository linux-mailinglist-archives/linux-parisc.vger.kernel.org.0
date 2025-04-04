Return-Path: <linux-parisc+bounces-3526-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC91EA7B400
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Apr 2025 02:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6ED7189BD09
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Apr 2025 00:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AA7208990;
	Fri,  4 Apr 2025 00:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFjCXe0R"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3EF208960;
	Fri,  4 Apr 2025 00:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725263; cv=none; b=VprC4W7g60rAqGFeHcfyQMcpAeQQt1+44UyvJ8AV2ZHytnzld7iM+8Vt7wJBdhsuUeXXjvGZ0LdeLwBHjtpCwYt3YqfJs6vrnT9/0fzcCD52J9cJnlUMjzv62Kgz7Y46WMGXr14oeeo9VP0X96FPZRosW16vfytHucQlq9qxItA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725263; c=relaxed/simple;
	bh=nSmKwwp59S7nEOH5NynrVjJBp3cMBzNpUxbYWxQ4bWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BQOYlSYU+OnEYmBkYumISxxUM76+dLa/fzDtusPiqiUFWfdadetgBlBo1zZ5NHgQbj5NOK+TqE19vR6+MsIujxI9aPEJr/wg0qsjjnoznG5vUXe6yrjR1cKoV7fRI0GKchRsT44g9YCZhbRga3BZP8Mw/b5Kxy0va0O96Ls1uaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFjCXe0R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04FFC4CEE3;
	Fri,  4 Apr 2025 00:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725261;
	bh=nSmKwwp59S7nEOH5NynrVjJBp3cMBzNpUxbYWxQ4bWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mFjCXe0RQF38x/FR5ScL09n2UrKJkEBT29xmr0frppLK2ntXRPwTk7xa5Byaqg0EG
	 hhheTZuta5ZGBx2Rr3GusoU1jJ2LVzZVdDioJcRL/AKxKckxPmtiADzABCUIc32XPC
	 v6WP34fWQpO8WkXG3eEfP7aYzw0Tlsw45jLPm3Ckfp19yVh4uiM7MAAkl1O76QNhQE
	 JWaHpupZKoISPVlj0F8CnPkrGuX8BHNfvd0PuPKj/pPvRLkIWkEe0SYWuJKjGAMssB
	 LyhWAbMOIRMpxpwIEJFd6PEtDFxthE9ecQybYnkvQ3O1rhhCkxJTKihpXtRTyaSz4y
	 g5FtwY0eG1PLw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	James.Bottomley@HansenPartnership.com,
	linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 5/8] parisc: PDT: Fix missing prototype warning
Date: Thu,  3 Apr 2025 20:07:23 -0400
Message-Id: <20250404000728.2689305-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404000728.2689305-1-sashal@kernel.org>
References: <20250404000728.2689305-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.179
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
index fcc761b0e11b9..d20e8283c5b8a 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -62,6 +62,7 @@ static unsigned long pdt_entry[MAX_PDT_ENTRIES] __page_aligned_bss;
 #define PDT_ADDR_PERM_ERR	(pdt_type != PDT_PDC ? 2UL : 0UL)
 #define PDT_ADDR_SINGLE_ERR	1UL
 
+#ifdef CONFIG_PROC_FS
 /* report PDT entries via /proc/meminfo */
 void arch_report_meminfo(struct seq_file *m)
 {
@@ -73,6 +74,7 @@ void arch_report_meminfo(struct seq_file *m)
 	seq_printf(m, "PDT_cur_entries: %7lu\n",
 			pdt_status.pdt_entries);
 }
+#endif
 
 static int get_info_pat_new(void)
 {
-- 
2.39.5



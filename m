Return-Path: <linux-parisc+bounces-416-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350F8393FD
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 16:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BF7828B6ED
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 15:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA7C61665;
	Tue, 23 Jan 2024 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j89bvcS5"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BFF61669
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706025563; cv=none; b=oddDY/g+Inyq+m9nr3OMp7FJNlcNEcpu4A8OzjwAhTYJzp8ARqHtLXTwsgtq+tXhT2ZzFvC7CAgBHljGJv6mIAw6HgJU2H4FLBtPJyA224L/wuzLefKQnDRz7BWRAMUhZ/l5HJ36/7ritQrP+G7C5aMH0rVJfbtlqi39UgFt96k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706025563; c=relaxed/simple;
	bh=iZIRrzd/08DKlAuuESsiMrG+QJdAocaLIiD6zdMwMmc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JksGkQqSNIa/dWwYM6ya/QEUrxQESVYvJbayoRR0XttA83171Otu+BjeWdDmp1ocFLlkkuO29R3Sm9rd71du2teyT88kv9/BlP7tUVYlwTIY40KzFCPMdxCCX5G1Su6kHysOghFpzafhXBS7u2X9I5GpL+MT6IMSNQchjDL2Afw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j89bvcS5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554A6C43394
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706025562;
	bh=iZIRrzd/08DKlAuuESsiMrG+QJdAocaLIiD6zdMwMmc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=j89bvcS5LYiIWFO9IpWfVbSyrp6IXtnrbzqJdKGxU8h6peVvTBLXhVuTiukX8kKE1
	 FaApDrcesvqQ2PzhZjlvFDvVxqZB0quQl+5LCX8BFG6JiD7Y8ig00vjxiwIiClScVy
	 YUjtvxuE7dqGXDj9htV2zjzcpVhgfcA7S26MI6uUNLImZZx0InwBySndcMicXTjW6I
	 sHQtHMysTY8zk5bU9O4Z/rpFHvS1LDv1IanT4vzt9LSz67Zs6ZPTc1yfREvu3Z8k+3
	 1s0mEJoDMKRE6AqrguCTbJlBvO0ptx7eS/TPsOTbhJANGjMghpqEi81kGoWG7qwEF8
	 Vaj959123WXwg==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH 3/7] parisc: Check for valid stride size for cache flushes
Date: Tue, 23 Jan 2024 16:59:00 +0100
Message-ID: <20240123155904.6220-3-deller@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123155904.6220-1-deller@kernel.org>
References: <20240123155904.6220-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Report if the calculated cache stride size is zero, otherwise the cache
flushing routine will never finish and hang the machine.
This can be reproduced with a testcase in qemu, where the firmware reports
wrong cache values.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/cache.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 268d90a9325b..0c015487e5db 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -264,6 +264,10 @@ parisc_cache_init(void)
 	icache_stride = CAFL_STRIDE(cache_info.ic_conf);
 #undef CAFL_STRIDE
 
+	/* stride needs to be non-zero, otherwise cache flushes will not work */
+	WARN_ON(cache_info.dc_size && dcache_stride == 0);
+	WARN_ON(cache_info.ic_size && icache_stride == 0);
+
 	if ((boot_cpu_data.pdc.capabilities & PDC_MODEL_NVA_MASK) ==
 						PDC_MODEL_NVA_UNSUPPORTED) {
 		printk(KERN_WARNING "parisc_cache_init: Only equivalent aliasing supported!\n");
-- 
2.43.0



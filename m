Return-Path: <linux-parisc+bounces-4520-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFFrIJOseGl9rwEAu9opvQ
	(envelope-from <linux-parisc+bounces-4520-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Tue, 27 Jan 2026 13:16:19 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2599F941C3
	for <lists+linux-parisc@lfdr.de>; Tue, 27 Jan 2026 13:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D6313002930
	for <lists+linux-parisc@lfdr.de>; Tue, 27 Jan 2026 12:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285192DC332;
	Tue, 27 Jan 2026 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="swOtWBA2"
X-Original-To: linux-parisc@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC091E4BE
	for <linux-parisc@vger.kernel.org>; Tue, 27 Jan 2026 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516173; cv=none; b=uCYl/R5ak9+ZJUo8wY7JVPugS833w/SwpXTdREGWZvA4QqV2I5czC8zNhAratg33zoe2JqtRFl1S/FUeZTUy8pVG8HclVm3PBdjYRJzSrvzpzad8VSs7D2sTjSipIVbvgfqAnrflyC7NA18GDe4/tk9X7xACc9EXuUkIq/sIWWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516173; c=relaxed/simple;
	bh=3/qOwLmLse1jcJWo7VdV7+8vsXqXlSzoLckIVTPe8NE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NduuUoOcDDJ678HuHI1JuOw0k3YxMQf5xlESmyftTMzlAq3FdQOm+LHJ4WpI66jCj8L4ild7A/kWkFH9Smto6Vuh67EMUShwiAxxaOX/FvPLxvTCSFOT57OAn6bGhKRrwFyJUBnsZn8883llyHu4K/b41TT8VPC7ZVgzlLC1cXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=swOtWBA2; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769516168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rw3Z5uz+wN/jKEhx+ggzBvOdjGW0IdrWnEXd8bGadDI=;
	b=swOtWBA2Pxw+VUT1PgETbtdgbPH5WgWUXEJQKmSqNUXZeFJybWNBgbHHDf61HMLS9e9X+A
	/UbuSve74Y3SLHsizfV5uZHvGuLEqftFCcCvnoYpdjbId1/fyXQalrb4sM1LqT6/gvYfsS
	kGfQpCcXFro2mJes4NEiytnYkfPcksE=
From: Qi Zheng <qi.zheng@linux.dev>
To: david@kernel.org,
	andreas@gaisler.com,
	richard.weiyang@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dev.jain@arm.com,
	ioworker0@gmail.com,
	linmag7@gmail.com,
	akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org,
	sparclinux@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 0/8] enable PT_RECLAIM on more 64-bit architectures
Date: Tue, 27 Jan 2026 20:12:53 +0800
Message-ID: <cover.1769515122.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4520-lists,linux-parisc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gaisler.com,gmail.com,infradead.org,arm.com,linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qi.zheng@linux.dev,linux-parisc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-parisc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bytedance.com:mid,bytedance.com:email,linux.dev:dkim]
X-Rspamd-Queue-Id: 2599F941C3
X-Rspamd-Action: no action

From: Qi Zheng <zhengqi.arch@bytedance.com>

Changes in v4:
 - convert __HAVE_ARCH_TLB_REMOVE_TABLE to CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE config
 - fix a WARN_ON_ONCE() on sparc64 (and on ppc)
   (reported by Andreas Larsson)
 - collect Acked-by (Hi David, I've kept your Acked-by, feel free to drop it)
 - rebase onto the v6.19-rc7

Changes in v3:
 - modify the commit message in [PATCH v3 1/7] (suggested by David Hildenbrand)
 - make PT_RECLAIM depends on MMU_GATHER_RCU_TABLE_FREE instead of 64BIT
 - collect Acked-by
 - rebase onto the next-20251217

Changelog in v2:
 - fix compilation errors (reported by Magnus Lindholm and kernel test robot)
 - adjust some code style (suggested by Huacai Chen)
 - make PT_RECLAIM user-unselectable (suggested by David Hildenbrand)
 - rebase onto the next-20251119

Hi all,

This series aims to enable PT_RECLAIM on more 64-bit architectures.

On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of empty PTE
page table pages (such as 100GB+). To resolve this problem, we need to enable
PT_RECLAIM, which depends on MMU_GATHER_RCU_TABLE_FREE.

For these architectures that define its own __tlb_remove_table(), since
their page tables are not of type struct ptdesc, they cannot be supported
PT_RECLAIM.

Therefore, this series first enables MMU_GATHER_RCU_TABLE_FREE on all 64-bit
architectures, then converts __HAVE_ARCH_TLB_REMOVE_TABLE to
CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE config, and finally makes PT_RECLAIM depend on
MMU_GATHER_RCU_TABLE_FREE && !HAVE_ARCH_TLB_REMOVE_TABLE. This way, PT_RECLAIM
can be enabled by default on most 64-bit architectures.

Of course, this will also be enabled on some 32-bit architectures that already
support MMU_GATHER_RCU_TABLE_FREE. That's fine, PT_RECLAIM works well on all
32-bit architectures as well. Although the benefit isn't significant, there's
still memory that can be reclaimed. Perhaps PT_RECLAIM can be enabled on all
32-bit architectures in the future.

Comments and suggestions are welcome!

Thanks,
Qi

Qi Zheng (8):
  mm: change mm/pt_reclaim.c to use asm/tlb.h instead of
    asm-generic/tlb.h
  alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
  LoongArch: mm: enable MMU_GATHER_RCU_TABLE_FREE
  mips: mm: enable MMU_GATHER_RCU_TABLE_FREE
  parisc: mm: enable MMU_GATHER_RCU_TABLE_FREE
  um: mm: enable MMU_GATHER_RCU_TABLE_FREE
  mm: convert __HAVE_ARCH_TLB_REMOVE_TABLE to
    CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE config
  mm: make PT_RECLAIM depends on MMU_GATHER_RCU_TABLE_FREE

 arch/alpha/Kconfig                   | 1 +
 arch/alpha/include/asm/tlb.h         | 6 +++---
 arch/loongarch/Kconfig               | 1 +
 arch/loongarch/include/asm/pgalloc.h | 7 +++----
 arch/mips/Kconfig                    | 1 +
 arch/mips/include/asm/pgalloc.h      | 7 +++----
 arch/parisc/Kconfig                  | 1 +
 arch/parisc/include/asm/tlb.h        | 4 ++--
 arch/powerpc/Kconfig                 | 1 +
 arch/powerpc/include/asm/tlb.h       | 1 -
 arch/sparc/Kconfig                   | 1 +
 arch/sparc/include/asm/tlb_64.h      | 1 -
 arch/um/Kconfig                      | 1 +
 arch/x86/Kconfig                     | 1 -
 include/asm-generic/tlb.h            | 2 +-
 mm/Kconfig                           | 8 +++-----
 mm/pt_reclaim.c                      | 2 +-
 17 files changed, 23 insertions(+), 23 deletions(-)

-- 
2.20.1



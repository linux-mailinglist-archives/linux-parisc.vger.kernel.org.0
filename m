Return-Path: <linux-parisc+bounces-775-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EC586ED65
	for <lists+linux-parisc@lfdr.de>; Sat,  2 Mar 2024 01:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA4461C216AD
	for <lists+linux-parisc@lfdr.de>; Sat,  2 Mar 2024 00:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749AC566A;
	Sat,  2 Mar 2024 00:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FcWH7i7t"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92734C8A;
	Sat,  2 Mar 2024 00:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709338648; cv=none; b=KFkOsfDNRTeI/xnTsDENBPCe1yNfFbx6DRQT+WMjstArFSa/1A3khgbDzqEL1GsxrnXkdk1KMdP/IoZNRl7Vjy6Z9iVj2Dgxz2PQ4RwS+j3TwhYn3E6q0BRshrYSpKQchafoRzYMmVbcplKDh0Ye9fWJyFNi0w+vAL3zZ3sLK68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709338648; c=relaxed/simple;
	bh=3hMVgixo/NzVAIWvSYpcIeRTae91ax+vYJxNK3dNb9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mw1ojP+wjEn2oGtU15YH40WL7Pu/iCXTQn7iSX8h3tgjHUnOU78xBZAA0Y/WW9+SOirrpz67ps/Si5TQ2ZjLinwusrwS6T0PdtprpdeJ5znAT2UbGmyGcCVz3DdCKsqebiLQzY5y/NpBTb9Pxs2Hw9wMne7EmvogzrLI/qc5vLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FcWH7i7t; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709338646; x=1740874646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3hMVgixo/NzVAIWvSYpcIeRTae91ax+vYJxNK3dNb9g=;
  b=FcWH7i7ttVaJ57ddCw1AyK27+u56GIRITBhX9PwYmLSFcFROthpe500z
   JrHm+SVQRdtxA+oo3KC04zekaeUlC8eW6UwSBSnInb5ISACZygLF1DF1/
   UqJm7MmcUBy7sr95XoZAnYhjct7RLloQtc+wspoQQM4WAKh2+OKJcoN/N
   ClFGQzqDHaGTc91hyiebLdD0rOITMB7Eq+r5fjUIcMj/DgDDO+ddVZTFS
   I1VJliesebCioDZcUYicF1Ol0czOf3M+Oahkr9KaMqajLs4/denmfUPaU
   WNNYhj0XZ82tggyHXw9ll4cwQLFjOZPqoiAK+bmIepoRf7mclDEMZDzof
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7715734"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="7715734"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 16:17:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8495973"
Received: from thwood-mobl1.amr.corp.intel.com (HELO rpedgeco-desk4.intel.com) ([10.251.7.75])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 16:17:25 -0800
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: rick.p.edgecombe@intel.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	bp@alien8.de,
	broonie@kernel.org,
	dave.hansen@linux.intel.com,
	debug@rivosinc.com,
	hpa@zytor.com,
	keescook@chromium.org,
	kirill.shutemov@linux.intel.com,
	luto@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	sparclinux@vger.kernel.org,
	tglx@linutronix.de,
	x86@kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
Subject: [RFC v2.1 06/12] parisc: Use initializer for struct vm_unmapped_area_info
Date: Fri,  1 Mar 2024 16:17:08 -0800
Message-Id: <20240302001714.674091-6-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240302001714.674091-1-rick.p.edgecombe@intel.com>
References: <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <20240302001714.674091-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Future changes will need to add a new member to struct
vm_unmapped_area_info. This would cause trouble for any call site that
doesn't initialize the struct. Currently every caller sets each field
manually, so if new fields are added they will be unitialized and the core
code parsing the struct will see garbage in the new field.

It could be possible to initialize the new field manually to 0 at each
call site. This and a couple other options were discussed, and the
consensus (see links) was that in general the best way to accomplish this
would be via static initialization with designated field initiators.
Having some struct vm_unmapped_area_info instances not zero initialized
will put those sites at risk of feeding garbage into vm_unmapped_area() if
the convention is to zero initialize the struct and any new field addition
misses a call site that initializes each field manually.

It could be possible to leave the code mostly untouched, and just change
the line:
struct vm_unmapped_area_info info
to:
struct vm_unmapped_area_info info = {};

However, that would leave cleanup for the fields that are manually set
to zero, as it would no longer be required.

So to be reduce the chance of bugs via uninitialized fields, instead
simply continue the process to initialize the struct this way tree wide.
This will zero any unspecified members. Move the field initializers to the
struct declaration when they are known at that time. Leave the fields out
that were manually initialized to zero, as this would be redundant for
designated initializers.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Link: https://lore.kernel.org/lkml/202402280912.33AEE7A9CF@keescook/#t
Link: https://lore.kernel.org/lkml/j7bfvig3gew3qruouxrh7z7ehjjafrgkbcmg6tcghhfh3rhmzi@wzlcoecgy5rs/
---
Hi,

This patch was split and refactored out of a tree-wide change [0] to just
zero-init each struct vm_unmapped_area_info. The overall goal of the
series is to help shadow stack guard gaps. Currently, there is only one
arch with shadow stacks, but two more are in progress. It is 0day tested
only.

Thanks,

Rick

[0] https://lore.kernel.org/lkml/20240226190951.3240433-6-rick.p.edgecombe@intel.com/
---
 arch/parisc/kernel/sys_parisc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index 98af719d5f85..1f0b60766aac 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -104,7 +104,9 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	struct vm_area_struct *vma, *prev;
 	unsigned long filp_pgoff;
 	int do_color_align;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {
+		.length = len
+	};
 
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
@@ -139,7 +141,6 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 			return addr;
 	}
 
-	info.length = len;
 	info.align_mask = do_color_align ? (PAGE_MASK & (SHM_COLOUR - 1)) : 0;
 	info.align_offset = shared_align_offset(filp_pgoff, pgoff);
 
-- 
2.34.1



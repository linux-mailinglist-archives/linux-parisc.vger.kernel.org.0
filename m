Return-Path: <linux-parisc+bounces-2190-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D82967ED1
	for <lists+linux-parisc@lfdr.de>; Mon,  2 Sep 2024 07:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B76DE1F214D0
	for <lists+linux-parisc@lfdr.de>; Mon,  2 Sep 2024 05:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AFC1547C6;
	Mon,  2 Sep 2024 05:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="owCC+s+6"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D19144D0A
	for <linux-parisc@vger.kernel.org>; Mon,  2 Sep 2024 05:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725255111; cv=none; b=X5KXd+m1/ifDm8ZgfDpFfuoqXttwSosXiaHtZ0nUdX6kWYXRSaDCQ81RxFClLprLNN7UCfugd+rroNzDMPYneAocZPoAI02noT2IeOt9FxXlmEeX523SOKaCZ5M185DMpmzEjBXNvhPSPUOoUjVcxfH1YjW+1PIBSSXsgQuhxb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725255111; c=relaxed/simple;
	bh=Q7cfUD0xE+Etw31ngKTFcFdjMIVZjmy76Ww6nw1tPQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQ1PhEtVjzxVXql7+u3/axRQ/f9o15yk3Y4Z45+MZMltralTjiQGObgcyvCnotIAU4cH8hvO46KQ4phxs7MIqRtvewSTR1Gg9VFbKPibZ7Nm+IC9NpK3H3UJZO1axCbe+pcWfdzFOP0it8X9+6D/mSYtG7+c6pR58fZeq6l4YWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=owCC+s+6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7174a3baf92so67558b3a.1
        for <linux-parisc@vger.kernel.org>; Sun, 01 Sep 2024 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725255109; x=1725859909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56VTu/qXLVL5nMG+uXbgMEcYFDCqL3Blag2bpSCjYxk=;
        b=owCC+s+6e4aL4/7TQvNhkEGvAAmSOimjxLERp5zYSkgnasaZ/aCrtYItPoPJTrgKi3
         SxsyMK/4rB+DE1XUXvWC1lBzyxd8woS7gmfo/KSIEK2VhUOMV58xZ0ujNKiIs62WmQex
         P5HWHbOBxqu4c1FJgyWCUHUxORozYRfJj6uSzoYgpSbdzFp0XjSpURFuGWZ9LLIjWFAw
         mlpOVZZhVP+zUGppykkf0UDSD/MvPbyRP6iqYdjg+FUvlABwpN+kBlHWLrTPGqgF1sFs
         ihtE//IHdGsHbovs17Aci5E1zAGR3TFuy+BELHv4i2OdF1V0PYhr60QSCz1CTt/AlsGp
         LO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725255109; x=1725859909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56VTu/qXLVL5nMG+uXbgMEcYFDCqL3Blag2bpSCjYxk=;
        b=sWxFHS9g36I5gg83iQtBqLT8WgwfEVLjy3sWM8KXKRVs9QQFhrMjM+kTZ3lxrgs2Pb
         /Tv/XRWyVhZiWmDjyVCkg08OUwVukdoyU9CL0DqFzxdepcygee/Wr38p6sc/WgWnrFao
         LWDvevWVDzBvpB/uMmARjr+hzpJBCIPADyHf4sprATYSZdmBWeINFwTUmLgNHN2Q2awT
         kXx/yzqMLxPShQ8GOg36Ri3ckyNF3oRBtsMazSrlKWngqx4Qwm/7Ro0BstbHzM4BGOG4
         8lOM8KkQHeqio0njXP5kwW9ieXxy+9ODs8JA8gVv1NWoyMliIBo7rjBiyMguN2BH87t4
         ysvg==
X-Forwarded-Encrypted: i=1; AJvYcCV9W44mbJIBHlT/ESL3pi4OPjXd1YZeIi5MwDkfGD8qJJLdGC5nZcXmo2CsxByZaW38e3S9Jue5naqjN7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj+WUiE8vg7t/DvRpDiDWcedIRWlp95Avc/y+f03wbenny/P2w
	TWWpLODkc4oWe6vLP7H+PU5l4cWoglfT7rAuwDlYe91oSxQMJ7F32Kc8Q7hUXNY=
X-Google-Smtp-Source: AGHT+IHP9EQ25y63/ZmPp8u38IbeoRt/KYiwtSvqUDmg44wFA6t/ROSaOYVvZchoffP9nEa6l2KaPg==
X-Received: by 2002:a05:6a00:1a8e:b0:714:21c2:efb5 with SMTP id d2e1a72fcca58-717305d65acmr5552903b3a.1.1725255108509;
        Sun, 01 Sep 2024 22:31:48 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::901f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a692fsm6076279b3a.60.2024.09.01.22.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 22:31:48 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org,
	kernel-team@fb.com
Subject: [PATCH 1/2] mm: rename copy_from_kernel_nofault_allowed() to copy_kernel_nofault_allowed()
Date: Sun,  1 Sep 2024 22:31:28 -0700
Message-ID: <c50815dee5c244274e880b0fc4253deaf72b9165.1725223574.git.osandov@fb.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725223574.git.osandov@fb.com>
References: <cover.1725223574.git.osandov@fb.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

All of the existing checks are applicable to both the "from" and "to"
directions, and the next patch needs it for copy_to_kernel_nofault().

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 arch/arm/mm/fault.c         | 2 +-
 arch/loongarch/mm/maccess.c | 2 +-
 arch/mips/mm/maccess.c      | 2 +-
 arch/parisc/lib/memcpy.c    | 2 +-
 arch/powerpc/mm/maccess.c   | 2 +-
 arch/um/kernel/maccess.c    | 2 +-
 arch/x86/mm/maccess.c       | 4 ++--
 include/linux/uaccess.h     | 2 +-
 mm/maccess.c                | 7 +++----
 9 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ab01b51de559..3fef0a59af4f 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -27,7 +27,7 @@
 
 #ifdef CONFIG_MMU
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	unsigned long addr = (unsigned long)unsafe_src;
 
diff --git a/arch/loongarch/mm/maccess.c b/arch/loongarch/mm/maccess.c
index 58173842c6be..70012ac0a5a8 100644
--- a/arch/loongarch/mm/maccess.c
+++ b/arch/loongarch/mm/maccess.c
@@ -3,7 +3,7 @@
 #include <linux/uaccess.h>
 #include <linux/kernel.h>
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	/* highest bit set means kernel space */
 	return (unsigned long)unsafe_src >> (BITS_PER_LONG - 1);
diff --git a/arch/mips/mm/maccess.c b/arch/mips/mm/maccess.c
index 58173842c6be..70012ac0a5a8 100644
--- a/arch/mips/mm/maccess.c
+++ b/arch/mips/mm/maccess.c
@@ -3,7 +3,7 @@
 #include <linux/uaccess.h>
 #include <linux/kernel.h>
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	/* highest bit set means kernel space */
 	return (unsigned long)unsafe_src >> (BITS_PER_LONG - 1);
diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index 5fc0c852c84c..78758b9a0f49 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -48,7 +48,7 @@ void * memcpy(void * dst,const void *src, size_t count)
 
 EXPORT_SYMBOL(memcpy);
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	if ((unsigned long)unsafe_src < PAGE_SIZE)
 		return false;
diff --git a/arch/powerpc/mm/maccess.c b/arch/powerpc/mm/maccess.c
index ea821d0ffe16..e0f4c394836c 100644
--- a/arch/powerpc/mm/maccess.c
+++ b/arch/powerpc/mm/maccess.c
@@ -7,7 +7,7 @@
 #include <asm/inst.h>
 #include <asm/ppc-opcode.h>
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	return is_kernel_addr((unsigned long)unsafe_src);
 }
diff --git a/arch/um/kernel/maccess.c b/arch/um/kernel/maccess.c
index 8ccd56813f68..3497148e9aa5 100644
--- a/arch/um/kernel/maccess.c
+++ b/arch/um/kernel/maccess.c
@@ -7,7 +7,7 @@
 #include <linux/kernel.h>
 #include <os.h>
 
-bool copy_from_kernel_nofault_allowed(const void *src, size_t size)
+bool copy_kernel_nofault_allowed(const void *src, size_t size)
 {
 	void *psrc = (void *)rounddown((unsigned long)src, PAGE_SIZE);
 
diff --git a/arch/x86/mm/maccess.c b/arch/x86/mm/maccess.c
index 42115ac079cf..be28eda2c0b0 100644
--- a/arch/x86/mm/maccess.c
+++ b/arch/x86/mm/maccess.c
@@ -6,7 +6,7 @@
 #include <asm/vsyscall.h>
 
 #ifdef CONFIG_X86_64
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	unsigned long vaddr = (unsigned long)unsafe_src;
 
@@ -36,7 +36,7 @@ bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 	return __is_canonical_address(vaddr, boot_cpu_data.x86_virt_bits);
 }
 #else
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	return (unsigned long)unsafe_src >= TASK_SIZE_MAX;
 }
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index d8e4105a2f21..297a02b2bd53 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -387,7 +387,7 @@ copy_struct_from_user(void *dst, size_t ksize, const void __user *src,
 	return 0;
 }
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size);
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size);
 
 long copy_from_kernel_nofault(void *dst, const void *src, size_t size);
 long notrace copy_to_kernel_nofault(void *dst, const void *src, size_t size);
diff --git a/mm/maccess.c b/mm/maccess.c
index 518a25667323..72e9c03ea37f 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -7,8 +7,7 @@
 #include <linux/uaccess.h>
 #include <asm/tlb.h>
 
-bool __weak copy_from_kernel_nofault_allowed(const void *unsafe_src,
-		size_t size)
+bool __weak copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	return true;
 }
@@ -28,7 +27,7 @@ long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
 	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
 		align = (unsigned long)dst | (unsigned long)src;
 
-	if (!copy_from_kernel_nofault_allowed(src, size))
+	if (!copy_kernel_nofault_allowed(src, size))
 		return -ERANGE;
 
 	pagefault_disable();
@@ -83,7 +82,7 @@ long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
 
 	if (unlikely(count <= 0))
 		return 0;
-	if (!copy_from_kernel_nofault_allowed(unsafe_addr, count))
+	if (!copy_kernel_nofault_allowed(unsafe_addr, count))
 		return -ERANGE;
 
 	pagefault_disable();
-- 
2.46.0



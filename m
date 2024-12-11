Return-Path: <linux-parisc+bounces-3006-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E39EDB93
	for <lists+linux-parisc@lfdr.de>; Thu, 12 Dec 2024 00:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A50B5168AD8
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Dec 2024 23:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A361FF1A0;
	Wed, 11 Dec 2024 23:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jdn9oz7v"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9C91F3D54
	for <linux-parisc@vger.kernel.org>; Wed, 11 Dec 2024 23:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959704; cv=none; b=dKU19jQIU7ja1GvluPoTHeWNfb8h2CNesM3wo+KWECxhynkGdUrO0o4+LTdqUaQ4CvfudDo7XY6jLaGb/IUNyaNSn6q6CKhb2f0jGM4lGtupkQ/2Ra+Tcw4tCxc+cVCTXz6vCL7PeqVrkWC4GXDeZe3slP2r4/KFTeGsdmQKRIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959704; c=relaxed/simple;
	bh=t20Jm0mocAcK7lQ29shtI55Q6k8DV8IzFPooZ89HtI8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oyIkBq/C30IgvDCyY4t5UYPxUvZkpYWW+JJhjkRAYJRhZSIsybASm1cRC5w0H5VTUakhucm6216h6FJj0oHngcFu603SRrGy6tXyfunpPEAJ5dQrJwJZCyTGPs1KWZwkUDMuNh3IxPJAAIu0jzzUoikkrXDEQX2o4CvSVnCFzMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jdn9oz7v; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-728eb2e190cso13262b3a.3
        for <linux-parisc@vger.kernel.org>; Wed, 11 Dec 2024 15:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959701; x=1734564501; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UgF7uGjYnhvUd+Jp5od3s3bWQayM3Oz+R04wRikqyig=;
        b=jdn9oz7vQF1zkP0hokK9Ur/G9iVbtEDdXqbpxPL+YFh/9/tH5hE70Y1hhPgLboWEGW
         FDnZ98S05qO21xK1GC8H9UVf2zwwLN5PCAkDjUaUxWTUVwIRt+gzszEMOuRfmXHEmGe2
         od96ykr4B/SNxkmo8w1j9iqGmLZk04ktr+GY+nXzRHST+QP9Splbi+jkDxN4ROCPFAhN
         wneV51QJFj2tmwrGq297aNPbUeKQ+wf+2RMMB7S24UwRVAsF6zoSyoozYpK+d65F9W8Y
         d0zwWvxTkmJPLSYgWubMXwJzbpd4rDK72vk4QURRTTyAoV0rWikxHZMpqXU6WKTBfkth
         R96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959701; x=1734564501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UgF7uGjYnhvUd+Jp5od3s3bWQayM3Oz+R04wRikqyig=;
        b=Bb3gAus7PqnZIMRzYDqx4JXAT8tdJ7JeYNqSTQyRwq+yAzkSz+eKz4hk1A0TQiHIyO
         XHVW6ImULqzrtVs6XLi5X/NxYPRgmIHIcyScTVP/qlxRJcH+MMeIJ+sGJfFEm0Inpvid
         sGKzel3mkEh8rtZOIqnRMv3Tt3YQuTiD0Yd7ryi1F0P4eamKeEL7wqTrfVOny9lAgoPV
         1gIsitnuCwuQRMHEt0FD7F4834HzHLU3592f8bpz70RflewDiueU910wUXjiNiRXIjHH
         5+8AFOlDxE+BfXfetRi9brO3rBa0jfVlJOAXD0aTDXYVua12I0wv/K6+bfT4EHWc/sY9
         +tDw==
X-Forwarded-Encrypted: i=1; AJvYcCXcdL2dSxEqIvk2pv+RWV7TTBr8Li9UVzUfyYOWhl+DTHlZ+gTuq/BCCl4PpnRJsMQ5PNVfBCWSAltAaew=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmPx3+6813tMzMY0MsfrKlmlm32/FImcsOL7QnIJPGhsIxpEf2
	ia5xA9TwqNd51LAczXJOt2hvxBFXtgyvXatatqC5+2XWc5V7vSjD+Mic9Mxy6s7PoupgiCKYIBz
	iOfl2oyE6NQEIshW1bBxL/Q==
X-Google-Smtp-Source: AGHT+IFqVvEP6jzHMp67taGtKGZyTqxXNFEg2GPfnpgGUKbuvSmZTqL3vNpWjeuOs0OQEe1804BSml5OhCqqS6mIfw==
X-Received: from pfbdw6.prod.google.com ([2002:a05:6a00:3686:b0:725:d2c1:3f5f])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:43ac:b0:1e1:9fef:e974 with SMTP id adf61e73a8af0-1e1ceb34d58mr1527638637.24.1733959700835;
 Wed, 11 Dec 2024 15:28:20 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:50 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-13-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 12/16] mm: sparc32: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce sparc32 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/sparc/include/asm/pgtable_32.h |  1 +
 arch/sparc/kernel/sys_sparc_32.c    | 33 +++++++++++++++++++----------
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 62bcafe38b1f..95084c4d0b01 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -437,6 +437,7 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 
 /* We provide our own get_unmapped_area to cope with VA holes for userland */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #define pmd_pgtable(pmd)	((pgtable_t)__pmd_page(pmd))
 
diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
index fb31bc0c5b48..0cc717755417 100644
--- a/arch/sparc/kernel/sys_sparc_32.c
+++ b/arch/sparc/kernel/sys_sparc_32.c
@@ -40,13 +40,17 @@ SYSCALL_DEFINE0(getpagesize)
 	return PAGE_SIZE; /* Possibly older binaries want 8192 on sun4's? */
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct vm_unmapped_area_info info = {};
-	bool file_hugepage = false;
+	bool file_hugepage;
+
+	/* See asm-sparc/uaccess.h */
+	if (len > TASK_SIZE - PAGE_SIZE)
+		return -ENOMEM;
 
-	if (filp && is_file_hugepages(filp))
-		file_hugepage = true;
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -58,14 +62,21 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 		return addr;
 	}
 
-	/* See asm-sparc/uaccess.h */
-	if (len > TASK_SIZE - PAGE_SIZE)
-		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
+				     unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+{
+	struct vm_unmapped_area_info info = {};
+	bool file_hugepage = false;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
-	info.low_limit = addr;
+	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = TASK_SIZE;
 	if (!file_hugepage) {
 		info.align_mask = (flags & MAP_SHARED) ?
-- 
2.47.0.338.g60cca15819-goog



Return-Path: <linux-parisc+bounces-2966-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2C9EA551
	for <lists+linux-parisc@lfdr.de>; Tue, 10 Dec 2024 03:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FB8A2851EE
	for <lists+linux-parisc@lfdr.de>; Tue, 10 Dec 2024 02:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DD11A7271;
	Tue, 10 Dec 2024 02:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RO3MhUgo"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F7715853B
	for <linux-parisc@vger.kernel.org>; Tue, 10 Dec 2024 02:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798488; cv=none; b=Ozhwa7RgELEkJRtKNeBuHkuzvWEWCQFMXz3FU/Fahw3PhwOw7Gv+OP61Dn69Vw6YxEWmZ+oS8GpXvZkC+6npBTtLYL7iLyRsqxuE03cE5baH/zOeGzW9523ilCaluxkuInptel8PpTcG6jrr9V2ze4QT/KPJB6zmvvbzTMybmKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798488; c=relaxed/simple;
	bh=mpvxmscjVgbLdO7cK/zBkRD+gPYja4DIS+1NwMw48+c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aS85mtaj7A7Pkss6rnJ+JySOKal1mJ1pXSwOL1YLXR2OCjtf5E4MdVagaSwqUB6uar8KLuPy5Nb6vsLpULjhWlFpKoO9EwwKM8Y09J3ZqwOtU0Lp0OUw9UIEdvA/pTbWNb79gGbI3FPNDaiFzSRW+mYgFi0muJ0FvMHnPhscFj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RO3MhUgo; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7fd5777a6aaso708123a12.0
        for <linux-parisc@vger.kernel.org>; Mon, 09 Dec 2024 18:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798486; x=1734403286; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nXKIsvWsBBTYmcaRz8JoUa2+7Qpfg8xMl3r7PMmLvBk=;
        b=RO3MhUgoR5UKfJbZrNhAamwAxSNLn400l5sVDkmIx7KrADm+xT+F7EcjyrYktCWnJk
         CBjVZrA5YI/HW/Dwlzzotd8ot5dtVMIxR2IIkh+huII2ClRZ9EfsF1MaoUxSX6Vk5xu+
         /g5OZdj3oMFhSIQ1jtWKB+C7wXU/nBYobQUyhGoEDpRs/dr7E95mPqE/wJiuIcFRjv7c
         9rtR2bPVjedeUBimzBBvhK5mQpmJy9NNhNpa0D4+bXpPXsfwjk7bCmDzsqnXWyEULJfg
         dv66lD8MeLoQZetunNloBBBwcXSmmxtcMaK9XJ9RR6NzXPldlp113tmd4PqZ16iXZqMS
         wuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798486; x=1734403286;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXKIsvWsBBTYmcaRz8JoUa2+7Qpfg8xMl3r7PMmLvBk=;
        b=TKgGDAOdqgvrmGAnYcZeh10by97zzV+pjM9wZ0E2z0uNBe88U+cLUHGSvl4XhnMUmu
         FTJNigUvwfJyZJqXXcLdSLD0+0JN++1/3px78WIiHRFu5htLiAq4ZMgHX2egA+bngagl
         p4hrThT1t5cNAQCI7p7AzApAf/NDJEzpJL5CaRkyLkJlLPV/cMW5JuAgxWAJWeTY87Le
         BvZw3oMUyP/oNHRlOjcu/gLJkW/KhHfSITVcGnWgkyaGY26+68Lc/DWUjqBf30Zr7ETN
         YMFpEBxFwlBUbG8L9WG1UUnhdX+qzWwS604pHeM2CWtZ2p+LW64+UO4+SqwQh/QPe2Jq
         6UsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkJ2jZIKgdYpEyylxtOuNUwxAd61r7jLc9PlwH0MmzKaoqt3B87e4Ixb352cRkax5x5Pr31PN2M+p94Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywag9xfSV9bpkDZsMERQZ8DI28pEUY7WZhfpxQuqZMPiNwCekz2
	UNop1kky5coxUc2zSo9jeAQYrUufNkbUz3szNsP8QHNPSLWdOqGs/NxHhARhgPYrRpLlX1zdWnx
	c9DYHDNUIPk3Nwwud+Xk9/A==
X-Google-Smtp-Source: AGHT+IEes4vFC8x7oz2PD6CyRh4s+tzg2fdn8MPTeQEnOJJBB4JDPOzOCc3jB91eMpzo0BdpMiIRvdYY+YmWIeDh+w==
X-Received: from pfau15.prod.google.com ([2002:a05:6a00:aa8f:b0:728:2357:646a])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7483:b0:1e1:adb8:c011 with SMTP id adf61e73a8af0-1e1b4435999mr2770722637.18.1733798485628;
 Mon, 09 Dec 2024 18:41:25 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:03 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-2-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 01/17] mm: Introduce generic_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
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

Consolidate the hint searches from both direcitons (topdown and
bottomup) into generic_mmap_hint().

No functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 include/linux/sched/mm.h |  4 ++++
 mm/mmap.c                | 45 ++++++++++++++++++++++++----------------
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 928a626725e6..edeec19d1708 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -201,6 +201,10 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
 					   unsigned long flags,
 					   vm_flags_t vm_flags);
 
+unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
+				unsigned long len, unsigned long pgoff,
+				unsigned long flags);
+
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
diff --git a/mm/mmap.c b/mm/mmap.c
index df9154b15ef9..e97eb8bf4889 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -620,6 +620,27 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 	return addr;
 }
 
+unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
+				unsigned long len, unsigned long pgoff,
+				unsigned long flags)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma, *prev;
+	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
+
+	if (!addr)
+		return 0;
+
+	addr = PAGE_ALIGN(addr);
+	vma = find_vma_prev(mm, addr, &prev);
+	if (mmap_end - len >= addr && addr >= mmap_min_addr &&
+	    (!vma || addr + len <= vm_start_gap(vma)) &&
+	    (!prev || addr >= vm_end_gap(prev)))
+		return addr;
+
+	return 0;
+}
+
 /* Get an address range which is currently unmapped.
  * For shmat() with addr=0.
  *
@@ -637,7 +658,6 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev;
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
@@ -647,14 +667,9 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (flags & MAP_FIXED)
 		return addr;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma_prev(mm, addr, &prev);
-		if (mmap_end - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)) &&
-		    (!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
@@ -685,7 +700,6 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
 				  unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
@@ -698,14 +712,9 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 		return addr;
 
 	/* requesting a specific address */
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma_prev(mm, addr, &prev);
-		if (mmap_end - len >= addr && addr >= mmap_min_addr &&
-				(!vma || addr + len <= vm_start_gap(vma)) &&
-				(!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog



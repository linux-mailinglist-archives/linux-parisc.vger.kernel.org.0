Return-Path: <linux-parisc+bounces-3881-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E19BB3DE1A
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 11:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FB3C166826
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 09:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B05311C14;
	Mon,  1 Sep 2025 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="bvXILkrN"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B10310652
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718383; cv=none; b=jxXUvoKC2uTSaF5JrfEsB+ZD3lSg4tXO4NzQymbYVM+/kIJfrPLeyEKKjoqrApdknWKSEvDpZhTrXt3abqTSxtP4RN8tp/meQ0Ms7tHaWrcyI/V7WMQmZmXXv61DV3Cigqf+wA6Pu7NfpSkml/ooYvD0xc6ifJLAZ5bd7xNGRrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718383; c=relaxed/simple;
	bh=uXMLbFhyoXEiykxIiSBUl0vvIPZ/h/Sian5jKI4U6Xs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lfmR9941qisE1LeCWV/x5KNlK01pmrxpWmatCiX26IyPdTZeoKgAB15Za7eQ0ONHZeZkbVY5mzIb+bOqsEOWzdU5YN5uRjloQf2cm/IQVAi5N2Zz3xcTUH5bX2Yo2POpHTBx1Smi3ilr7P/AZ0TMwVu77LTrXhuxLjdofE0zpAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=bvXILkrN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b0428b537e5so125796966b.3
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 02:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756718379; x=1757323179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyTvV8Ns7WO4gxFocxj6W6Ayk33Z4Ny3qHSpu0QqE7M=;
        b=bvXILkrNKJ9CqNHp3B7XaALGsBblAN9/vjfvqocNVxbtIcy81D3BPM7FnO69o8l8jE
         qPtQLvLE4cGqVwgm9v88Ejamhwsdv3g/uvMUrqzBA2yIKLdubjX5Qd3RGyuEO9k1cr6k
         ln8as/3xuj36e9ljmuXGsX468kNq7dpmq2NaWM+wE0SQrrjb18c4zA3OhGVsO9wBAMii
         JEXb/UDeR1Nl7opyFaezEot3ygshVJNjXdBDEXYOMUXEhCuQ4VCKj3M/PVFS5dytP09Y
         CGv48oMT9TXvAnFkyF+lZtfaOz6zQ7A4YZXmHEi9By6Xvh/FkCby79vLCMjF7D+XcOaA
         nsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756718379; x=1757323179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyTvV8Ns7WO4gxFocxj6W6Ayk33Z4Ny3qHSpu0QqE7M=;
        b=daLDKneW+9AmWXhmmS3Owd8kTiRmY9s4nXDkkWzW/nBIYkbHvKf+suwf5qETa0LD//
         5Tmqn2VkQclaCWx+rm9RAqToJZ2BOfbFFvbeROh/KV0TIwWNqyFFMxdp6LOyZkb8GfOB
         rU05k12WJXUwAunsaeUvJ1X08QwHvMKVUWQuRFsUjBf+gr5yWZ2ORuxRWEAzFrqnllB1
         E7I+CCeceuLdOfhTswq+e+vxvvcS2Gx0NYtpHMnjyAPTvGe+NVPnJjc3Kiwu1HfabtiE
         uJ0fhIOHSiJO56BiT3diZrZ5RJd/0zcDkWiBecaPC9GVUCc8aJcynaDe8wcEc5YWKBt0
         xkpA==
X-Forwarded-Encrypted: i=1; AJvYcCXS5A45mrjFBMJYZy+aiTE494RM2pAxpHJ8JNQA/5HmH8LNPiZ2PagdRHHXXq8F1Dnl6uNop/rr1nSLVoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcRbtTmd3FSFAIXkQPri+9nAUSxlpiaBETDAcS04t1AjTpBv4E
	f+va+cAsxkdJwhq9dqOuDyMWwZcw+ffdS82GDIQDijV64MIP1pAvQjSfgR9v9G3QN5g=
X-Gm-Gg: ASbGncu8+Bbs1ekbGMlWlCMivGmiy3zBV0jERP1ixnV6BX7Ev/ZpibZlYxCa4B50Wqf
	iz+Ha61TBA4Blka0VBpmKvOiFyoYj6QY5+jL3qFPvoQbeKS1Qd19uKg1uJpncPyGKhcpUSmNWK3
	L2AYZzCYE4PmNOuFYISPUkE8gittgkqxFBJsh9Crrq1EInwVmTyNBQpuLB+Uc4K67qzi5tb0SGx
	oCT2l45E+KLbsQ15SQAZQ/3LNQcPG7x0Njyps+xJqM4R/c4qAMbhwG9BBhSHk3XnepmCJfVgNt1
	/ROgCv96IZYrwGHO+fOy1TfBGp6r1nAe/4P+2x6+bMB39iOsLOVi+4Z3DFG7nFOKJANgbG82AZa
	dUk++9d0v/azLJdPHWN7K4RgrCvuHI+Lufyt5iRhvh1zNyELsL0mY5hDWdioHbX9rs7aNSaBErJ
	BTEGCkgZTYX7Uh+ui9Kac4gAHgtKHgwue3
X-Google-Smtp-Source: AGHT+IFURNncMT6SvBoURvT042bjNg1LI6qShCkJRT6YVDiOMF2e2u0BBNq2L9LyHNh03wQZAbf6oA==
X-Received: by 2002:a17:907:3f10:b0:af6:2f1d:a73f with SMTP id a640c23a62f3a-b01d976e782mr721360666b.53.1756718378728;
        Mon, 01 Sep 2025 02:19:38 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f1d0f00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1d:f00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm541005766b.12.2025.09.01.02.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:19:38 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	axelrasmussen@google.com,
	yuanchu@google.com,
	willy@infradead.org,
	hughd@google.com,
	mhocko@suse.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	vishal.moola@gmail.com,
	linux@armlinux.org.uk,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	weixugc@google.com,
	baolin.wang@linux.alibaba.com,
	rientjes@google.com,
	shakeel.butt@linux.dev,
	max.kellermann@ionos.com,
	thuth@redhat.com,
	broonie@kernel.org,
	osalvador@suse.de,
	jfalempe@redhat.com,
	mpe@ellerman.id.au,
	nysal@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v4 08/12] mm/util, s390, sparc, x86: add const to arch_pick_mmap_layout() parameter
Date: Mon,  1 Sep 2025 11:19:11 +0200
Message-ID: <20250901091916.3002082-9-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901091916.3002082-1-max.kellermann@ionos.com>
References: <20250901091916.3002082-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory management (mm) subsystem is a fundamental low-level component
of the Linux kernel. Establishing const-correctness at this foundational
level enables higher-level subsystems, such as filesystems and drivers,
to also adopt const-correctness in their interfaces. This patch lays
the groundwork for broader const-correctness throughout the kernel
by starting with the core mm subsystem.

This patch adds const qualifiers to mm_struct and rlimit pointer
parameters in arch_pick_mmap_layout() across multiple architectures,
improving type safety and enabling compiler optimizations.

Functions improved:
- arch_pick_mmap_layout() (s390, sparc, x86, and generic mm/util.c)
- mmap_base() (x86)

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/s390/mm/mmap.c              | 5 +++--
 arch/sparc/kernel/sys_sparc_64.c | 3 ++-
 arch/x86/mm/mmap.c               | 7 ++++---
 include/linux/sched/mm.h         | 4 ++--
 mm/util.c                        | 9 ++++++---
 5 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index c0f619fb9ab3..a47c7133d82a 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -47,7 +47,7 @@ static unsigned long mmap_base_legacy(unsigned long rnd)
 }
 
 static inline unsigned long mmap_base(unsigned long rnd,
-				      struct rlimit *rlim_stack)
+				      const struct rlimit *const rlim_stack)
 {
 	unsigned long gap = rlim_stack->rlim_cur;
 	unsigned long pad = stack_maxrandom_size() + stack_guard_gap;
@@ -169,7 +169,8 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
  * This function, called very early during the creation of a new
  * process VM image, sets up which VM layout function to use:
  */
-void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
+void arch_pick_mmap_layout(struct mm_struct *const mm,
+			   const struct rlimit *const rlim_stack)
 {
 	unsigned long random_factor = 0UL;
 
diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index 785e9909340f..1c243bb461b2 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -294,7 +294,8 @@ static unsigned long mmap_rnd(void)
 	return rnd << PAGE_SHIFT;
 }
 
-void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
+void arch_pick_mmap_layout(struct mm_struct *const mm,
+			   const struct rlimit *const rlim_stack)
 {
 	unsigned long random_factor = mmap_rnd();
 	unsigned long gap;
diff --git a/arch/x86/mm/mmap.c b/arch/x86/mm/mmap.c
index 708f85dc9380..13bde4ba2f24 100644
--- a/arch/x86/mm/mmap.c
+++ b/arch/x86/mm/mmap.c
@@ -80,7 +80,7 @@ unsigned long arch_mmap_rnd(void)
 }
 
 static unsigned long mmap_base(unsigned long rnd, unsigned long task_size,
-			       struct rlimit *rlim_stack)
+			       const struct rlimit *const rlim_stack)
 {
 	unsigned long gap = rlim_stack->rlim_cur;
 	unsigned long pad = stack_maxrandom_size(task_size) + stack_guard_gap;
@@ -110,7 +110,7 @@ static unsigned long mmap_legacy_base(unsigned long rnd,
  */
 static void arch_pick_mmap_base(unsigned long *base, unsigned long *legacy_base,
 		unsigned long random_factor, unsigned long task_size,
-		struct rlimit *rlim_stack)
+		const struct rlimit *const rlim_stack)
 {
 	*legacy_base = mmap_legacy_base(random_factor, task_size);
 	if (mmap_is_legacy())
@@ -119,7 +119,8 @@ static void arch_pick_mmap_base(unsigned long *base, unsigned long *legacy_base,
 		*base = mmap_base(random_factor, task_size, rlim_stack);
 }
 
-void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
+void arch_pick_mmap_layout(struct mm_struct *const mm,
+			   const struct rlimit *const rlim_stack)
 {
 	if (mmap_is_legacy())
 		mm_flags_clear(MMF_TOPDOWN, mm);
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 2201da0afecc..0232d983b715 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -178,7 +178,7 @@ static inline void mm_update_next_owner(struct mm_struct *mm)
 #endif
 
 extern void arch_pick_mmap_layout(struct mm_struct *mm,
-				  struct rlimit *rlim_stack);
+				  const struct rlimit *rlim_stack);
 
 unsigned long
 arch_get_unmapped_area(struct file *filp, unsigned long addr,
@@ -211,7 +211,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long flags, vm_flags_t vm_flags);
 #else
 static inline void arch_pick_mmap_layout(struct mm_struct *mm,
-					 struct rlimit *rlim_stack) {}
+					 const struct rlimit *rlim_stack) {}
 #endif
 
 static inline bool in_vfork(struct task_struct *tsk)
diff --git a/mm/util.c b/mm/util.c
index f5a35efba7bf..24f08217cd95 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -431,7 +431,8 @@ static int mmap_is_legacy(const struct rlimit *const rlim_stack)
 #define MIN_GAP		(SZ_128M)
 #define MAX_GAP		(STACK_TOP / 6 * 5)
 
-static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
+static unsigned long mmap_base(const unsigned long rnd,
+			       const struct rlimit *const rlim_stack)
 {
 #ifdef CONFIG_STACK_GROWSUP
 	/*
@@ -462,7 +463,8 @@ static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
 #endif
 }
 
-void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
+void arch_pick_mmap_layout(struct mm_struct *const mm,
+			   const struct rlimit *const rlim_stack)
 {
 	unsigned long random_factor = 0UL;
 
@@ -478,7 +480,8 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
 	}
 }
 #elif defined(CONFIG_MMU) && !defined(HAVE_ARCH_PICK_MMAP_LAYOUT)
-void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
+void arch_pick_mmap_layout(struct mm_struct *const mm,
+			   const struct rlimit *const rlim_stack)
 {
 	mm->mmap_base = TASK_UNMAPPED_BASE;
 	mm_flags_clear(MMF_TOPDOWN, mm);
-- 
2.47.2



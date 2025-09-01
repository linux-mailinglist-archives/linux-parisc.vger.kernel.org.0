Return-Path: <linux-parisc+bounces-3909-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ABAB3E33D
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 14:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CFA51889079
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 12:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88AD34F47B;
	Mon,  1 Sep 2025 12:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Xmq5iXXL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510834DCD3
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729862; cv=none; b=EjABpe+hHo2K6459WJViYisqeZFLh9ApY1uHdymam3g20M/pUeVfLQQviKaPabbLZAZj8/dlD3DxaTpNJVPpNv1Ui9vsVOwp7Whc7UE5Em7hglFA3/tj1z7K9KJX2fDFG9arUIvjRBgEvk7+rfOeGbtCRh+4hQA+39leeVFmBVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729862; c=relaxed/simple;
	bh=LvAENzmkEUNEOpyXvR50vI0BsrVpoXTDUBb1MGeImjM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNOjtqxzAGL5qs4Cf5cHuQllL86eRN3153FXvah2nl8qeqCgq46oKwp5Q/TLHsSosZ4oZTjLcHM0BG6VV+440Yx9EjkQkCOaxz88VXfDPm/sqTFsmdxMfxJXKrxDZwkuILbpnpsjjQGcr6eNQoDzs+1HiBdwQgfYIE8JAkd7bVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Xmq5iXXL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6188b793d21so5211992a12.3
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 05:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756729858; x=1757334658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBIjmGwuQfdaUaluJIvLRQBK4PGjY6jwjN1piFQcysw=;
        b=Xmq5iXXLcUKF64lRagu9t1I93kuzhbEzkPhTXeNoEcluUJ0mxME80/vHR66YABlyPj
         q9QR/yWDn1QytEoqSiGLRtnZHA0tFmhjUfjyrL2mtHai4EzU/KasOJDVRVGSCv6WOeKj
         NFmX9+9i7h1sv7ndbJKxaAFJp54tHm+BSjfqC+SiDgQ+cTEMNfUHOvR/OghR+d9cf21S
         apmBokfygkkMrbkLeA3qYj5m7Muiz7+QCc09T6iXsRpx3/mWJoWcY0M9Z36bIWMfJ5pK
         2d8eofoMTzRCTO756KgpAtOdx2ai2DjdjSbBZAE/gYZQxnzwY/lbTIyzHAagNcg/9x/E
         jgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729858; x=1757334658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBIjmGwuQfdaUaluJIvLRQBK4PGjY6jwjN1piFQcysw=;
        b=fYAfFZRHeiLAC8IA7QIxkCkASy2lUA4bv1qH9BXCmPImNYFgLeK3dFplxGhsyxsG4a
         JR2Mir7hdrxRrxWYqpbNbz7JXIuNOghWxrAwOptkaJTQdKyllAyClXcAjxiHDTHGEZsv
         pa9wEVpqJJsRPjYbO3r2qAO9wXrECfpszJ4t5+PsC7fu3m8UY8+WHWuCXQ3nH/BptqDr
         4p9CWg/0MtYzpR6CSD5fRrN7BNZsfLHRd13/0udDn2E8rezxx5+STVcyT515AuemPNRm
         wqnMES4t68a3HELptEJolu4u/GK2m4yCsGs7+clZRn6sNaV7zvUjJqYzjoGDwU+gF/b/
         BYTA==
X-Forwarded-Encrypted: i=1; AJvYcCXy7pSnyHMhbbNU5x+UQFvtHTDrun3nQOmioQLOSs/B9A3Q+Qyn40eF5DevRsJO4ZETM+jNM4z+Zg5vo5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlcx9WsbZBGJhp0fW9FYmbvU8MOgsGVFs9J26JzB9n+D/1MSHf
	MKlbivmYg/7HKy+4zonYkNs1PgtpjsPajgyxvjl3lZ0/xDZmooDX5wALuxoHBGeuz8E=
X-Gm-Gg: ASbGnctgmfV1cvVN8KPOx4Iutnw/ozhsh+GppFqAnQ7CkmJboiEQS6vqGi+TnOTRQi0
	YreOfI3U0Tx+Cc5IXGmK/yUkcJyUqjuRWIGT3Ph6kl2b+lSPpZwe7dQjBP397Ht0X2ULJO8FpC/
	zikPY2pCPIsd8x/NvAk4ZO+2NfLCdeZTdTRkCtwUuFPfllhn8jaRquBGm6/FMzQMwGrRWeBmSnt
	4ntCWwqUn7MILuGkfqv05lUxhd0nAeZ6z+MynvXVWproqWBmrVnL3JTKWSbbRcgtp0M7MYfBmAh
	9umf/bTzTnDZtN678rjUjX5LEd9u6I01eR8YrDbg5EgcBxKo7nJ5l88OMC6yl/0bPwwNz2QUMi/
	t8ZVCTn9c8kk9AbJNClNbcSVYa+ovayfaoqcqp+Y9Cy/5DYgDOAUdLF477MhAG3f9CU1WvhDltL
	Tsoj3NGHKMsKTaj+eTv3hWmQPECHOqKJRv
X-Google-Smtp-Source: AGHT+IFiwGGkFlsym2WfGdbuIOc8JJYNdFhpv0BKkeSrtamBaCd4/FeUnocQUw4lZEglIaJHc8zMBQ==
X-Received: by 2002:a05:6402:2742:b0:61c:7ba9:8a3 with SMTP id 4fb4d7f45d1cf-61d269974dfmr6695910a12.3.1756729858122;
        Mon, 01 Sep 2025 05:30:58 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f1d0f00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1d:f00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61eaf5883b6sm255566a12.20.2025.09.01.05.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:30:57 -0700 (PDT)
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
Subject: [PATCH v5 12/12] mm: constify highmem related functions for improved const-correctness
Date: Mon,  1 Sep 2025 14:30:28 +0200
Message-ID: <20250901123028.3383461-13-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901123028.3383461-1-max.kellermann@ionos.com>
References: <20250901123028.3383461-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lots of functions in mm/highmem.c do not write to the given pointers
and do not call functions that take non-const pointers and can
therefore be constified.

This includes functions like kunmap() which might be implemented in a
way that writes to the pointer (e.g. to update reference counters or
mapping fields), but currently are not.

kmap() on the other hand cannot be made const because it calls
set_page_address() which is non-const in some
architectures/configurations.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/arm/include/asm/highmem.h    |  6 ++---
 arch/xtensa/include/asm/highmem.h |  2 +-
 include/linux/highmem-internal.h  | 44 +++++++++++++++++--------------
 include/linux/highmem.h           |  8 +++---
 mm/highmem.c                      | 10 +++----
 5 files changed, 37 insertions(+), 33 deletions(-)

diff --git a/arch/arm/include/asm/highmem.h b/arch/arm/include/asm/highmem.h
index b4b66220952d..023be74298f3 100644
--- a/arch/arm/include/asm/highmem.h
+++ b/arch/arm/include/asm/highmem.h
@@ -46,9 +46,9 @@ extern pte_t *pkmap_page_table;
 #endif
 
 #ifdef ARCH_NEEDS_KMAP_HIGH_GET
-extern void *kmap_high_get(struct page *page);
+extern void *kmap_high_get(const struct page *page);
 
-static inline void *arch_kmap_local_high_get(struct page *page)
+static inline void *arch_kmap_local_high_get(const struct page *page)
 {
 	if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM) && !cache_is_vivt())
 		return NULL;
@@ -57,7 +57,7 @@ static inline void *arch_kmap_local_high_get(struct page *page)
 #define arch_kmap_local_high_get arch_kmap_local_high_get
 
 #else /* ARCH_NEEDS_KMAP_HIGH_GET */
-static inline void *kmap_high_get(struct page *page)
+static inline void *kmap_high_get(const struct page *const page)
 {
 	return NULL;
 }
diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
index 34b8b620e7f1..473b622b863b 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -29,7 +29,7 @@
 
 #if DCACHE_WAY_SIZE > PAGE_SIZE
 #define get_pkmap_color get_pkmap_color
-static inline int get_pkmap_color(struct page *page)
+static inline int get_pkmap_color(const struct page *const page)
 {
 	return DCACHE_ALIAS(page_to_phys(page));
 }
diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
index 36053c3d6d64..442d0efea5c7 100644
--- a/include/linux/highmem-internal.h
+++ b/include/linux/highmem-internal.h
@@ -7,7 +7,7 @@
  */
 #ifdef CONFIG_KMAP_LOCAL
 void *__kmap_local_pfn_prot(unsigned long pfn, pgprot_t prot);
-void *__kmap_local_page_prot(struct page *page, pgprot_t prot);
+void *__kmap_local_page_prot(const struct page *page, pgprot_t prot);
 void kunmap_local_indexed(const void *vaddr);
 void kmap_local_fork(struct task_struct *tsk);
 void __kmap_local_sched_out(void);
@@ -33,11 +33,11 @@ static inline void kmap_flush_tlb(unsigned long addr) { }
 #endif
 
 void *kmap_high(struct page *page);
-void kunmap_high(struct page *page);
+void kunmap_high(const struct page *page);
 void __kmap_flush_unused(void);
 struct page *__kmap_to_page(void *addr);
 
-static inline void *kmap(struct page *page)
+static inline void *kmap(struct page *const page)
 {
 	void *addr;
 
@@ -50,7 +50,7 @@ static inline void *kmap(struct page *page)
 	return addr;
 }
 
-static inline void kunmap(struct page *page)
+static inline void kunmap(const struct page *const page)
 {
 	might_sleep();
 	if (!PageHighMem(page))
@@ -68,12 +68,12 @@ static inline void kmap_flush_unused(void)
 	__kmap_flush_unused();
 }
 
-static inline void *kmap_local_page(struct page *page)
+static inline void *kmap_local_page(const struct page *const page)
 {
 	return __kmap_local_page_prot(page, kmap_prot);
 }
 
-static inline void *kmap_local_page_try_from_panic(struct page *page)
+static inline void *kmap_local_page_try_from_panic(const struct page *const page)
 {
 	if (!PageHighMem(page))
 		return page_address(page);
@@ -81,13 +81,15 @@ static inline void *kmap_local_page_try_from_panic(struct page *page)
 	return NULL;
 }
 
-static inline void *kmap_local_folio(struct folio *folio, size_t offset)
+static inline void *kmap_local_folio(const struct folio *const folio,
+				     const size_t offset)
 {
-	struct page *page = folio_page(folio, offset / PAGE_SIZE);
+	const struct page *page = folio_page(folio, offset / PAGE_SIZE);
 	return __kmap_local_page_prot(page, kmap_prot) + offset % PAGE_SIZE;
 }
 
-static inline void *kmap_local_page_prot(struct page *page, pgprot_t prot)
+static inline void *kmap_local_page_prot(const struct page *const page,
+					 const pgprot_t prot)
 {
 	return __kmap_local_page_prot(page, prot);
 }
@@ -102,7 +104,7 @@ static inline void __kunmap_local(const void *vaddr)
 	kunmap_local_indexed(vaddr);
 }
 
-static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+static inline void *kmap_atomic_prot(const struct page *const page, const pgprot_t prot)
 {
 	if (IS_ENABLED(CONFIG_PREEMPT_RT))
 		migrate_disable();
@@ -113,7 +115,7 @@ static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 	return __kmap_local_page_prot(page, prot);
 }
 
-static inline void *kmap_atomic(struct page *page)
+static inline void *kmap_atomic(const struct page *const page)
 {
 	return kmap_atomic_prot(page, kmap_prot);
 }
@@ -167,38 +169,40 @@ static inline struct page *kmap_to_page(void *addr)
 	return virt_to_page(addr);
 }
 
-static inline void *kmap(struct page *page)
+static inline void *kmap(struct page *const page)
 {
 	might_sleep();
 	return page_address(page);
 }
 
-static inline void kunmap_high(struct page *page) { }
+static inline void kunmap_high(const struct page *const page) { }
 static inline void kmap_flush_unused(void) { }
 
-static inline void kunmap(struct page *page)
+static inline void kunmap(const struct page *const page)
 {
 #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
 	kunmap_flush_on_unmap(page_address(page));
 #endif
 }
 
-static inline void *kmap_local_page(struct page *page)
+static inline void *kmap_local_page(const struct page *const page)
 {
 	return page_address(page);
 }
 
-static inline void *kmap_local_page_try_from_panic(struct page *page)
+static inline void *kmap_local_page_try_from_panic(const struct page *const page)
 {
 	return page_address(page);
 }
 
-static inline void *kmap_local_folio(struct folio *folio, size_t offset)
+static inline void *kmap_local_folio(const struct folio *const folio,
+				     const size_t offset)
 {
 	return folio_address(folio) + offset;
 }
 
-static inline void *kmap_local_page_prot(struct page *page, pgprot_t prot)
+static inline void *kmap_local_page_prot(const struct page *const page,
+					 const pgprot_t prot)
 {
 	return kmap_local_page(page);
 }
@@ -215,7 +219,7 @@ static inline void __kunmap_local(const void *addr)
 #endif
 }
 
-static inline void *kmap_atomic(struct page *page)
+static inline void *kmap_atomic(const struct page *const page)
 {
 	if (IS_ENABLED(CONFIG_PREEMPT_RT))
 		migrate_disable();
@@ -225,7 +229,7 @@ static inline void *kmap_atomic(struct page *page)
 	return page_address(page);
 }
 
-static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+static inline void *kmap_atomic_prot(const struct page *const page, const pgprot_t prot)
 {
 	return kmap_atomic(page);
 }
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 6234f316468c..105cc4c00cc3 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -43,7 +43,7 @@ static inline void *kmap(struct page *page);
  * Counterpart to kmap(). A NOOP for CONFIG_HIGHMEM=n and for mappings of
  * pages in the low memory area.
  */
-static inline void kunmap(struct page *page);
+static inline void kunmap(const struct page *page);
 
 /**
  * kmap_to_page - Get the page for a kmap'ed address
@@ -93,7 +93,7 @@ static inline void kmap_flush_unused(void);
  * disabling migration in order to keep the virtual address stable across
  * preemption. No caller of kmap_local_page() can rely on this side effect.
  */
-static inline void *kmap_local_page(struct page *page);
+static inline void *kmap_local_page(const struct page *page);
 
 /**
  * kmap_local_folio - Map a page in this folio for temporary usage
@@ -129,7 +129,7 @@ static inline void *kmap_local_page(struct page *page);
  * Context: Can be invoked from any context.
  * Return: The virtual address of @offset.
  */
-static inline void *kmap_local_folio(struct folio *folio, size_t offset);
+static inline void *kmap_local_folio(const struct folio *folio, size_t offset);
 
 /**
  * kmap_atomic - Atomically map a page for temporary usage - Deprecated!
@@ -176,7 +176,7 @@ static inline void *kmap_local_folio(struct folio *folio, size_t offset);
  * kunmap_atomic(vaddr2);
  * kunmap_atomic(vaddr1);
  */
-static inline void *kmap_atomic(struct page *page);
+static inline void *kmap_atomic(const struct page *page);
 
 /* Highmem related interfaces for management code */
 static inline unsigned long nr_free_highpages(void);
diff --git a/mm/highmem.c b/mm/highmem.c
index ef3189b36cad..93fa505fcb98 100644
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -61,7 +61,7 @@ static inline int kmap_local_calc_idx(int idx)
 /*
  * Determine color of virtual address where the page should be mapped.
  */
-static inline unsigned int get_pkmap_color(struct page *page)
+static inline unsigned int get_pkmap_color(const struct page *const page)
 {
 	return 0;
 }
@@ -334,7 +334,7 @@ EXPORT_SYMBOL(kmap_high);
  *
  * This can be called from any context.
  */
-void *kmap_high_get(struct page *page)
+void *kmap_high_get(const struct page *const page)
 {
 	unsigned long vaddr, flags;
 
@@ -356,7 +356,7 @@ void *kmap_high_get(struct page *page)
  * If ARCH_NEEDS_KMAP_HIGH_GET is not defined then this may be called
  * only from user context.
  */
-void kunmap_high(struct page *page)
+void kunmap_high(const struct page *const page)
 {
 	unsigned long vaddr;
 	unsigned long nr;
@@ -508,7 +508,7 @@ static inline void kmap_local_idx_pop(void)
 #endif
 
 #ifndef arch_kmap_local_high_get
-static inline void *arch_kmap_local_high_get(struct page *page)
+static inline void *arch_kmap_local_high_get(const struct page *const page)
 {
 	return NULL;
 }
@@ -572,7 +572,7 @@ void *__kmap_local_pfn_prot(unsigned long pfn, pgprot_t prot)
 }
 EXPORT_SYMBOL_GPL(__kmap_local_pfn_prot);
 
-void *__kmap_local_page_prot(struct page *page, pgprot_t prot)
+void *__kmap_local_page_prot(const struct page *const page, const pgprot_t prot)
 {
 	void *kmap;
 
-- 
2.47.2



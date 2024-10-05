Return-Path: <linux-parisc+bounces-2487-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DED3991A71
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC8AC1F22325
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788C0130AC8;
	Sat,  5 Oct 2024 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBvBxve3"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB65D15884D
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158770; cv=none; b=Sn8GOoCo5cTPEGwrJjUPx/TuPpnanTxos8aW6tK5o4quM05AeVfLc8XPtGmmpinP5IwNkTi0evAO1HbQx8RgMA0GkVacvBWTPr7EpPtDPJ2EcwvS+FJL937VtuSsGWU/lnLKnsJqGjv8dScdSbfY+QNrY2BOBt7lPd6bQ0TGy5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158770; c=relaxed/simple;
	bh=4NVUV6YGGVu0dfDzUFRQNyxQmIfvN5ZZlTdwZgCxg+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnsOszN9O5v0kR0gPoKP56/Q9VdIl7L23DqT2VDsBGwo/9m60FBmkLDoQg76uuXiuMjR3K8E9mIOsK8twhpkF3NRbkPJIKM7ZxSpkLfhuwF70N+6zH8H3psUV4QPSgBwA1vSbROYvK9XSn7vNlOx3VZQiYqB6kBR99HPk8YLlb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBvBxve3; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso2137937a12.3
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158768; x=1728763568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSpIks7wgvzrdGiSzq/HYW4dr1jFM7gjMRozlRGemJM=;
        b=CBvBxve3AOd605pmn6pu7RU/ddkplixEz8+Hhd3gsbHgouPCysEAV/pJa2nVUGP6Q/
         4L2JJM2wW02k2KGFLnK14QXdlIrK6C7eGyaoTuQUjAS/EaJHjwVAFmB2+u3LTMoeqCLw
         hn+50hYDjFKEfvsGf/WR7NEaJlrWzoTNVrxOqfFHjWT4ziK1ITPydXMM4kreSFEFfP6z
         sJP6pIhCzt+CQi1SEEQz7H2GRO/ZaVKjlILkSUHa64yAyp60xQWWx3dPltFzkJBmKJI9
         LFbGAFh1BzTz8cGULpxJDsKR8hvjMlC4dInQdlHxkaOFtyAzCSvlMv2t9JQDyXcZARlm
         uaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158768; x=1728763568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSpIks7wgvzrdGiSzq/HYW4dr1jFM7gjMRozlRGemJM=;
        b=rmzTa0IgleT4i1se04WCDVhvd4YkiG/Ua4TBR7uL/vZlzRjR7ogsit2fKAU3CcD2rJ
         Nao7VFAJ3YEX5YibOn6dyUvdjojsv9wx42kbVDbEH0Z0Si7ern8zK7MYvUFqGYTHLCPk
         InNRSNgDFlEWF1sfDXLJOHLhT9PZJl56BlA5NEz0sHlx0mqzBlypOFUHAvU3A5PZl+jl
         AaUP7G1flstHWnc39RukUYdrEvoyIqBGNcafukZBUvj2npZgwS2jF3cr7wbFtq4y97HG
         E5HYvAVjUHxllHPDdz8I/U7mA6HHkqLigG2P7Vhi0BZm+qvO50fxAr4Pjp4WkISPxMfq
         z3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVN1dq/4956PWpjNyR5mSoNw/xDRjRAkp3Yywjhu6q9uTLe6Ji5Kzk8RKdJfMaNst7h/rbnsUaMkRtskAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YygDdRNk1UZ2GnArSXhPIE45fNwRqr+fMlkSEKS6A7lp1QlS3fr
	/l8EWl3MH2Iqx1E1LaYQ6otpwAv211Lm5oNw6n5APwjTHKKFCI+bfMl3nU1W3Og=
X-Google-Smtp-Source: AGHT+IEaeCLxh/V4FYDHhcizmCqrbA2X6RtS9JLzATD1GoweD02dQoKPmQSlloLgWaenfDYRsJ7amg==
X-Received: by 2002:a17:90a:a107:b0:2e0:7560:9334 with SMTP id 98e67ed59e1d1-2e1e636f75bmr8187622a91.36.1728158768046;
        Sat, 05 Oct 2024 13:06:08 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 07/21] accel/tcg: Use the tlb_fill_align hook
Date: Sat,  5 Oct 2024 13:05:46 -0700
Message-ID: <20241005200600.493604-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we have a tlb miss, defer the alignment check to
the new tlb_fill_align hook.  Move the existing alignment
check so that we only perform it with a tlb hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 89 +++++++++++++++++++++++++---------------------
 1 file changed, 49 insertions(+), 40 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4bc34c8a37..0e6ae65a39 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1616,14 +1616,14 @@ typedef struct MMULookupLocals {
  * tlb_fill will longjmp out.  Return true if the softmmu tlb for
  * @mmu_idx may have resized.
  */
-static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
+static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data, MemOp memop,
                         int mmu_idx, MMUAccessType access_type, uintptr_t ra)
 {
     vaddr addr = data->addr;
     uintptr_t index = tlb_index(cpu, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(cpu, mmu_idx, addr);
     uint64_t tlb_addr = tlb_read_idx(entry, access_type);
-    bool maybe_resized = false;
+    bool did_tlb_fill = false;
     CPUTLBEntryFull *full;
     int flags;
 
@@ -1631,17 +1631,26 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type,
                             addr & TARGET_PAGE_MASK)) {
-            bool ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, data->size,
-                                                 access_type, mmu_idx,
-                                                 false, ra);
+            bool ok = cpu->cc->tcg_ops->tlb_fill_align(cpu, addr, memop,
+                                                       data->size, access_type,
+                                                       mmu_idx, false, ra);
             assert(ok);
-            maybe_resized = true;
+            did_tlb_fill = true;
             index = tlb_index(cpu, mmu_idx, addr);
             entry = tlb_entry(cpu, mmu_idx, addr);
         }
         tlb_addr = tlb_read_idx(entry, access_type) & ~TLB_INVALID_MASK;
     }
 
+    if (!did_tlb_fill) {
+        /* We didn't use tlb_fill_align, so alignment not yet checked. */
+        unsigned a_bits = memop_alignment_bits(memop);
+
+        if (unlikely(addr & ((1 << a_bits) - 1))) {
+            cpu_unaligned_access(cpu, addr, access_type, mmu_idx, ra);
+        }
+    }
+
     full = &cpu->neg.tlb.d[mmu_idx].fulltlb[index];
     flags = tlb_addr & (TLB_FLAGS_MASK & ~TLB_FORCE_SLOW);
     flags |= full->slow_flags[access_type];
@@ -1651,7 +1660,7 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
     /* Compute haddr speculatively; depending on flags it might be invalid. */
     data->haddr = (void *)((uintptr_t)addr + entry->addend);
 
-    return maybe_resized;
+    return did_tlb_fill;
 }
 
 /**
@@ -1702,7 +1711,6 @@ static void mmu_watch_or_dirty(CPUState *cpu, MMULookupPageData *data,
 static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
                        uintptr_t ra, MMUAccessType type, MMULookupLocals *l)
 {
-    unsigned a_bits;
     bool crosspage;
     int flags;
 
@@ -1711,12 +1719,6 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
 
     tcg_debug_assert(l->mmu_idx < NB_MMU_MODES);
 
-    /* Handle CPU specific unaligned behaviour */
-    a_bits = memop_alignment_bits(l->memop);
-    if (addr & ((1 << a_bits) - 1)) {
-        cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
-    }
-
     l->page[0].addr = addr;
     l->page[0].size = memop_size(l->memop);
     l->page[1].addr = (addr + l->page[0].size - 1) & TARGET_PAGE_MASK;
@@ -1724,7 +1726,7 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     crosspage = (addr ^ l->page[1].addr) & TARGET_PAGE_MASK;
 
     if (likely(!crosspage)) {
-        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
+        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
 
         flags = l->page[0].flags;
         if (unlikely(flags & (TLB_WATCHPOINT | TLB_NOTDIRTY))) {
@@ -1743,8 +1745,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
          * Lookup both pages, recognizing exceptions from either.  If the
          * second lookup potentially resized, refresh first CPUTLBEntryFull.
          */
-        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
-        if (mmu_lookup1(cpu, &l->page[1], l->mmu_idx, type, ra)) {
+        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
+        if (mmu_lookup1(cpu, &l->page[1], 0, l->mmu_idx, type, ra)) {
             uintptr_t index = tlb_index(cpu, l->mmu_idx, addr);
             l->page[0].full = &cpu->neg.tlb.d[l->mmu_idx].fulltlb[index];
         }
@@ -1770,7 +1772,7 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
      * Device memory type require alignment.
      */
     if (unlikely(flags & TLB_CHECK_ALIGNED)) {
-        a_bits = memop_atomicity_bits(l->memop);
+        unsigned a_bits = memop_atomicity_bits(l->memop);
         if (addr & ((1 << a_bits) - 1)) {
             cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
         }
@@ -1788,34 +1790,18 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
 {
     uintptr_t mmu_idx = get_mmuidx(oi);
     MemOp mop = get_memop(oi);
-    int a_bits = memop_alignment_bits(mop);
     uintptr_t index;
     CPUTLBEntry *tlbe;
     vaddr tlb_addr;
     void *hostaddr;
     CPUTLBEntryFull *full;
+    bool did_tlb_fill = false;
 
     tcg_debug_assert(mmu_idx < NB_MMU_MODES);
 
     /* Adjust the given return address.  */
     retaddr -= GETPC_ADJ;
 
-    /* Enforce guest required alignment.  */
-    if (unlikely(a_bits > 0 && (addr & ((1 << a_bits) - 1)))) {
-        /* ??? Maybe indicate atomic op to cpu_unaligned_access */
-        cpu_unaligned_access(cpu, addr, MMU_DATA_STORE,
-                             mmu_idx, retaddr);
-    }
-
-    /* Enforce qemu required alignment.  */
-    if (unlikely(addr & (size - 1))) {
-        /* We get here if guest alignment was not requested,
-           or was not enforced by cpu_unaligned_access above.
-           We might widen the access and emulate, but for now
-           mark an exception and exit the cpu loop.  */
-        goto stop_the_world;
-    }
-
     index = tlb_index(cpu, mmu_idx, addr);
     tlbe = tlb_entry(cpu, mmu_idx, addr);
 
@@ -1824,10 +1810,11 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, MMU_DATA_STORE,
                             addr & TARGET_PAGE_MASK)) {
-            bool ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, size,
-                                                 MMU_DATA_STORE, mmu_idx,
-                                                 false, retaddr);
+            bool ok = cpu->cc->tcg_ops->tlb_fill_align(cpu, addr, mop, size,
+                                                       MMU_DATA_STORE, mmu_idx,
+                                                       false, retaddr);
             assert(ok);
+            did_tlb_fill = true;
             index = tlb_index(cpu, mmu_idx, addr);
             tlbe = tlb_entry(cpu, mmu_idx, addr);
         }
@@ -1841,8 +1828,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
      * but addr_read will only be -1 if PAGE_READ was unset.
      */
     if (unlikely(tlbe->addr_read == -1)) {
-        cpu->cc->tcg_ops->tlb_fill(cpu, addr, size, MMU_DATA_LOAD,
-                                   mmu_idx, false, retaddr);
+        cpu->cc->tcg_ops->tlb_fill_align(cpu, addr, mop, size, MMU_DATA_LOAD,
+                                         mmu_idx, false, retaddr);
         /*
          * Since we don't support reads and writes to different
          * addresses, and we do have the proper page loaded for
@@ -1850,6 +1837,28 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
          */
         g_assert_not_reached();
     }
+
+    /* Enforce guest required alignment, if not handled by tlb_fill_align. */
+    if (!did_tlb_fill) {
+        int a_bits = memop_alignment_bits(mop);
+        if (unlikely(a_bits > 0 && (addr & ((1 << a_bits) - 1)))) {
+            /* ??? Maybe indicate atomic op to cpu_unaligned_access */
+            cpu_unaligned_access(cpu, addr, MMU_DATA_STORE,
+                                 mmu_idx, retaddr);
+        }
+    }
+
+    /* Enforce qemu required alignment.  */
+    if (unlikely(addr & (size - 1))) {
+        /*
+         * We get here if guest alignment was not requested,
+         * or was not enforced by cpu_unaligned_access above.
+         * We might widen the access and emulate, but for now
+         * mark an exception and exit the cpu loop.
+         */
+        goto stop_the_world;
+    }
+
     /* Collect tlb flags for read. */
     tlb_addr |= tlbe->addr_read;
 
-- 
2.43.0



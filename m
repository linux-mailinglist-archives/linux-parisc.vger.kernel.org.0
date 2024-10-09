Return-Path: <linux-parisc+bounces-2599-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23212995BFA
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75FA0B23983
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F112736D;
	Wed,  9 Oct 2024 00:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wxn6wbLT"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B79801
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432303; cv=none; b=Uu1JfDqYsAzpZoNLaZE87ViTWb/6gaW+nGOx6aE82XvPaFC+0sHDZc4uv110Q6JGF5eAkF27eg9J2NiBpWThd1GX9MAqIk8CPyVcx4GCIU/RGxQ7MczphZT+jU3qzhFZJT4Ms56NAwZOFELQrW2Seb45iGhdpOEcJ8itxlByJC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432303; c=relaxed/simple;
	bh=JaamhqcjfOsrDiJPcnSELA9aOocOLFsRVupkPPO7N2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kvvm4a9huGWVNn0NSAhCyia5jiNhhuSgr6MvNZWx/n1zv+rukWcks3iG2C4Ov7zemX3oimj+pipySVoC489pyyvOSuIHt4kPK43VgNF+cFNAD9aCLT+KZaY4CNS2TOoJ04aCCq2W/w9LHQRk3XG10mzCwW4abkujc5YzdI/UNeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wxn6wbLT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b90984971so64136335ad.3
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432301; x=1729037101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dFojoXE4+jjskAlQVsQMp2S+E0WFZ4r9iQmpRIn1e0=;
        b=Wxn6wbLTqNhFqJYbli39iwnGnH2zUGVEG4tPHnZ01wh5c2NTkdncNiVmZTpyKwvI32
         jQESycETlvT7+n7ZTklZPN/tcYIPbNroq1X+wEKMiEny3WYPw62vJPZTZpHoTy1ReNcz
         zMcaLhzJ5oyHs7U/HoqFjtB8L1VOBThCnYyyMA1oW+fwajojl8vHQmT9hNiK9wlx5DrL
         trtkobOezilU/iQowcZJ+SU55Zjut7FYfUp/wiK6XP0Q3fXa/O64yOSs7gaa8kOIbPUo
         kjSecx8zCspVrN75Y4aiEWNfAR1ya49Gz0rKRzv2QB5LwutF32qGwLVM8atVBX6IYx2z
         Yy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432301; x=1729037101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dFojoXE4+jjskAlQVsQMp2S+E0WFZ4r9iQmpRIn1e0=;
        b=KZjyF82ET3xxSAROhEGlXWVP8cgnGayX5lqJXOi4n2pK+SKaofAr6RxsSKmop7QSm4
         P74XE0Xaa4hL8K7uIxCu7y+8sYMQjlHlU3bsP747GczOitoBDlzIL+XfTjbF1sU92atP
         JcaU7OVSCv5kN8Lm5Kf7lNPAfeGxhMa1lTZBquVIq+2hanqpJPlhzoLq30MGCyksiNj8
         9fNQytRtRxR7qK036/67F9EWPUeVsUqI9nq1Pz2bY/uFnqKWMojAl8iEKVdLS323mhzk
         FiMSauadZlzynp8+sAOQhLqkKjbV/kAHZrLQUeM1ak4n1gMT9Mw490hkOnyoMQCUsxYK
         hvPg==
X-Forwarded-Encrypted: i=1; AJvYcCWJrNpQ4yWdnYCETmbu1OeKP1L6ynLVyR3zypjnNtzL8o/3sBR20fMnZRvJq4NdTWTSnj2pUuJmhqmKVYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrJumyVKsYs0UVxDAoFozh19jcHt1sgTL11v3MaXR7WXqZJ3di
	XPfQhKhpCQFp64DtIDgs9PkCP1TJXbHmxUpKE7uvnREOseB/vXPF4TeQRcQhlkU=
X-Google-Smtp-Source: AGHT+IEqHXg8mWURHcAfVqAuEFw3SPebibRlwH8KpqMvpctboOYhLIxxyQyaRkxFDrswJJ24vV5qqA==
X-Received: by 2002:a17:903:32d0:b0:205:810a:190a with SMTP id d9443c01a7336-20c636f44famr10016545ad.2.1728432301297;
        Tue, 08 Oct 2024 17:05:01 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 06/20] accel/tcg: Use the alignment test in tlb_fill_align
Date: Tue,  8 Oct 2024 17:04:39 -0700
Message-ID: <20241009000453.315652-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
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
 accel/tcg/cputlb.c | 88 ++++++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 43 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index d72f454e9e..b76a4eac4e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1620,6 +1620,7 @@ typedef struct MMULookupLocals {
  * mmu_lookup1: translate one page
  * @cpu: generic cpu state
  * @data: lookup parameters
+ * @memop: memory operation for the access, or 0
  * @mmu_idx: virtual address context
  * @access_type: load/store/code
  * @ra: return address into tcg generated code, or 0
@@ -1629,7 +1630,7 @@ typedef struct MMULookupLocals {
  * tlb_fill_align will longjmp out.  Return true if the softmmu tlb for
  * @mmu_idx may have resized.
  */
-static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
+static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data, MemOp memop,
                         int mmu_idx, MMUAccessType access_type, uintptr_t ra)
 {
     vaddr addr = data->addr;
@@ -1645,7 +1646,7 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type,
                             addr & TARGET_PAGE_MASK)) {
             tlb_fill_align(cpu, addr, access_type, mmu_idx,
-                           0, data->size, false, ra);
+                           memop, data->size, false, ra);
             maybe_resized = true;
             index = tlb_index(cpu, mmu_idx, addr);
             entry = tlb_entry(cpu, mmu_idx, addr);
@@ -1657,6 +1658,25 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
     flags = tlb_addr & (TLB_FLAGS_MASK & ~TLB_FORCE_SLOW);
     flags |= full->slow_flags[access_type];
 
+    if (likely(!maybe_resized)) {
+        /* Alignment has not been checked by tlb_fill_align. */
+        int a_bits = memop_alignment_bits(memop);
+
+        /*
+         * This alignment check differs from the one above, in that this is
+         * based on the atomicity of the operation. The intended use case is
+         * the ARM memory type field of each PTE, where access to pages with
+         * Device memory type require alignment.
+         */
+        if (unlikely(flags & TLB_CHECK_ALIGNED)) {
+            int at_bits = memop_atomicity_bits(memop);
+            a_bits = MAX(a_bits, at_bits);
+        }
+        if (unlikely(addr & ((1 << a_bits) - 1))) {
+            cpu_unaligned_access(cpu, addr, access_type, mmu_idx, ra);
+        }
+    }
+
     data->full = full;
     data->flags = flags;
     /* Compute haddr speculatively; depending on flags it might be invalid. */
@@ -1713,7 +1733,6 @@ static void mmu_watch_or_dirty(CPUState *cpu, MMULookupPageData *data,
 static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
                        uintptr_t ra, MMUAccessType type, MMULookupLocals *l)
 {
-    unsigned a_bits;
     bool crosspage;
     int flags;
 
@@ -1722,12 +1741,6 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
 
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
@@ -1735,7 +1748,7 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     crosspage = (addr ^ l->page[1].addr) & TARGET_PAGE_MASK;
 
     if (likely(!crosspage)) {
-        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
+        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
 
         flags = l->page[0].flags;
         if (unlikely(flags & (TLB_WATCHPOINT | TLB_NOTDIRTY))) {
@@ -1754,8 +1767,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
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
@@ -1774,19 +1787,6 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
         tcg_debug_assert((flags & TLB_BSWAP) == 0);
     }
 
-    /*
-     * This alignment check differs from the one above, in that this is
-     * based on the atomicity of the operation. The intended use case is
-     * the ARM memory type field of each PTE, where access to pages with
-     * Device memory type require alignment.
-     */
-    if (unlikely(flags & TLB_CHECK_ALIGNED)) {
-        a_bits = memop_atomicity_bits(l->memop);
-        if (addr & ((1 << a_bits) - 1)) {
-            cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
-        }
-    }
-
     return crosspage;
 }
 
@@ -1799,34 +1799,18 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
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
 
@@ -1836,7 +1820,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
         if (!victim_tlb_hit(cpu, mmu_idx, index, MMU_DATA_STORE,
                             addr & TARGET_PAGE_MASK)) {
             tlb_fill_align(cpu, addr, MMU_DATA_STORE, mmu_idx,
-                           0, size, false, retaddr);
+                           mop, size, false, retaddr);
+            did_tlb_fill = true;
             index = tlb_index(cpu, mmu_idx, addr);
             tlbe = tlb_entry(cpu, mmu_idx, addr);
         }
@@ -1859,6 +1844,23 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
          */
         g_assert_not_reached();
     }
+
+    /* Enforce guest required alignment, if not handled by tlb_fill_align. */
+    if (!did_tlb_fill && (addr & ((1 << memop_alignment_bits(mop)) - 1))) {
+        cpu_unaligned_access(cpu, addr, MMU_DATA_STORE, mmu_idx, retaddr);
+    }
+
+    /* Enforce qemu required alignment.  */
+    if (unlikely(addr & (size - 1))) {
+        /*
+         * We get here if guest alignment was not requested, or was not
+         * enforced by cpu_unaligned_access or tlb_fill_align above.
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



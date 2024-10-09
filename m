Return-Path: <linux-parisc+bounces-2598-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF5995BF8
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 178CAB23A21
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CBB163;
	Wed,  9 Oct 2024 00:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jF2WV2i2"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA85A383
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432302; cv=none; b=d3BNkEM+Omg6kLxwB0BldPpu9T185TGR0Hmvz+7nBvH5ShmbbTLmpH0Y2tDQ+3YNixZVGER6vX7JZYvJqPwzsCWLE0yE2p7gDimkLfliK1y+lD0gFdA4SUG+25HoeUdbxkEeivB128YGPnzUf63dL581whhUZAlmmEqxZDejplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432302; c=relaxed/simple;
	bh=tgGF/7beY7hrwgznY4FXToX4WNlmLl9Ww7iwIdlH7Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6oBuzsOBs6kNQIM+i3oHZHvlinmDhw3j7zrzmUZlj1oARlipOulc5GgGZydtNrvuDxQhzBrXp4Z58sX7+1Zgg7Pk0I3sK0jejrKgamlBe9qTZ/fFGvvWILceWuTZ9NLPZNooffkR0yZ7C/KpuUUJiqkc1OA5z4UHpD/Cj65bx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jF2WV2i2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20b0b2528d8so70927565ad.2
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432300; x=1729037100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRlC3mms3e9Sb+Qb/UGEoW53IughvKHiILVrUessrrs=;
        b=jF2WV2i2+T7xDbiJNED6vxZW7FmsDs1MjmHcp1Fw+8tjfNklBYBWLT0z+v3GVm12+R
         He/TZvvRPoZSLCGlsPxkcWdXIWtF7lvE/uC2PlULsRwhbsrRzHLRzQJpgq2aM0WSUjjr
         cwnF1nx/YslTas3xtOm7ik9/X2LPJPpviz+rQO6PfKcLDPeoVpL3hkiNJuciAnCESM2Q
         XBjUlMjNWTchdxhuPUWAOqMQWqI5WZtRoBkScjZFC8PPJrz3bk5FlQK3B74sy6of7r8T
         HUKFG55tEM98RVjHbQ7FuBVZd1whCkr2yrV7d02bqbPZwijM6lmaCC8EkvMPDdTNLVCX
         0RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432300; x=1729037100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRlC3mms3e9Sb+Qb/UGEoW53IughvKHiILVrUessrrs=;
        b=B1UBu9whZRlD7XmaR4ip4kjRsDine2VAwkA1lVi5f7jdOC6YcRnsYZVggGxsKbKMxl
         tO+syR1YrV/wJuYoSVMEzx5qfnf4tJFUIbwvR16xAblWP65uMv7KvaQevPPh0Wfy2f+j
         oOkxUE7ZjHMbyxyVh7Pb431XGPes0qaicb3aysIbSWpzC7FGGbIjVdELazuTEJtepT+f
         0SoHa3P387D34Uh/zpALGDzkVoaInXcWfF9Hy/OStGxjkyNc/b+LNeQfhiEjzum/bApE
         v0srwx4odKVWuf3/3an9hhvuVjs8xhuYtFLlYvPE5oXaLgf3tEoxUW9SPppIryZIKndB
         a0iw==
X-Forwarded-Encrypted: i=1; AJvYcCXN2uoL6czVsb+sQJ/sV1JBWI/5DQfDe48B/OnULbz7UivsX54lO7eQGZAW0EucB8Gx6skp9Z0L9HQhpAI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd3dQytTb6mYK2lTLMZNIQXBp0N0bC7/+iZW3WLhXjkyoI2Ug+
	K51VCdzOjj0yg/BV4b4a2lfvW++DAGtK5H2lKmWJlnB9Wh5tgpMrhxQtz2NexLE=
X-Google-Smtp-Source: AGHT+IFCFvVKxRyLlvfGXYLtSu9ozN9PdneS174Hz9Cj7lMpmt/cbo6+LfjS0UmFUu6tz4mWEHkH6A==
X-Received: by 2002:a17:903:98b:b0:208:b468:db21 with SMTP id d9443c01a7336-20c63748357mr13630815ad.30.1728432299990;
        Tue, 08 Oct 2024 17:04:59 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 05/20] accel/tcg: Add TCGCPUOps.tlb_fill_align
Date: Tue,  8 Oct 2024 17:04:38 -0700
Message-ID: <20241009000453.315652-6-richard.henderson@linaro.org>
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

Add a new callback to handle softmmu paging.  Return the page
details directly, instead of passing them indirectly to
tlb_set_page.  Handle alignment simultaneously with paging so
that faults are handled with target-specific priority.

Route all calls the two hooks through a tlb_fill_align
function local to cputlb.c.

As yet no targets implement the new hook.
As yet cputlb.c does not use the new alignment check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h         |  4 +--
 include/hw/core/tcg-cpu-ops.h | 26 +++++++++++++++
 include/qemu/typedefs.h       |  1 +
 accel/tcg/cputlb.c            | 61 ++++++++++++++++++++++-------------
 4 files changed, 67 insertions(+), 25 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 04e9ad4996..d21a24c82f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -205,7 +205,7 @@ struct CPUClass {
  * so the layout is not as critical as that of CPUTLBEntry. This is
  * also why we don't want to combine the two structs.
  */
-typedef struct CPUTLBEntryFull {
+struct CPUTLBEntryFull {
     /*
      * @xlat_section contains:
      *  - in the lower TARGET_PAGE_BITS, a physical section number
@@ -261,7 +261,7 @@ typedef struct CPUTLBEntryFull {
             bool guarded;
         } arm;
     } extra;
-} CPUTLBEntryFull;
+};
 
 /*
  * Data elements that are per MMU mode, minus the bits accessed by
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 34318cf0e6..c932690621 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -13,6 +13,7 @@
 #include "exec/breakpoint.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
+#include "exec/memop.h"
 #include "exec/mmu-access-type.h"
 #include "exec/vaddr.h"
 
@@ -131,6 +132,31 @@ struct TCGCPUOps {
      * same function signature.
      */
     bool (*cpu_exec_halt)(CPUState *cpu);
+    /**
+     * @tlb_fill_align: Handle a softmmu tlb miss
+     * @cpu: cpu context
+     * @out: output page properties
+     * @addr: virtual address
+     * @access_type: read, write or execute
+     * @mmu_idx: mmu context
+     * @memop: memory operation for the access
+     * @size: memory access size, or 0 for whole page
+     * @probe: test only, no fault
+     * @ra: host return address for exception unwind
+     *
+     * If the access is valid, fill in @out and return true.
+     * Otherwise if probe is true, return false.
+     * Otherwise raise and exception and do not return.
+     *
+     * The alignment check for the access is deferred to this hook,
+     * so that the target can determine the priority of any alignment
+     * fault with respect to other potential faults from paging.
+     * Zero may be passed for @memop to skip any alignment check
+     * for non-memory-access operations such as probing.
+     */
+    bool (*tlb_fill_align)(CPUState *cpu, CPUTLBEntryFull *out, vaddr addr,
+                           MMUAccessType access_type, int mmu_idx,
+                           MemOp memop, int size, bool probe, uintptr_t ra);
     /**
      * @tlb_fill: Handle a softmmu tlb miss
      *
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 9d222dc376..3d84efcac4 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -40,6 +40,7 @@ typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
 typedef struct CPUArchState CPUArchState;
 typedef struct CPUPluginState CPUPluginState;
 typedef struct CPUState CPUState;
+typedef struct CPUTLBEntryFull CPUTLBEntryFull;
 typedef struct DeviceState DeviceState;
 typedef struct DirtyBitmapSnapshot DirtyBitmapSnapshot;
 typedef struct DisasContextBase DisasContextBase;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 35cda1e2b0..d72f454e9e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1221,22 +1221,35 @@ void tlb_set_page(CPUState *cpu, vaddr addr,
 }
 
 /*
- * Note: tlb_fill() can trigger a resize of the TLB. This means that all of the
- * caller's prior references to the TLB table (e.g. CPUTLBEntry pointers) must
- * be discarded and looked up again (e.g. via tlb_entry()).
+ * Note: tlb_fill_align() can trigger a resize of the TLB.
+ * This means that all of the caller's prior references to the TLB table
+ * (e.g. CPUTLBEntry pointers) must be discarded and looked up again
+ * (e.g. via tlb_entry()).
  */
-static void tlb_fill(CPUState *cpu, vaddr addr, int size,
-                     MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
+static bool tlb_fill_align(CPUState *cpu, vaddr addr, MMUAccessType type,
+                           int mmu_idx, MemOp memop, int size,
+                           bool probe, uintptr_t ra)
 {
-    bool ok;
+    const TCGCPUOps *ops = cpu->cc->tcg_ops;
+    CPUTLBEntryFull full;
 
-    /*
-     * This is not a probe, so only valid return is success; failure
-     * should result in exception + longjmp to the cpu loop.
-     */
-    ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, size,
-                                    access_type, mmu_idx, false, retaddr);
-    assert(ok);
+    if (ops->tlb_fill_align) {
+        if (ops->tlb_fill_align(cpu, &full, addr, type, mmu_idx,
+                                memop, size, probe, ra)) {
+            tlb_set_page_full(cpu, mmu_idx, addr, &full);
+            return true;
+        }
+    } else {
+        /* Legacy behaviour is alignment before paging. */
+        if (addr & ((1u << memop_alignment_bits(memop)) - 1)) {
+            ops->do_unaligned_access(cpu, addr, type, mmu_idx, ra);
+        }
+        if (ops->tlb_fill(cpu, addr, size, type, mmu_idx, probe, ra)) {
+            return true;
+        }
+    }
+    assert(probe);
+    return false;
 }
 
 static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
@@ -1351,22 +1364,22 @@ static int probe_access_internal(CPUState *cpu, vaddr addr,
 
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type, page_addr)) {
-            if (!cpu->cc->tcg_ops->tlb_fill(cpu, addr, fault_size, access_type,
-                                            mmu_idx, nonfault, retaddr)) {
+            if (!tlb_fill_align(cpu, addr, access_type, mmu_idx,
+                                0, fault_size, nonfault, retaddr)) {
                 /* Non-faulting page table read failed.  */
                 *phost = NULL;
                 *pfull = NULL;
                 return TLB_INVALID_MASK;
             }
 
-            /* TLB resize via tlb_fill may have moved the entry.  */
+            /* TLB resize via tlb_fill_align may have moved the entry.  */
             index = tlb_index(cpu, mmu_idx, addr);
             entry = tlb_entry(cpu, mmu_idx, addr);
 
             /*
              * With PAGE_WRITE_INV, we set TLB_INVALID_MASK immediately,
-             * to force the next access through tlb_fill.  We've just
-             * called tlb_fill, so we know that this entry *is* valid.
+             * to force the next access through tlb_fill_align.  We've just
+             * called tlb_fill_align, so we know that this entry *is* valid.
              */
             flags &= ~TLB_INVALID_MASK;
         }
@@ -1613,7 +1626,7 @@ typedef struct MMULookupLocals {
  *
  * Resolve the translation for the one page at @data.addr, filling in
  * the rest of @data with the results.  If the translation fails,
- * tlb_fill will longjmp out.  Return true if the softmmu tlb for
+ * tlb_fill_align will longjmp out.  Return true if the softmmu tlb for
  * @mmu_idx may have resized.
  */
 static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
@@ -1631,7 +1644,8 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type,
                             addr & TARGET_PAGE_MASK)) {
-            tlb_fill(cpu, addr, data->size, access_type, mmu_idx, ra);
+            tlb_fill_align(cpu, addr, access_type, mmu_idx,
+                           0, data->size, false, ra);
             maybe_resized = true;
             index = tlb_index(cpu, mmu_idx, addr);
             entry = tlb_entry(cpu, mmu_idx, addr);
@@ -1821,8 +1835,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, MMU_DATA_STORE,
                             addr & TARGET_PAGE_MASK)) {
-            tlb_fill(cpu, addr, size,
-                     MMU_DATA_STORE, mmu_idx, retaddr);
+            tlb_fill_align(cpu, addr, MMU_DATA_STORE, mmu_idx,
+                           0, size, false, retaddr);
             index = tlb_index(cpu, mmu_idx, addr);
             tlbe = tlb_entry(cpu, mmu_idx, addr);
         }
@@ -1836,7 +1850,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
      * but addr_read will only be -1 if PAGE_READ was unset.
      */
     if (unlikely(tlbe->addr_read == -1)) {
-        tlb_fill(cpu, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr);
+        tlb_fill_align(cpu, addr, MMU_DATA_LOAD, mmu_idx,
+                       0, size, false, retaddr);
         /*
          * Since we don't support reads and writes to different
          * addresses, and we do have the proper page loaded for
-- 
2.43.0



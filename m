Return-Path: <linux-parisc+bounces-2612-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F00995C07
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 303E7B23A2F
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A531C370;
	Wed,  9 Oct 2024 00:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVv9i+kn"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F47801
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432315; cv=none; b=WeQ5qjA65KV0VwlRIDqtSaxSNnOiaXiJ2A03oqqKFTmIRhbblReVwz6izMeO6bF5jGum0w163zjmMRvcSa4FVC8DKTxEfmh3QCYbjU+gKOnUKZf0FeeJPoJPYqSTRhUeS/n09/LL/78aafe24z+nWTbPbly42cfucyyZ4MyzEF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432315; c=relaxed/simple;
	bh=KCJU+G3UMNY8XDo2GlrX6CIIkydSd/xelA/wJkWMaeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNcvOnSBqiCtwS63o4kIbl0xOradux75WPVjsnEo1nofTEaXi4Xi+MUKL4/mmbfDndgrv47RXi+9mQMhTd7eTmjPwcon3vzzOApReuiqGGcoFe7n/L++yjuDiJzqU9dJUM4S4COSvm9r8MEG9PSCQBLJSGZrJrq6OdELGOJ59qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVv9i+kn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c5a7b2908so9764945ad.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432313; x=1729037113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsNmQx87g0SWMKNuiqJxyPNh2jiF8Ss0MC8Fky2xo4U=;
        b=XVv9i+kn5doMniFDiynQfXH3hiU1LThg0mn+eyHQMHnUhCkjIWU/H5H8/glrSuJMYw
         /7zfDhpues70HNN7TGc1AgdagMJISImURKjkQyEr6HAY1Q1/N6mZ16ADJWu4regL74tM
         uShI743vdtF1Od3y1byGPgyIhBr35e0I1FKPC0T26hwcKu66CVATh179k7LWzxPy7mFD
         u1uJbW6JzCEo7PkPmvFFOXkfRn+aAhCTOmqWTPGjrd5L6Zj71hl9O40g8nqK3vwf8OOc
         SfEdz7pmsfIeaChMU369HKR8soY9VMlcgJW9WEAhVRNWKIonjNN5D5GRBJQZzCkVSdrc
         QZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432313; x=1729037113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsNmQx87g0SWMKNuiqJxyPNh2jiF8Ss0MC8Fky2xo4U=;
        b=wZ/LIa7w289aWziU2ci1ZfC5KoQ9wNM2jnnrULkog6CXWGGjoR9HpWokplM1POzNO/
         +TVGJt/5voIphsIBUpzKBBNXuZy+9AB5P2z3et7HPW3teTUqDZxndt2DX8/Nttgb1k3O
         3gh0KSVVMBaIznERodDH6nu7ew1KTH3rnLhqrUjRYJ/U5Ie9qIzfY+ijiNB4CtOt/jpB
         W7B1i8fzxvVhOHtZ9kH/H0rJA0aGXZdq1gCqWlDWtwwVsTkq7fEV5dS9inz4iW5dGY8x
         xorSUIGPeJN7hk1CXtwqvgtVgjhG9M14cU3Lsn0nJVuMJhmX7e3B1Nru8hngLlGF5ZIV
         2hyA==
X-Forwarded-Encrypted: i=1; AJvYcCWDEKqKPNYI9OAtkHM3MBy1aEdI/I3Wd4R3R4OBHF1tC97g2haxU7rQqJUXrMu7F3hMAu3H1NDQUDAvQLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi20gqrVufW8mqPFP+3UB9C7VbrCOc1icbATh89Pjzu0vcPhS+
	Bjxam6/2VzmP7rS2K87adwHUgcorovdAtsXn/yHMtQXIesaF22nVgOH73S7ID+emsBg3K+0DsE8
	+
X-Google-Smtp-Source: AGHT+IFwettQe3bNvU+s7lxTJSvr2zVnYgznFgHUWVsZdUYFjaAq3kofjLpeFOF7iswFe+1y64JOcA==
X-Received: by 2002:a17:903:228a:b0:20c:5a64:9bc6 with SMTP id d9443c01a7336-20c6378e9c4mr11368345ad.50.1728432313486;
        Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 19/20] target/arm: Implement TCGCPUOps.tlb_fill_align
Date: Tue,  8 Oct 2024 17:04:52 -0700
Message-ID: <20241009000453.315652-20-richard.henderson@linaro.org>
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

Fill in the tlb_fill_align hook.  Handle alignment not due to
memory type, since that's no longer handled by generic code.
Pass memop to get_phys_addr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      |  6 ++---
 target/arm/cpu.c            |  2 +-
 target/arm/tcg/cpu-v7m.c    |  2 +-
 target/arm/tcg/tlb_helper.c | 49 ++++++++++++++-----------------------
 4 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a6088d551c..299a96a81a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -816,9 +816,9 @@ void arm_cpu_record_sigsegv(CPUState *cpu, vaddr addr,
 void arm_cpu_record_sigbus(CPUState *cpu, vaddr addr,
                            MMUAccessType access_type, uintptr_t ra);
 #else
-bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr);
+bool arm_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr addr,
+                            MMUAccessType access_type, int mmu_idx,
+                            MemOp memop, int size, bool probe, uintptr_t ra);
 #endif
 
 static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 19191c2391..1320fd8c8f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2663,7 +2663,7 @@ static const TCGCPUOps arm_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
-    .tlb_fill = arm_cpu_tlb_fill,
+    .tlb_fill_align = arm_cpu_tlb_fill_align,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
     .do_interrupt = arm_cpu_do_interrupt,
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index 5496f14dc1..58e54578d6 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -242,7 +242,7 @@ static const TCGCPUOps arm_v7m_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
-    .tlb_fill = arm_cpu_tlb_fill,
+    .tlb_fill_align = arm_cpu_tlb_fill_align,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 1d8b7bcaa2..8841f039bc 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -318,14 +318,13 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
 }
 
-bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
+bool arm_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr address,
+                            MMUAccessType access_type, int mmu_idx,
+                            MemOp memop, int size, bool probe, uintptr_t ra)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo local_fi, *fi;
-    int ret;
 
     /*
      * Allow S1_ptw_translate to see any fault generated here.
@@ -339,37 +338,27 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     /*
-     * Walk the page table and (if the mapping exists) add the page
-     * to the TLB.  On success, return true.  Otherwise, if probing,
-     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
-     * register format, and signal the fault.
+     * Per R_XCHFJ, alignment fault not due to memory type has
+     * highest precedence.  Otherwise, walk the page table and
+     * and collect the page description.
      */
-    ret = get_phys_addr(&cpu->env, address, access_type, 0,
-                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
-                        &res, fi);
-    if (likely(!ret)) {
-        /*
-         * Map a single [sub]page. Regions smaller than our declared
-         * target page size are handled specially, so for those we
-         * pass in the exact addresses.
-         */
-        if (res.f.lg_page_size >= TARGET_PAGE_BITS) {
-            res.f.phys_addr &= TARGET_PAGE_MASK;
-            address &= TARGET_PAGE_MASK;
-        }
-
+    if (address & ((1 << memop_alignment_bits(memop)) - 1)) {
+        fi->type = ARMFault_Alignment;
+    } else if (!get_phys_addr(&cpu->env, address, access_type, memop,
+                              core_to_arm_mmu_idx(&cpu->env, mmu_idx),
+                              &res, fi)) {
         res.f.extra.arm.pte_attrs = res.cacheattrs.attrs;
         res.f.extra.arm.shareability = res.cacheattrs.shareability;
-
-        tlb_set_page_full(cs, mmu_idx, address, &res.f);
+        *out = res.f;
         return true;
-    } else if (probe) {
-        return false;
-    } else {
-        /* now we have a real cpu fault */
-        cpu_restore_state(cs, retaddr);
-        arm_deliver_fault(cpu, address, access_type, mmu_idx, fi);
     }
+    if (probe) {
+        return false;
+    }
+
+    /* Now we have a real cpu fault. */
+    cpu_restore_state(cs, ra);
+    arm_deliver_fault(cpu, address, access_type, mmu_idx, fi);
 }
 #else
 void arm_cpu_record_sigsegv(CPUState *cs, vaddr addr,
-- 
2.43.0



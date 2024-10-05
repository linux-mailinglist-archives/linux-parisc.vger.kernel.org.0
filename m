Return-Path: <linux-parisc+bounces-2500-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A85B6991A80
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 252291F22518
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A569157E6B;
	Sat,  5 Oct 2024 20:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FY8y0FZg"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9981552E0
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158782; cv=none; b=h6wbwi4iwQleFASE8NZJ8DYXZv0ji3rTb83sNpcFQd5nyZsfCs8C9nZAx9KWp3uuAYhVLe6p5hpBTeCeQfdw4Hh0QGV+DbXHa3Q5TJJ37ItIPcj2CIbBmz9LQLaIuvd13EpucW6RqW5q3Wr9l2t4g20vZZyVqSPJywP5qnyx95w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158782; c=relaxed/simple;
	bh=r2cKUvhG9pNat8RIjHsog3GVW+rEGmVEg3b6INDSBgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMS21WY2UGJzhlai2lvlmR6wB/bfFBdBhsD4LmOTqypnUTDlvlShTelklBhPOG7StCVVfgKjhtDVYvVrIkaz5Y3kHLddkHCMiE4mZ+QocXj+s0gt0SVoUz64WZTAYyDayvYw2L+sdRLvCJ+0oiXML44jHOr1FVdtvEJUsuc+trU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FY8y0FZg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-207115e3056so29305635ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158780; x=1728763580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AFMCCsh2dZpLpZMXFYavJotm9FHniFYW8AGrgK05Hs=;
        b=FY8y0FZgaVm6x6FaA6yTdFcPpGiqi5YvdrGNLfBQD0KWOScDsbkneo5bAQhJL5Xp6m
         Gr6xjUZxeyMCg6VYbMFVPM8Ie3WvK0w8mNMMWaEfD7Jx3E02Mrsm23+9LRwA6OJVl4ck
         jP95NAs/aYevGFY8rVZfyctoW/ynS1WD1mkU5Wef3uhdlbMpVA5Qg2SATeD/DhOjeClb
         +rOhwRtWAYOV7Kin9/CtcGyjXrdM1HqKz33fekt+r8CLkQYddwA/OfbXg4WOLnFlRgfS
         sx8wDPiFQDrqvgklLLixSTbbucvYf4nPiiEqjxxOdINwbTv9lDwLaTfSo/DH1jiqOKDs
         4wyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158780; x=1728763580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AFMCCsh2dZpLpZMXFYavJotm9FHniFYW8AGrgK05Hs=;
        b=H4FHP479dW9jC8ZMgiYxLuzxE0DZ2vqvdqlZDLgzTlGsny5VhZQqb3L/RRTCccCXiQ
         3YW8FSUw55YailCUqwztifjRcT0PcR+CQ6vQQIO6+vWgefY9Et8TiqwgIYZH9SlzAtIf
         SBtR2JrFD6kwC4XryjmEaJ6Jma7yd6Xx1BiQ2Ff1d//oGkOTvu1HW8xNlEkqDa+LuZvX
         jxwsRmdiNu10lBmEZrA4NMaBcUWDYZWVOtNPk/7ylqfLLzc1CVzLXDD1ZgHonGYijlk8
         0R3rmSt9r+YD/UBQxWgXJ9/To/lwQ4bOcbU+zHdZD2kxYhIgT1rduFAmp4UsgV2KebXL
         b+kg==
X-Forwarded-Encrypted: i=1; AJvYcCWXrh+Ztr6NPqbBX+sVwuAv4YhOZBwcedCmJQ1bYotZ+aTsllDdiqZJpdtUr9VMzaqmrjK313LhJ9ajbA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy0INGghnWUcs7r+IebO51+dzR0CmcV+S0jVaOvuMZm39r2NfM
	FgUV8RrFmh93iUVqv5YYs/axn8zhsP5JZMk+vKzfb+WlgHtNuxMSfOhdvjxrofY=
X-Google-Smtp-Source: AGHT+IFQWlOaLHXh4IPf9U+1cxmSVfYPLms4xolaX7BFBENlDrFNojC92ydhZIWJvqWY9iSxsqXglg==
X-Received: by 2002:a17:903:32ca:b0:206:9818:5439 with SMTP id d9443c01a7336-20bfdff2fe6mr85317145ad.19.1728158780508;
        Sat, 05 Oct 2024 13:06:20 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 20/21] target/arm: Add arm_cpu_tlb_fill_align
Date: Sat,  5 Oct 2024 13:05:59 -0700
Message-ID: <20241005200600.493604-21-richard.henderson@linaro.org>
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

Fill in the tlb_fill_align hook.  So far this is the same
as tlb_fill_align_first, except that we can pass memop to
get_phys_addr as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      |  3 +++
 target/arm/cpu.c            |  2 +-
 target/arm/tcg/cpu-v7m.c    |  2 +-
 target/arm/tcg/tlb_helper.c | 27 +++++++++++++++++++++++----
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a6088d551c..6916d43009 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -819,6 +819,9 @@ void arm_cpu_record_sigbus(CPUState *cpu, vaddr addr,
 bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
+bool arm_cpu_tlb_fill_align(CPUState *cs, vaddr address, MemOp memop,
+                            int size, MMUAccessType access_type,
+                            int mmu_idx, bool probe, uintptr_t retaddr);
 #endif
 
 static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 08731ed4e0..293eb5949e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2663,7 +2663,7 @@ static const TCGCPUOps arm_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
-    .tlb_fill_align = tlb_fill_align_first,
+    .tlb_fill_align = arm_cpu_tlb_fill_align,
     .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index 8874fe0e11..a071979636 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -242,7 +242,7 @@ static const TCGCPUOps arm_v7m_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
-    .tlb_fill_align = tlb_fill_align_first,
+    .tlb_fill_align = arm_cpu_tlb_fill_align,
     .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 1d8b7bcaa2..e83ece9462 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -318,9 +318,9 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
 }
 
-bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
+static bool tlb_fill_internal(CPUState *cs, vaddr address, int size,
+                              MMUAccessType access_type, MemOp memop,
+                              int mmu_idx, bool probe, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GetPhysAddrResult res = {};
@@ -344,7 +344,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
      * register format, and signal the fault.
      */
-    ret = get_phys_addr(&cpu->env, address, access_type, 0,
+    ret = get_phys_addr(&cpu->env, address, access_type, memop,
                         core_to_arm_mmu_idx(&cpu->env, mmu_idx),
                         &res, fi);
     if (likely(!ret)) {
@@ -371,6 +371,25 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         arm_deliver_fault(cpu, address, access_type, mmu_idx, fi);
     }
 }
+
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    return tlb_fill_internal(cs, address, size, access_type, 0,
+                             mmu_idx, probe, retaddr);
+}
+
+bool arm_cpu_tlb_fill_align(CPUState *cs, vaddr address, MemOp memop,
+                            int size, MMUAccessType access_type,
+                            int mmu_idx, bool probe, uintptr_t retaddr)
+{
+    if (unlikely(address & ((1 << memop_alignment_bits(memop)) - 1))) {
+        arm_cpu_do_unaligned_access(cs, address, access_type, mmu_idx, retaddr);
+    }
+    return tlb_fill_internal(cs, address, size, access_type, memop,
+                             mmu_idx, probe, retaddr);
+}
 #else
 void arm_cpu_record_sigsegv(CPUState *cs, vaddr addr,
                             MMUAccessType access_type,
-- 
2.43.0



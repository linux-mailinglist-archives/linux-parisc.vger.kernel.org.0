Return-Path: <linux-parisc+bounces-2468-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D15CD9917BA
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EA011C2127A
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEBA154423;
	Sat,  5 Oct 2024 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QyI6ZrGY"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F073615383C
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141966; cv=none; b=tWeleh5opMmzOcq/ljAsN2sv4N6UNmueV03x7huSMiOcs6fu/dcIbjM1TObIuQbjdPnPp2mgbqR2JnxB1h92L76z9C9QBuQu1ZlnOlqUjzjYPZZKp+4fQCE7cDCIyF9Ycc8+y6sFaOq/WgDO56R31PA4EAYrzu9+ydPeYEB7Y7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141966; c=relaxed/simple;
	bh=4Y9YWp6EM7aAkdmftt8JKSZpOs1BvVvy02XzjMP1/6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LcAfn9e3B/sZvofP+L26uVDcRjrYW9DGAtS3RlHYd2CWd/DvXxWMRyXwubt2LnxBkr/dTUoIvTdtgNFzxMaPCWDMuPl1Y0TOZuQZZ0+QAHmVZSbV63RMUZztFDQ8cUPxlrwD1Z988oymqzFD7BHEx9DNwFVbqH6C+i+SsQmI58k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QyI6ZrGY; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20b90984971so32651135ad.3
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141964; x=1728746764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc7m2CC+o/vfg9459Vx/ro/giFzSXc14VGjLvy+03yM=;
        b=QyI6ZrGYye8j0jgG2wNkeWu3g/xYr44/RnY48GmZiUbIpphVl4fLjXtedL7HWY8dta
         3XPCQI+efqgztUmFEL76g6tJiJjAHodtZwDVMQzh837HXI7Chz79xU73Q0NyqUWLKGUh
         h+ie8HSMe+FAVJHfWerukcQSZa9jGwQc0qaTTU6XKeenefZ6EdDuMg1MijI5Hl0P3Hx1
         3C9bknhfw7VETNYyt7gpsBzeYjSH5u5BULVkqcDEp3O5WCOgSHoPFYT2QlPgVKcyGu+s
         7JD/HtoE1qvzP46kPqkz0CB8C5s2MyRSN8YqlwSKvxfesHPPWhIoYlsxU/5kTnQp/RCw
         GCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141964; x=1728746764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rc7m2CC+o/vfg9459Vx/ro/giFzSXc14VGjLvy+03yM=;
        b=RDTyRjZhW38qQkPzSnwOm0hJkLubwYf7OBj/pcX6lpLGfRU0AYN7K0Wyj2zf8MRJan
         q1Fw3r4Xj4ZcB4qLhIHqsHHk0ZMRY8EB/2ZgoDVqjIAe8iBvMRgGt797R0sGoCJa+Hfu
         /XWGlhtkfwVWMnQHJkDmvHMPfvaiG6mOktVFfiaARZ7lwnOsXFC5na+6ecAStX25sUP1
         yQGZq6B2k0/ibzAaj0EiDNz/BPAU74SGdqMY1ClrQOK6ZLzvJsZ2siKSMoD7lpLj/XGi
         BmZf0NRNw1sFLQbycIMr8YOnK1mVVsXwHL828z/YiUnoMGswbn98rIcyKUQrDPdnXDp7
         nr8A==
X-Forwarded-Encrypted: i=1; AJvYcCUUPsihh0s9Bj5aExgW3LnfAtYPBcEcOX2bwldm+ymbeOsVRQj0ljDlSlw9XHm6j/fcXrBBPWxnFq9a74M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZy17t8n6v4/Nbmkj5cCClGoVHVAh3b2r2W66npYAFNS8GCdAB
	LzITPAQ266IwpQzJBvt0qWkmMvGUNw2MWdUkrG30rUF46KLGbi/hgeIkxdr6bTY=
X-Google-Smtp-Source: AGHT+IEvLU9GLG2DeoI40muI2sipayJdhU5jBLMkBCCO1UbeJJe53a/eQXNvSkSI8ZhFOYTqxOfpOg==
X-Received: by 2002:a17:902:db04:b0:205:709e:1949 with SMTP id d9443c01a7336-20bff04dd11mr92195455ad.57.1728141964403;
        Sat, 05 Oct 2024 08:26:04 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 12/20] target/hppa: Add hppa_cpu_tlb_fill_align
Date: Sat,  5 Oct 2024 08:25:43 -0700
Message-ID: <20241005152551.307923-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fill in the tlb_fill_align hook, so that we can recognize
alignment exceptions in the correct priority order.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h        |  3 +++
 target/hppa/cpu.c        |  2 +-
 target/hppa/mem_helper.c | 16 ++++++++++++----
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 526855f982..c0567ce0ab 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -366,6 +366,9 @@ void hppa_set_ior_and_isr(CPUHPPAState *env, vaddr addr, bool mmu_disabled);
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+bool hppa_cpu_tlb_fill_align(CPUState *cs, vaddr address, MemOp mop, int size,
+                             MMUAccessType access_type, int mmu_idx,
+                             bool probe, uintptr_t retaddr);
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 3b6c325e09..768abc6e5d 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -226,7 +226,7 @@ static const TCGCPUOps hppa_tcg_ops = {
     .restore_state_to_opc = hppa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
-    .tlb_fill_align = tlb_fill_align_first,
+    .tlb_fill_align = hppa_cpu_tlb_fill_align,
     .tlb_fill = hppa_cpu_tlb_fill,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .cpu_exec_halt = hppa_cpu_has_work,
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index d38054da8a..35e9170bf3 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -424,9 +424,9 @@ void hppa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 }
 
-bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
-                       MMUAccessType type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
+bool hppa_cpu_tlb_fill_align(CPUState *cs, vaddr addr, MemOp mop, int size,
+                             MMUAccessType type, int mmu_idx,
+                             bool probe, uintptr_t retaddr)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
@@ -445,7 +445,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
     }
 
-    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, 0,
+    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, mop,
                                      &phys, &prot);
     if (unlikely(excp >= 0)) {
         if (probe) {
@@ -473,6 +473,14 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     return true;
 }
 
+bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+                       MMUAccessType type, int mmu_idx,
+                       bool probe, uintptr_t retaddr)
+{
+    return hppa_cpu_tlb_fill_align(cs, addr, 0, size, type,
+                                   mmu_idx, probe, retaddr);
+}
+
 /* Insert (Insn/Data) TLB Address.  Note this is PA 1.1 only.  */
 void HELPER(itlba_pa11)(CPUHPPAState *env, target_ulong addr, target_ulong reg)
 {
-- 
2.43.0



Return-Path: <linux-parisc+bounces-2604-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 690CD995C00
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3592B23978
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D6964D;
	Wed,  9 Oct 2024 00:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ov1Hd0GR"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8583370
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432308; cv=none; b=GIXgCJIZX7MHcQoNMuUO6++2f2LdA6uF6KoiiI0H7dpKx1m8aquO/tDYeWHDgdGV97abdqKyX0JZ8k/LeRTzJw12sHJ6HNJtEX5G39GrfnkuR64/KeMB+pOYRDA48/OJWHiexJKjRFYcccw9dNsWYSAkJpeMMgNzEfAgTXfMCfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432308; c=relaxed/simple;
	bh=XNSUPs2wawHWMkJmFOseTF/e5uRuHZbQc3DlNbkB4Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PekN2TzUf+8XDPQPeValcVh7ZXNl+6IDCQXaBGJ4lbdV8b+I65xEkgq7XgVg3EheH6rMyGuJGn5WWZNwtyZrMtajeer2NtBYuPjzXingnt7kjFN0WjrxPpo5yeFEgVDlE5BEXoppbadSRpunZTod/4wO7vllyMSarzl/1F1haSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ov1Hd0GR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c544d34bcso12092875ad.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432306; x=1729037106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iV2KSUuCTdEDpKpG+VIBV8pupsJQOA9ecDi8J+rVd34=;
        b=Ov1Hd0GR5dciY3n5CcPQ7NZiZZwGDMEd5+UZD4RJwZe74VBRlcJnXpa9aPP3CmZibZ
         vCb9lbKF+Yn7OtFVkRCS2puuR12bM41/8TzitrcqTyg7N0mFtw2A9L2foJEuTfTdWKbT
         Tg4sQXRrgIWSdfmLO9qvOn/h4Y0PJVZaBcvG3a0BewS/ifO1po7Q/cpqtmrBm1LBLUPA
         8waYJ39OFqOZLPhBODS7bqztFJncNGx9MGsdguLs4hsoCuRQYNHIL/l1Klbz6+KuTWXN
         yQvrV1pMsgP87VUPkk23Gz5NsF4MxWWtGEv00tPIRmfAnNP0QoPExSSytTYFeaNv0MSc
         Jheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432306; x=1729037106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV2KSUuCTdEDpKpG+VIBV8pupsJQOA9ecDi8J+rVd34=;
        b=GPf+i+gJTjFRUVVbd1ZaNf2C1Wrj9S8uxWxGi6eUbIiqLogCnfUmFZ8ZIgcyaNRrAU
         g0PEJatFxtyWJc5mdKunvSaSrZBrUh+8u4tuJkgeifN+VyAi6m/+iYS8owyFQ+N/Cd4c
         /fLFxOXig57cLMQkKlOkTLrVL2xpTWpLSiOdlBDiR/Ju2sqGkwfMEGBge65MMoWi6mXc
         aiII+THGs+c8Jb7pUm70hY4evZbCD8kWl3LrKoYdlPvssZp9qxFtvc5wOFlSCmTgxdDd
         gKSchr6XzNRMylzP57Tg0AuYK/Hrb4uOHVHH4oFbfVOMiz9ZtkJKnUdGu3cC2PVMxhvq
         vOFw==
X-Forwarded-Encrypted: i=1; AJvYcCWWSQqgLy8LVUX9eCH8UwD2G3dpgKd+RSehlbOVM85JNIewl9nHSM8BHbuUHJCjxJJIoh6v/8P6HOIlw3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR6V7NLYESWnLxsISGFL8QP5Kwh5HGNqdHfdogyhgkst1aSdP4
	lBHa1Nif2gZZnjO29NgAEFqkg68+7cDyrWOkAgMeoiz0vcAJfxRoJI0Ws0e4svw=
X-Google-Smtp-Source: AGHT+IEKU+69FGHaarUOvElg72DCHkm1xPG7wfOM2NLThus+mTJDQJLk8D0LtS7DglEQU4MbeYyvAA==
X-Received: by 2002:a17:903:110c:b0:20c:5698:75cd with SMTP id d9443c01a7336-20c636eb2a7mr13032315ad.2.1728432306088;
        Tue, 08 Oct 2024 17:05:06 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 11/20] target/hppa: Implement TCGCPUOps.tlb_fill_align
Date: Tue,  8 Oct 2024 17:04:44 -0700
Message-ID: <20241009000453.315652-12-richard.henderson@linaro.org>
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

Convert hppa_cpu_tlb_fill to hppa_cpu_tlb_fill_align so that we
can recognize alignment exceptions in the correct priority order.

Resolves: https://bugzilla.kernel.org/show_bug.cgi?id=219339
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h        |  6 +++---
 target/hppa/cpu.c        |  2 +-
 target/hppa/mem_helper.c | 21 ++++++++++++---------
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 526855f982..e45ba50a59 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -363,9 +363,9 @@ void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
 void hppa_ptlbe(CPUHPPAState *env);
 hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 void hppa_set_ior_and_isr(CPUHPPAState *env, vaddr addr, bool mmu_disabled);
-bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr);
+bool hppa_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr addr,
+                             MMUAccessType access_type, int mmu_idx,
+                             MemOp memop, int size, bool probe, uintptr_t ra);
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 7cf2e2f266..c38439c180 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -226,7 +226,7 @@ static const TCGCPUOps hppa_tcg_ops = {
     .restore_state_to_opc = hppa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
-    .tlb_fill = hppa_cpu_tlb_fill,
+    .tlb_fill_align = hppa_cpu_tlb_fill_align,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .cpu_exec_halt = hppa_cpu_has_work,
     .do_interrupt = hppa_cpu_do_interrupt,
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index d38054da8a..b8c3e55170 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -424,12 +424,11 @@ void hppa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 }
 
-bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
-                       MMUAccessType type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
+bool hppa_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr addr,
+                             MMUAccessType type, int mmu_idx,
+                             MemOp memop, int size, bool probe, uintptr_t ra)
 {
-    HPPACPU *cpu = HPPA_CPU(cs);
-    CPUHPPAState *env = &cpu->env;
+    CPUHPPAState *env = cpu_env(cs);
     int prot, excp, a_prot;
     hwaddr phys;
 
@@ -445,7 +444,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
     }
 
-    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, 0,
+    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, memop,
                                      &phys, &prot);
     if (unlikely(excp >= 0)) {
         if (probe) {
@@ -454,7 +453,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         trace_hppa_tlb_fill_excp(env, addr, size, type, mmu_idx);
 
         /* Failure.  Raise the indicated exception.  */
-        raise_exception_with_ior(env, excp, retaddr, addr,
+        raise_exception_with_ior(env, excp, ra, addr,
                                  MMU_IDX_MMU_DISABLED(mmu_idx));
     }
 
@@ -468,8 +467,12 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
      * the large page protection mask.  We do not require this,
      * because we record the large page here in the hppa tlb.
      */
-    tlb_set_page(cs, addr & TARGET_PAGE_MASK, phys & TARGET_PAGE_MASK,
-                 prot, mmu_idx, TARGET_PAGE_SIZE);
+    memset(out, 0, sizeof(*out));
+    out->phys_addr = phys;
+    out->prot = prot;
+    out->attrs = MEMTXATTRS_UNSPECIFIED;
+    out->lg_page_size = TARGET_PAGE_BITS;
+
     return true;
 }
 
-- 
2.43.0



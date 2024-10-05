Return-Path: <linux-parisc+bounces-2488-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1537991A72
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D55B11C214B2
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445131552E0;
	Sat,  5 Oct 2024 20:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r7+m/l2y"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A8157E6B
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158771; cv=none; b=j78VjGeWhnzoxGRBEBTLhbQC9cqOxemLgKg9fYC/T+6x8DDoCfEjGlznfwuzhQaUhJhfrpXqXwiNokPtZLfoJzR0WqbGJrm4hiHz2Pt8BbrPQk7lHHEdd3GiRPJVPOhwAiJh6D/pZp3CWbLznQMg4COL753Yt6zf/Iv/oquBLKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158771; c=relaxed/simple;
	bh=lMqTSWOZj1IlCEf4v6pbIf89Bz3BR40fXSPmPVcNUi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=th1MRn6jLpaIiz95zmO1lbcDWRZbf8I7lAJzCy0dX4Uu39CasamCIDadBWDKemgl6Qm4HtNJeUX5oKhLOsn2aRBC94p1wxaQPKpAt2tA7GLSxctDMayaqHPLHNYbeha++pQqQys+CnK2JsNJd0zmoibvwSlvyXs66A5PO5gIjn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r7+m/l2y; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20b0b5cdb57so31578975ad.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158769; x=1728763569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MP+WvwE/XecW9wPOVCpjk+gA5jxWiH/v3HQ4ejXK7hQ=;
        b=r7+m/l2y9IjIBKWQK9an4EO+J+OP12yrnQPww6L5OhJkfT7h6OUMrVa0ev83dL8UYV
         H2o73UzIsZNEVDxfU0BVLhcDqYNeA1LktRMwO1Xvy3EBdjwZ9EsD7MpRTlDkX3Ybp4js
         lC7JMW0OUAhNF262MVtTq5OA7XjPRma18Vu+YlFD3cHU2KxGTg8Cg+3pTt4A/5DNMvL0
         K7CRENTk/DlPPU9/LOffDIrNfrEbuIel71cf6dq9cK/WAjw23ytW28c0arQNrEAaaOQ4
         QPQ6g4vd2m2mtkRZlUJlXq8ofDswTzbSwyAilAaZdqs3d1FXb0uE5uOdEaARWtd+sXSo
         /Rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158769; x=1728763569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MP+WvwE/XecW9wPOVCpjk+gA5jxWiH/v3HQ4ejXK7hQ=;
        b=q6KktonmYHeAJinEqZ6Geen4qy8YVMuMTTRrFSkHfToefI17PyGZ+qGEEYucfor5At
         X+0BJqGoh1p+sayQluwRoKsaoM7QSEajg4Y+JZJap47iwngQFwPBQQT4DGBHSg/peDUI
         cwv86KkEJj+xStKBXOY+W939lmayAoQxH+fhAH9hsRhLRlFN2hTIxHfJh0AND82XpqyQ
         XgAFe8tY85Gx7B0KtoHQCB4mUKORTMaSm2nnINfr4B8m+9SmR9FVuFwGlRPe5B9zCVmZ
         sFYnUfKiTWAzmGq5TH3n4tiEGfn71ugYn7Oh8lSxpzcHibmWHbneJ+OBd6/40QiOFXEz
         zvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsj7v1EHOl+5HQ0YiSxsIK/dCPVxFHr6/v7nbgQKHIm0PqGG1g1y+hipbdRfYwvJ/3ziXQpLFzAy4PRlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVFR5hOjT+cF5RKxIgtupL3wJOUIyWyX5Za8iOtrqtWQFIx7Vk
	LQ9/yfgXj5xkSDGuT+PtwrtX8I5fOoFeNfqDBdgkJQqE1nSN8k0OOGbIvpy9OeOxAB8Mga2LnPd
	c
X-Google-Smtp-Source: AGHT+IG4o7j/ZFzlHdwrYk17l+PK6a847Ql8/KK14Pm1cpqL+sGkT/q0+Vhje7Ma/G1N+w5P6iDU7A==
X-Received: by 2002:a17:902:d2cc:b0:20b:7902:3456 with SMTP id d9443c01a7336-20bff37ac46mr105992105ad.1.1728158769036;
        Sat, 05 Oct 2024 13:06:09 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 08/21] target/hppa: Add MemOp argument to hppa_get_physical_address
Date: Sat,  5 Oct 2024 13:05:47 -0700
Message-ID: <20241005200600.493604-9-richard.henderson@linaro.org>
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

Just add the argument, unused at this point.
Zero is the safe do-nothing value for all callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h        | 2 +-
 target/hppa/int_helper.c | 2 +-
 target/hppa/mem_helper.c | 9 +++++----
 target/hppa/op_helper.c  | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index f4e051f176..526855f982 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -369,7 +369,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
-                              int type, hwaddr *pphys, int *pprot);
+                              int type, MemOp mop, hwaddr *pphys, int *pprot);
 void hppa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 391f32f27d..58695def82 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -167,7 +167,7 @@ void hppa_cpu_do_interrupt(CPUState *cs)
 
                     vaddr = hppa_form_gva_psw(old_psw, env->iasq_f, vaddr);
                     t = hppa_get_physical_address(env, vaddr, MMU_KERNEL_IDX,
-                                                  0, &paddr, &prot);
+                                                  0, 0, &paddr, &prot);
                     if (t >= 0) {
                         /* We can't re-load the instruction.  */
                         env->cr[CR_IIR] = 0;
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index b984f730aa..a386c80fa4 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -197,7 +197,7 @@ static int match_prot_id64(CPUHPPAState *env, uint32_t access_id)
 }
 
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
-                              int type, hwaddr *pphys, int *pprot)
+                              int type, MemOp mop, hwaddr *pphys, int *pprot)
 {
     hwaddr phys;
     int prot, r_prot, w_prot, x_prot, priv;
@@ -340,7 +340,7 @@ hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     mmu_idx = (cpu->env.psw & PSW_D ? MMU_KERNEL_IDX :
                cpu->env.psw & PSW_W ? MMU_ABS_W_IDX : MMU_ABS_IDX);
 
-    excp = hppa_get_physical_address(&cpu->env, addr, mmu_idx, 0,
+    excp = hppa_get_physical_address(&cpu->env, addr, mmu_idx, 0, 0,
                                      &phys, &prot);
 
     /* Since we're translating for debugging, the only error that is a
@@ -438,7 +438,8 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
     }
 
-    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, &phys, &prot);
+    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, 0,
+                                     &phys, &prot);
     if (unlikely(excp >= 0)) {
         if (probe) {
             return false;
@@ -678,7 +679,7 @@ target_ulong HELPER(lpa)(CPUHPPAState *env, target_ulong addr)
     hwaddr phys;
     int prot, excp;
 
-    excp = hppa_get_physical_address(env, addr, MMU_KERNEL_IDX, 0,
+    excp = hppa_get_physical_address(env, addr, MMU_KERNEL_IDX, 0, 0,
                                      &phys, &prot);
     if (excp >= 0) {
         if (excp == EXCP_DTLB_MISS) {
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 7f79196fff..744325969f 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -334,7 +334,7 @@ target_ulong HELPER(probe)(CPUHPPAState *env, target_ulong addr,
     }
 
     mmu_idx = PRIV_P_TO_MMU_IDX(level, env->psw & PSW_P);
-    excp = hppa_get_physical_address(env, addr, mmu_idx, 0, &phys, &prot);
+    excp = hppa_get_physical_address(env, addr, mmu_idx, 0, 0, &phys, &prot);
     if (excp >= 0) {
         cpu_restore_state(env_cpu(env), GETPC());
         hppa_set_ior_and_isr(env, addr, MMU_IDX_MMU_DISABLED(mmu_idx));
-- 
2.43.0



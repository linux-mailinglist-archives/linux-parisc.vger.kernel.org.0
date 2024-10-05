Return-Path: <linux-parisc+bounces-2464-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E39917B6
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F6851F22C2E
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0922153BFC;
	Sat,  5 Oct 2024 15:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IeQG+SsG"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490C5154423
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141962; cv=none; b=fkMhxPuozr63JH/eFvGpnPS5Fp2jebL4FCXU+xkEJrRP/1S/t1Xkg9HzHecObRGCTA3qnsALNyiczN3OWbMe9hcmxldsEmsDJT7zSoQ5o/oD7NXbsbkdw9azoxCQE+Qln6rTU7uAKBkqJosmD+JzDd9ueS1JT98oKs3TFgpwlAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141962; c=relaxed/simple;
	bh=lMqTSWOZj1IlCEf4v6pbIf89Bz3BR40fXSPmPVcNUi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BxHLHvW5x3X+pAzIAfFR5MTWMvkt/bFgjyMAdIARZZAWSY2stl34J+aQKomPmqzNS5TdFOVwZcClq+Qxo+Q8NsX//H3BD10Umbi+6vc6uJmzS3YxhYfQG04SBrMykWiFDuZSyUSDLfXqjkeWq92QOqMyaIQJj0NViMw35/3X+RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IeQG+SsG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20b90ab6c19so33844895ad.0
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141960; x=1728746760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MP+WvwE/XecW9wPOVCpjk+gA5jxWiH/v3HQ4ejXK7hQ=;
        b=IeQG+SsGlzTcChPlge2/THhpp+VqQAF+fQV3q6ewedUsJTNi1CckXsnSBdrlWfVfrO
         8E9cI2tatXvNochk3HDfgROwb/ObdD3tWZxYHtw9hZRvLmZYs1hHml81+TYAgoeSrvqe
         ucVb08BkuYVJEGgYdpbuLbJ9OTFgTyy99xINDuFryFmrm5RbwTUfh/CWIzWKnntDrUDF
         JgmFI4KybxVITwGyE5MuUulgAejNRXWqFOE04ITSfDj01ouOhrqPlprE1X4IgoupVWtG
         BCTn/JtugljBMx4k6Ri18TxYI0q/q2vC9cFDDPeUM1QO7HWSVIl83pVTsqJTR/vGzBxm
         0qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141960; x=1728746760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MP+WvwE/XecW9wPOVCpjk+gA5jxWiH/v3HQ4ejXK7hQ=;
        b=p/Dty5wVOYyfambA7JnOXXFGSNk7MQu6AL8We7oaPNwn2DYN3f1K3QlLZcl1fdyvTJ
         6pKPgMrPtKvFNZ8M1Z57UnVPAJ3YGHXlnJDqOb2es7QpuscWfVaYwrfoA9niVrLplRek
         FUSzULAQvxC1zSVGHLKy63bNgFM3T6cyOQUfq5ZoUr46M2ji94aRiNsc5HjDagdipV6U
         VbytnggLY4WhKRtgANZAEV1YH2LesMvi3TSzaVY+LJq0hEAxwyRTP/Lou8Oq8IwYgpQz
         k+C7AVtyqNVyAy37nmXIqQQ4dGn8hbVXjR/uV6HUOR/x5qlWM2I0+4LZjUOEQYTMMqFw
         n7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhHWegj5r73MzJ2J4Bbm+WqiHXX1qrlFwftw/hOUOZYV2IhqD/kUB3zKFkcEp5+5Q4/j9ZxJbUxG7wJLo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya5K+7V0AlUrI93K1Wvd8iUKKl0MgAsfNN81gbyBYkwE5q/Jdi
	kbGfaPlINr2MbHxonSChqrktplPVWpBOu9EMosBvLt3ToPyripM3Og/ndeAUmrY=
X-Google-Smtp-Source: AGHT+IESYzC42ts/+MgAFBURTMzI6DPqe+lqay1qM2V34nvaOe/CY71VOZQTw0rCb6RzMXOSgxY+yw==
X-Received: by 2002:a17:902:db02:b0:20b:ba72:37c with SMTP id d9443c01a7336-20bfea542c6mr100209775ad.48.1728141960541;
        Sat, 05 Oct 2024 08:26:00 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 08/20] target/hppa: Add MemOp argument to hppa_get_physical_address
Date: Sat,  5 Oct 2024 08:25:39 -0700
Message-ID: <20241005152551.307923-9-richard.henderson@linaro.org>
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



Return-Path: <linux-parisc+bounces-2458-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9FF9917B2
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FC851F22C49
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BE4154423;
	Sat,  5 Oct 2024 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gqbw9Xsg"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745891C6A3
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141957; cv=none; b=o7Qs0ExRO9B2fx+fM9xNmeU7bbSx3dY6Lq9KJhzVEbZdR1YEfSm1ytc0WElX60kRqz+7DTRL3mWnwcu9tiAfCsosEXVWAPYaLivBIwoCoInj10lQiXmpKK3ydptJ6p9IIVNTifCNf7g1/EYl2cLomX/l9xk1LB1af85n9HZiIhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141957; c=relaxed/simple;
	bh=CsqbOG3MqlbMWcSFdA2BCSBmA0dzoz8OyW/OJILfreQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ekLJgoaA/m3BgssxpAXsDXG8BO0L0gWCzdV2WVebdTZ9eTE/JUAatkVEKah0kMBk1Xs2fKG8dqeot1gw1mKmZnB+73b/+DVXgelJEcuc2AGsmicrujO2TljIiJEmWrwCUZdSKMqYNG4aK7iNAoQVAThOBv/7dB9yUW6f7FhH27U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gqbw9Xsg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b7eb9e81eso37012765ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141955; x=1728746755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBthGFf8BfR2i4dob959bB47CFsEJX0Mf+aRMHd0jM4=;
        b=Gqbw9Xsgxt/IDnhr3mAWkB4+i1mDauZ8W9x6oYTxMekAI5hbNPmRqriGHPIk78dV8b
         hCXKm6p7gFOh0q+IHpls9uEbKhRMsb8L9QP+Qna957WTE6iwKz6ewlSAYcwC9UBCAtS/
         9JAVJjkjtMB05v4rSfZjygDps3F0gjzxBDU1sg8ddNmyea7bNYyVolaKpDmWY4XmWwl+
         wjbbZAygpRotVRSpM51QhFkn4NSMrDqZoLj25EG2HNLXL6gGmWJ+VcMWVWUT/Hg3DfdD
         0r8+Je8PZCstY1aLNPvxU02OXhYFmOfUcy3HOqn/s7/6fov3De0a1ELgyzsEHLm7+PKN
         txdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141955; x=1728746755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBthGFf8BfR2i4dob959bB47CFsEJX0Mf+aRMHd0jM4=;
        b=A4/dWMsQMbU9dRlvc/fGbmPSK22M96toK8UnUMtO3tp2mQkzr5CfHLgJnvhf6Y/lL2
         6lkA83A4eeQ/dyBaGIBwZM1IMD02R5c1lI/NBZ/d/6lMcmjcCMEte3hx3ralZ9gG2cdw
         G5i6RgYI9UqQQDnwaKustxGCPKjYOJZLuETMHX9hFjOo1O/GOlaBnY8afNzNAjAYUXao
         kEQ8gZtM/YWijEx/1IRZZzaOQE4N/HgV/2ZdzTh7X+4bcANasP5N+6g798VNnl7J8bIE
         xTUXK+7YhY9eKO9iCLvs+wdimoWy+j8X6FyfTemnw6WWdMetTQd+wtfhiM84SnGA5Ti5
         bSsg==
X-Forwarded-Encrypted: i=1; AJvYcCUKGE8WXOIWLIeDISLeF5PphHQs/I7LVpplO+qMAiNkYtTMBsRH1Ckp4kK6LfiGCuHzjPDr/v5nM0eo1tk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxup/TVb69kJrO2fDpHg8UQEJi7pm27rFHu36mrSEDLZ708P8s
	+pbU+AJAPoYf1SKx0ffVabwSw5lgr+zcB21lsHF7MC3w+262tv/sp1WlpCHeg1U=
X-Google-Smtp-Source: AGHT+IH7Xmy/UoZFDozrpGZR2JXAjehjcUEjjy3Gt9EAYcog/cZlmR6Wqao6wjaMYAvpmgnjtSqiEQ==
X-Received: by 2002:a17:902:d581:b0:20b:419e:9f15 with SMTP id d9443c01a7336-20bfea570admr86092045ad.46.1728141954795;
        Sat, 05 Oct 2024 08:25:54 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 02/20] accel/tcg: Expand tlb_fill for 3 callers
Date: Sat,  5 Oct 2024 08:25:33 -0700
Message-ID: <20241005152551.307923-3-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index fd6459b695..58960969f4 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1220,25 +1220,6 @@ void tlb_set_page(CPUState *cpu, vaddr addr,
                             prot, mmu_idx, size);
 }
 
-/*
- * Note: tlb_fill() can trigger a resize of the TLB. This means that all of the
- * caller's prior references to the TLB table (e.g. CPUTLBEntry pointers) must
- * be discarded and looked up again (e.g. via tlb_entry()).
- */
-static void tlb_fill(CPUState *cpu, vaddr addr, int size,
-                     MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
-{
-    bool ok;
-
-    /*
-     * This is not a probe, so only valid return is success; failure
-     * should result in exception + longjmp to the cpu loop.
-     */
-    ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, size,
-                                    access_type, mmu_idx, false, retaddr);
-    assert(ok);
-}
-
 static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
                                         MMUAccessType access_type,
                                         int mmu_idx, uintptr_t retaddr)
@@ -1631,7 +1612,10 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type,
                             addr & TARGET_PAGE_MASK)) {
-            tlb_fill(cpu, addr, data->size, access_type, mmu_idx, ra);
+            bool ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, data->size,
+                                                 access_type, mmu_idx,
+                                                 false, ra);
+            assert(ok);
             maybe_resized = true;
             index = tlb_index(cpu, mmu_idx, addr);
             entry = tlb_entry(cpu, mmu_idx, addr);
@@ -1833,8 +1817,10 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, MMU_DATA_STORE,
                             addr & TARGET_PAGE_MASK)) {
-            tlb_fill(cpu, addr, size,
-                     MMU_DATA_STORE, mmu_idx, retaddr);
+            bool ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, size,
+                                                 MMU_DATA_STORE, mmu_idx,
+                                                 false, retaddr);
+            assert(ok);
             index = tlb_index(cpu, mmu_idx, addr);
             tlbe = tlb_entry(cpu, mmu_idx, addr);
         }
@@ -1848,7 +1834,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
      * but addr_read will only be -1 if PAGE_READ was unset.
      */
     if (unlikely(tlbe->addr_read == -1)) {
-        tlb_fill(cpu, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr);
+        cpu->cc->tcg_ops->tlb_fill(cpu, addr, size, MMU_DATA_LOAD,
+                                   mmu_idx, false, retaddr);
         /*
          * Since we don't support reads and writes to different
          * addresses, and we do have the proper page loaded for
-- 
2.43.0



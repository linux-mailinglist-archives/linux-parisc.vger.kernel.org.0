Return-Path: <linux-parisc+bounces-2482-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD925991A6E
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A51AF281249
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6C7153838;
	Sat,  5 Oct 2024 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="svGGwJDh"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA01552E0
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158765; cv=none; b=efJRhdLTdysCVTJojtOe4iLRGYNkcOSaz8tJDMmJ1yWjVOUvd+XlfCdegU0HDeOBt3hezoSUkWcvohMtvwedIRoHJunvLEi+QKH8bnFxoDqo0GKDo3eiYo9JAPE+xjiWyYpv5K6/+xYqh+ua/TcNAS9XE+DhfQ7GGPg7HSZf3+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158765; c=relaxed/simple;
	bh=CsqbOG3MqlbMWcSFdA2BCSBmA0dzoz8OyW/OJILfreQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2EfpZ9y9yRc79WDa1FsS3uG2ctDgntEVAYTBc3Z/q7AZJ7QuzRdOpemwHmb1utn/b85t9r3JeSJUsPjSVnO3zpahe0R9tiMrYyg3KGFtXjAchVeiugRFXa1nWEq8aglRVcxBoxt8uVEBh4kAEr7Jm4b7KlMzZ1t+KXnrxizsJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=svGGwJDh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b7eb9e81eso38275615ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158763; x=1728763563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBthGFf8BfR2i4dob959bB47CFsEJX0Mf+aRMHd0jM4=;
        b=svGGwJDhSUAKWMote8NWCzoiYx7BBjBQ5BBiC43ekyzjG803v46i0/0XtVVd860yf8
         ep8i5DPira4ntBp0dBm3cyGttcX1M2ZkNx86RX3W90Hf0slHIu+yRaFMVQes8IhhZ3ic
         m70qOI0CEN/vEU8g+thiOhsGpuUlzyiuRcHrRJ5BpHC5Kp0NDdglj38WC24Ooys2t+9x
         NICOqMOoGW9jaRKCEecOkOIcz/pZtpfza/dE3dIqHayaZvszjxOff0g8W410LmRjixRE
         fiVVravR3Nl9zkBUGdKt9IKNvLP7nlA3lL75e+R8D2IA/UQaWyYw9iFtjrU68onbxB2e
         w4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158763; x=1728763563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBthGFf8BfR2i4dob959bB47CFsEJX0Mf+aRMHd0jM4=;
        b=D4WYunDvu2l8f4Rlw6z7gNz6GqlN469bumtYdXZ7j37N+qSOxmbJMH9heKAo1pPNAN
         C4mrRMuk0JELFFx1ak9WtxglybnAM65+lZCpvc1rfVhmeQ9Vf1pT2gzDqw/tPfwWEzOc
         ehZn8KkKi8ZyQ2tPlzFhxEPWan4Y8kIFC4syJEcmrWAYUuB3BzfQ8xHGsEw0Mdc3MK71
         TbhG9oEkvptq69/NCHxkCpeNUyj3SS14znrwculYV8ekFKrxCuf0e/yMQ6x4FmGkswrX
         H0UiMQscfstlXTuQwWZzOSFqOZoc2/sRrbCMtTsbN9VcHomyR9KcHlz+fPECEmRR5Hdq
         ThdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUffSogwQCVPnfD6ExQBrRkYyJCB39GkkDT1nlkkob/3KcaBSnT+c0UIY3I+w8ftmNoHT/XA9/a2MUV9yw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtrNWrf8Dqc3EwBptlGsn58VCCU0gni4DK3tX8PVlSyfW0E4C1
	64RnxGLqCqjUoKgQ3e1GFnNVOZsDPuo9fxduXDaSdORvdOOL5olW9IwkFnsokOk=
X-Google-Smtp-Source: AGHT+IH0bNmSgTilkfsUlgJ9vbuANm1j0xSSg22B3KtpzdX6j/LOhzX6NRgjtvxwOpPWp0dQMEWPcA==
X-Received: by 2002:a17:902:e5c6:b0:20b:6ede:5b1c with SMTP id d9443c01a7336-20bfdfeef3cmr94363425ad.25.1728158763513;
        Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 02/21] accel/tcg: Expand tlb_fill for 3 callers
Date: Sat,  5 Oct 2024 13:05:41 -0700
Message-ID: <20241005200600.493604-3-richard.henderson@linaro.org>
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



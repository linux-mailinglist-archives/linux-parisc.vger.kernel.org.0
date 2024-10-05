Return-Path: <linux-parisc+bounces-2499-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC8991A7F
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13ED2281016
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B62130AC8;
	Sat,  5 Oct 2024 20:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vVAUlrZ0"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C4F153838
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158781; cv=none; b=GEF7E7tihyercF11sLLOxDyNpGGc47MfaU7ennmu2YPhfVhtT05aj3Q0/WKBhCqiFFj0vdnmIy9i+nxX/+gfmoLYmEF/RW9AzJTCQH7zxLDqAK3LvfH7woYSFaJQA213wXge1eYczo2TC8AVSKVrYwIE78MvMmxgqiNO9XQP0HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158781; c=relaxed/simple;
	bh=GfbgeWhvJZEkGvmTmmQeIHTRaV4I16CMz8q34Fkno2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/OPBcMc9w3UQvZYpFobjMIFvbqi80tYGai8v1KEnjTm4lat/sIjuyHeP7LGRoFGTbTkijrMfmEZ9iGBl4H5XS+ktcgXeonqA2llkZ4z7XysBLDarBq31mnoe20iSRuEP9EvhMCcdtrPyQFTtfvvN5XmiRW7x0rpfa9Q8JE6P9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vVAUlrZ0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b58f2e1f4so21812865ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158780; x=1728763580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZHU/9Bj/Yhl/fLIAf9ED9KKjqQvRkGT+c+Pl2SvUJY=;
        b=vVAUlrZ05g2+FSOVXaZmL44g1lt2dpVI4KYgr9LWuwWV+VLy/lGzfhGAkc+EYn4AQL
         pKxlUNAG/XwS8k8DQYXSk9mII3DlaE1BEuzcJz0UOGUInnxO2bvydJhbxNAhD4ccvH9E
         xeiqHCYrIW9uMz2xoip1OOKmBs/4VwBqTnjH8UzrfEWuYVSGwu5xyPYA91isSkOqEWny
         f85X1dNeNpFctS+KzB4x66grC4ezSsuAR093lrz/Flkmo9YsrhJJcsL4tsTPFUNBjxOk
         i44da4dhxorAxcbwexY8PzA3N79vEeG4s34qwGnux99BkwxVttZnxYos1mIyiqfabiEO
         h4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158780; x=1728763580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZHU/9Bj/Yhl/fLIAf9ED9KKjqQvRkGT+c+Pl2SvUJY=;
        b=iCmqyjuCE+Hsw7crsgkC9uI/WYR5gBxKFCHBWEh61ZZLCFwDUlvI91Xx/NmJCMGH5b
         N8B6UEg5etXwBamFg4yOQ/d4GMeOcbV81dBDPmJfro58viR1FKeCIgfAr/+LJhwINoKo
         A/WijHMoGs83OcE5weegLc1C2ylGDsoNqJ5s6ZaKabnEUIvOAQw/5CWAtad8ZI/wiB4U
         tRc9yliPGV1h6v+8h6ey8bbhqbZtiFVfG7NofFEVq5OBcS8xYH4EnzLCfQkZxkcCI+DR
         xP1b/7u45inKMebRT4++eaPXDBGKLXjfJrpWuh4H4nrsEB/+BWEueMi+pjZh/ZAxjZ55
         xB7w==
X-Forwarded-Encrypted: i=1; AJvYcCUR6GJO1WXwAco+nE+JGr8oxvR3IipwmH5g1qe3zL9o+cys08Nph6nQtrB+Aq1JTyALQpvZhH0XRjyn+Mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPeHvQICrUHPLeL/5PRGrWRbPUQPi8esBYfZ4zumwRc1zhzUvw
	AtfojE2wGyOkB/peqH1BryboBCUzrZlMlF2p2yWIYGCSD1aCRmuLGpvIb74EmI4=
X-Google-Smtp-Source: AGHT+IGaG41RXKz72+WYu6xA+vlkOEFZ7bvd3v+g0ts4N6YOcoq8IJtsLlpIollZYFin0+jpif++rQ==
X-Received: by 2002:a17:903:228a:b0:207:1825:c65e with SMTP id d9443c01a7336-20bfe05f3c5mr90235625ad.18.1728158779678;
        Sat, 05 Oct 2024 13:06:19 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 19/21] target/arm: Move device detection earlier in get_phys_addr_lpae
Date: Sat,  5 Oct 2024 13:05:58 -0700
Message-ID: <20241005200600.493604-20-richard.henderson@linaro.org>
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

Determine cache attributes, and thence Device vs Normal memory,
earlier in the function.  We have an existing regime_is_stage2
if block into which this can be slotted.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 49 ++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 238b2c92a9..0a1a820362 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2029,8 +2029,20 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             xn = extract64(attrs, 53, 2);
             result->f.prot = get_S2prot(env, ap, xn, ptw->in_s1_is_el0);
         }
+
+        result->cacheattrs.is_s2_format = true;
+        result->cacheattrs.attrs = extract32(attrs, 2, 4);
+        /*
+         * Security state does not really affect HCR_EL2.FWB;
+         * we only need to filter FWB for aa32 or other FEAT.
+         */
+        device = S2_attrs_are_device(arm_hcr_el2_eff(env),
+                                     result->cacheattrs.attrs);
     } else {
         int nse, ns = extract32(attrs, 5, 1);
+        uint8_t attrindx;
+        uint64_t mair;
+
         switch (out_space) {
         case ARMSS_Root:
             /*
@@ -2102,6 +2114,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          */
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, xn, pxn,
                                     result->f.attrs.space, out_space);
+
+        /* Index into MAIR registers for cache attributes */
+        attrindx = extract32(attrs, 2, 3);
+        mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+        assert(attrindx <= 7);
+        result->cacheattrs.is_s2_format = false;
+        result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
+
+        /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB. */
+        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
+            result->f.extra.arm.guarded = extract64(attrs, 50, 1); /* GP */
+        }
+        device = S1_attrs_are_device(result->cacheattrs.attrs);
     }
 
     if (!(result->f.prot & (1 << access_type))) {
@@ -2131,30 +2156,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     result->f.attrs.space = out_space;
     result->f.attrs.secure = arm_space_is_secure(out_space);
 
-    if (regime_is_stage2(mmu_idx)) {
-        result->cacheattrs.is_s2_format = true;
-        result->cacheattrs.attrs = extract32(attrs, 2, 4);
-        /*
-         * Security state does not really affect HCR_EL2.FWB;
-         * we only need to filter FWB for aa32 or other FEAT.
-         */
-        device = S2_attrs_are_device(arm_hcr_el2_eff(env),
-                                     result->cacheattrs.attrs);
-    } else {
-        /* Index into MAIR registers for cache attributes */
-        uint8_t attrindx = extract32(attrs, 2, 3);
-        uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
-        assert(attrindx <= 7);
-        result->cacheattrs.is_s2_format = false;
-        result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
-
-        /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB. */
-        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-            result->f.extra.arm.guarded = extract64(attrs, 50, 1); /* GP */
-        }
-        device = S1_attrs_are_device(result->cacheattrs.attrs);
-    }
-
     /*
      * Enable alignment checks on Device memory.
      *
-- 
2.43.0



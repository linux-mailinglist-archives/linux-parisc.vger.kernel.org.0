Return-Path: <linux-parisc+bounces-2611-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61135995C05
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AD8D1F23508
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDDB163;
	Wed,  9 Oct 2024 00:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mv0aX9wl"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2FD383
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432314; cv=none; b=hCQO7/OO+fnBwAVk/nR969eZPoISXECSU1yvqaCZaMzwIQT2p7EbQTZ3LQDFLMojBKjs5jZdILcQtaMv3Rlz83/gd+kt1qNB09aAWkhdhT7AmGMa0NOvKqecIABlB0OZGuCiPIKw2zncS/kXEGk6QFnf4PMV0GbxM3mNs3xIeTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432314; c=relaxed/simple;
	bh=uaZwcGJfviL3/sU4zyB9wfeakv2pmopAkplPZfK2uF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DgkZLy9y1hL9KThiEvUbSS+WzgsapgiSITi2ibUP8NVqM7/1Doen/F04XTVSqXvF8Y6JizOmin3uBp/Re1ztVzcx0Mbb6L12dMzWdgRYqREjx3EK5aUCo1zj8OQztNNrWg3CTeL/XNOGbufTESsKiy/5ECBR8DfwEos0qhMBD70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mv0aX9wl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b833f9b35so54367685ad.2
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432312; x=1729037112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOELs1GBJLtlq8nQGFT7BbF8Y02om3aScvqBsVkX7+Q=;
        b=mv0aX9wl82W5IiJuOfP1p8k0FfVudNp8DaNC6ry+eYUILI0HQfy6O0P0olLoqkBAeZ
         6nxPyqL4DepYA71D5VpD6JHo4Ldksl5B3Zc3TM0il3/f+GKZ2AQ4qlrQw+sgOXxQU1zB
         qZ/S0F8X04dHzh6P0Zo2/n6K6Q0J+vpEokc9vj4OCFleRR9LhfbOyDuJEz8xRnwd3ptC
         mJdCgVm/1A42aEv2hbSc5m4otWDnOnbrF6dtj8VveU3lXdbMXF4CVJxrRhImupaVFjGx
         nGn8z94cWezQ2gnrHxHnxrHezWT/Zd7Y3e/4QCiSm1FZmiW0cgi2llpf9BtvccbWLTWT
         GEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432312; x=1729037112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOELs1GBJLtlq8nQGFT7BbF8Y02om3aScvqBsVkX7+Q=;
        b=RUfBxTLAeQFyxBjTuYg6Is56amAUFjIIANDP5ivXMsJcGJ7OqxI5DGv6QdUIqwggBN
         KSloEXwNDyVYHyyzBTZdjCfIcqSmsWmBzGWk8nVM+VdjDnb5AuFuhgVzYfWywRSF87ec
         /3jxMVPdEEiG/LA3If+dp1a1G7F4Ox0BOLjakeS1eJ93l6lOq4MCSBK7nhVy4/rm14+/
         izEc40fjOCWCGpxlP0OGgxdoZciZYaEb0XiKQwJGwQRQNTmfgqF25pm9AmoNcQzP10Ec
         p8u/FhV+hksZA37tVcDWA2J27OL24uygWdSHO7SYkUoBP08FpRrP2haXEoVJIcBoEgcI
         Zoaw==
X-Forwarded-Encrypted: i=1; AJvYcCUMn8iCVsKn+88AHuandfYFRIgF2ip/Apd/IE1UAaCZ5250poDx7bsGw8zx68wwOYmqxwCrhmvRRUOZeRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1oKWOMZxnPmATq4dUvTbjRP8LHPC/zkm7Hc4VCU8F9UgNtyel
	l9Hy4qDv/3WdrYN0lTuaa9SFp2ME+yAGf/ZoOkSAOz8wsqe/r3fK/EVangRJ3CQ=
X-Google-Smtp-Source: AGHT+IGdLlh7lpqvQhrMnt+h4KRJVDHjJLBqhH4OV1XyMKMzeUf8I/qGPJ2X48D5Sn4234GTGJ8pPw==
X-Received: by 2002:a17:902:ce91:b0:20b:54e5:e822 with SMTP id d9443c01a7336-20c6377b24fmr8881225ad.21.1728432312463;
        Tue, 08 Oct 2024 17:05:12 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 18/20] target/arm: Move device detection earlier in get_phys_addr_lpae
Date: Tue,  8 Oct 2024 17:04:51 -0700
Message-ID: <20241009000453.315652-19-richard.henderson@linaro.org>
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

Determine cache attributes, and thence Device vs Normal memory,
earlier in the function.  We have an existing regime_is_stage2
if block into which this can be slotted.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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



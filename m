Return-Path: <linux-parisc+bounces-2475-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7589917C5
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C185B221F5
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A1D156676;
	Sat,  5 Oct 2024 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NffT4kpz"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE78C1553AB
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141973; cv=none; b=TiykGOM661lXNi3XQ/yVHBQrJxDsX5CHfVgrtOHV2NZ73WiYIs72aEFk3R47+C1hbsN4svs11+uTrz3IG/XkZhOgWSGUWjZi6ceERkujSbyrW/v2rGXsqtBQNUQPH4+5G91TDnsT8gkskJHb8e9nN1Or5DnWpQ5MJfit+FOqAwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141973; c=relaxed/simple;
	bh=GfbgeWhvJZEkGvmTmmQeIHTRaV4I16CMz8q34Fkno2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+/TZIzedPnT98Zptb3lAP0puLgxnC6prgR1v/AXjNvxa/mYXAMLDMpGRQcyR0FM+SG3fyTS47Ev41/xCk+wFAghXaK5IyGL8y2gm+i4/lsGuCiABOePrSYRuItg2vts1HPvZio7AXgTz+ipkq67iRnfQolbtqQY1NJLoAhPllg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NffT4kpz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b9b35c7c7so21873735ad.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141971; x=1728746771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZHU/9Bj/Yhl/fLIAf9ED9KKjqQvRkGT+c+Pl2SvUJY=;
        b=NffT4kpzzxd6DQd5jJdUKa8hGZ3qNwM3+lu7URzErJuu1vROFh0YQLEMC8YDDA8T4F
         JtpjCXgnhJhjosXzPjQK2TRVWR9Y+Vl1n2itjsuxeb/Y3IV8nAS5MwgMntaSYlea2z/r
         4s6sK4KAUyZQgMOiXlDzRXxOCdL4fVgL7+D79RvroyJwLrl2rJ8ns6YmIizTQMVLmeI2
         WMk4WvODr6B6cYrVMlLzAv1YdFZYoLTqvLiQO2fkeCNaq7js9TnLDJRFvBAIhAe2COBI
         CKMTQJ5A+pKHrDJQc5r4TN5q3qjDwFw4SuVP1xhfN7hYuQn9ZxJeMFtDDZPPUgE5A+ia
         uv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141971; x=1728746771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZHU/9Bj/Yhl/fLIAf9ED9KKjqQvRkGT+c+Pl2SvUJY=;
        b=fCIBuXH0UlzatibNqjYEAmf4Y7/380khgmXipIyP5hF6LU7cnaKO9PrRVfQQStuRP7
         Z4tAfjJ7M/RkQTPwm76a9cZZHF/IhRZdnjqglB1HbATHoLNxAubIcIb/E+Po2XBip0b8
         DC7VGsPEJ7ibk4EuFQwJ7glpRS3JdFeoF8zjTs1UAWKSZuQvpJnLNEx4A60q9fA7lnvt
         KRNT+fQDN+LQa13hAc0eeilujWm6ixwL67ubBzW7A6S9V6UePLEnFe97J7FE1Q3dhG0r
         P8NLn1nca6Z1Bww222/rV3Kwv73Ch/wW5ANm+AMZzqSBOKOivIayOgBraG/byiXnzJK3
         fB8g==
X-Forwarded-Encrypted: i=1; AJvYcCXEe6S4bVzQjUQ/XuqKGkyv/XTj550fhCbggosomnl3EAmZGJ2u8VlRzd5IcZFC0oXsqZzY4mzzF3AZz7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBIpo8a1MjTxM8aYFvst34R2MQHP4PJd3pUsIkr3q3XRvVJVM3
	2+8UHZQUp460/duVisYOmXL1OF/bKDnF71HTgWpsHypl8+UdpZEuly2Eb0SQT9E=
X-Google-Smtp-Source: AGHT+IH4Lr64SQZfzlOO2MyBkQGMuSWCJxA1Uid5flyT3IfspQk+qHg9k3FYTQCTF9/9yq+5XQ2JSg==
X-Received: by 2002:a17:903:2b07:b0:20b:8e18:a395 with SMTP id d9443c01a7336-20bfe291f03mr89154495ad.44.1728141971365;
        Sat, 05 Oct 2024 08:26:11 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 19/20] target/arm: Move device detection earlier in get_phys_addr_lpae
Date: Sat,  5 Oct 2024 08:25:50 -0700
Message-ID: <20241005152551.307923-20-richard.henderson@linaro.org>
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



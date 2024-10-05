Return-Path: <linux-parisc+bounces-2472-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 040209917BF
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA27F283232
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EF31EB36;
	Sat,  5 Oct 2024 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fmgh+XPc"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F180B15383C
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141970; cv=none; b=dLVUP9+X5HSjw4ndQY19kws3mwMQNJtn3+gWLTtAHAjLcHKJGZ5WHHfIy+vged40wfRXnXqlHeaSh7hVeviuyGlBTymQxG0XniTtnx4mgLRF7OC8F84JoX3A0V1IXGpUTsars7YMCHZfOd6h+h2KNgosS5Zf1m5xPtj9MSW8GAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141970; c=relaxed/simple;
	bh=dwcQYey/qg79IaExNd/1cs7BEFjH0rBox5pjB3rW+tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvrSSeFxQw2EXQg/n/kVorhAvGPqhkIt6t696+S0QrmVuNRyZx+y3v6uE31owlRaX2KFoihBWS5njRWvpX3EdkBGZnNzi+LoN9Bq3HqNC1fLlMjEjWxQCh8amh713akaPve3X0nu4qXa2wQ0i/UdIu7EI+vBce+KOdxjLWps4EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fmgh+XPc; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20b8be13cb1so33016895ad.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141968; x=1728746768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KXMhwqlNY3FEn9X64ijA0SceY+BOiTFnpHj8/s1p5o=;
        b=Fmgh+XPcYsW0x1AgiX7PlfjS0PSQz6P0bGpTVx6HAuMufq01UWZh2vI8LpGFVh/32U
         Zum+uSRqRuvhqqn11AlcYCelFnQ+aClM/x7cptB5r13R113oinUhZf5227KIgHobNhSz
         B6xpPgc3TfA/7DNBLEGS0ScSsyVkJjEAfQY37xOSX3rG6OcqQzNiNOt9fG7Ya+K1Fuxu
         5pJ1eWxltooJ2Or9EVb71j3ZLLZ09VytzjXPWppeZcx+CZG0RFZ7MbnQKG/S+AjDenSb
         t/zG8MSlmbr20IqYFmQqQ0ZbOLgn1sJHtxSY+aCFwfhrO8zyLPiadfsyDjL8VZz0Nlad
         8E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141968; x=1728746768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KXMhwqlNY3FEn9X64ijA0SceY+BOiTFnpHj8/s1p5o=;
        b=hq6LNvVJ+tjpFn8qO51CiuNuwIHoZj/L9RyJ1slMsIH2ycT7/Y+c9bPo6wu5m/nH29
         A2a4s+j8A0ibTI4PuA1nK1eBzdkgkga39a1u1jKM5J9unXlwA7Mr7EMOUMnejs/PcyWV
         u0XbnP893QB4e4I1vDRJaYn1fV4WipLj+fhRoyXaR9LhzT20EsoTu+Vhdmzw1AovlRYO
         ajraUQ8SqsJuqQqPaEHE3/xjl3SdlFd1mEeY3Dt/Gg9GMtDZxMpcHMO4tHI01lwpceKD
         7HPsTng+dwIM9ZlKUwqUk8eIV5k9xLNuycYI60qO3z6SPgK+IlxlpPY+P98tZ0Pq0VWB
         a/LA==
X-Forwarded-Encrypted: i=1; AJvYcCXkki9VeQB5Xo4K1FGnrIob2UsK8S89Kd9B5XQi1rIvVpVqJhy0msyw+b3AgVqEadteylqHA5PsrbCilLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBk/b3MKkhPvMXUTQVskigmj/FVlBaK7fWkOrHaiiafDFZ3Elg
	LvRbyqT3lRt7jVReJLnFft+qeWiNZu2+DrQ8tDS11+3h16e1QAmX3g7XvD7KqUg=
X-Google-Smtp-Source: AGHT+IHoXvMFOA7jUAYxgFVahS1q2i1bg/ajDF/sY9Oymkr8mht01U8RsKNrUl4cngSkkvOkcrfljQ==
X-Received: by 2002:a17:902:fc4e:b0:202:4666:f018 with SMTP id d9443c01a7336-20bfdfd2693mr105297675ad.15.1728141968397;
        Sat, 05 Oct 2024 08:26:08 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 16/20] target/arm: Pass MemOp to get_phys_addr_nogpc
Date: Sat,  5 Oct 2024 08:25:47 -0700
Message-ID: <20241005152551.307923-17-richard.henderson@linaro.org>
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

Zero is the safe do-nothing value for callers to use.
Pass the value through from get_phys_addr_gpc and
get_phys_addr_with_space_nogpc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e92537d8f2..0445c3ccf3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -75,7 +75,7 @@ typedef struct S1Translate {
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                 vaddr address,
-                                MMUAccessType access_type,
+                                MMUAccessType access_type, MemOp memop,
                                 GetPhysAddrResult *result,
                                 ARMMMUFaultInfo *fi);
 
@@ -3313,7 +3313,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     ARMSecuritySpace ipa_space;
     uint64_t hcr;
 
-    ret = get_phys_addr_nogpc(env, ptw, address, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, address, access_type, 0, result, fi);
 
     /* If S1 fails, return early.  */
     if (ret) {
@@ -3339,7 +3339,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, 0, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
@@ -3406,7 +3406,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                       vaddr address,
-                                      MMUAccessType access_type,
+                                      MMUAccessType access_type, MemOp memop,
                                       GetPhysAddrResult *result,
                                       ARMMMUFaultInfo *fi)
 {
@@ -3547,7 +3547,8 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi)
 {
-    if (get_phys_addr_nogpc(env, ptw, address, access_type, result, fi)) {
+    if (get_phys_addr_nogpc(env, ptw, address, access_type,
+                            memop, result, fi)) {
         return true;
     }
     if (!granule_protection_check(env, result->f.phys_addr,
@@ -3568,7 +3569,8 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
         .in_mmu_idx = mmu_idx,
         .in_space = space,
     };
-    return get_phys_addr_nogpc(env, &ptw, address, access_type, result, fi);
+    return get_phys_addr_nogpc(env, &ptw, address, access_type,
+                               memop, result, fi);
 }
 
 bool get_phys_addr(CPUARMState *env, vaddr address,
-- 
2.43.0



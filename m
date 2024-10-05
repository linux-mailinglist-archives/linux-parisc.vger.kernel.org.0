Return-Path: <linux-parisc+bounces-2496-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE35991A7C
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42DF11C20B5F
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B571552E0;
	Sat,  5 Oct 2024 20:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KoEfIGfR"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F564157E6B
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158778; cv=none; b=PFP1lOrocPxlg9IUo0GT+wKiGCm6SyCFJb4zbeuf5OG2M/jL1IrMkJP00NKFubsTI7ct/fWIaLzeCOf58ZulMEtvdpAqlWUof74OcN9W5aLI15+idgeY6+V2S32OSxNhZCs3UE+rWLMCvUkhuOFxtAzix+ah2GPNL9yfQ3FCk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158778; c=relaxed/simple;
	bh=dwcQYey/qg79IaExNd/1cs7BEFjH0rBox5pjB3rW+tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLwQSq7PUPUARReBfPw/o9oGazNGcs6TB6IYk5XNLIZfn3sL+vnOlwkWFvjI+xGcmfnxIhQl/Y2OXdmaf0x9rthn95YNxG/iTIaJzrGExPEi0U5W8HSXxVKDpTbsZ6TyiRFydI6x6mV44o8utT+1JcYVxOmopyD+Bz/uAVixbx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KoEfIGfR; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b58f2e1f4so21812745ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158776; x=1728763576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KXMhwqlNY3FEn9X64ijA0SceY+BOiTFnpHj8/s1p5o=;
        b=KoEfIGfRtZmizi96vJeNNI+7tFyB9tXlfZHw7Uwd+BNtPC1jjCEg3njxMN9G1qF86Y
         M3lHOD3woYqLcWE2cFlEhMS6ZO2RMFDgI2ROyqg//YEA/G/jptRMvQItb1Ywv96BZ0jU
         QSeAhRvvUNF/QFXT7HxTUIjw3+yYZ+zSYTZzyf6L7KNym2/ac/ICGfIA3STroUWHO7mx
         jchSN1RP5vyBhL1qNG9zPiVZirLSUtZ4i1nb/xUYUjqNMtKbPoF0gOVdChMJ8zuWiGkH
         3UFTT6FIa7fgpM48DTaUlvclqP/X0YqOTdMTYD/XVCboDyebb1oV/wfuj7Uqq6WFfs8+
         pTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158776; x=1728763576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KXMhwqlNY3FEn9X64ijA0SceY+BOiTFnpHj8/s1p5o=;
        b=KifAj/qCKUUKThCQNyCm/Er/ImSft48iIDej+So2Q+G/vDuC9dDwL9o+lipHZTfWN3
         TRQhGJP9hmdan7TmmM9SL9iaL+fmsj3aLHuqIxcGbi1zvVRjqVSzVTe6ZTb5VbFqxF4B
         ZjJCd3SkzARc/NtURFOA1r25uobLvaZlD2MUH8D+6GWPIhZGsuTmrgv6IQ/zTM9cQntK
         nbsfB98dUE1J09EYjLutnu/ZaiM9czqHUvDMulIr5E+vGLMZUAFCkXhbG/VRSP+dmqMu
         +lPNTAbXRxkqYX3a4yw1iEBrkbAamBye3T3NVOfBjF4dWcFZggEet8H2BpVF+XRFuATA
         lCug==
X-Forwarded-Encrypted: i=1; AJvYcCVdFbi2PmuA9fNKs2eY50MWHGIIEZfxS+uXTt2bzxWqhOk5lE6/Iphz2lUUmoMvq5LK42ArT38UgzZUeDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxgC8yGmJZ1k25FZoo5tWEJgkqNtZbdt8brRSJ3JX81fC9Q9Wv
	hmu48eXFgxTk7m3x3GoYINfjbF/XZ1i9doh23p0Uj8jqt6Kl4HRCPJPFOYXog9aX3IcDwCMCT3/
	4
X-Google-Smtp-Source: AGHT+IEc/YiENR//GQsH6NJPwFKZle512StiSwrb6jw4fVSQbkD7P+i/ct1jx2CukoHpWHGxpya25Q==
X-Received: by 2002:a17:902:ec84:b0:20b:6b68:c635 with SMTP id d9443c01a7336-20bff20ca7dmr104384815ad.58.1728158776618;
        Sat, 05 Oct 2024 13:06:16 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 16/21] target/arm: Pass MemOp to get_phys_addr_nogpc
Date: Sat,  5 Oct 2024 13:05:55 -0700
Message-ID: <20241005200600.493604-17-richard.henderson@linaro.org>
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



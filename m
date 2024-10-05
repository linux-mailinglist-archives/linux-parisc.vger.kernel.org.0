Return-Path: <linux-parisc+bounces-2473-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB74B9917C0
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC78C1C213D3
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E71153BFC;
	Sat,  5 Oct 2024 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+5LvH+F"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1AE1C6A3
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141971; cv=none; b=aoInwsZ7me6366kxeSt8R7xr5I2FK/EfB1/obev4NuIxP6M2Id4wu4xXyNPofpRWVsJ23cWpiqAjvCf6vgJwsw9ZPpzX1D8aSTkoygOh/tNObxJ305N+I4zzHWPd5EuWgABgMOsrNvlzy3MSXMCocuy3w8GHDwQWXVn1sZojPXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141971; c=relaxed/simple;
	bh=mKNr4HPQW8zX73f98vjtas3HbqrZ2mbpCZvK/LaYaik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ElW+UXndpyAp+9KLjN0WpDF49jxC1As2SQCHxxEjhoXyRhjJu28EXiGOxE3Vfo5qqPpV/vfbp68g44Y4pP9MI2uFvfU8Frmmk2XyPHpfE8Pq5rqcwn+Go8kyAPLQA3JxaRsxH6PBtTY8YJzDnUQjvy9qP02YCUU6q9G//s8u3XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+5LvH+F; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b5affde14so24156465ad.3
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141969; x=1728746769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB3S/z+Tf/YurYPbjZAkQ2iOmy2pkllXkguo9aONGm0=;
        b=g+5LvH+FqdXlNv0wBY9hflMYh4rFuINTgWXElWYyDiqLO0eTgw1dal2FfGXuo/WI5X
         OgGIhE/Twf+ne/su2aKcpZBSjE2avXZFpX4iAJifPL3gwwo19OCXiE5MIxCqgLFHjwtY
         8j4runxNAR+g0BCud2RVx0Io6s/9xulWAz8PLP4WEnaqgpKxt2MEBd3/gk7T3VpVLONl
         i/GGCqanaRDeHUhlQUTz4Bz6d0Wo8aAn7jAZ3U7Ol6o1+V282uanVqfv+V0yxsOzwS1c
         BXDnRxkcVWjL3f5NfvTk+FQjo3dzL5rPLNU7+RymudAyR1499+eBJ2117BP/d3nuyaFX
         cSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141969; x=1728746769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB3S/z+Tf/YurYPbjZAkQ2iOmy2pkllXkguo9aONGm0=;
        b=ACldlXtXdmYmZ6YnH+BMUP6h2zCoZLHp3inqgFOzE3U9eDEU/aNraJCxd4wlqkuXKR
         8/KaDpyKbmZtVbg8IkeqWMtMPvjkGmrosJUpXAAweXj6NrERQ/knf6sR/M9LjZM86T3h
         AODHWzmEVgWkGZ6zq0i3XqLwwq36C6+t2ILeXIIsPsXNOO8V6soZCFY6zGjl8FjJNA3a
         gAKmlccF3gaZAd/T0YCh9h0vVdg9U9swKa+Lc4dDXHrQy7Xr4hgunaE/jRMT9U2x5L4K
         3fl2clhBDUKnDupH8MHXFxyRu47HroCpB5liMnHjOEBcCXWZBV+N7fjMj0zIV4w3Dcpz
         yPOA==
X-Forwarded-Encrypted: i=1; AJvYcCVmr8cOFG5sPTCBzDCWvHjJFG2RcW2FIpLSkxvGqMcWhTNiPfiVGhMLyT+kymrWN1QeLo6vMtE3YLPd2aU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ7QpNUPr2y7tm9Aw+CvPFD2tLOsuwylX5Tm2GpU67yVoyPKlr
	sjk2vEZi6Kn5m72R7jkWWZEY5kEB/q9l4pe1hFMA797DUkH1T5G8I4bkGVxEIq4=
X-Google-Smtp-Source: AGHT+IHGjDyFhoX1JFcZLwPMzIWk0VZ6VyK/OgPBEe0dpV3tD5qpqz+OhbMKSWs06HyBvYG2qhd0Ew==
X-Received: by 2002:a17:903:2343:b0:20b:8924:3a77 with SMTP id d9443c01a7336-20bfe071396mr82155675ad.26.1728141969294;
        Sat, 05 Oct 2024 08:26:09 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 17/20] target/arm: Pass MemOp through get_phys_addr_twostage
Date: Sat,  5 Oct 2024 08:25:48 -0700
Message-ID: <20241005152551.307923-18-richard.henderson@linaro.org>
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

Pass memop through get_phys_addr_twostage with its
recursion with get_phys_addr_nogpc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0445c3ccf3..f1fca086a4 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3301,7 +3301,7 @@ static bool get_phys_addr_disabled(CPUARMState *env,
 
 static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
                                    vaddr address,
-                                   MMUAccessType access_type,
+                                   MMUAccessType access_type, MemOp memop,
                                    GetPhysAddrResult *result,
                                    ARMMMUFaultInfo *fi)
 {
@@ -3313,7 +3313,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     ARMSecuritySpace ipa_space;
     uint64_t hcr;
 
-    ret = get_phys_addr_nogpc(env, ptw, address, access_type, 0, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, address, access_type,
+                              memop, result, fi);
 
     /* If S1 fails, return early.  */
     if (ret) {
@@ -3339,7 +3340,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, 0, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type,
+                              memop, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
@@ -3469,7 +3471,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
         if (arm_feature(env, ARM_FEATURE_EL2) &&
             !regime_translation_disabled(env, ARMMMUIdx_Stage2, ptw->in_space)) {
             return get_phys_addr_twostage(env, ptw, address, access_type,
-                                          result, fi);
+                                          memop, result, fi);
         }
         /* fall through */
 
-- 
2.43.0



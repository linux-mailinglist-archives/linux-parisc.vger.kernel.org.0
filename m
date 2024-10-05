Return-Path: <linux-parisc+bounces-2471-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAA19917BE
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6D841F22BEC
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703F6154423;
	Sat,  5 Oct 2024 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZ2SrHIQ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA701C6A3
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141969; cv=none; b=nmkYK2VXrfVv60xDCFE7c3cDKAUbQ7kSHxY3XUxRCjpfu9zhmGw1OHzuIuyBDuE70kgX9uEDV5ooMsGC01NGCEECk1WrRatxaVG5agGtgr6YXZJnmc35qPx5lQMleYvwQr+pXIli1YMRmGWxmkfXD0ivVjdoatc51oJJ84Rn9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141969; c=relaxed/simple;
	bh=XTzfK06oaFA2G+iVog17UM/vpH9ZZI8haEnAh7kVvHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbwIdqLaL0Io/lDjjwji3Jv+MO1Up7ZRfSl+ehNs1ocsYIDHNenBzVBvt3yR1zWRJNehQd8gNhfWN19NDmrigHMQ6nVxED78eA9pbgJgGRqI5U7Wf8xTw1ooIKLqhCCV2Z4d9fdivBbMz3p1Ix/G/ESxsXFVT2TxLw1l3F+GwYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZ2SrHIQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20bc2970df5so23724365ad.3
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141967; x=1728746767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X5zP7zXx4H0vSkmfgBSYylbUDArgVMPw2dfqzvhfaA=;
        b=TZ2SrHIQCgj4Cp3nTnccPw7hKkLUNL/rX5fu5F7zihmvsHTf0a9kCTGeI6dqYXULbN
         lVRWwaUycJtPicvdWKxgkDE8+OVO0XwRerSisSaN7HJDkTAIqF/JKLfq9T9KrdfTlA70
         nRei4gcifpx6HHbqeNGnNBtPVAbnMJgWvUSACJg/ZVLraLnAT8myjbXdNU+61vSuK8y4
         2wH/u8Zth7Q6ZPsxeTyFk6dS9sxKNqQnLtQqN3rJbBamdjP+4/ezRvPBXIBFZMi1e9mP
         /tVaD0Mj6quG1nKs0MiORIE0TNmga2ZgnJ3fjcxc7sKjXQONf+9ASohqsJRbryIob+er
         fQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141967; x=1728746767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X5zP7zXx4H0vSkmfgBSYylbUDArgVMPw2dfqzvhfaA=;
        b=K0dQnWop3w9PHmQCwyEefbDM2XEV8e9HSIcq5BNBnVnLud+yuWdewLet2vt7ubgjsT
         HnEvOv6UZuKNUUKFQsNFjNDyiNCebZlDVhVVfIGzCENlzdbf1bNPhKAiePNXnBemNBuM
         zKC2Mf+osqJst3lGF9TZvLwRJUJQyZizrsPxSI0xfswNhuFE0roDFYe5vFgRhUbfFUiM
         s/IjScEwfwH+mU5bBmujBrsdd8Sl/SBgljNI51XO7Aw4oiSGX7WrelT15k9v1pvLSFoe
         3onUxikyIKKirdKJLr5a1rvnysvReo1qytgf2uXCARI3ICqDTD82gv/o7NSn02pAHkRP
         ucew==
X-Forwarded-Encrypted: i=1; AJvYcCUhAttQxPvt08WU9uYFEn/wuX3fFKWBEf68Mu3f3ANnYM1GsB1O92409uzb2EO+Xf3QJy+wCP/GdXSmnP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvNCHr/CspoQX+tQB7/BhUaMYWk2FOcPq8q7rHRcsHvPvCbf2
	EitRYY7UMwXiW2G92JW6jQRHYYnGJe1c31+qI3ZGk5Ju/uo03vAqeo4T+hTvy1k=
X-Google-Smtp-Source: AGHT+IHY99g3UXT4c2ojVRByg/b7oYD6LPj2/nVP/Gw9LAajOrCDKRjQrnpHrqEZDe38lbLZqZ4qcw==
X-Received: by 2002:a17:903:1d0:b0:20b:fa34:7325 with SMTP id d9443c01a7336-20bfe291d4emr83779435ad.43.1728141967491;
        Sat, 05 Oct 2024 08:26:07 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 15/20] target/arm: Pass MemOp to get_phys_addr_gpc
Date: Sat,  5 Oct 2024 08:25:46 -0700
Message-ID: <20241005152551.307923-16-richard.henderson@linaro.org>
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
Pass the value through from get_phys_addr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9af86da597..e92537d8f2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -81,7 +81,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               vaddr address,
-                              MMUAccessType access_type,
+                              MMUAccessType access_type, MemOp memop,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi);
 
@@ -579,7 +579,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         };
         GetPhysAddrResult s2 = { };
 
-        if (get_phys_addr_gpc(env, &s2ptw, addr, MMU_DATA_LOAD, &s2, fi)) {
+        if (get_phys_addr_gpc(env, &s2ptw, addr, MMU_DATA_LOAD, 0, &s2, fi)) {
             goto fail;
         }
 
@@ -3543,7 +3543,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               vaddr address,
-                              MMUAccessType access_type,
+                              MMUAccessType access_type, MemOp memop,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi)
 {
@@ -3641,7 +3641,8 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
     }
 
     ptw.in_space = ss;
-    return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
+    return get_phys_addr_gpc(env, &ptw, address, access_type,
+                             memop, result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
@@ -3660,7 +3661,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     ARMMMUFaultInfo fi = {};
     bool ret;
 
-    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
+    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.43.0



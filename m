Return-Path: <linux-parisc+bounces-2610-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD2B995C03
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 476941F234C3
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1D664D;
	Wed,  9 Oct 2024 00:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcuEX3de"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762AD36D
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432313; cv=none; b=ta8Fn+sdsGGm15GOuPOhAWltAPxZvNkKn8lpkIxHyL17yeeGJBIqmbMpj6AbIdeuHMEUA2fyHucZWnib4CpvfSJe+y9pDVuJp6IWDaha5ZE5suejDJhLzfMTl9qjQ+wXxM+7ku0Nj/GEr1bsEIs4weS18MgrllAY/d0ZFO1WniA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432313; c=relaxed/simple;
	bh=XXeh5EVLf/6WhaIHsqgYsIvJxVqgX+w1E9fSs98UHo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/TvLUUEB4i/tg3LPte6p1PdP0SIhmFdB45MgHQcnBxZpqzP9YdXjnehgYkycoZEZF2ArX1AgJv0Uu/W3ao2wW3q3diMQwZ3VcR0r5t2JFuKKpw2maA2ffFSaHTWOfDpv/dM61BGhoWKXB+TEl/AxBsvhWxMGv4vEpdMvAYBBC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WcuEX3de; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7ea03ecf191so2488135a12.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432312; x=1729037112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDNpltdoK5BIHBCpA0bLYhC/fVRvo8Z+4KE41wqkR3g=;
        b=WcuEX3de8wsXc4/XWWKBdPO/qoorab1Lnlu3gVxVVLydHXuNf91KP1qP439++UAcjD
         GhmYGsZTNApJyAUGveHAkzEKpFP4V/lATzgv9LEsElbt8agx/widSHYdu9ai4a7j4F6s
         beq5oCB/QC2FUa9QxP61hPVUr/ayfbAuPY7cxQ1SQRyaGEfZ02MByBp3XxgtFQ1buGT9
         si/xt0Amb4VKdklmMUR/yFb9KkuhlDqtrpErRtRcNw+KPScinmY4evtfOqZbwtVyzJrI
         4LiBtc9OKPOAV3EmVXvPLZ/EaabYMRFrsQ2qGc5WcB7T+6omLzgwubDsRrhmFXHw2SnS
         frEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432312; x=1729037112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDNpltdoK5BIHBCpA0bLYhC/fVRvo8Z+4KE41wqkR3g=;
        b=ReJB2bLy5orT7dQdFRwbP68Nt4KnhNylWwz58egLeFR6zDmIQZ0FQdSiPfSJRmPcSl
         +45HRyUyZaLlL2XqVjwwOO2Xdd1JG3epKMw+in23QSjbMjpKPPy7M0py2x6JQBydOlN6
         H+YaKtq/kcMVMKYgLW0tHOUQux5SdBeDzhhQvT8DPlfFJMDRqT7BRWhWcuEcLlc1yyLI
         u9cZb3D9w1X4jN/x+D8QRgoTzD/lg4te4Mysn02AEctCsvDUwAZbaf0MD3DttIf4LYaw
         kXFJIKuC8KDRG+AV8kSbnJe+3zz3jlTGjvbNEiC5xZ5w2s9MKuaSo12SccC/GbZdHDCG
         PGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVejatWyKgIvVjR5Hw1yzSmQPHeeilkx44KgRr/UEZ1WtEXRgrk7NvmKL2WjJO96tjiArylVxxmrU7NEJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze8vVJB2oX2ksoCeyqhjmRWQhUwetjZBsB0CBCji6VTBWIp86q
	ZVBf0qnoQhu+XQC62bDfNiKjo+9/d/mFv8OlL8IUeexsuMDzoo0IsORV2fUYuqs=
X-Google-Smtp-Source: AGHT+IF4BglkotazCAHqUPofHInFIYYYoctu9w4tOUz92qreZT9FiKqKTEYHHdQjaQVFF8PF0y1lkg==
X-Received: by 2002:a17:902:da8d:b0:20b:c258:2a74 with SMTP id d9443c01a7336-20c6373ce07mr11388505ad.29.1728432311644;
        Tue, 08 Oct 2024 17:05:11 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 17/20] target/arm: Pass MemOp to get_phys_addr_lpae
Date: Tue,  8 Oct 2024 17:04:50 -0700
Message-ID: <20241009000453.315652-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pass the value through from get_phys_addr_nogpc.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f1fca086a4..238b2c92a9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1684,12 +1684,13 @@ static bool nv_nv1_enabled(CPUARMState *env, S1Translate *ptw)
  * @ptw: Current and next stage parameters for the walk.
  * @address: virtual address to get physical address for
  * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
+ * @memop: memory operation feeding this access, or 0 for none
  * @result: set on translation success,
  * @fi: set to fault info if the translation fails
  */
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                uint64_t address,
-                               MMUAccessType access_type,
+                               MMUAccessType access_type, MemOp memop,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -3534,7 +3535,8 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, ptw, address, access_type, result, fi);
+        return get_phys_addr_lpae(env, ptw, address, access_type,
+                                  memop, result, fi);
     } else if (arm_feature(env, ARM_FEATURE_V7) ||
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
-- 
2.43.0



Return-Path: <linux-parisc+bounces-2498-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D75B4991A7E
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F38A2811AE
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B41715884D;
	Sat,  5 Oct 2024 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ppLk4gRH"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74C157E6B
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158780; cv=none; b=QUSxEB0/DT2e6wf3Bt/jgr9RWcV/FKzFPJU0NdoFqdDXclUEMTTSkVj9NXsBt3/LEl1Pj4DxHeaatsEbkMYePM5H+Yxjo9wcFTuvsNRpT7GdKP7qGMsq/ZfMZNS25M8a2a1IypLMMIv5KykEPfWx5cLt1lhPWjGaJBqKm78PEow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158780; c=relaxed/simple;
	bh=vw+vuHfKefsP5JRxOVj5kr//br775m5Gcy+Gi29V22g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VntunVFf6cwUOa5NnoU8A8A3TVtP90Zt6CIWE3wRqkD0Y195c/q5sS7WWArNmjpd1GdP5QSrGWI3WKgwI8qFLYCOhp851JqmlqrvB95F7FajPhNKEnWv9IZ6qYOjXPLdwqBwZKjkhE2O3iocatRZNdUuDnP1Y4u4RyvHhkuCUrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ppLk4gRH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20b6c311f62so28404015ad.0
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158778; x=1728763578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tqb0TUsQOZF/sRJ8YxWqhKeQa3g/EH2JXyCvd2UdW4=;
        b=ppLk4gRHCR6Vdlxu9MdDlMObcB2Oy8xmK5Qc7pW272mK0P/bG8OwNG5rmfcukm39dJ
         kR3ZGwaRsnnGWLinoMIXwlh85px1ap2oKdmRIbMKXXzHyKWLB05tHu/HNoo3ZibeP/ok
         o/b5Wn5o67Df0UcumZRPk6SLFtGanAgXl3kDkdIbjSjaWmV7JqbwUyY6/rGSj/Tx5JLN
         Pw3GBgDkECNcTfkqv9j6xCWRKSU8EWkvM+xNPux3cj4aqUxKj9Kh1cR8f/ED8MzeUoD7
         tb04wHT3NzypaNydTeaGHKQJwUsjqvjzZxUhjrF5ZtdIFV4dLn8VaWh3R7idougljAPN
         VUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158778; x=1728763578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tqb0TUsQOZF/sRJ8YxWqhKeQa3g/EH2JXyCvd2UdW4=;
        b=HTjdfZhvLe3/d6sj7FEeB8i8KLKm0Q6JaGtAtP1VqF7ndQ9VFl96i+1MRDLkmApkV9
         /55LUqLI9KxJ8H0x+RN7Gr8q1fix3XwtEvsM5QERQnalkCrAGjicLv6v/uGPQNQ4fQBs
         3H0EHCKmxjxmukYprOpdvJIPHtHVle5G7E4GwwqbVEy+WQacacMToq+qQ+wh+wlYpPjz
         jjEDT8AdEBooQiZpJcG2GuYTpNo5PRh4A5vtUn8tJ8OrCwOw1V4tDnssH6UN9inirBBd
         XNcyni0Jguy7F3ihC9kizgKkV9aH6KNhHDM5564d1lBpWpv8jphiEOqGpkZ5+0qKY9XV
         5z9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhStF+4KyNPhV4JkrxJPIVcnu/IE4o/6jguok5c3xGi7btcjQ+5heyFqdmz8m+ZjgvuuTKDgjiNswrwiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcPDM8ecImDVhnfNDY/M2gQ+I/VrSGUjXQm0vhNAvt7nQsVJpN
	bkt5nP0UUKHZeh1CAAJvutdBFcetM5kgKTaYwrrMQVo7xQK5DfAnl0LGjS6JcgU=
X-Google-Smtp-Source: AGHT+IF/QbpbF3vd5RhMGi/uYgncSfdSoTpNoytfe03axosXsTK4sk6Oan6NQUL6chZLVm5cLU1oHQ==
X-Received: by 2002:a17:902:f78f:b0:20b:7731:e3df with SMTP id d9443c01a7336-20bff1a5c04mr101016475ad.43.1728158778416;
        Sat, 05 Oct 2024 13:06:18 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 18/21] target/arm: Pass MemOp to get_phys_addr_lpae
Date: Sat,  5 Oct 2024 13:05:57 -0700
Message-ID: <20241005200600.493604-19-richard.henderson@linaro.org>
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

Pass the value through from get_phys_addr_nogpc.

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



Return-Path: <linux-parisc+bounces-2474-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D36929917C3
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F8F91F22E0F
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6978D155C9A;
	Sat,  5 Oct 2024 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M1isaE/q"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D8F15383C
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141972; cv=none; b=TmsROpQ0N3rrFLUyhDR3HIkigJDSPvPjWy5e0i2C4b4Xca2cbr1wKqPgmdvSfnpUy5SGHT1JEQn1Ga89xEPvQuSRCEJKXTJbTSdx/IOIEsa7WQrJJdfuVufCaF5CDbIZbUibkHYpN+TcZDBW9FSgxFU11bsScwDMxEXyyPHBU6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141972; c=relaxed/simple;
	bh=vw+vuHfKefsP5JRxOVj5kr//br775m5Gcy+Gi29V22g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+JVhOcpHh5Trohpi4UgJjGgJK2UO2YPSUwtjRNKxA5skf+CNRSlk34pmP9MB1hy72StXCvejux7zNsKe6PWFI/ZJz+GA0XxlOI9XzADK2/IpnEapa+AhJuMYAvOVVhMi+DpFd8ecPa3IKOJx1K8jyPEmrI2Dzn4KRwvzDEHWRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M1isaE/q; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b58f2e1f4so21135125ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141970; x=1728746770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tqb0TUsQOZF/sRJ8YxWqhKeQa3g/EH2JXyCvd2UdW4=;
        b=M1isaE/qn5tdyqJIsxZ2M8NyO+9pcbOKdFKWb95t15Y8+vD2Us/TiXHN/eFktvkmto
         fxs/yH8y4hWOApqa1HPxlnGFuSFnhiISH3+f2N8SMKTFYu2155+wRjxkXNHcPYEDyTiV
         EOcex/RZt1ODYlxRzYWB2fMiVPdD/TNpphCWsss62yoedtY+5kIplMtlZsW5TqtpTOdq
         ZUhO2zQCATc/RafaCa3OsP7DJbZIBaUEoStpH7PwEAvI/4LgkoVa/qCxbwv/1JGksstz
         rGhR1MKqfZnSwxOaBK5BvDwhFHEOzmMcNVg/E/lAQj2nWG2nvwyxnMuDnda9RnD7ZAKw
         VADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141970; x=1728746770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tqb0TUsQOZF/sRJ8YxWqhKeQa3g/EH2JXyCvd2UdW4=;
        b=d+aJmtAz/aEi1y98KnVETzok+WLlSE7seY6TncFH/ztEUGBNBAQhchs/Id03k9UOGa
         4ay0g/PB80xBe1VvMefufq63Q0px6XzexuQ2x+UCoOZ7KbbDeAAuXzjlxPhZayD1lMeB
         SM4OiHFuqvtdVls5BGeWR+6cwyI7GrdZ1smLVrymih7d7E6i+0oHgdFCa+dJd2iA8VTN
         sECIWsWWnPkpy3FLwwLvfpsGRLqjHfj7lWr91FBV0xk31Xq2WWBeYDwJqGIyi2jhGWdf
         GHA34SCV7aDR9ZVaTwn8YgAm+a0qDjf1usz9dDiWiCClQXZOt93dNEpjHqmqXzMkyTad
         tZzw==
X-Forwarded-Encrypted: i=1; AJvYcCXwd5lbVqzjNIBr9ckHGje2lJl0LV4PlJZHxfUyZ65gqXIb60asPfqYJ7aiPyultYU8VmZbu7uwfw3kTCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMI5MqvzO1zHVEU6MOqJwHb3kLdQcAzpYN50l9hda6klqIAZSH
	No+yqGsilL9N6zTpUDhZRyM1IB3GTicIHUarw96mGfRMxQ8zs4ADnIBnOBYh7gE=
X-Google-Smtp-Source: AGHT+IHAcc49fQDj+6dUv1WwyItmZo+VQhDVyFSsiB0HVGJtSbOyDZXUNQcKgpb3qKjj8UutpLm7Eg==
X-Received: by 2002:a17:902:d2d0:b0:20b:be06:f3d9 with SMTP id d9443c01a7336-20bfe1887c8mr91971805ad.24.1728141970334;
        Sat, 05 Oct 2024 08:26:10 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 18/20] target/arm: Pass MemOp to get_phys_addr_lpae
Date: Sat,  5 Oct 2024 08:25:49 -0700
Message-ID: <20241005152551.307923-19-richard.henderson@linaro.org>
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



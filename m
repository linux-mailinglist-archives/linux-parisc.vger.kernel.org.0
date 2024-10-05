Return-Path: <linux-parisc+bounces-2470-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D81299917BD
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 159AB1C21381
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84306153BFC;
	Sat,  5 Oct 2024 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oq3NJcHp"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0882915383C
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141968; cv=none; b=vF9Tx7Yauaxdp0JJO5MjL4vbag3kvpNX5cMwH8x6hlbgjhOu2oD8+ADTvqsxopuo2l86q/UuXvO5xDd3GSEqt8IqkZEN8bne5pEyzgEzPMpJfkEIG65Ov90agNpXQ/VATD7HtBeFa837ASDdSUhGgLXhBTH5HrUeuh9yTY0i4Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141968; c=relaxed/simple;
	bh=0LcUXggN44y26UL2csydkFcmlkLrDThLrVZVjfPCMMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEUr/bmBOCZvh1pfVQ1weowePz8+M2C7mpsr2bYpASVy1P3BO7LesXGfB5JyHua2OKI1g16umBn9KBXiKA0oQjmQQ/ty84cx31LuLL6cT2IKmgqKU3knOXV7qLP79Y5r5PIQNpzSpE/iID9UlDAsyXIPY47QeGvTppMF6U4Ycys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oq3NJcHp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20b84bfbdfcso27420325ad.0
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141966; x=1728746766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=or+46uGq1e2/GbDMKkBXfTr+x8kd8hih+f1GC2rPQFE=;
        b=Oq3NJcHpi4shwRvAI6/yWHtj5n6KBd1MNy8zbLVik/QOqmpPaxF9te3ZIwXgr+gxnu
         TFhhwJVieWyYjbxMzgy7Rsd3lVfC2PjrsqDKHWYcnYKiDbibfe5MgriazE2RgY+n5k8f
         0a1fBOyyvhQkHQ5st6YoSlQifQA4gxwc3Ifnt4Fy71KgthUuv3UgPnwVxDoBIZihqHrd
         lBoXHXs4yBc3jgG9si+5NZ9HIMcz/uD1EQP2sDlx2N6m6OJJ4sH1zK2I5TSjrrzeR2Ws
         +udGUUo0vCUArF5pwicTtJoVnoYci3VAojl7pFn9lipEWjXvQnRKDm8SxwZWEaITh7PQ
         Yc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141966; x=1728746766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=or+46uGq1e2/GbDMKkBXfTr+x8kd8hih+f1GC2rPQFE=;
        b=LeAgMVel3fAGronIcnNPXgoRHQ0wLgIQmP4zPrjbuWBVB6529j+evnv6u7UBDJD8Zk
         4RhNtmor3ZZgaOpbdJe1e4oI841wHgUMnvqi49+/PcRwvaqdKbnov8OnSpxViVA/Cs0v
         B4kifOPaqNagSNLK+J3vckrj0f24ytQ6TmfyJvXcF2dLsBj77bdbxvmIHqXRqd3dijrR
         EXVFkcggAXW82P6mWmXQGB3Oaa115XP7HpuyQ4fdZ2cRKyIYbC1mF7SknXQCRszeQe/Q
         G8+J0uSasCQy8iWoCaXKSkzJzEFyKQC0uKd97xiz1u2L/q66xa3EQo+5B9BBrRN/v81Z
         F3ww==
X-Forwarded-Encrypted: i=1; AJvYcCX2uV+jY083XoYy5IOiPu5ILacSZbLdjm5WNBFS7WIrvjo955iRNL3rpKnb22mDiLiqlwBwUtpvFAY2pe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVociKvYi3x6LuVvRtrIHv/eLV1L5//AG+mrOUnPkt/pr4Phc5
	bT8Y4mu58h1I1M/h+6oMgvQV62hce9q2cWdUFWAhEasgF+KVZYqdzm2vGe2qncc=
X-Google-Smtp-Source: AGHT+IEdkuFzCvH96y6A82QUTiEIn2YBst+4kAUKQBDmS2IlhhIPoF71jwAfADtzZPGVJyjEo7r1sw==
X-Received: by 2002:a17:902:e887:b0:20b:9365:e6ea with SMTP id d9443c01a7336-20bff393be4mr111588295ad.10.1728141966447;
        Sat, 05 Oct 2024 08:26:06 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 14/20] target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
Date: Sat,  5 Oct 2024 08:25:45 -0700
Message-ID: <20241005152551.307923-15-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 3 ++-
 target/arm/helper.c    | 4 ++--
 target/arm/ptw.c       | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2b16579fa5..a6088d551c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1461,6 +1461,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
+ * @memop: memory operation feeding this access, or 0 for none
  * @mmu_idx: MMU index indicating required translation regime
  * @space: security space for the access
  * @result: set on translation success.
@@ -1470,7 +1471,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  * a Granule Protection Check on the resulting address.
  */
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type,
+                                    MMUAccessType access_type, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f77b40734..f2f329e00a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3602,8 +3602,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
      * I_MXTJT: Granule protection checks are not performed on the final address
      * of a successful translation.
      */
-    ret = get_phys_addr_with_space_nogpc(env, value, access_type, mmu_idx, ss,
-                                         &res, &fi);
+    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
+                                         mmu_idx, ss, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 373095a339..9af86da597 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3559,7 +3559,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
 }
 
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type,
+                                    MMUAccessType access_type, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
-- 
2.43.0



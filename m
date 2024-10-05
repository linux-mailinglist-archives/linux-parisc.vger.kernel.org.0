Return-Path: <linux-parisc+bounces-2501-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA93991A81
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1508A1F22506
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC8F1552E0;
	Sat,  5 Oct 2024 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeqHYQOj"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F382153838
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158783; cv=none; b=Sx8Fzji9llwTgMY+wjyxh7jcDmMgoTVCJP/Ob5W4nFhEOD4CeSxgxW9KUe2fH53J4MFoYj4yBbhnE51gBDTivbY7gz+2n04xqX2tIg42b/2dxhB30vM1vUr7emehx4ZHPXvbHWKys/eEPuKLLvmY7YrIImFsvQa6dczBSr8h3NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158783; c=relaxed/simple;
	bh=yiKYyjzNDzYpUHiUdxWP4DdsbincyiYCu9UL8gVpY40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9krxmHQL3ld9KdX0FQENFIhllOvSphpikzT2n4uoToDn/BBdGxMirJgCCsRwDuK4xqH/u/WHZryiuKe4d/fkMsSq8ZVnA0+JZ7ZXemypSfSasCdhz9bi2GCI8uIqxt9iZb1AyYk1fXwuyCwVdpUFCqCw8iNmNsCBcyUL+wIEt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YeqHYQOj; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b833f9b35so27623115ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158781; x=1728763581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPq3M0kuo1Nn8l2/hQhKXzGFF76ZzptYhUbdCidOcco=;
        b=YeqHYQOjdZ5855vj1V96x2qoIAvY3oR8YbUQ1WjZv2tuBPo4HuKcE83yR85lwdg1HH
         3UjTmje0uF77ULGYuu1vZv+vaN0RWhbsxFouACXMATWW7jUFTY91n5XvC34A1krfjyxI
         DLKDUbNmcYZWYIBJ8neeN9D9U5GgPJAZ408GquQgJPxGrSDlDWfBQjGsgOZvAX+4h8dP
         WcaWJoBZwMkBII7ltkFHRn4s04X5fcWztw1lkYqh4WFIkerrhzYjDEHaNORBLJGztbYa
         4hIfxOW+mRyiAz7PdAEhhoV7pQSmMVcf0okmh1irFDII3gxGhEp2XbGuANP4rgQQ4Rlu
         z/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158781; x=1728763581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPq3M0kuo1Nn8l2/hQhKXzGFF76ZzptYhUbdCidOcco=;
        b=Rg51V+1LpLTqmQ06cwLZ2mzCsdvyYfXTuQF+78FfChFpSLJCh7RtRMWIixU+GqkkRu
         p+dPNtTDJbljY1XylOi00Gdq8u4/vAn6MPSB26Hjl8XOnwwCbMvDh3eS9AMrP6e4VdEp
         WXnI8Z8PGW/UGQ5fPKknda+GpTRYTPbUn1QFz/NOj+FwEQornEX+YIZWdD5u0pWdRHJB
         tp5s0+HLID1Y0bCbX4CjaxFatOobEJEf2cDQJMM3zrJVug2Vi3/9garZ9VDCUgznLtnF
         qcedn5wO9U2HFWhdTSfCzmmXkBfNbis4YEfF2F0/OGuz6diplj6j5HgopIXQZV+kI8Ij
         dSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPtsaDG+TiOe8dQ6UjdV8Wgs1SYImuEx4sF96f5nI0WCuDYqb0XcOO4PfhRPdDI2AaoINeiiRMhmYpzcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFakt3GtwxcqVO7q64TVfrHoEMeV193cWnSWy4g42P98gKiaq9
	AVvbXGt2sYIDkjNvTcxpdhNzmxps1ZqOP+9I6C2bdCNXz2caa6weP8GteFpvpY7GnmjpvqrZ5D3
	h
X-Google-Smtp-Source: AGHT+IEXZ+Zzt8PYusjsrpVGhTnFdRGcsZ6PugCvEf2Sr7CI2YAi0gDdsUS8CYPUBNKBVP2Jklnamw==
X-Received: by 2002:a17:902:da92:b0:20b:6188:fc5e with SMTP id d9443c01a7336-20bfdfff45emr91588865ad.28.1728158781473;
        Sat, 05 Oct 2024 13:06:21 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 21/21] target/arm: Fix alignment fault priority in get_phys_addr_lpae
Date: Sat,  5 Oct 2024 13:06:00 -0700
Message-ID: <20241005200600.493604-22-richard.henderson@linaro.org>
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

Now that we have the MemOp for the access, we can order
the alignment fault caused by memory type before the
permission fault for the page.

For subsequent page hits, permission and stage 2 checks
are known to pass, and so the TLB_CHECK_ALIGNED fault
raised in generic code is not mis-ordered.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 51 ++++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0a1a820362..dd40268397 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2129,6 +2129,36 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         device = S1_attrs_are_device(result->cacheattrs.attrs);
     }
 
+    /*
+     * Enable alignment checks on Device memory.
+     *
+     * Per R_XCHFJ, the correct ordering for alignment, permission,
+     * and stage 2 faults is:
+     *    - Alignment fault caused by the memory type
+     *    - Permission fault
+     *    - A stage 2 fault on the memory access
+     * Perform the alignment check now, so that we recognize it in
+     * the correct order.  Set TLB_CHECK_ALIGNED so that any subsequent
+     * softmmu tlb hit will also check the alignment; clear along the
+     * non-device path so that tlb_fill_flags is consistent in the
+     * event of restart_atomic_update.
+     *
+     * In v7, for a CPU without the Virtualization Extensions this
+     * access is UNPREDICTABLE; we choose to make it take the alignment
+     * fault as is required for a v7VE CPU. (QEMU doesn't emulate any
+     * CPUs with ARM_FEATURE_LPAE but not ARM_FEATURE_V7VE anyway.)
+     */
+    if (device) {
+        unsigned a_bits = memop_atomicity_bits(memop);
+        if (address & ((1 << a_bits) - 1)) {
+            fi->type = ARMFault_Alignment;
+            goto do_fault;
+        }
+        result->f.tlb_fill_flags = TLB_CHECK_ALIGNED;
+    } else {
+        result->f.tlb_fill_flags = 0;
+    }
+
     if (!(result->f.prot & (1 << access_type))) {
         fi->type = ARMFault_Permission;
         goto do_fault;
@@ -2156,27 +2186,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     result->f.attrs.space = out_space;
     result->f.attrs.secure = arm_space_is_secure(out_space);
 
-    /*
-     * Enable alignment checks on Device memory.
-     *
-     * Per R_XCHFJ, this check is mis-ordered. The correct ordering
-     * for alignment, permission, and stage 2 faults should be:
-     *    - Alignment fault caused by the memory type
-     *    - Permission fault
-     *    - A stage 2 fault on the memory access
-     * but due to the way the TCG softmmu TLB operates, we will have
-     * implicitly done the permission check and the stage2 lookup in
-     * finding the TLB entry, so the alignment check cannot be done sooner.
-     *
-     * In v7, for a CPU without the Virtualization Extensions this
-     * access is UNPREDICTABLE; we choose to make it take the alignment
-     * fault as is required for a v7VE CPU. (QEMU doesn't emulate any
-     * CPUs with ARM_FEATURE_LPAE but not ARM_FEATURE_V7VE anyway.)
-     */
-    if (device) {
-        result->f.tlb_fill_flags |= TLB_CHECK_ALIGNED;
-    }
-
     /*
      * For FEAT_LPA2 and effective DS, the SH field in the attributes
      * was re-purposed for output address bits.  The SH attribute in
-- 
2.43.0



Return-Path: <linux-parisc+bounces-2476-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6191C9917C6
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4392283392
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E105156887;
	Sat,  5 Oct 2024 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MgwlxTE/"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F6156230
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141974; cv=none; b=JNfjNNDVs8wJI9cwARdH+/wyv3M51514DpVbEzv0WdBiLaf3JODy8zx/SouWecTJIPPz6dTg835fw0tY0PCwbtMyimZEd62jN7irGkAdl7q+PJpzzxX0Eyj7kLQ274lukziijqlpZYUfb1TkAIHuDzjW9nLDZfBUM8TUC6Mt/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141974; c=relaxed/simple;
	bh=huD5NidbYXV5yWa6IFJz9jG5pO7wgoHT97Pb6ytfppc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWlSzER6/ekTd6iWfMfLpqwmuT626HINPcMBu40n1kW8L+FDiZV+dkC26DBgRuP3SrDydwS+/o7CXhO9ZqPhD1A1TuvxhIRoAO88ahv5VKjuJ4lBhivqRMOdwAYxhclCoGHeAtbUKlH9cNN1W7YPVjYgZRxgrwDnP7Jo61kZpXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MgwlxTE/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b78ee6298so19961215ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141972; x=1728746772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIlBHpyIHO+kiCFyGgZVBXgacr4yw5gCrMn63zUSz3U=;
        b=MgwlxTE/Xkd267sv+4nV0HXsWBMGQfHQvmCx0PvRVBJqZ2pU1PCdEzlYHmD6PDEcW6
         uzMdOPpcxjKmf2R2oOk8RtDUIfQayLG9Aw5yJBee1KkdnA6C5JUvoEZaYvp9QfbVqkzr
         n4bp7kJiOpvW+h3LIVvtwY5jBOlUnLgZjlUk9GRpuRz7lzfRK88i60APLzsK/wRsaqPP
         dS32fZiW64sdjRcbgok4dP1EsEJnkaLpUVw+fqnM+7EV8Lcp0B2xmDpGv6PKmQGpx0gX
         buHXA6Nj1GnLX7tOQfJkKw8/+3UolnXUxFvG7vjc6WkZxf81r/KQ334CCN+9de1MgHmD
         sE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141972; x=1728746772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIlBHpyIHO+kiCFyGgZVBXgacr4yw5gCrMn63zUSz3U=;
        b=Ot9sl3TS9zPvV1rS8IGHMc3gImnaYA/R54Gr9M/bCByUuSLpcEO5rnIr14XraNsoOL
         Q26tREcrxaUANAKNYV9E2KeCZGJ+aD25W6MzS0eSw6BZtoPc82bjkDnXP5k1CTWjVH3I
         XCsbS3txgO+P5YAcEn/gj9KA2ftz/OMcO9pJWgM6WN6xDv4hQZhxSZJAg6ZqqHtwNO7W
         LWU8+Yge8XsYFThE4WDLaMHW5TphIuRj1xoGubA/v2RvSExz6U7tAAR6KyZlddDmssHO
         NBYVoJS+i64q7mPiV2rDDqratU39L2R8l0pwX7zogXA4RbDYAxE7qGP9tvHwJzpnMuFa
         C0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlGV+ryBFci8/fWKUw9gJAQxrFizTH76OUvXhFaKB7oQgELg60T5U+MlenP3tyfKIxOGHkA04qxti+gnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLN9wbrhnVl15Yl98KKCnGPjbq+jhA+DB5ghMcMIE5cQYYd3X1
	DlB84cic4wlNqrmv+2n7hhqFfWfrywwbFKVTvwrJ7g+/5cOqsu1Xusbv2vt+lHDGDNqgDOGaN0a
	C
X-Google-Smtp-Source: AGHT+IGWHKPtHA2twxKvGB6E/ujF3z3IoFDGiLN3geSfu/MXfka4dtEv6hp0P2DmLjyD/i9iV2pkew==
X-Received: by 2002:a17:902:d2d1:b0:20b:9547:9b2d with SMTP id d9443c01a7336-20bfde55510mr91868295ad.2.1728141972285;
        Sat, 05 Oct 2024 08:26:12 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 20/20] target/arm: Fix alignment fault priority in get_phys_addr_lpae
Date: Sat,  5 Oct 2024 08:25:51 -0700
Message-ID: <20241005152551.307923-21-richard.henderson@linaro.org>
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

Now that we have the MemOp for the access, we can order
the alignment fault caused by memory type before the
permission fault for the page.

For subsequent page hits, permission and stage 2 checks
are known to pass, and so the TLB_CHECK_ALIGNED fault
raised in generic code is not mis-ordered.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 49 +++++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0a1a820362..50aa5e338c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2129,6 +2129,34 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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
+     * softmmu tlb hit will also check the alignment.
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
@@ -2156,27 +2184,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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



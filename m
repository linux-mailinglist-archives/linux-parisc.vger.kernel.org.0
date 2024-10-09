Return-Path: <linux-parisc+bounces-2613-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BA6995C06
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 289A61C21C46
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985AE383;
	Wed,  9 Oct 2024 00:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Me8dllmP"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154ED36D
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432316; cv=none; b=inlhBc1srl5XK8r6+7HMNdt3xOLYP66UrtcevlhSZvPhBU40F0ZOeP+0kMPWny3GEu13+pGCykH5nuCa73Mf4trQ1dYzlPDhCZYXLhyDDM/JsguMCt2jtt1YwgXOwYgOau/XKgV6vFkYtcyeZW+pOBt4cNlSxZVPsI70w9Odz4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432316; c=relaxed/simple;
	bh=Dvf8kAmrTC1rCzQu2thxtOdg4DFg7JeF+YLgWsBAI6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BssVB4/1gLzu0ZidSjt6qLv7P2TqfAVY6ET+NVgqoEwtvbQr8rRYn/xi2+yb96D9Ue/EnkGy/XAlvgUdwDLapFJYnwKVx378AaMSfQsaieiGHKl1tvd4NV/6ObRNn1p/Kn8pwMjhrbY8Rye8FnA6/f8iB0VTuO8s0vZbgJGxfUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Me8dllmP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20bc506347dso49905815ad.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432314; x=1729037114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2SEeBS4yBn5Ue1nQmA6MrWE5kNjL002NNNwwbKYNls=;
        b=Me8dllmPtUilU3WMP+iK2cVFOnl7wspXSAIPXxns2mh0rOLsdNLHtp3W1PrJ3gP9kD
         Ot1sdrw0IA3U6DdvDQPxU+kTeepaFd4FxP2wXLBEpYKRA/WG+/LZVEOo6HUl+KYDRTiT
         1KLlFeOBAfLkSrLgDH2TOdJ6v+XEdwAk29Jc0iMlfNcf07sZNEwumkORoigQtURJuGTh
         sGWzsmaC5B1sHVIZT887Ffy7nR/Wx83tlLJOL6vo3dq7ht0TElh2aqoU741oGCdIDZ57
         kxGIontP4xxP507G3Gn2p60RvkNxgPy18wj10nCvGUslqhHPLsTn8sktxsFe/dbxIfZn
         UbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432314; x=1729037114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2SEeBS4yBn5Ue1nQmA6MrWE5kNjL002NNNwwbKYNls=;
        b=dnvGvraqWPta/HK5WN5WbrkXj8EFhHYr3NL1P6CQFhNDxzr+EEgaEmKSqJtsGOeL6T
         u/Ovps/qHhpZrGmYIRu3UASlnr7g7n+vGIuBvFCmjXIgjfbYvbLhoZDV8KVTqWw8GPTe
         yJYmeRioQ5eTbGMH8nMFVpJblO3z34sOeFG+bfXVAf6QdK0EAyHzImAO3BxUr88afDUQ
         ZmZbqtGUUM/Pu1kERqE2lMYEaLA4LybBH+LX9KVB3XpijiH/vkD2HgTOHzls5NIwxIlO
         ulKebGVwRzntjdmLeq8eopwSt6kB7cfw/8LOUCZ6NV6eiOESdTAXMQNjSkXfz87GamsJ
         S51Q==
X-Forwarded-Encrypted: i=1; AJvYcCWO3sv6NIvCV3SYes25X4xuIKCXM/3suvreAbMW7dJGA1v5PZUTvYMnQUnUFanSW09bOCldnyQAVavAw6U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx52i4/PdVxo8DjPAJBKaW809bsGN/eu+qJxjtDK+lAk6c6M4jE
	fskyymAY0AkbfvlbzKBMB7FTKvuoIDbZqC0s1F2d7C0JDt4vnG+2GEjCOrmx44o8u8oSoWU1H5L
	r
X-Google-Smtp-Source: AGHT+IEIyXlGp9GlJJjjmIJWjUJQUjNDGcChOdkRVTwHuAzsY/hOJnshLN76/ClOQ0ILuClUnw979g==
X-Received: by 2002:a17:903:22ce:b0:20b:a5b5:b89 with SMTP id d9443c01a7336-20c63751f24mr14941525ad.35.1728432314287;
        Tue, 08 Oct 2024 17:05:14 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 20/20] target/arm: Fix alignment fault priority in get_phys_addr_lpae
Date: Tue,  8 Oct 2024 17:04:53 -0700
Message-ID: <20241009000453.315652-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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



Return-Path: <linux-parisc+bounces-2466-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 779E89917B9
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 294031F22C39
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15C81EB36;
	Sat,  5 Oct 2024 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/SMSfzs"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC4415383C
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141964; cv=none; b=X7KUb/LjYU00rj1CdBhrTpbwzHvwFvoItTKfxuQhGzFGNKjBCzZAh03onUECswaRYqDvQiHdix+exla7NrXUKJYCp3JR4SWx6o4+FFdJ4SSPdOXzXHQ323LxbIaBcwYVEakXB63YNOFOZjaQJLORs/zmLYWABlJPPFGmicZGC+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141964; c=relaxed/simple;
	bh=sTfOjnd7WOnuX+x1S4o3BYX1tyPFXVNWkYKKV6kIQa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTIaO+9aw+UKAGiQ4ec+gqjTal045++mD/iRVptfUXtbp6var2pHY8mecxGnXS+y779TVQdgYTSMrkJhkLONgSCXvpaUh5dL7m86WLSQ6+JV7re9Mkxf+zQeV7d7tQZgPMxIqpiA2zrl7ovY5ZPX9mJQdE4T2WOsXmJn+DTLya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y/SMSfzs; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20b9b35c7c7so21873195ad.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141963; x=1728746763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=posPbKSzdb+ffX+WhfgYFaW0pAyKjx4IZlbzVQLaTuc=;
        b=Y/SMSfzsEtThObkqK0j+EJt8kpjKHFc4OYufX1y9NDqlMPMut5/d7NbIrp89fCzF4Y
         LpoOOMiGU9T9N8/jxSh44UNBGKhOIBCpCdy+qRNU1ZfzUFpK+E4jDefD+Cv8YsUrmbOR
         vUfdY5pvIVXu3d0w47ZYJSMYoUNsIS7ptYBHW1G4yVeM+Zv+nhSUe4Mzja4b3AGG9W7V
         f0bsiUB8dcl4q/MdKVqftDC+sL1IF3E9Xpyc4QvxiNIk9GKrF4DQn86DX/SaS54aPK6d
         P+pBa91fqm7ghnk017ciK21EzUZOF3uGKQXpRZUKcnwTqzYAIko84PNfMwncoNULkG2Q
         YB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141963; x=1728746763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=posPbKSzdb+ffX+WhfgYFaW0pAyKjx4IZlbzVQLaTuc=;
        b=vhGPSCupzLtRj8H9F9oI8X33qDz0zdAqo/BwT4sHrGPj5Yi/u8BAwYHBWsBAns4Bdu
         DHRffrRP1lBEkZoKQp2WDynkyQ+YZzGVCH8JRkCpNKEgpb0hV8ExUwWXQhJujWVTa1tZ
         /aUupvxMe4XVJzQaDFWn9Uvct6rI3yLR931X7JPj65FgcCTpU0r6M+AQBuXpzgdJYOyX
         rIOLZwwMmx7z7iRMgVE3ttT6vVa8i2SGA0duPrAPTEHuesCVDUW1AwYBCxqfknm22bIy
         b/r3ZmyCrQpXwO3ENrCaC823pegiTSkqDDms4rG/+QlZQZp5r3U8IucgA/oDkJ4pNkmN
         X45w==
X-Forwarded-Encrypted: i=1; AJvYcCVFaCkbyYPyVodRY4/Ta+Lqdbt6rZPlh2wBIY/vSG6MjjoEnwx5MBiCkwt2mtwPwSXSFaONMoW+TR4NJLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLMutfS5XOAdlQeA3WS72bq0wK4WtEJehl4KIeqOauhSQ+FP49
	GtjwJSh71hzF+0JqWTiKm9xI4+ia48fw7TNxtTOaS8FoHOQED9XEsscjAwAIAXw=
X-Google-Smtp-Source: AGHT+IHBX41nPwo6covULM+vMbiWEGGIhbj1kTBPJ81VMsZIIlt+W/XQXaPT0SdsNmz4Xr77GlztTw==
X-Received: by 2002:a17:902:d2cf:b0:20b:502f:8c2e with SMTP id d9443c01a7336-20bfee333acmr92469555ad.51.1728141962599;
        Sat, 05 Oct 2024 08:26:02 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 10/20] target/hppa: Fix priority of T, D, and B page faults
Date: Sat,  5 Oct 2024 08:25:41 -0700
Message-ID: <20241005152551.307923-11-richard.henderson@linaro.org>
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

Drop the 'else' so that ret is overridden with the
highest priority fault.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/mem_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index f027c494e2..f71cedd7a9 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -288,7 +288,7 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
     }
 
     /*
-     * In priority order, check for conditions which raise faults.
+     * In reverse priority order, check for conditions which raise faults.
      * Remove PROT bits that cover the condition we want to check,
      * so that the resulting PROT will force a re-check of the
      * architectural TLB entry for the next access.
@@ -299,13 +299,15 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
             /* The T bit is set -- Page Reference Fault.  */
             ret = EXCP_PAGE_REF;
         }
-    } else if (!ent->d) {
+    }
+    if (unlikely(!ent->d)) {
         prot &= PAGE_READ | PAGE_EXEC;
         if (type & PAGE_WRITE) {
             /* The D bit is not set -- TLB Dirty Bit Fault.  */
             ret = EXCP_TLB_DIRTY;
         }
-    } else if (unlikely(ent->b)) {
+    }
+    if (unlikely(ent->b)) {
         prot &= PAGE_READ | PAGE_EXEC;
         if (type & PAGE_WRITE) {
             /*
-- 
2.43.0



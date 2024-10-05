Return-Path: <linux-parisc+bounces-2489-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C816991A76
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90C44B22765
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BBA15884D;
	Sat,  5 Oct 2024 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eKC0fodX"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9624B153838
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158772; cv=none; b=RN4qKmgv2EHs6pojsgr+Y5zeIFcUi3jU6tPaa7F2r0n9ngoNWNWQGPQtbqPTH3sjhkC5FXaUgfs8SV9IKEizBQrE1D56ej6mMxORC1/KB4vCEE24RdZdSIzZn4nA8MoJ6c7K0tOfG/MS4BTEwt6UWvPEHRqKkryj/jXpFpIEPdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158772; c=relaxed/simple;
	bh=tZoCwtIK/p1jJzOfgZpJrtMvDCOC/SNFglCoA1ddJgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUfewvidLjwJqpZejAn68ZUK08Zsd/NLGdxfYPYbuJuO1nj8ubYyDUBlEwZUoq8ZaBVc1NSsqYVAT102Y31XvWanUOOKSyis/D9zptSR8648Uob+5LPpkygxZ1MKudXvBu5aCdgbxHA02XerhIrzwUu7Vfr6/ikXRgitl7u2fmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eKC0fodX; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso2687676a12.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158770; x=1728763570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wa2JC5GTiuZOa9FUt+c/E5R/4D7wBSs90VoPwelenc=;
        b=eKC0fodXNH0cWRel+oF0XjEEgKjmE7nAXFyQgEMYXCb3+2XK36hH75/KqGOIz3fcIk
         gOuj25NtwkAhH0FOPUmRoZYJvQ3ZRIuuxG6waD397L4ATR6a8aE4m3bemksf5AUnePAj
         iNtrw25k1ZUXxqpQjcnynIG8D8eOt5jIXmSY4enrzIY2ggWeJH2CQAPQxCWcVqTwGjM+
         qhEroxJu1YfCi9DGBiiJXMhe8dPutUzp98SZy/28feX6l/I+FShyuUFAZjJ88zV92EP3
         kOzLxmnKKQ/5jbq3x0rCOIEs8nqplQAJwD56gWJuw9t33pFqhm0+N3OMToGwBislPiop
         ++wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158770; x=1728763570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wa2JC5GTiuZOa9FUt+c/E5R/4D7wBSs90VoPwelenc=;
        b=jafYU5oIDpTlJsS4issUuKISu5D6CydQnpH877IOuoGkTf9NReltwhwkBzuyzPoLxe
         1SNXDXlLf4jWk4BfBt9qfBp3n2HKJuP0oAIkGjBYmcl6wL6edITkLa5Pt7GJRDcJ4RN2
         Igjc2E2VMEyzTbNa9IX3pzoDAl9DImkeuWhaUvrJdPuX9BjqWFK2eXMzuMimWg/VFRcR
         Da8xA4conL1O/+P9tihOyROlUiE9jP6aNzTRsRo/r0uxS+XfJm3dluQWWX/jyhHrbBac
         1LZWjOUp/BVvcbMrJv0Z1uakHx2TkTAhYHzdAjx+brP1NvchtJTZFSbZRbrPPVsUtimG
         SCSA==
X-Forwarded-Encrypted: i=1; AJvYcCUwQMB4S3Cjvw03q1mENbA8Kg4d0XTjn4fVhvSneUNdcnmkO2oWFIVppv5hrpn7AclmJgyZ/LYSM1/cJEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGpuE3bh+Xs8PtecOF88qMVF1i7nLkt7uIufc4RYtzyyLs8KSi
	MdZc6nwGH99TV345VnsPeb9+0rXmEiwOFhjZxa3pit2NS8Nq+IGFXZPIh9ssCgQ=
X-Google-Smtp-Source: AGHT+IEu/yRGIXzgnnxtsNkCW1Gem8iXzS/ffba0hjtpfN6ZQ1VIoxbuDWZWql5a5WIxSKhWPrRs6g==
X-Received: by 2002:a17:90b:3709:b0:2e0:7b03:1908 with SMTP id 98e67ed59e1d1-2e1b38c7582mr16486887a91.10.1728158770066;
        Sat, 05 Oct 2024 13:06:10 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 09/21] target/hppa: Perform access rights before protection id check
Date: Sat,  5 Oct 2024 13:05:48 -0700
Message-ID: <20241005200600.493604-10-richard.henderson@linaro.org>
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

In Chapter 5, Interruptions, the group 3 exceptions lists
"Data memory access rights trap" in priority order ahead of
"Data memory protection ID trap".

Swap these checks in hppa_get_physical_address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/mem_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index a386c80fa4..f027c494e2 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -267,6 +267,12 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
         goto egress;
     }
 
+    if (unlikely(!(prot & type))) {
+        /* Not allowed -- Inst/Data Memory Access Rights Fault. */
+        ret = (type & PAGE_EXEC) ? EXCP_IMP : EXCP_DMAR;
+        goto egress;
+    }
+
     /* access_id == 0 means public page and no check is performed */
     if (ent->access_id && MMU_IDX_TO_P(mmu_idx)) {
         int access_prot = (hppa_is_pa20(env)
@@ -281,12 +287,6 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
         prot &= access_prot;
     }
 
-    if (unlikely(!(prot & type))) {
-        /* Not allowed -- Inst/Data Memory Access Rights Fault. */
-        ret = (type & PAGE_EXEC) ? EXCP_IMP : EXCP_DMAR;
-        goto egress;
-    }
-
     /*
      * In priority order, check for conditions which raise faults.
      * Remove PROT bits that cover the condition we want to check,
-- 
2.43.0



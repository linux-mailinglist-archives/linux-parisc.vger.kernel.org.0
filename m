Return-Path: <linux-parisc+bounces-2603-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD15A995BFC
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BD8F28657C
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D3A163;
	Wed,  9 Oct 2024 00:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iyuP+NCi"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA41B801
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432307; cv=none; b=qWdIXzluQyCeMX7ELuRqr29bjsOsYxflxMp4RocSKYST6vZ0Ga+psHHKnOB9mmdiAbR+u6SlvMyqg4Oki3H2zsRHi10KCE5yINMvVyKoo28tJfXhk/SgqXmmjJXCL//fYk87iNJpS9PuCQ1dmVLHsoeVjVzGIQ/YQ6hU3L8FwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432307; c=relaxed/simple;
	bh=uexbsWjvW+KtZKPv8kFelw8cpwu3yeLg90tgdbXR6+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnGue2tXEHpMnCDZrufsxEhFGIADH/DSK38/zyZCt37OziKk5+MpRVaXf6Hx/nzHIlrXB7/xruXFHkqPznFWarvLWpVCOhJ5WBXJ22avWspxfKEa09rD62FuZZJb6cE0ZM9XIAwyLa3lBXQEZU1354kWNscXur/TBKjfLSEagtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iyuP+NCi; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-207115e3056so57297175ad.2
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432305; x=1729037105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQhK8NjjgW/kNvx5X1m22TpA6VVxTZtyOqTVcWaZJho=;
        b=iyuP+NCiFqpNC02f0riekxEu+nCm7jg9xCXI1w2Zk6dMLNOAgb8OoR4WJ4fg3Y+a36
         uWRKEmFnb7mKIC0NK7E95zRKaD0sThnZO6/fttcwzCQ5UhNGD3a9q6Zfo665U7nHTJVm
         OXEKsAocS980Cs+CaS4W0HLTiZyFSFE79D8ZWRqh969Aryq1+XxTaR+GUWRdTiFs6cN2
         5pQrgb0gAkZczaTPH/2M4Qrr0GJX6sNMMgz15q0pugZ+FBfuAD+cN7rSVpodRGjXkplC
         AmguOcncHOFrdvGIepXwVMc1Fg+T0Gtr9+t10kdGxQnNSw8pRf3CULf64YlIS4P9koi3
         x4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432305; x=1729037105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQhK8NjjgW/kNvx5X1m22TpA6VVxTZtyOqTVcWaZJho=;
        b=SmmUKFGuV3J6MpU7R+IWP086ZRMfVhndWf86w1I0Rl0soQB7lcYec5VleZwy+Z6ClQ
         wEhOMHsmxBDedNEEdcZzVxOrYbnWgWZLqjdcOGJrn2kCIFw0FeopbdWI1nvdLdarWLBv
         FZrG/w0HJqwrq8yVO1WViI6I9wh7aj0doe4PuWdtm2+Kan09EFmRZ2g/Hs7qaFmRqFXo
         sM77QTUumJVKZ7Vjz+pHB1UlEnVQ2gpq1VlNcYRX0v7N8c0+FGmP9/rnJSlc6Z8ul/TF
         sg1YD3tKgvS3mOHR+KUJkNMUEORyrjEKP+vu+KGjsyGWMgsQ2qax0tZXqlVWB47sugE4
         mAdA==
X-Forwarded-Encrypted: i=1; AJvYcCXQgwcP/cq6oSkezK9XIi2SZJqnOsiioOA0B5E7asblLzfe0krGEAwnG2hI9tUgxe10KNYWDhmOfeL4CYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68w9T1GPJACHM5BeP8gFYknupZhmpDLDcU+F1zYYstuK2GaZg
	TQlbjuIU5p4N2tKcRaIU3xuXWfhC2dt9ajcs/NrqoLZ8zUV1gmqwJXhgaqJ48JI=
X-Google-Smtp-Source: AGHT+IGk0V3WqNWZpuoKiyjHCbvkavwK7mPvzoRJ0f7iYAkKJh77UVywliO2AjnwG+Rua0FM3sG5Mg==
X-Received: by 2002:a17:903:2309:b0:20b:51c2:d789 with SMTP id d9443c01a7336-20c63711761mr12234395ad.16.1728432305301;
        Tue, 08 Oct 2024 17:05:05 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 10/20] target/hppa: Handle alignment faults in hppa_get_physical_address
Date: Tue,  8 Oct 2024 17:04:43 -0700
Message-ID: <20241009000453.315652-11-richard.henderson@linaro.org>
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

In Chapter 5, Interruptions, the group 3 exceptions lists
"Unaligned data reference trap" has higher priority than
"Data memory break trap".

Reviewed-by: Helge Deller <deller@gmx.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/mem_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index f71cedd7a9..d38054da8a 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -221,7 +221,7 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
             g_assert_not_reached();
         }
         prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        goto egress;
+        goto egress_align;
     }
 
     /* Find a valid tlb entry that matches the virtual address.  */
@@ -323,6 +323,11 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
         }
     }
 
+ egress_align:
+    if (addr & ((1u << memop_alignment_bits(mop)) - 1)) {
+        ret = EXCP_UNALIGN;
+    }
+
  egress:
     *pphys = phys;
     *pprot = prot;
-- 
2.43.0



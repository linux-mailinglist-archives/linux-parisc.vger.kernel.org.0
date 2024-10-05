Return-Path: <linux-parisc+bounces-2467-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 608C49917BC
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A832B2114A
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF0E153BFC;
	Sat,  5 Oct 2024 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXZoLuuN"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC401C6A3
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141965; cv=none; b=ZJ3iZsBinDf+1nvQ0sLvYR27yRB+h3bWLgbY/mSXg0Mu2+jn2D+dVTAVFDkMBJl1e71i3aT4oT4sS45imqUAdvSSD439vnrTXeItRVOpdKqzLRJQKhPbwyHBISoGoiFxU+ntlMz2935GxGLUh2zevOxXSzDzr6/WwNYh7lzeTHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141965; c=relaxed/simple;
	bh=4iaK0QoQiOhshJacorWqZlodkQnPRyOf/R/YyIYfv1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onDaNV1n7rUvPq97tfSdBOOOIC6BLEOhQhhZIAfiE85GCK9ieMPaoRIq22ZY8CtO1RMa/KyVUDL/VHA+O7MxrPvsvkCQ6qP1iGkpWmSh6c6jsqpOsmw52L7M6ImIsfce+cKsJCnHZdu5w/fpvr6bG6Bqbf6i9zyxZgbFdmq8fFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXZoLuuN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b64584fd4so30733875ad.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141963; x=1728746763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZFSB9ZUy/VXACo96L3HUXARpyVU9ywq9XNxX+p9inM=;
        b=PXZoLuuN63NeNe//PKH4u1pfWOvgS4Vyj0gu2CJ9AuPRnwSTR2MKXOO7CD8PM+oszh
         eK0gQHs12KN+Brwyj+C8BW4iz8hqZRNbVRsbzqkJAdzfQhecD1GB+zfjll4nSaq0670p
         MKgXPmPuTB5ABkwbUyXW/qDMtoXaGYC8rNHyK+0hD3F44fS37vYGu4kJQ01BGAnmqSCV
         9OufzmTOv4o4d41Fg+coKlB3519R7EAVGnbdif/58830N4iTiMfXDagwu+JxLMbvQAri
         g9KvQnhiqQZr7uSFMIqXICMqCz7KsCBOo6CwUUUtNicghKDh7B4mGb1EAu5XUr/qWcDh
         3AdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141963; x=1728746763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZFSB9ZUy/VXACo96L3HUXARpyVU9ywq9XNxX+p9inM=;
        b=lcl+69hmZcTrNs/Z78+Gwojh9ihJgrQq2TZ+TYChryhzoP6Co1I7nhzBOuUQlNUeup
         37Pl1VtOXPprFOGiintGruKWt7Z3mc2vLt0vm5i5ZGxbGPytvOyQNAeX9p40QFXjSN3y
         tSMy4yyzZBBAEjw9ReqHsbtaqlB54jHRLpt1Gg+XU8xBKPU0XPlNPCZHrkeU9mYpph6t
         Otat1BWL8T9enmlk22XQVK2Wqyeg+2ax3q5oVt9eiCWjUsKTBs9cC5TKaFkHTiikT2/V
         U1hxVDNZImdIzZ2bTbcjbpnaNKoKQCooxmYffexHbZFMDfirCyYiwrSDyJ8pE+BkpMXV
         L7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWrBV0Zg9l3yOjrNkPYN43ybUXCSNR6pDhP1a6KT1jMWDoMJQRopRNnC8PuehwjKss6rdKT9T2uiICB7rw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC+/a4ODn2o1ZcXWjWU+yasWd/W2IzibtsnWFi6qPWBM9ESwoT
	1dLkRgpK8n4tuCJL6Hfka0wOvvh1AuraPFZD8HBhsAP48FlMNh6hwQMRQmgOiRo=
X-Google-Smtp-Source: AGHT+IHoHMOdQJhz/hk6oo5QEC16Z8Yklqh5lMZB6Txlb+2L2pMHFtFjRuBs6OrzX6SPGfE0OUkqtQ==
X-Received: by 2002:a17:902:f788:b0:20b:8ed8:9c74 with SMTP id d9443c01a7336-20bff1cb9d3mr97600185ad.49.1728141963574;
        Sat, 05 Oct 2024 08:26:03 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 11/20] target/hppa: Handle alignment faults in hppa_get_physical_address
Date: Sat,  5 Oct 2024 08:25:42 -0700
Message-ID: <20241005152551.307923-12-richard.henderson@linaro.org>
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

In Chapter 5, Interruptions, the group 3 exceptions lists
"Unaligned data reference trap" has higher priority than
"Data memory break trap".

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



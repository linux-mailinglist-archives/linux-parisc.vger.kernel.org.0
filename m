Return-Path: <linux-parisc+bounces-2461-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 796499917B4
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23B7C1F22C98
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD686153BFC;
	Sat,  5 Oct 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uNzD32SK"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413061EB36
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141959; cv=none; b=ELGrLU3xy7VIPW8UA5rJOWbgiDSen7bG6vtk4iJ0UPHWQhUCID0ddGlAnj+gB/l4YxO0utgR05vmrWDop92KcQS1bROHhgGfEtUmVEeUWI0v1iRhEwE1T6Sr1RuMnZUkyxi5XXlHmLefj4OmAkVhlIePOs1g1NwSXj2qTdPPTjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141959; c=relaxed/simple;
	bh=CNQPVBhItRPAxhRnqCnm3EiuHXwFUY2vwcYaZEAIlXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QsH69fGTF0/JZ674h6/jHKQeAVmdq9NiwrHVrpVuvkHRnZ6gmJcW6asIr1iGXXm/rGdBA+eiqXSwdaBPTQcEuPlqoReWD0OZdbPHpMYsDyzunShMIs5EDgtJeJULlIsl03pYDh+SJ0w7keYcuh86PTXBBk9Mtifg6z+S7swexgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uNzD32SK; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20b6458ee37so36306315ad.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141957; x=1728746757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMIQXnxelIQ86qxYbOA8sg/WFq9fqYpMUetqZ1DDKfA=;
        b=uNzD32SK4jsqSh7sLLGNgbPiy/0W3mxuPJySTlhdz8w1CE+KYEN3iQiAofsmbDc4mm
         GH3uqDwQzkFG5WUSRpPn+lzDjNXAMlZVpDMj+wwf4/hQQIBvIQyzDLtzvP1Cwk0yAxaw
         uOs2BedVJX6b3bw2vHrgOooJ6+BQo9LwBuzMj2DV3360TZeGtiFE5c5zmllntj2wPGsP
         w/AqtF5vpm56XCwdnS97+0bX2iXaRW66R8d7mPjibpzZl69KHTWKon7/w1m6Sxezlgsv
         MBxNZW0CYmMqbtcwdvf8xW7hiXfQ/ynaFPeKbzGVid6h8fbAt+ieE96NjmhHsEozkIqb
         wskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141957; x=1728746757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMIQXnxelIQ86qxYbOA8sg/WFq9fqYpMUetqZ1DDKfA=;
        b=eVXgGDUKG17+h9Y/zDnTAObHyLErYoqc4pK7uMiHuu9/IlKQ6hPX3QhW0hk7uR+zX4
         EDPnp8kwLdZu47pW3ICMxWjn1uxNVS2Ycu/JxHOr/3AS44GQhRiiQ/W84odU40GGWGc4
         Bh7+5pIyMlCKAQ/pJS0Rr3f+woPT5HgdKClevXYPVsevCVNC8CfSN0gZXgR0FWERBpEL
         ftHXOP0AUKmBBvq4P7hzMCdOdmwFyRwgoPO4jgZRiKeqxQrCQFFxoWR+VudYmU4fKNF7
         oXoeAO/g6M11kIyOJkAqDD5LTI7z34ZgrR1qwAXnNZV/dzMyIwK9Hiz6vpFXywtAufGX
         Yr2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVinEDuXGqktu9ipYf7ySU7AzXAhUYtG8Ngkl0HJtCsotO3zaoZdj8sQ9zbXFdqrE5+DGPZ9mH+/DxB64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4W3kfnzlMsJSlSOEOO2HSK/eE6zg/T0Xjh/ifWjPjJMa/HybL
	93zojZuUTHcNLwH8zfSw/coSUpDii8/kD0BFp42EH1aSU9vBmjPQn5rwcIFiCoU=
X-Google-Smtp-Source: AGHT+IHCfh10FjkbBSOvqXvOBG9PUScOEcA1SfhVDalzVVmPfKmDc9cmv0jmAUjDnTAXUakJpgurmQ==
X-Received: by 2002:a17:902:ec81:b0:20b:90ab:67de with SMTP id d9443c01a7336-20bfde594f1mr78046015ad.8.1728141957612;
        Sat, 05 Oct 2024 08:25:57 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 05/20] include/exec/memop: Introduce memop_atomicity_bits
Date: Sat,  5 Oct 2024 08:25:36 -0700
Message-ID: <20241005152551.307923-6-richard.henderson@linaro.org>
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

Split out of mmu_lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h | 24 ++++++++++++++++++++++++
 accel/tcg/cputlb.c   | 16 ++--------------
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index f53bf618c6..b699bf7688 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -193,4 +193,28 @@ static inline unsigned memop_alignment_bits(MemOp memop)
     return a;
 }
 
+/*
+ * memop_atomicity_bits:
+ * @memop: MemOp value
+ *
+ * Extract the atomicity size from the memop.
+ */
+static inline unsigned memop_atomicity_bits(MemOp memop)
+{
+    unsigned size = memop & MO_SIZE;
+
+    switch (memop & MO_ATOM_MASK) {
+    case MO_ATOM_NONE:
+        size = MO_8;
+        break;
+    case MO_ATOM_IFALIGN_PAIR:
+    case MO_ATOM_WITHIN16_PAIR:
+        size = size ? size - 1 : 0;
+        break;
+    default:
+        break;
+    }
+    return size;
+}
+
 #endif
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b5bff220a3..f5fca5a118 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1751,20 +1751,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
      * Device memory type require alignment.
      */
     if (unlikely(flags & TLB_CHECK_ALIGNED)) {
-        MemOp size = l->memop & MO_SIZE;
-
-        switch (l->memop & MO_ATOM_MASK) {
-        case MO_ATOM_NONE:
-            size = MO_8;
-            break;
-        case MO_ATOM_IFALIGN_PAIR:
-        case MO_ATOM_WITHIN16_PAIR:
-            size = size ? size - 1 : 0;
-            break;
-        default:
-            break;
-        }
-        if (addr & ((1 << size) - 1)) {
+        a_bits = memop_atomicity_bits(l->memop);
+        if (addr & ((1 << a_bits) - 1)) {
             cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
         }
     }
-- 
2.43.0



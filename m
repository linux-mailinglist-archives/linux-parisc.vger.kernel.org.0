Return-Path: <linux-parisc+bounces-2459-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4729917B1
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0E541C215A7
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3546154BE0;
	Sat,  5 Oct 2024 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AcsM116Q"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D91EB36
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141957; cv=none; b=oyh6Zyn2E2FJGuZvSRGmVM78y4On1vengJbVLD+MPHRSI0ODWLiCuBFDgQmY6icBE6btJJWE+bpD2T0bn0WGe3IJLSzZM4K6Oh2OJp7MWHTIr32l34Jn42roecx/7CHhtOQyp7E1aRhm63J1tYdb89QswcbTmdZvVuEnXyFE6qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141957; c=relaxed/simple;
	bh=Gh98pY0MAR0Ot832aCn3hg2vuaYiKb/XiJoz+Ma5LyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrWsZK2432TWwR/ZaDqkWxuc6JvuN5UMlWHipvzZe0ASnfGYwG+JTylzo9zdKsLS+T9or9vnpgA3c0KoV8kfbNAsHHdp9slBgLQJFKyJq2b1soK3BfWBXFs5ineh/tuQR+2C/DEO2Ttg4jGNVTjCebfL3DnOJ0JmSHvw9JHMEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AcsM116Q; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b8be13cb1so33015115ad.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141956; x=1728746756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js9k8IR/cEhAqGc5dKpCioG/n/UgV+piB56d5dg8Aiw=;
        b=AcsM116QXYltYcI+STcB0uPajr1fwhisA7VzG2P4XVHxCE60wqclAj7sclZme/V0Z4
         mYFedTypgvK9dKsMVPVDLjmujXUCuQSnaisr5q5JdXxpuNJtMnJGj4pI5Uv1XDP21ZIn
         rQpkLGVoIkS23Zp32RfiIGFLgcs4YEGuKj7446Xcyi9Y1h3/k2WdplLqNGNyEGF0PPxp
         i44D57aMUCAK/R/2eVz9zyX8Ha+CUKnyukMFjCrzwmwe+HWpZm+KTkBqyphf99meeGbs
         e3GyRlD35tA7RVo/cv4UgtLHvhs6tpPohhTZcRLu2/kborfi8H9Lgc6KltzsE3YqZafi
         lOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141956; x=1728746756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js9k8IR/cEhAqGc5dKpCioG/n/UgV+piB56d5dg8Aiw=;
        b=t21OlM1LtTdgN4o0gSa3kVvt3InQFs0MlhooPqFyryUrTcJ7XlCOYSqwszBgSDhyqj
         12EKcWqxCF+FdrTBeuxHc7L6Nm1msLxVzTp/h5AIMunVn5o0eagJc1igADDtSXHfuzNt
         jM3enk4AiqRXUDQ943vWQronVtWsND6dcBsyxa3PJv+TtY98u1/ImXaGX7/A2OeYohCp
         1wOKorG26UAkDsO9VxVL9zC/KGZR1tSFiHCC8mqfWZlOv9n+Q7exoVAw3fpR3uKFFhns
         RLwfWnxIk1xMU+XB2Qycu+rdBb5Q8J+vtBw//yTzVRk+3yqTxOF11DGWcyKtckPj25He
         oWzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrNOqt314vTtI4rO+hwvaIK9FGv49tNs3B47RWG8AOFV7WO/PF80V6Lr0a8SnR+UF+EgE3dfaOPB6A4fI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/BcDfaZlBT4ag8oLa/SBXnKDu5hsiEi2wnwUVRfcplVyBZqiV
	yEKWR/gfAWl4pkXZ87h6PE3qdW11b4M4nGQv84sapAU6QLE3XXezAjWugURWtE4=
X-Google-Smtp-Source: AGHT+IGIBBnYzSGfllOqeGB217gC39c6yX53tA6gs3EyjynpH2B/4NzPXZOQfYqQh+wbNxGsQ2aqKA==
X-Received: by 2002:a17:902:e551:b0:20b:4875:2c51 with SMTP id d9443c01a7336-20bfe024d5cmr107983235ad.27.1728141955681;
        Sat, 05 Oct 2024 08:25:55 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 03/20] include/exec/memop: Move get_alignment_bits from tcg.h
Date: Sat,  5 Oct 2024 08:25:34 -0700
Message-ID: <20241005152551.307923-4-richard.henderson@linaro.org>
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

This function is specific to MemOp, not TCG in general.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h | 23 +++++++++++++++++++++++
 include/tcg/tcg.h    | 23 -----------------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index f881fe7af4..97720a8ee7 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -170,4 +170,27 @@ static inline bool memop_big_endian(MemOp op)
     return (op & MO_BSWAP) == MO_BE;
 }
 
+/**
+ * get_alignment_bits
+ * @memop: MemOp value
+ *
+ * Extract the alignment size from the memop.
+ */
+static inline unsigned get_alignment_bits(MemOp memop)
+{
+    unsigned a = memop & MO_AMASK;
+
+    if (a == MO_UNALN) {
+        /* No alignment required.  */
+        a = 0;
+    } else if (a == MO_ALIGN) {
+        /* A natural alignment requirement.  */
+        a = memop & MO_SIZE;
+    } else {
+        /* A specific alignment requirement.  */
+        a = a >> MO_ASHIFT;
+    }
+    return a;
+}
+
 #endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 21d5884741..824fb3560d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -281,29 +281,6 @@ static inline int tcg_type_size(TCGType t)
     return 4 << i;
 }
 
-/**
- * get_alignment_bits
- * @memop: MemOp value
- *
- * Extract the alignment size from the memop.
- */
-static inline unsigned get_alignment_bits(MemOp memop)
-{
-    unsigned a = memop & MO_AMASK;
-
-    if (a == MO_UNALN) {
-        /* No alignment required.  */
-        a = 0;
-    } else if (a == MO_ALIGN) {
-        /* A natural alignment requirement.  */
-        a = memop & MO_SIZE;
-    } else {
-        /* A specific alignment requirement.  */
-        a = a >> MO_ASHIFT;
-    }
-    return a;
-}
-
 typedef tcg_target_ulong TCGArg;
 
 /* Define type and accessor macros for TCG variables.
-- 
2.43.0



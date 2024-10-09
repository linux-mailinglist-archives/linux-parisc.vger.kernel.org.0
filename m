Return-Path: <linux-parisc+bounces-2597-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 819B7995BF5
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B35111C21D67
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523BD817;
	Wed,  9 Oct 2024 00:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ju5Fvoz4"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85ED801
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432301; cv=none; b=Po/d/jp34kgL+mSLMuWId8XMiSz4UbHF8bxx76u64utwtri5+O8bkpv9zZM5ROn7Ex3JErsRz5+wB/37XMthtcu2PvtnLPJVww6utUIBD47AvFsFOFIxqauQtxrHQTC2MTgSbRsJayZ8umdJzLwcxDTv/N2u24/ZivSzXkWoghw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432301; c=relaxed/simple;
	bh=/5quf5/LQWTajw7j7C9ADHG4pkyvLf0t+1qUD3vWmyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QvxA/dTvv/4LLlMaM2ofwgEyi+eJ0yFeQkSciwWHaNfHBjbj3nqNiQMuIgTdyw42kRRgeMpXr4aDgIvmG9GZxIF7iZ0cBsw3cJCC1h7ySfAN1ZX6zybLnMVNld+IBSvBtIZrf95ZRDY9Y8GK4FvI7oWECN8hKYgwNqdE4G+qOrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ju5Fvoz4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b90984971so64136035ad.3
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432299; x=1729037099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoQpjuwa20HwjACHrMlYHXe57YCg2K0w30eV5HVGvRc=;
        b=ju5Fvoz431FP2AWU+mBRv9INOoUQHmRsFVEbTeeL89LgO62TWkrrpd90lohZbBHYc2
         3GwaSKF/exzFbcFq4VMZ/IF5+0qYkvjVVb2LELCAp4zJvzENKhKZQuHQWCdhNmOUP8rQ
         LFGqG6oIAyNE1qRdha/f05VZY0eFEantIypMlZtIJiUMbPkhVc9Ji2p9x6L/Wb4fUsAs
         bURcOIYFWljvcIDD1P3ca7b73MbGdn80pAFbp6SgTyiuglJp+zAlbbdBiPWSFgWc1IFE
         7/AT8dcZUZ6KEjlNZuG5iR6Rw9FfKJE5Elx3s4M7qqfxN6fT7eBQmh3vDIg9M1wLniqR
         6hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432299; x=1729037099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoQpjuwa20HwjACHrMlYHXe57YCg2K0w30eV5HVGvRc=;
        b=CcKQw3gKXsUjGq1u1pR5rb2E2+iGLC2Uf8TY1wRsBtMuN82oQLUHEkSuA/A+Czi4du
         Bj+oSZ8IW1t46N4nBHHvipz+aWH5SFq9fO5N2zVTlsNgJCuRjuWht+yrzXJSwgoE3iLw
         dIWYo0AxhGULjsqvIWbev36rmEiAQeRPebRPNlnOd9xK68FFHde8f9PGJw0clVrWm8gB
         6S5g/plcnPYoR1RJEb3yMB9VKcXKZnGfRkYAuIUGU6E5z70fqFT6m793n7qOIBxwlnp/
         4RZ7QC5Cf+K7ZUHzp1fmjh8huemUnAEjzBaAGcxArcS5CZc3cOLJk5mGeGboOHAsv5iR
         f7xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBLbfUWasyVxt8HMZAmWuZwn+g1192YG5I4fVDRT0sqlRZpCoyJxp0Kk3MRZ+1iJt9HaGN16ERPPKWi+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/pmoQX/q7j2I98yxq5bA5j5vsXG3r66z0ApqlDoDcqM8ymeS
	n3oMENMNGlEkF9S8ZL5x9tBtDjPivUTg76W1Qimo8eGRyoLgNWkoY6aJFE2MtuU=
X-Google-Smtp-Source: AGHT+IEeu9+lnXWIBhz7pgvstBsOBX6KI79/ZD6KPp8fSOXLhjN4UEVyBQB1oHIG/Wwjwoi0un6x8Q==
X-Received: by 2002:a17:903:2b05:b0:20b:6d8c:463 with SMTP id d9443c01a7336-20c637557d0mr12308135ad.35.1728432299121;
        Tue, 08 Oct 2024 17:04:59 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 04/20] include/exec/memop: Introduce memop_atomicity_bits
Date: Tue,  8 Oct 2024 17:04:37 -0700
Message-ID: <20241009000453.315652-5-richard.henderson@linaro.org>
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

Split out of mmu_lookup.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index a975fe5f89..35cda1e2b0 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1767,20 +1767,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
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



Return-Path: <linux-parisc+bounces-2485-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB00E991A70
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 930E01F22162
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A3115920B;
	Sat,  5 Oct 2024 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tD6iMv8s"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86E815884D
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158768; cv=none; b=l/PURWAX5EvYj+KEb1AeXSz1y0jfWiKrLJ9uVyqMD5Lvjm4LM4GsX63dt1LJaYVzkw8GXXHINDldwfIYqWRQ0E2Vj9lHpcE7j2ov9GYVlzA2j5mHRT12jCTWxC8qn4WGm9y4L4GhSf8nvQ82DERiqA0WYgQbaNhLRyUgrSVhvpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158768; c=relaxed/simple;
	bh=CNQPVBhItRPAxhRnqCnm3EiuHXwFUY2vwcYaZEAIlXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMpbMoyYRGOqjq5D8ruIai8/x8bmAAwpB5vfN/9n+i6Q4gajSNxQSogQN9Jc34rjSl10WYcm0sk/H2DmYX7htJuCz/2GSWzYTxUV83rHK3HnvJIYnOYqC8ncAu9pW17t1bJn/0B8akhxU5X7NNgsnIliqsO7TR0a5JKQRkBWj+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tD6iMv8s; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b93887decso26368515ad.3
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158766; x=1728763566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMIQXnxelIQ86qxYbOA8sg/WFq9fqYpMUetqZ1DDKfA=;
        b=tD6iMv8sf/CmcWiOtVkfPebcn2ZwyQHwl7ASzV3q1UQjCnsJ7XR/tkujPMrmFB2sGm
         sSb7N5KlncqpER/seeBQV9LrR83h8tRQxiop5zOW3bb554RbMoDmXiaVCtSHZgxkSywz
         okjwwQ1G87Qgb+q6oftNvs8+fDIkbQLPjkearn0poqpvDWfd8B6be49ag4MqOlLqXvi9
         PFYOzQuu6etNc6d+kINvVsPrBdfC6yA1KIKWYdUiz59uryzPQefPYA832M7/x1FftrdO
         RGMn4NrLkl2sLCvEuJ7NDqaD/o+0A/DCoZo6EmxmbnZZrlY2O+XgZEtDarlLBWhu8IbM
         dJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158766; x=1728763566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMIQXnxelIQ86qxYbOA8sg/WFq9fqYpMUetqZ1DDKfA=;
        b=jFMujc9PZ6TWq/nUZTCmOYXGn7XCkAtvg0B7eYf/79VevKk71CFUXnYwmFTOoU1l9p
         4SNS8Vee9lL1ZiYigaCmBJvNZwsRDVm5ZhYAcFbhgOyvx6qpTeg+8/j1mtsocXg6etPk
         GIZh7w1ug/G/dkzJAstKFq3W17JANEgWA0EKZkWvVvuNX+bp2CKAm9kvN3L6rg9sJ/Q1
         jbIy1WtNlUk9pzQjmIP7pG6ziTfJcxHn0b+wxuMusRILgAAMxu2RiffdWgvYmwVzy1Lb
         uZQfvCacINoqM0NjLMKri4NDlV4XN/xVKVOnuv2GTQPH8jRTl5m7J/3/pJOPDqPhdDnX
         9NlA==
X-Forwarded-Encrypted: i=1; AJvYcCW58fqns2bLsEYn8Excal/142c+9KCvQaeGubpAKPIEg6cTDgJy0JBknvVXQDvzMolM31r2bKggFeTYfgo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxn0pWp55T4JJ5CL2LScpUbbGGl/WxmptNFh9P3ve3SOG+3Dxt
	uk9url84+zl/FCd75MnczHKvA9JJjJQJcj9Izh4pvufIOAmTwkOCwTDBmBea45s=
X-Google-Smtp-Source: AGHT+IHH1UPbilIVxeQbQP7YVJkO3rAkayOpruqAQpJ8VTJH0ulhL8QO7zYfsZKakqfCs3+vPIEAIw==
X-Received: by 2002:a17:902:f545:b0:20b:a576:1896 with SMTP id d9443c01a7336-20bff190668mr89400615ad.43.1728158766201;
        Sat, 05 Oct 2024 13:06:06 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 05/21] include/exec/memop: Introduce memop_atomicity_bits
Date: Sat,  5 Oct 2024 13:05:44 -0700
Message-ID: <20241005200600.493604-6-richard.henderson@linaro.org>
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



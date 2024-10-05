Return-Path: <linux-parisc+bounces-2491-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7520991A78
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61035B2096F
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89C91552E0;
	Sat,  5 Oct 2024 20:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k7Fad4Kd"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E72B153838
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158773; cv=none; b=tF460wwaatU8ZfpKH1LOgj5ByUKAJQMp6hAmmvKHOEsl9+jPXB/AIUGv5KzTcWWLWdqNtBscPDMg4NF1ecHCrSBH8rlT02UyH6nF/IlLFlxam7z4lpjcchVAmBN3SoguokvDrGHTUw8xfXNsWKF6RP2uj2eotX/6SChqH1dBQB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158773; c=relaxed/simple;
	bh=4iaK0QoQiOhshJacorWqZlodkQnPRyOf/R/YyIYfv1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cb+MjmjyN9YjUMmqb4NCyMuHdXVm1fFxsu4iv7S9Kbwfbr3AvBUr43l3PGafqLwIOXQV7Ue6V7hMDTycsAn2NpulkTxKZzke7YHdK7lXhNBouvSb+sRYtMdAZ/2MxYMc+X/XDj4pcWKkfLfOl9+3m9sYKVgfzm6AwZKb2hL5mC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k7Fad4Kd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20bb92346caso20346625ad.0
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158772; x=1728763572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZFSB9ZUy/VXACo96L3HUXARpyVU9ywq9XNxX+p9inM=;
        b=k7Fad4Kd2bhIcXPlWkG+dNUcF66vJVh9L7cvXKlTXMNkAp/RAEGTJy39/+cIvVOtRo
         kHXr7ZhcRvaQkVrdSNqkNFQNw+kc+KCUvEOl2seZ5aiM5Kue+x9Gab0hcow2p7LFRs0S
         VeyauEBZ8KBgpO3sOlWRtNAVcL2BmTQOOvBJyrpyaHRJHX3T/DxsAjgFllXg58WYPhPT
         YhE+eHGLc1ssGD5eJ2vm2kWKZtRrRmoHlD7Bk/2WFSbIzmVomKgT4KQJUpJjCbtVVm0g
         dcpd1ayY3PuuPpjNWUhX5Yh1d4gJuny3AqVO+5u033FlqbOswW8YIH2GV8lIgyqSnpiu
         SSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158772; x=1728763572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZFSB9ZUy/VXACo96L3HUXARpyVU9ywq9XNxX+p9inM=;
        b=AIUV5n1HjGIWTwDzszKyFGbrsE4/PnxpXiQTuTUq+Lnt9avXsLSJZmRFii7fFOYNmr
         95diZ2d+qwvkDTyvszyarQ6GV0v+G5bn6mIZGfkQ4QIQiKopCqrINwBNk4aOVODI+RZl
         sSeTDECncsRmKPQYrtOvy8i0l1rU7CDTshZgDjdJjgBIvUtwM8c8KaGB3oOAcpzxUmJO
         fpyuQDglKzXtRUF7Md0RAoHyy3ZniTGks5xmc3C6qlAqosKMmlKpvgQpYzsuL+SqBKRf
         VNiW21yEVOyzDa+4X+YWJnkAqTxeKcPZjpBP+bCEYJeNP/deIt97QvHCcaOUQzpKkjjn
         oJhg==
X-Forwarded-Encrypted: i=1; AJvYcCUdHaDfDa3cWbzPekILm5N6wFImFTcgNQhEj/MFLT+0o2dIXI3S+UBTYAyNgPXzDUci/FMu9pq76SZgS7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbaNALwv2eHUYSUK8TQ5z4gwieKnGIBvMNg3OdtmtD9YT9dg4U
	sTuGS07GHvjSzPgLesoTmLFlRYQBDikVhTeyRxI8jdUbai242zKcvpZJyU/JdKk=
X-Google-Smtp-Source: AGHT+IEnSEOUIrHMqhl+2wC7MJEt2x3LJD6slbQirH4WqyRvisJVw+9UvtZb97XvweZZ36AVIQ0gZA==
X-Received: by 2002:a17:902:ecca:b0:20b:805d:bfe5 with SMTP id d9443c01a7336-20be19c0fb0mr135947635ad.30.1728158771892;
        Sat, 05 Oct 2024 13:06:11 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 11/21] target/hppa: Handle alignment faults in hppa_get_physical_address
Date: Sat,  5 Oct 2024 13:05:50 -0700
Message-ID: <20241005200600.493604-12-richard.henderson@linaro.org>
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



Return-Path: <linux-parisc+bounces-2601-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 813DA995BF9
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF65F1F2353F
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A09164D;
	Wed,  9 Oct 2024 00:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2teZnpN"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04B4370
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432305; cv=none; b=KfCobu5MTK/Vjtb1z34OdHkoNZiNt7oSpWyT91M5cmmXH+OTCZNCM2J0ZERgdxUfVV93KjrfiatYTRpkDnUB/d/jy/nbqPJBLNczL4MoYuXGc4wzcGkMJQXYnbwQLJh9frm9cZ1S956C3qeVnHOeivZNs48u3OlXZnSCOz3IQFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432305; c=relaxed/simple;
	bh=rnYo41mvVlDDfQYXpospuwu7o2xpyxok+A4G7sfAZJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQMRvNz1wcEGXI5AZllUEDEg8LRzC/kJvWoTJPRBG3xOpix2HuouRYFk0sV35OKTy6La+jmqHc0GEFLibNu/SoyjpM5J5fn+p9Sw1dYVh/DUDNA53qcNV11cbf/DuzOkQHf/eEoCXoqPAC2unX/KkIXZacBe9dUYGgsWgVUxmHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2teZnpN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20b90984971so64136525ad.3
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432303; x=1729037103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvwlrMz3Fk2P5q43/JWG8Wh7xLnVWB9wP6XAmMUyGN8=;
        b=q2teZnpNdCXnDw1irDTRwXj6OQLcS3agsIWbo3kkr0ecYmzkYk9fOAk6q3ZMF2yf0v
         ysaiVzLWyzd/AAwjAEC38uT8d6XEGKAb5x3q7Jw0mEd/ECcqHB4LlY4QYAvN9KByJf+f
         pjAOPnFBNZOnNgtQPWqDZdpgnQqw2TKk3FKP5TwQ1iL63pJ1Ms2ErPuTo8QEYOsQDpR+
         XV7HbxM+hWiLNKXXkk6Mg8vkTMY4ZFuOi6sM3R3UsMqGoPVbIn5EYqdFDiigCLhs1sEx
         0BtgT8v0BRYL1kVcYaX81L7x4cczdkdMQoRth/wqKtldn8XIFMXpT6U5l1Bpemt5JkWh
         +0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432303; x=1729037103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvwlrMz3Fk2P5q43/JWG8Wh7xLnVWB9wP6XAmMUyGN8=;
        b=nR1AUuTBf9pU4RnzsYzmWyKh5WH6+JeYKpGKTqyn2IsjAkmbMJqrvgwcgtE0kgf8N6
         ar9xTyN5rtOwjuNcVDlS3S/RDfJlPiu7lnj45/vSTwT+wk/Sst5I57uEps+PHhuAoB/o
         ciLXVkbJXLnEgU0b2cp7n1ajOEGWlDGXAXOQgPAXNSzng7t58fLqAv8bNtwKBCvJdrKf
         2ELWnO3/cxUCHGoKld1IU6Zvdrpi44x9/ofOpLhOCA+Lt04hgvtEIbJQTDezGg3SBYIc
         ckPlUBDp6rEsfEwSJcccfDAc3jYVoGZtk3H+qRNywpGkWR/jA206tofN7udgSrIvsliq
         vu8g==
X-Forwarded-Encrypted: i=1; AJvYcCV48OIgkgTcMzHXCpEYz2nFWYbYOoovG8pQsufuZXCwUlUc514WIndHyk8khGmLuD9VrMrUdVyHm/CLol8=@vger.kernel.org
X-Gm-Message-State: AOJu0YznlSMjjzLNn4bFIVpImkFbhfC8ZoYfdlCi1fpWgaQNhpsyETRm
	uRYd5Z5ZApwveGmtHkm8H/daqfcsUa/Zccxqud8LoLlVSPmpuS18G1ArRn5tR+0=
X-Google-Smtp-Source: AGHT+IEQN3Rl72pcmgLCTKgbIcOtLba1v+GzwtpoC9AF0fnEDdxLNrxqZqv2s5T7uD+5Iv4bbg/olQ==
X-Received: by 2002:a17:903:2289:b0:20c:5263:247a with SMTP id d9443c01a7336-20c637809c9mr15713945ad.38.1728432303433;
        Tue, 08 Oct 2024 17:05:03 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 08/20] target/hppa: Perform access rights before protection id check
Date: Tue,  8 Oct 2024 17:04:41 -0700
Message-ID: <20241009000453.315652-9-richard.henderson@linaro.org>
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
"Data memory access rights trap" in priority order ahead of
"Data memory protection ID trap".

Swap these checks in hppa_get_physical_address.

Reviewed-by: Helge Deller <deller@gmx.de>
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



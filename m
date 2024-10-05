Return-Path: <linux-parisc+bounces-2490-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B43F991A75
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E9E51C20BB3
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB11B130AC8;
	Sat,  5 Oct 2024 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HXBZNOnJ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77696157E6B
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158772; cv=none; b=cg4lVEKTcz6N+7D8ycb5xZqyxXXblMRjY0Ae/fKIaTiZWVuTQYvx2bRNaJlpw0GOgDuvL0QPa6Plg3WBdhlY3d3QDDzfWpg8awd/E+ZS0DP6oifdlAu+kBV1JxXJq2fWRJp7JJbth5mC8VJ/L6riP0OqylQUXasqFZO3Mqq8wFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158772; c=relaxed/simple;
	bh=sTfOjnd7WOnuX+x1S4o3BYX1tyPFXVNWkYKKV6kIQa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+d6D6rRxVp2iSq3NF9QT+ChxsezpvqI7uVJy9Z6hhjW4ddyBRMwK0LLTjsE+F9uijvMnDyNdpCi/xJIZUK3KWTCLTZhuZr4f1hJyE3CWKzMyef0qKlPGG8PkSFWL3qDrPylYoU+xC8aKl0OR4vIleih/suSMvZNMu/Slm3Ryy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HXBZNOnJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20ba6b39a78so23376485ad.3
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158771; x=1728763571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=posPbKSzdb+ffX+WhfgYFaW0pAyKjx4IZlbzVQLaTuc=;
        b=HXBZNOnJalyxYK9ALB3Qs+2IKPK6OnA1ou/s/A+TVE248kMWUoBWQFx3Ervfh1N0Pp
         AtcSDqUpK8b/BCFsZ6PVvA41eQUviad84xOccKRDRj02ql99MOzRpM5Zv7SaANh/e0cn
         hK2rUZO+iypQ5UZBGqhSYkKl3kUZAnzc/Mzu/TFzWWCwxIDD5zsWWLGOlHM7O7O9mRZb
         0NYmnBO7kDopxex/5zOEnz7943vP2Pffn+3SqQQ5Wt0k3MEb+lA1hqK8KGAyzbJRk8sT
         Is9b1OulbJ1NcJqbSeyoworDyjyKw+3DC1l1Bqj5hNJrY5ItuUqYUUobQzymwHWaNcQN
         N6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158771; x=1728763571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=posPbKSzdb+ffX+WhfgYFaW0pAyKjx4IZlbzVQLaTuc=;
        b=sxcViMyMdCWnIeRXxg/Q+qBH8irZZ9w7zMEkgJCu8owdBhy+SmplkamP3ysniX93Zw
         e4hVjxQfqYSjmVxsGJ09MOLkRtkBAv6hdTV6OLk0v8bCFUniVp5/zWAYIaDt0sFWf5Dr
         ICFl9MMOh1PlXewiaLbAgdLSylvMoFCiZPn3ABcf1H4WyIbXxT2e7BjmlZMLpWaENurW
         OlIrvSGi9KnxeinePYPlAMB+0gr+Gj5Sij/ATdrqOUX9C5Q7B4L3vOqa/67CwiEM5Sg2
         c9yThK/W4k4eQ5bVsBmCnLU/HxVo7UdKtBf1ZMM38UO+WsgAprw6l7CrR14CNsPBhx5g
         3yAA==
X-Forwarded-Encrypted: i=1; AJvYcCXCx6LXO+RhNHlzom4/0ERau9FeJODU3aKz9ZqxipxpQaJvS97/85M1i0F+PdNax+r2sIU6J+iOAlAVqC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy4EaiwJjXPb7tsS8D9/zRoVzuATuKaLc4qY98PimZWfMYvur9
	Y+vbXQ+MbtQvfIwlIKiaLvhYkCVH7S9vjYKCExhKKC6HAkin0MCjpkLJATRzoUE=
X-Google-Smtp-Source: AGHT+IFkbH5I/ZaJe+I4v335+XuhQ/F/ef46EsJUG+t30A/nnryOiFz1aTLseUaZK0R77t/l8tl9fg==
X-Received: by 2002:a17:902:da91:b0:20b:7c00:5e50 with SMTP id d9443c01a7336-20bfe022a33mr98058335ad.12.1728158770895;
        Sat, 05 Oct 2024 13:06:10 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 10/21] target/hppa: Fix priority of T, D, and B page faults
Date: Sat,  5 Oct 2024 13:05:49 -0700
Message-ID: <20241005200600.493604-11-richard.henderson@linaro.org>
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



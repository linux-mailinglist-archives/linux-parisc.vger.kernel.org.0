Return-Path: <linux-parisc+bounces-2494-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE40991A79
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 633392810EC
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC24130AC8;
	Sat,  5 Oct 2024 20:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G4gbmPyi"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DE2157E6B
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158777; cv=none; b=VBZCQShL6fMgXovQGt6OVvxSx/GYl8ne1F9QHCvL6+/w/EhQBUaa2/q7vjmfFK3BAfjqBJV7nh6B6dJe6yH3Oaqxx3Y7xxBCGuC1NzRLg8XQKFqKuhnyCQvUlu6rYeSW+CvLKsTVuDmIPoAZM3GnvQF5nv8iajKYD0UjHELqtro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158777; c=relaxed/simple;
	bh=0LcUXggN44y26UL2csydkFcmlkLrDThLrVZVjfPCMMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GA/q5u/z72zHCXr+muV7DYiQsFO/KmXIr0ViKHGtnTXT4Z6HtKm7IYBsKdaNStXB0+yTLwjb3ZOAyqQUfAauzI+UqMxMjdV2eL7vjwaFLdvWIwD4jzyMV57/2uU13rtYdAfOY6TqsgZTFOgEfGMKO82UWeYpgvadTrU2numbefU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G4gbmPyi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20b01da232aso25564625ad.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158775; x=1728763575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=or+46uGq1e2/GbDMKkBXfTr+x8kd8hih+f1GC2rPQFE=;
        b=G4gbmPyiLa5Gij246rKBEUAJ6e+fN6KQNyRkTDOzCD2GRtOiTpp1Be95sgi6xvLXL+
         mnhu0WBk0KoCyNmUQ7aoeMvZpkDE0IzXgzNqUimTmeernfvcVYsOFm60+sEkZUb3FJao
         3QdL6Nu09qIgBJ0b9+yi9G8Po5051Ji7DLf+FIYguI9gxOeSM57Hmdkh4gWSt0o47KCD
         sXU9S2hjzUwIkSvR4oUl4tFjnuxj7+T4wei5N6kSOJ/QVKr1tL+9AzQVzVHYAy6j+k1n
         Fm+lgylk2pRlQHkUw6S0QVketgDovUgJcp3Y5vnC9Rc4zFJFIl8RLFoYRkegXgp1vtCg
         xRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158775; x=1728763575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=or+46uGq1e2/GbDMKkBXfTr+x8kd8hih+f1GC2rPQFE=;
        b=FvO8QYWQW66fCDqbn1N6CsQNOvHIqS+78hB39540pAE/9aWo4QWXbfddL61n1T/lRS
         LmbPEZlGaNVI0UAjMvDZwZLnem2n4TsMxVWT3CF026WqUsDtfjwLnxlWfBYTvq+tLocR
         tPvUc7lpF9ILR84zZRXAvTJTUpugm0MC77cGut4jdpG1/+rgPXlvns5v8ybQgDrO+t/+
         43+HoTHge1QED5H+YhAH+29KlV5fJWtyxTgkntTzlBc5ed9I5FCsPN6rHvuPRC6jqvqv
         r3eid6FKG96H2jbiuDDvscNv722P9uLpKtZ8HKJlstmGrZWcLbG9OBkvOqbpJwjNs4Rc
         Wqbw==
X-Forwarded-Encrypted: i=1; AJvYcCXxdDqNXfC8fV9KpJczfi0Eitw8TBtL3IQlR9HqAM7Ys2tzgzor4zS3t43Q1hBP9XvPwoLzQ/dSox/cuAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+m11Ze4gom4KEa/A7dFau96e9uOvzW0GEZ2GKYXoMVP4uIa/V
	ijFCRxB3cQqrd1A9jrdMIfARllt3sezB3/A8QMln0MwYA5GNGj88pzGnXhBXs2A=
X-Google-Smtp-Source: AGHT+IGg8sgiEBRoSbtsp5hCkfkIAZ+oEWQnrBAFFM+N7oyUTJv3AhGKcIaJbMYi1S9IuPikpnwrog==
X-Received: by 2002:a17:902:d2ca:b0:206:9dfb:3e9e with SMTP id d9443c01a7336-20be189892dmr148488525ad.10.1728158774767;
        Sat, 05 Oct 2024 13:06:14 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 14/21] target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
Date: Sat,  5 Oct 2024 13:05:53 -0700
Message-ID: <20241005200600.493604-15-richard.henderson@linaro.org>
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

Zero is the safe do-nothing value for callers to use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 3 ++-
 target/arm/helper.c    | 4 ++--
 target/arm/ptw.c       | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2b16579fa5..a6088d551c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1461,6 +1461,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
+ * @memop: memory operation feeding this access, or 0 for none
  * @mmu_idx: MMU index indicating required translation regime
  * @space: security space for the access
  * @result: set on translation success.
@@ -1470,7 +1471,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  * a Granule Protection Check on the resulting address.
  */
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type,
+                                    MMUAccessType access_type, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f77b40734..f2f329e00a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3602,8 +3602,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
      * I_MXTJT: Granule protection checks are not performed on the final address
      * of a successful translation.
      */
-    ret = get_phys_addr_with_space_nogpc(env, value, access_type, mmu_idx, ss,
-                                         &res, &fi);
+    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
+                                         mmu_idx, ss, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 373095a339..9af86da597 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3559,7 +3559,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
 }
 
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type,
+                                    MMUAccessType access_type, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
-- 
2.43.0



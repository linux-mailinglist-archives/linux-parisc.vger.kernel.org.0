Return-Path: <linux-parisc+bounces-2609-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B67D995C02
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DC802862A3
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA3E370;
	Wed,  9 Oct 2024 00:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OHISx6xc"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78612801
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432312; cv=none; b=NPcQZhcr8r7sAuc3B+12Jl8BihC3CXwF1fH9FIb3Tz5LT3E9NDLiX/eM5DMwKKcKYZTh4C+5RhAOROd6q59covy7RtE3YiTkwDw3fpBWKsRu127GXJTxUAl0q211rUCiWJyr2fRnL9Vb51+FqXis6uJfmH1ULHe0fq6SLCDRGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432312; c=relaxed/simple;
	bh=pDgf/rzqRVogjXyED2cVC5XS7hpf4sX5D/dwk1pCY1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ttijkRIvH22bHgNK771+W2a+NabWc7JYrSe82XFkJ2HVg9LMh1oMqob3tAgAoMb2WJtnQ6ucwcVl/YzyYTaw12ne1IWyJTHLWjudFgjlcRZSQxorq/kheCaKZ7UL5Wglmr/rTpBarSsMGEK4LPBsO94+OGry2gEhMQm+pSHh/pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OHISx6xc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b7a4336easo45876045ad.3
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432311; x=1729037111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPsGlRApUHllpr7HECmYu85LwKI3gq1PeB/gQzKhtMY=;
        b=OHISx6xcztpG7qp5aHVjNAF/rIiBeKQmcJyNgkFCymzZB2FKJ1RhSZfdq1wLNq0yS3
         htrCC+iembtrXWMU0wHeZxwgJ+/6A9B9I78rUgBgV5abnJW1YxwpGbvoQw8KnE22UkxI
         L3Kkgnug59kiIwo+Ckf7ccn7r6onctDqPXZOPcnw4vQDubkqxeekLGp9bWKWkE3Atvtf
         naLtESUF/J6jCNKZmEEhBtpxPreMzJknq1WEec/bI9uweQ6td6s8i+eRbMpmJqDMjd1W
         b2x3HInIfEkb8IwrERBn7z2c+UyGvP9VXfsqsECZ7/tIrVgKfCLJbbpQS9KOhb96NuhV
         +rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432311; x=1729037111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPsGlRApUHllpr7HECmYu85LwKI3gq1PeB/gQzKhtMY=;
        b=WB3ejevy+yfnBIgCir+a8gQe5pKjdCbFK2y0xkWxt57X6nFw8h35aPS1zdZb6eYliu
         fxPh+FW2cUSNZXOmp39YavwCysng0gDtqJx0uyMCHC9BORpV6GxG8KPJmajKFT/iAHBH
         L4QsBt7FjKqUhu2hpAeqTT2B4E9gCtWDIoI2zV7VehZus7lq0Ke/QxfrHmP3KK49Tixm
         /V7GagYmfB8cutrIHv0Ilv0S7hwG0cjlju/NAAiFSDNrlTh8uvvbhyLd5/cnhuwzIwry
         Wal1B7BQr+0Gj8aDf8uwDRtr8143QjNKEhXjjRHonqpprE/jMDGai25zDLcUOWQWqVf/
         QyVA==
X-Forwarded-Encrypted: i=1; AJvYcCUCOkmb3O1JZN0LyiEt0krzwxKw9IVD9HOTQunc1HgcDP9g9lrCDu/sCGXk9phFZomJB1+9Avrk9i6K3XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEx9LyniLkt0n74kpo5Z8sRPfo7JVtX+Wsm3iSqKWiEd0z0IwN
	WWyIBM++Cty3feto1U8CV2Z36XnHyUQ74fBS1aJERyLcSdb366hpr/N7T0zgUcc=
X-Google-Smtp-Source: AGHT+IGJ8O2nfVebXs/rTPoybsu6FDn6yseoR+E5sJTRxCOXXVZpsC04cUko3bF+v5+Uw1ma0m9ncw==
X-Received: by 2002:a17:902:d585:b0:20b:a739:bd60 with SMTP id d9443c01a7336-20c6378d2acmr8950605ad.51.1728432310616;
        Tue, 08 Oct 2024 17:05:10 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 16/20] target/arm: Pass MemOp through get_phys_addr_twostage
Date: Tue,  8 Oct 2024 17:04:49 -0700
Message-ID: <20241009000453.315652-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pass memop through get_phys_addr_twostage with its
recursion with get_phys_addr_nogpc.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0445c3ccf3..f1fca086a4 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3301,7 +3301,7 @@ static bool get_phys_addr_disabled(CPUARMState *env,
 
 static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
                                    vaddr address,
-                                   MMUAccessType access_type,
+                                   MMUAccessType access_type, MemOp memop,
                                    GetPhysAddrResult *result,
                                    ARMMMUFaultInfo *fi)
 {
@@ -3313,7 +3313,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     ARMSecuritySpace ipa_space;
     uint64_t hcr;
 
-    ret = get_phys_addr_nogpc(env, ptw, address, access_type, 0, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, address, access_type,
+                              memop, result, fi);
 
     /* If S1 fails, return early.  */
     if (ret) {
@@ -3339,7 +3340,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, 0, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type,
+                              memop, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
@@ -3469,7 +3471,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
         if (arm_feature(env, ARM_FEATURE_EL2) &&
             !regime_translation_disabled(env, ARMMMUIdx_Stage2, ptw->in_space)) {
             return get_phys_addr_twostage(env, ptw, address, access_type,
-                                          result, fi);
+                                          memop, result, fi);
         }
         /* fall through */
 
-- 
2.43.0



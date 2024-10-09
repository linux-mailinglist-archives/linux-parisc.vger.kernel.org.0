Return-Path: <linux-parisc+bounces-2608-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17915995C04
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E406B239C2
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088EB163;
	Wed,  9 Oct 2024 00:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="azH7iXO9"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C292383
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432311; cv=none; b=HextikiT8KKKihL+wi/PnqhTKXuXzTpSSfwLcLeO6KNKMxLAMNqrX46oFdVhMjP7z7mP6Sgxuu+OMnl5UVt3SPrgFTxX/8u6KClY0vGKr3Z2+dS4+1cPdEJxjXW883xKFnXlJ/mC0WFVxxigmEfLTuEyQZFWqJtMIvreo62rRvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432311; c=relaxed/simple;
	bh=BDp0O6JIpdOVZn6P5SuJhCZ2UsEmiTjyaLAP2jh38CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kmcNenotZ78ZsKub99dMvfeKT3z0VE3nNjFOOVkdsRrt+oyWCSH7lFzjVxvUhYKkaLe142ushyf92VDwnrxA3q1njqhuzjw1M/9YhowaPyg2GPY2PzcWWWpkerbtAumy6qomTGrzwfuW2FUHFWeem2+1D+9gZi4XlvRjvJODUWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=azH7iXO9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20b0b2528d8so70928855ad.2
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432310; x=1729037110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpCts7Lc7po90jMJZMaWUdEUzHFwVBTsaL90Hh3zO7Y=;
        b=azH7iXO9pfr/LoPHYgbcUXHoLd84hJVBV3nv/gGi3xcUBWAXbCnz7764ROVX/yhi9h
         qam1F641S9NAy/8Js15jGzBJxrRZqfkbVNmYs373UndLgb03M8UI3YhzCjgpbfzMNDN+
         hsysgIDN2jtrF1X+pqYzIDS0VFmiGd2hDbd8ItL2VX8ZzVvmcMjqoowhCsR4HNckXfUR
         KgH0BxEE7HvUEbBCvB9xVJ7EL5ynFKIcTIw4VoCnkwbvqeaB886xrhAhgYnRFtPgxox7
         0cqMl0enLkX4TPCxzZ0LG4m8HEqp3Xp+cPupQA/+9D6C1deyGO0ZoGpLcCjL+c6c5o4c
         jLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432310; x=1729037110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpCts7Lc7po90jMJZMaWUdEUzHFwVBTsaL90Hh3zO7Y=;
        b=dNzD7iaIxS6B7Qs9kEYq9Loui5z2VwwTA2ULhbl+7/ZqYoWZ6M90QDb8vdGEXin8Yd
         1CxCvWskoYwuTQ7U852N6fiLQf9XB4Kns3IvAQ0plP7LL5zsYdbORSrCS5RYD0eJP4k1
         DDDNXw0jN3FsIZsyqeWcE/npav+04h/xkNX5wB3drGlytSPL/t6vLMyJwPatTFbKN4oJ
         EokU3KH2l/r40OuPf2o7u5uBVCFvy9ggZk6XXHLkuXw1ZscUqCbCtqq/8GNFAwlc7Aa0
         dI41TKNcSMAxI6/ecGHw15/DoeJRcZ8+lb5re907mvPEJK+JS85W1n9g/h8Ha2Nm+mcO
         TtQw==
X-Forwarded-Encrypted: i=1; AJvYcCUMKEw4o2m5Niv7eqALKQ496PQHX9ScAo+MiRGQ+RjFepLKChhwZHpAcqb37MrnXTmt0Yc4zTtTxZkZb20=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn8fIvLV/09S/7x/UwQYjbN/eK6Mm+9s5CyqiV2R9uaoe1iG1n
	kubEDwll+JHqO3i3FK2rt4MR/H9/DrGVQlYwydyuvugKNYFDdGEipDcpo/LtLOk=
X-Google-Smtp-Source: AGHT+IECyy3ECPwpIxrRErzht1GulXjMyxKnwSvtoRqfwlCQOZkW3JggsvRngQz//es+//aYqmgOdg==
X-Received: by 2002:a17:903:22c9:b0:20c:5960:bd35 with SMTP id d9443c01a7336-20c63710345mr8780115ad.20.1728432309687;
        Tue, 08 Oct 2024 17:05:09 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 15/20] target/arm: Pass MemOp to get_phys_addr_nogpc
Date: Tue,  8 Oct 2024 17:04:48 -0700
Message-ID: <20241009000453.315652-16-richard.henderson@linaro.org>
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

Zero is the safe do-nothing value for callers to use.
Pass the value through from get_phys_addr_gpc and
get_phys_addr_with_space_nogpc.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e92537d8f2..0445c3ccf3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -75,7 +75,7 @@ typedef struct S1Translate {
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                 vaddr address,
-                                MMUAccessType access_type,
+                                MMUAccessType access_type, MemOp memop,
                                 GetPhysAddrResult *result,
                                 ARMMMUFaultInfo *fi);
 
@@ -3313,7 +3313,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     ARMSecuritySpace ipa_space;
     uint64_t hcr;
 
-    ret = get_phys_addr_nogpc(env, ptw, address, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, address, access_type, 0, result, fi);
 
     /* If S1 fails, return early.  */
     if (ret) {
@@ -3339,7 +3339,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, 0, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
@@ -3406,7 +3406,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                       vaddr address,
-                                      MMUAccessType access_type,
+                                      MMUAccessType access_type, MemOp memop,
                                       GetPhysAddrResult *result,
                                       ARMMMUFaultInfo *fi)
 {
@@ -3547,7 +3547,8 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi)
 {
-    if (get_phys_addr_nogpc(env, ptw, address, access_type, result, fi)) {
+    if (get_phys_addr_nogpc(env, ptw, address, access_type,
+                            memop, result, fi)) {
         return true;
     }
     if (!granule_protection_check(env, result->f.phys_addr,
@@ -3568,7 +3569,8 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
         .in_mmu_idx = mmu_idx,
         .in_space = space,
     };
-    return get_phys_addr_nogpc(env, &ptw, address, access_type, result, fi);
+    return get_phys_addr_nogpc(env, &ptw, address, access_type,
+                               memop, result, fi);
 }
 
 bool get_phys_addr(CPUARMState *env, vaddr address,
-- 
2.43.0



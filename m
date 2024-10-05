Return-Path: <linux-parisc+bounces-2497-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF391991A7D
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CF171C20AD8
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B41F130AC8;
	Sat,  5 Oct 2024 20:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S7i3wyy7"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5AF153838
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158779; cv=none; b=WCW67399Qc1k0SXxL5xSqmQsDURcNAlDU90tnhFus9r3hFS2hnyI5ktOCV4Q04HDJRRHigFrDSwygSSe9qPNIxIQNexTv1//J7SR26/fvH+dCaukXTbcrDXCWUKBc7GYOjhUhvfrxnmVuTtu5z7yjnD0YL/ps2apZukLhEkRXbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158779; c=relaxed/simple;
	bh=mKNr4HPQW8zX73f98vjtas3HbqrZ2mbpCZvK/LaYaik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGJjTw2pilZmnYb2YlufD7eR0oh9CPVkRahC2h4dNnA+bTmE1enAeQE4/mpNxTFHIBvyDxIMgvJOxBs4eoxZh55OWj+seSmWDyfAKKFz8pmgPxnRnWkWJf4U4m5ptWjK1MieN6X7TSR018fy084umJkO77WYyXmFDqTqRxHvZnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S7i3wyy7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20b9b35c7c7so22719805ad.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158777; x=1728763577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB3S/z+Tf/YurYPbjZAkQ2iOmy2pkllXkguo9aONGm0=;
        b=S7i3wyy7zQ4Abk/8fdgiYmVE4EDXedJMB4TzFhURT+4ztp9Hxs/JNr6856dXsOHP7Q
         dO1XzynHrbajT/QFZdYqRxGqU/faGyxgO0YPWajpj3JWc0Ydcd0/TCo/RUpwAoxkd493
         0JZF79Po/X3/VJKzG5/xazacqAIuVf8AQzVXy+mzmCG896dciAH0SER4DsCuRS4TuZt6
         JBtKpZqzMSbYDCwmqciDMPNjgFzowT72ai2wkoQNJdpqUpiGu5PP8SqKl/CJdRBYMv3j
         JVTlld1Uop/7q8jYJVZKGVSfPBv8TfymzHwSoAg5R6+7r43nWcVVL4Rn1Gj7i75QWeRv
         dsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158777; x=1728763577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB3S/z+Tf/YurYPbjZAkQ2iOmy2pkllXkguo9aONGm0=;
        b=mYFwwa3VJT6Tv/4jVZtqm1FJffaD6TSLT6vfqmNgOsbLcraqUF0+JrE+1CGUEt2XJ1
         LYR+MveOZwVotgvg6q427bB6S4+VhutM7rBRONaQnnxGCiR+/tt5NAuLS+LFVmXNIbrv
         pN65w372BW67kN6LMWevV2n1q1mMyqoYWRZpZPTIIVuu3R3b0rOYilmec7q5Z4mS20ET
         xKsEVHuYGd+NeFXH7/4k9yx+izJNst6EIllE67lZYuekLZyhwSC4DrXuvJZQrPWdZYXu
         htgs9QJ/TZvJpPCqlJxbsDNYJklV2/vBoBQHtbUIUnsBWQsL6/bPEy12SSuXBWq4GPtH
         xsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhHgAJSFV0p3EmW/3plRTpkuTYRJ9Xlz0L4ANSKOdvsiMm3I3GGDSh8BgMveXpfwEQxgS9jnTd4gS7TRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5TjzipYI9Jqz6lcLvEEdzb5i4blpKf47qcF1o8TJhS96I1ds+
	oopcNLM9mDwJwlaNSB9Mm2vtuBl3SuVdHn8/dz6Arf+TnCVIcZaVlK7U6JBi8XA=
X-Google-Smtp-Source: AGHT+IFI03P/ZwqgMEeykQf6RuuyTdik7GAJO+0IxSS0VbFT5FxKQ+by1C3Nfg/VbMmCSMS//V9B9g==
X-Received: by 2002:a17:902:dac5:b0:20b:b132:4dec with SMTP id d9443c01a7336-20bfde57e80mr119970415ad.11.1728158777552;
        Sat, 05 Oct 2024 13:06:17 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 17/21] target/arm: Pass MemOp through get_phys_addr_twostage
Date: Sat,  5 Oct 2024 13:05:56 -0700
Message-ID: <20241005200600.493604-18-richard.henderson@linaro.org>
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

Pass memop through get_phys_addr_twostage with its
recursion with get_phys_addr_nogpc.

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



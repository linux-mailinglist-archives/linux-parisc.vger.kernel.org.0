Return-Path: <linux-parisc+bounces-2607-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A36D6995C01
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59C7F1F2352D
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A3D64D;
	Wed,  9 Oct 2024 00:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GHpbOXYL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECE036D
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432310; cv=none; b=O8j9HyrQXFPc5hiwlPijFfgevPmYNylB9OdetH4Dxdsfx/aCQIScyZr+p728TNmfYN1hrjuDqyo9MGmfG/nUsmydcNjA99nvnB5IkhTP/JFtOdIv1ASN/L2wDw7s/YfWnieVxcdB/maM8IkQlMi1ozFCn/qTfxGYFi4bGSh2w00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432310; c=relaxed/simple;
	bh=X7/HRCKcBNpTWFYJXvWLm9o6rN4jurUTp8ma9vDBW88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ODbVgUBTRUPp0dj02sz/UIvOHt5CkCXXiNaoMvU/GxqpxYdhLT8T3A2Ci329zW9q9ZeETkz22F1ufDBm2e5lUWk9uZWLNCclNEuBp5ZQl8pk+yAzbkXMy07aqXr2+DEwSHgRhvJ5pe2IfNgo72ouedH6Ky5iv9fq7uIjkULt8wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GHpbOXYL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20b49ee353cso58170555ad.2
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432309; x=1729037109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=617h4byv7OP/ct3y2kJCr5k6Qy1wZsttJUBcCYmwvNQ=;
        b=GHpbOXYLH78s6+QpQ7Xdx2vUhbs3gjUHyo8xMu+uCa6icEyHBbFTYrowwRUXSOtkbt
         MFnvRMmiqZILIJfzOk4ySQ1HkwBx+PBcpNKYTmMhx4d9Z4ajO5vxXOFV4xfsPuWe64Fk
         0Bz9NsFiSOFPNkVz3LLd8R6ooHu2hCrnsORj1HcIQ14dYqeLBEjT7zse+jME2YEN1Pcz
         7mQIrUIVrwfMf0HY/c6IJsX50S3G01cco3UfEq/EW4G0r1h0jX5o89nV9YlPzx1/vWKz
         joRUsmJxegQfg59f9eZJ4HcB+aLYXov2FggraNNCg5TvFhCconFvnOGBqcK7GEYmb+RM
         akbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432309; x=1729037109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=617h4byv7OP/ct3y2kJCr5k6Qy1wZsttJUBcCYmwvNQ=;
        b=PgvTaZa+B8GsdjnUisqH7gJ5mGuNHw8qF3cHQA8fffIa0+C5SZfk94w7DmcW2Wlna/
         hVJRvf8srn3nHzUoMrLm0dkv/AtbpeKUoJ1BxNOK7BJ4Wp8mgJGLLYojoNvvzKkiVd4h
         Pu4Os8dFC5SRXRlB1Hd3wci4T9kpe5IENubouDlXc4mJ9cVI/3XCcCVuL4DhOXdp40Vd
         LpRrEhhuduwMR/kJGKTjisA1aPM/QmDI8XlkPQstSj37naAlrRAh5iR/jcuWSRDYkaiV
         9hBq8aYmnmPCVlWlJ5gpzsBTI/9olWL/4IydUSRmOr2c95MmAmsBk7Uc/zKQFPOQmzAL
         Yjrw==
X-Forwarded-Encrypted: i=1; AJvYcCX39CioNAD9VDfipdaIHFxIfXgpnDl+MMr1n0pHR2FXK8Pg8E6OR2oSAcD9Wek56w+JZw8Lohtw4NFPzq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuq9BZE1UEVPsSlutrGdFoWSl/Mt/4k3wQU2HoorE8NkJE/z3k
	/m1ILSLr1buSj1/Ps3Hcx2WoH62p8E81WoSaYJAeukk6tyDrwp5EwQbAxYf1Ku8/EfMnsRH8AdO
	r
X-Google-Smtp-Source: AGHT+IGz831u80Gw701tK56DvhnXhyXPWJ4bmGeVXTKsGYyVIeaQp323LRx3BoQmx+OjkzUmoyjqwg==
X-Received: by 2002:a17:902:e543:b0:20b:5be:a403 with SMTP id d9443c01a7336-20c636f5d9fmr11781085ad.11.1728432308873;
        Tue, 08 Oct 2024 17:05:08 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 14/20] target/arm: Pass MemOp to get_phys_addr_gpc
Date: Tue,  8 Oct 2024 17:04:47 -0700
Message-ID: <20241009000453.315652-15-richard.henderson@linaro.org>
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
Pass the value through from get_phys_addr.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9af86da597..e92537d8f2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -81,7 +81,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               vaddr address,
-                              MMUAccessType access_type,
+                              MMUAccessType access_type, MemOp memop,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi);
 
@@ -579,7 +579,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         };
         GetPhysAddrResult s2 = { };
 
-        if (get_phys_addr_gpc(env, &s2ptw, addr, MMU_DATA_LOAD, &s2, fi)) {
+        if (get_phys_addr_gpc(env, &s2ptw, addr, MMU_DATA_LOAD, 0, &s2, fi)) {
             goto fail;
         }
 
@@ -3543,7 +3543,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               vaddr address,
-                              MMUAccessType access_type,
+                              MMUAccessType access_type, MemOp memop,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi)
 {
@@ -3641,7 +3641,8 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
     }
 
     ptw.in_space = ss;
-    return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
+    return get_phys_addr_gpc(env, &ptw, address, access_type,
+                             memop, result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
@@ -3660,7 +3661,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     ARMMMUFaultInfo fi = {};
     bool ret;
 
-    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
+    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.43.0



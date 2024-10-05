Return-Path: <linux-parisc+bounces-2495-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F863991A7B
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE99C1F2230F
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCB815884D;
	Sat,  5 Oct 2024 20:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GhHHgHS/"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39741153838
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158777; cv=none; b=PakU/laI4ugnm1Uvbj4dwJtwnHic38jFQ4rTPFcYY+GevBHYzbn7h+ZH/EvBl6OTNVxUag9drg7n58F+yl4jjoVbJVhfnM9lKEvbAh5sr+qwosCBUm2UXd336cKkVXmIF2YjRwQeN6UaLsBL0t/Ny13/OCbKTePgh/wVcegWur8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158777; c=relaxed/simple;
	bh=XTzfK06oaFA2G+iVog17UM/vpH9ZZI8haEnAh7kVvHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8O/sKVhxwpGqrh7dEyjXoClDUhkKTVI/KJlo/aq8uuFujxhRHKp44lLdxIWRfYtBmkcg5jS10M9dhmyM0pWoQt4f2PEUFl5hdlXd4V3Lp1xvMuqeOjvy8Rm1o1r0HaHAneDLkQfWI1DqKByS0JiGxa5FKV1zK1289G+EeZBFRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GhHHgHS/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20b90ab6c19so35190385ad.0
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158776; x=1728763576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X5zP7zXx4H0vSkmfgBSYylbUDArgVMPw2dfqzvhfaA=;
        b=GhHHgHS/W0WGLHYBlIhCWaLgwIVRAyUpHTlwORvpm5NY+8e8D45G6zsmgO1shwge3f
         7wYtbeZwJyyyrgALbeUcRfGZs1rKeLe+21PDSqgQr8PBxX0x+fQdfJ/O+obt3MdT2A5X
         I+YoUv1hGdcZWnAuPVz8CKtDoe2zWj/pwHmrDZ4rHABLODo0l+aF9wO+YjwvTyt1UJa1
         M9ioetpzrZrG+stUC7Qwa10RJNlBEsnP8dRivfqnO49QS+ga1LrpfJeWtEQAiVXVXn+F
         6j+5SFPPsLdsKZsRuQ4GmFqywVSN1QMjzT3P/Tpxi35kCU4aASiB/DY2auunCcSvs1kP
         qDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158776; x=1728763576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X5zP7zXx4H0vSkmfgBSYylbUDArgVMPw2dfqzvhfaA=;
        b=thIqh61Bjby/4kwxh0DASVaEJTUFKZhWGZAUkbMNo2xg9+Atdsq/cWgtffRsvgsUbv
         eQqknev2xILjagRsVumH1V7PsJQYBZejE1bKtqz9scKzJMqmNJ2we4SyRHvaH71kut2X
         4nHWMSW8N5BLCLsWEtvTlKN9qIba0IitevUPfdG5EZN9KnnCOspya1YO6/CNdihQgG18
         UgYiJCJh5GKBbkJA6yc8PMUVbSWalQM/E1kh8iq6ePNhkhgLA+Dd3BIWfosb/ftb1kfw
         mkwu3Tbzhujj2+6BxjaComf7WTIj/44OA27Lj3N1xn9jCFv2Ji40DVnE+Tp3BGdzmVKu
         wZdg==
X-Forwarded-Encrypted: i=1; AJvYcCUAtfm9dkb3sD2LuTfExTiRBbI+7py+WAYTLrfH3S0la5U4Sse9iHpPFwXEci4W0p035uDGPtG1fuS3ZpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvnV6NElH6tCrNbkZFYTAMfmXgQDdBkRIaRane+il6Rm9EtSZz
	KVjF3xZCf5It0Rd5DUMArImV8K1XQdAK6OZgKy7uvxYtPMW2co4PxkVTJjvFLVIbZ9UnZQuZW5K
	x
X-Google-Smtp-Source: AGHT+IEx5vHtVkprUThlZwV+Lqo7Z029AoCfFZ0CZWDgQlrwN//FsMIaExtuwtG6PQ0wcXYm3ZJH7Q==
X-Received: by 2002:a17:902:e84f:b0:20b:b7b2:b6c5 with SMTP id d9443c01a7336-20bfee383c2mr91865325ad.54.1728158775790;
        Sat, 05 Oct 2024 13:06:15 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 15/21] target/arm: Pass MemOp to get_phys_addr_gpc
Date: Sat,  5 Oct 2024 13:05:54 -0700
Message-ID: <20241005200600.493604-16-richard.henderson@linaro.org>
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
Pass the value through from get_phys_addr.

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



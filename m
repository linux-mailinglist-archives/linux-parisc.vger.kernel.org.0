Return-Path: <linux-parisc+bounces-2606-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B496B995BFF
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B4762862EE
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37361370;
	Wed,  9 Oct 2024 00:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8mhFY2v"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7443801
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432310; cv=none; b=PtUTSkQnEp7iEV+6SEHSAzfp1ng0h3Jlv7iv1E58BBZ9phlNzBgkpc14N8sRHnVnZE+cwmw+fvqeyzCykvpGDxfkbQ5IMfc/HnfcrjTU41uR+7d+u0XapNBUQx6yE140D5JrBRk4i2kyYRPyNO1wONhZp65E9502RYHruAX527w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432310; c=relaxed/simple;
	bh=+rLsRRRnQcg9xk+UQX6OcHHIiYgacT7e4SiSslh4Klk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etpmLXSinTDzag1PR9fBk/0wI1NE3RKW7Lw91JhFGEbOdMWF1LJ8Zj2Sdni9uqbiYEv9lQAWA8xm7f0smZe2dpWuGTIE4W2x0Q9pt8Sshzf6M3UKKp8yZ2f6GBdIUPeVqP/8SNeaxYgQIUcn/ctHK0HO4c6FjifSXzKxeH6GtkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8mhFY2v; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-207115e3056so57297425ad.2
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432308; x=1729037108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I928rOfU7rFS4/uAexBKDkmn1Lv4VMSl/VKyNRV9wmg=;
        b=K8mhFY2v0ZgDacNpSjgSntfeT4II4WXhLoaNf3rv7DD6oIg1x4jAq1T+u28uuvvYTj
         mYGHsR10Km6TSrN12m3fD1ZyiQkuBgZ1LbWjdKQuiJdigEYhMLIHqMsDa9WJ6OKP9inB
         AVsiE9l98xmThvejdN77wsYmjV+UoFm5TbtHEAlHGgeeEMgEDRILUtRbMuIpH8yxNhH1
         DK/vKmTbP7jp6iv50aeBpDjgEnsIbgJIGxgVKkPTDDeaxCOqk2XiHY3shf8MF4DxAORe
         ETGqMJNA5piKi7f0tv9DU9NeYvrnyr5mifBb7YdJi7Q78rGc39XqXrWcx+G8YkyYJdw5
         LY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432308; x=1729037108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I928rOfU7rFS4/uAexBKDkmn1Lv4VMSl/VKyNRV9wmg=;
        b=c1kTU9q2vldq9goPG/1FRu48Oi1k+uisANkBOaBhBwLcIeCCTSPt56+UKRY67FQJ4b
         JzHtQZ6hJOfdHS+KfBWZvxQPjkf2llYNXIoDdMWj5xbGanx9NysQMvT7K5k1rY/4IB+C
         Snto0llBc441Tqy2BjXGLN5m097g7ZgzxKgOvAZlDE0Nm7nsAHWQ/bpylrT9EzFtcUA5
         kKhyFOPgq9Dpn0y9EhfXettXHsfR741Weei4iaMdvt3ywJ+dgFqGXSw5PxT3poSzwTy7
         weoXo4i3pOUrBPhQN2wyiSVS+ppZmdXtGUpxx56OGwdy5llKYpsf41QAuhos0os3HAgF
         2v9w==
X-Forwarded-Encrypted: i=1; AJvYcCW2mJanKcbDFmg46kTBBhHtWAh1FRNnFk2P/dZUZjOMeDpyEd+uttm9UqY0G8FNXkZ1e7OI4Yo0cs4VE5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YydrXDhQhmMVb8wRRIcmIHKwm33nO9I+V61rotwj/pMCx0YtZuc
	8PyMxwGwouxsrZkKeQNmTMB+5y9uUfIjbVbIiePktBxvl75J1PN978zhkA1zGzE=
X-Google-Smtp-Source: AGHT+IFMRMcxUNXCHul99WM0nOEYQH8Nd6y4x6kBohzqFF7CIBlmB9qDX2IdxPxzJUxR3zV7HkR2Wg==
X-Received: by 2002:a17:902:da8d:b0:20b:7be8:8ecf with SMTP id d9443c01a7336-20c6379030emr10548965ad.53.1728432307943;
        Tue, 08 Oct 2024 17:05:07 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 13/20] target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
Date: Tue,  8 Oct 2024 17:04:46 -0700
Message-ID: <20241009000453.315652-14-richard.henderson@linaro.org>
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

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 3 ++-
 target/arm/helper.c    | 9 +++++----
 target/arm/ptw.c       | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

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
index 3f77b40734..0a731a38e8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3599,11 +3599,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     GetPhysAddrResult res = {};
 
     /*
-     * I_MXTJT: Granule protection checks are not performed on the final address
-     * of a successful translation.
+     * I_MXTJT: Granule protection checks are not performed on the final
+     * address of a successful translation.  This is a translation not a
+     * memory reference, so "memop = none = 0".
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



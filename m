Return-Path: <linux-parisc+bounces-2465-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 019B49917B7
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3362D1C212BD
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A97154423;
	Sat,  5 Oct 2024 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FX4XwuA9"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2986B1EB36
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141963; cv=none; b=SeG8mWKP7l3zkotrME/zIt147k3D4285/gnbEjRCijK+jFqYU2de/eUgz6aSQTq++3WQmE5l3jESDmDUqdRw4+GReRPLN+B0712WcNxoi0pxnRuLYODel5dMEbbDUQnF48cGnXa9a0pnrxJaxDrPef1guhYi4eVuierfSrZMCAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141963; c=relaxed/simple;
	bh=tZoCwtIK/p1jJzOfgZpJrtMvDCOC/SNFglCoA1ddJgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIK6oJ4YArRji+1ExL6u5U394aSCYop7ismNOe6GcO35Mmo9kmEq5KYq2CFFrTCOTqz1r6wyLo+uSwQxnpIqX3EmKZEZmGnYZEn4z9HJJc9i0JzJ/CYVhEHCvq8NLDFXZ7m9VYjc/p43r0WKLbhmKXgD3MO9c6kYBW97/MyJA3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FX4XwuA9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20bb39d97d1so27185145ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141961; x=1728746761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wa2JC5GTiuZOa9FUt+c/E5R/4D7wBSs90VoPwelenc=;
        b=FX4XwuA9aQxSKoFeeWCruGBoej3riyg39adjGhg065F4JxCwZgpES/l3FZ69Z48+fQ
         u8dngJQD16ZwlIuztCJWNe0fng4LZ+oVEfbvhCY6vwA5kj1gbEsvrjeZVlh/8iuDv5RM
         3GsNbb3YcmHzqKU80RyUz+RKEy02A9Vzg9geu2wd1+MkC7reyChkLcp5dX+1ErGU6gw5
         /Wy8Vebs+PYqUuiYQOOIP2z7E68TJ5jvJZebQ9HjJ4fwRWCNQLFA0MSXCeeJuulYJmWL
         GN87qIDYV4I5PrszC7wYYdh6hp6xgt2rIErT/aukuWDX7mYvSBHyYcNGn1l1zDKyPoEv
         lstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141961; x=1728746761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wa2JC5GTiuZOa9FUt+c/E5R/4D7wBSs90VoPwelenc=;
        b=Hh6q+PKWF4YStkEfqLn0C//3PVsDqUyQj7kLkZomKPk5BGjejIFtEhDPBRtpCGyAVq
         /WjUbYTaxT1JIT4ofhbxFIl7NonyUH1PwMaewpSgFV9k9/vEKXRKfl/CYYZ0Y2b/qiqT
         /+GZmeb/yGcLmYuuwGOtMJX1vykNqEa5+zFEnv8J1VyDhjOckRduvcAvRrMSTfXKlL2q
         u4lfLz03mR328huLfNJJERbo5YqLPZYCBGJhobw4xBTVlRTlUgKLnmuQ2fU3OLSYQu5T
         jRelvRHJtgNQfawNJXuTsqhcqurB+aZ12kHU9srbhTOiBuBZnL4AgolOGs9ipTKXzRgU
         4KGw==
X-Forwarded-Encrypted: i=1; AJvYcCVwrj0pPCDw10Gi8bYLV6cXkAD+YctG/1UGaKfXD8eWSsgrfb15drcsU8ZnLEa/GwkYQhOMzzvxrTR5YfU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx9Yb/rq1TOWIBrV/dLTakJcX9MFMvK93mysbysYEVaYYdwhSj
	6pM6K3HCefke9HL6tjwi6mv1h6mc4TwMuud1QnBbqeVpYB2puEFyghExw+1AG5M=
X-Google-Smtp-Source: AGHT+IG91WPfsC5D7LXHeMJAPorkuse9kNn6CykSYZIeBAI70lXeJDkn5eW9lfVj7aitw+VRpPphGg==
X-Received: by 2002:a17:902:e887:b0:20b:8036:f77f with SMTP id d9443c01a7336-20bff1a9178mr88727005ad.46.1728141961604;
        Sat, 05 Oct 2024 08:26:01 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 09/20] target/hppa: Perform access rights before protection id check
Date: Sat,  5 Oct 2024 08:25:40 -0700
Message-ID: <20241005152551.307923-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
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



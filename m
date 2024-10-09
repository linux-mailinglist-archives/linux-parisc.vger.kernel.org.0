Return-Path: <linux-parisc+bounces-2602-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D287995BFB
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0768286386
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2B436D;
	Wed,  9 Oct 2024 00:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JaTY6OYF"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F1383
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432306; cv=none; b=c4giOcLsJE61EggyKPdnJWgPUYg+OxJocu1m3JNBNZGtxUZZvI1+AlKoyzt3PEK02arjqW9AO7GqpUR+n3lg0lo905fpyaKxyT018H5t7W36uEXVxxkw1vVL9A2cNP5IuolBIp4TxN1fRIITt5YTtquvAi3GnTqpAO7gQ+LsCuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432306; c=relaxed/simple;
	bh=42S/sQNxNr3KHey8FX2G1VylLlwoUMZwv9eJgyPPePU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0ahcuiSsl5lsu/FpCEsQrb2ohIa/9qwiW+t5o3cui5ILhoWKhUjxOiCv6wUR9m4/W3lkl5DoeIkygnvT0q3/wWNUZHdpUQauOLdldhaODeHnlqMEJeR2dpKvcyussqMqcAv63HxSfSY71YR/8HjPwVIEF3clfrCRHR0zl7NK5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JaTY6OYF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c593d6b1cso10751435ad.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432304; x=1729037104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8E2Z9ZSy95UZsg9Y2N2fIiaRxpU5aj12TR1V9ijHxjM=;
        b=JaTY6OYFfb7PZ2AxMDq1a7cVLsQ6BnT238/ZK8hnJLb6PO/Q/Gtewbx5I3AXNYGC8z
         6A1b95f8/wGIeueE+Ht8YvfE0lVKbf4FQjs7d+RBlqLMMneVBSJ2N2PZ7gg/w8eMCL7d
         r7co9MdQg/FRLebj8j/FdMYsU4cFHePGd+qIHMV0TJoyQ+H8ut0GZxL0EXdmIVD3dtNC
         JjrIyQu4v/tsyaQY4C25jGNU4ObudWJBUiaprGAkX/U8XPkzAgQ+4B6iy8LghfSIlUbP
         wE3twyMHzjpJvUgA3wWrM1Qtv2WGfXwVQIY5jGKliQz9oZU+RsjzfseQhWijdtNgQDtx
         ouPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432304; x=1729037104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8E2Z9ZSy95UZsg9Y2N2fIiaRxpU5aj12TR1V9ijHxjM=;
        b=eLQ+AqCTsNEtO8B2yPppP7oAJYLR6fZLR6cbdV6V+C1Axcq/BmprFAHI82yX0CZdIq
         Fy8y52K4U4chLPT9EfSEap+Z/APEUhTZyjl2jADtUWsZJNKs66LfbGVCulrloVNfxVn+
         QWatXFVLFFatT6OZqCfz8fqMpyfTCXtkRAAZWROEGyteRGWWx2p9J6XeBfdIFGB6YRoM
         V0mYZR6saRPd0ZwmmrsEP4JV9ZOuH292RH5wzZWaz2+dpSO+g6zQWoVh6TWPELNTodbA
         Bvmwl0LFDTJ3RbD+kx6/CFbCrgiVFRO1zu0Ay/OlCHKxpejV/zVavHQsGHLzFRQ0fHo6
         /d3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsD+32osuJISYQnfrZBksIztMDtO19VkjQbt/8sp2Bt6GP6hNhkPmtBxXiQabkWJ4kqLhaaCtXIszOPn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1yGa8vyfezIhcOABDP84riTOtoLgaShvjDlOok9CtWQo8qkVB
	RtmXEEToOSdoEODYvLMXaZaYk7meUSeYkNW9vZ6xzkunJjw+5lteWTCP4Vw6Th4=
X-Google-Smtp-Source: AGHT+IF0ZLww/QirXn6eqf2utM1nSiZwyzsJ3soHtkS1Z0DxnmXSBaV1UhTlgasVQznyDC1QSh7zOg==
X-Received: by 2002:a17:902:dac7:b0:206:fd9d:b88d with SMTP id d9443c01a7336-20c637986d4mr11253965ad.61.1728432304454;
        Tue, 08 Oct 2024 17:05:04 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 09/20] target/hppa: Fix priority of T, D, and B page faults
Date: Tue,  8 Oct 2024 17:04:42 -0700
Message-ID: <20241009000453.315652-10-richard.henderson@linaro.org>
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

Drop the 'else' so that ret is overridden with the
highest priority fault.

Fixes: d8bc1381250 ("target/hppa: Implement PSW_X")
Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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



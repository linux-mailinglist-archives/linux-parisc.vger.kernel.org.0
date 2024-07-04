Return-Path: <linux-parisc+bounces-1764-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5D6926E9A
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Jul 2024 06:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17CDA1C2171A
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Jul 2024 04:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EA0143C53;
	Thu,  4 Jul 2024 04:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="FAs9CfGb"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AEE73449
	for <linux-parisc@vger.kernel.org>; Thu,  4 Jul 2024 04:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720068780; cv=none; b=If+MCDhR/qCJHAoQXR9HbRpLWjiIA8lkzXYSp2LG/9XMzNVz01hBWiHqnnEx9u5EjPvRDdKtOXRN3nuFaGFXX73RWcOrg2gFFJxkhYAgMGFsLlR1apUnh3vF6XENlL+Z/fG0MUITQZxTM5Avx5s2TTAdaVArZZoR1qoAhCL7o6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720068780; c=relaxed/simple;
	bh=Gx6AaoN0k+hNjtZ8hw9/sG0BXnIAnuxC/KtvJR3Pn/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pxch92Z8hcTVfCYmCWO4EjPYwAygQg/Zc7MedyIjG4/8fizREnz7oq4d8FIgdeEW1jSOuWZ90hPeJfWifUkuuOOQ7ifG7opFFkVYXBstWBjnw+S8GIp7QO1TsED1fgffqtjoeNMPkHmAQFRJSAxz/p2YHZt0sEklTwpr3SkET90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=FAs9CfGb; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5b97a9a9b4bso107416eaf.0
        for <linux-parisc@vger.kernel.org>; Wed, 03 Jul 2024 21:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720068778; x=1720673578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6wDTS0g3UptStwgiQjvxyYj0LhVzXJz40n6kBEGVjo=;
        b=FAs9CfGbBZKS2lTsQcVtG4r2ubovSHQpc1w2ThvY48KSYQHiegpxFuNQam3+JIkxXX
         GRMFwDLY5+fyLUGnn0M8N2G1LQ47awiPiOu0dEuGxOTQcD9RjYwVAql4e5saX/AcUdP/
         T5WnR3QAt/JFywmc7x7XyPpggaxb9VTlTXDSlhV3o6cGDRz08/kjHqCgshLnuUrcham9
         +7k21LrmzL1MN7CFul7/SN3fvhJqkaRdXEhy5X6z3LtS7ZqpHmy6FatcdX7GEcMLMZoY
         oJUIUNifEtGd62avLtwKFeZa3yRHbqNb+RZa1uNAIy95d/ZfVCj8rl6ktHODBBOHM2CK
         +qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720068778; x=1720673578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6wDTS0g3UptStwgiQjvxyYj0LhVzXJz40n6kBEGVjo=;
        b=IteJSgt75AAWTkEdSNpiVYmWIgTwxVrU/lTStnkTrHZBHg15GNEAefCLzPnFyAZTDQ
         /Kr42vSSf9IGjrMaaw47FdhELUgqBqjX/oKNr8tQ9HLD+8RvhSemO8u+xV8l85Cda7Xw
         rFuxA4NciHTr08LwJ/OK1hprMfBYHtDeP83Nn6O1Hf2/EEU/XOs3jABmvkrZUZSdQMGT
         3e1KTyG/uU2iL4vcrLdUDn6Amc4b8C8qBhkrOsC9QpER4wZDKjBvyimlmaWEUBsYQIst
         hBpOzJDOqo7QZU30VB4FqRgq7gybZTwdhUV01cASrYPqHFA2IkqvyWzBs1hRE+oi+eqr
         YDnQ==
X-Gm-Message-State: AOJu0YwPbcKo/aW2o3srGp/aBMoo0XHJb4i28JOv5GelTbIBpUjYeiMw
	hVy3eV56G0mkY6HEDWrvRaZprLf4LednFZXHztsobixdnRaNxqJWKjWGJ9uu10o=
X-Google-Smtp-Source: AGHT+IESyt4pCSqMITa8/1hjZKD9+A7AHoaxUDf3ZBY0+DyMXVx15HIMLxei2WlfLwF1iffwd5E2Bw==
X-Received: by 2002:a4a:ab46:0:b0:5c4:396c:f001 with SMTP id 006d021491bc7-5c646abf6b3mr707816eaf.0.1720068777788;
        Wed, 03 Jul 2024 21:52:57 -0700 (PDT)
Received: from fedora.vc.shawcable.net (S0106c09435b54ab9.vc.shawcable.net. [24.85.107.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e57aa0sm11306721b3a.28.2024.07.03.21.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 21:52:57 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	rppt@kernel.org
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] parisc: Use max() to improve code
Date: Thu,  4 Jul 2024 06:51:34 +0200
Message-ID: <20240704045133.32400-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use max() to reduce 4 lines of code to a single line and improve its
readability.

Fixes the following Coccinelle/coccicheck warning reported by
minmax.cocci:

  WARNING opportunity for max()

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 arch/parisc/kernel/cache.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 483bfafd930c..db531e58d70e 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -611,11 +611,7 @@ void __init parisc_setup_cache_timing(void)
 		threshold/1024);
 
 set_tlb_threshold:
-	if (threshold > FLUSH_TLB_THRESHOLD)
-		parisc_tlb_flush_threshold = threshold;
-	else
-		parisc_tlb_flush_threshold = FLUSH_TLB_THRESHOLD;
-
+	parisc_tlb_flush_threshold = max(threshold, FLUSH_TLB_THRESHOLD);
 	printk(KERN_INFO "TLB flush threshold set to %lu KiB\n",
 		parisc_tlb_flush_threshold/1024);
 }
-- 
2.45.2



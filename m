Return-Path: <linux-parisc+bounces-513-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27854850BCE
	for <lists+linux-parisc@lfdr.de>; Sun, 11 Feb 2024 23:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1C271F21E7A
	for <lists+linux-parisc@lfdr.de>; Sun, 11 Feb 2024 22:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E403C2C;
	Sun, 11 Feb 2024 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="XzwGrRYB"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB12FBF0
	for <linux-parisc@vger.kernel.org>; Sun, 11 Feb 2024 22:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707691405; cv=none; b=fFqoRHQkrzG5w4K0Gm//zPcnr+f5raynzBS5zer1HuUPnxUN4rIi8jcTfx9g70CWZ4tS5Zt1TkhED40V4Su13ymb3wwW7Jc2cvhhBTCgHSyYYZM+shgluR/U8PBFUzxyBPZSz4h3WiqSlwY3+u4Dvp+clkFA+yR80eDDrqfP9ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707691405; c=relaxed/simple;
	bh=vH5zUWq2bx6dQW4vfZYSuRe8aVXk2pfKniPKqPuO358=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nvtYlkBSKTOxyzX2h3Fay2/QjXS/X2t0plCkmJzMeoROSD8qqMCSsD068ARY3cWyLk6fM3rnIw6qYBk2QoI56nYsoNR5erNgaGhcpyMs/3R2z9H2+Kga7w+cSr7oGMb+IO5a7Vt5zcQtf/Z5Ih+F968SS/lMoZlrc+v87OgspAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=XzwGrRYB; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a271a28aeb4so325677866b.2
        for <linux-parisc@vger.kernel.org>; Sun, 11 Feb 2024 14:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1707691400; x=1708296200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjFoTus7aHlrnOcOuTAWCgZWdvA6SJu+L7BLRl44mJ4=;
        b=XzwGrRYB4wgrdtQVHY5xX1gmGzqgxYdBbYfbzqQhvXkCm0J/eiDscC0FQdiLMEcoyN
         xf3f7ffeMf42ZBRCIzQGhFrIqNFJriSP8DTRjRKvgS+j8N0qblrGp6360bNHCpeo8Gmc
         MSqV7wvSAVwNGBQBlS/Y1ipmz9/E/o+l7gA4ozerlUh4mTNE1dGKh28pnGeaIog3ngyu
         2fTAI5Oo1pGDmW5jecWj3oi+r1uvzKjEoB8C+mz6+CRQmFWm1ITT7NWPey7nBKM//TgF
         n8l3ckrZfMqa3L8lWOch0M++KM0cYDLo+QFXj7TSvchlQRMvZxNoCf592pG0KnBaHVoV
         nFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707691400; x=1708296200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjFoTus7aHlrnOcOuTAWCgZWdvA6SJu+L7BLRl44mJ4=;
        b=r6k2ZsDp110ipxmIi39za2YGIweo3FVWypBXxaAAGQKyb31+ChOFfcr6ldyepyl53i
         J8eDTVJymqUgzSnLCAIa2VVguzRYSrpNo8dICQqs1U6mPFVAPwcKsXbA/pwwwKU5qAJh
         9QhokY8lwf6OhxP5nGa3+GS5bp6oQP5seAsQe9L0KcExNOm1PuJjK3Ark7r3nrgf8mUJ
         374fZT0u+p1mAiHawD/OsMEz/Fvoev+Ry2Eo8BM5t2LGNTa9bvo+b5wl0KDz74ij5FnU
         VXMCCl8fFn6Vjgbzdk1GvfmsTMAjxlUG0WW8acU/upQkL3nrXVME3mku6LznBqczLPCK
         UqJw==
X-Gm-Message-State: AOJu0YwuIwgM4TgLz67xRLMdsEwV3IZ2+8t1DcfgVbeHp4T80/HJRqVt
	9DVobGE7Eex9JPAKEs0jU5ntBOfCCYi2QX0/Nku/YWkQeLAHBIGQA/q2nT9zWq4=
X-Google-Smtp-Source: AGHT+IF/LQAiygCy1X2jwyJTPhn1e+uYExYY761RJQwyXq1F0mNIQlwA82dukr6G4OSCdbXkY491HQ==
X-Received: by 2002:a17:906:7f8a:b0:a38:4879:72f9 with SMTP id f10-20020a1709067f8a00b00a38487972f9mr3948919ejr.24.1707691400547;
        Sun, 11 Feb 2024 14:43:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtkTht4pynUiAjFuubCUmY6w2q1SDAomrzS74tMB+us6WxH+jvbhOHWUNcrWMoEl5L6T55EfIgeLoXTWNKIlhYxr9Azsf4uiaYvVR0jG2UYSJFwNC53+sU4Mb9JCe/fX5SgZ0iM9y9BJX3hSLh6HTvEqrXDhnZY6lExzdV7s8jIHcuvCCKuG67bCDx3nmBH3OuRXj8OUpxJzEKKWMdgfkfHIGL+kY6VJS2t6LOasRut1XGmG8ZWm/H9pdGeBNsH2C0ZWGQZm8dOABjP7/+vv/lSJAW2MSWurvNReMFQoeTJ1fUgn9eVo4ou7kQKvt8tQ==
Received: from raven.intern.cm-ag (p200300dc6f267100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f26:7100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id g25-20020a1709061c9900b00a3bb2156f7asm3252608ejh.185.2024.02.11.14.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 14:43:20 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	linux-trace-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] parisc/ftrace: add missing CONFIG_DYNAMIC_FTRACE check
Date: Sun, 11 Feb 2024 23:43:14 +0100
Message-Id: <20240211224314.169314-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a bug revealed by -Wmissing-prototypes when
CONFIG_FUNCTION_GRAPH_TRACER is enabled but not CONFIG_DYNAMIC_FTRACE:

 arch/parisc/kernel/ftrace.c:82:5: error: no previous prototype for 'ftrace_enable_ftrace_graph_caller' [-Werror=missing-prototypes]
    82 | int ftrace_enable_ftrace_graph_caller(void)
       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 arch/parisc/kernel/ftrace.c:88:5: error: no previous prototype for 'ftrace_disable_ftrace_graph_caller' [-Werror=missing-prototypes]
    88 | int ftrace_disable_ftrace_graph_caller(void)
       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/parisc/kernel/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index d1defb9ede70..621a4b386ae4 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -78,7 +78,7 @@ asmlinkage void notrace __hot ftrace_function_trampoline(unsigned long parent,
 #endif
 }
 
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+#if defined(CONFIG_DYNAMIC_FTRACE) && defined(CONFIG_FUNCTION_GRAPH_TRACER)
 int ftrace_enable_ftrace_graph_caller(void)
 {
 	static_key_enable(&ftrace_graph_enable.key);
-- 
2.39.2



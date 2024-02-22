Return-Path: <linux-parisc+bounces-615-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9930C85EF37
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Feb 2024 03:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA4591C22025
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Feb 2024 02:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A52179A4;
	Thu, 22 Feb 2024 02:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bDqLaH4M"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D792017553
	for <linux-parisc@vger.kernel.org>; Thu, 22 Feb 2024 02:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708569459; cv=none; b=NyvQrx7oX2pMINyLoWQ6lga4IRv190nyx4sfUjHaaDesqtjOYR7+doyUZJraS4RcqoqNpHpALE/JojcRIbJW8tJ45mSPmD9DKApgE5RP8dBlSyBi9EJy+vnitsP52NY3WH7WyxsPkqF7ZNx04b7zNu4Ifq/rJ2CWIFkqnU1rJaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708569459; c=relaxed/simple;
	bh=loWpjUeaU5B9E/ejxOfrGk83272NpESpvlB1T6y7RcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdvF+yj8NIxjxQHMPNe1TUReXt1WX2CbNEbMpM40pPhdINUxLMhMhpm5q2aBw58xkW9RW/TUTpiZzFOontd09lu9ZCeRGe0NzNrVBGL2e9UkiMvp9+i0wzCnp5nW9OZ53h4Ts00jH2y3uvhaQpDPP7wMv+HLl2TgA5v1upbkc9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bDqLaH4M; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c1404d05bfso5399585b6e.3
        for <linux-parisc@vger.kernel.org>; Wed, 21 Feb 2024 18:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708569456; x=1709174256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGrNzxe3gyC6VQWPSLHOaYx0WPaI3IQ/8Jr8tyLxsyE=;
        b=bDqLaH4Mz6HBVCQH8/bzqJM/xjCxIxcGrIh8PIEU0TYPLwt6nH79zDhos0DOTlmk/R
         sewKpdEG84CTfUkO4fqkKo+KLgPemD7mqj176D+7eicT/3SoHLmguQVgQkvNX5ol1zoE
         1W7S3IroWirVSWaPWLLTcdWP2uQMrDsflRj7BxPghmFDaR2YAXMEKZSs0qejzkCxbjGA
         SPlxggHVkvmjfUHi8n+B1W5tu/YIAmEF7fyYfycUAhwAiGUCgm2UfQa7df201Dg9OBTJ
         /MxdofkD0gNu3TRQycgc42xIeApQf4q278El0L7milqb7PMFVtXnJXTxROIBSCctm+Os
         siJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708569456; x=1709174256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGrNzxe3gyC6VQWPSLHOaYx0WPaI3IQ/8Jr8tyLxsyE=;
        b=ZWXHuUWT2O7R46bGCoydA3OUdEGzLqEHSFToxtEZGMvZlbPpHkZCYJJ/gIho39Ypwk
         um7gNEzv4b5X3IzJZabLgAVPz75SqrrnKrcUQJAAbCBUqOiL+g5zwgHd9ZMs7slrPhCt
         hjG97mXrWP+P/Q4EZLxkSq4tUH9L5l4BlbiHD28VjQ7Jy97cSYwqtsyn2vqj2ecDec22
         oDnfUr6kQ8d5xjkqfRGHcIgU444X9IeQMxi1WeIJJXU09tBRHVJe0WGrOMLsHhdgIkyu
         qLFGEd0K1lhqvl+4S6yLXQ7FTZEx+FEZvS5+LozFbotfyPwWMmUnUPAcSlOWer3m12NQ
         nuQQ==
X-Gm-Message-State: AOJu0YynPnWDksigg22eHWTEywkse7Hss45b5y5sNV9ZEHmGOx9bJN3O
	o2Bp3T8BdHy34h4UdYs4Qt03RuMGplTtwrmtdSaOEW48NOrFOmNu4v3dx7Louxo=
X-Google-Smtp-Source: AGHT+IHr4SZnfJdYWs07MIcE+jUM6/a0JrEuqqzI8zGh/SYhR/8eR1eYgSYBAmBjDUh92jlYMvK//Q==
X-Received: by 2002:a05:6359:45a9:b0:17b:335c:fa07 with SMTP id no41-20020a05635945a900b0017b335cfa07mr13781339rwb.32.1708569455998;
        Wed, 21 Feb 2024 18:37:35 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id kt21-20020a056a004bb500b006e465e1573esm6469705pfb.74.2024.02.21.18.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 18:37:35 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 21 Feb 2024 18:37:13 -0800
Subject: [PATCH 3/4] parisc: checksum: Remove folding from csum_partial
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-parisc_use_generic_checksum-v1-3-ad34d895fd1b@rivosinc.com>
References: <20240221-parisc_use_generic_checksum-v1-0-ad34d895fd1b@rivosinc.com>
In-Reply-To: <20240221-parisc_use_generic_checksum-v1-0-ad34d895fd1b@rivosinc.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708569451; l=1119;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=loWpjUeaU5B9E/ejxOfrGk83272NpESpvlB1T6y7RcU=;
 b=xtNabUDylbAE6Wad/8orZRl3dAazwQY8qAbie+Ef8VKsiWBGicqZfawURBgIzMindz5keC/GQ
 JFElQKZrZefDR+vZaVkejbXrGuxRi9Xb6hk2IyfNMsmFd1KK3OjfEjC
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The parisc implementation of csum_partial previously folded the result
into 16 bits instead of returning all 32 bits and letting consumers like
ip_compute_csum do the folding. Since ip_compute_csum no longer depends
on this requirement, remove the folding so that the parisc
implementation operates the same as other architectures.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/parisc/lib/checksum.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/parisc/lib/checksum.c b/arch/parisc/lib/checksum.c
index 05f5ca4b2f96..eaa660491e24 100644
--- a/arch/parisc/lib/checksum.c
+++ b/arch/parisc/lib/checksum.c
@@ -95,14 +95,11 @@ unsigned int do_csum(const unsigned char *buff, int len)
 /*
  * computes a partial checksum, e.g. for TCP/UDP fragments
  */
-/*
- * why bother folding?
- */
 __wsum csum_partial(const void *buff, int len, __wsum sum)
 {
 	unsigned int result = do_csum(buff, len);
 	addc(result, sum);
-	return (__force __wsum)from32to16(result);
+	return (__force __wsum)result;
 }
 
 EXPORT_SYMBOL(csum_partial);

-- 
2.34.1



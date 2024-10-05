Return-Path: <linux-parisc+bounces-2481-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 735ED991A6D
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E8371F221F9
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D66130AC8;
	Sat,  5 Oct 2024 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wMU8zMeM"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69189153838
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158764; cv=none; b=UPM8IR4ux6TgLbBgCzjsSowjWkh43clHcfhpiFUBrSpEEOGits7cfafWO4Afqwa3yMC2RdwxuPMj12NMZ/jBE03rbhz6Yu0RvWescGEplGfHKw9iMHxMISfJZha6rrS1cuazYdotVIngNMrr6lQo5dx47GzSaSDQScP+thzZo/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158764; c=relaxed/simple;
	bh=+dpu25dlok+GjgsLvrO8ITZP/Q4KUk6jRMPM9e4O+S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9XINpD4sjRf8XTRQDRc1d5ljwUr2hVqXoOnLgAQkA0nrVgqXvFlrrmyNCRTEHqNj+zsPPkx0xFXTVrWJb0KLL8l0jI9HTk2XUVuEx8cMIC2ZVuRwiBY3R6KLqFO8tBUUW9MqmJBnuCF2Zc6SKm7lsAyDQMw8Zol1uf+DTHJ/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wMU8zMeM; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20b93887decso26368315ad.3
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158763; x=1728763563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qpc+gtvz4QF2D7U7hwk6I/PwDTmOhNNc5A8A2G2CqV8=;
        b=wMU8zMeMq0XYzHQt9G1xz0iUYqQYIFr44xNi8+PlCdLanpDJXK6yu018qM3zRrcli+
         YnokOtl5ECR9CScaRxQ/86KKvAMDT2dL2kwZxMq0xuTmRsBwn+KbIt+6ln2ZEVxdtc61
         qJm5O4HvFJfY88/CTyttyJiyfk5X1N4Sb0LzzQS0ZVf8lwD9E2q4eziTem4L42JQrWi3
         TpZGVCqlGTstrl2OogszwIM9F39PhO6NCmBI3KZdOc8qeFQxJq6BkHWwtv2bIJPfWSZi
         afLuiB+ss35eAkPYSiwa8RiV8M2+lWGwt6KyMftJBmTSQnan5Eb0R7kPa672MOoXrRpE
         2shQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158763; x=1728763563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qpc+gtvz4QF2D7U7hwk6I/PwDTmOhNNc5A8A2G2CqV8=;
        b=m6cUv+Vc+IcOEWthWq6dGSU2VLTEBQ336bKQBiyPzNooB+IXym5ky9nkj6j7MoejAT
         HhCSf/BcnO0J8tAjhjazjA8jgvpGpBXej6LG+difJV8cZjNw33QGRYxhL8FQD4woNIho
         XgFgQkFZnejSIcnYq6gEA/GJhr/XjBNvzpZnFlVnNKyLa+TOulZFsL2rrlZrqTagb520
         J3NQZqeG1TKEMCiBmOXXB/MMQLbMtGs3zsZp1drBdLoRGqB4M+lUvdRgnBtNgjow62SV
         3VPZXXboGX8zRbkjdruBpCwZbabensYXhETm3f1R9BImXGhsC++fbkOq4UzQjFpFQQzh
         SvhA==
X-Forwarded-Encrypted: i=1; AJvYcCXICcDKUB62r7/bvU99nUAqjJh6vB/G0AtLi79AzPWt3IlHztw9T6aSDd5RhcfrdgIa3ioAx5VXrrwwrJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5PtMy8uoOaq4bqCI3keJucLcEFu5MlV/wM1APW9Pv+U6QtV8x
	TQte3zruht02gwP+W6/x7xJlG0Ernt4jlUMiY3Ln2Muth5orvw6oG1tLxuOXsnsmPwLgXoVrNIT
	/
X-Google-Smtp-Source: AGHT+IFmM8Oxp421B76h4UpAzO5VbLx+wqOrR4XfQnLhl5uTco5sEvRm26Oyl1URtBb3k58uPkW8Hg==
X-Received: by 2002:a17:902:f545:b0:20b:a576:1896 with SMTP id d9443c01a7336-20bff190668mr89398765ad.43.1728158762695;
        Sat, 05 Oct 2024 13:06:02 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 01/21] accel/tcg: Assert noreturn from write-only page for atomics
Date: Sat,  5 Oct 2024 13:05:40 -0700
Message-ID: <20241005200600.493604-2-richard.henderson@linaro.org>
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

There should be no "just in case"; the page is already
in the tlb, and known to be not readable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 117b516739..fd6459b695 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1852,10 +1852,9 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
         /*
          * Since we don't support reads and writes to different
          * addresses, and we do have the proper page loaded for
-         * write, this shouldn't ever return.  But just in case,
-         * handle via stop-the-world.
+         * write, this shouldn't ever return.
          */
-        goto stop_the_world;
+        g_assert_not_reached();
     }
     /* Collect tlb flags for read. */
     tlb_addr |= tlbe->addr_read;
-- 
2.43.0



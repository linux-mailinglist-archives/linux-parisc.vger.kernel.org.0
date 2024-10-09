Return-Path: <linux-parisc+bounces-2594-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B53B995BF4
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40D831F2327E
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C31F370;
	Wed,  9 Oct 2024 00:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uOMODJ6M"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0DBEDE
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432298; cv=none; b=TfL4+BHULCgRAK1A9OgRNqeYFvwcU++f6b3weaP7kPVyy+SkRUA+Wh0yKS+ODCIoaakwCDGYXKqYg4hg366hb/mc7kN4F3LcldyEOzv4YH2M8J/+GzNy1gG5FAT5+YRJBv9m8J74ELG2e7TwVTF3aKOZvpVHcX4jfqELMj+r00c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432298; c=relaxed/simple;
	bh=PX7UlEBJfxn1U/i74gDBl6847zXg+qyZ9No+NdNhsqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrRs1osdVmfcb+piup7iSMkr0l/IrQyMYBdw8HTDI1L7khvDpRz4C8eeYjO1yVEQkyPbr9okh7hTeyFQuw993lGm0bVPGtzQbXtuTsQjm1uC7X6OO9lgR2IzMyYLM3xiv3gLV+iBdWSKIRT4li3qm/HGBn1A6iQfYNVr2eiIH4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uOMODJ6M; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20b1335e4e4so61473475ad.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432296; x=1729037096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sM2rASXzZfAaByCSG4X7yOvvA/fFZaOvGmejFsljDo=;
        b=uOMODJ6M7SmqcxrkEBcTuhY6TF/UH5rVVJoq+ACbFzipZCn/1Xn2XofpSd4brmiVF4
         X0Dunej5Lb+fFzif0Qfn3RNpN+ootquLYKz7muHCLlTXe0pauJi3U8FdPnUlx6ngPGwY
         d5sboxHF6T3QtLsNa3Q7fCCpfs3sxKAuXy/kXV3gILB0BFK7o6AmoeSjJexGdu5EiJeq
         yGjGPVcXRdIeXVkxPhx3VZAccGp4sJ/3Vw7U/xvRs9yy1mobhb/WOd44D/S6a2KOGP3h
         Eah6s6S/NFTKO+JAQsvIBL2nL61QUeyVpopq8L21/BOHqR9+TKx4t9Vx2IHfSj2g5bj5
         XQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432296; x=1729037096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sM2rASXzZfAaByCSG4X7yOvvA/fFZaOvGmejFsljDo=;
        b=JuA8ANAiH9a6lEohopl03sU59C6lQF2PjVk076GvTckQN4AA33bkgBfI0dN1ARinMW
         SkbrL6zvTPIc59feM3KqOB+j/hEaFb1izdMuwVWBT/+b2SukkoGna9I61V9GjC/2e95P
         Q9FIP4dmKFyX9qgIuyPIbcE4dWqTmuDu0sTKjbBCc37OpGGc+6vXLVajA2KC5D3CVrFh
         9tYSOucN8Ix8/HZeJn688EPyYVjO/rKcoe+dQ1NSSXojyrrXSB5dMlNOvnS7ur9rBmvJ
         ZJvUwkzWdwQFj8wpud4ukOExuDfP/jEEHySeqsOxPI7ZEpjzXz/OFdZjO8zc1NGrg86S
         /xcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnOUNelJTw78f3CQuR+PNAoQH0JFEIabrBnsnG3FT/2fHWupKtj3rCkZSML6GPkAaHKDexylVn6OOH7ww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5iGkAYDm7nu/o/Tl+Wog75liBbezrfi6cP9bhLo3Z2XRov4+a
	oYQROxHW3Z3rleWmbjMG4FyU+rfEMUaOraJrql3VA5dNGv6dE0COiirI2+HFMAw=
X-Google-Smtp-Source: AGHT+IH2ZvMU4bGuSg+tDG+ztb5xg61iiZPQqytdtvNBcTuZ+zmK3VvxDZbtlEMK7wthugBWGqHljQ==
X-Received: by 2002:a17:902:f685:b0:20c:5c37:e2c6 with SMTP id d9443c01a7336-20c6375b1ecmr12035995ad.11.1728432296270;
        Tue, 08 Oct 2024 17:04:56 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 01/20] accel/tcg: Assert noreturn from write-only page for atomics
Date: Tue,  8 Oct 2024 17:04:34 -0700
Message-ID: <20241009000453.315652-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There should be no "just in case"; the page is already
in the tlb, and known to be not readable.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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



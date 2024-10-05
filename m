Return-Path: <linux-parisc+bounces-2457-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6FA9917B0
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F18601C212B5
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DB3153BFC;
	Sat,  5 Oct 2024 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVcoYtKq"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6FA1EB36
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141955; cv=none; b=o3ZLDf6SDLL36Lr6N1/qIrUtfPzpjr2DU8PTilKlh2VSLer+M0sv/33maqczmMD1ccLVudLCBnB43ifQRgAffDisaHlzp+/rAi8uXDwCXEWjwAatcF5DeqKESo6IwyiGpYual0sG5VhGGbrABPpzGYJU689YDSuMPauArk3dmvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141955; c=relaxed/simple;
	bh=+dpu25dlok+GjgsLvrO8ITZP/Q4KUk6jRMPM9e4O+S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHMnT7fiiFs6fHj1tifqxopuUIZqW/vijLo9soLc0sF9bg6En16XzEoII7iwgUdWRMo9beXWrKG2GkW9GdiSPHyIA25BfenfTFvPHpJy/QS9yHAE+qhIPkQTE4dDpDU67O3fx0/f5aexj78nudWWWnR61uULiJxjTz8qaGywFeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVcoYtKq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b90ab6c19so33844305ad.0
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141954; x=1728746754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qpc+gtvz4QF2D7U7hwk6I/PwDTmOhNNc5A8A2G2CqV8=;
        b=wVcoYtKqZhGBLs2DDdD4i0+9MbvlaPnP7NdXl+QxxpoSdo+Nt+RlsoMMOzY6J8wSNc
         tbfDIfAca0tFkfhmT3ovql0ezzVAcRrYxJTLyVFaOdOtNkXebF4AbUsKEKLRTCpSQsbu
         P/Nvbxg+CG8yOx834EDBJ58h3O8QZ2yED2McHBnFNUrqDMfLqNSDvOQL4KXtoBVd8DE7
         8AW5r1JDuUHvZQ41W9LzA3ulMOZ6IqI2Z8Vx2jisOP1Yg5ujuNb4nHegl2mTewLDcRdz
         QXozZ3etpzSH1XgH4p4d4ZprpsTRxX+QhboX5nfx76VgErTf2v8b8M+qSXehYBrs++Tu
         soIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141954; x=1728746754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qpc+gtvz4QF2D7U7hwk6I/PwDTmOhNNc5A8A2G2CqV8=;
        b=mT7bAK00RDdYpcD8V2zY0fL3N3Qt51oMPR3l+4MupZ8JHJdDiftdoYO0l/FcoxQ2IZ
         nX4Juj233Cxo5T2+n91vjC8BGBHLKCcSwonFXSIM4IbOSifvjtzvfr5QqiXf+DdlYwXw
         FQzM5RQq5ITxSlk9qbCRkeYW3ggTI90EvRQIfgPcPHMJzO0/BaK67o7ys0CxtbGfq0If
         ZjaS0eD54vX/yA9q/7vvMBoB37CJ7hliyIHZURIJQsyCJ9KQvqg5MSdFYsJy4VqfWJJy
         +LeFua8NxJj7Dm+wrlauoDHVK+D72hvssjRG9XZCwaX57SxE5OdbRCVzn1CsTM7aVTXB
         H6qg==
X-Forwarded-Encrypted: i=1; AJvYcCV4WO/WiH0HG/QqeIHLtYG65+Oc7TkkZ/46eZDD70W4LzQx/81e1e8SGsgK92tfdmupw/tIfOs5dZDYJK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfEcoy9foIYdcFNmPfA7l0nacRxxg6j+3vtpSCJKQ+kayhnSwY
	ye828CkFr3Pn5OgINHn2BPPwlgNfTTqFoiUpaud8kHFCeNjYBh9sRc9ThSl/rJk=
X-Google-Smtp-Source: AGHT+IELKa52UOR7Ytz4WC8NdW2qQ7qz0VWYMH9P15Fb5pfsJzTN9y4328hD9lJpQGFW7j/3iwlUjQ==
X-Received: by 2002:a17:902:f68f:b0:20b:54cc:b34e with SMTP id d9443c01a7336-20bfee34d54mr84315875ad.51.1728141953851;
        Sat, 05 Oct 2024 08:25:53 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 01/20] accel/tcg: Assert noreturn from write-only page for atomics
Date: Sat,  5 Oct 2024 08:25:32 -0700
Message-ID: <20241005152551.307923-2-richard.henderson@linaro.org>
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



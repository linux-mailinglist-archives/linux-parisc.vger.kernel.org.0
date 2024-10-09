Return-Path: <linux-parisc+bounces-2595-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D2995BF7
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB9A8B239B6
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B48E64D;
	Wed,  9 Oct 2024 00:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="degRnJmn"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA81B36D
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432299; cv=none; b=BjNhKgTxjR9gM1EwQb7TxJOFgb5fYtxenac/hDO6+BbH0lUqkIhmuUKauEx9FnR+n5IvZJKmt8/6CAX/fjgAFDdWfcEnNEYrvXcLWEu3a2JeREsRiF8KQbtV92VbYLa7QTaC5IqDi23Lb+c/iK6V/bu0pTh+SpPX5HsfTfX8M84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432299; c=relaxed/simple;
	bh=a1CSXCD7k+F9Ou2TU5Nm8NV+PyJFOU0XPFFoAuBJNJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJ6PAkNLuC5ZSrhdpwB9euABlSqxjIj1/THR2cf7vuR9S/wAcZtmbf9HQDnf06dhaLHHnes3X5y3HALoun5tIFg8nwexm55wnKNS4OG95GRWZ+BEAOpa+sTlr7x+IgtP9ufCdPH7N5j9VvEpKgsIIlVsf9opLE/wK5kzFZ7WvtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=degRnJmn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20bc506347dso49904285ad.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432297; x=1729037097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9DVukvxY0Nz2lbOkkF1UGxIJ0HiyrlwFe+DiEN47Z4=;
        b=degRnJmnNtXsChKestLor01gj+gRp2n98J+0k7QkS9HG2D6K82bNFK8ZJso5f7NHzw
         fV/ajPFdCm6oqcGMBKW/a0IVpjO/Hb8v6q30NpXnpLn4QO+UDbxNBMDuzq/jjpqrtEEw
         hEX7IwgDUya85OchnzeXzqVJ38cHXfZIa6jgX/uoQlZCZ4b+w4aoNrEg3mcnOfU9iEn9
         CjRCHD7GPh06mPOdHVkgmoTdhJnAkzlrXhkyqfpgIAO82ES6BH+E0GIWk737+oVDT6sd
         gR4inrpzGU8Td69+WWTVu3KhnR7wsMUTCkWaGeUWqyyZGKymIoREzd+P4I4JgYVdmv/4
         GJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432297; x=1729037097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9DVukvxY0Nz2lbOkkF1UGxIJ0HiyrlwFe+DiEN47Z4=;
        b=SkiZbU2hnearelHnQjYaGjL7n85Y+4PI2wSL5X5CqTlvDcXmzGHjeyEOP38c6lr0do
         cyw5jVokb9EEZGsHhI4L8CZq0VmM3zhLDukDc8on2hZWX960l3tDUEOm9jrnVTyb2K6f
         tLrm2xTsL+B22u6j+URl7RcxljLYlXSeIqXmRN11f7oZwO5inRcPC95b1DgNGjn3J7L6
         D0g9jJLfrCSP13kDrDefFbeohMvjorkln3bPNTDNleOHPotrI+KzBwPzsnKa5MEQtG0i
         a83aolWKMaWDLCmZoodSgKW6HlSzrrnzcYVO4IbswEDZ1UdroNUxWARz+Cpd1frecvrW
         i+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCU69l+C/MXmipn7/kwZYtC3P8qRvnpHl4mb8o1KKYrpuOIDJqSQfObDREQJPwejP+zndSCMNnqo1PyelGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjJvEMzWWYCjRhQgtxqTz5cfkfAOCSegT9n1d8hmsEKCJistoF
	ZVZWq3OVZIzg95etuLG94a82j5fR5yT0zPriv0qjtm6iusc+r7+rG+7uK2ntWfU=
X-Google-Smtp-Source: AGHT+IELfN0bakgT3mk/GTecwW46dkwTT2ygCiT/BAX/1818Ov/crY2+v9Y6lIuiJxQlQfEPFhy1uA==
X-Received: by 2002:a17:902:c40b:b0:20b:bf17:e497 with SMTP id d9443c01a7336-20c63780107mr10371935ad.46.1728432297083;
        Tue, 08 Oct 2024 17:04:57 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 02/20] include/exec/memop: Move get_alignment_bits from tcg.h
Date: Tue,  8 Oct 2024 17:04:35 -0700
Message-ID: <20241009000453.315652-3-richard.henderson@linaro.org>
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

This function is specific to MemOp, not TCG in general.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h | 23 +++++++++++++++++++++++
 include/tcg/tcg.h    | 23 -----------------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index f881fe7af4..97720a8ee7 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -170,4 +170,27 @@ static inline bool memop_big_endian(MemOp op)
     return (op & MO_BSWAP) == MO_BE;
 }
 
+/**
+ * get_alignment_bits
+ * @memop: MemOp value
+ *
+ * Extract the alignment size from the memop.
+ */
+static inline unsigned get_alignment_bits(MemOp memop)
+{
+    unsigned a = memop & MO_AMASK;
+
+    if (a == MO_UNALN) {
+        /* No alignment required.  */
+        a = 0;
+    } else if (a == MO_ALIGN) {
+        /* A natural alignment requirement.  */
+        a = memop & MO_SIZE;
+    } else {
+        /* A specific alignment requirement.  */
+        a = a >> MO_ASHIFT;
+    }
+    return a;
+}
+
 #endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 21d5884741..824fb3560d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -281,29 +281,6 @@ static inline int tcg_type_size(TCGType t)
     return 4 << i;
 }
 
-/**
- * get_alignment_bits
- * @memop: MemOp value
- *
- * Extract the alignment size from the memop.
- */
-static inline unsigned get_alignment_bits(MemOp memop)
-{
-    unsigned a = memop & MO_AMASK;
-
-    if (a == MO_UNALN) {
-        /* No alignment required.  */
-        a = 0;
-    } else if (a == MO_ALIGN) {
-        /* A natural alignment requirement.  */
-        a = memop & MO_SIZE;
-    } else {
-        /* A specific alignment requirement.  */
-        a = a >> MO_ASHIFT;
-    }
-    return a;
-}
-
 typedef tcg_target_ulong TCGArg;
 
 /* Define type and accessor macros for TCG variables.
-- 
2.43.0



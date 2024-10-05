Return-Path: <linux-parisc+bounces-2483-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71411991A6F
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AF82280FBB
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD18158D9C;
	Sat,  5 Oct 2024 20:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aC72o5Z1"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF0315884D
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158766; cv=none; b=nW1cTmRm0zw0KM1quS71HdHHAtb8IxG8CllpUaHXNWhpp3VEmHuINP4GGM4dAa12P930hfmB6VkMD3x0AOdGos+aeQqdjq5aTHHZrCMZqAU64t+b5NCGgABbbTzCQWiw3zvynG3MZdMa0ir65vVgpZYuYfMOgfnPxaA+93F6d1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158766; c=relaxed/simple;
	bh=Gh98pY0MAR0Ot832aCn3hg2vuaYiKb/XiJoz+Ma5LyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOYdLZ+svPZ4sLJ2CustQkV6LP1Kip7p6aA3/5owW8yN2PfZPLzBKXa9MOkuRNR8pOonTPhcFLvz+683JDZCRxnExMi7mtiS3LmCCXESoq5QmfN4kyZlmckEAWQKve5dK+MupDpoiHCP60Zp6tRBUhdApQgLIJyWYnkVlnEc/so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aC72o5Z1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b78ee6298so20648275ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158764; x=1728763564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js9k8IR/cEhAqGc5dKpCioG/n/UgV+piB56d5dg8Aiw=;
        b=aC72o5Z1zpvJrxSaiEEKXy8+1QIlIzP/np6e9yH4oIbzx9kD+iqwIIl794tI8ZY5/b
         RkOs+kjj5MF2OCwSBDwLBQjwCAAA6oJCoQi5HcN4qFCYEAAUYJXfrnnBURps89waDrzU
         +jzh089xeEn+W/kWci1bWuaxeJj2qoc/xaMtQQ7teThIGxQ2p1duR5k96SqVomlo23YW
         VTJQ+8NVhcDminBmRVwCEGqPmnGRyB47JvIHK8auy6i68nI7sPM+HVuywVyiFeC0JAQg
         cGkMocQXm+t7po/n6xbeG8P8FVrIjOKAiRfYngSW8QIfhN5Bj4/gE/+z09ykpD/+Oj+B
         nQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158764; x=1728763564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js9k8IR/cEhAqGc5dKpCioG/n/UgV+piB56d5dg8Aiw=;
        b=FIYHtdVgR0cVNnnHYqSJA3AkeNfb4WS+fbGMFfn1Lb4qcg1tnbxRvcKalT8M74RNbW
         2Bvfqy53YJsk97mRgFZivWd/ExVhOl7xaa3QBjPd+Pj5idwsr2LJKs2KSjnfcMfmG5sv
         7foY0qB/WLTtpqsjb7LcWtwRL8Ob6VUT4LW0I1SEB9O5eBIH2PSGKLqnjNFJRgr+Qjs1
         DnWvq5IwIticP7W+rAVrKru+XnWiO4zpOKl8WMga2zD+Rx0s66EditU5fiQViDpuzqsa
         D63Kt92eamKfO/yNyCD7foqfyYAiysrQC2Om9yQm6H3aAhob2zcLFBfKzvypqX2UER1B
         yzfg==
X-Forwarded-Encrypted: i=1; AJvYcCXdB9PLs+xUZfnfOL+CWDYyLjgfY6CSxVFx9HbmQcszB5Tl/diYEo5q819y98UURXY09SuzWzBJaRN0JuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Yadwp9jNYgU6ugHoDjldKBWm7urvQ5/XgG34+nJ/WiP9KcLj
	STql8pzXSLCTK+AKtZtcLuLhptagBLbn2cS3g023tqmnVmsFuzcz5cuYiKW0wt0=
X-Google-Smtp-Source: AGHT+IG2QzkqWQJ6aa5SACwUNhrBcwJqwMcmd6FgF+mUSPNCiyiBOS8ZrrP8asqO/lz2F3toxq/lxg==
X-Received: by 2002:a17:902:db0d:b0:20b:8642:9863 with SMTP id d9443c01a7336-20bfdfc268dmr105234565ad.18.1728158764343;
        Sat, 05 Oct 2024 13:06:04 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 03/21] include/exec/memop: Move get_alignment_bits from tcg.h
Date: Sat,  5 Oct 2024 13:05:42 -0700
Message-ID: <20241005200600.493604-4-richard.henderson@linaro.org>
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

This function is specific to MemOp, not TCG in general.

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



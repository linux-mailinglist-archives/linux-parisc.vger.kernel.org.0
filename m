Return-Path: <linux-parisc+bounces-2484-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D7991A73
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EAD7B22817
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EF9158DCC;
	Sat,  5 Oct 2024 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zgQyQK7L"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA641552E0
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158767; cv=none; b=Jfg45J5q97JBuoGcAU1mqbF36RjDTrmm6iSKrWvZE1EFVKLOnmehoSDmOwoBUpLo5+KrRbRhVL8pUonHkjRCZXBMGTP5QhCbo8q+WgiRjSld6lstfo58jGMQZDhlR6YTScQ521qMMiB0xzm3S/S7bkiGODbXwUIzR3O7t8uOcds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158767; c=relaxed/simple;
	bh=cBxszF6IGuIGwt5QkpXfxb3/BnjVVGgXMOWgr8qhrQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BA/gasT7lbNqjcxxQDSHpoe5zgq/4lorKBKJCl7BJpY2E2TIwm77UflyyqutiSDFSBUON+E2Up+xmlk8py0GGVtxS13W0frX/XemjkzYYZuOXbLG22LbLXikvrBV/zxSopA/+kiiB33JXxXRbJMATW/xtbtiq+FaHUPyfiWHiBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zgQyQK7L; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20ba733b904so31802915ad.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158765; x=1728763565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DH35lHXcbsJC32qCjyMaGZFqdyczAIeo1misqQjkoMQ=;
        b=zgQyQK7L3jRyEZOOGNGER6QqajEH+vKgdoscC6orZmnRt9CjCzWu/7IR7uZT+ZqDp/
         uEsMEIhmm0ndneIIPWHlFJpg+BENoCvEYrEYRNsCDBHnlUQ8V0kVieqbNU0r7K6e3tw7
         Q2IyZDQpFirfue7/DKWNz+Rgbdm5I0naHBgPm+s93qCnNH3gRrfLCVHACT7zzJHvxxCQ
         2dGKfYB7YQ/yQLCaALoFYKf5qrIhITuEGUzzJyrSlRpfuNIATsDJKfvMtoayA3X1z8Hx
         3A4LQaYT29NZo5XWLlh1KgIeJvazLseHRAPl9xxXIgl0eRzENxe6jqIkr/cZ9ZbB4i7e
         0zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158765; x=1728763565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH35lHXcbsJC32qCjyMaGZFqdyczAIeo1misqQjkoMQ=;
        b=SqdAeLVTUj6ikU4b+XdjDZxlX3u78DcPSAtRqcU4JNCaOyYwn66QVFVBouYW7zA68a
         GJxQYbkfcwP+z2/Y5ua4Hl72Z5e3ytIhBnFAG2xPaTSjl9Ektp0DWld3iXvS4wb43Y4T
         6ysDL7rbipJ0kVZU4wrkDZEUf04ziEIQApZRzLANhSp5Bf30D51J3xADCABWSMPu8uuM
         aml40gFTJuNlxJb8+NLXyigXHw0sv38t4KnwsXmVwMP8/YKE27ZdV93cpinY3YSCAhyE
         u7DGxMcHYYWOGLIKOILOm7gCuUO6xfZsIKQoDuKixs8EV/i0NlmZKUKyoB9jssAK35SA
         D9XA==
X-Forwarded-Encrypted: i=1; AJvYcCVCYY/+Em+nVNJw0FHru87Sgclf1mfiLz++L8c2kQRsios+Ef7O+0LWR2y9Hg3qi4qYI4euoyQQBowczwM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97jn07nyLaO/FKfgOnQISBUECMan9/5be/yuOMHWUAyQpbdvZ
	y1M3bkgz3fp3ovNyWDstw6pPfTUxtZ5Zg0DS5jkYGMBBzgCn4+BQJUwTrbkRMeI=
X-Google-Smtp-Source: AGHT+IHIb0nvq4eNPHU0RqWZQLaosTrrxJaEwg0X9iadpDKgGULb2krdXNgtY4yg4RXKinwxw3yncg==
X-Received: by 2002:a17:903:40ce:b0:20b:a8d9:2a02 with SMTP id d9443c01a7336-20bfe072971mr98365935ad.36.1728158765269;
        Sat, 05 Oct 2024 13:06:05 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 04/21] include/exec/memop: Rename get_alignment_bits
Date: Sat,  5 Oct 2024 13:05:43 -0700
Message-ID: <20241005200600.493604-5-richard.henderson@linaro.org>
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

Rename to use "memop_" prefix, like other functions
that operate on MemOp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h           | 4 ++--
 accel/tcg/cputlb.c             | 4 ++--
 accel/tcg/user-exec.c          | 4 ++--
 target/arm/tcg/translate-a64.c | 4 ++--
 target/xtensa/translate.c      | 2 +-
 tcg/tcg-op-ldst.c              | 6 +++---
 tcg/tcg.c                      | 2 +-
 tcg/arm/tcg-target.c.inc       | 4 ++--
 tcg/sparc64/tcg-target.c.inc   | 2 +-
 9 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 97720a8ee7..f53bf618c6 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -171,12 +171,12 @@ static inline bool memop_big_endian(MemOp op)
 }
 
 /**
- * get_alignment_bits
+ * memop_alignment_bits:
  * @memop: MemOp value
  *
  * Extract the alignment size from the memop.
  */
-static inline unsigned get_alignment_bits(MemOp memop)
+static inline unsigned memop_alignment_bits(MemOp memop)
 {
     unsigned a = memop & MO_AMASK;
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 58960969f4..b5bff220a3 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1693,7 +1693,7 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     tcg_debug_assert(l->mmu_idx < NB_MMU_MODES);
 
     /* Handle CPU specific unaligned behaviour */
-    a_bits = get_alignment_bits(l->memop);
+    a_bits = memop_alignment_bits(l->memop);
     if (addr & ((1 << a_bits) - 1)) {
         cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
     }
@@ -1781,7 +1781,7 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
 {
     uintptr_t mmu_idx = get_mmuidx(oi);
     MemOp mop = get_memop(oi);
-    int a_bits = get_alignment_bits(mop);
+    int a_bits = memop_alignment_bits(mop);
     uintptr_t index;
     CPUTLBEntry *tlbe;
     vaddr tlb_addr;
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 7ddc47b0ba..08a6df9987 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -959,7 +959,7 @@ void page_reset_target_data(target_ulong start, target_ulong last) { }
 static void *cpu_mmu_lookup(CPUState *cpu, vaddr addr,
                             MemOp mop, uintptr_t ra, MMUAccessType type)
 {
-    int a_bits = get_alignment_bits(mop);
+    int a_bits = memop_alignment_bits(mop);
     void *ret;
 
     /* Enforce guest required alignment.  */
@@ -1241,7 +1241,7 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
                                int size, uintptr_t retaddr)
 {
     MemOp mop = get_memop(oi);
-    int a_bits = get_alignment_bits(mop);
+    int a_bits = memop_alignment_bits(mop);
     void *ret;
 
     /* Enforce guest required alignment.  */
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 071b6349fc..ec0b1ee252 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -294,7 +294,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ALIGN, get_alignment_bits(memop));
+        desc = FIELD_DP32(desc, MTEDESC, ALIGN, memop_alignment_bits(memop));
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, memop_size(memop) - 1);
 
         ret = tcg_temp_new_i64();
@@ -326,7 +326,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ALIGN, get_alignment_bits(single_mop));
+        desc = FIELD_DP32(desc, MTEDESC, ALIGN, memop_alignment_bits(single_mop));
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
 
         ret = tcg_temp_new_i64();
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 75b7bfda4c..f4da4a40f9 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -521,7 +521,7 @@ static MemOp gen_load_store_alignment(DisasContext *dc, MemOp mop,
         mop |= MO_ALIGN;
     }
     if (!option_enabled(dc, XTENSA_OPTION_UNALIGNED_EXCEPTION)) {
-        tcg_gen_andi_i32(addr, addr, ~0 << get_alignment_bits(mop));
+        tcg_gen_andi_i32(addr, addr, ~0 << memop_alignment_bits(mop));
     }
     return mop;
 }
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index 23dc807f11..a318011229 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -45,7 +45,7 @@ static void check_max_alignment(unsigned a_bits)
 
 static MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
 {
-    unsigned a_bits = get_alignment_bits(op);
+    unsigned a_bits = memop_alignment_bits(op);
 
     check_max_alignment(a_bits);
 
@@ -559,7 +559,7 @@ static void tcg_gen_qemu_ld_i128_int(TCGv_i128 val, TCGTemp *addr,
     TCGv_i64 ext_addr = NULL;
     TCGOpcode opc;
 
-    check_max_alignment(get_alignment_bits(memop));
+    check_max_alignment(memop_alignment_bits(memop));
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
 
     /* In serial mode, reduce atomicity. */
@@ -676,7 +676,7 @@ static void tcg_gen_qemu_st_i128_int(TCGv_i128 val, TCGTemp *addr,
     TCGv_i64 ext_addr = NULL;
     TCGOpcode opc;
 
-    check_max_alignment(get_alignment_bits(memop));
+    check_max_alignment(memop_alignment_bits(memop));
     tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
 
     /* In serial mode, reduce atomicity. */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 34e3056380..5decd83cf4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -5506,7 +5506,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 static TCGAtomAlign atom_and_align_for_opc(TCGContext *s, MemOp opc,
                                            MemOp host_atom, bool allow_two_ops)
 {
-    MemOp align = get_alignment_bits(opc);
+    MemOp align = memop_alignment_bits(opc);
     MemOp size = opc & MO_SIZE;
     MemOp half = size ? size - 1 : 0;
     MemOp atom = opc & MO_ATOM_MASK;
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 3de5f50b62..56072d89a2 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1587,7 +1587,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_debug_assert((datalo & 1) == 0);
         tcg_debug_assert(datahi == datalo + 1);
         /* LDRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64) {
+        if (memop_alignment_bits(opc) >= MO_64) {
             if (h.index < 0) {
                 tcg_out_ldrd_8(s, h.cond, datalo, h.base, 0);
                 break;
@@ -1691,7 +1691,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_debug_assert((datalo & 1) == 0);
         tcg_debug_assert(datahi == datalo + 1);
         /* STRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64) {
+        if (memop_alignment_bits(opc) >= MO_64) {
             if (h.index < 0) {
                 tcg_out_strd_8(s, h.cond, datalo, h.base, 0);
             } else {
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 176c98740b..32f9ec24b5 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1133,7 +1133,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * Otherwise, test for at least natural alignment and defer
      * everything else to the helper functions.
      */
-    if (s_bits != get_alignment_bits(opc)) {
+    if (s_bits != memop_alignment_bits(opc)) {
         tcg_debug_assert(check_fit_tl(a_mask, 13));
         tcg_out_arithi(s, TCG_REG_G0, addr_reg, a_mask, ARITH_ANDCC);
 
-- 
2.43.0



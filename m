Return-Path: <linux-parisc+bounces-2596-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F21995BF6
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 402861F23472
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FDB36D;
	Wed,  9 Oct 2024 00:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KabXe3J8"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4527383
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432300; cv=none; b=GC99X8u0wIr7+5PlGylPkpDaRTpJO5v310cYILzAUJlIo4hiJ5/g09SCluNgUXJd3pJAtwM67IKT8qUNBqEsMgdfmak2hAKRALa2a+tjKvFcjwLablwMoNt+95I4L7CFA1QfgIXErjHSD5JHWS8oMe1212QgSp9cQf6FwITl66M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432300; c=relaxed/simple;
	bh=w/QOzsKw7a4vNlXl6cbX1MjiXaOrHXwj8J7K5e02kq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMfg6UCNayN7Xpml9RMjOO+Yw6SxmF5oDWA1g1EElBc9A6ZS17YIntSlKLd/Q7a8/zB118g6AKpmwhy3+vqA0MyYKyfO31uWqoakjh6A15WQ2dQXAmnIIOnOim2l8MNp5jA1j3W33YmsR1ai1QUEWWuvhrOKkX8/CH2vea8HHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KabXe3J8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20b84bfbdfcso2394235ad.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432298; x=1729037098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LebsJbt4uExwr4Anb+4jbY7Oq0PbwNNghgu5qGnqlk=;
        b=KabXe3J8jK6d3XANEiZGDqsRizUgucfqvPTS4gchIluTNRF64RZpm/CFfuXspbC0WA
         n1SJ1vWni+TzaEmmYMzxI9iAy1v8EiCCe2dcniAMUQRVAclYgftmnyVgDNBcrB7Yyy4U
         qISsQAS38VdUncWhPMYz2WhLsxFQ3986i1jUUfvCvPp8IPiesgkCNyMhpEFki2fTlVA3
         ydmCdwTrZDJwGJPo8q6p+02N/L2Aa5Mh0sjakbeX/7onL4EcgaT7+ltJnEecmQApj1E+
         PYaL2rRwuJ+3INGTfhJWDzYEJJB60z0AAUQrMJIDd291IK3U4TIjKojz3yV2k51lLCP5
         iYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432298; x=1729037098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LebsJbt4uExwr4Anb+4jbY7Oq0PbwNNghgu5qGnqlk=;
        b=XB/oMO+fQBkHRzwEYjvm5E4HR1cEHr9/RiuopnUIpx27fkGkuzCNLtidDMnh/sm0AD
         oniqHlOPgwcEaZ0+ifEimmzBpKBfFpkpASjsTqsB+Gqz2DBaLSbJEZI1rcg28+UOyO75
         xph0NiwnpvQlcWv0Zs9LhiIyynXn2aPDJnF/Jagiotnvoy0wYYiP7iyDi3tkwljWTu6M
         FrDaDXy5LrI4zn3Wf93U4Y6Vr26l4Bh5RwdeJvmgl3R0d8szl+rrkVhmZcoavtTCGt53
         eNIFTbnfyv+nVl9z5gY8Sk5sH2c1NMGE+u8uP2LakCstzQ6p7Ibo63WOIHLuDWbndA/t
         ohaw==
X-Forwarded-Encrypted: i=1; AJvYcCWFlOfRsXdrFkxeKI8uSXpB7e2TwvDw+arXWqfGsJYH2MPNG6Kf0E3X7XR3k0bQj1/5GsKHd6Qr4p5PkeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsHB7v5Iw/hX/dLktKZEzajGgjpo64lKDDPKNjbejUsMeV7KHJ
	jAb3ydqYyLky8x7INPqwXQHzO5/NXaDCUNe5HBkCmup2xM4ZdhWMSzmZCbl2qQQ=
X-Google-Smtp-Source: AGHT+IFrjf/KG6jW0dXe87Xq6SyttisiiLp3ocVOdfABD+rqesa5TS+vrbt3d454eeR29R+9AWd9wA==
X-Received: by 2002:a17:903:41cc:b0:206:b5b8:25dd with SMTP id d9443c01a7336-20c6352cdd6mr12193455ad.23.1728432298141;
        Tue, 08 Oct 2024 17:04:58 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 03/20] include/exec/memop: Rename get_alignment_bits
Date: Tue,  8 Oct 2024 17:04:36 -0700
Message-ID: <20241009000453.315652-4-richard.henderson@linaro.org>
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

Rename to use "memop_" prefix, like other functions
that operate on MemOp.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index fd6459b695..a975fe5f89 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1709,7 +1709,7 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     tcg_debug_assert(l->mmu_idx < NB_MMU_MODES);
 
     /* Handle CPU specific unaligned behaviour */
-    a_bits = get_alignment_bits(l->memop);
+    a_bits = memop_alignment_bits(l->memop);
     if (addr & ((1 << a_bits) - 1)) {
         cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
     }
@@ -1797,7 +1797,7 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
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



Return-Path: <linux-parisc+bounces-2605-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3F6995BFE
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEEE91C21CC0
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663F6163;
	Wed,  9 Oct 2024 00:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUVN2drM"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28C0383
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432309; cv=none; b=Bdjf3oaCwADnK09ExguQ0P41ToFmJbA8tLcQ/2fH3Sz2mp4buXpYP1FnOnWf8c1fmZM5WWfLIR0rR0o86uRXdiULNiO1is0EFGUF5VGlguDgWLN5ghzdx/fARXmCIVgkht0S085heUrI7YOwDIe+1r1BrDuzuHq+XUkVfV2eQ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432309; c=relaxed/simple;
	bh=FzDI4v0VT9EkG9GKZr83dPch/xwgRQbjlipFQebC3gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ja6MDSwkElkSDlBdealysEmvmJ2DaPAZpBfy9Ho3heje7+fkOyoaM3sUKehNbEiTJzBUNethBEjs8a17yb1fMGN7zy/BqmeX5ACewlOsIBTSG9cdZ/H7yTbJkDSJmjVkGJA/mexcs2GBbInsfQpB9BMg8NP3UoRJxrW76eNuN6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SUVN2drM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b95359440so53727325ad.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432307; x=1729037107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUID/VOY3Ga2ZN/DeZx4JrZs9/xknXUyzF7dZ/9YQNo=;
        b=SUVN2drM7+g7mATbOOr7JozFbyVQXC4lBf4m1g8eykebsSXA9g2Fj70+HzNTc2f3zB
         /3cRXwcnaOxrE4ui2gfT9Rf6FPsyNIHPjdy0OsdDX0eTnG4oDhq4yISJKinfYIGQWIuv
         KalJNb9N/O6XWBFpg+yNl0g2s6eMFDBQQ0OoRUzjljK3WQm/R2o4VzpJffhZ1DAa09Ut
         fp3sIH0HNvectIEthMwh2cBNd3JGK5UruqPyhAUI7O4JqvQD03Q/yrc1bQJW7bIllTFR
         unn+agWWTVLjR6zDZZxlMwvbducPBQq9ZfLKWUVrkSkfUVXps1AMxrIZtAwCBR8y7MBF
         uVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432307; x=1729037107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUID/VOY3Ga2ZN/DeZx4JrZs9/xknXUyzF7dZ/9YQNo=;
        b=Kmb36/+QDtqGooLsToCaR6YyaWkAkYWxxowl9qw/o8RPQKX+CRmWklccgZzV5OjmC9
         5VQxtYCP65RaTX71jBD17SAIkY6nUyzeijuQduhH85NSOk0NjLNa6xs6zAzdzA23p5yx
         hOU9XYPOhgIiIAsmrFeCQqaZ0yLaM7ZarJgvnH0Z4ACUb/oaUKDS6vchT+QKMMAO+jLz
         XUNby+C8674M8+X/a+7+f232fF9lt98LQOc3nFvaV4sxVJ7iAfeEcoqXGUa8xWim/Y9q
         PXuFP3uV5YF0SBDHu7GBB0KsHbSV1hzLpTYVObM5H7HljH1gUSZXi2DdYOv9b1Aiv/Cm
         cNUA==
X-Forwarded-Encrypted: i=1; AJvYcCUT5IvylqytyNeo/JQo1hTj18nwllcIJ+exsWeMHQzMdAxvjbemKeCnb8uQ6Y3MlJiWIuwqafBOMSus8o4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwICBYYwk4a/gR2yNQRDLXVWqJ6bCZjsPbTQmVGoCMcdNvFrUci
	HB6wi0Iqp606eWsI+wDNM3MzZwHAtSSllBoVTzJ8/AL3JTbjhhhCstnMNgX3Mic=
X-Google-Smtp-Source: AGHT+IEOzR02cuGQIAfO5rhioXqq6+S1yUdY62tdcjtmeVq0WQ3OZwwN00IC+X3KAkSW8TC6DwnsKg==
X-Received: by 2002:a17:902:e88f:b0:207:2093:99bb with SMTP id d9443c01a7336-20c63743a92mr10917825ad.31.1728432307098;
        Tue, 08 Oct 2024 17:05:07 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/20] target/arm: Pass MemOp to get_phys_addr
Date: Tue,  8 Oct 2024 17:04:45 -0700
Message-ID: <20241009000453.315652-13-richard.henderson@linaro.org>
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

Zero is the safe do-nothing value for callers to use.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      | 3 ++-
 target/arm/ptw.c            | 2 +-
 target/arm/tcg/m_helper.c   | 8 ++++----
 target/arm/tcg/tlb_helper.c | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1e5da81ce9..2b16579fa5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1432,6 +1432,7 @@ typedef struct GetPhysAddrResult {
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
+ * @memop: memory operation feeding this access, or 0 for none
  * @mmu_idx: MMU index indicating required translation regime
  * @result: set on translation success.
  * @fi: set to fault info if the translation fails
@@ -1450,7 +1451,7 @@ typedef struct GetPhysAddrResult {
  *    value.
  */
 bool get_phys_addr(CPUARMState *env, vaddr address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   MMUAccessType access_type, MemOp memop, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 659855133c..373095a339 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3572,7 +3572,7 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
 }
 
 bool get_phys_addr(CPUARMState *env, vaddr address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   MMUAccessType access_type, MemOp memop, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     S1Translate ptw = {
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 23d7f73035..f7354f3c6e 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -222,7 +222,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
     int exc;
     bool exc_secure;
 
-    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, MMU_DATA_STORE, 0, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             if (mode == STACK_LAZYFP) {
@@ -311,7 +311,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
     bool exc_secure;
     uint32_t value;
 
-    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             qemu_log_mask(CPU_LOG_INT,
@@ -2009,7 +2009,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
                       "...really SecureFault with SFSR.INVEP\n");
         return false;
     }
-    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, MMU_INST_FETCH, 0, mmu_idx, &res, &fi)) {
         /* the MPU lookup failed */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
@@ -2045,7 +2045,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     ARMMMUFaultInfo fi = {};
     uint32_t value;
 
-    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             qemu_log_mask(CPU_LOG_INT,
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 885bf4ec14..1d8b7bcaa2 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -344,7 +344,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
      * register format, and signal the fault.
      */
-    ret = get_phys_addr(&cpu->env, address, access_type,
+    ret = get_phys_addr(&cpu->env, address, access_type, 0,
                         core_to_arm_mmu_idx(&cpu->env, mmu_idx),
                         &res, fi);
     if (likely(!ret)) {
-- 
2.43.0



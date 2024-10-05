Return-Path: <linux-parisc+bounces-2469-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F29917BB
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 256B11C213E4
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928C91EB36;
	Sat,  5 Oct 2024 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MtY69yoo"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0881D1C6A3
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141967; cv=none; b=IrJfBQCZK3O5PRbwAn8LApR6SGz+N4/5ok8YRPcTNY1YUye2t4UEzNZog5TAryaNj0nqnhFf4vU0G9qYYmWynMruPm661FrFfvYLoEEXmKuDlVnym4WlKd6s63KBoNrlNlXlc47rsxQcfCFfCHTz50oGai1vnMPF0xn4ivwrRG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141967; c=relaxed/simple;
	bh=vDk3HNbU7V0mlRGB4QGw0XzPVHWLM0iY2xxG+t37CEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IcYo8huCaHwhrflK88za1K/5v5IVL83FcT4W8GcbghUrpDtxa/i/jIJSU+GKSZbs/XegZAtUQBbxomHzhAcfjffeP6n185VaOVuV9A6KamvdCacI4ZeSYvhu59kRAGXg2GJNwbn1YnmTcScTRmawSnI+x4sznntqDUTxuWklJm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MtY69yoo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20ba9f3824fso24155385ad.0
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141965; x=1728746765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1uh5v8Er5HwrssIP/tcmhd1DyyVCAW+cpRhBaU0frQ=;
        b=MtY69yoo5RGU1NOISFmMqpPDiZH08qggUzR0H9YBrkiXIlEbXwHgmcfT6Z3IiyU24A
         kA7/uqqI8GLWuaYrw8g95Hkdd8vavHpYleO5cXM7UwyIxO6AXQ08MoAQe/UvlyHV6mdN
         NfjH3qbEJkW3Jc+kgq91J13vyS/XpaM3Hmado+UM/gcsKDP2HUQpoU7cPbMuC17w4OrS
         6Aj/K0E2OHXGquWKSm7dhdGFhCa7Sq/Fxt3dzEs7QyuYv35WSlclMLnq7eJOGowb02Lj
         inBiMJsxpVy3wyotZQLs1dOvdPYadR61sIXlFvLQYB4WveWCNW5EjZlSsMbSJWgFnFXd
         94MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141965; x=1728746765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1uh5v8Er5HwrssIP/tcmhd1DyyVCAW+cpRhBaU0frQ=;
        b=Y4DFN1ozlowYfom6QmkGcLXUXF+Q29gEE5yLagu5qtaIB8BotjbwhLceKe6NiuGpzl
         P6ygJKj8UZCsl5qaqcbx9R+d+mOsjm2Kj/6bXECpKkw8Y5J9ze6HXp5A24Uyw9AukiyT
         XK5NoDcPGv1n/DHGzx5ElwtBaZgUFBhWBlh3W/WQjHKaUsg/IFftSXznXpnz1+rD/0nz
         yoi3rxvTGqAwmhG1GNZATdpR0HtEANXHjfrFaXGZLC0GGvJizifEGIQl1tovZamWBlWR
         qY6p2d+kR3AHVWmX/i8Cjylie2zQTnffEMs0OpdYY2hft3Ys3y5rUjone+WVxQ8W9zLz
         a2iA==
X-Forwarded-Encrypted: i=1; AJvYcCWK3eX3ytStt7GhD3I1+f3todQn2zdpH8lz9xRpaX/s0pBd0IFlU963Vsvfk2VLdmXrXGewlrzvnY43khU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUEZTZXOWD1EHMOXeLZX5GK5Q80/OBO3uSjFSHPLocJ8zhhDKz
	Shj5wtCAKVPXbAI5uV04dD+yRSWMH6a7VofcJChtk6KbfAMi1yTQi78/8dt1tOQ=
X-Google-Smtp-Source: AGHT+IHcBazs1KoKTrZ3DdroHH04DM/SKr28uFu00SI0srezv50JszdEiHHXeKd4Hjq+Y6+ipXC1jw==
X-Received: by 2002:a17:903:2307:b0:20b:9088:6545 with SMTP id d9443c01a7336-20bfe95dbcfmr96932395ad.46.1728141965422;
        Sat, 05 Oct 2024 08:26:05 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 13/20] target/arm: Pass MemOp to get_phys_addr
Date: Sat,  5 Oct 2024 08:25:44 -0700
Message-ID: <20241005152551.307923-14-richard.henderson@linaro.org>
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

Zero is the safe do-nothing value for callers to use.

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



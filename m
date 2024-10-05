Return-Path: <linux-parisc+bounces-2493-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B51EE991A77
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42F281F221EE
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E685A1552E0;
	Sat,  5 Oct 2024 20:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IGDzbVIP"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D311153838
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158775; cv=none; b=I7rk2nR+Sxm9fm5tnM7FbuT4ldtMkEB5wqayMHKIH2YUWP2/lnBhCw+ofvpHis3MWvq/eIJzKu1CBSucEQUcDd4yNm6at6oHciuLGyCYoalwUibsf/u8In4xxXdMM9/s1ULnE+CGPhL9vfZz9rFlChr2JFaAKjKTAI3kzD+FbTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158775; c=relaxed/simple;
	bh=vDk3HNbU7V0mlRGB4QGw0XzPVHWLM0iY2xxG+t37CEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjHErk6fuoqN0rlBmdyd3vgR75JVQCx7k+MCDYuXotdsG6P5/4qicJv6foeWrSBpiotsVVL5ptfhQ2Hi7sWoNYLp6seRjLHHu+/SWTSvarNs5vWTwlYz+UQHxmXNganMzpd0DldH/AiU7U5Vw2lBcdGKborX7x4CP0hJG+eInmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IGDzbVIP; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20b833f9b35so27622505ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158774; x=1728763574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1uh5v8Er5HwrssIP/tcmhd1DyyVCAW+cpRhBaU0frQ=;
        b=IGDzbVIPKxE9xHB1soNQGlAVh6hQ5azcHeNtOA86Ppds2dxwppUNN0+t2QYAW3WLR8
         OwovWv84Qx607ILqNHcv1YPNwIz8btTo1HWG7LTTm9jBlb4h0nuNmtdFCPolh6LoeBhw
         +rWa0q4SgHIVQaUZYCtr50XOcsx0gsiqsdFZrmzl2dK0woSHADVisr067BmltS7sQcwS
         hcqZelmklEfcuo7bDrmZj6nMXFjn64jhdX9/6ohuuZkQNdAzcThyUWMd5cWGnoWj1hQY
         fjGzhJ9rWCoR2JfsTvtw6WXdm0Rv2pfaxEVKwSdPfaErPBu4vhG+r4CkZ+L3lOMuGQ9W
         k57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158774; x=1728763574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1uh5v8Er5HwrssIP/tcmhd1DyyVCAW+cpRhBaU0frQ=;
        b=EiiF4OQ7EaAR+g/kFZ7J4DsidHhjN64TZYyoq4PYeaInlLl6zQfZ8G5nEEEAE8N02z
         K/61nGolPNhpL2ZOY0l6odOSk10UQzV8VRzmZgc/T/heUhqbZtjZEObFvZQoNFTYhilw
         h98+i7oPV2kp6TlDC9h2w6qFm8YQm8OJdOMmpf6wR4E2OhBmhPnYA23ZUsQXfjxzqLPn
         EJDIP9qVA3+ZBX9GDOSHwpa8JJbjcQuFI0gf+ZhDsHeswThlg7eI/DJSbsZWJ4LCmKYX
         VMD9IUYBHQ2uFGbB/mhh0b5sFu1UsiJst2B2Vj29ewkj+nvV6lc3Mgp43EJfxyfIr8LL
         B25Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoZmETqBlWWH7AzQ8teL/feBUpK5o2W7BudWalRPK8mLoekT3wmNSAbzEArJHieItmLxitTylN2YL7Y+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSEROAyVijvFMU1pO2RmSHA1a98CHevMzs0bdaE2kBATpkzoN/
	USNpabIWBeI/Zk0sFJ7g/+Lz4eNWY80A0OfZT3OpBHuEAlkCDwVe4oC0yyHczOc=
X-Google-Smtp-Source: AGHT+IFuIEZa4i6J0XzDsWHUBnGbrBzjQrdOCbbZFKtwtRYvhgzw6qHzcnt8mJfy/cgTXRoh5crEPg==
X-Received: by 2002:a17:902:d4c6:b0:20b:b48d:68e with SMTP id d9443c01a7336-20bfde57cf8mr99495885ad.7.1728158773783;
        Sat, 05 Oct 2024 13:06:13 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 13/21] target/arm: Pass MemOp to get_phys_addr
Date: Sat,  5 Oct 2024 13:05:52 -0700
Message-ID: <20241005200600.493604-14-richard.henderson@linaro.org>
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



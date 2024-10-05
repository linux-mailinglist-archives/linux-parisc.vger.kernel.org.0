Return-Path: <linux-parisc+bounces-2486-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E80991A74
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2017FB22695
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DEA159568;
	Sat,  5 Oct 2024 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8fsQg+k"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78581552E0
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158769; cv=none; b=CNAbYsFz7PxaFNcBizPjcZLeMagw6F4L17kvGTcUI2DiV555q0PcqpreVaFPdMXMWdYIwZqMNidsJ5ft2Ab8eOx/0WR8m3/a/YGOMwu7s2HFF1d3kKG5+803sKY56+wroXNykPili72CFckLd+9uAYuKSIcjIFmy/PDaRUwnuZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158769; c=relaxed/simple;
	bh=QT4L20i/uvGnpQx/+7mQvzKz0ZX1VGWN5uFF3Erquvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCwfbBfVB1R3TO4ktIjZ++wB1ZpmpHOswO1ekb2u5hgU8Z67sVuq5vqzP6pbO7a1zfpdgz671b575cMMNa9SIX5wXLly6LvHdWgzCdE2oNG0NTHTozMCISu6lE3q38MVocmq6Gr8VESFNxCB0uQeWLAAvsIyi55/f/+6HBKqhSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8fsQg+k; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b5affde14so25024445ad.3
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158767; x=1728763567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1f/qgYd1hp1mLwoixEUX+NfB0hBePURRnKwRiQEkN3A=;
        b=f8fsQg+k7JnjGLkJ+j5frdbBKIY+xRCeSrRMFX1dVuHXxmRnSbGzScuLIyG3MqLDhe
         NTeN1+c33iIIE3lOQUppPMknkDUuigstozwL9PObWfk2wS+e1ON0MVfiao4AR31tYG/P
         mczej+nS1y9e0okHKXxHkglT0+2gXaGIJCnoS9T9tmlqCDZ7pTlO+3wD8146tmZ3uqyZ
         dBOYpPNC3vYZnkzVouuN/HnJbjjiuoygIorItSdm+vpcOt3zqJbE55BwVqP8XWwmW9m8
         /Y0LcypSEhojFp7+nrOSNway8ZMqvm7UHRBlYw+k66Z8WYb65DQAyLZPcJ/M3znj8frT
         Cn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158767; x=1728763567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1f/qgYd1hp1mLwoixEUX+NfB0hBePURRnKwRiQEkN3A=;
        b=qTdQObFj3PZWTdQ8YGutHz3a1SWF+vE+5Wz0YOCEoYMwL3TEqCJ5qfjCML6M7hc99D
         SvxtMftKxIo1eSOuf1bbl1g4behowTJAcq7pyznABNC0094K569hqIh67IwN9xf7RtwA
         FCywiQqr+M2K1E2d4t/if64YTbKqj51Wf/ozsYU+rk1+SpJ92L0XnIGK+TctS31pbm08
         BHmVGx5+5qb3IIznADDktv7W14bliVNX4n1+QzcIjruaLUSk9azzMmvR2KL1oUEhJzGZ
         ZJY18L3KEhZbBoZvtN7pCPTkwnBEac6Lq1VxmA5lHbPO+gST52UWb10QuZDsHYXpqJtj
         i73w==
X-Forwarded-Encrypted: i=1; AJvYcCWdTMb+7U+54jaHJz7p7wFI+BQbLFSKV3JG8D5N12u8W/S8THZha99Igoe1jGK4p78aOOKjr19hwgVvEw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YytRZkbIg4I0kOfHKjTGfjn6Sr/5OlfUFGtu1oUZy/w9SB+h1Tt
	zOVS+03R+Tb7w3ED8XpbeQd0UtVIiHhiQbWiBVMAi0ktaof8dGsC2mK26XxczP7nw/lgx2jJEYY
	3
X-Google-Smtp-Source: AGHT+IFzmszmyv7EFaMoyI1QCdaJl5nSZJZ1pqGh26krRNpf2aOXvO2XCeE4nHbEYZOTpe8UJGf/ng==
X-Received: by 2002:a17:902:ecc8:b0:20b:7784:27a2 with SMTP id d9443c01a7336-20bfe07c8aemr114472495ad.27.1728158767224;
        Sat, 05 Oct 2024 13:06:07 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 06/21] hw/core/tcg-cpu-ops: Introduce tlb_fill_align hook
Date: Sat,  5 Oct 2024 13:05:45 -0700
Message-ID: <20241005200600.493604-7-richard.henderson@linaro.org>
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

Add the hook to struct TCGCPUOps.  Add a default implementation
that recognizes alignment faults before page faults.  Populate
all TCGCPUOps structures with the default implementation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 25 +++++++++++++++++++++++++
 accel/tcg/cputlb.c            | 19 +++++++++++++++++++
 target/alpha/cpu.c            |  1 +
 target/arm/cpu.c              |  1 +
 target/arm/tcg/cpu-v7m.c      |  1 +
 target/avr/cpu.c              |  1 +
 target/hppa/cpu.c             |  1 +
 target/i386/tcg/tcg-cpu.c     |  1 +
 target/loongarch/cpu.c        |  1 +
 target/m68k/cpu.c             |  1 +
 target/microblaze/cpu.c       |  1 +
 target/mips/cpu.c             |  1 +
 target/openrisc/cpu.c         |  1 +
 target/ppc/cpu_init.c         |  1 +
 target/riscv/tcg/tcg-cpu.c    |  1 +
 target/rx/cpu.c               |  1 +
 target/s390x/cpu.c            |  1 +
 target/sh4/cpu.c              |  1 +
 target/sparc/cpu.c            |  1 +
 target/tricore/cpu.c          |  1 +
 target/xtensa/cpu.c           |  1 +
 21 files changed, 63 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 34318cf0e6..49420bc93d 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -13,6 +13,7 @@
 #include "exec/breakpoint.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
+#include "exec/memop.h"
 #include "exec/mmu-access-type.h"
 #include "exec/vaddr.h"
 
@@ -131,6 +132,21 @@ struct TCGCPUOps {
      * same function signature.
      */
     bool (*cpu_exec_halt)(CPUState *cpu);
+
+    /**
+     * @tlb_fill_align: Handle a softmmu tlb miss, and alignment fault
+     *
+     * If the access is valid, call tlb_set_page and return true;
+     * if the access is invalid and probe is true, return false;
+     * otherwise raise an exception and do not return.
+     *
+     * The alignment check is deferred to this hook, so that the
+     * target can choose to recognize either before or after the
+     * permission check.
+     */
+    bool (*tlb_fill_align)(CPUState *cpu, vaddr address, MemOp mop, int size,
+                           MMUAccessType access_type, int mmu_idx,
+                           bool probe, uintptr_t retaddr);
     /**
      * @tlb_fill: Handle a softmmu tlb miss
      *
@@ -234,6 +250,15 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
  */
 int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
 
+/*
+ * tlb_fill_align_first:
+ *
+ * Prioritize alignment faults over page faults.
+ */
+bool tlb_fill_align_first(CPUState *cpu, vaddr address, MemOp mop, int size,
+                          MMUAccessType access_type, int mmu_idx,
+                          bool probe, uintptr_t retaddr);
+
 #endif
 
 #endif /* TCG_CPU_OPS_H */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f5fca5a118..4bc34c8a37 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1565,6 +1565,25 @@ bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, int mmu_idx,
 }
 #endif
 
+
+/*
+ * Generic implementation of tlb_fill_align which recognizes
+ * alignment faults before page faults.
+ */
+bool tlb_fill_align_first(CPUState *cpu, vaddr addr, MemOp mop, int size,
+                          MMUAccessType access_type, int mmu_idx,
+                          bool probe, uintptr_t retaddr)
+{
+    unsigned a_bits = memop_alignment_bits(mop);
+
+    if (unlikely(addr & ((1 << a_bits) - 1))) {
+        cpu_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
+    }
+
+    return cpu->cc->tcg_ops->tlb_fill(cpu, addr, size, access_type,
+                                      mmu_idx, probe, retaddr);
+}
+
 /*
  * Probe for a load/store operation.
  * Return the host address and into @flags.
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 9db1dffc03..2eb5afd34a 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -217,6 +217,7 @@ static const TCGCPUOps alpha_tcg_ops = {
     .record_sigsegv = alpha_cpu_record_sigsegv,
     .record_sigbus = alpha_cpu_record_sigbus,
 #else
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = alpha_cpu_tlb_fill,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .cpu_exec_halt = alpha_cpu_has_work,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 19191c2391..08731ed4e0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2663,6 +2663,7 @@ static const TCGCPUOps arm_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index 5496f14dc1..8874fe0e11 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -242,6 +242,7 @@ static const TCGCPUOps arm_v7m_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 3132842d56..6ac4434f1d 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -211,6 +211,7 @@ static const TCGCPUOps avr_tcg_ops = {
     .restore_state_to_opc = avr_restore_state_to_opc,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .cpu_exec_halt = avr_cpu_has_work,
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = avr_cpu_tlb_fill,
     .do_interrupt = avr_cpu_do_interrupt,
 };
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 7cf2e2f266..3b6c325e09 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -226,6 +226,7 @@ static const TCGCPUOps hppa_tcg_ops = {
     .restore_state_to_opc = hppa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = hppa_cpu_tlb_fill,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .cpu_exec_halt = hppa_cpu_has_work,
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index cca19cd40e..83cfb86346 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -117,6 +117,7 @@ static const TCGCPUOps x86_tcg_ops = {
     .record_sigsegv = x86_cpu_record_sigsegv,
     .record_sigbus = x86_cpu_record_sigbus,
 #else
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = x86_cpu_tlb_fill,
     .do_interrupt = x86_cpu_do_interrupt,
     .cpu_exec_halt = x86_cpu_exec_halt,
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 7212fb5f8f..ae8856d988 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -755,6 +755,7 @@ static const TCGCPUOps loongarch_tcg_ops = {
     .restore_state_to_opc = loongarch_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = loongarch_cpu_tlb_fill,
     .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
     .cpu_exec_halt = loongarch_cpu_has_work,
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 1d49f4cb23..295ebd941b 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -534,6 +534,7 @@ static const TCGCPUOps m68k_tcg_ops = {
     .restore_state_to_opc = m68k_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = m68k_cpu_tlb_fill,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .cpu_exec_halt = m68k_cpu_has_work,
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 135947ee80..6e63600631 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -411,6 +411,7 @@ static const TCGCPUOps mb_tcg_ops = {
     .restore_state_to_opc = mb_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = mb_cpu_tlb_fill,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .cpu_exec_halt = mb_cpu_has_work,
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 89655b1900..5a36b22256 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -553,6 +553,7 @@ static const TCGCPUOps mips_tcg_ops = {
     .restore_state_to_opc = mips_restore_state_to_opc,
 
 #if !defined(CONFIG_USER_ONLY)
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = mips_cpu_tlb_fill,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .cpu_exec_halt = mips_cpu_has_work,
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 6ec54ad7a6..9223228758 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -231,6 +231,7 @@ static const TCGCPUOps openrisc_tcg_ops = {
     .restore_state_to_opc = openrisc_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = openrisc_cpu_tlb_fill,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .cpu_exec_halt = openrisc_cpu_has_work,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 23881d09e9..42a38ec155 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7482,6 +7482,7 @@ static const TCGCPUOps ppc_tcg_ops = {
 #ifdef CONFIG_USER_ONLY
   .record_sigsegv = ppc_cpu_record_sigsegv,
 #else
+  .tlb_fill_align = tlb_fill_align_first,
   .tlb_fill = ppc_cpu_tlb_fill,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .cpu_exec_halt = ppc_cpu_has_work,
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index dea8ab7a43..42c4ea13af 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -137,6 +137,7 @@ static const TCGCPUOps riscv_tcg_ops = {
     .restore_state_to_opc = riscv_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = riscv_cpu_tlb_fill,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .cpu_exec_halt = riscv_cpu_has_work,
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 36d2a6f189..27fc372ca4 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -188,6 +188,7 @@ static const TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
     .restore_state_to_opc = rx_restore_state_to_opc,
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 4e41a3dff5..8120ddeb5b 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -363,6 +363,7 @@ static const TCGCPUOps s390_tcg_ops = {
     .record_sigsegv = s390_cpu_record_sigsegv,
     .record_sigbus = s390_cpu_record_sigbus,
 #else
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = s390_cpu_tlb_fill,
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
     .cpu_exec_halt = s390_cpu_has_work,
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 8f07261dcf..b03f6dfad8 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -252,6 +252,7 @@ static const TCGCPUOps superh_tcg_ops = {
     .restore_state_to_opc = superh_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = superh_cpu_tlb_fill,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .cpu_exec_halt = superh_cpu_has_work,
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 54cb269e0a..da1bfad5f0 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -924,6 +924,7 @@ static const TCGCPUOps sparc_tcg_ops = {
     .restore_state_to_opc = sparc_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = sparc_cpu_tlb_fill,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .cpu_exec_halt = sparc_cpu_has_work,
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 1a26171590..9d8f8f13d2 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -173,6 +173,7 @@ static const TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
     .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
     .restore_state_to_opc = tricore_restore_state_to_opc,
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = tricore_cpu_tlb_fill,
     .cpu_exec_interrupt = tricore_cpu_exec_interrupt,
     .cpu_exec_halt = tricore_cpu_has_work,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index a08c7a0b1f..b0f84403f0 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -232,6 +232,7 @@ static const TCGCPUOps xtensa_tcg_ops = {
     .restore_state_to_opc = xtensa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = xtensa_cpu_tlb_fill,
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .cpu_exec_halt = xtensa_cpu_has_work,
-- 
2.43.0



Return-Path: <linux-parisc+bounces-2492-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB0991A7A
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DA34B20A72
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2408130AC8;
	Sat,  5 Oct 2024 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FttJgw4c"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FAF157E6B
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158774; cv=none; b=E3Ig/Ot0fQvwjMX1HLAvE2iB7W1pXeCMqobDFlXjq54LxJ4TnE9gRj61VR4p7ruTW4Q5EFkXayn2w1lx3buInP19zsxhu1JpXWPOcOfpFoHVsa9FmpCTKsxpTsJcPc7MyxYn6JGUwT7KWZ6PmE0Y8fVJVnZOBraDFjZ+dKSxHaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158774; c=relaxed/simple;
	bh=4Y9YWp6EM7aAkdmftt8JKSZpOs1BvVvy02XzjMP1/6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VHRWqhtHk9nDze7M6KYWgz30aOEJM6LZWPaqNGU7ETzWnjXByeB2nXU+6kL9/a8nf0FvvCJaCFCa3B4S6aXDm8U03KAnY+racxMUIx07IfQIso3xIDGx77ceuDDK3oaEzFT210g4ZETTGPJ1csEJvSibEQ1Uf28zCS48BSYOskE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FttJgw4c; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b90ab6c19so35190125ad.0
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158773; x=1728763573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc7m2CC+o/vfg9459Vx/ro/giFzSXc14VGjLvy+03yM=;
        b=FttJgw4cbBS3kgMbEZDa1ulIQBsQ9xPS8yRl/maxbw2mGN1q5b63bqDd6lXWanucDr
         87YhDh8uzjPat+1+Sbu/KpdJDEWj/l97fvq3Y+1UVx5BzVkU2Bs4jwXzHwj69z7LSkYM
         Q3DYRIK6eyf/e5y2u48wLm/1ZCeEVcNs7B6R2AQ/4OVBexY3QQSX3DnuBgwSoI+gN7BU
         Si15821oZVgvCFNLxSvJXax4kUFodqdcYPp32N5IEchhdMzWNeVXcFDpGp0BzlYUPYoT
         SNhqOTMCZ1fFBtRSDX4En0iA0EqHrUYEVhBzMiohpovRrxti6aUbad1aQdRv9LQJneVC
         jplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158773; x=1728763573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rc7m2CC+o/vfg9459Vx/ro/giFzSXc14VGjLvy+03yM=;
        b=i12emN2XXMNlll/TB9OtTwS1oxq/Re8/ZVA2gKD/QmugnzOddqoDMaZARt5FNSuNRg
         7DYLrUftsv1DOIhu4sySenAV4fDsaArmwSobxzP3kmooEPh0oEhoUvS1IfAQcdBQG/a0
         yubovlB8kVxbNWmYkM9tOz29QgYYueFtdEHD13D3oF2CWs/KN7Zbw5HabQO9/FZoffN5
         +K0OxoPQ9et216/clIe+YQtC4hLyMd2rR2S5Nh46uZ0Kluytju+7Qpl3MsEsoYnWpOpN
         6lOCjv9La/HW85jp1N1DVqpqh/Dr0PC16fiGFmCS5TNOUsnjSMtN0QPyCiOwceFd9m52
         cgFw==
X-Forwarded-Encrypted: i=1; AJvYcCVt54NhxksghehNaoOx0qir9OA+ivxQblAZcze0XEg3GATmXrq64Stlmsc7mHcji1R0NY/7i76N6WjQWEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYws2tzk2szovUibYgmlvINVWKuLuOVepoIDe7Ykr4JImxCDS2
	CYCJHcdEcP8BMy7EEQIyZYAJ6jqNzOJ8Rm9nZI4FiTk6AKydmQ256YPvm/gW0Jo=
X-Google-Smtp-Source: AGHT+IGHEK6fjBSmL22oUUwIkylcWSfEnGAMH/PbqEEDgjtyaqNVMTdBmg2DLFABo2GcKikjZC9wnw==
X-Received: by 2002:a17:902:e54f:b0:20b:9698:a234 with SMTP id d9443c01a7336-20bfde65b4dmr91370085ad.8.1728158772729;
        Sat, 05 Oct 2024 13:06:12 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 12/21] target/hppa: Add hppa_cpu_tlb_fill_align
Date: Sat,  5 Oct 2024 13:05:51 -0700
Message-ID: <20241005200600.493604-13-richard.henderson@linaro.org>
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

Fill in the tlb_fill_align hook, so that we can recognize
alignment exceptions in the correct priority order.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h        |  3 +++
 target/hppa/cpu.c        |  2 +-
 target/hppa/mem_helper.c | 16 ++++++++++++----
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 526855f982..c0567ce0ab 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -366,6 +366,9 @@ void hppa_set_ior_and_isr(CPUHPPAState *env, vaddr addr, bool mmu_disabled);
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+bool hppa_cpu_tlb_fill_align(CPUState *cs, vaddr address, MemOp mop, int size,
+                             MMUAccessType access_type, int mmu_idx,
+                             bool probe, uintptr_t retaddr);
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 3b6c325e09..768abc6e5d 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -226,7 +226,7 @@ static const TCGCPUOps hppa_tcg_ops = {
     .restore_state_to_opc = hppa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
-    .tlb_fill_align = tlb_fill_align_first,
+    .tlb_fill_align = hppa_cpu_tlb_fill_align,
     .tlb_fill = hppa_cpu_tlb_fill,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .cpu_exec_halt = hppa_cpu_has_work,
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index d38054da8a..35e9170bf3 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -424,9 +424,9 @@ void hppa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 }
 
-bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
-                       MMUAccessType type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
+bool hppa_cpu_tlb_fill_align(CPUState *cs, vaddr addr, MemOp mop, int size,
+                             MMUAccessType type, int mmu_idx,
+                             bool probe, uintptr_t retaddr)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
@@ -445,7 +445,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
     }
 
-    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, 0,
+    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, mop,
                                      &phys, &prot);
     if (unlikely(excp >= 0)) {
         if (probe) {
@@ -473,6 +473,14 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     return true;
 }
 
+bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+                       MMUAccessType type, int mmu_idx,
+                       bool probe, uintptr_t retaddr)
+{
+    return hppa_cpu_tlb_fill_align(cs, addr, 0, size, type,
+                                   mmu_idx, probe, retaddr);
+}
+
 /* Insert (Insn/Data) TLB Address.  Note this is PA 1.1 only.  */
 void HELPER(itlba_pa11)(CPUHPPAState *env, target_ulong addr, target_ulong reg)
 {
-- 
2.43.0



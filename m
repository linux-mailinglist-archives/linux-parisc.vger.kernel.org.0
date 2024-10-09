Return-Path: <linux-parisc+bounces-2600-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4329995BFD
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AD8AB239EB
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58ED163;
	Wed,  9 Oct 2024 00:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hqo6K/PU"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D14383
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432304; cv=none; b=jYS5B++F+8VgtCCDKLWp+3di6iFICdMzYhVLrPGNTVCiGwz3XKyhvOtp5/SWG4mTclMEIqgJQrllDn1KCtX31VzurEFsSDekQsZ7nsoV77kBezzyV4yFkUry7i9wf3Wg5WyuT9i3c0ccwCvbQBjisAFRrTeca/2/BaITxYzsdKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432304; c=relaxed/simple;
	bh=bQT9W9Nq8weSF+Om9R/l3gveO34JMzwI5GiDSjp/IE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZzcNh3s2vB50LPY2+n9Bq9H5NWVmE+8H+4jQCUDLKyDiBnijmcC1Or7sqt8yOtF9yOPYwc/2czSyBRJaRPmVwVOHoef6layvm/rBCR3rvl/2SqTCByGoho3z1g5DVnJTpE8jzRQ+6jhLpswvjizbn0K0fI1GQuMe8VESQchIHmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hqo6K/PU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20bc506347dso49904735ad.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432302; x=1729037102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMaSkZRoz5YPXdGi4Fagk1yb2WqLYDqE0+TVeXDEoMY=;
        b=hqo6K/PUCjUaE+1IHAsrt2QI5iofUPX12PT/cbC3IfGxtmb9by7QjwvHDUzUoOcYKr
         GDNDpfc2/g7ICPdXqnRHP9R9LxGcaaiVuGQR4RB3C6yNfvi/IOemwag4jjwJu/HU5sCN
         1D1J7VLcRXXOdIxNCmg12ojausL6IpBz12fDpJHkOaD28T67Qa1ihlAHPJeOFYcXKJs+
         x8zogwD79MJ33R69eML7MMFWAtzFnxBJmdvYhjofwjoFXleifFgaDdyBSL8cKYSstuez
         9aQANHZ1DPNHNKTQiZ5AkZAeRPt2inaVEilrbemyP9us96HQnWy8q07VOcAbOtTv/gee
         FJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432302; x=1729037102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMaSkZRoz5YPXdGi4Fagk1yb2WqLYDqE0+TVeXDEoMY=;
        b=uZ3YL1JxK6H+cSxYdwopzHCyVEixox9F6IumNP+Y4/Vtn3dGqpGBO+FEpHOuCfHrFT
         AIV56cKTAJqsAM5F/fNOig6fhVgFNtDWJ3BBB98oVTIQBjlfgzod75TqHRa84PhvusWe
         GeY06m/UZCL7oNMibBXcKn62c6E3HuSaMetvbG+nohi8m+798bl6xe+z1/26cd5uZkqL
         7OlBvBiR+Lkm0FEGbky9zNDlyxRv5PIf23TFJwfYROooNFmJ0DfEtuoVGHY3oi831Vo8
         PKFY+IJ0sHYOgklikGbts2Nvq54rMQAXxCzlUJGRGJzBMfwqALV3cac5hDge+NYxqfx1
         WxJw==
X-Forwarded-Encrypted: i=1; AJvYcCXfqHqQFHVznqqkGRvTTezFh05JkJOSROIKCampIMbpflwb8/jgACfuTSl4bUz0hT34j8O6zt8wN6ZNhHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoE/MoGYNRKEPx2cSTu5JcE5/JUPOy8JX+rQLTBea3B1xdRGbc
	BU6vgM5GAfzp3LdCMX5WHqAKiByIAeUxo+bljdXVfZSeAVax7CaHzr/fLlw0Uds=
X-Google-Smtp-Source: AGHT+IH7ittC4fNcWZZnvUvR2MzaRIxXqIaW0oGTZ44MyvMuTJp+JuwMH0O7T03auchaNuRqnZyQ0w==
X-Received: by 2002:a17:902:f54c:b0:20b:79cb:492f with SMTP id d9443c01a7336-20c63780152mr9718395ad.43.1728432302402;
        Tue, 08 Oct 2024 17:05:02 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 07/20] target/hppa: Add MemOp argument to hppa_get_physical_address
Date: Tue,  8 Oct 2024 17:04:40 -0700
Message-ID: <20241009000453.315652-8-richard.henderson@linaro.org>
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

Just add the argument, unused at this point.
Zero is the safe do-nothing value for all callers.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h        | 2 +-
 target/hppa/int_helper.c | 2 +-
 target/hppa/mem_helper.c | 9 +++++----
 target/hppa/op_helper.c  | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index f4e051f176..526855f982 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -369,7 +369,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
-                              int type, hwaddr *pphys, int *pprot);
+                              int type, MemOp mop, hwaddr *pphys, int *pprot);
 void hppa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 391f32f27d..58695def82 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -167,7 +167,7 @@ void hppa_cpu_do_interrupt(CPUState *cs)
 
                     vaddr = hppa_form_gva_psw(old_psw, env->iasq_f, vaddr);
                     t = hppa_get_physical_address(env, vaddr, MMU_KERNEL_IDX,
-                                                  0, &paddr, &prot);
+                                                  0, 0, &paddr, &prot);
                     if (t >= 0) {
                         /* We can't re-load the instruction.  */
                         env->cr[CR_IIR] = 0;
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index b984f730aa..a386c80fa4 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -197,7 +197,7 @@ static int match_prot_id64(CPUHPPAState *env, uint32_t access_id)
 }
 
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
-                              int type, hwaddr *pphys, int *pprot)
+                              int type, MemOp mop, hwaddr *pphys, int *pprot)
 {
     hwaddr phys;
     int prot, r_prot, w_prot, x_prot, priv;
@@ -340,7 +340,7 @@ hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     mmu_idx = (cpu->env.psw & PSW_D ? MMU_KERNEL_IDX :
                cpu->env.psw & PSW_W ? MMU_ABS_W_IDX : MMU_ABS_IDX);
 
-    excp = hppa_get_physical_address(&cpu->env, addr, mmu_idx, 0,
+    excp = hppa_get_physical_address(&cpu->env, addr, mmu_idx, 0, 0,
                                      &phys, &prot);
 
     /* Since we're translating for debugging, the only error that is a
@@ -438,7 +438,8 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
     }
 
-    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, &phys, &prot);
+    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, 0,
+                                     &phys, &prot);
     if (unlikely(excp >= 0)) {
         if (probe) {
             return false;
@@ -678,7 +679,7 @@ target_ulong HELPER(lpa)(CPUHPPAState *env, target_ulong addr)
     hwaddr phys;
     int prot, excp;
 
-    excp = hppa_get_physical_address(env, addr, MMU_KERNEL_IDX, 0,
+    excp = hppa_get_physical_address(env, addr, MMU_KERNEL_IDX, 0, 0,
                                      &phys, &prot);
     if (excp >= 0) {
         if (excp == EXCP_DTLB_MISS) {
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 7f79196fff..744325969f 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -334,7 +334,7 @@ target_ulong HELPER(probe)(CPUHPPAState *env, target_ulong addr,
     }
 
     mmu_idx = PRIV_P_TO_MMU_IDX(level, env->psw & PSW_P);
-    excp = hppa_get_physical_address(env, addr, mmu_idx, 0, &phys, &prot);
+    excp = hppa_get_physical_address(env, addr, mmu_idx, 0, 0, &phys, &prot);
     if (excp >= 0) {
         cpu_restore_state(env_cpu(env), GETPC());
         hppa_set_ior_and_isr(env, addr, MMU_IDX_MMU_DISABLED(mmu_idx));
-- 
2.43.0



Return-Path: <linux-parisc+bounces-2593-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C9995BF3
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 02:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 212A61F22F87
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 00:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2641163;
	Wed,  9 Oct 2024 00:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j+w6rHFy"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19635ECC
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 00:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432297; cv=none; b=YtTMmT8E2BsVr8tIMJIEfNK03I9qd2esf4cl6i3E+BfPasJ5+V6HZSkXSTyzeVx9ktt6QfXCNlSWeRByYc/n6+MpWT6mYt387tLPB+IT30PehRWq/IgkoIBd5sAK6VuHuRJimY3vKxfuj/YUhRxeuczLSgGJeN/QXIcmicg95MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432297; c=relaxed/simple;
	bh=KHgSQRZxRq0Ye0zml01cQhBTFzBlpDgpLTZXyZArscA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nAm7dsMUmdOuv/id+b4e1RFBSCTNmZlRUnEUK6vSQ+6o2JGmSDpYsNdXsiJYxTGe+QDoqrrQcg1gwzdns7//qa5d967/Mlbb3FsZnb7miP1JgT/x+rhKLhwa9jjMksLSQ+LhNJCRG4XLPOUFpQO2ox3MTe76npR3l/PatQZONts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j+w6rHFy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c5a7b2908so9763055ad.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 17:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432295; x=1729037095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=47Pe1MH9gsNOxZkdWXv/PZJTALTB63WGwPGX9cZVdVo=;
        b=j+w6rHFyVDsMAAeU1Cehsv4jbrlWvdtZB+sRpRNT7WrC//JsCS56FG3+aD9GyyYEvi
         hufi5oEFdn2yJrz+ksgBeSKqw4B7X+KQE9jQvH2kT7Zwh44Lnh8VZ/tIkU4Qa+gAxtbZ
         sHkJWrakSi5g32h1uvn4V+P+0GOW1t2yX8pn7bFK1IkurKhPji+UIoSD7m/OK0KIgzIq
         21+zrEsbIoR3N1AQO5HIox5PxKgrC3h8KibTQYNmSULmWhTXhwEvB9fa6motgcO88pAb
         1DjJMmWp4fWTLsxaIZ5abwgeYmA30E9b8IYfJ2147Pyq0KFa/QE36puhHz1XJdPL0EYm
         8+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432295; x=1729037095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47Pe1MH9gsNOxZkdWXv/PZJTALTB63WGwPGX9cZVdVo=;
        b=a6opEFIgJAqI5TbnrZXtH09y2+9UliOfF9URW/blEb1e48lhwllsMRn96b48s9grNd
         PWkOEeEmu281F8ghVC8yRnOuXOGZUqDdrqskARRlxC1J8rffvVSvXtIz3kAwoXYw/V6i
         0bp3KT3OGwEg+/9y+RVT+1UHjUlQ+LThl1dAs1DAXSqk9XhEHpZ2odRjAwq7KSpp7SE6
         KyPtktz4bHzaTdiTM1xtY3nj66+W5mzDRh4NRq61xzAeSlnTjlIrpDfGLorFgnH1uaja
         9XBUFiCovomuEy87nRWoH7B0VsPUO359qEI0lnxWxNcWb9ERqqOV5cdOFtsn2uuqCRld
         yavw==
X-Forwarded-Encrypted: i=1; AJvYcCU4izouhU+MxgucKp2DFBNF5PAJizV7m7VLpLr+erNYTlbi0YVBH5M45Jgt20KbWtUv+gQ5ij5ZyLiyRYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxVLaLc2hRhNX8mwobnCrJTu3hONXaldjWxgkTW7Ux3S5+b6Q3
	epFO/2zuhiPOengNpIKjBOvcmyG2I2gT1tbptNOORgoTdCaGyZpSIzDnOGAQvL2GEel0p0zkflD
	j
X-Google-Smtp-Source: AGHT+IF7W3tFDq7NjDPWGL7RHkyhiahUq6Tk0gHdPQurTadTzr8V3g0hgvREtTGmqziBBmE6YVcFgg==
X-Received: by 2002:a17:902:d2cf:b0:202:4b65:65af with SMTP id d9443c01a7336-20c6378ea43mr10853195ad.52.1728432295419;
        Tue, 08 Oct 2024 17:04:55 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 00/20] accel/tcg: Introduce tlb_fill_align hook
Date: Tue,  8 Oct 2024 17:04:33 -0700
Message-ID: <20241009000453.315652-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This new hook will allow targets to recognize an alignment
fault with the correct priority with respect to other faults
that can be raised by paging.

This should fix several hppa fault priority issues, most
importantly that access permissions come before alignment.

This should fix the documented error in the Arm alignment
fault due to memory type.

Changes for v3:
  - Change the tlb_fill_hook to return data into provided
    CPUTLBEntryFull, instead of calling tlb_set_page*.
  - I have dropped some r-b, correspondingly.

Patches needing review:
  05-accel-tcg-Add-TCGCPUOps.tlb_fill_align.patch
  06-accel-tcg-Use-the-alignment-test-in-tlb_fill_alig.patch
  11-target-hppa-Implement-TCGCPUOps.tlb_fill_align.patch
  19-target-arm-Implement-TCGCPUOps.tlb_fill_align.patch


r~


Richard Henderson (20):
  accel/tcg: Assert noreturn from write-only page for atomics
  include/exec/memop: Move get_alignment_bits from tcg.h
  include/exec/memop: Rename get_alignment_bits
  include/exec/memop: Introduce memop_atomicity_bits
  accel/tcg: Add TCGCPUOps.tlb_fill_align
  accel/tcg: Use the alignment test in tlb_fill_align
  target/hppa: Add MemOp argument to hppa_get_physical_address
  target/hppa: Perform access rights before protection id check
  target/hppa: Fix priority of T, D, and B page faults
  target/hppa: Handle alignment faults in hppa_get_physical_address
  target/hppa: Implement TCGCPUOps.tlb_fill_align
  target/arm: Pass MemOp to get_phys_addr
  target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
  target/arm: Pass MemOp to get_phys_addr_gpc
  target/arm: Pass MemOp to get_phys_addr_nogpc
  target/arm: Pass MemOp through get_phys_addr_twostage
  target/arm: Pass MemOp to get_phys_addr_lpae
  target/arm: Move device detection earlier in get_phys_addr_lpae
  target/arm: Implement TCGCPUOps.tlb_fill_align
  target/arm: Fix alignment fault priority in get_phys_addr_lpae

 include/exec/memop.h           |  47 ++++++++++
 include/hw/core/cpu.h          |   4 +-
 include/hw/core/tcg-cpu-ops.h  |  26 ++++++
 include/qemu/typedefs.h        |   1 +
 include/tcg/tcg.h              |  23 -----
 target/arm/internals.h         |  12 +--
 target/hppa/cpu.h              |   8 +-
 accel/tcg/cputlb.c             | 160 +++++++++++++++++----------------
 accel/tcg/user-exec.c          |   4 +-
 target/arm/cpu.c               |   2 +-
 target/arm/helper.c            |   9 +-
 target/arm/ptw.c               | 141 ++++++++++++++++-------------
 target/arm/tcg/cpu-v7m.c       |   2 +-
 target/arm/tcg/m_helper.c      |   8 +-
 target/arm/tcg/tlb_helper.c    |  49 ++++------
 target/arm/tcg/translate-a64.c |   4 +-
 target/hppa/cpu.c              |   2 +-
 target/hppa/int_helper.c       |   2 +-
 target/hppa/mem_helper.c       |  55 +++++++-----
 target/hppa/op_helper.c        |   2 +-
 target/xtensa/translate.c      |   2 +-
 tcg/tcg-op-ldst.c              |   6 +-
 tcg/tcg.c                      |   2 +-
 tcg/arm/tcg-target.c.inc       |   4 +-
 tcg/sparc64/tcg-target.c.inc   |   2 +-
 25 files changed, 326 insertions(+), 251 deletions(-)

-- 
2.43.0



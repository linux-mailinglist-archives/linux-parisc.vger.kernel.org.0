Return-Path: <linux-parisc+bounces-2456-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296519917AF
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8A2E283233
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 15:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A1015383C;
	Sat,  5 Oct 2024 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQsoxzF+"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F7D1C6A3
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141955; cv=none; b=dgVia9ictXZTv1gqNM8dw+6CgZfdY8XzYPbi9jtljeaa4AoLHGCZrMfuwXXZRJQcxoZzrjYFkZtuG9z5kfi0Gwg2JGisDjqIKUoZlFoMiEZaWGk3MCnQWM6+GLvZE1awIWjDNK1JFlvRJL6EWfEqMFs5NKmRhRAmQtJf9BXlbZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141955; c=relaxed/simple;
	bh=5ogWNCwRkRN1FuRNpXgjjUjhQZCmIsagMGuUEl8kxrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOR8XuukoO+j0NV6EVE7ySLG1SY6k6YLTBYF7GrsIVTkSTVKn7Y2e3z37Ifnbj18HqNSK/UbtO1BXni1tqL/ViE8nDQ05ejS74vwgUaOpdprrB15gjgyxb+FXIdTEmFelioA0Oe4CpbZYEZxm+l5gQDB7GXZVjdqnty2UAWNuLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XQsoxzF+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20bb39d97d1so27184625ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141953; x=1728746753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wpFwx2+B2oxOHc6b6hBqiIP5nn07TpsAOahnQ7H73ek=;
        b=XQsoxzF+UtbbWkbYgob5ezLW7aJuojz/B0pZoVizWX83gAMjFUSNrFXQQcr1kbZ5DV
         pgkvUtRDx7GbGTAqko6+3OSxk1JmiAxlCmbczLS0SOTlwixY7VH32tFgV6u0cuq/pIr8
         2RSrK7qyBDAhhC/Y8udoXJvJeY1EAI3+UPBnDo0ZpiAlMDdItGGOEAXa7nuqD7M3S07d
         b3zBpCYAZeZH9ldqMMQcnBstCXJ7PRrUumfOY7Yv3/CbAaEI+ZoNsS+At1gQKqJVguLG
         n4LCkXOe5pC5rCgfF57bCKu4de6NKGTDkcv/ZFgLVR91sF33g3FjK4FfzmkqxOIeaRST
         e3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141953; x=1728746753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpFwx2+B2oxOHc6b6hBqiIP5nn07TpsAOahnQ7H73ek=;
        b=AFNX0fNk0/EcwEcXsc323LCRluGLi385K1/6ZkRv9gkCyoEtQ05+w7kULD85z+Rpx+
         cECyq1TdQKnCcgCkXUbNCO8K7Q0IhvYEBk7vg14cDZsvtKZdDrE/bERb1H/PGrbLvroB
         2zHazMklGmjrSbtbmWhGcQrNL5s46NXMlw44Xv5d6wKB4Fnz/X41UYwECQbCBE5Kc9W5
         rFgZ8rA0sPeUHe0hXPGzYObEp8uKgzrMbSCpuZQTrCdTSuL0sfw7eNzow8NaMG2+JEsJ
         G8xbQzMS6N5Y5Xj7OEx0qiZrQz21mSQmCAvEvuubEAwNs/hzCiOgTm6G/f1O46dB368z
         bkQw==
X-Forwarded-Encrypted: i=1; AJvYcCV+uMyJMcbxH/4K/YwNqmJcLdrGqqoD4MToaZs3ADYK+7EGnalZeUSrlLj5JiNoGrWnrnlI/XZCqpiYLk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI3o2YVi+6qRc5R3+c05R0muqJwsvutBPK0JAsDbVDZ+VFLEgi
	vb+/5OG3cij8vSiS0JIJ1VQMA4roOVSt2OfZvKZM1ZsClpd4Dl8onITwSMMNAPQ=
X-Google-Smtp-Source: AGHT+IHPXsFE7R6jjgtrThFRIybCkI51Eu2ER9DX0AbZAMTqrYQ1cs+3WLCHNSwkVb8nGfrYpNWUSg==
X-Received: by 2002:a17:902:f548:b0:20b:96e:8e65 with SMTP id d9443c01a7336-20bff1a8b43mr85517295ad.42.1728141952853;
        Sat, 05 Oct 2024 08:25:52 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 00/20] accel/tcg: Introduce tlb_fill_align hook
Date: Sat,  5 Oct 2024 08:25:31 -0700
Message-ID: <20241005152551.307923-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new hook will allow targets to recognize an alignment
fault with the correct priority with respect to other faults
that can be raised by paging.

This should fix several hppa fault priority issues, most
importantly that access permissions come before alignment.

This should fix the documented error in the Arm alignment
fault due to memory type.


r~


Richard Henderson (20):
  accel/tcg: Assert noreturn from write-only page for atomics
  accel/tcg: Expand tlb_fill for 3 callers
  include/exec/memop: Move get_alignment_bits from tcg.h
  include/exec/memop: Rename get_alignment_bits
  include/exec/memop: Introduce memop_atomicity_bits
  hw/core/tcg-cpu-ops: Introduce tlb_fill_align hook
  accel/tcg: Use the tlb_fill_align hook
  target/hppa: Add MemOp argument to hppa_get_physical_address
  target/hppa: Perform access rights before protection id check
  target/hppa: Fix priority of T, D, and B page faults
  target/hppa: Handle alignment faults in hppa_get_physical_address
  target/hppa: Add hppa_cpu_tlb_fill_align
  target/arm: Pass MemOp to get_phys_addr
  target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
  target/arm: Pass MemOp to get_phys_addr_gpc
  target/arm: Pass MemOp to get_phys_addr_nogpc
  target/arm: Pass MemOp through get_phys_addr_twostage
  target/arm: Pass MemOp to get_phys_addr_lpae
  target/arm: Move device detection earlier in get_phys_addr_lpae
  target/arm: Fix alignment fault priority in get_phys_addr_lpae

 include/exec/memop.h           |  47 +++++++++++
 include/hw/core/tcg-cpu-ops.h  |  25 ++++++
 include/tcg/tcg.h              |  23 ------
 target/arm/internals.h         |   6 +-
 target/hppa/cpu.h              |   5 +-
 accel/tcg/cputlb.c             | 142 +++++++++++++++++----------------
 accel/tcg/user-exec.c          |   4 +-
 target/alpha/cpu.c             |   1 +
 target/arm/cpu.c               |   1 +
 target/arm/helper.c            |   4 +-
 target/arm/ptw.c               | 139 ++++++++++++++++++--------------
 target/arm/tcg/cpu-v7m.c       |   1 +
 target/arm/tcg/m_helper.c      |   8 +-
 target/arm/tcg/tlb_helper.c    |   2 +-
 target/arm/tcg/translate-a64.c |   4 +-
 target/avr/cpu.c               |   1 +
 target/hppa/cpu.c              |   1 +
 target/hppa/int_helper.c       |   2 +-
 target/hppa/mem_helper.c       |  50 ++++++++----
 target/hppa/op_helper.c        |   2 +-
 target/i386/tcg/tcg-cpu.c      |   1 +
 target/loongarch/cpu.c         |   1 +
 target/m68k/cpu.c              |   1 +
 target/microblaze/cpu.c        |   1 +
 target/mips/cpu.c              |   1 +
 target/openrisc/cpu.c          |   1 +
 target/ppc/cpu_init.c          |   1 +
 target/riscv/tcg/tcg-cpu.c     |   1 +
 target/rx/cpu.c                |   1 +
 target/s390x/cpu.c             |   1 +
 target/sh4/cpu.c               |   1 +
 target/sparc/cpu.c             |   1 +
 target/tricore/cpu.c           |   1 +
 target/xtensa/cpu.c            |   1 +
 target/xtensa/translate.c      |   2 +-
 tcg/tcg-op-ldst.c              |   6 +-
 tcg/tcg.c                      |   2 +-
 tcg/arm/tcg-target.c.inc       |   4 +-
 tcg/sparc64/tcg-target.c.inc   |   2 +-
 39 files changed, 302 insertions(+), 196 deletions(-)

-- 
2.43.0



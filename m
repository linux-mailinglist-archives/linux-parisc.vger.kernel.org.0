Return-Path: <linux-parisc+bounces-2480-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0900F991A6C
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 22:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F494281016
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 20:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8547F157E6B;
	Sat,  5 Oct 2024 20:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dx0YiCvv"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7BA130AC8
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 20:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158764; cv=none; b=YcRtL6BFb3NG+/+pmxcS24nQ4vcaz/soPBcDlsv4451INT+jMClqYoaCVJJnjk1ZjSgD4hfyE96WCOqx8RNAB/K7hCyK3guU5qlrIGctAwLbZEwldHs7l/cspahvi5dgF8x9RNMFACbpRm3kCVw33VE0hYch2MqGE6Fz6aIN18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158764; c=relaxed/simple;
	bh=UKExh3WpfYTBgVVaStgdjl+UrQo04hCRqd2RRrGmZjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KyqwkhYcS55xYWQeO0BJybMoHXiw4ldrcnYMR8AwvrEy4bjqdvsGTrzudmQQRQ3KaIvB/KcXHheL6r+PLgd6Q7MyOfGraX6+obhQfkajpjwLJIsylIfHRKpB/MjFwcP4j3hdz/JkJEMkWR5tauJBULR0TLTUNo/Oeoey53QwBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dx0YiCvv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b0b5cdb57so31578515ad.1
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 13:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158762; x=1728763562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irfgPGGIAUHZVTJOmBvNpfB+bdbCcTVofkC/LEnkZY0=;
        b=Dx0YiCvv7aNDrogCd70ZVTwGEhDrlpAd0u/Cfx9FCvn1hTJr0234ANKjVMja0h0urb
         C6JEt+cMd2JeJO08r2ICdy2czZnoEaQmKLPmCL9xhc2q+dK1O8LQpH9fS0BLlpnxfrFT
         g8+IUbzJWecbwCgANp49w8pggd9cSURE3Zgs5m26592COl1SOatvWCynq6zUge0vOvWd
         DHV2f6PUCf1kxEb/ZihjTutNDLuYz1Va0LVhoox6GeB7Bwxtt7YSvGMaV4B/2idORi+9
         Pe91l5806B1Xg8xtLvNtCPxEOZfK7bfjNhMMnXB72IhoTk0UDqk8FspbbzvsccnhXWEK
         gJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158762; x=1728763562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irfgPGGIAUHZVTJOmBvNpfB+bdbCcTVofkC/LEnkZY0=;
        b=l+06YKqBJTWItVnjdVKo1SMIq0zy5yQNJHoSwBM4N51d0U/rhECXOP8pXNHB7yAyfS
         dvvGYrg/HZfpehEZEeJ1AJjFFM3uFiPCV7qnR35RRoKlBQ+6357v+QMw/Uvl40EfRvTG
         JR4/53GNKweoJAzeSox4LHruSKiNB8A4VVjutxid0P9AeMaAP18A0ILbTfoehF0QfCJh
         uZgeP1RXz6ieHocQsZFtxxnsFBtaNOvriVkuqqwvBqwGOVKxSvOLC/+go7PlIvwIaEjX
         F2HjNOW5HIUIx0XWbrMZlq4EmH2wCp3j/5QnRH1oJAxuV735bvyLogTqecmtnVK/DeST
         aZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVheTjLY/g843vkufdJT9RjXfblit4d6T9URM8PXQ/qr5zOxp/cryvsn2V6sHa0eY/psRGqDwVjxgi998s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZtoYpWlRKifEYosvOGIfLp2/g4+NzlVCugM+1Wc+mrqwLEW2
	p2s0b8rO3h66CATDwrdvI2YIrzVCT+SdxSqjyHeBlZHHsX5aX4ncMIQ2j+HwuZo=
X-Google-Smtp-Source: AGHT+IGlIkcvQfqVVvHm809F9YqIElrzZKmax9yY2qA+GJ4yr0P9fW+0xTJH3k0gj6+vRVcrDX719A==
X-Received: by 2002:a17:903:2349:b0:20b:a9b2:b558 with SMTP id d9443c01a7336-20be199e341mr163370935ad.28.1728158761815;
        Sat, 05 Oct 2024 13:06:01 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 00/21] accel/tcg: Introduce tlb_fill_align hook
Date: Sat,  5 Oct 2024 13:05:39 -0700
Message-ID: <20241005200600.493604-1-richard.henderson@linaro.org>
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

[ Helge, I find that my old hppa system images would not boot,
  and a scratch re-install of debian 12 failed (networking error?).
  Would you please test?  It would be nice to have a self-contained
  regression test for this, using a port of the multiarch/system
  minilib, but that's a larger job.]

This should fix the documented error in the Arm alignment
fault due to memory type.

[ Also untested.  I should be possible to leverate aarch64/system/boot.S
  to manage this, but it's still tricky. ]

Changes for v2:
  - Include the arm_cpu_tlb_fill_align patch.  Oops!
  - Improve some commentary in target/arm/ptw.c.


r~


Richard Henderson (21):
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
  target/arm: Add arm_cpu_tlb_fill_align
  target/arm: Fix alignment fault priority in get_phys_addr_lpae

 include/exec/memop.h           |  47 +++++++++++
 include/hw/core/tcg-cpu-ops.h  |  25 ++++++
 include/tcg/tcg.h              |  23 ------
 target/arm/internals.h         |   9 ++-
 target/hppa/cpu.h              |   5 +-
 accel/tcg/cputlb.c             | 142 +++++++++++++++++----------------
 accel/tcg/user-exec.c          |   4 +-
 target/alpha/cpu.c             |   1 +
 target/arm/cpu.c               |   1 +
 target/arm/helper.c            |   4 +-
 target/arm/ptw.c               | 141 ++++++++++++++++++--------------
 target/arm/tcg/cpu-v7m.c       |   1 +
 target/arm/tcg/m_helper.c      |   8 +-
 target/arm/tcg/tlb_helper.c    |  27 ++++++-
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
 39 files changed, 329 insertions(+), 199 deletions(-)

-- 
2.43.0



Return-Path: <linux-parisc+bounces-2994-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B679EDB28
	for <lists+linux-parisc@lfdr.de>; Thu, 12 Dec 2024 00:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 766A1168514
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Dec 2024 23:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012361F2C5E;
	Wed, 11 Dec 2024 23:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iU7GxywT"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B96A1F2C3B
	for <linux-parisc@vger.kernel.org>; Wed, 11 Dec 2024 23:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959680; cv=none; b=PWt+R9Hj+A22pSE+YLHQtt9IhYdZXiKXaOhDcsxazM+K+khCo8WbuBnhVKc0MEreOAAqvdxZEZymbvgHSwk1l7EtPA5WGXIpVeHKTo5r4XtMT0w+YMkaYraz5J4/SRgl+Y2cmkb/IOCNUsk5s5tsNI5utjq0dpPPY+uQ4FonWKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959680; c=relaxed/simple;
	bh=tkYUgsJNBXav1rnN7mRsWNxCkvx1+/sVfFghfRuojcE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=X+HWoQhGgoeXiApCVU25FkSv4BWtZiZ9JGMNCguW81aA3BH8Idgbqr2qCPQRW70jD+Vexjbqhx81L7YNJ/aobm+duK5QEA+JJHOBcnNNCI2sgBWEmPG80eM4LTSAzSFGdDQqmNA26FQfezi9v/N3GeETt3Ng0nqylxkR33fuGwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iU7GxywT; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7fd3c241975so1025651a12.0
        for <linux-parisc@vger.kernel.org>; Wed, 11 Dec 2024 15:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959678; x=1734564478; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Y13tezS9osfEyeZZhDu0hB4QwVrkWFM3vdAGWXDL0s=;
        b=iU7GxywTPRhv00BP/fgEg0NmrmdoZvsb18J0qNknuA9FMsK90V2SUmf3EHvcZEMqxJ
         2K0leJKkuL/h0g5LyguBhaAzdCwf/ixV35hU2N28UlRo3iDCexPyZJlZ8ADVsUbzQdSu
         36f6fBihpDkgrvms7FyRKG90XrZdvglESUBx38od50WwLvZKwzAq1mdoFtMhJK5InUC2
         2maZR+72rUQpReNpLsRqs44RtGvHjZvqOxXIt3BomWgB01Pu7FsM0OeM7kooK/j+MkHg
         7sUfGhlRaKTjZr3YSiu0HnafSMsqeck/TWmmYHeBvKSEXWEpIpYD65lm/dCdHhJMAwbD
         3fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959678; x=1734564478;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Y13tezS9osfEyeZZhDu0hB4QwVrkWFM3vdAGWXDL0s=;
        b=HVH6dJQbwYR5r05RhSObPQLzakns6MZ1NGMpz0T8Quo1q/fhGfkt1TvTK2jbRy7RFG
         nYqR7NyaIQfp/BkDthwKTgFByC6x2niSykF0yDQHVk10Yuj9B3RW7yaDHqfvOHjAvKmQ
         A5WEN6geINSvJKNgCjy1csW/yMXkYGb6Fbo7HYwehlFThHMwmEyxqEWQleV2jvJwnEW3
         jqyio825e5vgouJmxZvLFyMZ14eJQrYnyXiIfoBFXSLpgTbKS4iTpgazfCBq8i9U1akh
         tziz4hYkBK1Xrzmu493bW5ARcYFpe9vrjeRmniYXmyUZz2T1PAUpHM7WEL5CX0WizfRH
         CqoA==
X-Forwarded-Encrypted: i=1; AJvYcCXkH6hVAn6itA/UgyOr7JAfHVhlcEpA35H5YAkvElKYFniwDM6TFnDjSD2fbYa/Z6iD7sxbwcC8LruoxOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTs45Xjtq8zklYJOjTA4JCbTZAotOE036mHPWRzrWJxf4aZ3rU
	FGA3dnKBU0GvD6PXgxcVaF7HEmUv2kSodQZEf2bv+xR8UfRfic7asa7quvKGsC2Yj0IkgDwTFEM
	2z10JAvgvwhwg9nKH1Wf5XA==
X-Google-Smtp-Source: AGHT+IH+hxwnbTejsd5rMe6ZdiiLsQVYXh76CpSNZ1O0EO7ZME4Z+uiov/c6u6U8sBeYTnWqfHb7LFZNMZjeMUedcw==
X-Received: from pjj11.prod.google.com ([2002:a17:90b:554b:b0:2ef:9866:6155])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1f81:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-2f13abc6e43mr1624666a91.5.1733959677870;
 Wed, 11 Dec 2024 15:27:57 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:38 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-1-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

This is v2 othe the arch_mmap_hint() series.

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate most of the error handling in arch_mmap_hint().
  - Patch 16 ("mm: Fallback to generic_mmap_hint()") was folded into
    Patch 2 ("mm: x86: Introduce arch_mmap_hint()")

v1: https://lore.kernel.org/r/20241210024119.2488608-1-kaleshsingh@google.com/

=======

This series introduces arch_mmap_hint() to handle allocating VA space
for the hint address.

Patches 1-16 introduce this new helper and Patch 17 uses it to fix the
issue of mmap hint being ignored in some cases due to THP alignment [1]

[1] https://lore.kernel.org/r/20241118214650.3667577-1-kaleshsingh@google.com/

Thanks,
Kalesh


Kalesh Singh (16):
  mm: Introduce generic_mmap_hint()
  mm: x86: Introduce arch_mmap_hint()
  mm: arm: Introduce arch_mmap_hint()
  mm: alpha: Introduce arch_mmap_hint()
  mm: arc: Use generic_mmap_hint()
  mm: csky: Introduce arch_mmap_hint()
  mm: loongarch: Introduce arch_mmap_hint()
  mm: mips: Introduce arch_align_mmap_hint()
  mm: parisc: Introduce arch_align_mmap_hint()
  mm: s390: Use generic_mmap_hint()
  mm: sh: Introduce arch_mmap_hint()
  mm: sparc32: Introduce arch_mmap_hint()
  mm: sparc64: Introduce arch_mmap_hint()
  mm: xtensa: Introduce arch_mmap_hint()
  mm: powerpc: Introduce arch_mmap_hint()
  mm: Respect mmap hint before THP alignment if allocation is possible

 arch/alpha/include/asm/pgtable.h           |   1 +
 arch/alpha/kernel/osf_sys.c                |  31 +++---
 arch/arc/include/asm/pgtable.h             |   1 +
 arch/arc/mm/mmap.c                         |  43 +++++----
 arch/arm/include/asm/pgtable.h             |   1 +
 arch/arm/mm/mmap.c                         | 107 +++++++++------------
 arch/csky/abiv1/inc/abi/pgtable-bits.h     |   1 +
 arch/csky/abiv1/mmap.c                     |  68 +++++++------
 arch/loongarch/include/asm/pgtable.h       |   1 +
 arch/loongarch/mm/mmap.c                   |  49 +++++-----
 arch/mips/include/asm/pgtable.h            |   1 +
 arch/mips/mm/mmap.c                        |  50 +++++-----
 arch/parisc/include/asm/pgtable.h          |   1 +
 arch/parisc/kernel/sys_parisc.c            |  53 +++++-----
 arch/powerpc/include/asm/book3s/64/slice.h |   1 +
 arch/powerpc/mm/book3s64/slice.c           |  31 ++++++
 arch/s390/include/asm/pgtable.h            |   1 +
 arch/s390/mm/mmap.c                        |  51 +++++-----
 arch/sh/include/asm/pgtable.h              |   1 +
 arch/sh/mm/mmap.c                          |  83 ++++++----------
 arch/sparc/include/asm/pgtable_32.h        |   1 +
 arch/sparc/include/asm/pgtable_64.h        |   1 +
 arch/sparc/kernel/sys_sparc_32.c           |  33 ++++---
 arch/sparc/kernel/sys_sparc_64.c           |  96 +++++++-----------
 arch/x86/include/asm/pgtable_64.h          |   1 +
 arch/x86/kernel/sys_x86_64.c               |  64 ++++++------
 arch/xtensa/kernel/syscall.c               |  31 ++++--
 include/linux/sched/mm.h                   |   9 ++
 mm/huge_memory.c                           |  17 ++--
 mm/mmap.c                                  |  86 +++++++++++------
 30 files changed, 491 insertions(+), 424 deletions(-)

-- 
2.47.0.338.g60cca15819-goog



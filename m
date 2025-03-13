Return-Path: <linux-parisc+bounces-3405-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1478A5F2F8
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 12:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69A1F19C0EB8
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Mar 2025 11:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F84D266B4B;
	Thu, 13 Mar 2025 11:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pg8FjYTZ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C1266B72
	for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866274; cv=none; b=O4w+ITfhqqhHeiRtYhu9zotsh/MRi4uvHzhLoyBDvZzXzKcyE6Qwt54l0suSbRNsUxgZBGwGCMdx19UzdnZTMqmO5bOMqJOqGyWIiqHJN5nQPM7QV1vHC/ctGD3RKgY5MfMhZ8qC9T/Y8i5LuUO8DfXk+WiCNq+opCAMBLvV47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866274; c=relaxed/simple;
	bh=RZxQPd6DhJpVyGhaRdUKVZqwkHQjwhx4+RC8j3iFEn0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-type; b=D6NSoGhvlHVMvh54UaGZoDVx8XAfIUkEulUdrCwuIu8TOQ9rGlPl2v0A15V4wSWWXLlVQD1vwZcKhESzNPIUfP6tiYGl6hMiXI9dnIz9Vj7epCZX8udfWX6UUrPeC2Ia6vE/WGgMhybaMhefi/+6+F/X8rlFomEPtz/UwCp6ago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pg8FjYTZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vi3vqlZEjhRyke+tn+Q3MD+zw3p/H2XxVRSJ9/S1eBk=;
	b=Pg8FjYTZArqGW7q9Gf77UziI5fVwoBa3PoF0snquq3w6LbVWjYxEXz6Knel1P3If+Auwtv
	fgGKaGpotfb95cZ5+DZRBh9n+OLyAoys4PbD7i1Ga/XGa9Hc57Ue0Knoss7H7REb4fGDNT
	oTDvf375jlK0OHcSydIsLDZb9xp/d3E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-zs-5RygjPSySN_ThPYxf0A-1; Thu, 13 Mar 2025 07:44:30 -0400
X-MC-Unique: zs-5RygjPSySN_ThPYxf0A-1
X-Mimecast-MFC-AGG-ID: zs-5RygjPSySN_ThPYxf0A_1741866269
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912539665cso860797f8f.1
        for <linux-parisc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866269; x=1742471069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vi3vqlZEjhRyke+tn+Q3MD+zw3p/H2XxVRSJ9/S1eBk=;
        b=m9UvdUXwk2K8GsvKVm4vsUWHPaOegc29EA+ZXSxAEcDGH7vhNXYVpf9HGxX2+0SVz0
         oUPQ9iQjU00DVHIUytE8KYt5fz+VoRMDjHEohh3kul+kFjf7IraB2zXERnEjqBTcR3Y1
         lyKNaeIE7bkCXGc40ibOUdx7OSb6b3Byq7/5AJeimuhAbfzNWlRUZUpSUArKhq/FPvs0
         tZ83Ya0IUo2Y+Rp1voS+O6qfOXrpuFIlRUlpxsspeLGJuB+zTzaZ5wXzbWiIjbXEgUHE
         v8EFJpo/WzZtfa/teZufIcZ/EnzD1xVU5PZQX6iWPE/q9Kqvs44c9h5xUirtEgVGPQ8I
         IofQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWRrDandRK+JiV0CQ4mszERy7FBU4gOzNXiQkGSZkTIu3KpW49P09yW1oadxGXoaPkX/66I4ggzdkMOsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDUPLKT8/+pFA2R2T44xkyzCjesFrWUOmcXOOnxs+916bbtPen
	xPBDLcLFXvhjBmf9sYKTMThxz/Ee8awPd7OpyimDPnZw0Th36ku8MKmiP5tdkI2C1WHsyWlmoDO
	fcrV3YvpkvDURvun4TLcOnMtT8zohOq27O7SJ6r8WqAZDWyh50bQvoBUNpMmuuA==
X-Gm-Gg: ASbGnctAO0a5zUYNKV6Cv51m29NHebXl6NoU9DYANLKisCUIYU2UJCHLzcf7UuiGjAT
	q/wuJfhmozO7Mo/CG/hRHNGG9Uz6egxDn+ebqmRzZXOBVIHvPK2Bzjc/YVA6p/lC22AxaQRUYNA
	AfTR0/iCXfm8nCPY5V5XdMmOykjXznDEvf4LWbDD03GvFeS4xdvlkOxlSUBTpOO03793fCzGf/m
	XNkrw9XAw7P74I8H20xAOgqiknnXmBB9Z0bZ3QIoz73Ueo9kC3429olAIDDRDPBnhRzVs42zrLX
	jwdcbYqtNntAQ5eJ92I3
X-Received: by 2002:a5d:64cb:0:b0:38f:23c4:208c with SMTP id ffacd0b85a97d-395b954ea75mr1784223f8f.18.1741866269092;
        Thu, 13 Mar 2025 04:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5B4S8E4d5tF3TI1rIoUvKO0tSV0G2B0BPE1gxY0qJz2LBrnTYS6FEhx79I2sbOMPQrE3jHw==
X-Received: by 2002:a5d:64cb:0:b0:38f:23c4:208c with SMTP id ffacd0b85a97d-395b954ea75mr1784186f8f.18.1741866268630;
        Thu, 13 Mar 2025 04:44:28 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:27 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	x86@kernel.org,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 00/14] Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:15 +0000
Message-Id: <20250313114329.284104-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Some unit tests intentionally trigger warning backtraces by passing bad
parameters to kernel API functions. Such unit tests typically check the
return value from such calls, not the existence of the warning backtrace.

Such intentionally generated warning backtraces are neither desirable
nor useful for a number of reasons.
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad-hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address problem would be to add messages such as "expected
warning backtraces start / end here" to the kernel log.  However, that
would again require filter scripts, it might result in missing real
problematic warning backtraces triggered while the test is running, and
the irrelevant backtrace(s) would still clog the kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code. Support suppressing multiple
backtraces while at the same time limiting changes to generic code to the
absolute minimum. Architecture specific changes are kept at minimum by
retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
CONFIG_KUNIT are enabled.

The first patch of the series introduces the necessary infrastructure.
The second patch introduces support for counting suppressed backtraces.
This capability is used in patch three to implement unit tests.
Patch four documents the new API.
The next two patches add support for suppressing backtraces in drm_rect
and dev_addr_lists unit tests. These patches are intended to serve as
examples for the use of the functionality introduced with this series.
The remaining patches implement the necessary changes for all
architectures with GENERIC_BUG support.

With CONFIG_KUNIT enabled, image size increase with this series applied is
approximately 1%. The image size increase (and with it the functionality
introduced by this series) can be avoided by disabling
CONFIG_KUNIT_SUPPRESS_BACKTRACE.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Design note:
  Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT_SUPPRESS_BACKTRACE and CONFIG_DEBUG_BUGVERBOSE are enabled
  to avoid image size increases if CONFIG_KUNIT is disabled. There would be
  some benefits to adding those pointers all the time (reduced complexity,
  ability to display function names in BUG/WARNING messages). That change,
  if desired, can be made later.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

Changes since RFC:
- Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests

Changes since v1:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
  [I retained those tags since there have been no functional changes]
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
  default.

Changes since v2:
- Rebased to v6.9-rc2
- Added comments to drm warning suppression explaining why it is needed.
- Added patch to move conditional code in arch/sh/include/asm/bug.h
  to avoid kerneldoc warning
- Added architecture maintainers to Cc: for architecture specific patches
- No functional changes

Changes since v3:
- Rebased to v6.14-rc6
- Dropped net: "kunit: Suppress lock warning noise at end of dev_addr_lists tests"
  since 3db3b62955cd6d73afde05a17d7e8e106695c3b9
- Added __kunit_ and KUNIT_ prefixes.
- Tested on interessed architectures.

----
Guenter Roeck (14):
  bug/kunit: Core support for suppressing warning backtraces
  kunit: bug: Count suppressed warning backtraces
  kunit: Add test cases for backtrace warning suppression
  kunit: Add documentation for warning backtrace suppression API
  drm: Suppress intentional warning backtraces in scaling unit tests
  x86: Add support for suppressing warning backtraces
  arm64: Add support for suppressing warning backtraces
  loongarch: Add support for suppressing warning backtraces
  parisc: Add support for suppressing warning backtraces
  s390: Add support for suppressing warning backtraces
  sh: Add support for suppressing warning backtraces
  sh: Move defines needed for suppressing warning backtraces
  riscv: Add support for suppressing warning backtraces
  powerpc: Add support for suppressing warning backtraces

 Documentation/dev-tools/kunit/usage.rst |  30 ++++++-
 arch/arm64/include/asm/asm-bug.h        |  27 ++++--
 arch/arm64/include/asm/bug.h            |   8 +-
 arch/loongarch/include/asm/bug.h        |  42 +++++++---
 arch/parisc/include/asm/bug.h           |  29 +++++--
 arch/powerpc/include/asm/bug.h          |  37 +++++++--
 arch/riscv/include/asm/bug.h            |  38 ++++++---
 arch/s390/include/asm/bug.h             |  17 +++-
 arch/sh/include/asm/bug.h               |  28 ++++++-
 arch/x86/include/asm/bug.h              |  21 +++--
 drivers/gpu/drm/tests/drm_rect_test.c   |  16 ++++
 include/asm-generic/bug.h               |  16 +++-
 include/kunit/bug.h                     |  56 +++++++++++++
 include/kunit/test.h                    |   1 +
 include/linux/bug.h                     |  13 +++
 lib/bug.c                               |  51 +++++++++++-
 lib/kunit/Kconfig                       |   9 ++
 lib/kunit/Makefile                      |   7 +-
 lib/kunit/backtrace-suppression-test.c  | 104 ++++++++++++++++++++++++
 lib/kunit/bug.c                         |  42 ++++++++++
 20 files changed, 519 insertions(+), 73 deletions(-)
 create mode 100644 include/kunit/bug.h
 create mode 100644 lib/kunit/backtrace-suppression-test.c
 create mode 100644 lib/kunit/bug.c

-- 
2.34.1



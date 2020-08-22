Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115BD24E589
	for <lists+linux-parisc@lfdr.de>; Sat, 22 Aug 2020 07:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgHVFK2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 22 Aug 2020 01:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgHVFK1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 22 Aug 2020 01:10:27 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998D4C061573
        for <linux-parisc@vger.kernel.org>; Fri, 21 Aug 2020 22:10:27 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e12so4362567ybc.18
        for <linux-parisc@vger.kernel.org>; Fri, 21 Aug 2020 22:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=SqGhWwmcmm9obmK6NkU0bTPgP6SFJh16pvDcjsuRl/k=;
        b=LfA08uNQbqKpNsdC6C0zFBXUKxysEbY7/pd2E8SKumjyn7nrNN+wtdTLdHvGeP4MoJ
         wiuNPRwrIoZ1BVsjsTL+UcND6doV6pbD/saJ0w97GcZl7noaqwiaYU3zO2rwOU8Z/Vgv
         Q9pzaOOqLcLZMECN0Vwd8GsXrBNndDoiIdnEIsDW1aL0qPiQQ7Ge5WIyaV7LgWt7MRCD
         pfAjV83RVAd6YzKmPbPGvpNDqlxZEkYUfVbi1TXKNArst62YYtUbz0JtFrKZyMGt/Fvr
         n1qUcU1SrOfrkq8cyUHKIj65OvqppFUM1/w4s316FG1Pe6sATLdowEzH7AKofhHTTiZx
         BQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=SqGhWwmcmm9obmK6NkU0bTPgP6SFJh16pvDcjsuRl/k=;
        b=ti4fTDRxekEO5VScQrwlRjMB5tmc21KIhO5CjQSV5s540N5o/CeGTmKXC3SJAAU0dR
         hjblsgW27js9Aw21HrbXR6pl6GnBJTvVtY5+jHUCI7d3wYZvv2yPdgJK3LD31Hv8CCI9
         kZ4YL1t/tAK2ujU5W2nTGckqIxEQAV7gsTNZohNXIPABSSdUzDjNE37H7pTf6SqEDBJV
         juizG5FbECOhS5Tk2sZJOTUmBfbyeR6UAbSk2lHNd+fRi/V92V3ZKRO7XbJw3AdBusas
         Zc7mwFdwIH9uAQOPgnjks8qogn3USkzhiudnnv+S9DwgGnErFZgASbLaF1/4kRb1XFkO
         5FrQ==
X-Gm-Message-State: AOAM531gweAizSpjO2lS9rzJnkqXvk+lB1EQEn3XbxO+pbjWiV/c51ug
        yuWQq/ptCAwUkSmhc+Vn48Z+2to=
X-Google-Smtp-Source: ABdhPJweXokc3TQ72lH9+WLBlXCauBaaTMpCSHnrI1oNnJXvhwNSOZge9c51Ok7N7jb7F8OLOu2BdjM=
X-Received: from pcc-desktop.svl.corp.google.com ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:a25:f304:: with SMTP id c4mr7061481ybs.209.1598073026748;
 Fri, 21 Aug 2020 22:10:26 -0700 (PDT)
Date:   Fri, 21 Aug 2020 22:10:10 -0700
Message-Id: <cover.1598072840.git.pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v10 0/7] arm64: expose FAR_EL1 tag bits in siginfo
From:   Peter Collingbourne <pcc@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc:     Peter Collingbourne <pcc@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Richard Henderson <rth@twiddle.net>,
        linux-parisc@vger.kernel.org,
        David Spickett <david.spickett@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The kernel currently clears the tag bits (i.e. bits 56-63) in the fault
address exposed via siginfo.si_addr and sigcontext.fault_address. However,
the tag bits may be needed by tools in order to accurately diagnose
memory errors, such as HWASan [1] or future tools based on the Memory
Tagging Extension (MTE).

We should not stop clearing these bits in the existing fault address
fields, because there may be existing userspace applications that are
expecting the tag bits to be cleared. Instead, create a new pair of
union fields in siginfo._sigfault, and store the tag bits of FAR_EL1
there, together with a mask specifying which bits are valid.

However, one does not simply add fields to siginfo, especially since
userspace would have no way to detect that they are present and valid.
Therefore, the first five patches in this series introduce a mechanism
for userspace to detect the presence of our new siginfo fields,
and the last patch uses it to advertise the presence of said fields.

The series can be viewed on Gerrit here:
https://linux-review.googlesource.com/q/Ia8876bad8c798e0a32df7c2ce1256c4771c81446

[1] http://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html

Peter Collingbourne (7):
  parisc: start using signal-defs.h
  arch: move SA_* definitions to generic headers
  signal: clear non-uapi flag bits when passing/returning sa_flags
  signal: define the SA_UNSUPPORTED bit in sa_flags
  signal: deduplicate code dealing with common _sigfault fields
  signal: define the field siginfo.si_xflags
  arm64: expose FAR_EL1 tag bits in siginfo

 Documentation/arm64/tagged-pointers.rst    |  21 +++-
 arch/alpha/include/uapi/asm/signal.h       |  14 ---
 arch/arm/include/asm/signal.h              |   2 +
 arch/arm/include/uapi/asm/signal.h         |  28 +----
 arch/arm64/include/asm/exception.h         |   2 +-
 arch/arm64/include/asm/signal.h            |  17 +++
 arch/arm64/include/asm/system_misc.h       |   2 +-
 arch/arm64/include/asm/traps.h             |   6 +-
 arch/arm64/kernel/debug-monitors.c         |   5 +-
 arch/arm64/kernel/entry-common.c           |   2 -
 arch/arm64/kernel/ptrace.c                 |   7 +-
 arch/arm64/kernel/sys_compat.c             |   5 +-
 arch/arm64/kernel/traps.c                  |  29 ++---
 arch/arm64/mm/fault.c                      |  59 +++++-----
 arch/h8300/include/uapi/asm/signal.h       |  24 ----
 arch/ia64/include/uapi/asm/signal.h        |  24 ----
 arch/m68k/include/uapi/asm/signal.h        |  24 ----
 arch/mips/include/uapi/asm/signal.h        |  12 --
 arch/parisc/include/asm/signal.h           |   2 +
 arch/parisc/include/uapi/asm/signal.h      |  22 +---
 arch/powerpc/include/uapi/asm/signal.h     |  24 ----
 arch/powerpc/platforms/powernv/vas-fault.c |   1 +
 arch/s390/include/uapi/asm/signal.h        |  24 ----
 arch/sparc/include/uapi/asm/signal.h       |   4 +-
 arch/x86/include/uapi/asm/signal.h         |  24 ----
 arch/x86/kernel/signal_compat.c            |  11 +-
 arch/xtensa/include/uapi/asm/signal.h      |  24 ----
 include/linux/compat.h                     |   4 +
 include/linux/signal.h                     |  21 ++++
 include/linux/signal_types.h               |  12 ++
 include/uapi/asm-generic/siginfo.h         |  14 +++
 include/uapi/asm-generic/signal-defs.h     |  64 ++++++++++
 include/uapi/asm-generic/signal.h          |  29 -----
 include/uapi/linux/ptrace.h                |   2 +
 kernel/ptrace.c                            |  29 +++++
 kernel/signal.c                            | 130 +++++++++++----------
 36 files changed, 315 insertions(+), 409 deletions(-)
 create mode 100644 arch/arm64/include/asm/signal.h

-- 
2.28.0.297.g1956fa8f8d-goog


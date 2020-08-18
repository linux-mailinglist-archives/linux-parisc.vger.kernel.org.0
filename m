Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B99C247CE0
	for <lists+linux-parisc@lfdr.de>; Tue, 18 Aug 2020 05:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgHRDeE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 17 Aug 2020 23:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgHRDeE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 17 Aug 2020 23:34:04 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9E1C061389
        for <linux-parisc@vger.kernel.org>; Mon, 17 Aug 2020 20:34:03 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id f18so12282838qke.0
        for <linux-parisc@vger.kernel.org>; Mon, 17 Aug 2020 20:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=I6DOB6OCHVtcBnphcSa29MMaJF442XKQMk52U/1RC+0=;
        b=ZzhmZpaoOxtncOzeWKYsi4/jDjbjwi9gDikzcdHrNeTztQ1vuzJfTeqPCl53ftDQBK
         Iao0rT+515AU0UB+KhIMuzAyio7SmYih3+sYNif8Q9R4e1cPI+KzOtQv7tkpkP+kRa0k
         SPpdxcIN5PDMVRTHrkveL92MxPKD00ApgTXCxiXqBpfFdoPqgo3gCAsI0E+0km/wDYG6
         zVRGSIrocO0NE0ojebETygFyJlalhbTxbI8ozaZHUMMxyeisk39fsF9sYxB9v0xkkH4p
         2pFIPrcSlTpbujapEBAqGTA8BHd6n7/19tSpt65+UaFBy5pJ2sUXiaEuKnM+Oi306ViS
         Q5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=I6DOB6OCHVtcBnphcSa29MMaJF442XKQMk52U/1RC+0=;
        b=NXw0UnLEdCYpdNsSlq+my27mNFhBuhNmIp2Z3TiHhYTrvPHzwbLp6ttRGkpio95ml5
         CDPly2YoIxeISN7TDn4lRszctsKLf0lGHGwKg7hKmqtH4+fpMw1mqIWxnddH7oD5yqxQ
         VjXQz4Khc4CgWYJ6TEFog7ZU3nTwuwZ3f5/QJJHsxW7LWsZFvWJHjhWIukvMrJgbfyAh
         2ztSchz9kVYavxjOPZL4R2/rZ5NVmcrY4rule/2KMNQzTrnGSpNZUs+/ANr0wpUjeImR
         wvtax+5/LSACzt4o5+Ckdtwk3EiJuuise6abhpBkVf+2IcZV4l+LBo4VAMc+tmqVKw/D
         qg9w==
X-Gm-Message-State: AOAM530bDKNID3WZpas7WTyrk+qNzfQXNslINkqtp4BtzcXC+hoiiaXc
        SoSRSL80nqlba9B5vpaTxE5UAXQ=
X-Google-Smtp-Source: ABdhPJwsGI+sNs94Ofrco+J81pp2KvZEjJERYjCUozSUIGKt67XI/stlC827tloJ1X+jwI+P5Il9rBU=
X-Received: by 2002:ad4:478c:: with SMTP id z12mr17667928qvy.145.1597721641911;
 Mon, 17 Aug 2020 20:34:01 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:33:45 -0700
Message-Id: <cover.1597720138.git.pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH v9 0/6] arm64: expose FAR_EL1 tag bits in siginfo
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

Peter Collingbourne (6):
  parisc: start using signal-defs.h
  arch: move SA_* definitions to generic headers
  signal: clear non-uapi flag bits when passing/returning sa_flags
  signal: define the SA_UNSUPPORTED bit in sa_flags
  signal: define the field siginfo.si_xflags
  arm64: expose FAR_EL1 tag bits in siginfo

 Documentation/arm64/tagged-pointers.rst    | 21 ++++--
 arch/alpha/include/uapi/asm/signal.h       | 14 ----
 arch/arm/include/asm/signal.h              |  5 ++
 arch/arm/include/uapi/asm/signal.h         | 28 +-------
 arch/arm64/include/asm/exception.h         |  2 +-
 arch/arm64/include/asm/traps.h             |  7 +-
 arch/arm64/kernel/debug-monitors.c         |  4 +-
 arch/arm64/kernel/entry-common.c           |  2 -
 arch/arm64/kernel/ptrace.c                 |  2 +-
 arch/arm64/kernel/traps.c                  | 15 +++--
 arch/arm64/mm/fault.c                      | 54 ++++++++-------
 arch/h8300/include/uapi/asm/signal.h       | 24 -------
 arch/ia64/include/uapi/asm/signal.h        | 24 -------
 arch/m68k/include/uapi/asm/signal.h        | 24 -------
 arch/mips/include/uapi/asm/signal.h        | 12 ----
 arch/mips/kernel/traps.c                   |  2 +-
 arch/parisc/include/asm/signal.h           |  4 ++
 arch/parisc/include/uapi/asm/signal.h      | 22 +------
 arch/parisc/kernel/ptrace.c                |  2 +-
 arch/parisc/mm/fault.c                     |  2 +-
 arch/powerpc/include/uapi/asm/signal.h     | 24 -------
 arch/powerpc/mm/fault.c                    |  2 +-
 arch/powerpc/platforms/powernv/vas-fault.c |  1 +
 arch/s390/include/uapi/asm/signal.h        | 24 -------
 arch/sparc/include/uapi/asm/signal.h       |  4 +-
 arch/x86/include/uapi/asm/signal.h         | 24 -------
 arch/x86/kernel/signal_compat.c            |  7 --
 arch/x86/mm/fault.c                        |  3 +-
 arch/xtensa/include/uapi/asm/signal.h      | 24 -------
 include/linux/compat.h                     |  4 ++
 include/linux/sched/signal.h               | 12 +++-
 include/linux/signal_types.h               | 12 ++++
 include/uapi/asm-generic/siginfo.h         | 13 ++++
 include/uapi/asm-generic/signal-defs.h     | 64 ++++++++++++++++++
 include/uapi/asm-generic/signal.h          | 29 --------
 kernel/signal.c                            | 77 ++++++++++++++++++++--
 mm/memory-failure.c                        |  2 +-
 37 files changed, 261 insertions(+), 335 deletions(-)

-- 
2.28.0.220.ged08abb693-goog


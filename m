Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB697F20B8
	for <lists+linux-parisc@lfdr.de>; Mon, 20 Nov 2023 23:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjKTWxJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 20 Nov 2023 17:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjKTWxI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 20 Nov 2023 17:53:08 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13EA8D8
        for <linux-parisc@vger.kernel.org>; Mon, 20 Nov 2023 14:53:04 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-28120aa1c24so3346490a91.0
        for <linux-parisc@vger.kernel.org>; Mon, 20 Nov 2023 14:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1700520783; x=1701125583; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jj/vQll/FXoy8ynJ7Qc2odNrUXWiiF64P1hSHAKTnLo=;
        b=TJV+6/Hjq4Mewn2fI8FIeDdxzYZ3UyjLy2g1qYqHn0qKm4X5Lai6NZRNtH5YJ98k1I
         a6l7RGAy8lpggsIo5s8nb6WLFemAN7F8KRsKr0LKn4uZgW8J9rqWNUY4bMSvUIio7204
         lQiUwoB54lkZvokSYE0NUY9Ui6mbjBtTp6dw5oDhSzvq+ASDN90KV2jxoowcLbHEewGL
         D9E8G5H2+dWqZ967YfP02MaS+tqJznZLG2DUYr4BgvUHMq/W0Y5cayHWxgNFPAOQgF/s
         oSq86P6Z52FcwSMa6/DUyc0mXeAjxFxDTtvYOuNm+tvst2a0Ds4ecgV0bWB6qd36dxr6
         99IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700520783; x=1701125583;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jj/vQll/FXoy8ynJ7Qc2odNrUXWiiF64P1hSHAKTnLo=;
        b=qrp6jmgxR+YgnhtLVO6oiA0rKKMdS8B3d1XRKIpglxS+PGqJYI6MKpSdvxqpUrC2k0
         UXxwn6hIJAHCKYtZatMUws5TLIRILQi4mq3qQgXpefqiw3AgizPK3Wzhl9cGHpdoEyuW
         16MGCNvAIsQ6zrNkiH0/wbl9msuFD57Y+7PhxDAiX8uCCBwWThOR8IV2d/pTwwyDAE2c
         LVFOD6hUAVP+aamPYXpHHjNWoqlRzxt7AdL0uq+RDc9MASE8DcVPKhcdQR2oJhTTZZ9S
         dVA49sfQoFDF3TUqccQDl1A8Dd8OkKGME02LqNbOiAY68VC4/6L1QMLQ9DAK68tjHo5B
         HiOg==
X-Gm-Message-State: AOJu0Yxo8aRKd4NVJBwAiBlRjq6pVg+x7C7Lo5FjHBQY2O1j3hXP+dcR
        ++jGeke3bYDWjZfCNWmO9gyXNsETSC6NQiQdapBlZQ==
X-Google-Smtp-Source: AGHT+IFZPPhV0R/g5zHGb3q3Uo9IH7rXXP80OMq0eithxekw9SzGz9ATfztUful4gMY68aa6sJe0kX0Yn689XQCOKAw=
X-Received: by 2002:a17:90b:1a89:b0:27d:2364:44f6 with SMTP id
 ng9-20020a17090b1a8900b0027d236444f6mr7022804pjb.6.1700520783377; Mon, 20 Nov
 2023 14:53:03 -0800 (PST)
MIME-Version: 1.0
From:   Ignat Korchagin <ignat@cloudflare.com>
Date:   Mon, 20 Nov 2023 22:52:52 +0000
Message-ID: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
Subject: Potential config regression after 89cde455 ("kexec: consolidate kexec
 and crash options into kernel/Kconfig.kexec")
To:     eric.devolder@oracle.com
Cc:     linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org,
        tsbogend@alpha.franken.de,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        deller@gmx.de, ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        kernel@xen0n.name, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com,
        keescook@chromium.org, paulmck@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, frederic@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>, samitolvanen@google.com,
        juerg.haefliger@canonical.com, arnd@arndb.de,
        rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org,
        sebastian.reichel@collabora.com, rppt@kernel.org,
        kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com,
        ziy@nvidia.com, masahiroy@kernel.org, ndesaulniers@google.com,
        mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
        xin3.li@intel.com, tj@kernel.org,
        Greg KH <gregkh@linuxfoundation.org>, tsi@tuyoix.net,
        bhe@redhat.com, hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
        kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Good day!

We have recently started to evaluate Linux 6.6 and noticed that we
cannot disable CONFIG_KEXEC anymore, but keep CONFIG_CRASH_DUMP
enabled. It seems to be related to commit 89cde455 ("kexec:
consolidate kexec and crash options into kernel/Kconfig.kexec"), where
a CONFIG_KEXEC dependency was added to CONFIG_CRASH_DUMP.

In our current kernel (Linux 6.1) we only enable CONFIG_KEXEC_FILE
with enforced signature check to support the kernel crash dumping
functionality and would like to keep CONFIG_KEXEC disabled for
security reasons [1].

I was reading the long commit message, but the reason for adding
CONFIG_KEXEC as a dependency for CONFIG_CRASH_DUMP evaded me. And I
believe from the implementation perspective CONFIG_KEXEC_FILE should
suffice here (as we successfully used it for crashdumps on Linux 6.1).

Is there a reason for adding this dependency or is it just an
oversight? Would some solution of requiring either CONFIG_KEXEC or
CONFIG_KEXEC_FILE work here?

Ignat

[1]: https://mjg59.dreamwidth.org/28746.html

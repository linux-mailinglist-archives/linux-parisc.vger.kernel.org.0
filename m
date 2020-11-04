Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF0CA2A5AEB
	for <lists+linux-parisc@lfdr.de>; Wed,  4 Nov 2020 01:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbgKDAN0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 3 Nov 2020 19:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729956AbgKDALo (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 3 Nov 2020 19:11:44 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F1CC061A47
        for <linux-parisc@vger.kernel.org>; Tue,  3 Nov 2020 16:11:42 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id w65so15802342pfd.3
        for <linux-parisc@vger.kernel.org>; Tue, 03 Nov 2020 16:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NFjsAF4kgpQCHVIlKmgYN6bEVL36r1XibqsUv152D08=;
        b=mPTbV2UhVfnJP2OoJL4D5QLosesGivMu0Yj5j7pkCrVtHA6dueaCzR1JSWWklnSxS2
         Wgzos2joCi+Wlp8KUeVXQhCOJbK/Z4g4eTF82BJYkvr8uaU2CIt3++/EZgLF7nCLiPmR
         RFfDgHAz/9hjV1ZrPMZTrZyKkXhcZM/AoX3+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NFjsAF4kgpQCHVIlKmgYN6bEVL36r1XibqsUv152D08=;
        b=JA5P50dlM+7dW/EbQx0x4nzjRRLBLZAboMcWND7qEDun32w1sP92dBkCOBgTwStF/z
         gBxsxnA7qNmV3dbH1fyaXfKF8LgyvJbjvUJcPtX+768KxHQi0xG+P2Zfsk687BGZ8Xpz
         tP2EyG7TajajPIDYcCajgstlUxMBzqdIr+JuiBku4v4HhTJFFUt8wJlN54nM3ItC1U/A
         4d7tiivGgkvWI5NVSdd7gWeeP7ieo5WTLwRdlG3b7sonMPPzwWWEHykkBu1LCH/CXdVO
         wTKVe3klGzToOB1SWkVcylVuwmMIO2Mad1T3VDoZLRkQeOuglnPddVHwsRQNz2BAip8P
         Ja5g==
X-Gm-Message-State: AOAM533W8DNKxp5xFLUk7s2m+EDU4OANAZ8puydgy32h3EUaP1NRJJcY
        xYt4XtDCF7Y08c7oyFJbR7m/lg==
X-Google-Smtp-Source: ABdhPJybME+aS3qtjx8JuwpcYMqCGEp0y1Q8idII2QCmSunt2ifzlNcehSCk1E6c+iZLzWwdlgTh0g==
X-Received: by 2002:a17:90a:5285:: with SMTP id w5mr1762165pjh.50.1604448702345;
        Tue, 03 Nov 2020 16:11:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j20sm118311pgl.40.2020.11.03.16.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 16:11:41 -0800 (PST)
Date:   Tue, 3 Nov 2020 16:11:40 -0800
From:   Kees Cook <keescook@chromium.org>
To:     YiFei Zhu <zhuyifei1999@gmail.com>
Cc:     containers@lists.linux-foundation.org,
        YiFei Zhu <yifeifz2@illinois.edu>, linux-csky@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-kernel@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andy Lutomirski <luto@amacapital.net>,
        David Laight <David.Laight@aculab.com>,
        Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
        Giuseppe Scrivano <gscrivan@redhat.com>,
        Hubertus Franke <frankeh@us.ibm.com>,
        Jack Chen <jianyan2@illinois.edu>,
        Jann Horn <jannh@google.com>,
        Josep Torrellas <torrella@illinois.edu>,
        Tianyin Xu <tyxu@illinois.edu>,
        Tobin Feldman-Fitzthum <tobin@ibm.com>,
        Tycho Andersen <tycho@tycho.pizza>,
        Valentin Rothberg <vrothber@redhat.com>,
        Will Drewry <wad@chromium.org>
Subject: Re: [PATCH seccomp 0/8] seccomp: add bitmap cache support on
 remaining arches and report cache in procfs
Message-ID: <202011031606.423EC9E@keescook>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Nov 03, 2020 at 07:42:56AM -0600, YiFei Zhu wrote:
> From: YiFei Zhu <yifeifz2@illinois.edu>
> 
> This patch series enables bitmap cache for the remaining arches with
> SECCOMP_FILTER, other than MIPS.
> 
> I was unable to find any of the arches having subarch-specific NR_syscalls
> macros, so generic NR_syscalls is used. SH's syscall_get_arch seems to
> only have the 32-bit subarch implementation. I'm not sure if this is
> expected.
> 
> This series has not been tested; I have not built all the cross compilers
> necessary to build test, let alone run the kernel or benchmark the
> performance, so help on making sure the bitmap cache works as expected
> would be appreciated. The series applies on top of Kees's for-next/seccomp
> branch.

Thank you! This looks good. I wonder if the different handling of little
endian is worth solving -- I'm suspicious about powerpc's use of
__LITTLE_ENDIAN__ vs a CONFIG, but I guess the compiler would match the
target endian-ness. Regardless, it captures what the architectures are
doing, and gets things standardized.

> 
> YiFei Zhu (8):
>   csky: Enable seccomp architecture tracking
>   parisc: Enable seccomp architecture tracking

I don't have compilers for these.

>   powerpc: Enable seccomp architecture tracking
>   riscv: Enable seccomp architecture tracking
>   s390: Enable seccomp architecture tracking

These I can build-test immediately.

>   sh: Enable seccomp architecture tracking
>   xtensa: Enable seccomp architecture tracking

These two are available in Ubuntu's cross compiler set, so I'll get them
added to my cross-builders.

>   seccomp/cache: Report cache data through /proc/pid/seccomp_cache

In the meantime, I'll wait a bit to see if we can get some Acks/Reviews
from arch maintainers. :)

-Kees

> 
>  arch/Kconfig                       | 15 ++++++++
>  arch/csky/include/asm/Kbuild       |  1 -
>  arch/csky/include/asm/seccomp.h    | 11 ++++++
>  arch/parisc/include/asm/Kbuild     |  1 -
>  arch/parisc/include/asm/seccomp.h  | 22 +++++++++++
>  arch/powerpc/include/asm/seccomp.h | 21 +++++++++++
>  arch/riscv/include/asm/seccomp.h   | 10 +++++
>  arch/s390/include/asm/seccomp.h    |  9 +++++
>  arch/sh/include/asm/seccomp.h      | 10 +++++
>  arch/xtensa/include/asm/Kbuild     |  1 -
>  arch/xtensa/include/asm/seccomp.h  | 11 ++++++
>  fs/proc/base.c                     |  6 +++
>  include/linux/seccomp.h            |  7 ++++
>  kernel/seccomp.c                   | 59 ++++++++++++++++++++++++++++++
>  14 files changed, 181 insertions(+), 3 deletions(-)
>  create mode 100644 arch/csky/include/asm/seccomp.h
>  create mode 100644 arch/parisc/include/asm/seccomp.h
>  create mode 100644 arch/xtensa/include/asm/seccomp.h
> 
> 
> base-commit: 38c37e8fd3d2590c4234d8cfbc22158362f0eb04
> --
> 2.29.2

-- 
Kees Cook

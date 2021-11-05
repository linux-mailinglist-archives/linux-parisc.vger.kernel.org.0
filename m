Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3C0446312
	for <lists+linux-parisc@lfdr.de>; Fri,  5 Nov 2021 13:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbhKEMDA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 5 Nov 2021 08:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbhKEMDA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 5 Nov 2021 08:03:00 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8009BC061205
        for <linux-parisc@vger.kernel.org>; Fri,  5 Nov 2021 05:00:20 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id f8so32391680edy.4
        for <linux-parisc@vger.kernel.org>; Fri, 05 Nov 2021 05:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=pcnnj//hupwk7SQwMIWvx0t9fgh62n4W8QNorpT6OJY=;
        b=Jma07cKAEI4TW7czLObhnkthaFhVT+2kwa9LD5ImDhkYPWguWkxLTqBX/RlULT0WtY
         ldRQdTVQj935EIYVjo1+QbKJOAxzxgHp25NvSCMcx9NtXleoaw6CJpcrLdeEFI8u+Rcq
         cgeRDTpOpfT/6RH7yzrFJr4XyvAjpdDcBgBlNttcwRxdDw1exAbRSrZWT22lkpGTRVcg
         NZ08Dcx7LIs0Mu1l/qfy8ugJAtSI+1fhZgpjls0n24PC9kfGtrSjIwq4EAupDUC0wATo
         csGpZ0iJEYed4Vk01EqItBIg0RhwFP2d8NDWzwNIwbU6PDYLwATnjIoS3ib9h/9s/kTX
         tGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=pcnnj//hupwk7SQwMIWvx0t9fgh62n4W8QNorpT6OJY=;
        b=GEbR61xoy44r9NCw4O2SFipz+X6cvHupBvfqP2vnfkPQguYd2hKoT18QpLDEShRdT2
         Rye/i/mEOgyU5LQsyqE8ljsXr+u1s/2W9WE9TdBO4uq8Z9ejYxz8BVijtfJPul+IdVcK
         G0WQKAcSxeSIVUhSWXWIvphIFJSGQfEcfHOLLDCRlPlxquyGhmcnEdOxHafe0xFcuVd4
         QaKy9WYrIz4dH2pXlwLasL6r5Zs9z3GEy7BMHY0uEr0CzNlcNTt957Y5FjjwJVu+WK35
         yeqYOnHrwXbnWMywMEIQwwYqG4A3tZI5C8P/7zLWeLH2KY44hD1QS7oSjTiiSAI3j73H
         UU7Q==
X-Gm-Message-State: AOAM530LW+B3nSV5OriX6Phx7nAq1rRAhyDhAgJ+INDOzA3js5pW10ok
        lPoGKBSu2EjurzUDa8A6s9oOHGE754QitsBwFPDkHOeZoWPLjw==
X-Google-Smtp-Source: ABdhPJwJddqHmQFI3QxfmHl88Y1SrBi0RlvXFvHY6FSHCvF2r+VYBojJN06trFSpxswQm2bWmTxNUBEG072RwJxO+4M=
X-Received: by 2002:a17:906:c302:: with SMTP id s2mr70650723ejz.499.1636113616961;
 Fri, 05 Nov 2021 05:00:16 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 5 Nov 2021 17:30:06 +0530
Message-ID: <CA+G9fYvPOHh_O4qtU=GKktTxR_G8tjFXjTsecSp2gTkHKeujSA@mail.gmail.com>
Subject: parisc: stacktrace.c:25:21: error: implicit declaration of function '__kernel_text_address'
To:     linux-parisc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

[Please ignore this email if it is already reported ]

Regression found on parisc gcc-8/9/10 and gcc-11 built with defconfig
Following build warnings / errors reported on linux next 20211105.

metadata:
    git_describe: next-20211105
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: b477ae38e815 (\"Add linux-next specific files for 20211105\")
    target_arch: parisc
    toolchain: gcc-11

build error :
--------------
<stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-Wcpp]
arch/parisc/kernel/stacktrace.c: In function 'walk_stackframe':
arch/parisc/kernel/stacktrace.c:25:21: error: implicit declaration of
function '__kernel_text_address'
[-Werror=implicit-function-declaration]
   25 |                 if (__kernel_text_address(info.ip))
      |                     ^~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:288:
arch/parisc/kernel/stacktrace.o] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/20U3L7IKgdLoEJQrfGdwlmczMDy/build.log

build config:
-------------
https://builds.tuxbuild.com/20U3L7IKgdLoEJQrfGdwlmczMDy/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch parisc --toolchain gcc-11
--kconfig defconfig


--
Linaro LKFT
https://lkft.linaro.org

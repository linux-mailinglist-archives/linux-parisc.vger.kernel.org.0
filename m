Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182EF43B878
	for <lists+linux-parisc@lfdr.de>; Tue, 26 Oct 2021 19:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbhJZRqm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 26 Oct 2021 13:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236575AbhJZRql (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 26 Oct 2021 13:46:41 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451D2C061745
        for <linux-parisc@vger.kernel.org>; Tue, 26 Oct 2021 10:44:17 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id h7so5997615ede.8
        for <linux-parisc@vger.kernel.org>; Tue, 26 Oct 2021 10:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=tmXVzuh5dkyrAII+ZVrZrBIPLN2O4THznBgHQCPFnbQ=;
        b=Dqi3PP/SSAWFWG3gfFkOGyGSEegQad3EgGyE34NDLLAELVK50eCq1MDlOhgmBPwOU6
         so2oMwx8riSKbOO2mzEapG+9A6CRdtzRiSu3Y2NZ918aQTUcvOnEQBpUTC0i7yFT18qw
         XvmE3p37xBMf/1zXADOuvDJFF8+rbErRKKvQ6WrLtvKyH7G9Jp1nujOWNxj50IVXj1wm
         BpYRzv7tWEq4TDOG+41TYA22vLr1Kg734dVaWfNKDwROR+iCblGttPlsJw1JRqIkUDFg
         EF5y6WjI+0R4VxsGN6ksjPs0HRVys6LuGpN9HdX8BTjsZwe4H7dpGfgVwHlCsQhkgT0U
         TA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=tmXVzuh5dkyrAII+ZVrZrBIPLN2O4THznBgHQCPFnbQ=;
        b=4dC6FdkWhscHJb0VgQeg1vWKIXGR0sctMgNfKnBK9Co28pY91c/XFzOfP0RQPgdKuC
         LUrFGMOuJQxmHoDcZo5JVuXxZvQzupJ4JXV7Q7o+KN+52GCOvuGp37bJfdGUtW5hksFB
         wq1f6pKxdkDXNw7be34srSIThXR59XkRh8L5N6Y48/ewcpPfiPcEMHPm3a3htLBvLNlz
         f1cJLVQJtW/BooLqLnnsuY1dKoqGNcXHOgP/yqfb8IdJuNa36i0A4l3CTgwVtDt4YKtE
         Yy7JwtNbh+QfYSqVI8KW4jSKYP0qGq98vKEiUp0NP/K50Umd1k5Z3+KMDrFo+sfr0xq5
         wz4Q==
X-Gm-Message-State: AOAM5326OtT0gwVgyW8ml1wIW8GjojQCY853Upt/n9ycNcUeuhMQgZAn
        BVsnAjRL90OG0N8BRu5a9r8ZZGA1znJ0QqVOFM+3njffZorLsQ==
X-Google-Smtp-Source: ABdhPJzpc5E2MH0dqfxYAdQeV4sDDHg8gxDgPhXTBuOBsaV+P2Ti1CzuJ28DAy8IRpeA3OQ6rZ34ANCraRU5f+j8IkI=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr23553041edu.357.1635270254187;
 Tue, 26 Oct 2021 10:44:14 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 26 Oct 2021 23:14:03 +0530
Message-ID: <CA+G9fYuAuu3vXMh_Re9Vcrne2BvAbJz=zujeoh5NQ8qmQqs2Mg@mail.gmail.com>
Subject: parisc: sched.h:2138:38: error: 'const struct thread_info' has no
 member named 'cpu'
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
Following build warnings / errors reported on linux next 20211026.

metadata:
    git_describe: next-20211026
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: 2376e5fe91bc (\"Add linux-next specific files for 20211026\")
    target_arch: parisc
    toolchain: gcc-10

build error :
--------------
In file included from <command-line>:
/builds/linux/include/linux/sched.h: In function 'task_cpu':
/builds/linux/include/linux/sched.h:2138:38: error: 'const struct
thread_info' has no member named 'cpu'
 2138 |  return READ_ONCE(task_thread_info(p)->cpu);
      |                                      ^~


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/202T6V9WW7HdyiYW1pERBsc94FT/build.log

build config:
-------------
https://builds.tuxbuild.com/202T6V9WW7HdyiYW1pERBsc94FT/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch parisc --toolchain gcc-10
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org

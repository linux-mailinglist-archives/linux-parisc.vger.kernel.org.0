Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C6841EAF5
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Oct 2021 12:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352642AbhJAKcf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 1 Oct 2021 06:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352687AbhJAKce (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 1 Oct 2021 06:32:34 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1435C061775
        for <linux-parisc@vger.kernel.org>; Fri,  1 Oct 2021 03:30:50 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id x7so31976951edd.6
        for <linux-parisc@vger.kernel.org>; Fri, 01 Oct 2021 03:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=QEE5+eR1PTRsf7Cn1O7pyaGGfFF+vSbOIpx5p0aBTl0=;
        b=CqEmUk3io5LxKbnJnIofkJShoydE3T5j+Eo8LRewYlm/6BpATFlKewrzPHkKd6+JJy
         ivPXQ6VtD1CSEikPoNgq5bMThRKdbVo0o0zC9d737DLdx6KXDqZx+czpwNN3ybSeRLgI
         iWeIye89fSKYWIdF0d4d3aGh9Jy/MTg3GOWWsykMePgoGkCMQ89mBBT+f1pSMuw0d8oA
         DcZ3xzRW+EqSDHSHWSaG328KbfsRX4XvSJF1H/9Kf7NhXq0sykWUGsATko43FvqUSeC4
         v1+mZZd3mCwj8EAVpetgYHCPPeWHjpUxVZfvLC1muBQGDEhSvE3ad5qpBTdEQZEQFZFp
         3irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=QEE5+eR1PTRsf7Cn1O7pyaGGfFF+vSbOIpx5p0aBTl0=;
        b=JMhh7dquia9/MVT7o+NPkfXOCogoMuNPJQbXbz6WtCT/LnxpQK0qGz2iCZAcUjTQMV
         f1TwAvCBqlkko90nBfKHlqnB1+qrb38xVv6W8QPsYd432XxoU6+cSjVGZMJPV3aWMFDN
         5xtiT5nvbqp/0KNnRcHIsmIhNPI6zZxgh75dLJz6moAGE6KMQydxV4WrUR6Mdy+nr3UA
         KJGGDj55EgQZkNctiWcE+oqlzqLEmoQeI4GdFaUPtgT2o3ytPC6+nHxOsQGAhBOpyLlS
         wx+cLYiRHW4euQ+gVvoIG/pe1ELkBDZXFajwqwHuJ1HJ74JqIY9NS30iBZcvFcENM0NW
         aS7w==
X-Gm-Message-State: AOAM530Dq1fWPvocqkFRXzD1DSF1WiM8q954jeMODxg9aWNQS25HBmeO
        0C9GH97zlthuKIMpNQi+hXrY7SXHvqF1S4L37i2LLQ==
X-Google-Smtp-Source: ABdhPJxOwe2DdMM4rV12tDoZFekSO5C3xyP/cXPE2zkP/P0J8YDu1zphyQs6RNWhfjff8e6CFoPBoxKq+N+rhnN4Nko=
X-Received: by 2002:a50:bf07:: with SMTP id f7mr13553425edk.288.1633084247906;
 Fri, 01 Oct 2021 03:30:47 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 1 Oct 2021 16:00:36 +0530
Message-ID: <CA+G9fYtsteSfwTQKV8o6VtBQDoz-+nwOf0s0X8BCkQHgAc6sdw@mail.gmail.com>
Subject: parisc/unwind: call callback with toplevel address
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
        James.Bottomley@hansenpartnership.com,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Following build errors noticed while building Linux next 20211001
with gcc-11 for parisc architecture.

arch/parisc/kernel/stacktrace.c: In function 'dump_trace':
arch/parisc/kernel/stacktrace.c:20:13: error: 'regs' undeclared (first
use in this function)
   20 |         if (regs)
      |             ^~~~
arch/parisc/kernel/stacktrace.c:20:13: note: each undeclared
identifier is reported only once for each function it appears in
arch/parisc/kernel/stacktrace.c:21:22: error: implicit declaration of
function 'fn' [-Werror=implicit-function-declaration]
   21 |                 if (!fn(cookie, regs->iaoq[0]))
      |                      ^~
arch/parisc/kernel/stacktrace.c:21:25: error: 'cookie' undeclared
(first use in this function)
   21 |                 if (!fn(cookie, regs->iaoq[0]))
      |                         ^~~~~~
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:288:
arch/parisc/kernel/stacktrace.o] Error 1

Build config:
https://builds.tuxbuild.com/1ytbtyEg5SDSQgS2Oj9RsCM4ZmS/config

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
-----------
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: a25006a77348ba06c7bc96520d331cd9dd370715
    git_short_log: a25006a77348 (\"Add linux-next specific files for 20211001\")
    kconfig:  defconfig
    kernel_version: 5.15.0-rc3
    target_arch: parisc
    toolchain: gcc-11

steps to reproduce:
https://builds.tuxbuild.com/1ytbtyEg5SDSQgS2Oj9RsCM4ZmS/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org

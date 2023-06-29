Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5431742178
	for <lists+linux-parisc@lfdr.de>; Thu, 29 Jun 2023 09:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbjF2HyN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 29 Jun 2023 03:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232312AbjF2HxH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 29 Jun 2023 03:53:07 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D8C3AB9
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jun 2023 00:52:06 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-44357f34e2dso127926137.3
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jun 2023 00:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688025125; x=1690617125;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZLnFw/rhyNnkKs7VhUTSusrlDu+a/hqARWLfQBAfCus=;
        b=e1gFertRcQikOot2EhUDUoNGyLTHb44LQhrMLA3GMk2XqXmGGp73q86/ndgO3SgHjt
         IBNrD/gR0NyMgjAo1nVNsrFINIKCb8IqR92voklA+dBCiKCiiC1/e1k9vhKbIC5e7e0N
         3u9JwSCRCXWshVoEUhUoDVRF3p5oi1/D9rTg5YUYKKvsoc8o/AZsjhLUpJrPbgh/orQ8
         tAzsg/RwtcrB5pCZ4f93RaHgsNNeyPz5fle83lB7iC6ftb6qx5okWamsVFIwLfn0FUYw
         LnK63ks85kxYMYpis/ygXpiXDqoG9S9AtHZweqW+o9E7WdAPJ2rt8v4FrZGqxJuvcx1s
         CPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688025125; x=1690617125;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLnFw/rhyNnkKs7VhUTSusrlDu+a/hqARWLfQBAfCus=;
        b=SvBQEN4BA1NjMt8b6EpRkv3+3I17mdL8wPJlhdGsvRH7MtmH2M9eWblMtJSY/Z0VNf
         qSkElVv05qvMuOPG2GZSrbt1ytulxz74w0+tE0/kfXvDu66Ro85Un7KdhxR4Amhu4grx
         9DTkKv5Ll2Pf/5/QG76Whk16ioZ1b0xNGiw/NIDIDw4VFP2PMDSzS8tt2vfTsrl5oWYJ
         hA2rlfCyMSme+lr4tNRARgEtzGTwACI3Wiy8x6cqHIgs/aN/zane79HDeirae1aDaTEm
         8vfzEPvdGQlGS8T/CQWrNxo+S+PLlgJu7zkQqxC69dnwqNHvn9w4af2ThBfmO2TFYxCq
         kbKA==
X-Gm-Message-State: AC+VfDzZmdmf/EgFMDb5McgxPA+zLJNMCAIY43unsxlOkG55FDkxehG5
        nSi8BwjqhRld8ZoWTrg5h2ZO9Z6mcmRGUv/WBdHa6hQ/qQwiOch9rxy4DQ==
X-Google-Smtp-Source: ACHHUZ4Lzn6G1FlXAnOJMjR8yY+dJ9LOlhxYC6pIrenEDAkO5eMTowbWoUDL5ITTHwdyK/TXL77NMQ6kKueHG6MHV9A=
X-Received: by 2002:a05:6102:ce:b0:443:69fd:3628 with SMTP id
 u14-20020a05610200ce00b0044369fd3628mr6682668vsp.13.1688025124920; Thu, 29
 Jun 2023 00:52:04 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 29 Jun 2023 13:21:53 +0530
Message-ID: <CA+G9fYsb4LCdjoXAz-o7myZfcCOQFdr2af68tYUP+JY17SikjQ@mail.gmail.com>
Subject: next: parisc: drivers/eisa/eisa-bus.c:436:19: error: conflicting
 types for 'eisa_init'; have 'int(void)'
To:     linux-parisc <linux-parisc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Helge Deller <deller@gmx.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Following build error noticed on parisc with defconfig with gcc-11 on
today's Linux next-20230629 tag.

Regressions found on parisc:

  - build/gcc-11-defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

drivers/eisa/eisa-bus.c:436:19: error: conflicting types for
'eisa_init'; have 'int(void)'
  436 | static int __init eisa_init(void)
      |                   ^~~~~~~~~
In file included from arch/parisc/include/asm/spinlock.h:7,
                 from arch/parisc/include/asm/atomic.h:22,
                 from include/linux/atomic.h:7,
                 from arch/parisc/include/asm/bitops.h:13,
                 from include/linux/bitops.h:68,
                 from include/linux/kernel.h:22,
                 from drivers/eisa/eisa-bus.c:8:
arch/parisc/include/asm/processor.h:324:13: note: previous declaration
of 'eisa_init' with type 'void(void)'
  324 | extern void eisa_init(void);
      |             ^~~~~~~~~
make[5]: *** [scripts/Makefile.build:243: drivers/eisa/eisa-bus.o] Error 1

Links,
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230629/testrun/17921584/suite/build/test/gcc-11-defconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230629/testrun/17921584/suite/build/test/gcc-11-defconfig/details/

Steps to reproduce:
============
# pip3 install -U --user tuxmake
#
# Or install a deb/rpm depending on the running distribution
# See https://tuxmake.org/install-deb/ or
# https://tuxmake.org/install-rpm/
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch parisc --toolchain gcc-11
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org

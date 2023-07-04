Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668F1746A3F
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jul 2023 09:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjGDHB0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jul 2023 03:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbjGDHBY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jul 2023 03:01:24 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9E4E47
        for <linux-parisc@vger.kernel.org>; Tue,  4 Jul 2023 00:01:11 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7919342c456so1251774241.2
        for <linux-parisc@vger.kernel.org>; Tue, 04 Jul 2023 00:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688454070; x=1691046070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9pLLIHKvmmk4zC9SwsHcTfPMPfVegexthgZQWT/NwCU=;
        b=a+pGwLbbwJCReamWGknbZ4TgzzLts/gLAaV9nWXDmYXu0RTVp+HIc+Pa5JAYWjgpdF
         H3fX/q7DfDx0zMsbAPblAmXluwU/A9dc0AhZezBWT79vpiLO+o1tuCH6sGyzqFChV2dC
         Uc1eqxPxYnhMHR4q6neEN0OIycj2nx/jme2PN/0FqU44PITVQ/4tg+vyfWar0vJmN1eO
         fP+xS2MijKwNJc4tHpHwMpSqMHBYMnThA8K7aVAiPcJOekMHvfxGmpnIPr97LeieNmJW
         SQczBMVI3gEGRq3onvjyWCQhxP0OHv0lDiSOehDBzyPnTlqafLzgjAM6ds8/zcm+lGjV
         d7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688454070; x=1691046070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pLLIHKvmmk4zC9SwsHcTfPMPfVegexthgZQWT/NwCU=;
        b=Aez+KlpHd9lJp2QXQmZ+jk4EHSvvkgNuFELsprlu/RJa98cjlyzeWb2MzVrv8SJu3F
         76hZqKSXTU/wCH12kkqSXufvYkiw9NsOidzOfiyQzgbNVti6omx9yrd11KzAjhEu9yeT
         /Fy0i/hMNe+8sgIoeh7F3UwflBifMWcbXOgTfSKgcDrArg30Fq9lJ6PlU6Z8K3rgOtpv
         xO88WMwg9h4zTIz0TiP5RctVUzaTVU6F/1RkfUZjtDBJHyf3CkyQoUsuaFmjLqFJ7FHU
         pTJMV9j1OX+6nXqG9ln0D5phTmYojLbq703AVv6YJD4r7jUmhr+GNxXYJYlTtFjV4PtB
         hXEg==
X-Gm-Message-State: ABy/qLZryODFvyKRPftUrw0SiENL/1AtnmV3dT6HPhZdOgdkuuv6D+Nl
        0p2a62YfrmuaKyjwW5EBbNQ5677nDaFNca5rzt7NNg==
X-Google-Smtp-Source: APBJJlHHFru7hehy/Zd70AaP3FWkvc1cUSv1H/u4Os+sP54Zrm6/BsfpbzuKyGRVs/aUbzDELUweyKecQMONkFL4CGM=
X-Received: by 2002:a67:f413:0:b0:444:c294:afc7 with SMTP id
 p19-20020a67f413000000b00444c294afc7mr3671389vsn.26.1688454070103; Tue, 04
 Jul 2023 00:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230703184518.896751186@linuxfoundation.org>
In-Reply-To: <20230703184518.896751186@linuxfoundation.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 4 Jul 2023 12:30:58 +0530
Message-ID: <CA+G9fYueycAbx7DDR3S57d43UX49SOGnW6igQUZ0voEcapxdYw@mail.gmail.com>
Subject: Re: [PATCH 5.15 00/15] 5.15.120-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Helge Deller <deller@gmx.de>
Cc:     stable@vger.kernel.org, patches@lists.linux.dev,
        linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
        patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
        jonathanh@nvidia.com, f.fainelli@gmail.com,
        sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
        conor@kernel.org, Vishal Bhoj <vishal.bhoj@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 4 Jul 2023 at 00:27, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.120 release.
> There are 15 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 05 Jul 2023 18:45:08 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.120-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Following build regressions noticed on stable-rc 5.15.
This build failure started happening from v5.15.119 from date June 28, 2023.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on parisc:

  - build/gcc-11-allnoconfig
  - build/gcc-11-defconfig
  - build/gcc-11-tinyconfig

Build errors:
=============
arch/parisc/include/asm/assembly.h: Assembler messages:
arch/parisc/include/asm/assembly.h:75: Error: symbol `sp' is already defined
arch/parisc/include/asm/assembly.h:77: Error: symbol `ipsw' is already defined
make[3]: *** [scripts/Makefile.build:391: arch/parisc/kernel/head.o] Error 1
arch/parisc/include/asm/assembly.h: Assembler messages:

Links:
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.119-16-g66130849c020/testrun/18074467/suite/build/test/gcc-11-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.119-16-g66130849c020/testrun/18074467/suite/build/test/gcc-11-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.119-16-g66130849c020/testrun/18074467/suite/build/test/gcc-11-defconfig/history/


--
Linaro LKFT
https://lkft.linaro.org

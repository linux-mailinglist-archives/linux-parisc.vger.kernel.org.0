Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96120744A33
	for <lists+linux-parisc@lfdr.de>; Sat,  1 Jul 2023 17:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjGAPBd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 1 Jul 2023 11:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjGAPBb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 1 Jul 2023 11:01:31 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C792535B3
        for <linux-parisc@vger.kernel.org>; Sat,  1 Jul 2023 08:01:29 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-991ef0b464cso517676566b.0
        for <linux-parisc@vger.kernel.org>; Sat, 01 Jul 2023 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688223688; x=1690815688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0wvLshWsSLBZ/5yypeB0xY2a5lfsRQLT8GONX/h7vZc=;
        b=ARt2o/jiV346YpinaI4g0C9d2ukD1dF4Fk57D3cEc2+pRK1qYqS7M7I2P/f37v+3Wl
         Wb7ufZqu3vV/kbUd0jiN5q383MBhT1CAgAG60fwdUhvOy3OF00k2ASUzJZQMEaaX2eW6
         UgHYu6xfxCfkDIzYSeujn2YUYMQhKCGaHHfxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688223688; x=1690815688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wvLshWsSLBZ/5yypeB0xY2a5lfsRQLT8GONX/h7vZc=;
        b=DNvX8dv6PnHiNFesn7P0SF7Lp/6XIv/S5rJgdbLKawj1gmSl3ndOmVG5OFtm7s9l+W
         U1dnVRV4KAfrXt4NnmpCEfiDrLqC+ip6fy3wC4Hb8F6Ck2fX70iIppHl3luC+AI9EXbA
         LR3t/9MckzGtaBr9EJoYoPGS6zm92CwuwYmGlZfy3i8t+hX/i8MPrQtPgFFoh/Xv48pw
         s1HbCza0CdguUBElEISCDNS8lejGJa2YBP4y7rvaQgTdHiBdARjXz6XrtYJirXezwrCf
         Ol+TJAbkpotDFuqwfLxNRsVHfKsZ1dDLypD0/OhjcuMbs1g1TC49qsPwFTVLFYFq5vkF
         w8Lw==
X-Gm-Message-State: AC+VfDyMa7VD2gMtoO/ZhqPyo8+0TGzPM/qERwubJTSVFXMOdbfWuO8B
        0IpTtzUpxyfzNzFI93nV8o6PQUiuNNLIqn40layStW6t
X-Google-Smtp-Source: ACHHUZ5lC/Q/nE25iQ8V4Ia6OxUWapE5IMV1QrLSash9lrQpUUXHXtSdEOpDEMuvCl1w5XLH2bCHYg==
X-Received: by 2002:a17:907:d8f:b0:98e:3935:60f4 with SMTP id go15-20020a1709070d8f00b0098e393560f4mr8596900ejc.1.1688223688348;
        Sat, 01 Jul 2023 08:01:28 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id w26-20020a17090652da00b00992acab8c45sm3306955ejn.12.2023.07.01.08.01.28
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 08:01:28 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so5073354a12.0
        for <linux-parisc@vger.kernel.org>; Sat, 01 Jul 2023 08:01:28 -0700 (PDT)
X-Received: by 2002:aa7:d047:0:b0:51b:f862:7b6a with SMTP id
 n7-20020aa7d047000000b0051bf8627b6amr9564270edo.14.1688223687666; Sat, 01 Jul
 2023 08:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230629184151.888604958@linuxfoundation.org> <CA+G9fYsM2s3q1k=+wHszvNbkKbHGe1pskkffWvaGXjYrp6qR=g@mail.gmail.com>
 <CAHk-=whaO3RZmKj8NDjs4f6JEwuwQWWesOfFu-URzOqTkyPoxw@mail.gmail.com>
 <fbe57907-b03f-ac8c-f3f4-4d6959bbc59c@roeck-us.net> <CAHk-=wgE9iTd_g20RU+FYa0NPhGSdiUDPW+moEqdHR4du1jmVA@mail.gmail.com>
 <CAHk-=wiN5H-2dh2zCo_jXE7_ekrxSHvQcMw4xfUKjuQs2=BN4w@mail.gmail.com>
 <fb63ea7b-c44b-fb1b-2014-3d23794fa896@roeck-us.net> <CAHk-=whh_aUHYF6LCV36K9NYHR4ofEZ0gwcg0RY5hj=B7AT4YQ@mail.gmail.com>
 <e4dd115b-1a41-4859-bbeb-b3a6a75bf664@roeck-us.net> <CAHk-=wgBAhFqD6aoD2rL0qws8S1erdbrvmQXuYi=ZFEUVNuVfg@mail.gmail.com>
 <CAMo8BfJ+FcR8ZfNk8GNL5pRsJO13O=on8ewRHSJkuQ85_WPk0A@mail.gmail.com>
In-Reply-To: <CAMo8BfJ+FcR8ZfNk8GNL5pRsJO13O=on8ewRHSJkuQ85_WPk0A@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 1 Jul 2023 08:01:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgy=8CEGoGJnHkuz4p0pR+Q-5RvsM4VNyYeWabshYr5yQ@mail.gmail.com>
Message-ID: <CAHk-=wgy=8CEGoGJnHkuz4p0pR+Q-5RvsM4VNyYeWabshYr5yQ@mail.gmail.com>
Subject: Re: [PATCH 6.4 00/28] 6.4.1-rc1 review
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Chris Zankel <chris@zankel.net>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, patches@lists.linux.dev,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        shuah@kernel.org, patches@kernelci.org,
        lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
        f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
        srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
        linux-parisc <linux-parisc@vger.kernel.org>,
        sparclinux@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Helge Deller <deller@gmx.de>,
        Jason Wang <wangborong@cdjrlc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 1 Jul 2023 at 03:32, Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Thanks for the build fix. Unfortunately despite being obviously correct
> it doesn't release the mm lock in case VMA is not found, so it results
> in a runtime hang. I've posted a fix for that.

Heh. I woke up this morning to that feeling of "Duh!" about this, and
find you already had fixed it. Patch applied.

            Linus

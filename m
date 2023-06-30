Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 254D17434DB
	for <lists+linux-parisc@lfdr.de>; Fri, 30 Jun 2023 08:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbjF3GQo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 30 Jun 2023 02:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbjF3GQn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 30 Jun 2023 02:16:43 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B544A268A
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jun 2023 23:16:41 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so2234088e87.3
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jun 2023 23:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688105800; x=1690697800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uhmn3RW3fCZZK1xj84ra9lbrAgT4ezYFSHn/zPTSsl0=;
        b=X5ZywbJZoGy8KJYcyA5gRYsmEEWHVlTYNYdy/QQHPb9oZ4GIHIXB0Ex5coZiJnJyVB
         gH/P26N1m8YaaVpLpbzPY986HZ3R2SDzICxhRvqFo3p0sfBxKtbzrt8XD8DOZ8zC4da8
         GOHpeTf4JM9qhLojqURbeY9D0I22cTD6s924Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688105800; x=1690697800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uhmn3RW3fCZZK1xj84ra9lbrAgT4ezYFSHn/zPTSsl0=;
        b=fD6hZ2x0TZDUuuyQcFBaynWC2+cbURkN6IS4bbd3c6mTsA3XzfPVnlR8NZaN5VbEay
         f22/HBAhwDaqqAwqy9aEYDqgUsMVXiExT791yZ+CqxkAF0DDQjd2t8MD+L5pAF07+I9Z
         Ut0bt+33Gmw+0KhCYGEiKfmOzIOpL8ootQPsZNlgcfsSHixA7lzAfEav4WtxnQJW6XFO
         AuERw4nMS+07R0xwtHYTo63p3Z1VuvI0MbmOnbMKdQgOl+Z9fQI5ejWuAPWg19bsaLDa
         FMvZSq/qWG3/aHCRqClIW5FY6kOjzWTEeveCcGXafLR6LQ+Ol05odD5CxL6I/q0g4BIq
         8ZXw==
X-Gm-Message-State: ABy/qLa+BfUe9R73+f4jqCnWhqIpU2+9+LHctUT6TeWl/N6i6bHPFu00
        /RCiHeeXTzGX5dsTBEBYGg7sAaDFd211LO8g1oZ5Xp2y
X-Google-Smtp-Source: APBJJlGlucipzZZ3BxFegr2APzt4og53Bx3h19SdIi98mMMh5c45IOgx6IxuVTXCe2HnF97ouckirw==
X-Received: by 2002:a19:675a:0:b0:4f8:6d99:f4f3 with SMTP id e26-20020a19675a000000b004f86d99f4f3mr1303242lfj.52.1688105799839;
        Thu, 29 Jun 2023 23:16:39 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id z17-20020ac24191000000b004f846cd74bcsm880027lfh.245.2023.06.29.23.16.39
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 23:16:39 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b6985de215so24309751fa.2
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jun 2023 23:16:39 -0700 (PDT)
X-Received: by 2002:a2e:870f:0:b0:2b6:99a3:c254 with SMTP id
 m15-20020a2e870f000000b002b699a3c254mr1390190lji.26.1688105798765; Thu, 29
 Jun 2023 23:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230629184151.888604958@linuxfoundation.org> <CA+G9fYsM2s3q1k=+wHszvNbkKbHGe1pskkffWvaGXjYrp6qR=g@mail.gmail.com>
In-Reply-To: <CA+G9fYsM2s3q1k=+wHszvNbkKbHGe1pskkffWvaGXjYrp6qR=g@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 29 Jun 2023 23:16:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=whaO3RZmKj8NDjs4f6JEwuwQWWesOfFu-URzOqTkyPoxw@mail.gmail.com>
Message-ID: <CAHk-=whaO3RZmKj8NDjs4f6JEwuwQWWesOfFu-URzOqTkyPoxw@mail.gmail.com>
Subject: Re: [PATCH 6.4 00/28] 6.4.1-rc1 review
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, patches@lists.linux.dev,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
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

On Thu, 29 Jun 2023 at 22:31, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> arch/parisc/mm/fault.c: In function 'do_page_fault':
> arch/parisc/mm/fault.c:292:22: error: 'prev' undeclared (first use in this function)
>   292 |                 if (!prev || !(prev->vm_flags & VM_GROWSUP))

Bah. "prev" should be "prev_vma" here.

I've pushed out the fix. Greg, apologies. It's

   ea3f8272876f parisc: fix expand_stack() conversion

and Naresh already pointed to the similarly silly sparc32 fix.

             Linus

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF30B743545
	for <lists+linux-parisc@lfdr.de>; Fri, 30 Jun 2023 08:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjF3Gr3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 30 Jun 2023 02:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbjF3Gr2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 30 Jun 2023 02:47:28 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889EB35A5
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jun 2023 23:47:25 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6b98ac328so23457751fa.0
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jun 2023 23:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688107643; x=1690699643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zlchbRYXZ2GmgikakdfRkYq9RUe43aExK7E5sqwL0Bw=;
        b=OVM0ZV3RlyGGrzqXh/mYvoDZ5ojO6xDLhkM+h9nlpBjAJdWSXNvxPWWSHpG4c/kb4x
         Lm1vrIizQ0GK71+cqFpC4vDwoa0Q/Nbv1tAv2wZzBwsBzkljWsffXJsWoNmrQLselfDp
         jGVWIsBfkJ7mQKMorzGKto7GvzyKZlgUROgrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688107643; x=1690699643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlchbRYXZ2GmgikakdfRkYq9RUe43aExK7E5sqwL0Bw=;
        b=ADyKY80PWrPWFkRDHady9ZJBWrPa54Jjx61VykyMSDfIYu2gd7RbQ4faaDyOCxcfyj
         4G/JJJPVq4v17lOpjCovclWRYIdMMkFdFgspnqxW/aESaeZJIRq+hzifGUoRch6yaKI/
         Gyvpk7qsa9d5pL0szAKfaR94ZWKI1PMSxPKbBKoY7nxdFspGARCGJsiaQBwRwyy6zGrL
         7E4pcR+W8v/WYsvuB4+u3kUtt+7bKJQB8qBBiWBRO84Zw6hs5PcL6PxcPANNpRDDvDbA
         geK7QCUPK/3bv0lTfSLd5vVVOp26caiJvwpyb2WbKSy8yUk2wxRF8+SF7tksDrn3DX4b
         HCSQ==
X-Gm-Message-State: ABy/qLYboNdg79FoFz9gkylKERtfEuyLJdGr8eTeTT8KloZ7OYaZBFP/
        /SNKA1/+2dLZDjuYS21qFvqp+n8oMROUnq+DaHxp5T6O
X-Google-Smtp-Source: APBJJlHaxys/uIWQCQVENtbHZiiOvaaRVCsHnhDGIgLNICk/j4l/PsE8r7XrTekJm4Em/4gsDkRN6w==
X-Received: by 2002:a2e:9997:0:b0:2b6:bab5:f4f4 with SMTP id w23-20020a2e9997000000b002b6bab5f4f4mr1436096lji.10.1688107643598;
        Thu, 29 Jun 2023 23:47:23 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id lj14-20020a170906f9ce00b00992bea2e9d2sm1160413ejb.62.2023.06.29.23.47.21
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 23:47:22 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51d9123a8abso1625889a12.2
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jun 2023 23:47:21 -0700 (PDT)
X-Received: by 2002:a05:6402:217:b0:51d:7ed9:c65 with SMTP id
 t23-20020a056402021700b0051d7ed90c65mr915784edv.21.1688107641560; Thu, 29 Jun
 2023 23:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230629184151.888604958@linuxfoundation.org> <CA+G9fYsM2s3q1k=+wHszvNbkKbHGe1pskkffWvaGXjYrp6qR=g@mail.gmail.com>
 <CAHk-=whaO3RZmKj8NDjs4f6JEwuwQWWesOfFu-URzOqTkyPoxw@mail.gmail.com>
 <fbe57907-b03f-ac8c-f3f4-4d6959bbc59c@roeck-us.net> <CAHk-=wgE9iTd_g20RU+FYa0NPhGSdiUDPW+moEqdHR4du1jmVA@mail.gmail.com>
In-Reply-To: <CAHk-=wgE9iTd_g20RU+FYa0NPhGSdiUDPW+moEqdHR4du1jmVA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 29 Jun 2023 23:47:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiN5H-2dh2zCo_jXE7_ekrxSHvQcMw4xfUKjuQs2=BN4w@mail.gmail.com>
Message-ID: <CAHk-=wiN5H-2dh2zCo_jXE7_ekrxSHvQcMw4xfUKjuQs2=BN4w@mail.gmail.com>
Subject: Re: [PATCH 6.4 00/28] 6.4.1-rc1 review
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
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

On Thu, 29 Jun 2023 at 23:33, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Oh well.  We'll get them all. Eventually. Let me go fix up that csky case.

It's commit e55e5df193d2 ("csky: fix up lock_mm_and_find_vma() conversion").

Let's hope all the problems are these kinds of silly - but obvious -
naming differences between different architectures.

Because as long as they cause build errors, they may be embarrassing,
but easy to find and notice.

I may not have cared enough about some of these architectures, and it
shows. sparc32. parisc. csky...

             Linus

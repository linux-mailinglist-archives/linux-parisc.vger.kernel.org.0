Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECBEF74351B
	for <lists+linux-parisc@lfdr.de>; Fri, 30 Jun 2023 08:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbjF3GeG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 30 Jun 2023 02:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbjF3GeF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 30 Jun 2023 02:34:05 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B2E2D71
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jun 2023 23:34:04 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98377c5d53eso174623666b.0
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jun 2023 23:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688106843; x=1690698843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TpIIQ08qfNEuob2XBLG/PQlcqkOfTkfohi2v2vX8ccE=;
        b=M2TBpBxIoHxKCHngKt32vUluBC4EJdqoYOVETJ7o+8oH09CY6BShREL8qj56C6356X
         5q3XGeGw9IJacNLJzP0IKB2VtPNs0Bg8sJThD1TefnyJEjI0iWLHlryGHkNUmFHM1S+w
         BtATWIITfAqQhH/6AQDQTS9JcuwoFVpAEkFnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688106843; x=1690698843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpIIQ08qfNEuob2XBLG/PQlcqkOfTkfohi2v2vX8ccE=;
        b=HorXlhHbvuA40WEldeTGnZbs/OkfR16JdRgivUJMGCB2QyZ1eEsvj9tIxa9fQZDbcZ
         EzQG4C13Foa3myNiN/LRtj/NlCwRsNP01Kk7U5b9+uoX8QfxcPikBn8Ex8NbykKZPI9V
         f2rTv02Hp9CsPQXZOeowa5fGKUYw0M1n841rLIxl5oPy5uTtbJypMBR8lyVcQDxv+ARJ
         VPXexJLSlpW3Pgqj3t7veRYn6FyoxMUJgstDBQqu4MAUIGTsBdKluI7QB117KGNIZMHO
         DQXvRl96Yp7PvuQyeyZnqTTkhlsHMVlBoIjillG9uE/PhLMIK3cip6t2PLNgBYtAKteC
         BIig==
X-Gm-Message-State: ABy/qLaSfBaMcCO6FRGF9FMkU7g51n3ZnYD8blJ8IwP+TQ+aYVb+hhYo
        IVbYQCO3gPNU/2gjmnfZesB3FML86OzDu+lWkPQWMaSc
X-Google-Smtp-Source: APBJJlGTm+64vQ8SKe6MSOnByQgX+PHEE948TrbeXY789Rc6ZT2l2e4b16KyE+0yNJIH7ydxDAWHeA==
X-Received: by 2002:a17:907:1742:b0:974:183a:54b6 with SMTP id lf2-20020a170907174200b00974183a54b6mr1023663ejc.33.1688106843138;
        Thu, 29 Jun 2023 23:34:03 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id z18-20020a1709067e5200b00989257be620sm7596378ejr.200.2023.06.29.23.34.02
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 23:34:03 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51d9890f368so1621171a12.2
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jun 2023 23:34:02 -0700 (PDT)
X-Received: by 2002:aa7:d551:0:b0:51d:af77:d201 with SMTP id
 u17-20020aa7d551000000b0051daf77d201mr909491edr.18.1688106842535; Thu, 29 Jun
 2023 23:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230629184151.888604958@linuxfoundation.org> <CA+G9fYsM2s3q1k=+wHszvNbkKbHGe1pskkffWvaGXjYrp6qR=g@mail.gmail.com>
 <CAHk-=whaO3RZmKj8NDjs4f6JEwuwQWWesOfFu-URzOqTkyPoxw@mail.gmail.com> <fbe57907-b03f-ac8c-f3f4-4d6959bbc59c@roeck-us.net>
In-Reply-To: <fbe57907-b03f-ac8c-f3f4-4d6959bbc59c@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 29 Jun 2023 23:33:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgE9iTd_g20RU+FYa0NPhGSdiUDPW+moEqdHR4du1jmVA@mail.gmail.com>
Message-ID: <CAHk-=wgE9iTd_g20RU+FYa0NPhGSdiUDPW+moEqdHR4du1jmVA@mail.gmail.com>
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

On Thu, 29 Jun 2023 at 23:29, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Did you see that one (in mainline) ?
>
> Building csky:defconfig ... failed

Nope. Thanks. Obvious fix: 'address' is called 'addr' here.

I knew we had all these tiny little mazes that looked the same but
were just _subtly_ different, but I still ended up doing too much
cut-and-paste.

And I only ended up cross-compiling the fairly small set that I had
existing cross-build environments for. Which was less than half our
~24 different architectures.

Oh well.  We'll get them all. Eventually. Let me go fix up that csky case.

              Linus

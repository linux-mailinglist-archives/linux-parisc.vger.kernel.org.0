Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73FD1407F99
	for <lists+linux-parisc@lfdr.de>; Sun, 12 Sep 2021 21:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235928AbhILTNQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 Sep 2021 15:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbhILTNM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 Sep 2021 15:13:12 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54273C061574
        for <linux-parisc@vger.kernel.org>; Sun, 12 Sep 2021 12:11:57 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id h1so13101846ljl.9
        for <linux-parisc@vger.kernel.org>; Sun, 12 Sep 2021 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E1PHZ6ydkqEkrZPVcY11k8G+o6nXM73c5JaOIi36jdM=;
        b=Mmh3TCnuXic/hCA6XvkP2osD5zmauEUtEa852ODITJl9q7DRJZnlYFaFYG+mxH6vf6
         Z+ggUrlsmP9EQRyIHakVw8bJD81GHQopdHiqd4QBP+UGydXePHYv5SH2cpjAaKjOE5af
         i5L6vjez7vZKGjXnjuCG5wVITdXtC1IYH3rOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E1PHZ6ydkqEkrZPVcY11k8G+o6nXM73c5JaOIi36jdM=;
        b=qR38owOQx/Dev7mBGc+gz6U3cUyrg/Gd2LdW/PHMdzjADFAAVLySD4G0as7Ak1jIHi
         CB0IcPcn0b0Q5ketBLl5Fh2dogiokEv2wEmptGcZU1tp0Qa7DAbFiLPgO/LVARtxCmIZ
         BXhl3ytAgfaVSbB4v7fpd/tpFL4Nv2pvLUkLK67Coo/J7nZW+ZBNFEUxiAYRrdbE0Vq+
         ogpey3ePPzkdJhiMeOKRvCCEvDTQg2e2xMXQQVTykJbRUCQqiWZxCMRfqQoxi4aXJehq
         qgMKlQrwbFZQaTwXWhayWp3W2WHJban+pavG8XdJyxgvMvCIfd3rZa6WVlqwVK+KHREq
         sEPA==
X-Gm-Message-State: AOAM532LC2lHjZHNULN3d/1IRFHJ0p4UXFUV155BGB/6h2F4MZLYNocs
        uYXk863C96kd17TRPlsm3muy+R4U2fTePZQEsFE=
X-Google-Smtp-Source: ABdhPJwdhqAffyGPd9ek4LN122hv38UYEP5zkV5/dkBpuKjdj/dirdLbZ4Z38IShUl5Kf/OTptytXg==
X-Received: by 2002:a2e:8816:: with SMTP id x22mr7367983ljh.264.1631473915450;
        Sun, 12 Sep 2021 12:11:55 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id k16sm593509lfj.231.2021.09.12.12.11.54
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Sep 2021 12:11:54 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id x27so16248172lfu.5
        for <linux-parisc@vger.kernel.org>; Sun, 12 Sep 2021 12:11:54 -0700 (PDT)
X-Received: by 2002:a05:6512:3d04:: with SMTP id d4mr6147162lfv.474.1631473913911;
 Sun, 12 Sep 2021 12:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210912160149.2227137-1-linux@roeck-us.net> <20210912160149.2227137-4-linux@roeck-us.net>
In-Reply-To: <20210912160149.2227137-4-linux@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 12 Sep 2021 12:11:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi1TBvyk7SWX+5LLYN8ZnTJMut1keQbOrKCG=nb08hdiQ@mail.gmail.com>
Message-ID: <CAHk-=wi1TBvyk7SWX+5LLYN8ZnTJMut1keQbOrKCG=nb08hdiQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] parisc: Use absolute_pointer for memcmp on fixed
 memory location
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, Sep 12, 2021 at 9:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> -       running_on_qemu = (memcmp(&PAGE0->pad0, "SeaBIOS", 8) == 0);
> +       running_on_qemu = (memcmp(absolute_pointer(&PAGE0->pad0), "SeaBIOS", 8) == 0);

This seems entirely the wrong thing to do, and makes no sense. That
"&PAGE0->pad0" is a perfectly valid pointer, and that's not where the
problem is.

The problem is "PAGE0" itself:

    #define PAGE0   ((struct zeropage *)__PAGE_OFFSET)

which takes that absolute offset and creates a pointer out of it.

IOW, _that_ is what should have the "absolute_pointer()" thing, and in
that context the name of that macro and its use actually makes sense.

No?

An alternative - and possibly cleaner - approach that doesn't need
absolute_pointer() at all might be to just do

        extern struct zeropage PAGE0;

and then make that PAGE0 be defined to __PAGE_OFFSET in the parisc
vmlinux.lds.S file.

Then doing things like

        running_on_qemu = !memcmp(&PAGE0.pad0, "SeaBIOS", 8);

would JustWork(tm).

Hmm?

             Linus

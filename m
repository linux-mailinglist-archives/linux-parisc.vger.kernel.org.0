Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAD340822F
	for <lists+linux-parisc@lfdr.de>; Mon, 13 Sep 2021 01:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236622AbhILXGT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 Sep 2021 19:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236546AbhILXGS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 Sep 2021 19:06:18 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCF0C061574
        for <linux-parisc@vger.kernel.org>; Sun, 12 Sep 2021 16:05:03 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id y6so13835318lje.2
        for <linux-parisc@vger.kernel.org>; Sun, 12 Sep 2021 16:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X35Fq5OT81Nr4I6Qbip78STPxqD/PDV+RfIaRcMXDmA=;
        b=M7RyeS9xLb3mVaGM35ZObppxdx3xXQJgghifuu8UVsRcqA3tbQu/b3NBc4q9G58Skc
         TooyKBQ11SGfPWSLHHrBcpkzM1JhOK+0oM7hKbEmTR97BKf+c74T2tMKjBtHYbQLqmvW
         URtAxnOjLh0lc9MI1zr/I99Zl6xDfwYZhCri4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X35Fq5OT81Nr4I6Qbip78STPxqD/PDV+RfIaRcMXDmA=;
        b=3Y8MdHL9TFeHxlpgT/34YgG8+S6nN8NzImiOtdKHKWyWCp9kbGDOSX9CPJFk69sPCc
         dTFRzXb5M1lRGF1vc5bo+iGIjbfV/yUay52PRVM3n3iP34uHCxeYSNH0ROCUNsaF+rrT
         6mob3gB9l3vOavZIL+yZ9vRCYdJjnmbT5GBzqf0+5Gu9hApST/GzrYgScHxzus9kN19x
         ELV3LbALiKWKf59ohGT8ckqVhpFJwe4QHGLQ9W0A0eV5W+PpzCI+Y4FUPqgNXJlsrm6i
         Z/1kuPsi9JKBRRoeZ3CDHB3OTHFaQ5uBbB3ht+UyhikcuPr8tvMapA3PxY0wwUCkT8XC
         iITw==
X-Gm-Message-State: AOAM532TZvJLlQ22f/bDY1efb4hWAysmqB8Wbtzhml2X50sE5rzgq/OK
        sspv4nCU+DIArKp0PQZ26HlOueEZ4P3StPJL378=
X-Google-Smtp-Source: ABdhPJyw7AsLq45Ci5RjrL49nVl7JGP9lx5RJ252zi8G5imAFtazOT/3jz3jlHa70pYSvLJJr1m4/w==
X-Received: by 2002:a2e:9247:: with SMTP id v7mr7764368ljg.97.1631487901983;
        Sun, 12 Sep 2021 16:05:01 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id k20sm638485lfm.93.2021.09.12.16.05.01
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Sep 2021 16:05:01 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id l11so17059403lfe.1
        for <linux-parisc@vger.kernel.org>; Sun, 12 Sep 2021 16:05:01 -0700 (PDT)
X-Received: by 2002:a2e:8107:: with SMTP id d7mr8107686ljg.68.1631487533580;
 Sun, 12 Sep 2021 15:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210912160149.2227137-1-linux@roeck-us.net> <20210912160149.2227137-5-linux@roeck-us.net>
 <CAHk-=wi1=8shingNuo1CtfJ7eDByDsmwsz750Nbxq=7q0Gs+zg@mail.gmail.com> <0f36c218-d79c-145f-3368-7456dd39a3f2@roeck-us.net>
In-Reply-To: <0f36c218-d79c-145f-3368-7456dd39a3f2@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 12 Sep 2021 15:58:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi11WAHpJi8KDbbp7FGcqnfkB3r6TZqnZeOKvfYGCOsaQ@mail.gmail.com>
Message-ID: <CAHk-=wi11WAHpJi8KDbbp7FGcqnfkB3r6TZqnZeOKvfYGCOsaQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] alpha: Use absolute_pointer for strcmp on fixed
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

On Sun, Sep 12, 2021 at 1:37 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> COMMAND_LINE is, for whatever reason, defined in
> arch/alpha/include/uapi/asm/setup.h, ie in the uapi.
>
> Can I even touch that ?

I think that's entirely a historical accident.

Note how most of those #define's don't even work for user space
because they use PAGE_OFFSET, which is defined in <asm/page.h>. And
others depend on the kernel config system.

There's a couple that do seem to be potentially for user space (MILO
bootloader), and who knows just what hacks that code might have with
internal knowledge of this header file. But anything I can find on the
net seems to predate our move to 'uapi' headers, so I wouldn't really
worry about it.

So I'd suggest just moving that whole file back to <asm/setup.h>,
changing it as necessary, and then seeing if anybody notices.

Because I suspect the answer to that is just crickets chirping..

              Linus

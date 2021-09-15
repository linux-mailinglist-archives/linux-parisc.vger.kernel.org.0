Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96F840CD17
	for <lists+linux-parisc@lfdr.de>; Wed, 15 Sep 2021 21:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbhIOTUh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 Sep 2021 15:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbhIOTUh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 Sep 2021 15:20:37 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFD4C061575
        for <linux-parisc@vger.kernel.org>; Wed, 15 Sep 2021 12:19:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c8so8595993lfi.3
        for <linux-parisc@vger.kernel.org>; Wed, 15 Sep 2021 12:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRAe5/tE1Mx+glbEumA/10LHbf2sLTrpOcfg2d46p4U=;
        b=VWatl0Tg6Rs2+8cyQ1nNI7llz+Jwjnz45GyA7Ialu8h0m7yH1LKoqAuI6k/Ywlygil
         KDQQX525bUWsnQP59sCymg2Xi7UR5AijXzfqK2/Z2O+QbzWUet5is4fYAxM3ieQOdqUi
         Q6n8XepF4xgcAuR6YdqHkkzo9csOkkBGuEk5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRAe5/tE1Mx+glbEumA/10LHbf2sLTrpOcfg2d46p4U=;
        b=EuNcN1ZMimic0RGMkfCAfj+YpfVxeJezLb08OaOwv4koySpAyVNCMrN1wJMorQXiKj
         N3mSOCItpf85e46w0mDERwW17U6/MuPUsVqXOeJOcRMdOaogQwlwp2KjQXNgcee/EWmy
         0GlMRfkq9F6mJsW+eI7BKmpE8u6kkDumR44uaDokhKdCPKoNzP4bwiuFg16pG3SlWwni
         BsNsOLwpfv4I9iAfmXRaRfq1Nr7E2+OH655YKp90QlJYVZk3VhcIERw0MrHfY4XymE9Q
         Y/btX8k02jCjkW/eUdkN6BzyecL4t2Yps47t7lyiOp2IAquLkTpo39GGNV5SN02ZR8oG
         jUnA==
X-Gm-Message-State: AOAM5313lCrtbV4wy4xDtSVPCr9AT/Mhr02PsWjiPg1h3v+dFG75FBkz
        jfW+CCj1VUt4Q5Ut1VScsVWdis0LLLnj/2vNsqA=
X-Google-Smtp-Source: ABdhPJy9cLwtIiAYWsgRo90obKP+m9NbAB088+fp8/1olv84q4q0qBdjaw2XJBwZpFcra+vH1OiG2A==
X-Received: by 2002:a2e:b890:: with SMTP id r16mr1457995ljp.397.1631733555690;
        Wed, 15 Sep 2021 12:19:15 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id t2sm85831ljk.125.2021.09.15.12.19.14
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 12:19:14 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id h16so8496308lfk.10
        for <linux-parisc@vger.kernel.org>; Wed, 15 Sep 2021 12:19:14 -0700 (PDT)
X-Received: by 2002:a05:6512:94e:: with SMTP id u14mr1121103lft.173.1631733554128;
 Wed, 15 Sep 2021 12:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210915035227.630204-1-linux@roeck-us.net>
In-Reply-To: <20210915035227.630204-1-linux@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 15 Sep 2021 12:18:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
Message-ID: <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
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

On Tue, Sep 14, 2021 at 8:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> This patch series introduces absolute_pointer() to fix the problem.
> absolute_pointer() disassociates a pointer from its originating symbol
> type and context, and thus prevents gcc from making assumptions about
> pointers passed to memory operations.

Ok, I've applied this to my tree.

I note that the physical BOOT_PCB addresses in the alpha setup.h file
might be useful for things like MILO in user space, but since I
couldn't even find MILO sources any more, I couldn't really check.

I suspect alpha is basically on life support and presumably nobody
would ever compile a bootloader anyway, so it's unlikely to matter.

If somebody does find any issues, we'll know better and we can ask
where the user space sources are that might use that alpha setup.h
file.

                Linus

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A14340CEB6
	for <lists+linux-parisc@lfdr.de>; Wed, 15 Sep 2021 23:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbhIOVVW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 Sep 2021 17:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbhIOVVU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 Sep 2021 17:21:20 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF01C061574
        for <linux-parisc@vger.kernel.org>; Wed, 15 Sep 2021 14:20:00 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g1so9722763lfj.12
        for <linux-parisc@vger.kernel.org>; Wed, 15 Sep 2021 14:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w3BMwFy0chXS7YMqLdf36Rg6yUUlp6nBZba3YILPvA0=;
        b=WsNqD0Opa3lPgwayobITOeBYzY09REebVD84cTigbwiVy8RERoiSXisEu8y+Nk+bfI
         rwr6ffFTpZComKTqahfaOR7CdEVqoy7csTG2SKHpEYZNr9AVK2EZciaTVWrgEw6jv2ed
         w803wR6rUWc2E3pW5t7Ag7qcjFS9X02JepaeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w3BMwFy0chXS7YMqLdf36Rg6yUUlp6nBZba3YILPvA0=;
        b=RQWAWRXIAQ5G6phyIs8DsEey8yzhSS72Geabf8fjA7k/xuJU8T+UHrNj/g3fLSwJh5
         Jc/+DKkpxdJooSiEe+MhS4BZRsZ0mpP3s9vjYGqPSs+iVtUGkjPSQKCadPNapFAsrHPF
         3qcXeYkpqIqE93OZRCxmrDvDGxrlTwiw3mhRUrjtGTHwuim0/EkePiuax7URLIbmKFQM
         oSUZSo3JhAoifsA2b0C6bbsWgncmrq9L04d5/5CqEbCTQhfTxKle1/lrR3ijBITL1htl
         eSC7l0SuZLx4gj9suTpu+XhpGcCv+k8c+BrfI8gZJtBxcoOB1fDbS80RMT9guWqroZ1I
         DktQ==
X-Gm-Message-State: AOAM533f04xCEhM9/HchKDo8VFwAN1FXPcGbNMMF3/NO7ZC2giabVfEg
        IiTlQOWz7mHawDRE91lla+zs2QUBM/w/wAqM
X-Google-Smtp-Source: ABdhPJxgO94a7M65lyVUFATXX3isvlQkzAl6L69FxBCgjtt35VUUGsD63cTGIfTcqxslWceQ3fbDXg==
X-Received: by 2002:a2e:9a44:: with SMTP id k4mr1800391ljj.201.1631740798650;
        Wed, 15 Sep 2021 14:19:58 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id x1sm116285ljh.113.2021.09.15.14.19.56
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 14:19:57 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id i7so9630244lfr.13
        for <linux-parisc@vger.kernel.org>; Wed, 15 Sep 2021 14:19:56 -0700 (PDT)
X-Received: by 2002:a2e:bc1e:: with SMTP id b30mr1593765ljf.191.1631740795868;
 Wed, 15 Sep 2021 14:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210915035227.630204-1-linux@roeck-us.net> <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
 <47fcc9cc-7d2e-bc79-122b-8eccfe00d8f3@roeck-us.net> <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
 <CAHk-=whSkMh9mc7+OSBZZvpoEEJmS6qY7kX3qixEXTLKGc=wgw@mail.gmail.com>
In-Reply-To: <CAHk-=whSkMh9mc7+OSBZZvpoEEJmS6qY7kX3qixEXTLKGc=wgw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 15 Sep 2021 14:19:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjynK7SSgTOvW7tfpFZZ0pzo67BsOsqtVHYtvju8F_bng@mail.gmail.com>
Message-ID: <CAHk-=wjynK7SSgTOvW7tfpFZZ0pzo67BsOsqtVHYtvju8F_bng@mail.gmail.com>
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

On Wed, Sep 15, 2021 at 12:50 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Sep 15, 2021 at 12:47 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > What other notable issues end up being still live? I sent out that one
> > patch for sparc, but didn't get any response to it. I'm inclined to
> > just apply it (the 'struct mdesc_hdr' pointer misuse one).
>
> Oh, I forgot about the qnx4 one. That happens on sparc, possibly
> others, but not on x86-64.
>
> I'll go look at that patch too.

Ok, I didn't love any of the patches I saw for the qnx4 problem, so I
silenced that warning with a new patch of my own. Like the sparc64
case, the fix is to describe more extensively to the compiler what the
code is actually doing.

I think it ended up making it clearer what is going on to humans too.
Although that may be the old "peeing in the snow" effect - it looks
more understandable to me only because I spent so much time trying to
understand what it does, and then wrote the fix based on that possibly
flawed understanding. So of course I find it more understandable.

Looking at the qnx4 code-base history, I don't think it has gotten any
actual development outside of cleanups in the git history timeframe,
which makes me suspect nobody uses this code.

But hey, maybe it just works so well for the very specialized user base ...

Anyway, I pushed it out. I have a clean "allmodconfig" build on all
the architectures I tested, but I didn't test _that_ many.  sparc64,
arm64, powerpc64.

Lots of dts warnings (which aren't fatal), though. Particularly for
the powerpc64 build.

             Linus

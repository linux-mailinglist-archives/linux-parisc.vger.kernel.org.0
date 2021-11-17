Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E114454B4A
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Nov 2021 17:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239218AbhKQQtM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 17 Nov 2021 11:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239220AbhKQQtM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 Nov 2021 11:49:12 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28EFC061764
        for <linux-parisc@vger.kernel.org>; Wed, 17 Nov 2021 08:46:13 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id r11so13888638edd.9
        for <linux-parisc@vger.kernel.org>; Wed, 17 Nov 2021 08:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ET0tmIiYHyvEMKlBP8oDqKG/hNfHTYYovrhLrY7mVM4=;
        b=gVSQ2J9OLPLCHzVVSOZFyLxcFnUjeNKwWFMMHgPvy2CzMqGKqoDu86Klbd8K/onXqm
         xFADHCD9yHfkiuNtwgvt8f1v4R1b9+0xB9hlDvXQhyaoeAlLAXApR036UKKrHEjGWd9F
         +JCiHyuT3OE7Firp5lwTbk7rdXmugnSjOMr8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ET0tmIiYHyvEMKlBP8oDqKG/hNfHTYYovrhLrY7mVM4=;
        b=DIRNIaYDFH6bh0z4OJizVMeOoIg3Bp5Cw9MzF4mwI/31PAPf+tEp+yKuShQZUqaahY
         oxb50eFRnA/ODAgGGgRKNcO+M3WYk+KCNo1OBL8xfYil/bbRVgpXrC+EkHBdHhFKkE2V
         yjpYhqXW+G3IxU40AFmw61LyTSc2dzKYJcvYRKHCCYt2DVjUvx+IPdiigZyKjspenofG
         Nwrnc5YpcCedfV+NNXEoO9gxjj7Vwpxq4Bkpsx0dRC680mZ3bwpvoQkDe4mMr9ncMWhr
         7GxTfbAfv/m+vrqG0l5M2mWPMXnVMbimCOs6xcua6VK4dhUhzD+Qi8VzHlxJT/qfG8/2
         BW4A==
X-Gm-Message-State: AOAM531HMU2WVkCC+bI/QNdxtwEwgTvw/smNkl18mJV8/pNcGYPAdjqP
        mA0OSUzYQgUcmx/3PRS2gRv+3f1YkymAjnrd
X-Google-Smtp-Source: ABdhPJya0ZS1YgK+y4IiSqUPsVwcqzvLJblH5/qntP2K1QX9dE4oDx8dkId5330qcNEpv3Meys7wLA==
X-Received: by 2002:a05:6402:2026:: with SMTP id ay6mr83213edb.202.1637167571819;
        Wed, 17 Nov 2021 08:46:11 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id sh33sm205085ejc.56.2021.11.17.08.46.10
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 08:46:11 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id b184-20020a1c1bc1000000b0033140bf8dd5so2596480wmb.5
        for <linux-parisc@vger.kernel.org>; Wed, 17 Nov 2021 08:46:10 -0800 (PST)
X-Received: by 2002:a7b:c005:: with SMTP id c5mr1212849wmb.155.1637167570617;
 Wed, 17 Nov 2021 08:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20211117014949.1169186-1-nickrterrell@gmail.com> <20211117014949.1169186-2-nickrterrell@gmail.com>
In-Reply-To: <20211117014949.1169186-2-nickrterrell@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 17 Nov 2021 08:45:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wibYLDep=BPrUaw_wuZRDXnq5BVtG-6gLuBq6+3fdMhOQ@mail.gmail.com>
Message-ID: <CAHk-=wibYLDep=BPrUaw_wuZRDXnq5BVtG-6gLuBq6+3fdMhOQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] lib: zstd: Fix unused variable warning
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Nick Terrell <terrelln@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Nov 16, 2021 at 5:43 PM Nick Terrell <nickrterrell@gmail.com> wrote:
>
> From: Nick Terrell <terrelln@fb.com>
>
> Backport the fix from upstream PR #2838 [0]. Found by the Kernel test
> robot in [1].

Ugh. Mind having a better commit message?

This just tells you that it's a backport. It doesn't actually talk
about what it fixes.

Yes, the summary line says "Fix unused variable warning", but it
doesn't talk about why that variable is unused and why it's not
removed entirely.

And it's not obvious in the diff either, because the context isn't
sufficiently large.

So a comment along the lines of "the variable is only used by an
'assert()', so when asserts are disabled the compiler sees no use at
all" or similar would be appreciated.

Of course, the alternative would be to make the backup definition of
'assert()' actually evaluate the argument. That's not what the
standard assert() is supposed to do, but whatever, and the zstd use
doesn't care.

So using

    #define assert(condition) ((void)(condition))

instead would also fix the warning at least in kernel use (but not
necessarily outside the kernel - the standard C 'assert.h' is just
evil).

                  Linus

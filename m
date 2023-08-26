Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF8977892DF
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Aug 2023 03:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbjHZBIa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Aug 2023 21:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbjHZBIS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Aug 2023 21:08:18 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CCA26B9
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 18:08:12 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2bba6fc4339so20762501fa.2
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 18:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693012091; x=1693616891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V940I5eBi0Ftd+/pXbQQIlfDUIAcd0CLy5fb6CBFMNA=;
        b=I0DqPuAzgbvUQNAQTNOqi344H51xBwjJIMFJ8zDFdl9Rw15fK6MY4morHz6I0GRTh6
         Nu0WWuxkneTUdamEFhpSYSkd8cNQPzT+VCVHESGnLHJmt0MtCe5Hh+c2ECSp7rqv4yvj
         7mP0Ty9G0Zm3AfJUx5g6X9GNsxOXzMb3TW8Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693012091; x=1693616891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V940I5eBi0Ftd+/pXbQQIlfDUIAcd0CLy5fb6CBFMNA=;
        b=ZgQtNe/BoHfcHZUIf8HNqrFIxPPpXtF4L0Qe1Ai91CWvlWpT57PyGUvujZm25sGuyD
         YAqXAM/dudCh8TQbNTR8VTRD7cXATIq+BcSmVT4J12woiRQn6M2uZes/2glNsFlGpDRE
         mSPJwCEM/7kv3MMpg/u0qRJv42FBhU5q3Lto1gXKNe5+iaiGXXkbLDdCWm4t22F/SnbZ
         4egUG7lo1eJQvCa+IQkJiQLonYonPmhGJg5FIMAw0Yzw1kpk2Z4bdfuNwggGHnWuojPb
         K/INQx/94KJYP/+yrz7nFFLyI8Sv4g6eqMETCytBRcJ/65uXq2jHpLrTo07cz9ZKi/w3
         zFBw==
X-Gm-Message-State: AOJu0YwobCYV8GVIrLeN2Kz8kCCyyXElXi0gzVFOx7LoeLQNAJ5j5W4T
        fAPth7TWm8ACpkZtjW3TweWt5HYQCCrPHUwx9x32TnA0
X-Google-Smtp-Source: AGHT+IHxv5VW93alor4a0ssl6fRTBSIBvn7DOYgMtpqceOeWr6F2P7DvggC6KmaijjvQ5Oz9ntgksw==
X-Received: by 2002:a2e:9cd8:0:b0:2bb:bdf0:caf2 with SMTP id g24-20020a2e9cd8000000b002bbbdf0caf2mr14202044ljj.25.1693012090675;
        Fri, 25 Aug 2023 18:08:10 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id mh3-20020a170906eb8300b0099bcdfff7cbsm1499231ejb.160.2023.08.25.18.08.09
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 18:08:10 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c0290f0a8so187032266b.1
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 18:08:09 -0700 (PDT)
X-Received: by 2002:a17:906:9be8:b0:99d:6ca6:7a8c with SMTP id
 de40-20020a1709069be800b0099d6ca67a8cmr15893578ejc.63.1693012089691; Fri, 25
 Aug 2023 18:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <ZOkGCSNr0VN2VIJJ@p100> <CAHk-=wjZwSymfuGvf7TX3UQLU1OMN1FZMnEA-Hja0ruqyhMK4A@mail.gmail.com>
 <CAHk-=whVvD05T0yD5DQj803uETLD6qDq-Vx-SiLPcrL=eO77LQ@mail.gmail.com>
 <CAKwvOdnYauyrzz7-ceH-MP_KZ5ED8oYxjRx_Xei68=tUOSeKyA@mail.gmail.com>
 <CAGG=3QWcZPYqHMcjwuYDz1+OQhzS40hmhdOvSBZBQOkhs8YAQQ@mail.gmail.com>
 <CAGG=3QX8AaTedPy-joWm6yp+TFHBVXm59OcvxkdLGsSuDjem5g@mail.gmail.com>
 <CAHk-=wjQpXpnGAwvv-oBi+cQ0g+D9rTK5STkXSSV4a90FPR+EQ@mail.gmail.com> <CAKwvOdm_y6UOnxFrAiDxou2jc8CRUvyhfH9kAdc3PG0=bEvduw@mail.gmail.com>
In-Reply-To: <CAKwvOdm_y6UOnxFrAiDxou2jc8CRUvyhfH9kAdc3PG0=bEvduw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 25 Aug 2023 18:07:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJzMzPFTCzejWs1WM4=74z2VENyOzySnucrXG3i=ajrw@mail.gmail.com>
Message-ID: <CAHk-=wgJzMzPFTCzejWs1WM4=74z2VENyOzySnucrXG3i=ajrw@mail.gmail.com>
Subject: Re: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Bill Wendling <morbo@google.com>, Helge Deller <deller@gmx.de>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Chanho Min <chanho.min@lge.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 25 Aug 2023 at 17:52, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> So 2 concerns where "I'll do it in inline asm" can pessimize codegen:
> 1. You alluded to this, but what happens when one of these functions
> is called with a constant?

This is why our headers have a lot of __builtin_constant_p()'s in them..

In this particular case, see the x86 asm/bitops.h code:

    #define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) :
variable_ffs(x))

but this is actually quite a common pattern, and it's often not about
something like __builtin_ffs() at all.

See all the other __builtin_constant_p()'s that we have in that same
file because we basically just use different code sequences for
constants.

And that file isn't even unusual. We use it quite a lot when we care
about code generation for some particular case.

> 2. by providing the definition of a symbol typically provided by libc
> (and then not building with -ffreestanding) pessimizes libcall
> optimization.

.. and this is partly why we often avoid libgcc things, and do certain
things by hand.

The classic rule is "Don't do 64-bit divisions using the C '/' operator".

So in the kernel you have to use do_div() and friends, because the
library versions are often disgusting and might not know that 64/32 is
much much cheaper and is what you want.

And quite often we simply use other names - but then we also do *not*
build with -freestanding, because -freestanding has at least
traditionally meant that the compiler won't optimize the simple and
obvious cases (typically things like "memcpy with a constant size").

So we mix and match and pick the best option.

The kernel really doesn't care about architecture portability, because
honestly, something like "ffs()" is entirely *trivial* to get right,
compared to the real differences between architectures (eg VM and IO
differences etc).

             Linus

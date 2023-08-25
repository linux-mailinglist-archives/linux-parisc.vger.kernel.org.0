Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A6B78926E
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Aug 2023 01:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjHYXgN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Aug 2023 19:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbjHYXfp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Aug 2023 19:35:45 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C012715
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 16:35:06 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bceb02fd2bso20798311fa.1
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 16:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693006504; x=1693611304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xrGn7GzwpGyAxPMQSvPbrYNKw3I7cF4DEEkS0WkvjsE=;
        b=ZcryPYdH5W9DlEuw3ui2gP8qxOFUuti5WugT/1mreYJi08OoLuJfBLtAYO1BkdHZeQ
         XPsXaBJ206dDOFLmZ66+S7L7fp4g4wwoIXbmDOgnRuM9Z41JQvyzhIUY6LPSMGXjY8bk
         qKOypbkWT97B7QkzKdl8g1bDtAt+0MVitWRIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693006504; x=1693611304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrGn7GzwpGyAxPMQSvPbrYNKw3I7cF4DEEkS0WkvjsE=;
        b=FeXKgKZDb6kCw5s95z/gdyKLGBO6FfP+sfefmDdNHUd0xm/ZIHianDu9fAZzS8wwzB
         OTsPvyjKNRVNbBeuAMmO6XMaACxFklJcFisJjG8NnNIED1+qKLOTa/vZwvRRCiSi7pX9
         6HkpgFQkT5hbB5BSV7A8J91jPqRO08k9MGXKBTg5fVHKLntd+LlT373oTBK8tabyQyqs
         h5e0mxeXyUjod6O/D9uOkb4s8OD2AfGBNhfS+jnPThuk0QB08Q9CNKyL+lb/Tv6j5RZi
         rtC8Y1CxU9ssidE2kNEI02N7OCJezpp1e3vfjbZ3BVLJGZM66y3mceWW4+WYDD/DBweR
         IvQw==
X-Gm-Message-State: AOJu0Ywt9g/0JfdB4kXQ58sEBllyWZgtVBviLFK3KDujHa0B4OpzK5hx
        b/NgKu/EqNud4sMpNM2TvK4346NTUI1TdTBmudvLIg==
X-Google-Smtp-Source: AGHT+IG+e9iLnjlLVkkv63fwPq2MbpXh8QRJGEJidG6By3Ndq6KPaXwkZAsbIeZQoC5stQlonxXGFg==
X-Received: by 2002:a05:6512:2813:b0:4fb:896d:bd70 with SMTP id cf19-20020a056512281300b004fb896dbd70mr16591850lfb.46.1693006503999;
        Fri, 25 Aug 2023 16:35:03 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id k8-20020a05640212c800b0052a3b212157sm1480880edx.63.2023.08.25.16.35.03
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 16:35:03 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5256d74dab9so2034952a12.1
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 16:35:03 -0700 (PDT)
X-Received: by 2002:a17:907:7758:b0:9a1:f10d:9751 with SMTP id
 kx24-20020a170907775800b009a1f10d9751mr6046396ejc.23.1693006503012; Fri, 25
 Aug 2023 16:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <ZOkGCSNr0VN2VIJJ@p100> <CAHk-=wjZwSymfuGvf7TX3UQLU1OMN1FZMnEA-Hja0ruqyhMK4A@mail.gmail.com>
 <CAHk-=whVvD05T0yD5DQj803uETLD6qDq-Vx-SiLPcrL=eO77LQ@mail.gmail.com>
 <CAKwvOdnYauyrzz7-ceH-MP_KZ5ED8oYxjRx_Xei68=tUOSeKyA@mail.gmail.com>
 <CAGG=3QWcZPYqHMcjwuYDz1+OQhzS40hmhdOvSBZBQOkhs8YAQQ@mail.gmail.com> <CAGG=3QX8AaTedPy-joWm6yp+TFHBVXm59OcvxkdLGsSuDjem5g@mail.gmail.com>
In-Reply-To: <CAGG=3QX8AaTedPy-joWm6yp+TFHBVXm59OcvxkdLGsSuDjem5g@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 25 Aug 2023 16:34:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjQpXpnGAwvv-oBi+cQ0g+D9rTK5STkXSSV4a90FPR+EQ@mail.gmail.com>
Message-ID: <CAHk-=wjQpXpnGAwvv-oBi+cQ0g+D9rTK5STkXSSV4a90FPR+EQ@mail.gmail.com>
Subject: Re: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
To:     Bill Wendling <morbo@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Helge Deller <deller@gmx.de>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Chanho Min <chanho.min@lge.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 25 Aug 2023 at 15:57, Bill Wendling <morbo@google.com> wrote:
> >
> Another idea is that there are __builtin_* functions for a lot of
> functions that are currently in inline asm

No. We've been through this before. The builtins are almost entirely
untested, and often undocumented and buggy.

> The major issue with the
> `__builtin_ia32_readeflags_*` was its inability to take unrelated MSRs
> into account during code motion. That may not be the same worry here?

No, the problem with __builtin_ia32_readeflags_*() was that it was
literally completely buggy and generated entirely broken code:

    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104971

but that's really more of a symptom than anything else.

It's a symptom of the fact that unlike inline asm's, those builtins
are often undocumented in what compiler version they appeared, and are
of very questionable quality. They often don't have many users, and
the test suites are non-existent.

For example, we *do* use __builtin_ffs() on x86 for constant values,
because the compiler does the right thing.

But for non-constant ones, the inline asm actually generates better
code: gcc generatea some disgusting mess with a 'bsf' followed by a
'cmov' for the zero case, when we know better.

See for example

   https://godbolt.org/z/jKKf48Wsf

I don't understand why compiler people prefer a builtin that is an
untested special case that assumes that the compiler knows what is
going on (and often doesn't), over a generic escape facility that is
supported and needed anyway (inline asm).

In other words: the statement "builtins generate better code" is
simply PROVABLY NOT TRUE.

Builtins have often generated *worse* code than using inline asms, to
the point where "worse" is actively buggy crap.

At least inline asms are reliable. That's a *big* deal.

               Linus

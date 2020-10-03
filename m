Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5559281FF1
	for <lists+linux-parisc@lfdr.de>; Sat,  3 Oct 2020 03:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgJCBOO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 2 Oct 2020 21:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgJCBON (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 2 Oct 2020 21:14:13 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 892EAC0613D0
        for <linux-parisc@vger.kernel.org>; Fri,  2 Oct 2020 18:14:13 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id 7so1445230vsp.6
        for <linux-parisc@vger.kernel.org>; Fri, 02 Oct 2020 18:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/yGtfiNcgJrUat/PWCT0Vc/JxltyE26ffS/ZkS/4iVQ=;
        b=EEHUpZgDu5KE0Q4tVfxvN0JPZZ0/MAbXwZ0v3s7R7HzmdBlmtc1hZGyazpuRU81d71
         Eg8HwoMkYH3Jd01wFLHa3xEV+yN7M1+6dCWhDhTWTFanWXZWWjvhyIR3lZeGST8UlMBF
         NZrosBDT/ia0VweqWqc+jw+PvqUEEyKL/CteWVsDRP1zKsXvtNC5+BWY56c2VVJZYWUy
         6xhkyP1sP62oKUXoXu92gc7VsaMyAX7jqxsMKj2XM89aOyqYK+qyV7EcXo5KFcnkAgix
         +PXit5f9d8M2ihWsRXRc1Pnu+jEwUbTp6FnGxt4OkNLfYGLtQf8cFuaQHWnQ7KbH3tj1
         DPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/yGtfiNcgJrUat/PWCT0Vc/JxltyE26ffS/ZkS/4iVQ=;
        b=KV5M6/te5vQ6302V5GvdbAE+whjNZbKphw8CzSagpW0V3czS7F4uQQuR92tLqnWFqS
         I0azDTnzB//oPkb2dH97cv8HWjblFChh8mb6mPRYfHJTUpBs7/n1LElgb0Vy6lcHTkqP
         1UFkcIr4Pp19pJrd3L2ZfML+kBnhJy9RgqqCZ0gvU4vUH50srz5P26Nm6LIiLjV7+0zY
         b5U7IHNyOss7j9eAAyZPuRrtakZ9HLxcrtsY0wX80AMutcDYN0LjyNh+Kbkn4Wy4p3xb
         fEVWEJ5MKXPsyoCEdXMcfgLYghugXZYAu6EnEau6P0eRmHLLgwWd4xfaanMTILjWyVn6
         yItA==
X-Gm-Message-State: AOAM533C5WKiCl67LtyC+Vrf0IQglOAu0sK+TNvTEdze552kJyGjvjLW
        lS3qzaQz2LVRHTo4VWp9eayuv8kyDUlMP3/MiRQ50A==
X-Google-Smtp-Source: ABdhPJxpHQAdVC98juCmyvvbjXri9dDMJtKbGXfTsyo9dQXQXpMX25+5vDA76DsF+/oUSHm8NZya2GYwd6KHIDR2i70=
X-Received: by 2002:a67:8a8a:: with SMTP id m132mr574047vsd.14.1601687652296;
 Fri, 02 Oct 2020 18:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598072840.git.pcc@google.com> <f5b9b91e7401d82c899fb6d1bb7fb2158103e5f3.1598072840.git.pcc@google.com>
 <20200908151223.GS6642@arm.com>
In-Reply-To: <20200908151223.GS6642@arm.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Fri, 2 Oct 2020 18:14:01 -0700
Message-ID: <CAMn1gO7uBVL64KPv947AKSoOv9F1ghXkyB+c2St6g-pQnVPHDQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/7] arch: move SA_* definitions to generic headers
To:     Dave Martin <Dave.Martin@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        David Spickett <david.spickett@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Sep 8, 2020 at 8:12 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Fri, Aug 21, 2020 at 10:10:12PM -0700, Peter Collingbourne wrote:
> > Most architectures with the exception of alpha, mips, parisc and
> > sparc use the same values for these flags. Move their definitions into
> > asm-generic/signal-defs.h and allow the architectures with non-standard
> > values to override them. Also, document the non-standard flag values
> > in order to make it easier to add new generic flags in the future.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
>
> While this looks reasonable, I've just realised that you strip the "U"
> from some arches' definitions here.
>
> So, on powerpc and x86, this changes the type of flags other than
> SA_RESETHAND from unsigned int to int.
>
> While I can't see this breaking any sensible use of these flags, there's
> a chance that there is software relying on this distinction by
> accident.

While it's true that it's technically possible that making these
signed could change semantics, I'm having trouble seeing a realistic
way in which software could be relying on this. Can you see one? I can
think of cases like if the code does something like left shifts one of
the flag bits into the sign bit (technically undefined behavior) and
then right shifts it back (in C this would need to all be done in a
single expression without storing to a variable; in C++ I suppose you
could use auto to preserve the signedness in a variable's type). For
example:

int x = (SA_NODEFER << 1) >> 1;

would give a different value to x if we made SA_NODEFER signed. But I
wouldn't really expect software to be doing this sort of thing even
accidentally, or much more than or'ing the flags together and
assigning them to a variable, or passing them as a parameter, or some
other operation which would fix the type.

I believe that the kernel's uapi guarantee applies at the binary
level, not at the source level. If that were not the case, I think we
would not be allowed to add any new declaration to an existing .h file
for fear of conflicting with a user program's identically spelled
declaration. And that seems more likely to me than software that would
do this sort of thing.

> I wonder whether it's worth doing something like
>
>         #ifdef ARCH_WANT_STRICTLY_UNSIGNED_SA_FLAGS
>         #define __SA_FLAG_VAL(x) x ## U
>         #else
>         #define __SA_FLAG_VAL(x) x
>         #endif
>
>         #ifndef SA_NOCLDSTOP
>         #define SA_NOCLDSTOP __SA_FLAG_VAL(0x00000001)
>         #endif
>
>         /* ... */

If we do this I would mildly prefer to keep the existing #defines in
the arch-specific headers as if the arch had different flag values, as
this would leave the arch-specific legacy cruft in the arch-specific
headers where it belongs.

> Mind you, the historical situation also has issues, e.g. because
> sa_flags in struct sigaction is an int, assigning
>
>         struct sigaction sa;
>
>         sa.sa_flags = SA_RESETHAND;
>
> implies an overflow and so isn't portably safe (at least in theory).  I
> guess we are getting away with it today.  Preserving the situation by
> keeping the "U"s where appropriate would at least avoid making the
> situation worse.

I believe that the result of this assignment (involving an unsigned to
signed conversion) is implementation defined and not undefined (which
would be problematic). And in all the implementations that matter, as
well as the C++ standard starting with C++20, this is a no-op cast
assuming two's complement. I'm not sure what this has to do with
making the constants signed because, as you pointed out, SA_RESETHAND
would remain unsigned despite the absence of 'U' because its value
does not fit in an int.

Peter

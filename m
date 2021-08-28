Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271D63FA70C
	for <lists+linux-parisc@lfdr.de>; Sat, 28 Aug 2021 19:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhH1RlF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 28 Aug 2021 13:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhH1RlE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 28 Aug 2021 13:41:04 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D65C061756
        for <linux-parisc@vger.kernel.org>; Sat, 28 Aug 2021 10:40:11 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z2so21622313lft.1
        for <linux-parisc@vger.kernel.org>; Sat, 28 Aug 2021 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRvvJwphQ9aOIu7VpFguZDLnC96NUs+u8imHp8r3LgY=;
        b=LDIOZQrPwVhA1ZOvOs5QyUG3h2XahqfpWCOLItweWX5dV8aKOgnv4ODbiS+um0lfgk
         Xdxa5IxSm5ZOm/3FAqehvbJmFgJbkhaPazkr/dKLGVfjmqoQe0QPj71kyd6WtY5PE04x
         vu/fb9rHALobhmE/CCv0j5EvQ7hAB8g4XWQb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRvvJwphQ9aOIu7VpFguZDLnC96NUs+u8imHp8r3LgY=;
        b=kZ1NFmutC+WITbkJdHRdRLh05UGJIkNII97D8PyOxjLu9kp2fmVmBjJz1nkRTPfhhk
         ZpSXqYgHyPt/YcUezgNDsMvFkxiTXGboVxanjur+ycRk5ybHR4a98rSFw6bS/2t1o4Q9
         qukBg89j4s08+sZMKgTxSxlV3XOrrhUXKy75H9BdCHkMzrnk11FULGOUokbv7R6QWcG5
         v/ukSelnGsR+A800CryYfslDOxeof9Kbl2qOn6bB+WeebfBgzTfs58lef8ll/Dva3ZaR
         px5uWsKmZxGxAM14uBzrqmZEDdpWw6lrEaN85s5xRlH1SkZumyj94N1XOYM5tg484Ddj
         wmAA==
X-Gm-Message-State: AOAM5336m3URgnLO5k6klMbRgVFJzdKXVNV3ogX/gQHK7axwalHi1juV
        u/urZ+XTAQ2q5JqXp+olRktFLWO4xQMz8YU4
X-Google-Smtp-Source: ABdhPJxWG+bnHyogBO8/jYiHeFna3glsuiGg6vJcBiEOqfEgdyrHvKZHWG9CBhefWAFOy4kwZjESgg==
X-Received: by 2002:ac2:5c0d:: with SMTP id r13mr689630lfp.552.1630172409128;
        Sat, 28 Aug 2021 10:40:09 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id n25sm1139142ljj.42.2021.08.28.10.40.08
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 10:40:08 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id k5so21586752lfu.4
        for <linux-parisc@vger.kernel.org>; Sat, 28 Aug 2021 10:40:08 -0700 (PDT)
X-Received: by 2002:a05:6512:104b:: with SMTP id c11mr10923177lfb.201.1630172407773;
 Sat, 28 Aug 2021 10:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <YSiwLuE17BwRlI/d@ls3530> <aa0006e7-58b8-ab05-0599-5609e900ba4d@rasmusvillemoes.dk>
 <97a0ddcf-243d-f312-8291-01d6595260bf@gmx.de>
In-Reply-To: <97a0ddcf-243d-f312-8291-01d6595260bf@gmx.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 28 Aug 2021 10:39:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhKNB_1a6wjjPh2PvMrtjVs=DgGY5uM2jq3WBBaYMyGQ@mail.gmail.com>
Message-ID: <CAHk-=wjhKNB_1a6wjjPh2PvMrtjVs=DgGY5uM2jq3WBBaYMyGQ@mail.gmail.com>
Subject: Re: [PATCH] Fix prctl(PR_GET_NAME) to not leak random trailing bytes
To:     Helge Deller <deller@gmx.de>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Aug 27, 2021 at 5:19 AM Helge Deller <deller@gmx.de> wrote:
>
> Oh, the parisc strncpy() asm does NOT zero-fill the target address !!
> That's the bug.
> I thought strncpy would just copy up to given number of chars.

Yeah, strncpy() is a horrible horrible function.

It doesn't copy any NUL character at all if the source length was
longer than the 'n', so it doesn't necessarily result in a
NUL-terminated string.

And it fills the target with NUL characters at the end, which is
usually horribly inefficient and means that you should never ever use
it with big destination buffers. So it can be a surprisingly bad
function to use for the - not all that unusual situation - where you
have lots of space in the destination buffer, and use the 'n' version
of strcpy() just to be safe for odd situations. It will zero-fill all
that space, usually for no good reason.

Very different from the other 'n' functions like snprintf() and
friends that people use for that same "destination buffer safety"
reason.

So it's almost never the right thing to use, even if it's the most
traditional, most common and - by name - most obvious "copy string of
at most length 'n'" function.

It so happens that "comm[]" is probably one of *very* few situations
in the kernel where we really do want to use strncpy(), and where we
don't just NUL-terminate, but NUL-fill the buffer.

Of course, that "comm[]" behavior is unusual these days, but I think
it was a lot more usual back in the early 70's, when that whole
"small, fixed-size string buffer" model was much much more common than
it is today.

It is, after all, the exact same reason why the C language linker
rules for identifiers were historically "only the first 7 letters are
necessarily significant". Because "use a fixed 8-byte buffer for a
string" made sense at the time in ways it doesn't necessarily make all
that much sense today.

So that odd and nasty behavior of strncpy() makes a lot more sense in
the historical context - it's just that that context is 50 years ago.

While mentioning all the oddities of 'strncpy()', it's also worth
noting that despite the similarities in the name,
"strncpy_from_user()" does *not* fill the end of the destination
buffer with NUL characters, and does *not* act like strncpy(). The
user string copy function obviously also has a very very different
return value, which hopefully makes it more obvious that it's a very
different beast.

Most of the time, if you actually want to copy a string, and have a
limited destination buffer, you should use 'strscpy()'. Of the
"limited size string" routines, it's pretty much the only sane one,
and it guarantees - as long as the target size is non-zero - that the
target is NUL-terminated without doing the NUL filling.

(The BSD 'strlcpy()' is horribly broken because the return value
semantics means that it will have to find the terminating NUL of the
*source* string, even if the source string is horribly long, or
untrusted and unterminated).

> Interestingly the kernel runs quite well and we don't see any bigger breakage.

Yeah, almost nothing actually cares about the odd NUL filling that -
as you - few people realize is even part of strncpy().

> Anyway, the function needs fixing.

I'd suggest you just use the default one in lib/string.c and not
override it with __HAVE_ARCH_STRNCPY.

For example, on x86, we for purely historical reasons do that
__HAVE_ARCH_STRNCPY thing, but only for the legacy 32-bit code. x86-64
uses that generic lib/string.c version (and honestly, the 32-bit
arch-specific x86 one is almost certainly much worse, but hey, it
really exists purely due to hysterical raisins).

That generic thing is a slow byte-per-byte implementation, but I don't
think we have ever had a situation where it really matters.

It's also slightly oddly implemented - notice how the way it does that
zero fill is by simply not incrementing the source pointer once it
finds a NUL character. Simple and effective (even if perhaps not
_efficient_), but it can make people miss what is going on because
it's an unusual pattern.

                Linus

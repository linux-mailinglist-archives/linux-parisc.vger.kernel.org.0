Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9543178B950
	for <lists+linux-parisc@lfdr.de>; Mon, 28 Aug 2023 22:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbjH1UP1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 28 Aug 2023 16:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233696AbjH1UO6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 28 Aug 2023 16:14:58 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0A6EC
        for <linux-parisc@vger.kernel.org>; Mon, 28 Aug 2023 13:14:54 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-64c2e2572f7so21470166d6.1
        for <linux-parisc@vger.kernel.org>; Mon, 28 Aug 2023 13:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693253694; x=1693858494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMDd65fdCHl2xtT/3to1El4/4exfLPs4G2IChT81xSs=;
        b=4DGdPA1sH8CBwQvIK6eIJACZD5O8uvd+EQnkfVuGBNin/s61pTTZGlxATmdX31PKk+
         M4effxZ4z/hh7rLAIuRqrRO87iOSMS5g/iFj1WxC5DIpAs9ESrwwetYXfLwZXOGKOj1n
         le11o9hZoJoypLeph3ta2vZz242piVec5/VDySRnMB4gIq0bwIkpaWW0Cq6ZHdueYnD/
         WrTDtGSVMqN6ZYZ+9yv83y9MuHpjrY6++6DOp9BHkNNQ3y7xUYyRMjM9ht8s3nhb/s9v
         LD8OZktGRlNLnfFg0vXTnJNZJ52VUs27had+g7l1Yyt3UxgK7+NR0XhfL55HNscNdN4P
         +iXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693253694; x=1693858494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMDd65fdCHl2xtT/3to1El4/4exfLPs4G2IChT81xSs=;
        b=b0OhfmJ55nbIiKOGaWgV7U+1F9wmepSWeIsZZc3bhP50L0Mlj5nv7t++TXY2aeismc
         QnF7CaPS/v538O7zlApNggca0YwzY3J5BW91+N7WWHi+6vydp8BPEZquCAR00RJbCrC6
         Xll+/PWJt3qoOCXLiKGIUOxusmgJ5Bi5TFhVoKVoIQHXv+NsdXIgPXMeV7ZjnK6nc5cH
         A7tMhfWDgxR4zkEEgLxgBBPHwFP8Bw15rN/y8Zs30LE9puPPBfzRWuxreGNgtxNbTuRz
         M7/0I4aQ1CJmyWf24Srq4H4oQJSMxvtdU/uM9irE+J/pIlNggYa5m57r5Zf1n0mvrVZ7
         zL1w==
X-Gm-Message-State: AOJu0YzMw2p1R9w3BwNg9MzChwi20mSBeNuUETmR+McGwoBmqJAnF3C/
        ppMdba2EOIsVTUGU6wLLnfYCjtLmgC8SBl+XenZPKg==
X-Google-Smtp-Source: AGHT+IFXdJyIqaL9v7tZnBYt0jxTjNV9JWHvz0fn6Zev3OQsd+Un77YdKGhViaW3TUslEp0ARZvuWQJzFhDhPb38330=
X-Received: by 2002:a05:6214:1fc9:b0:63d:eef:c3f6 with SMTP id
 jh9-20020a0562141fc900b0063d0eefc3f6mr26933551qvb.38.1693253693738; Mon, 28
 Aug 2023 13:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <ZOkGCSNr0VN2VIJJ@p100> <CAHk-=wjZwSymfuGvf7TX3UQLU1OMN1FZMnEA-Hja0ruqyhMK4A@mail.gmail.com>
 <CAHk-=whVvD05T0yD5DQj803uETLD6qDq-Vx-SiLPcrL=eO77LQ@mail.gmail.com>
 <cc5f4f5701674b96b0009b6b9b257cc8@AcuMS.aculab.com> <CAHk-=wieUuOd-aUz0dma6TnZ+TLVk5-ytJiwbMqLpjcvdzzvQg@mail.gmail.com>
In-Reply-To: <CAHk-=wieUuOd-aUz0dma6TnZ+TLVk5-ytJiwbMqLpjcvdzzvQg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 28 Aug 2023 13:14:42 -0700
Message-ID: <CAKwvOdmUptr9_HsU3fz3pa=Y0-SqgHcKk7SJV7hmeBGaw1C3Aw@mail.gmail.com>
Subject: Re: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     David Laight <David.Laight@aculab.com>,
        Helge Deller <deller@gmx.de>,
        Nathan Chancellor <nathan@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chanho Min <chanho.min@lge.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Aug 28, 2023 at 9:30=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 28 Aug 2023 at 03:53, David Laight <David.Laight@aculab.com> wrot=
e:
> >
> > From: Linus Torvalds
> > >
> > > We use this:
> > >
> > >   static __always_inline unsigned long variable__ffs(unsigned long wo=
rd)
> > >   {
> > >         asm("rep; bsf %1,%0"
> > >                 : "=3Dr" (word)
> > >                 : "rm" (word));
> > >         return word;
> > >   }
> > >
> > > for the definition, and it looks like clang royally just screws up
> > > here. Yes, "m" is _allowed_ in that input set, but it damn well
> > > shouldn't be used for something that is already in a register, since
> > > "r" is also allowed, and is the first choice.
> >
> > Why don't we just remove the "m" option?
>
> For this particular case, it would probably be the right thing to do.
> It's sad, though, because gcc handles this correctly, and always has.
>
> And in this particular case, it probably matters not at all.
>
> In many other cases where we have 'rm', we may actually be in the
> situation that having 'rm' (or other cases like "g" that also allows
> immediates) helps because register pressure can be a thing.
>
> It's mostly a thing on 32-bit x86 where you have a lot fewer
> registers, and there we've literally run into situations where we have
> had internal compiler errors because of complex inline asm statements
> running out of registers.
>
> With a simple "one input, one output" case, that just isn't an issue,
> so to work around a clang misfeature we could do it - if somebody
> finds a case where it actually matters (as opposed to "damn, when
> looking at the generted code for a function that we never actually use
> on x86, I noticed that code generation is horrendous").
>
>              Linus

Yes; it's a compiler bug, and we will fix it. Then the fix will be an
incentive for folks that care to move to a newer toolchain.
--=20
Thanks,
~Nick Desaulniers

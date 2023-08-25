Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EEA788FF2
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Aug 2023 22:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbjHYUnk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Aug 2023 16:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbjHYUnh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Aug 2023 16:43:37 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC3E2133
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 13:43:34 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99df431d4bfso168843766b.1
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 13:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1692996213; x=1693601013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7bN2O17WORYrV504APBBhTykVIUp9W/DM+54sJbYAys=;
        b=ETxlxicvLn4b89xwS4rs1FD//LtZq5Osa0qtpVJ9VxL9Y1M2Mhy65aEtPZfoirtWlw
         HHMpi5o4n61+xrV8n/rj/w3J0Qy3hpOz2PyWbuad/3OlOzGvE1dgjjOTqI23Tnc6xO9w
         odGJI1VsYl+rveRharik5ZOJCasNQOzmTOUPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692996213; x=1693601013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bN2O17WORYrV504APBBhTykVIUp9W/DM+54sJbYAys=;
        b=WIU79Y3+wY86RVwF4fDWNoGAwG54Hkxcv5AyI6XQUO1Gxtf2y00xaqmEhTmKEcGr92
         rQHm1OyutiwH4yPiXeWPwMmc0RY4y1se6Z9/4SnTHAeTPZreGExdJjO2KqMqimla2B90
         nr86uuUk3T6RSjSecslUylIjbuzD7XkWd0s2BkLsVV8zNSg46QfRc+N5Lf51wfo+s3+v
         fQKzJP8g6EQGn9xOKSNtKRYm/jlK1sEQh94BZPUWx3Zv5ilmZ9m/3ZKVIAkwIFX9Ogo2
         UTPRbaU55W8mQkeC5rUnEx26NPZd1okZGwN6kOXvi/inkyzB/1JzmO1T+lA67bPFUaqD
         YYjw==
X-Gm-Message-State: AOJu0YwTOQuG2hkDFhMn1t6NltJzvkaNXR/ZTMKT8U9kk7r7A2I75kyh
        IpC8QWusfw0KIlvUukutiQCz0tsz0C90DZmNVibIkg==
X-Google-Smtp-Source: AGHT+IHG3BCBlsikQYBMD7fFox7cI0suQTW4UV1H2b4qv2YUM4kCb6XTHOMVKLvdWmuL32nkipWKFg==
X-Received: by 2002:a17:907:a04d:b0:9a5:8afe:8c5d with SMTP id gz13-20020a170907a04d00b009a58afe8c5dmr644453ejc.16.1692996212951;
        Fri, 25 Aug 2023 13:43:32 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id rh22-20020a17090720f600b0099bc80d5575sm1299857ejb.200.2023.08.25.13.43.32
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 13:43:32 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bcf2de59cso171683566b.0
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 13:43:32 -0700 (PDT)
X-Received: by 2002:a17:906:10dc:b0:9a1:c352:b6a2 with SMTP id
 v28-20020a17090610dc00b009a1c352b6a2mr9485343ejv.52.1692996212086; Fri, 25
 Aug 2023 13:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <ZOkGCSNr0VN2VIJJ@p100> <CAHk-=wjZwSymfuGvf7TX3UQLU1OMN1FZMnEA-Hja0ruqyhMK4A@mail.gmail.com>
In-Reply-To: <CAHk-=wjZwSymfuGvf7TX3UQLU1OMN1FZMnEA-Hja0ruqyhMK4A@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 25 Aug 2023 13:43:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whVvD05T0yD5DQj803uETLD6qDq-Vx-SiLPcrL=eO77LQ@mail.gmail.com>
Message-ID: <CAHk-=whVvD05T0yD5DQj803uETLD6qDq-Vx-SiLPcrL=eO77LQ@mail.gmail.com>
Subject: Re: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
To:     Helge Deller <deller@gmx.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Chanho Min <chanho.min@lge.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

[ Unrelated to this patch, except it made me look, adding clang build
people to cc ]

On Fri, 25 Aug 2023 at 13:25, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 25 Aug 2023 at 12:50, Helge Deller <deller@gmx.de> wrote:
> >
> > This patch fixes the in-kernel functions __clzdi2() and __ctzdi2() [..]
>
> Applied,

Bah. Still applied,  but actually building this (on 64-bit, so kind of
pointless) I note that clang completely messes up this function on
x86.

Clang turns this:

        return __ffs64(val);

into this horror:

        pushq   %rax
        movq    %rdi, (%rsp)
        #APP
        rep
        bsfq    (%rsp), %rax
        #NO_APP
        popq    %rcx

which is just incredibly broken on so many levels. It *should* be a
single instruction, like gcc does:

        rep; bsf %rdi,%rax      # tmp87, word

but clang decides that it really wants to put the argument on the
stack, and apparently also wants to do that nonsensical stack
alignment thing to make things even worse.

We use this:

  static __always_inline unsigned long variable__ffs(unsigned long word)
  {
        asm("rep; bsf %1,%0"
                : "=r" (word)
                : "rm" (word));
        return word;
  }

for the definition, and it looks like clang royally just screws up
here. Yes, "m" is _allowed_ in that input set, but it damn well
shouldn't be used for something that is already in a register, since
"r" is also allowed, and is the first choice.

I think it's this clang bug:

    https://github.com/llvm/llvm-project/issues/20571
    https://github.com/llvm/llvm-project/issues/30873
    https://github.com/llvm/llvm-project/issues/34837

and it doesn't matter for *this* case (since I don't think this
library function is ever used on x86), but it looks like a generic
clang issue.

                 Linus

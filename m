Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D181E788FD2
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Aug 2023 22:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjHYU0L (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Aug 2023 16:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbjHYUZp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Aug 2023 16:25:45 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA0D1BE6
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 13:25:40 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52a23227567so1940408a12.0
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 13:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1692995138; x=1693599938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t/I6k8XQEM7hjaOOfSAn58fagKJ85ckJj5+q/KrB8ss=;
        b=Zxlq/xZ6uUuAV9R+mWWwy0xTB2Xe99iHpn5Y8KwZvdpo4dpoyVyrtGCsmsCP7ZZwjK
         O+KioXSvh3TNjsyKBoLqhDEXz6meQMYv5+nILRPZvxkTDON8rUMYO/h3l0BYBsS7xnaH
         xBhQByyks52TgMDJnEUcimNg41x2CI+ACrKX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692995138; x=1693599938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/I6k8XQEM7hjaOOfSAn58fagKJ85ckJj5+q/KrB8ss=;
        b=f2gxsdtoXx63HOIFAsyjjQB9YwBKZrX8sbnD58I+dKhWNzT9GDTTYGcK/aOneGncJd
         xGQePbN4vdE2N6s2JGVjSdef07s5+kEcR5qrWgFrq3y35vobEJh4QsI0UgJITEODEB0Z
         StRwUZ1NfTpK5OhIP6kCp9OUX4bwSV+I6BXog6flEj31cGOOWBio9o4rrQqs8zMrmDmZ
         kXMJwAIjH+i8tg4e5QNoECY/K3jwCt7RQa/UaMT0rfyH4RILPz8SoitUxtwvn4LcBnKL
         xx7s//ycrjUm+Ab3Pr8FfZpJXzQmJ53FPplvljIzcTVTHnI5XesiF6QXfDmSyQ4U2ouQ
         M3Uw==
X-Gm-Message-State: AOJu0YyBz1mFjAhaeQZejQD9FLxwOemhCr6TRR29omTv54ZQZNyxOBXS
        1zKf0HQZfw9fNQAs0APnhpOjxzfEaeqCcvanko+oRg==
X-Google-Smtp-Source: AGHT+IHB+LIioT5MThCt2GiFpCjB89nQU0f/UMcdZ1I5S6BET+14WnCN489MoEwD9gTRYKeiIXNzoQ==
X-Received: by 2002:a17:907:2be2:b0:9a2:2842:f1c6 with SMTP id gv34-20020a1709072be200b009a22842f1c6mr3216389ejc.28.1692995138341;
        Fri, 25 Aug 2023 13:25:38 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906840d00b00992665694f7sm1289911ejx.107.2023.08.25.13.25.36
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 13:25:36 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99bdcade7fbso161462166b.1
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 13:25:36 -0700 (PDT)
X-Received: by 2002:a17:906:1ba9:b0:9a1:680e:8c54 with SMTP id
 r9-20020a1709061ba900b009a1680e8c54mr14678934ejg.71.1692995136227; Fri, 25
 Aug 2023 13:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <ZOkGCSNr0VN2VIJJ@p100>
In-Reply-To: <ZOkGCSNr0VN2VIJJ@p100>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 25 Aug 2023 13:25:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZwSymfuGvf7TX3UQLU1OMN1FZMnEA-Hja0ruqyhMK4A@mail.gmail.com>
Message-ID: <CAHk-=wjZwSymfuGvf7TX3UQLU1OMN1FZMnEA-Hja0ruqyhMK4A@mail.gmail.com>
Subject: Re: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
To:     Helge Deller <deller@gmx.de>
Cc:     linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Chanho Min <chanho.min@lge.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

On Fri, 25 Aug 2023 at 12:50, Helge Deller <deller@gmx.de> wrote:
>
> This patch fixes the in-kernel functions __clzdi2() and __ctzdi2() [..]

Applied,

               Linus

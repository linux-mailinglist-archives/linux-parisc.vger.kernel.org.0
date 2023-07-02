Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB777452FE
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jul 2023 00:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbjGBWp5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jul 2023 18:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjGBWp4 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jul 2023 18:45:56 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B04D1BC
        for <linux-parisc@vger.kernel.org>; Sun,  2 Jul 2023 15:45:55 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6a152a933so57586841fa.1
        for <linux-parisc@vger.kernel.org>; Sun, 02 Jul 2023 15:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688337953; x=1690929953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rbSGoMaDXuLTUnz0WGxSI7CF/z5suPv717y+50H5ixI=;
        b=StspcepUYcEgcCUtJ4IwnwdxoNsUWnZMTNCThy93R7sGFKyZ/R58wVWcf73ERAPggm
         z9tW8saRzj3UyHj45uq+vqksU4sOENZyv4JHdHWP8FVL/Cfxl769B+p1DdnRQnXR0KNU
         WuwbUyv5Xofh8zkMERcfkj94nWUrYCsQkYsFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688337953; x=1690929953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbSGoMaDXuLTUnz0WGxSI7CF/z5suPv717y+50H5ixI=;
        b=W4ikHTuE+b+agZpMS7LId/zQg3ui68T7ola0NqSm1Q1rfuRn/gXwxImg+ang5rk8CC
         lgBNjgkwzVWcEw43C9clllM8MnTnEfiVZNEKDB2K44mj7SgV9Q9ARwNsIBme/T5Fbbbz
         d+HAoYXHmQ+y3SmudAw+7iHSNmbbTMPTxP9lRtlFgZ2udqiOpMmbnAcxhMTq+js7dZgX
         n93WX6NYkk9T/IwwmzYg9gRMq2iIEmFpVdAmpTVoqEHL+sAxE7wBM7auEp/jMrhoJqnT
         RVvgQ0doH3XBMG5OLbPKHUQtDkfSm6PmI0dxEojuP4HNOhGFTlTthFc2oE3syNq0dj+n
         O4PA==
X-Gm-Message-State: ABy/qLaQGwCCKUlCPqU3SwNZGCh4+ow97tUuFHt/TfqZDgmjYYQ6B8+H
        q0iAIbJFhLI208WHwAbot5TY8JA7F+t7LAg5NQ9YEqLF
X-Google-Smtp-Source: APBJJlH5qNoxaRyuZiqe9x4GEy2BauWbWeWLC3GTEUyzDdHL00erhQs5CHnFJH8sRxT03RZA4zXG+A==
X-Received: by 2002:a05:651c:1030:b0:2b5:7dd9:74f5 with SMTP id w16-20020a05651c103000b002b57dd974f5mr5689334ljm.21.1688337953440;
        Sun, 02 Jul 2023 15:45:53 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id x18-20020a05651c105200b002b6ce06618dsm2148632ljm.21.2023.07.02.15.45.51
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 15:45:52 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b6a1fe5845so57595481fa.3
        for <linux-parisc@vger.kernel.org>; Sun, 02 Jul 2023 15:45:51 -0700 (PDT)
X-Received: by 2002:a2e:7d15:0:b0:2b6:9f59:7b3c with SMTP id
 y21-20020a2e7d15000000b002b69f597b3cmr5360404ljc.14.1688337951675; Sun, 02
 Jul 2023 15:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230629184151.888604958@linuxfoundation.org> <CA+G9fYsM2s3q1k=+wHszvNbkKbHGe1pskkffWvaGXjYrp6qR=g@mail.gmail.com>
 <CAHk-=whaO3RZmKj8NDjs4f6JEwuwQWWesOfFu-URzOqTkyPoxw@mail.gmail.com>
 <2023063001-overlying-browse-de1a@gregkh> <0b2aefa4-7407-4936-6604-dedfb1614483@gmx.de>
 <5fd98a09-4792-1433-752d-029ae3545168@gmx.de>
In-Reply-To: <5fd98a09-4792-1433-752d-029ae3545168@gmx.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 2 Jul 2023 15:45:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiHs1cL2Fb90NXVhtQsMuu+OLHB4rSDsPVe0ALmbvZXZQ@mail.gmail.com>
Message-ID: <CAHk-=wiHs1cL2Fb90NXVhtQsMuu+OLHB4rSDsPVe0ALmbvZXZQ@mail.gmail.com>
Subject: Re: [PATCH 6.4 00/28] 6.4.1-rc1 review - hppa argument list too long
To:     Helge Deller <deller@gmx.de>
Cc:     stable@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, linux@roeck-us.net,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, 2 Jul 2023 at 14:33, Helge Deller <deller@gmx.de> wrote:
>
> Actually, your changes seems to trigger...:
>
> root@debian:~# /usr/bin/ls /usr/bin/*
> -bash: /usr/bin/ls: Argument list too long

So this only happens with _fairly_ long argument lists, right? Maybe
your config has a 64kB page size, and normal programs never expand
beyond a single page?

I bet it is because of f313c51d26aa ("execve: expand new process stack
manually ahead of time"), but I don't see exactly why.

But pa-risc is the only architecture with CONFIG_STACK_GROWSUP, and
while I really thought that commit should do the exact same thing as
the old

  #ifdef CONFIG_STACK_GROWSUP

special case, I must clearly have been wrong.

Would you mind just verifying that yes, that commit on mainline is
broken for you, and the previous one works?

               Linus

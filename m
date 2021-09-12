Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD9F407F9F
	for <lists+linux-parisc@lfdr.de>; Sun, 12 Sep 2021 21:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235759AbhILTOr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 Sep 2021 15:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235622AbhILTOq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 Sep 2021 15:14:46 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7E6C061574
        for <linux-parisc@vger.kernel.org>; Sun, 12 Sep 2021 12:13:32 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a4so16239021lfg.8
        for <linux-parisc@vger.kernel.org>; Sun, 12 Sep 2021 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tzZRty5syTefvslqvSNH1KyI4p4ePIHehKrpq3jNHak=;
        b=UhV7ZB03lfxtT+Ye8FzC9W6hmCQoAxoCGQimJcLY7prrx8mbKe9DIiT4SGaXesQFeB
         bwrVZJdZaPGgx4eSKLVt3nOkqcznQcyPpP9BRmCWBP8k038tMJltDQ1VrUpAU3aNMwNA
         gTOxiP2LUi8KOIoIT19q3qZx861ljKejcehZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tzZRty5syTefvslqvSNH1KyI4p4ePIHehKrpq3jNHak=;
        b=sC0nYPUY6Vi9fxGPee3c6oEcZp8o7ImfMTEABnKwWYqpohkAL9yppNVY/EsGD7Dh5o
         JpZ/BFvEjnFv6t/P1pQp085jxwoiBQCUnNbAkYo/4U+drwUATGrG9JTOoxj8hc2Kk+n4
         ctuB43E9s2b/WK7S1OtaKGG04dZhLUjgB/hfzI32qCPO+SI5VXwe3MmGBcdWFbwX29dX
         p5e+TmDL1uAbHqVPzz81uj8Emlk7SzL3pdvEd83xZNeTbwCmA1nU5m2++xdmBdrJj6s8
         R/l6xIIonmuTaYpLwEXnSP5JgKy75QKpAEJ5zeXf+jAIHlrB1uQoH0RzwPFVYX+TRFCG
         Xm5w==
X-Gm-Message-State: AOAM531zxhr2IuCjwLU+SC0l/COYm48UvW8saRAaaPMBeWLQzwuidCGa
        aNXfm1m0RvCGJji8q9GeSXHDnyiI8t+7BDGREvA=
X-Google-Smtp-Source: ABdhPJwMKe414tR+e9vAjPPhDXQa7ycIjBSOSli/+FfnYVxKe6xGRquFvu58TlqJ4aPNgR4ZLxLM+A==
X-Received: by 2002:a05:6512:5cf:: with SMTP id o15mr6194558lfo.81.1631474009729;
        Sun, 12 Sep 2021 12:13:29 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id d19sm593145lfv.74.2021.09.12.12.13.27
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Sep 2021 12:13:27 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id i25so12301601lfg.6
        for <linux-parisc@vger.kernel.org>; Sun, 12 Sep 2021 12:13:27 -0700 (PDT)
X-Received: by 2002:a05:6512:3da5:: with SMTP id k37mr6351605lfv.655.1631474006987;
 Sun, 12 Sep 2021 12:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210912160149.2227137-1-linux@roeck-us.net> <20210912160149.2227137-5-linux@roeck-us.net>
In-Reply-To: <20210912160149.2227137-5-linux@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 12 Sep 2021 12:13:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi1=8shingNuo1CtfJ7eDByDsmwsz750Nbxq=7q0Gs+zg@mail.gmail.com>
Message-ID: <CAHk-=wi1=8shingNuo1CtfJ7eDByDsmwsz750Nbxq=7q0Gs+zg@mail.gmail.com>
Subject: Re: [PATCH 4/4] alpha: Use absolute_pointer for strcmp on fixed
 memory location
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

On Sun, Sep 12, 2021 at 9:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> -       if (strcmp(COMMAND_LINE, "INSTALL") == 0) {
> +       if (strcmp(absolute_pointer(COMMAND_LINE), "INSTALL") == 0) {

Again, this feels very much like treating the symptoms, not actually
fixing the real issue.

It's COMMAND_LINE itself that should have been fixed up, not that one use of it.

Because the only reason you didn't get a warning from later uses is
that 'strcmp()' is doing compiler-specific magic. You're just delaying
the inevitable warnings about the other uses of that thing.

            Linus

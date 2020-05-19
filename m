Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85CE11D9D25
	for <lists+linux-parisc@lfdr.de>; Tue, 19 May 2020 18:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729370AbgESQq3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 May 2020 12:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728953AbgESQqZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 May 2020 12:46:25 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7990FC08C5C2
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:46:23 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m18so459513ljo.5
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TC0qAtFd13O2JOLCB7SFLNnsJ0TrRRfShJMVEYLbwy0=;
        b=BM7rNRUOZPJu6CqIZoTyNHsH3OhfbJ7v4lyTa1sXCfThZdyIW2MAwpqUoVdCrwYJYJ
         M+8yUvqSB1mogas+2iJO8jLleH/wb+mxdAsp/6H+RxHZ44GfbLZBQMjsb0UkWlV6SNKA
         VToCUizM9QTTj9Opl/oBOtfqOQD3JZAH4FWEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TC0qAtFd13O2JOLCB7SFLNnsJ0TrRRfShJMVEYLbwy0=;
        b=rzoOvetV1VkTWMEB2h0W4hNomx8msEObBLyVVHiT1GA/3dUocemMAcfG2zvwadVBLe
         3Zt48gvp7092Pi5vbRxJ9B0VCtWnc5qTIUpDsdzMKwrue6QAvfucPvfHVX4dwjRSUf0B
         ZzRoNC878JSLKMo2n9jk+zJy+X+P3G/aQzShgASHM1OIuWMimNEGrFDjk8FmInW78/ZP
         HfeGVRwqQkWT3HwHGHdtXcet72O9vbihca//y/thLqPry6EUqipDjzXIIx7AKTzo6TW8
         2eIpKA61dhGvJjwR2nuWkiMR6vwwgBK2QMTsfi71TSc/SuaJnlZMK6DQt53vYIbzWoDd
         z1zQ==
X-Gm-Message-State: AOAM532/WbIQebz6NZHQsUqF7eiNxNumLuUH0ota4fKJhOaIk7IkjGrM
        u0/p5tV0F5lSpLst51rfNNl50HhDCho=
X-Google-Smtp-Source: ABdhPJwn7XXEhURWPHoj3eODmDvvQHhH9nG3nzs0h5qDySNbmqhAvFHxpOq5lKrChB+bdYLLeE/rFw==
X-Received: by 2002:a05:651c:319:: with SMTP id a25mr161019ljp.209.1589906781102;
        Tue, 19 May 2020 09:46:21 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id q16sm10457886lfp.9.2020.05.19.09.46.18
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 09:46:19 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id u6so452608ljl.6
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:46:18 -0700 (PDT)
X-Received: by 2002:a2e:8956:: with SMTP id b22mr218841ljk.16.1589906778412;
 Tue, 19 May 2020 09:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200519134449.1466624-1-hch@lst.de> <20200519134449.1466624-13-hch@lst.de>
 <CAHk-=whE_C2JF0ywF09iMBWtquEfMM3aSxCeLrb5S75EdHr1JA@mail.gmail.com> <20200519164146.GA28313@lst.de>
In-Reply-To: <20200519164146.GA28313@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 19 May 2020 09:46:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=whVd4evLe-pi7VNrh4Htp1SjogWtEqgot6Ta+kavyqamg@mail.gmail.com>
Message-ID: <CAHk-=whVd4evLe-pi7VNrh4Htp1SjogWtEqgot6Ta+kavyqamg@mail.gmail.com>
Subject: Re: [PATCH 12/20] maccess: remove strncpy_from_unsafe
To:     Christoph Hellwig <hch@lst.de>
Cc:     "the arch/x86 maintainers" <x86@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-parisc@vger.kernel.org,
        linux-um <linux-um@lists.infradead.org>,
        Netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, May 19, 2020 at 9:41 AM Christoph Hellwig <hch@lst.de> wrote:
>
> I had a lot of folks complaining about things like:
>
> #ifdef CONFIG_FOO
>         if (foo)
>                 do_stuff();
>         else
> #endif
>                 do_something_else();
>
> which I personally don't mind at all, so I switched to this style.

Well, I don't particularly like that style either, it is _very_ easy
to get wrong when you edit it later (and various indentation checkers
tend to be very unhappy about it too).

But that's why I like trying to just make simple helper functions instead.

Yeah, it's often a few more lines of code (if only because of the
extra function definition etc), but with good naming and sane
arguments those few extra lines can also help make it much more
understandable in the process, and it gives you a nice place to add
commentary for the really odd cases (comments inside code that then
does other things often make things just harder to see).

             Linus

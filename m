Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37C81D2299
	for <lists+linux-parisc@lfdr.de>; Thu, 14 May 2020 01:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732243AbgEMXDl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 13 May 2020 19:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732238AbgEMXDl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 13 May 2020 19:03:41 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F39C061A0F
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 16:03:40 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id h188so207770lfd.7
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 16:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wdZg4gkYTds/C4KUVy9erLK1Ch+WqNN+RvFMTseVuAg=;
        b=C1TcjV6OtJpa2YRiWAUnGcZZ/u09cBy851Mx94wSMSQa9VrdsWV1jVHW4P1sNrL8Bh
         F6WpmJ1tQWre2J0ca6Wb2LX04yqV6LxMJpd1Tpa6EPb8PrEYBkkbwpuLaAdO/BjmCZ2G
         9egVYPaqRVmuIV8Yift2HwrZ/fz1dHM99i9n0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wdZg4gkYTds/C4KUVy9erLK1Ch+WqNN+RvFMTseVuAg=;
        b=OlI824X54VlRvkzcWo6p97gvd1+Ud38M4lLbu+bp7UBOKAS/09OP9M+mpcpqSN1I3F
         DE2IA8AjW/eYUsasH1KZ7aUYMWzFjPdRu0FNCMMkiAlYxoNIgu2b4zB/OHm4WGor0rJ2
         D5JdNPwXIC/4pDd85Wln2KXnHtEyWdEb2mhwzPl6GRHPgiF9Mc7U+UF04LyULP8q//1p
         JBa+TbRrAsF3v69m9vOOMBZZSSHeuTgWIfVCfIOPZ9Gydhk9KntXeOaO+lf8lXodNGqk
         mEdLL3YQsSqUjiDxVVBhWs0qS8DlRkkJPNRH//hFAvtwv4KiEk9tKL2OnC2LScFgxgge
         aGdQ==
X-Gm-Message-State: AOAM5318Ajo/J9c4Tcin+FlAwNvFVbqGo6vMOQdbYPh/gi4VIIvKMjSt
        Pm0bgseTmAzl1mqsz6Ju3rUjkC6AIxk=
X-Google-Smtp-Source: ABdhPJzyknNDRjF+TZ1KmYgqIwxCgVPAZOXnKUPHW1o1Q4LFVXBNOeFj7bhQb/8Bk+tkZuW01T683w==
X-Received: by 2002:a19:4a97:: with SMTP id x145mr1147850lfa.66.1589411018320;
        Wed, 13 May 2020 16:03:38 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id b25sm419989ljp.105.2020.05.13.16.03.36
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 16:03:36 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id b26so951075lfa.5
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 16:03:36 -0700 (PDT)
X-Received: by 2002:ac2:58c8:: with SMTP id u8mr1177915lfo.142.1589411015919;
 Wed, 13 May 2020 16:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200513160038.2482415-1-hch@lst.de> <20200513160038.2482415-12-hch@lst.de>
 <CAHk-=wj=u+nttmd1huNES2U=9nePtmk7WgR8cMLCYS8wc=rhdA@mail.gmail.com>
 <20200513192804.GA30751@lst.de> <0c1a7066-b269-9695-b94a-bb5f4f20ebd8@iogearbox.net>
In-Reply-To: <0c1a7066-b269-9695-b94a-bb5f4f20ebd8@iogearbox.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 13 May 2020 16:03:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiivWJ70PotzCK-j7K4Y612NJBA2d+iN6Rz-bfMxCpwjQ@mail.gmail.com>
Message-ID: <CAHk-=wiivWJ70PotzCK-j7K4Y612NJBA2d+iN6Rz-bfMxCpwjQ@mail.gmail.com>
Subject: Re: [PATCH 11/18] maccess: remove strncpy_from_unsafe
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
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

On Wed, May 13, 2020 at 3:36 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> It's used for both.

Daniel, BPF real;ly needs to make up its mind about that.

You *cannot* use ti for both.

Yes, it happens to work on x86 and some other architectures.

But on other architectures, the exact same pointer value can be a
kernel pointer or a user pointer.

> Given this is enabled on pretty much all program types, my
> assumption would be that usage is still more often on kernel memory than user one.

You need to pick one.

If you know it is a user pointer, use strncpy_from_user() (possibly
with disable_pagefault() aka strncpy_from_user_nofault()).

And if you know it is a kernel pointer, use strncpy_from_unsafe() (aka
strncpy_from_kernel_nofault()).

You really can't pick the "randomly one or the other guess what I mean " option.

                  Linus

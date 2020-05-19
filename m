Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116451D9C06
	for <lists+linux-parisc@lfdr.de>; Tue, 19 May 2020 18:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729001AbgESQIR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 May 2020 12:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729325AbgESQIR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 May 2020 12:08:17 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A47C08C5C0
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:08:16 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w15so4360994lfe.11
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yx5q8kTLmBrxy32bs18zizlzOjtx0vFts57BKijzI48=;
        b=HCXGSXVripfdjF3MiGwI8HqE63+BVnW9g3cwRZiRc5Emx+jBu6A4Nsobp13SbpFd6U
         Lyt8wvpLjFnfI845wbjgkTVZflwu9OTBrRm/9vher3ASfX9/MH65gZZ8ahxQbI/5jnLa
         wMfTgbalXvP1B/G3Ib0nnbu0+sXLvWt0bQgfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yx5q8kTLmBrxy32bs18zizlzOjtx0vFts57BKijzI48=;
        b=ZvUMCFP9yc4xsvsjdtdR3qEoAFWjNkhMp6qQUnwthwDZbEGOEBH7l7WRqk2E1Ajgy5
         ogHwvC2saaAP80KPI+vUOrbbC1CCqQrB/Y83TZGli0cYKp3x1K2tHe/+K65I7oxFBuYt
         bKyRk976yla5pfOoNIJ5Wp8HIpGK9Hmp2ejiItmxvuCLnyzVhUBZy9OCrLCRthkvBRLp
         KIQ5SHklw6hrSgGBJ3BAj92i5lQ4B5LzHv0THcHQmbX9Hkc8OJY4+aH3gO7ksAlDGGy4
         jXVOARvVpbg7PvqK4Kt50JWgyk1jV7g3vjjuA9XC0LOZceTbeLXYjbxzHW11TfY/12QW
         6SLg==
X-Gm-Message-State: AOAM532kcXYt1XqlIbzvJ8df0sHdDKTmZbDVnpZHx2xII86nFmCwltOn
        H2iUTEheLWIzoOB3bhMvmN6gbvT6rjU=
X-Google-Smtp-Source: ABdhPJzhKzXQOk4eTqOFIBTk0Qsw/Zm9aVVADwpKjhVH9YW6vZYzsxH/1lVkx7+FXBKghLOsE5rs3g==
X-Received: by 2002:ac2:4a70:: with SMTP id q16mr15590569lfp.79.1589904493612;
        Tue, 19 May 2020 09:08:13 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id y28sm45619ljn.4.2020.05.19.09.08.12
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 09:08:12 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 202so11694821lfe.5
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:08:12 -0700 (PDT)
X-Received: by 2002:ac2:5a0a:: with SMTP id q10mr1343727lfn.142.1589904491650;
 Tue, 19 May 2020 09:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200519134449.1466624-1-hch@lst.de> <20200519134449.1466624-12-hch@lst.de>
In-Reply-To: <20200519134449.1466624-12-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 19 May 2020 09:07:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjm3HQy_awVX-WyF6KrSuE1pcFRaNX_XhiLKkBUFUZBtQ@mail.gmail.com>
Message-ID: <CAHk-=wjm3HQy_awVX-WyF6KrSuE1pcFRaNX_XhiLKkBUFUZBtQ@mail.gmail.com>
Subject: Re: [PATCH 11/20] bpf: factor out a bpf_trace_copy_string helper
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

On Tue, May 19, 2020 at 6:45 AM Christoph Hellwig <hch@lst.de> wrote:
>
> +       switch (fmt_ptype) {
> +       case 's':
> +#ifdef CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
> +               strncpy_from_unsafe(buf, unsafe_ptr, bufsz);
> +               break;
> +#endif
> +       case 'k':
> +               strncpy_from_kernel_nofault(buf, unsafe_ptr, bufsz);
> +               break;

That 's' case needs a "fallthrough;" for the overlapping case,
methinks. Otherwise you'll get warnings.

                  Linus

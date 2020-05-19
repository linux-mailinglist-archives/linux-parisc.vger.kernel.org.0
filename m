Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797521D9CEE
	for <lists+linux-parisc@lfdr.de>; Tue, 19 May 2020 18:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729053AbgESQgg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 May 2020 12:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729132AbgESQgg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 May 2020 12:36:36 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E31C08C5C0
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:36:35 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u6so418742ljl.6
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z16ZFiLRHWlE76l/Nnyd5FZZ2VSBLxmf0lz5LDCxbPs=;
        b=UORYpGfRWpAQPT7Eim9FPjPnn5GKxiDiyP2S+AQw0QYKUVeSC2Y2buNVi8EbpRkorO
         IcT1mnMe0MchbGIuyrDccORk12Xm6v8WUDLE8lpsgynSHzLIn9GW5XFMJoAg1fWLV4X4
         DbGGa/kxryZV9vtywESRiuCWoDlSmVvuwa5YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z16ZFiLRHWlE76l/Nnyd5FZZ2VSBLxmf0lz5LDCxbPs=;
        b=NXwC6euLdU1ccGTOINd1IwITby3a7tGOoZSGiXTkemzsvPjjYujwdHd6PwhFaAQ557
         Aze6MyHRQE5AU4N7DRvHPkLAVO9yLm1kWwX6jr+eLQqevGvzG1Q7LFnsiFbkC3Rjkms5
         +Ty8SU4r1uXDgckpNAEO2lKr3CtxAlJj8zXyvsHR1Ynl9GfoDmPbh/yuNntNQtyGkHMn
         lRjhPKTiPl5g/nZKVSLWT6YNUc6DfpD7uw+JWP3IhK40VvzRwwcHQhAPJFnP3CCMEGfV
         sWTZYJ7qbCydGKByO+lMQtSpXonjoWLBMvdlUoRLceD3QP6GgJblpzU+lkW6ouZG1unx
         xFrg==
X-Gm-Message-State: AOAM532pLrFyC2G19yyo4TWpIvqQQO7HznRemmZpND6a9NK0TfdXLP32
        scttqrHkofLO8Ornvaxh594CkdzT00I=
X-Google-Smtp-Source: ABdhPJyqJ5IgCISHUwg4ISdjXUpgVO2+YrLvojuNTTtQwC3wpdpbzX3mLAixpuuVuKfJiQ/HWclo6Q==
X-Received: by 2002:a2e:9093:: with SMTP id l19mr170014ljg.27.1589906193252;
        Tue, 19 May 2020 09:36:33 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id e19sm73436lja.19.2020.05.19.09.36.32
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 09:36:32 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id v16so407234ljc.8
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:36:32 -0700 (PDT)
X-Received: by 2002:a05:651c:1183:: with SMTP id w3mr156059ljo.265.1589906191917;
 Tue, 19 May 2020 09:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200519134449.1466624-1-hch@lst.de> <20200519134449.1466624-12-hch@lst.de>
 <CAHk-=wjm3HQy_awVX-WyF6KrSuE1pcFRaNX_XhiLKkBUFUZBtQ@mail.gmail.com> <20200519161418.GA26545@lst.de>
In-Reply-To: <20200519161418.GA26545@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 19 May 2020 09:36:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjcmfe__pphtjGzLMJ2kFN0ZTRZQJQVunRxL+9E2Xki=Q@mail.gmail.com>
Message-ID: <CAHk-=wjcmfe__pphtjGzLMJ2kFN0ZTRZQJQVunRxL+9E2Xki=Q@mail.gmail.com>
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

On Tue, May 19, 2020 at 9:14 AM Christoph Hellwig <hch@lst.de> wrote:
>
> I don't think we need it as the case of
>
>         case 'a':
>         case 'b':
>                 do_stuff();
>                 break;
>
> has always been fine even with the fallthough warnings.  And the
> rest of the stuff gets removed by cpp..

You're right. I read it as a fallthrough because as a human it looks
like there's code in there between, but yeah, the compiler won't
actually ever see it.

So scratch that objection.

              Linus

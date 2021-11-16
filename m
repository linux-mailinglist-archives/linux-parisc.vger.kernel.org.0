Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7EBB4528CD
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Nov 2021 04:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235968AbhKPD5H (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 15 Nov 2021 22:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235923AbhKPD5F (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 Nov 2021 22:57:05 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50700C0337DF
        for <linux-parisc@vger.kernel.org>; Mon, 15 Nov 2021 16:35:15 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id v19so5167588plo.7
        for <linux-parisc@vger.kernel.org>; Mon, 15 Nov 2021 16:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6YrJDwz5lHylUrRKBiCCXn7XIadwbTCaDNmr8F8Qv+s=;
        b=kRgsOovbagRO/7210nSyOKEBlmhfA5hNYfPQV4k7lydus9N2uNl5Vt0UygZC7jGLy1
         CcSKdAOPN7CAjIaxG2Nk7LhNoTdTNyUIV57l7UZ/U0TQtm7n+dBKTmv+GCqWpklKxw86
         72xq1Tvc+lxHwltemgeZ72MdiUZIJVqjFa0RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6YrJDwz5lHylUrRKBiCCXn7XIadwbTCaDNmr8F8Qv+s=;
        b=fdYMJPsdkrvgzjk+sR312bCB+f/fzfsYqQMJSDRcNzPmXxbQ6LyUhm9PtS3Nwdjd9x
         0BNqB8S3HxFMoMEEOrV+4r3vQ4M0TeRLSeNuImPUw/C3HWBFrZXmRCR4ZJ8LDGw4lRev
         7WBaT8sGA3OMoVHaTJvQG3hia1RKT64xM+d6oTCmyuk0q7Z4fadVQh0M9p0sg6YA2jKN
         AlGHhFqA8UTDyMmTxyfd/HOLvX+VHXTnxLa1+ud+BnXImNsuhTuk8LP0+YTKkY8tAZmj
         inlzQnlbztOm3EDZ32NUMC9MpLePD+HFrQqJbWV0imhFOYyn0EMwkmRf5pOZUc9knWRJ
         fUOQ==
X-Gm-Message-State: AOAM531ejLg2LS6NcGFrJ5Q07U53MNWK4Xx/qaNsc+RgktMaxdsfsFUf
        PD6/rX0vJLAoKof3FBO6LE1p6Q==
X-Google-Smtp-Source: ABdhPJy9iYaBB3Pj/LejC8q7/hsST+5gxO7ABIHhxz3+lYk9ZK6BkrL6e9tXPNM1m5lGV6jB9/FWOw==
X-Received: by 2002:a17:90a:c398:: with SMTP id h24mr3495024pjt.73.1637022914921;
        Mon, 15 Nov 2021 16:35:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s21sm16292860pfk.3.2021.11.15.16.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 16:35:14 -0800 (PST)
Date:   Mon, 15 Nov 2021 16:35:14 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Marco Elver <elver@google.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Terrell <terrelln@fb.com>,
        Rob Clark <robdclark@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Anton Altaparmakov <anton@tuxera.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Joey Gouly <joey.gouly@arm.com>,
        Stan Skowronek <stan@corellium.com>,
        Hector Martin <marcan@marcan.st>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-ntfs-dev@lists.sourceforge.net,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>
Subject: Re: Build regressions/improvements in v5.16-rc1
Message-ID: <202111151633.DE719CE@keescook>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
 <YZKOce4XhAU49+Yn@elver.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZKOce4XhAU49+Yn@elver.google.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Nov 15, 2021 at 05:44:33PM +0100, Marco Elver wrote:
> On Mon, Nov 15, 2021 at 05:12PM +0100, Geert Uytterhoeven wrote:
> [...]
> > >   + /kisskb/src/include/linux/fortify-string.h: error: call to '__read_overflow' declared with attribute error: detected read beyond size of object (1st parameter):  => 263:25, 277:17
> > 
> >     in lib/test_kasan.c
> > 
> > s390-all{mod,yes}config
> > arm64-allmodconfig (gcc11)
> 
> Kees, wasn't that what [1] was meant to fix?
> [1] https://lkml.kernel.org/r/20211006181544.1670992-1-keescook@chromium.org

Ah, I found it:

http://kisskb.ellerman.id.au/kisskb/buildresult/14660585/log/

it's actually:

    inlined from 'kasan_memcmp' at /kisskb/src/lib/test_kasan.c:897:2:

and

    inlined from 'kasan_memchr' at /kisskb/src/lib/test_kasan.c:872:2:

I can send a patch doing the same as what [1] does for these cases too.

-- 
Kees Cook

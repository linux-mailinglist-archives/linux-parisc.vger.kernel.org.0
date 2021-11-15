Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC624509E5
	for <lists+linux-parisc@lfdr.de>; Mon, 15 Nov 2021 17:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhKOQrs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 15 Nov 2021 11:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbhKOQro (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 Nov 2021 11:47:44 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2564AC061570
        for <linux-parisc@vger.kernel.org>; Mon, 15 Nov 2021 08:44:43 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d24so32030999wra.0
        for <linux-parisc@vger.kernel.org>; Mon, 15 Nov 2021 08:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ebmLJNm972HwzSUFY9uX5jVcx5/iRccpx4YVQ/Ccmok=;
        b=g0iqrBMJQyEnc9qSvvS/XvHhd4djVrsEvm98CX1l0gQprLyW37oWizStTVfu+JpU4j
         1snhgegTeq2Go6+vBUOrpXihNI10YMbkcvvXaEwefmt0nfKCUqM6py3tUZZT1Yz+ysvt
         RtY0+uWnRT0CdzccrmRVIVXM3cI2M0sPczP6vvdlmzk8FrzjyEthEg9YPZL+bo2ajWHS
         EIUTacEpVfIuOn/rHjnvRUH4nNnMrd2RlGND++F7kkjRGZrkroOEqdM26t6d1RsdGwrK
         OgfAqIsE5ct/iU3rWgdDMBkLWE8Ys1mZWvoN7azO5tlcvifNOBh4n+QQwZMY/xUjR6Uj
         4KlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ebmLJNm972HwzSUFY9uX5jVcx5/iRccpx4YVQ/Ccmok=;
        b=m95MFmU4CUPe71QTyUrT4FZWoHtr5OIxfT2SUMblkIDe4qoKbWbIba9lg9i1/hU4Mu
         VrRoTIzpp4qRQ3wJbMUm24CWtlqSEiTefpnNd1ka4GQQXzn/0Mc2OB5Xz9YUKoQb3kge
         m6CHD5Hd7x61XQcJwakJpNLcMfA9nslkGf0f9W+tmoxLhTODKm3oYa0S42HwAu0PxEuO
         kCm2koGBUUnDuaTb+R/Q5d20duNy3CW84JN6nk7t2WC2TXMRXThk975QQVY/dfbdSl63
         Qq4zpRTlDTt20Z3OdQyep+Qomt1JMdwYpUeIP4qqDLqlYewAbwOqOsCmarUZyWWQbRPv
         /s4w==
X-Gm-Message-State: AOAM531oN8zYvNgp17H87ibYfwzulzcmwFCFPxHNY68AmNLhqQ7aQqI4
        ppVdI6HDQqhl/70qpY6Lz6iWTA==
X-Google-Smtp-Source: ABdhPJwPwppatgTfARevG5qj57LzkviHyAEVrbH6osVFyFMK9ugSZOG8qsD/QNJudQxR5pXFv4wYIw==
X-Received: by 2002:adf:e810:: with SMTP id o16mr394870wrm.359.1636994681553;
        Mon, 15 Nov 2021 08:44:41 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:15:13:6385:6bd0:4ede:d8c6])
        by smtp.gmail.com with ESMTPSA id 126sm19916816wmz.28.2021.11.15.08.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 08:44:40 -0800 (PST)
Date:   Mon, 15 Nov 2021 17:44:33 +0100
From:   Marco Elver <elver@google.com>
To:     Kees Cook <keescook@chromium.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
Message-ID: <YZKOce4XhAU49+Yn@elver.google.com>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Nov 15, 2021 at 05:12PM +0100, Geert Uytterhoeven wrote:
[...]
> >   + /kisskb/src/include/linux/fortify-string.h: error: call to '__read_overflow' declared with attribute error: detected read beyond size of object (1st parameter):  => 263:25, 277:17
> 
>     in lib/test_kasan.c
> 
> s390-all{mod,yes}config
> arm64-allmodconfig (gcc11)

Kees, wasn't that what [1] was meant to fix?
[1] https://lkml.kernel.org/r/20211006181544.1670992-1-keescook@chromium.org

Thanks,
-- Marco

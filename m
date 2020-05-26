Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7F81C0DD6
	for <lists+linux-parisc@lfdr.de>; Fri,  1 May 2020 07:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgEAFnN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 1 May 2020 01:43:13 -0400
Received: from condef-02.nifty.com ([202.248.20.67]:53211 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFnN (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 1 May 2020 01:43:13 -0400
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-02.nifty.com with ESMTP id 0415aNA1027372
        for <linux-parisc@vger.kernel.org>; Fri, 1 May 2020 14:36:23 +0900
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0415ZtH0030635;
        Fri, 1 May 2020 14:35:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0415ZtH0030635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588311356;
        bh=RK1lYUnnP0WlP/hnwXzHLTQYCVHAytVKSgzDdS9A6Fw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=awlm5PbWnuwgfunAQ6C27PoQIqgh8eCXGDntc2EPoeST9EzCPa0WeUwRXKqlu+RGe
         1i+HtyWwRYkPvMBTBpqJEJDoNptIMbKJBSwOPWSlCS9O69rU2+tm5WRPbEXcyxBu6/
         y29W6OgqHEI+EjB3YV0v3PuxSeX7T+fZ5p16nrI8WyQTNDFtxZMqftMVT7MY3jEbBU
         eLvZNbyeKqCZdkjW+p2RBmyeMpRy+biPGAFhVq58vKD760DKiE6RjDEetzdh4Ta24r
         9AcAO7dHe4uS0ZarDgEwezk2v1g9fdL87NCgaw5GO78gCMSbq7ADp0N2XMTSIt38oO
         08h4wzFSQg15Q==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id 36so3396346uaf.9;
        Thu, 30 Apr 2020 22:35:55 -0700 (PDT)
X-Gm-Message-State: AGi0PuZn9Rb7UWMwhHIxQzHthqjQTICFntWnnv3r/rjRl1YgpRHfl7wu
        5p+cNHWBqJXxqrZ3bR1XIxqETqVd6u+U00rCosg=
X-Google-Smtp-Source: APiQypJWnnbAeOsaCZwHmXskNjKj1KeFu9yK2RWbukNpj0yZJb1WzmTijTDPEJsD0TtVCOh0KsFWJM29syzsDcKrEWk=
X-Received: by 2002:a9f:28c5:: with SMTP id d63mr1745290uad.25.1588311354484;
 Thu, 30 Apr 2020 22:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200425054659.814774-1-masahiroy@kernel.org>
In-Reply-To: <20200425054659.814774-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 1 May 2020 14:35:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQk_fLFCWuFCC0NK3nxVE0bs-n7E+T-dbn14aCZVg_pgQ@mail.gmail.com>
Message-ID: <CAK7LNAQk_fLFCWuFCC0NK3nxVE0bs-n7E+T-dbn14aCZVg_pgQ@mail.gmail.com>
Subject: Re: [PATCH] parisc: suppress error messages for 'make clean'
To:     "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Apr 25, 2020 at 2:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> 'make ARCH=parisc clean' emits a tons of error messages as follows:
>
>   $ make ARCH=parisc clean
>   gcc: error: unrecognized command line option '-mno-space-regs'
>   gcc: error: unrecognized command line option '-mfast-indirect-calls'; did you mean '-mforce-indirect-call'?
>   gcc: error: unrecognized command line option '-mdisable-fpregs'
>   gcc: error: missing argument to '-Wframe-larger-than='
>   gcc: error: unrecognized command line option '-mno-space-regs'
>   gcc: error: unrecognized command line option '-mfast-indirect-calls'; did you mean '-mforce-indirect-call'?
>   gcc: error: unrecognized command line option '-mdisable-fpregs'
>   gcc: error: missing argument to '-Wframe-larger-than='
>     ...
>
> You can supporess them except '-Wframe-larger-than' by setting correct
> CROSS_COMPILE=, but we should not require any compiler for cleaning.
>
> This $(shell ...) is evaluated so many times because LIBGCC is exported.
> Use the ':=' operator to evaluate it just once, and sink the stderr.
>



Applied to linux-kbuild.


> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/parisc/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index 628cd8bb7ad8..d82787da43cd 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -21,7 +21,7 @@ KBUILD_IMAGE := vmlinuz
>
>  NM             = sh $(srctree)/arch/parisc/nm
>  CHECKFLAGS     += -D__hppa__=1
> -LIBGCC         = $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> +LIBGCC         := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name 2>/dev/null)
>  export LIBGCC
>
>  ifdef CONFIG_64BIT
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada

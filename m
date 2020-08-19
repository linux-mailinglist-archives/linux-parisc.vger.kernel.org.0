Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6A82496DF
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Aug 2020 09:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgHSHOo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Aug 2020 03:14:44 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43186 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgHSHOl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Aug 2020 03:14:41 -0400
Received: by mail-ot1-f66.google.com with SMTP id r21so18272317ota.10
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 00:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QQ5+a9W6oYD7hBGcYFg/kZErmgSEDZs9qIgFSSVzOm4=;
        b=mOV9Tea1QN4qtNHGjhnBSAb7sURcWHxNvFo0FYCyo59Gxb662VpQmT7T1DEVHpTluL
         +mfj4wgeSTilylT3EndXtZPzkwjc8p29ye1u2CIGp3514da3+AC4svMYTA7zRUPDuIqJ
         lQAlXwi++O2SnwC+wilptriN14UUeJawAZqpsGrP+mG6gyCsdBIRQzOaY/N2OuHSfbeZ
         oxyWU+Ppu5Msqq6XpVRvhoUlA7yoPWKxYKb8NkK3d+pxM02Mf/7MYfkEMFdcBJPCAtrq
         vYtKMOZI0/HBJuKhRX1lBRXqLgIDAW+tsHTuWvH9mRDl3d84wsKHLWGN5JIj4xMkHHEj
         Gv0w==
X-Gm-Message-State: AOAM532b/QXf0MzNFsomedNPIi2dPGwasGLOkWOaex49JhzX28wx6gUC
        deJJGYEi4ynNFQxKnBL56lfkgGtTGredZM+27Mk=
X-Google-Smtp-Source: ABdhPJxR25PW9eUiOTL8StHT5aZZaBgtAFOGF2baJY9bBSWvDhhcoSpCj1xX34qR7aYY7PPJLlb1Yh2TyPxLt4cnvfc=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr17210259otl.145.1597821280683;
 Wed, 19 Aug 2020 00:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597720138.git.pcc@google.com> <691510496a422023a2934d42b068493ed2d60ccc.1597720138.git.pcc@google.com>
In-Reply-To: <691510496a422023a2934d42b068493ed2d60ccc.1597720138.git.pcc@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Aug 2020 09:13:49 +0200
Message-ID: <CAMuHMdV9teGX8pJg5H6qYhAh=vB5D8wYddhcEyJBOGWPh_jfEQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] arch: move SA_* definitions to generic headers
To:     Peter Collingbourne <pcc@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        David Spickett <david.spickett@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Peter,

On Tue, Aug 18, 2020 at 5:39 AM Peter Collingbourne <pcc@google.com> wrote:
> Most architectures with the exception of alpha, mips, parisc and
> sparc use the same values for these flags. Move their definitions into
> asm-generic/signal-defs.h and allow the architectures with non-standard
> values to override them. Also, document the non-standard flag values
> in order to make it easier to add new generic flags in the future.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>

Thanks for your patch!

>  arch/m68k/include/uapi/asm/signal.h    | 24 -------------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/include/uapi/asm-generic/signal-defs.h
> +++ b/include/uapi/asm-generic/signal-defs.h
> @@ -4,6 +4,53 @@
>
>  #include <linux/compiler.h>
>
> +/*
> + * SA_FLAGS values:
> + *
> + * SA_ONSTACK indicates that a registered stack_t will be used.
> + * SA_RESTART flag to get restarting signals (which were the default long ago)
> + * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
> + * SA_RESETHAND clears the handler when the signal is delivered.
> + * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
> + * SA_NODEFER prevents the current signal from being masked in the handler.

Perhaps the order should match the order of the definitions below?
Then it becomes obvious SA_SIGINFO is not documented (it was on arm).

> + *
> + * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
> + * Unix names RESETHAND and NODEFER respectively.

I think moving this last comment below, just above the definitions of
SA_NOMASK and SA_ONESHOT, would make this easier to read.

> + */
> +#ifndef SA_NOCLDSTOP
> +#define SA_NOCLDSTOP   0x00000001
> +#endif
> +#ifndef SA_NOCLDWAIT
> +#define SA_NOCLDWAIT   0x00000002
> +#endif
> +#ifndef SA_SIGINFO
> +#define SA_SIGINFO     0x00000004
> +#endif
> +#ifndef SA_ONSTACK
> +#define SA_ONSTACK     0x08000000
> +#endif
> +#ifndef SA_RESTART
> +#define SA_RESTART     0x10000000
> +#endif
> +#ifndef SA_NODEFER
> +#define SA_NODEFER     0x40000000
> +#endif
> +#ifndef SA_RESETHAND
> +#define SA_RESETHAND   0x80000000
> +#endif
> +/*
> + * The following bits are used in architecture-specific SA_* definitions and
> + * should be avoided for new generic flags: 3, 4, 5, 6, 7, 8, 9, 16, 24, 25, 26.

And I think this belongs to the previous comment block.

> + */
> +
> +#define SA_NOMASK      SA_NODEFER
> +#define SA_ONESHOT     SA_RESETHAND
> +
> +/*
> + * New architectures should not define the obsolete
> + *     SA_RESTORER     0x04000000
> + */
> +
>  #ifndef SIG_BLOCK
>  #define SIG_BLOCK          0   /* for blocking signals */
>  #endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

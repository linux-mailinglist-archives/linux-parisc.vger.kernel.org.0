Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5679E4108AC
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Sep 2021 23:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239441AbhIRVOD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 18 Sep 2021 17:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239336AbhIRVOB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Sep 2021 17:14:01 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AFFC061764
        for <linux-parisc@vger.kernel.org>; Sat, 18 Sep 2021 14:12:37 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z24so22307576lfu.13
        for <linux-parisc@vger.kernel.org>; Sat, 18 Sep 2021 14:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yVZJu4t/IugUGV+W6kU+ykKkbEaLVPP4RIQU42du5mE=;
        b=NO0esR917j83JwTOpZQWYClId3457L6NJIf6fJ7Evei4pDJ6w9tdhLXDN3IinOEvW+
         VMthkeYirKlrzLR7LCf4USQHGLJ9wmo5a/QkxpfY9+CPatz4XjsnDZX+q2dIqcXYIANe
         4/RbL5IIz9wKXWQ+bU6E9Y8mF2Wc3GAB8iq/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yVZJu4t/IugUGV+W6kU+ykKkbEaLVPP4RIQU42du5mE=;
        b=K+jLy6pCC25HH9ngxFOy4hEt/bf2WQ3X5Ein2JNf5v7SCoZD5Zyqs2atp5u5DbzhwE
         3jXIjWdRiiS7TB/AExzmHi7uhACcN8LBkGTy0ipbgnxzNjnBU+mhHeyPd6v7FHbjBE5B
         4UjpgET9SxTylPnT+O9q/ea5AMJijgXaweyXxORrTfidxNddbxB6A4a7Bd2xP5S+weAb
         +4bm3ii6iK2W5AmGIiGANSC8knjFCXVdr/zEuJ03KYOGHoctyHDOLdEB7px+Bl/w5LMD
         jYC8IfYzdQlcCtlgrv6PX1dUf/iU9EQb+cQF1Gzvpn7lQ8cBE76DDzCLqxbXWWUre5wR
         i6fw==
X-Gm-Message-State: AOAM532ti3yi+2wm03z8FuzwD3nb0F5BUReeo49eJlSsx1pRehpbYJCW
        1DJS6/fsAhm3E+feHXxwzS9rfDn03SX7zpWLGxI=
X-Google-Smtp-Source: ABdhPJzqrYZeOG/Grm5myXVNL6iEVCZNsLp+4qTE5glqv2ugLTWy0lhEzpDvCK1TWhD3UThSRaAYqQ==
X-Received: by 2002:a05:651c:1148:: with SMTP id h8mr9030289ljo.332.1631999555131;
        Sat, 18 Sep 2021 14:12:35 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id z8sm855716lfq.284.2021.09.18.14.12.32
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 14:12:32 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id c8so48458105lfi.3
        for <linux-parisc@vger.kernel.org>; Sat, 18 Sep 2021 14:12:32 -0700 (PDT)
X-Received: by 2002:a2e:8107:: with SMTP id d7mr16412051ljg.68.1631999551766;
 Sat, 18 Sep 2021 14:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
 <202109182026.18IKQLng003683@valdese.nms.ulrich-teichert.org> <CAHk-=wjZukwHDpm6PUP=cFTi8wWQs6Z5Np7xv7SRphNqvm0FPw@mail.gmail.com>
In-Reply-To: <CAHk-=wjZukwHDpm6PUP=cFTi8wWQs6Z5Np7xv7SRphNqvm0FPw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 18 Sep 2021 14:12:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whswL8vPtdVphebUwdDd2Y-9j2d8XAd35bB+mqrhc0YTA@mail.gmail.com>
Message-ID: <CAHk-=whswL8vPtdVphebUwdDd2Y-9j2d8XAd35bB+mqrhc0YTA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
To:     Ulrich Teichert <krypton@ulrich-teichert.org>
Cc:     Michael Cree <mcree@orcon.net.nz>,
        Guenter Roeck <linux@roeck-us.net>,
        Richard Henderson <rth@twiddle.net>,
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

On Sat, Sep 18, 2021 at 1:46 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But your config shows _other_ errors with the IO functions, so I guess
> I'll need to look at that one too.

Oh, and all those games with

   #define __EXTERN_INLINE
   #include <asm/io.h>
   #include <asm/jensen.h>
   #undef  __EXTERN_INLINE

don't actually work, because there's the usual multiple-inclusion
protection on top of asm/jensen.h:

   #ifndef __ALPHA_JENSEN_H
   #define __ALPHA_JENSEN_H

and this include of <asm/jensen.h> is entirely unused, because we
ended up getting the one *without* that empty __EXTERN_INLINE #define
from an earlier include of

  #include <linux/interrupt.h>

that caused asm/io.h and asm/jensen.h to be included earlier.

The *other* machine files know to do their includes at the top of the file.

But then I end up getting

     ERROR: modpost: "__udiv_qrnnd" [lib/mpi/mpi.ko] undefined!

because CONFIG_MATHEMU wasn't set and the crypto stuff wants the MPI code.

So there seems to be other alpha Kconfig issues in there, and they
aren't all actually Jensen-specific.

Oh well. I guess can fix things up, since I did get tthe
cross-compiler environment..

          Linus

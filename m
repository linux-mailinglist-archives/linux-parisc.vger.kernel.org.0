Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5C04107DF
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Sep 2021 19:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234099AbhIRRgn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 18 Sep 2021 13:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbhIRRgn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Sep 2021 13:36:43 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58734C061574
        for <linux-parisc@vger.kernel.org>; Sat, 18 Sep 2021 10:35:19 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b15so28740282lfe.7
        for <linux-parisc@vger.kernel.org>; Sat, 18 Sep 2021 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PPMj8VLwTy75eprkO41oC3JgAE7NDa67ow6tA6A6/r0=;
        b=cy1UQNMOS0XYpgCCs7UW1bRKopN5C73/mDGBe3xOEvU9Qfc5peAlSaAnDkUL4a5c+l
         T+T9VcGwQGkOsVeyqqcFOdpSy7FTSjlq6zJMH39qCslLX05iJqtLvtCekhr85+YjZU3Q
         mY8lX8VUfk8l+z37c+OMtnVi/VdXUVL9PCefk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PPMj8VLwTy75eprkO41oC3JgAE7NDa67ow6tA6A6/r0=;
        b=UhFzJAMfHVEAtXJHe4O4PwTRXutghMmARNVYS4ly0f+j552EOiqHuhAULsRjnttKLd
         3ynru8fDMWYr5pYO1pHD/hjQDZGrc8XIy4c9rARgr5YVi2loz8+WZNWw+dfDcA5rcl/n
         jaoADDzDjZsRKHDxP4hTxLiztrEc7Lq0vOstOXJCQQxUFipc9Kjzv12K3vIriXXwzjXy
         uqinepZ//HIgsaAd7MBYx08cLPHYAeVjip7RWCXudTYudqhvmaTZzh7Qz/wwVZ1lbBRl
         VEERhAjAseA3Sh9xuXZgpfaVLRQzH+RLv0dWevX98YNDKORt16ImHzod9rOqJQ7X1QyX
         Fvhw==
X-Gm-Message-State: AOAM530FKscDCQ/I1VHWmJ38Vt18yRPS1+pD5k1knuaxIO1jAkXokla4
        nHd6YIzPXRckjY7oe8ORl/y09A3jUHM+NYP2dtA=
X-Google-Smtp-Source: ABdhPJyOveaz4was64RLwhBkgW3S5hxzZlMaYW7IiL0GrE8xdNroF0xRHzaMpIfOmyku8QBZLowKvg==
X-Received: by 2002:a2e:b8cf:: with SMTP id s15mr14660551ljp.141.1631986517450;
        Sat, 18 Sep 2021 10:35:17 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id w16sm815847lfd.295.2021.09.18.10.35.17
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 10:35:17 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id z24so20820761lfu.13
        for <linux-parisc@vger.kernel.org>; Sat, 18 Sep 2021 10:35:17 -0700 (PDT)
X-Received: by 2002:a2e:5815:: with SMTP id m21mr7711431ljb.95.1631986124170;
 Sat, 18 Sep 2021 10:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210918095134.GA5001@tower> <202109181311.18IDBKQB005215@valdese.nms.ulrich-teichert.org>
 <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
In-Reply-To: <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 18 Sep 2021 10:28:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wixOnf0i1GwYqCT=ihx=QTfB248GOFu6SZQhd3w6mm3aA@mail.gmail.com>
Message-ID: <CAHk-=wixOnf0i1GwYqCT=ihx=QTfB248GOFu6SZQhd3w6mm3aA@mail.gmail.com>
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

On Sat, Sep 18, 2021 at 10:04 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I do not see why you should be using that horrible __EXERN_INLINE. It
> will cause gcc to sometimes not inline at all, and not generate the
> out-of-line body either.

Yeah, that patch doesn't work at all with my cross-compiler, and only results in

  alpha-linux-gnu-ld: arch/alpha/kernel/sys_jensen.o:(.ref.data+0x58):
undefined reference to `jensen_ioread8'

because some of those 'extern inline' cases are never instantiated.

I'll look into it, we can make Jensen build again in case somebody
then gets the energy to see what causes it to not boot.

              Linus

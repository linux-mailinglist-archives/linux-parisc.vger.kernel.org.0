Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 883BE40CD62
	for <lists+linux-parisc@lfdr.de>; Wed, 15 Sep 2021 21:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbhIOTt2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 Sep 2021 15:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbhIOTt0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 Sep 2021 15:49:26 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1F1C061574
        for <linux-parisc@vger.kernel.org>; Wed, 15 Sep 2021 12:48:06 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y28so8933091lfb.0
        for <linux-parisc@vger.kernel.org>; Wed, 15 Sep 2021 12:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y64G4Nr6eLupd8AyUDQV+QjpzOrG0jVGWqFOvbj7NhQ=;
        b=Y4csyohCZU+8YoKj/T3AMNnwgk3FRg+INHHD4fuGyDsUm1wq1h6AKxBYulDw3FoQ7G
         0NziSuibsMyNi5yefbYsucBch28Uj+K3jgCIw+xC9NJQXLVMnDOuhKqiW0u/dIQHiVqz
         N3nrrQCoMhlCRtjeNcE5DeBxWUyUUAZ/n68kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y64G4Nr6eLupd8AyUDQV+QjpzOrG0jVGWqFOvbj7NhQ=;
        b=OxNq8lMC3IDMzqE/5jQwqbStuYSP1aLNtfk2AWuK2HoEfkCMIN3RsnAuPWwPHs8gdK
         Q6QFZEc2yTj2k+M27+RyxX2FO+zIThon+z9kAaFagSON+EWKl/LQp9Og0Q8r2zO3E5B9
         vWf8gBZ8uGjrRwq/TfJBMSSfJW1k51/yl2g/lgf1EExmwc8wJGtFv29FMA48lR4zRBIU
         3oN/lb6/g6FGP93P/8CwgMW/VTM0sVAPw9UfDelkjw3gTAR25RJ80STv9jLWxy7Fh3kb
         TeMApr2GReXCmLXNHxAnpdlcGAjvwFaXGYcRDRy2Yw2rt716BKuD+t8X5j6Zc7efiRMl
         +TGA==
X-Gm-Message-State: AOAM533kyrLk6ZOE7YZOhXSMX5FHP+PgZ2f85V8tJu4dmgiwm+5CbXO6
        r+ONyMzK8j3R0gKnaofBfJj8sExMU1zZBX24
X-Google-Smtp-Source: ABdhPJxCo7GASWbC0KyJctQfzQ5L80dV5aRogBBmPrlEziMVr2PacqKH6BvhCzlx7PN7mjsouIMmWQ==
X-Received: by 2002:a05:6512:3096:: with SMTP id z22mr1220709lfd.475.1631735281961;
        Wed, 15 Sep 2021 12:48:01 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id c10sm103887ljn.54.2021.09.15.12.48.00
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 12:48:01 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id p29so8775946lfa.11
        for <linux-parisc@vger.kernel.org>; Wed, 15 Sep 2021 12:48:00 -0700 (PDT)
X-Received: by 2002:a05:6512:3991:: with SMTP id j17mr1261083lfu.280.1631735280541;
 Wed, 15 Sep 2021 12:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210915035227.630204-1-linux@roeck-us.net> <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
 <47fcc9cc-7d2e-bc79-122b-8eccfe00d8f3@roeck-us.net>
In-Reply-To: <47fcc9cc-7d2e-bc79-122b-8eccfe00d8f3@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 15 Sep 2021 12:47:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
Message-ID: <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Richard Henderson <rth@twiddle.net>,
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

On Wed, Sep 15, 2021 at 12:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On a side note, we may revive the parisc patch. Helge isn't entirely
> happy with the other solution for parisc; it is quite invasive and
> touches a total of 19 files if I counted correctly.

Ok, my suggestion to use the linker was not a "do it this way", it
really was just a "maybe alternate approach". So no objections if
absolute_pointer() ends up being the simpler solution.

What other notable issues end up being still live? I sent out that one
patch for sparc, but didn't get any response to it. I'm inclined to
just apply it (the 'struct mdesc_hdr' pointer misuse one).

         Linus

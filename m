Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BD04107DC
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Sep 2021 19:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240081AbhIRRbs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 18 Sep 2021 13:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240072AbhIRRbr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Sep 2021 13:31:47 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A45C061574
        for <linux-parisc@vger.kernel.org>; Sat, 18 Sep 2021 10:30:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bq5so47261046lfb.9
        for <linux-parisc@vger.kernel.org>; Sat, 18 Sep 2021 10:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VJ9K4Ss0fO8sq3w3fi+s1XQy4Iv3mwXh4Uemm8nutng=;
        b=HtuwRZUCtjojC6VdTZELWNXgY00qcbptQey5+LTejhwWo5g8CMmknjSym9G74RH6Ma
         oPcVOCFM0bvoDz0JDWFOmLoHw2mzTecjQrEShzwr3fyltdeg/Yk3k9bXEJyFI8+DILmo
         Zn76QBbRztSInJyQGaDYETcYPmfh81XD1W72o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VJ9K4Ss0fO8sq3w3fi+s1XQy4Iv3mwXh4Uemm8nutng=;
        b=OUC16tOAnLvWNpWoW52TdgLLAePWknXuRXTpmDE6lF+yWBCjAqUnKsHF864osJamIG
         Gjdrookn8RHiCc2cP2/YcqyxkIpehJfpN7e0tX0cyXkMFQWV6nwFE/stFAmIRJuAOwX1
         uH/xXpO2dKcYzh/zenouxOwMPAv5yZ9Yza0pwuDSukJpH8rXYt1S+Bobv+koxDhoQf2G
         ByQxVj8HC+XxyesFdF56GjeIfTY8jp2bF+6wrmNaeGKCy1SXFpahdJnpOpY1ufl2o5S/
         0/WhiOLTt/gUnCfsbKTUhMk7MLBc9RY7RirHkp+sLxr+KLVPcyw59JTO9PLwXVQbiHj1
         O8jg==
X-Gm-Message-State: AOAM533VR5J0Yy9wF5nAH5k3nLbloTNPF3iSD+0GIuH/hZjbAG8k2mse
        /B4OIwIau1gDzeuLKxC4YWl85GX0KdmDiLVhDNc=
X-Google-Smtp-Source: ABdhPJyYOI6PehH410nF3Fg3oY/ojQ2M/rsPLDexHheInN3LB0+syNd36DHJsom0ugXafVLWYs2E0A==
X-Received: by 2002:a2e:b6c8:: with SMTP id m8mr13999037ljo.449.1631986221625;
        Sat, 18 Sep 2021 10:30:21 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id t4sm892668lfp.250.2021.09.18.10.30.21
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 10:30:21 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id p29so46244191lfa.11
        for <linux-parisc@vger.kernel.org>; Sat, 18 Sep 2021 10:30:21 -0700 (PDT)
X-Received: by 2002:a05:6512:94e:: with SMTP id u14mr12398440lft.173.1631985720656;
 Sat, 18 Sep 2021 10:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210918095134.GA5001@tower> <202109181311.18IDBKQB005215@valdese.nms.ulrich-teichert.org>
 <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com> <56956079-19c3-d67e-d3f-92e475c71f6b@tarent.de>
In-Reply-To: <56956079-19c3-d67e-d3f-92e475c71f6b@tarent.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 18 Sep 2021 10:21:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgj=fFDt6mkiOmRs7pdcYJSibqpVvwcG9_0rbVJEjBCsw@mail.gmail.com>
Message-ID: <CAHk-=wgj=fFDt6mkiOmRs7pdcYJSibqpVvwcG9_0rbVJEjBCsw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
To:     Thorsten Glaser <t.glaser@tarent.de>
Cc:     Ulrich Teichert <krypton@ulrich-teichert.org>,
        Michael Cree <mcree@orcon.net.nz>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Sep 18, 2021 at 10:17 AM Thorsten Glaser <t.glaser@tarent.de> wrote=
:
>
> Considering you can actually put ISA cards, 8 and 16 bit both,
> into EISA slots, I=E2=80=99d have assumed so. I don=E2=80=99t understand =
the
> =E2=80=9CEISA only=E2=80=9D question above.

Oh, it's so long since I had one of those machines I didn't even
remember that EISA took ISA cards too.

But yeah, there are also apparently PCI-based alpha machines with
actual ISA card slots.

            Linus

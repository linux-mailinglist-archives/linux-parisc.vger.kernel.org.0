Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE46C35721B
	for <lists+linux-parisc@lfdr.de>; Wed,  7 Apr 2021 18:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbhDGQ06 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 7 Apr 2021 12:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238412AbhDGQ06 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 7 Apr 2021 12:26:58 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D36C061756
        for <linux-parisc@vger.kernel.org>; Wed,  7 Apr 2021 09:26:46 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a1so21450982ljp.2
        for <linux-parisc@vger.kernel.org>; Wed, 07 Apr 2021 09:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r0Mui9yDr8G87XIz6Tef+nFdSKP7HaRLCXsnomp+h9Y=;
        b=GB2/I9FsJxZ7Onx+dDzbRONjfxL4W0expSW3vhQa7XTxIeM+3VOfYKKZO4NbdqpJaR
         WF1sKRbosBt2WczkgD7Iic4fGzGhVs4bmZztbJyNA7Nm0BMdk68ulsoSjgzN+T6OzBdm
         jKlLD80P59E142f0vYSdMdoGW0RG2rzDABHBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r0Mui9yDr8G87XIz6Tef+nFdSKP7HaRLCXsnomp+h9Y=;
        b=duvxzbHVu/JTeyhgODjW18XKgi70dFkdzBdPn1pH3ECBQXy9bW/jhQMT8JDNmuMcCb
         QjcIyFeEzsUc/T0SEPCbVYo9r8yQNTbtBA40BVrkGp7ilzw9eXxcoFU8VszW9/IGVeu5
         NOmrx90aS9eo695DqzqJDe2WHYOC6IAnh0El4TrBwiYvSwq1gC6Sy1dGwU97MOiQkFRc
         OKo4Ddb5V2blQxPmro2bGXD/4Qumcb/nLv5JaBqcxvb4bF19+ET72PXuEngf6yV/fCjj
         MXP4RUOnMJ4vf4yn3P9zIq4Tty4QAJUEaInJCSa01iItmIEqYUlW2LkwUnlJRA2t+VXp
         7l/g==
X-Gm-Message-State: AOAM532fmFnJ2mN1XgSU3s/10KpAINEZJ02/Fkms7pPHL1Dbtmbl/oo2
        Xe0Q5cMD8pK1G7cpd3M/5p+Yc6oDvvrQrmGB
X-Google-Smtp-Source: ABdhPJzM3o0ZUqtqxqxNOu3q6IVe/oeGVvFjyp1KTzM+O3NVvQ45T2dp/NJMLvRRfdrXGvyybK6olg==
X-Received: by 2002:a2e:9f03:: with SMTP id u3mr2736441ljk.206.1617812805085;
        Wed, 07 Apr 2021 09:26:45 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id z30sm340030lfg.162.2021.04.07.09.26.44
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 09:26:44 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id s17so21418663ljc.5
        for <linux-parisc@vger.kernel.org>; Wed, 07 Apr 2021 09:26:44 -0700 (PDT)
X-Received: by 2002:a05:651c:3c1:: with SMTP id f1mr2662932ljp.507.1617812804185;
 Wed, 07 Apr 2021 09:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <YG12tezhGsQ5R/lG@ls3530>
In-Reply-To: <YG12tezhGsQ5R/lG@ls3530>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 7 Apr 2021 09:26:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjmtbLVB4RYfmjSbYXTxiOsEsXzkkpShRN4NZpe2cAVTQ@mail.gmail.com>
Message-ID: <CAHk-=wjmtbLVB4RYfmjSbYXTxiOsEsXzkkpShRN4NZpe2cAVTQ@mail.gmail.com>
Subject: Re: [GIT PULL] parisc architecture fixes for kernel v5.12-rc7
To:     Helge Deller <deller@gmx.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Gao Xiang <hsiangkao@redhat.com>,
        Wan Jiabing <wanjiabing@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Apr 7, 2021 at 2:09 AM Helge Deller <deller@gmx.de> wrote:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.12-3

Not technically related to this pull (which I just did), but doing the
pull did remind me that you're one of the people who don't use signed
tags for pull requests.

I don't require that for kernel.org accounts, and it's not really a
problem, but I do encourage it.  So I thought I'd just mention it in
case it would be something you'd be willing to do..

You're certainly not the only one not using signed tags, but I'm
looking through my recent merges, and _most_ of them are from signed
sources these days.

           Linus

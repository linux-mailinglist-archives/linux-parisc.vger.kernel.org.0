Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30743444E01
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 05:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhKDEsp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 00:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhKDEso (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 00:48:44 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08994C061714
        for <linux-parisc@vger.kernel.org>; Wed,  3 Nov 2021 21:46:07 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bi35so9486912lfb.9
        for <linux-parisc@vger.kernel.org>; Wed, 03 Nov 2021 21:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MSdbnulbptk0ZuR/Tz6LR9TZS4PNPngbTJ9ZV4hqiAY=;
        b=eWNZQn6h0mRAvVFSonm4jcoNEVKE/t4wJ+QJnDr+UOtXF6oepsc0b+7nfrhBRZ8SYa
         1KHFb3PivXYs5Rcw+87v/wFeEhb/xtx5QMVOaa0dDC+AXJ6XbaeZxtZJyQPzv9auyGHp
         Pl2YPMtYNB29dUXB+VVhcax2qSCRj+kLte3Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MSdbnulbptk0ZuR/Tz6LR9TZS4PNPngbTJ9ZV4hqiAY=;
        b=FQ4Yu1dfzUWuwpZTQjst/qSMzg8QwB7sYAPwoOIaK1afG+Ojbj0rmcv1TdX4ggJTZi
         VQZANuIM2N1gF2IbpGO/JXW+TpiKv7dqJchp5ONUUqqPojwXiar8y23cMqWBeRncRdYT
         aGX31vKO/ug6rGQLR3tqEoK6W13zHYZcVjqQ2QWRaN15MKGecD2bXIoySiVEvUzs2oLd
         uNhMLuUj37Qk1FrlwKyYWaIxowbBkj4uRFEtPv2eAPrSB3saVhbEySW4e2or9FepvnGs
         LklW/n6GtIYlHIhrCRVKnEyFS7hBxWowfsVupsePKnw1o6vS1x8naNG8a+PqgB3B6jww
         D7nQ==
X-Gm-Message-State: AOAM531O5fmJm7EfJSoZYMpRqemuuugePeQhyyNNL6RNfBQs0GFK2FrU
        n6DvrGw/GQ7oSrRFXSJd68FvOaT249gErWXd
X-Google-Smtp-Source: ABdhPJxOqjHW70m39IcPtbFTMWZrzouJLsx1pI0lJquATzkvWZPEIxhNN3XVto/Xlr5MRYDAWWs5bg==
X-Received: by 2002:a05:6512:3341:: with SMTP id y1mr44435589lfd.378.1636001164746;
        Wed, 03 Nov 2021 21:46:04 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id h18sm380965ljq.51.2021.11.03.21.46.03
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 21:46:04 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id bq11so9498331lfb.10
        for <linux-parisc@vger.kernel.org>; Wed, 03 Nov 2021 21:46:03 -0700 (PDT)
X-Received: by 2002:a19:384b:: with SMTP id d11mr453337lfj.678.1636001163584;
 Wed, 03 Nov 2021 21:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211104031554.GA34798@roeck-us.net> <CAHk-=wjvWORtC5vwgavJxpBtV3-q9GGidezS_2NjtUFvqg7H5Q@mail.gmail.com>
 <77dc70f4-879a-eb5c-2dd6-682b4c7cfd03@roeck-us.net>
In-Reply-To: <77dc70f4-879a-eb5c-2dd6-682b4c7cfd03@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 3 Nov 2021 21:45:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZo3yj46FwVi0BNKfy5fZ4-UeWkeQ6nhcAbbnKS7K=dQ@mail.gmail.com>
Message-ID: <CAHk-=wjZo3yj46FwVi0BNKfy5fZ4-UeWkeQ6nhcAbbnKS7K=dQ@mail.gmail.com>
Subject: Re: parisc build failures in mainline kernel
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ardb@kernel.org>, Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Nov 3, 2021 at 9:30 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Unfortunately not. With that patch it complains about task_struct.

Gaah. You'll need something like this too

-       DEFINE(TASK_CPU, offsetof(struct task_struct, cpu));
+       DEFINE(TASK_CPU, offsetof(struct task_struct, thread_info.cpu));

in arch/parisc/kernel/asm-offsets.c.

And really, it should probably be renamed as TASK_TI_CPU, but then you
have to rename all the uses too.

There might be other details like that lurking.

                   Linus

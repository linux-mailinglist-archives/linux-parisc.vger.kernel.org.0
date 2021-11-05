Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781D3446945
	for <lists+linux-parisc@lfdr.de>; Fri,  5 Nov 2021 20:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232016AbhKETpq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 5 Nov 2021 15:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbhKETpm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 5 Nov 2021 15:45:42 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26A8C061714
        for <linux-parisc@vger.kernel.org>; Fri,  5 Nov 2021 12:43:02 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so3233472pjb.1
        for <linux-parisc@vger.kernel.org>; Fri, 05 Nov 2021 12:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=squVkhv4km3z5tN6L4QImms65JcT1KD/LPFKJ715zrE=;
        b=QoRz0htecI4xyG+YX3S4YI/eBSENAzqrmpMS9V4vHUMxlFMaeVglFIOUTo4jv2i920
         vbVxY9fkUzdU6s2fTpXn4tQ5jsR0kltYIhAWZB5Dv7ycacIjVAhAxagsR/8tSJp6sWx1
         l4dSa+8Su3W7Mou3Jz6iTTEhohAsPBFO7Gj2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=squVkhv4km3z5tN6L4QImms65JcT1KD/LPFKJ715zrE=;
        b=iMYd12lxQmO3rIP50IW4G+Tkb4jYJtDUemrci9loTLTCk9+sN6l9tbSjGuFRC0jusP
         wicKKDczPBM03dySoHUYOjYBNK55mfkP0M+ouRSKjnCyPvaMj48YY7v9Fevw4iRjRWZ6
         G2+8qGngWf0NZWOoBjsvK9GvuerNR9yliM3XBqYR6kdx2Mw8wEciSCELNhe0aDHSSgpk
         VSa6YX4RGEGm/FueIzJLCkHakmwpcB6cZzbEgHjH98J1V6IxcaHGUVOv/IwYRguz8GpX
         ikB2XFLzevx93pvaIOMfAAzokPaK0RciwXFqCX8JnUbZo+rW0qk+gmtsxewByzOEkFwO
         QO1Q==
X-Gm-Message-State: AOAM530WwB7eK4yD7bYNroaH1WqNg+JKdSKsHXArselgKYshRXlrWPOy
        w55XDW5IUE86GWW1w8OV41Rzwg==
X-Google-Smtp-Source: ABdhPJyqFiznsCrm8OzYwtY3bHoMdZMaeN3HiGBl7qvfkbukQ4KLiHxJ3sDY1MnVjOLU3T5kxdIhEw==
X-Received: by 2002:a17:902:ea11:b0:141:c6c8:823a with SMTP id s17-20020a170902ea1100b00141c6c8823amr40658952plg.29.1636141382220;
        Fri, 05 Nov 2021 12:43:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m26sm3892873pfe.23.2021.11.05.12.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 12:43:01 -0700 (PDT)
Date:   Fri, 5 Nov 2021 12:43:00 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: parisc build failures in mainline kernel
Message-ID: <202111051242.86E9DBF@keescook>
References: <20211104031554.GA34798@roeck-us.net>
 <CAHk-=wjvWORtC5vwgavJxpBtV3-q9GGidezS_2NjtUFvqg7H5Q@mail.gmail.com>
 <77dc70f4-879a-eb5c-2dd6-682b4c7cfd03@roeck-us.net>
 <CAHk-=wjZo3yj46FwVi0BNKfy5fZ4-UeWkeQ6nhcAbbnKS7K=dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjZo3yj46FwVi0BNKfy5fZ4-UeWkeQ6nhcAbbnKS7K=dQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Nov 03, 2021 at 09:45:47PM -0700, Linus Torvalds wrote:
> On Wed, Nov 3, 2021 at 9:30 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Unfortunately not. With that patch it complains about task_struct.
> 
> Gaah. You'll need something like this too
> 
> -       DEFINE(TASK_CPU, offsetof(struct task_struct, cpu));
> +       DEFINE(TASK_CPU, offsetof(struct task_struct, thread_info.cpu));
> 
> in arch/parisc/kernel/asm-offsets.c.
> 
> And really, it should probably be renamed as TASK_TI_CPU, but then you
> have to rename all the uses too.
> 
> There might be other details like that lurking.

I'll check this out too if Ard doesn't beat me to it. Thanks for the
investigation and sorry for the breakage!

-- 
Kees Cook

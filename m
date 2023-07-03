Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 595A17460F3
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jul 2023 18:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjGCQuL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Jul 2023 12:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjGCQuL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Jul 2023 12:50:11 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B187E52
        for <linux-parisc@vger.kernel.org>; Mon,  3 Jul 2023 09:50:10 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51d9bf5411aso5278928a12.2
        for <linux-parisc@vger.kernel.org>; Mon, 03 Jul 2023 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688403008; x=1690995008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N5iIDHM8fiZi7DwEjnp/WStuW97jTuZeedkTNeA9kM8=;
        b=hc17WQY+3SCnKRL3D0voPolC9rqrH1x060vdHoksqs0hZWmXsfJyhkN7tTxbu46ybX
         J8ncLZ74LPrOPPBhjwkTMz7Jc658pFJ3LpzvUWTgdhyDhp9njj8wuzF4EKcrSH/ePtrB
         54r99rNIYM7R71OSPep/oDY+2Umf6m4Kb+7aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688403008; x=1690995008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5iIDHM8fiZi7DwEjnp/WStuW97jTuZeedkTNeA9kM8=;
        b=lmnzxcyjikon7pdHAbvMEMmrjFn8LBydSqOhDBdn4akeQ93XeAzvSn7GwimMY7/68+
         czQpav/FBzSIJgmTSFH46nDbvWz8GXWx1b3x7VOcCHLA+NnD7lK9LzqKI2sXfrmRrsQ4
         bx91OuohsjuxcOPWDmSDV18JLgfrMjqyAj8Bsbd8DlPzi6tQ/kZho0A0eVnikk455cns
         50q0FrjucDjf5GqBw32hU7/nRRoz2sqyAwBJaTgU2KOlJhwBIvosxmUJm9bS9VHIjOGy
         KSy17EtoGF4Iiif8fB3+BlyZ6GewzHERbETnFWv5mr0W8PbaJxCyLeKtjqqxQ/f4WzD3
         cRvA==
X-Gm-Message-State: ABy/qLbYMDRcKyPDXUAqwmWuBpwwLrCnsFOuYwP0ZWGq0oZTIuwC+tJh
        YFY4rhaB3URBwgBhbQnvDd7Rmkh6/xTiy5NNCOhjvsE7
X-Google-Smtp-Source: APBJJlE/aPqbqKpUFf+24sLp6bW2wCGfHsYH4G5nGkX4NaKDJHa8NhcJA19LdXY92a228tYt3Yj76w==
X-Received: by 2002:a05:6402:344e:b0:51e:10d8:e011 with SMTP id l14-20020a056402344e00b0051e10d8e011mr2164801edc.24.1688403008603;
        Mon, 03 Jul 2023 09:50:08 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id y20-20020aa7ccd4000000b005166663b8dcsm10605774edt.16.2023.07.03.09.50.07
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 09:50:07 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51d8fa4dbf9so5288117a12.1
        for <linux-parisc@vger.kernel.org>; Mon, 03 Jul 2023 09:50:07 -0700 (PDT)
X-Received: by 2002:aa7:d1c3:0:b0:51d:ebf4:9874 with SMTP id
 g3-20020aa7d1c3000000b0051debf49874mr6983134edp.2.1688403007144; Mon, 03 Jul
 2023 09:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230629184151.888604958@linuxfoundation.org> <CA+G9fYsM2s3q1k=+wHszvNbkKbHGe1pskkffWvaGXjYrp6qR=g@mail.gmail.com>
 <CAHk-=whaO3RZmKj8NDjs4f6JEwuwQWWesOfFu-URzOqTkyPoxw@mail.gmail.com>
 <2023063001-overlying-browse-de1a@gregkh> <0b2aefa4-7407-4936-6604-dedfb1614483@gmx.de>
 <5fd98a09-4792-1433-752d-029ae3545168@gmx.de> <CAHk-=wiHs1cL2Fb90NXVhtQsMuu+OLHB4rSDsPVe0ALmbvZXZQ@mail.gmail.com>
 <CAHk-=wj=0jkhj2=HkHVdezvuzV-djLsnyeE5zFfnXxgtS2MXFQ@mail.gmail.com>
 <9b35a19d-800c-f9f9-6b45-cf2038ef235f@roeck-us.net> <CAHk-=wgdC6RROG145_YB5yWoNtBQ0Xsrhdcu2TMAFTw52U2E0w@mail.gmail.com>
 <2a2387bf-f589-6856-3583-d3d848a17d34@roeck-us.net> <CAHk-=wgczy0dxK9vg-YWbq6YLP2gP8ix7Ys9K+Mr=S2NEj+hGw@mail.gmail.com>
 <c21e8e95-3353-fc57-87fd-271b2c9cc000@roeck-us.net> <CAHk-=wj+F8oGK_Hx6YSPJpwL-xyL+-q2SxtxYE0abtZa_jSkLw@mail.gmail.com>
 <7146f74d-8638-46c7-8e8c-15abc97a379f@gmx.de>
In-Reply-To: <7146f74d-8638-46c7-8e8c-15abc97a379f@gmx.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Jul 2023 09:49:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjqp09i1053vqFc41Ftegkrh0pD+MKY-3ptdYu3FUh6Bw@mail.gmail.com>
Message-ID: <CAHk-=wjqp09i1053vqFc41Ftegkrh0pD+MKY-3ptdYu3FUh6Bw@mail.gmail.com>
Subject: Re: [PATCH 6.4 00/28] 6.4.1-rc1 review - hppa argument list too long
To:     Helge Deller <deller@gmx.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, 3 Jul 2023 at 00:08, Helge Deller <deller@gmx.de> wrote:
>
> Great, that patch fixes it!

Yeah, I was pretty sure this was it, but it's good to have it
confirmed. Committed.

> I wonder if you want to
> #define VM_STACK_EARLY VM_GROWSDOWN
> even for the case where the stack grows down too (instead of 0),
> just to make clear that in both cases the stack goes downwards initially.

No, that wouldn't work for the simple reason that the special bits in
VM_STACK_INCOMPLETE_SETUP are always cleared after the stack setup is
done.

So if we added VM_GROWSDOWN to those early bits in general, the bit
would then be cleared even when that wasn't the intent.

Yes, yes, we could change the VM_STACK_INCOMPLETE_SETUP logic to only
clear some of the bits in the end, but the end result would be
practically the same: we'd still have to do different things for
grows-up vs grows-down cases, so the difference might as well be here
in the VM_STACK_EARLY bit.

                 Linus

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A08D746173
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jul 2023 19:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbjGCRaf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Jul 2023 13:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjGCRae (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Jul 2023 13:30:34 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B12AE5E
        for <linux-parisc@vger.kernel.org>; Mon,  3 Jul 2023 10:30:32 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-98e39784a85so846463466b.1
        for <linux-parisc@vger.kernel.org>; Mon, 03 Jul 2023 10:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688405431; x=1690997431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CrS/MpuWOEjZGLSDInBYEukcytiKIRhK8AvJ7Dhgwl8=;
        b=Uqk4Syabc3Fa7nz/htzj73Pfgep5xrshCCiGULMJZQveV8wfB1CHaOCiEPa+okYKkg
         DPpihA/zy/Xduff521kzRRLWG6+rLMYn9HkkkqijK4DHi/9BFp/fEHUt7TiWmfONG5uF
         yWvgUtZ5ANOnFhST9oHWAXEp/Ox0fbBoEOdf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688405431; x=1690997431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrS/MpuWOEjZGLSDInBYEukcytiKIRhK8AvJ7Dhgwl8=;
        b=AxjXNVrEjrE8/AWxwLoFN5kga79zvn5rsyTwtq+YnGBTzZ8j0Oe4SCf71ZidazkjIx
         zdkGqGYOpgocJfC2R1eaLMuBm1XVtpdgkWvBF0g9TQnpjzMZXbMLOYARTtK58sqrGJxt
         KFWNmVuHTGVtJhqsa+S9MF8wTzux1Rwg56wSMzkP6miGM9X0dPYadHKpuvX4WNMz7fzH
         sk1zNcb/NcTnLJo0cGX62k0BNq6yEyTmFmaNt8wJ98BlPVnmdiJ8WktH94rzr8LK8OGq
         qkfMR9nTbdxtbInrvlpfuaeaF0S6yas1skIxorphkPjzkTry7E+zrsu7qndCaxDfg64M
         n0Ag==
X-Gm-Message-State: ABy/qLZtab7Ep36WHRAv4cZFlE7qkGqjWXfPkaRfutB9cTRMlQXucy0s
        653KVG9xpEZhyWRShcfIipQyHS6rsytMwlhgEgPe4I5L
X-Google-Smtp-Source: APBJJlEA65CVQMJ/QrG03h2oygUCd/7AlW0Z8iU/rSacPuFEILQ58UVClHZsEv2LnRdJrlsuZhE+UA==
X-Received: by 2002:a17:906:10dc:b0:992:2f67:cd34 with SMTP id v28-20020a17090610dc00b009922f67cd34mr13375184ejv.22.1688405430905;
        Mon, 03 Jul 2023 10:30:30 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id br7-20020a170906d14700b009893b06e9e3sm12275922ejb.225.2023.07.03.10.30.29
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 10:30:30 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so8321947a12.0
        for <linux-parisc@vger.kernel.org>; Mon, 03 Jul 2023 10:30:29 -0700 (PDT)
X-Received: by 2002:a05:6402:4494:b0:51a:4c1e:c94a with SMTP id
 er20-20020a056402449400b0051a4c1ec94amr18268322edb.2.1688405429462; Mon, 03
 Jul 2023 10:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230629184151.888604958@linuxfoundation.org> <CA+G9fYsM2s3q1k=+wHszvNbkKbHGe1pskkffWvaGXjYrp6qR=g@mail.gmail.com>
 <CAHk-=whaO3RZmKj8NDjs4f6JEwuwQWWesOfFu-URzOqTkyPoxw@mail.gmail.com>
 <2023063001-overlying-browse-de1a@gregkh> <0b2aefa4-7407-4936-6604-dedfb1614483@gmx.de>
 <5fd98a09-4792-1433-752d-029ae3545168@gmx.de> <CAHk-=wiHs1cL2Fb90NXVhtQsMuu+OLHB4rSDsPVe0ALmbvZXZQ@mail.gmail.com>
 <CAHk-=wj=0jkhj2=HkHVdezvuzV-djLsnyeE5zFfnXxgtS2MXFQ@mail.gmail.com>
 <9b35a19d-800c-f9f9-6b45-cf2038ef235f@roeck-us.net> <CAHk-=wgdC6RROG145_YB5yWoNtBQ0Xsrhdcu2TMAFTw52U2E0w@mail.gmail.com>
 <2a2387bf-f589-6856-3583-d3d848a17d34@roeck-us.net> <CAHk-=wgczy0dxK9vg-YWbq6YLP2gP8ix7Ys9K+Mr=S2NEj+hGw@mail.gmail.com>
 <c21e8e95-3353-fc57-87fd-271b2c9cc000@roeck-us.net> <CAHk-=wj+F8oGK_Hx6YSPJpwL-xyL+-q2SxtxYE0abtZa_jSkLw@mail.gmail.com>
 <7146f74d-8638-46c7-8e8c-15abc97a379f@gmx.de> <CAHk-=wjqp09i1053vqFc41Ftegkrh0pD+MKY-3ptdYu3FUh6Bw@mail.gmail.com>
 <964806c4-db73-a70b-2168-24168e4b5aab@roeck-us.net>
In-Reply-To: <964806c4-db73-a70b-2168-24168e4b5aab@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Jul 2023 10:30:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-hZr6N-ONO3mmUOwPDrOJ_N3NYXD3bsk4bm-1jaD2mw@mail.gmail.com>
Message-ID: <CAHk-=wh-hZr6N-ONO3mmUOwPDrOJ_N3NYXD3bsk4bm-1jaD2mw@mail.gmail.com>
Subject: Re: [PATCH 6.4 00/28] 6.4.1-rc1 review - hppa argument list too long
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Helge Deller <deller@gmx.de>, stable@vger.kernel.org,
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

On Mon, 3 Jul 2023 at 10:19, Guenter Roeck <linux@roeck-us.net> wrote:
>
> FWIW, my qemu boot tests didn't find any problems with other architectures.

Thanks. This whole "let's get the stack expansion locking right"
wasn't exactly buttery smooth, but given all our crazy architectures
it was not entirely unexpected.

Let's hope it really is all done now,

            Linus

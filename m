Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C074D7A3338
	for <lists+linux-parisc@lfdr.de>; Sun, 17 Sep 2023 00:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbjIPW0L (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Sep 2023 18:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjIPW0K (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Sep 2023 18:26:10 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DCCCC0
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 15:26:01 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50300141a64so1360284e87.0
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694903159; x=1695507959; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r9idXErWZI7pNQUkUS1qR53dXjSp7SyDv32PM6WVIlo=;
        b=D0+EXYBsjJYNf4JseaWdf7sDE7XKUSh6qxONeU9hUkrJtvQ3Sxe8n3TTjI62iE8VvB
         dK+Jwyhj0UOtUPw3+tfDimLtF81+v2n7xdl/0lII+69Lkiwhloqi8pzhGxr35ZFuXtQI
         eDwmeqJrgpk+aJ/cx1cF98iIrtOivrfM/6/gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694903159; x=1695507959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9idXErWZI7pNQUkUS1qR53dXjSp7SyDv32PM6WVIlo=;
        b=IVCSua7meMQw+CzIPi7dysjA0hHbvAPDZeyA7uRlyIphFufmW5LD3p8oJS1WifoS2D
         a/4uxBDSOVRBevqEyW22LxEugg70HyAE+wXumqgWQJIDLcLLIyv3/1ofbtL9EnE+6q7d
         NonbSSyW/DqLBRSR28iEr7RFEKt3hAR0PCiGZHE6ppwzzgdhxfQpG59GlXcFNHn9kP+o
         6T4im51vMOWpU5AVpXGAKEjvY9BgyWB4GprEmJnqHZu3xcbN/6hwW0UuzknOlayTsxjq
         DLv3XbYBahXythWDiZwrNmH30LXUwmjdSspiZlwYRaU3VYjr5cEtchfZlfpQ9gJsAjKp
         Gadg==
X-Gm-Message-State: AOJu0YwHgResaNJcrKLI1EX6RUgVL0GXEzm9C882SQwyrgkIi51LlqXt
        v+aNA7Z1mWuIbF6qmIZ9Y6/nFyA9Ffmgw+sa+9qj4Nxh
X-Google-Smtp-Source: AGHT+IHTeQuJKyYqcrg3NiZTIMhDRH7jzkUhNrRS4/VjDe073Sr2+Y+t3aHT4oU92cxYDiC4bFAVHQ==
X-Received: by 2002:a05:6512:3c8c:b0:500:c5df:186c with SMTP id h12-20020a0565123c8c00b00500c5df186cmr6145651lfv.56.1694903159158;
        Sat, 16 Sep 2023 15:25:59 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id p13-20020a19f00d000000b00502d745f37dsm1178974lfc.95.2023.09.16.15.25.58
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 15:25:58 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-502a4f33440so5297945e87.1
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 15:25:58 -0700 (PDT)
X-Received: by 2002:a05:6512:1321:b0:500:99a9:bc40 with SMTP id
 x33-20020a056512132100b0050099a9bc40mr5258347lfu.69.1694903157814; Sat, 16
 Sep 2023 15:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <1694366957@msgid.manchmal.in-ulm.de> <ZQWUzwiKWLk79qbp@debian.me>
 <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
 <CAHk-=wjrEjaUw3oFVEYpF=AWAwrSM3sQTQHuPfFjFdQsvQxHeg@mail.gmail.com> <40eecbdf-40d4-0fa2-6718-3875ed852104@virtuozzo.com>
In-Reply-To: <40eecbdf-40d4-0fa2-6718-3875ed852104@virtuozzo.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 16 Sep 2023 15:25:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjRnv92Y-b69OTefTxVHbmtnijNt8Dw7BFe+fgJTHK60A@mail.gmail.com>
Message-ID: <CAHk-=wjRnv92Y-b69OTefTxVHbmtnijNt8Dw7BFe+fgJTHK60A@mail.gmail.com>
Subject: Re: Possible 6.5 regression: Huge values for "commited memory"
To:     Michael Labiuk <michael.labiuk@virtuozzo.com>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        Linux PARISC <linux-parisc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Regressions <regressions@lists.linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 16 Sept 2023 at 15:20, Michael Labiuk
<michael.labiuk@virtuozzo.com> wrote:
>
> This patch fixes problem with counter for committed memory.
>
> Thanks!

Oh, no, thank *you*. With the bisection, this was fairly straightforward.

A silly mistake in the original patch, but hard to see without a clear
"this is when the problem was introduced".

           Linus

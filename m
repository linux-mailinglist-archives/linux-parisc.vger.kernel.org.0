Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64027683888
	for <lists+linux-parisc@lfdr.de>; Tue, 31 Jan 2023 22:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbjAaVUV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 31 Jan 2023 16:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbjAaVUU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 31 Jan 2023 16:20:20 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E339E55286
        for <linux-parisc@vger.kernel.org>; Tue, 31 Jan 2023 13:20:18 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id n6so13115126edo.9
        for <linux-parisc@vger.kernel.org>; Tue, 31 Jan 2023 13:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lhMaGcwmHnowthLDK6+cq9UUV5li22+d5YjfiOKs0xk=;
        b=Dpi5P8qHqM77HLr6Rm7qlkY2hnNNuC+GOleUP2NCen/4mi28taFHpUtYN0cOaJeZqx
         TB+exnjSVIKaLaZsJwKH3MCWKlHsO2N7zm25f17K7ur8C/IEegLECG6U0Z6AXLDaZrfK
         1kGvyREHSxwc1BrFIiYNgaqGXrqrtBtRmci5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhMaGcwmHnowthLDK6+cq9UUV5li22+d5YjfiOKs0xk=;
        b=S9k8EgTfveYEjkBf/tjaJmW2EOytYk1+yj+UP9/1YUwQBfVvnEsTAfuDqnRWdu0iZ7
         ByvOPnVEpoWmEV3mHnLJuG8AZAousHjmYbIf/vReFUZMPwLoLGUP/3W3RpvlZumiTowq
         nD1Jc23iGkMvPBiW47ojrJKunoXk/UiW8VvWgytjpcO7UIgIgApP+MvQRRQFiw+/L6wO
         WOizMwILy136v1CSsPILHbz0KkshXlZ3HaD6QZQUuDBpC0K/4SiKSKaU1UK6H7VPP6HQ
         mZxNf/C0zk22h/ba+mQcG+xQpcQvb3dpHFsbmWzHZxCBzpF2uqMXw7o5YvvxKYhtZeqF
         4JaQ==
X-Gm-Message-State: AO0yUKWp9FYmhrw8/kf/HH/4YnH1szxOXD5vwCi/rYpUIaH1/rTSfDzd
        xtSOlmoMhTuYGF2+xRBeKhYCwL2+KDipmtNGcms=
X-Google-Smtp-Source: AK7set89hdQNzw/HWaEn14aS9Rl3DrczpJ38Iu65qCqQsBbOQa4jrKfgnqoCXBSrS8GNO7W0LuiGxQ==
X-Received: by 2002:a05:6402:1e92:b0:4a3:43c1:8434 with SMTP id f18-20020a0564021e9200b004a343c18434mr84902edf.8.1675200016977;
        Tue, 31 Jan 2023 13:20:16 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id k16-20020a170906579000b0087bdae33badsm7394191ejq.56.2023.01.31.13.20.16
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 13:20:16 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id lu11so8249267ejb.3
        for <linux-parisc@vger.kernel.org>; Tue, 31 Jan 2023 13:20:16 -0800 (PST)
X-Received: by 2002:a17:906:1e94:b0:889:2908:a9c8 with SMTP id
 e20-20020a1709061e9400b008892908a9c8mr2233010ejj.82.1675200015978; Tue, 31
 Jan 2023 13:20:15 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
In-Reply-To: <Y9mD1qp/6zm+jOME@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 31 Jan 2023 13:19:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
Message-ID: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Jan 31, 2023 at 1:10 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Umm...  What about the semantics of get_user() of unmapped address?
> Some architectures do quiet EFAULT; some (including alpha) hit
> the sucker with SIGBUS, no matter what.

I think we should strive to just make this all common.

The reason alpha is different is almost certainly not intentional, but
a combination of "pure accident" and "nobody actually cares".

> Are we free to modify that behaviour, or is that part of arch-specific
> ABI?

I'd just unify this all, probably with a preference for existing
semantics on x86 (because of "biggest and most varied user base").

That whole "send SIGBUS even for kernel faults" is certainly bogus and
against the usual rules. And I may well be to blame for it (I have
this memory of disliking how EFAULT as a return code didn't actually
return the faulting address). And realistically, it's also just not
something that any normal application will ever hit.  Giving invalid
addresses to system calls is basically always a bug, although there
are always special software that do all the crazy corner cases (ie
things like emulators tend to do odd things).

I doubt such special software exists on Linux/alpha, though.

So I wouldn't worry about those kinds of oddities overmuch.

*If* somebody then finds a load that cares, we can always fix it
later, and I'll go "mea culpa, I didn't think it would matter, and I
was wrong".

         Linus

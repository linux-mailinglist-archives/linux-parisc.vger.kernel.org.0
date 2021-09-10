Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C1E40718B
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Sep 2021 20:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbhIJS6q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 Sep 2021 14:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbhIJS6p (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Sep 2021 14:58:45 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EBCC061756
        for <linux-parisc@vger.kernel.org>; Fri, 10 Sep 2021 11:57:34 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id m4so4754262ljq.8
        for <linux-parisc@vger.kernel.org>; Fri, 10 Sep 2021 11:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uMGNAkC/DgKf7R/w+ERTmA5mo3/aqraem+n/oPfXFWA=;
        b=ZSvwI2pluf+Zin+xbGVAOxBOhkk5OQab8xKewsNK9kh8eWiVXopLuwsVHSIWjdKPmA
         o8XE8hQbxhnMLjunt9ht89yWeV0B/wkIf/lZU1fsz/TEphmQx5BoJkg3ZQKAKTKMCY+F
         bArBzRrZMlopLf/qya1e9KE34Kpr5sKGZch4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uMGNAkC/DgKf7R/w+ERTmA5mo3/aqraem+n/oPfXFWA=;
        b=LBCDShbNaAd4Q9WnbrFHKG5UzN+t7ngyZLhexSbOOFlnPvj2a+UdN+1S7DRXXLvKdN
         ZFQeTt4QuiMEmFIr7RofgAU0VK5+WGB+j7QZBCaCglrA5KnSvfe8GeXASriV2AMLvAvp
         z9YAmlbBNKTYR1WYknKE193BP9inTUzcvcWVw1ATImdCKYMBi70UIhmGZYWnHIv28lCU
         qOJq7Xjd/1VVezU+nhrcxLxRloEj4dbGD9Nsn2pzYEqoUEoI4xO+It5u37qbA9onH3uw
         JdJQlMds970nqEJfi+cgiG6wvi+c/F3XA7OY3L0LjCHaETXcKzOiAOjVp4RqdzUqYIad
         9lcg==
X-Gm-Message-State: AOAM533lCnWDX/I7wNA8U8ATB1uXDTY/xZ7deSBaC3CQjyjyhmbhqEJN
        4Me704X8RaO2uyJfocPiFByT4z7pDKvYF92HgMc=
X-Google-Smtp-Source: ABdhPJzlbP5f/3NJfX6kojJvTppRRURvaEFmkqKcs51caqlTYHWl4rozQafvcLcv9AbK03BGKGxpCw==
X-Received: by 2002:a05:651c:2109:: with SMTP id a9mr5579935ljq.174.1631300252018;
        Fri, 10 Sep 2021 11:57:32 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 28sm635062lfq.158.2021.09.10.11.57.31
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 11:57:31 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id n2so6083310lfk.0
        for <linux-parisc@vger.kernel.org>; Fri, 10 Sep 2021 11:57:31 -0700 (PDT)
X-Received: by 2002:a05:6512:3da5:: with SMTP id k37mr5052881lfv.655.1631300251179;
 Fri, 10 Sep 2021 11:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <YTsioP7hPOP47cfn@ls3530>
In-Reply-To: <YTsioP7hPOP47cfn@ls3530>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 10 Sep 2021 11:57:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjtcSUFiXn4E22SrQBVE0giWZ=m4owA6MmS74C9jW1=dQ@mail.gmail.com>
Message-ID: <CAHk-=wjtcSUFiXn4E22SrQBVE0giWZ=m4owA6MmS74C9jW1=dQ@mail.gmail.com>
Subject: Re: [GIT PULL] parisc architecture fixes for kernel v5.15-rc1
To:     Helge Deller <deller@gmx.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Sep 10, 2021 at 2:19 AM Helge Deller <deller@gmx.de> wrote:
>
> please pull some more parisc architecture fixes for kernel 5.15-rc1 from:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/for-5.15/parisc-3

Well that doesn't work at all.

The *branch* name that you have a few lines lower down in the actual
pull request part ('parisc-5.15-3') does work, but I didn't get the
tag. I suspect you used the branch name because you couldn't get the
wrong tag name to work, and didn't look at why it didn't work.

Because looking closer using 'git ls-remote', it's because your tag
name was bogus. You actually named it 'for-5.13/parisc-3'.

I fixed it up and edited the wrong name after-the-fact, but please be
more careful.

> * Remove CONFIG_SET_FS incl. KERNEL_DS and USER_DS from parisc and
>   switch to __get/put_kernel_nofault()

Lovely. Several architectures to go (alpha, arc, csky, h8300, hexagon,
ia64, m68k, microblaze, nds32, nios2, openrisc, sh, sparc, um, and
xtensa) but it's slowly shrinking..

             Linus

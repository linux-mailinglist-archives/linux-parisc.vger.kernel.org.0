Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715FE1FFBFD
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Jun 2020 21:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgFRTsn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 18 Jun 2020 15:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbgFRTsm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 18 Jun 2020 15:48:42 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1D5C06174E
        for <linux-parisc@vger.kernel.org>; Thu, 18 Jun 2020 12:48:41 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g2so4224370lfb.0
        for <linux-parisc@vger.kernel.org>; Thu, 18 Jun 2020 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAj23S3Mp6rRGO4SN+Gp5C3WPkcIYgiIEGIXxkjYIf0=;
        b=O8vGhvfOfOq9wLj1E8rP/VwqEBx1zwNPyHW+trZ6ABPefealuQSSUilZwTmE1SLwx3
         zEwIy5hJ4gIay72KjTq2B1QzBGNJ+P/4jwxTdP42XjdJJEBlYBl/eBUwneIpV2J18exN
         a/r+v/+JeACo1IVMd6iMfbPGsYHL+wiwfVYwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAj23S3Mp6rRGO4SN+Gp5C3WPkcIYgiIEGIXxkjYIf0=;
        b=JStokAilhyDiLr4s3JESIklNIUsYg3tXlhNhtdKgYUnaSNE1AAJKFIC8puIRojDl7S
         3oen7pxw4yvITR65ABBUzurLHmmVwmwSndgDFZmTJ0k/EomR0dp7S9BjjnowttMT/zdA
         XggdBPPOOXmk90idGHbfmfSkGjZzk5OuteX8j0OzI1CPiutg08GEUB+13rV9wKIay77U
         wNd7OzW9yrQ87EH5bqCL2KC6DKZLK23hDg7SfU7iwGs9FnYwkJ9qT+WquxCgIc5USPQH
         Ni/qa4Gl9X9smaB6TIkrNWXqJL73vrQpSlfhwSBWk6wgOpbofw5uguU68JxfqY4i4Qw4
         brbw==
X-Gm-Message-State: AOAM531KvAl6ldNgmusDBXNdFGBG/SRpzkk0KHt0HoewEyb6DpwBBiKJ
        gxyb3L8dEAJg4THgJHRnMLuxOW+zv64=
X-Google-Smtp-Source: ABdhPJwnNFsGQEG0tTz69Esm2JxRPe+HMV8fgNDGE5enRZAKiwk6KkcU5Hlx62n6kPwxq+iZNptP6w==
X-Received: by 2002:ac2:5962:: with SMTP id h2mr3204318lfp.66.1592509719835;
        Thu, 18 Jun 2020 12:48:39 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id w10sm950957lfq.14.2020.06.18.12.48.38
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 12:48:38 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id q19so8776224lji.2
        for <linux-parisc@vger.kernel.org>; Thu, 18 Jun 2020 12:48:38 -0700 (PDT)
X-Received: by 2002:a2e:8e78:: with SMTP id t24mr9039ljk.314.1592509718255;
 Thu, 18 Jun 2020 12:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200617073755.8068-1-hch@lst.de>
In-Reply-To: <20200617073755.8068-1-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 18 Jun 2020 12:48:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpnu=882iD9ck9Ywt6R1LYX_Hv-oS7dBMsWZwDRGZ5jA@mail.gmail.com>
Message-ID: <CAHk-=wjpnu=882iD9ck9Ywt6R1LYX_Hv-oS7dBMsWZwDRGZ5jA@mail.gmail.com>
Subject: Re: rename probe_kernel_* and probe_user_*
To:     Christoph Hellwig <hch@lst.de>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>, Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

[ Explicitly added architecture lists and developers to the cc to make
this more visible ]

On Wed, Jun 17, 2020 at 12:38 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Andrew and I decided to drop the patches implementing your suggested
> rename of the probe_kernel_* and probe_user_* helpers from -mm as there
> were way to many conflicts.  After -rc1 might be a good time for this as
> all the conflicts are resolved now.

So I've merged this renaming now, together with my changes to make
'get_kernel_nofault()' look and act a lot more like 'get_user()'.

It just felt wrong (and potentially dangerous) to me to have a
'get_kernel_nofault()' naming that implied semantics that we're all
familiar with from 'get_user()', but acting very differently.

But part of the fixups I made for the type checking are for
architectures where I didn't even compile-test the end result. I
looked at every case individually, and the patch looks sane, but I
could have screwed something up.

Basically, 'get_kernel_nofault()' doesn't do the same automagic type
munging from the pointer to the target that 'get_user()' does, but at
least now it checks that the types are superficially compatible.
There should be build failures if they aren't, but I hopefully fixed
everything up properly for all architectures.

This email is partly to ask people to double-check, but partly just as
a heads-up so that _if_ I screwed something up, you'll have the
background and it won't take you by surprise.

               Linus

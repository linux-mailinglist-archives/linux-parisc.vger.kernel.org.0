Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B8B404083
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Sep 2021 23:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236012AbhIHV1o (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Sep 2021 17:27:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231956AbhIHV1o (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Sep 2021 17:27:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E23361176
        for <linux-parisc@vger.kernel.org>; Wed,  8 Sep 2021 21:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631136395;
        bh=5kHzakZgAJhqL+egJwzO+nyw2sWo9zF1serJlxnk4sQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BgtkV/s8pC2mFs6IjjE1Yi80QoHJkKpf3WyEi7wtZqCChw0v2SWO1ZWcv78g4UmKV
         XZeFfGQuQahgF6oszRweqslFBV598V7cO6wkTLfiHu6uyNOaFGHiD8Z6VmRr8wkgUD
         4ntSVck0yZhecjwZ5meCec9igpCL98/a3iMcqogcShJ5sTZsOppv+2KRALUZ7BeO5m
         hRS80eX3n+FiavChR9C3K3OX7P/Tfhpfwx56s47xJ9Sf5BET64U7kzj8HZfu+NzrFM
         JxZS8kFJd6Bk58Tep/9vHxZjJqwdWBAapuBfEyzPdFxQCixpGth9F/mzSYu35NtfWi
         Q7QFx0xqEw0vA==
Received: by mail-wr1-f50.google.com with SMTP id n5so5252949wro.12
        for <linux-parisc@vger.kernel.org>; Wed, 08 Sep 2021 14:26:35 -0700 (PDT)
X-Gm-Message-State: AOAM531ejBnexVhMQiUpvdYEVkEqsfyBX0RKZ7K2Phxpmtza3Os3Nitw
        xyJd1GYvK2qbHtlMXQRbs0CAEKhQuhxCPemtckY=
X-Google-Smtp-Source: ABdhPJzXDIkRjYVPw7dTB7lo74lvOtLt3meNyc6cO+s4U6o+FDPSsBwmgb9KdY5vVjHHB3ycWHrE1wysDVCW1sUHVKE=
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr343967wrs.71.1631136394175;
 Wed, 08 Sep 2021 14:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210908204405.127665-1-deller@gmx.de>
In-Reply-To: <20210908204405.127665-1-deller@gmx.de>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 8 Sep 2021 23:26:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1-ajAFtO5zE396DBPUzssdas5o+adsEDtAK58X1ZAU7w@mail.gmail.com>
Message-ID: <CAK8P3a1-ajAFtO5zE396DBPUzssdas5o+adsEDtAK58X1ZAU7w@mail.gmail.com>
Subject: Re: [PATCH 1/4] parisc: Drop strnlen_user() in favour of generic version
To:     Helge Deller <deller@gmx.de>
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Sep 8, 2021 at 10:44 PM Helge Deller <deller@gmx.de> wrote:
>
> As suggested by Arnd Bergmann, drop the parisc version of
> strnlen_user() and switch to the generic version.

The strnlen_user() removal looks good,

Acked-by: Arnd Bergmann <arnd@arndb.de>

> user_addr_max() was wrong too, fix it by using TASK_SIZE.

Not sure about this part though:

>  /*
>   * Complex access routines -- macros
>   */
> -#define user_addr_max() (~0UL)
> +#define user_addr_max() (uaccess_kernel() ? ~0UL : TASK_SIZE)

We are getting very close to completely removing set_fs()/get_fs(),
uaccess_kernel() and some related bits from the kernel, so I think
it would be better to the other way here and finish off removing
CONFIG_SET_FS from parisc.

I think this will also simplify your asm/uaccess.h a lot, in particular
since it has separate address spaces for __get_user() and
__get_kernel_nofault(), and without set_fs() you can leave out
the runtime conditional to switch between them.

       Arnd

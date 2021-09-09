Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8474045CB
	for <lists+linux-parisc@lfdr.de>; Thu,  9 Sep 2021 08:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbhIIGxT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 9 Sep 2021 02:53:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:33386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232403AbhIIGxS (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 9 Sep 2021 02:53:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BCB961101
        for <linux-parisc@vger.kernel.org>; Thu,  9 Sep 2021 06:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631170328;
        bh=59JxH1vQ2rsk+TT8ZuCjo25PUg2HxrRSrg6M3WmJmbs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VfftJMtYmDKpVKHrWzRthci6z/DBl/WNTilUcH95+sdasbrlNBN5eozVqect1QrwI
         gPP7TNI2GZhAw2gL68AdK2jIyCCH9A2yfgZYD6e5xBy62TwJjNgM0YGBNV9WlAmUlX
         CKI4Xzdjdufe0tm7k5Fyq0ubBJsewvpK1vKXZDzU1secB0GPZpTx2XLzAHAx3kFa4r
         i1audiUACWChi4F/aWX7P9CLMqWkaDbU59p4CCafqGSalhnTFNCilxxrA8Kp/EsZT+
         jeW897HYtzQ9I8QNophrwRec6G983ZFrWjH2azkIaUiy/VZnK0waiaG/k6pGfTuRUR
         weu6w5NrfpAVA==
Received: by mail-wr1-f47.google.com with SMTP id z4so943948wrr.6
        for <linux-parisc@vger.kernel.org>; Wed, 08 Sep 2021 23:52:09 -0700 (PDT)
X-Gm-Message-State: AOAM530AD8O4a6qoz+lmIXA7g6JOObDWaLmZpO9SD7WJciPpEQKqzGdJ
        h51egG6gVA9vT8W1oyDyhmFy9+cFe3qPxBv5iF8=
X-Google-Smtp-Source: ABdhPJy9McB04L4OBdLqmOWjJLz2polM6kM5wkTyWBSQu50x+bYrP+0915t+CzCdDMqvcklPPrjhcgb5ggEbi3Uq0B0=
X-Received: by 2002:adf:914e:: with SMTP id j72mr1589066wrj.428.1631170328252;
 Wed, 08 Sep 2021 23:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210908204405.127665-1-deller@gmx.de> <CAK8P3a1-ajAFtO5zE396DBPUzssdas5o+adsEDtAK58X1ZAU7w@mail.gmail.com>
 <97d4c69c-59ff-8e28-0cfe-50908b999729@gmx.de> <CAK8P3a0wkfWsz7a91Qf--+BDDWKmYyBC4wkBEnbehWu1vGXEZQ@mail.gmail.com>
 <YTlrWrItSwR4cN3u@ls3530>
In-Reply-To: <YTlrWrItSwR4cN3u@ls3530>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 9 Sep 2021 08:51:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3m1m8P3=aTFi5J3-M+Ykff2z8JXdic=3w6_3D_6Ds00Q@mail.gmail.com>
Message-ID: <CAK8P3a3m1m8P3=aTFi5J3-M+Ykff2z8JXdic=3w6_3D_6Ds00Q@mail.gmail.com>
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

On Thu, Sep 9, 2021 at 4:03 AM Helge Deller <deller@gmx.de> wrote:
> * Arnd Bergmann <arnd@kernel.org>:
> >
> > I think the only part you need to add is __get_kernel_nofault()
> > and __put_kernel_nofault(). You can see in mm/maccess.c
> > what the difference between the two versions in there is.
> >
> > Once you have those, you define HAVE_GET_KERNEL_NOFAULT
> > and then remove CONFIG_SET_FS, set_fs(), get_fs(), load_sr2(),
> > thread_info->addr_limit, KERNEL_DS, and USER_DS.
>
> Thanks for those hints!
> The attached initial patch below seems to work, it boots into systemd.
> It needs further cleanups though.
>
> I wonder if you should add a workaround for 32-bit kernels
> to not copy 64bit-wise, see my patch below in
> copy_from_kernel_nofault():
>
> -       copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
> +       /* avoid 64-bit accesses on 32-bit platforms */
> +       if (sizeof(unsigned long) > 4)
> +               copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);

I would assume that the 8-byte copy would just turn into two 4-byte
accesses here, with exactly the same behavior. Note that this function
changed in 5.15 when I added support for architectures without
unaligned access. You need to include 132b548af559 ("mm/maccess:
fix unaligned copy_{from,to}_kernel_nofault") here for parsic as well,
I assume.

If you prefer to avoid the 8-byte access, this could be done in the
'align = (unsigned long)dst | (unsigned long)src;' statement by
masking out that bit.

> [PATCH] parisc: Implement __get/put_kernel_nofault()
>
> Add __get_kernel_nofault() and __put_kernel_nofault(), define
> HAVE_GET_KERNEL_NOFAULT and remove CONFIG_SET_FS, set_fs(), get_fs(),
> load_sr2(), thread_info->addr_limit, KERNEL_DS, and USER_DS.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Suggested-by: Arnd Bergmann <arnd@kernel.org>

Looks good to me overall, with the missing cleanups added.

You should probably include a TASK_SIZE_MAX definition that matches the
old user_addr_max() to avoid looking up the per-task value every time.

       Arnd

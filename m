Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFE93DFFF9
	for <lists+linux-parisc@lfdr.de>; Wed,  4 Aug 2021 13:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236450AbhHDLNb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 4 Aug 2021 07:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236655AbhHDLN1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 4 Aug 2021 07:13:27 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6011EC06179E
        for <linux-parisc@vger.kernel.org>; Wed,  4 Aug 2021 04:13:09 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id y1so802748vsc.1
        for <linux-parisc@vger.kernel.org>; Wed, 04 Aug 2021 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/dX/3b6FaOpNMT7IFaiEI2CzG67GUq50nJlfaoXU0vc=;
        b=p3UYl4lwRYQ8i6YCOMkHtc48l6wq9BUGMWtu2TO7tzj1xahiMx00Oos7dic6R6BbO+
         4cel/SAZhBaKH+iX3y23G1VudRcqzh7HoW4YrzHmF9QJMC84fC3xrrulPDTSlTD7UJy2
         FYoQf9R/6NS7CatGztyAxD612su759huCsMDs739/b+IJ5I3dW8a2Bvat8+WUXlKf1a9
         vQi8/OePC1Vl+Y9tKEGshTh1lBbL2UpR9yCIJIW3jBQS7GaE5Wlw5oUlXF7DafPq1RGY
         OkG2pKiuExUU2ELE9P/7zjN/yPHJliZ4CtZ8AXP7GuTO43GZUZY2bTr33Cq3u4eOuFvn
         7QWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/dX/3b6FaOpNMT7IFaiEI2CzG67GUq50nJlfaoXU0vc=;
        b=XyRUHUQ9W6jQw3glKstHar1fut0wKXdEoLoQwrn+nNEYbRmlhuX9v9FAncBjPwnSnv
         A9hJfZs/FCEHwnV6MoUxZxxzumMUwuEH+aWRuey1kHDHvaweQL4rQ0IDOBBDBCsTMVD0
         ZARfXGonEPTQQOMSyUd1+IDZgJgMUECMyAN259LH91jDGySyR1jpxW/WxunFZgfxFZqF
         5+sWTtYtWrjdl/vamJSrqZrS09x2DxuhovG5RNLj0AoNXpptH/l6Pa/q2Attn+aGgaqC
         BQ1LcILtOKZLdRV7cXNztfJ/X16mOvxSeQncviAUD6vEq23xGxzrldZvh9yLsRNS8ykX
         RdoQ==
X-Gm-Message-State: AOAM5302CJrIiaTOFFzj0K0hG3j4RClLyswW5nIqYyyzwtKTGx/a6XU+
        YZn0y/145eCyCAsD0V+icOe2EarooEGn7EG0/WAA+A==
X-Google-Smtp-Source: ABdhPJwrTsv+EJti/ieeyYQU1ct+fkSyCA7cqQ3UPyE7N/qRbEbq7Ua3AgaG4AZzN10UYbosHfeOoqJNO5hws8N0JeY=
X-Received: by 2002:a67:f6d8:: with SMTP id v24mr18598001vso.48.1628075588257;
 Wed, 04 Aug 2021 04:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210712060928.4161649-1-hch@lst.de> <20210712060928.4161649-2-hch@lst.de>
In-Reply-To: <20210712060928.4161649-2-hch@lst.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 4 Aug 2021 13:12:31 +0200
Message-ID: <CAPDyKFq2hqPYR-m3+mo7Gwu1421f_faE0jRpK4nJ8CDe=jHsjw@mail.gmail.com>
Subject: Re: [PATCH 1/6] mmc: JZ4740: remove the flush_kernel_dcache_page call
 in jz4740_mmc_read_data
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Russell King <linux@armlinux.org.uk>,
        Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Alex Shi <alexs@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>, linux-mm@kvack.org,
        Linux Documentation <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, 12 Jul 2021 at 08:10, Christoph Hellwig <hch@lst.de> wrote:
>
> MIPS now implements flush_kernel_dcache_page (as an alias to
> flush_dcache_page).
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Apologies for the delay!

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/mmc/host/jz4740_mmc.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
> index 0db17bcc9c16..aa2240c83510 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -578,10 +578,6 @@ static bool jz4740_mmc_read_data(struct jz4740_mmc_host *host,
>                         }
>                 }
>                 data->bytes_xfered += miter->length;
> -
> -               /* This can go away once MIPS implements
> -                * flush_kernel_dcache_page */
> -               flush_dcache_page(miter->page);
>         }
>         sg_miter_stop(miter);
>
> --
> 2.30.2
>

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC51E29C7D7
	for <lists+linux-parisc@lfdr.de>; Tue, 27 Oct 2020 19:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1829174AbgJ0SvH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 27 Oct 2020 14:51:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37030 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439278AbgJ0SvD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 27 Oct 2020 14:51:03 -0400
Received: by mail-wr1-f65.google.com with SMTP id w1so3109816wrm.4
        for <linux-parisc@vger.kernel.org>; Tue, 27 Oct 2020 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=xZvOPp8kVilTXiarx7tF8Az0EBe1RW6Y/QV8MotyV8s=;
        b=E+QQVJ6LfsGiPw+sjgvs9YvBaCMf1GKIz7ybqinbvbTMr1KW7mqY4QeBxNzuBdpThA
         5nblxw4cSCvxn53HUmGzrWW56wSRcZpEwRo8h3Il6vyoNnQIHYZG/9MPA2jqo8IOuzOL
         8MTCtvJdUGydgE1zIBJMJEYdbTnFiHIdKO51I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=xZvOPp8kVilTXiarx7tF8Az0EBe1RW6Y/QV8MotyV8s=;
        b=WNqCnj7DrMvbRsWtfFguPzMDqkQN1iZ0OWnKdR6Yg8dUI05jVlgQeZ6GEHtWBD1Vvv
         GrcUPQPtJckCVHs8LjeEc8tlvQWv6yTwuQ8WrckHomevfCcedCJL+SL1OWdGHA5i0cn3
         LIPeT969I/FAjuVcJIbbEkiu4h1OGRc0DlrJLy2aFklFsPEw3Xdc7xo1irZvuNzWA5re
         KhNy8OLhacudVsipg9hhpXZ7E5zEAn8xon5E4WLqXbxPs7bUTlETWq0dSAua2m1W6B9k
         LFvsyIchb5FvRAbq5OJSSW5WVye/iu7SNdElj/VtJ8KOWL9r/Lp4z3jwmByxxSmGHPH4
         40RQ==
X-Gm-Message-State: AOAM532Opob4/V+g7CHcSPI96VaahpKjHuNHmSbTIbxSweZ94ukFZ4gl
        BcxMBz2BcOI46kjteRE7tOSlFg==
X-Google-Smtp-Source: ABdhPJynFNg4Z7kz02rR4kjthPaTiI0vcEd436zZEQWyrQ9iXhwvzQ88EYNHIKOIDvTpL9kSzGn5Jg==
X-Received: by 2002:adf:e446:: with SMTP id t6mr4255615wrm.46.1603824661583;
        Tue, 27 Oct 2020 11:51:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 24sm2884131wmg.8.2020.10.27.11.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 11:51:00 -0700 (PDT)
Date:   Tue, 27 Oct 2020 19:50:58 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-parisc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] Fonts: Make font size unsigned in font_desc
Message-ID: <20201027185058.GM401619@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jiri Slaby <jirislaby@kernel.org>, linux-parisc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Oct 27, 2020 at 12:33:05PM -0400, Peilin Ye wrote:
> It is improper to define `width` and `height` as signed in `struct
> font_desc`. Make them unsigned. Also, change the corresponding printk()
> format identifiers from `%d` to `%u`, in sti_select_fbfont().
> 
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

I'm not entirely sure of the motivation here ... height/width should never
ever be even close to the limit here. Or have you seen integer math that
could potentially go wrong if we go with unsigned instead of int?
-Daniel

> ---
> Build-tested.
> 
>  drivers/video/console/sticore.c | 2 +-
>  include/linux/font.h            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/console/sticore.c b/drivers/video/console/sticore.c
> index 6a26a364f9bd..d1bb5915082b 100644
> --- a/drivers/video/console/sticore.c
> +++ b/drivers/video/console/sticore.c
> @@ -502,7 +502,7 @@ sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
>  	if (!fbfont)
>  		return NULL;
>  
> -	pr_info("STI selected %dx%d framebuffer font %s for sticon\n",
> +	pr_info("STI selected %ux%u framebuffer font %s for sticon\n",
>  			fbfont->width, fbfont->height, fbfont->name);
>  			
>  	bpc = ((fbfont->width+7)/8) * fbfont->height; 
> diff --git a/include/linux/font.h b/include/linux/font.h
> index b5b312c19e46..4f50d736ea72 100644
> --- a/include/linux/font.h
> +++ b/include/linux/font.h
> @@ -16,7 +16,7 @@
>  struct font_desc {
>      int idx;
>      const char *name;
> -    int width, height;
> +    unsigned int width, height;
>      const void *data;
>      int pref;
>  };
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

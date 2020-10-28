Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C86A29D690
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Oct 2020 23:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731386AbgJ1WQM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 28 Oct 2020 18:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731266AbgJ1WPD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:15:03 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E33C0613D1
        for <linux-parisc@vger.kernel.org>; Wed, 28 Oct 2020 15:15:02 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id f9so809225lfq.2
        for <linux-parisc@vger.kernel.org>; Wed, 28 Oct 2020 15:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=nMCdu9Rzb/ndcD48Tcjh9B2LFonFTQlfv9eH4WIE5/E=;
        b=F0MCnNXxvfO8m+8X6ysd9pz9RNST9ee2OunsJBFhJ1jACU0VNPR7jRqTcr42Em1B/N
         4RkfEXr/avMA+O9xcQ2WiJud6Px7h8GMje+np40dqlpRDSKXgimNhQtHUuAPltPhyb11
         5fbAF7gudEUJdH7kFcywq06bqCQv1F5USJd8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=nMCdu9Rzb/ndcD48Tcjh9B2LFonFTQlfv9eH4WIE5/E=;
        b=k1sA1gg3p1PbwToTQS1MOXEZzY4eGkNWdu9XejM6s3ubo7yKrtv1DX6ylBh/iF2jbv
         1CChkosCaJtPH3HThDJwwuaNjmtuMS4veXX3EdsiT6mbmWPRJp2yyS3BV6DfsxC2mWM8
         wkXChU0zP9v3xnVRsUuwBooLFdG0gWS+pJXHUdx7a9TdG1sD1BL5gDYzrTLEsRg8XuxF
         1iQGTtEmr+HVze8suJyV4zS5/MyYueu8lZfg6ZczDWBWL2xDny1SBEmYm6UntzoEl0d+
         9kyidhkUS8+QgDGTAsj0k2YB0XnyP2inmKl9tqiSM5kZrFk+Ke8q7t0j4dsjJ61RF8i9
         WkdQ==
X-Gm-Message-State: AOAM530rQKYyZPlA45rrDLrcE6Ruts+fCVYej2iOjTnZu0I1ZhlxsmVX
        vVnEltwqawJHMieIo+j10LbMF526NQJq0eBm
X-Google-Smtp-Source: ABdhPJyrBDGD6E9I6oqu06SgLOB/cJ7qVsKtWh9rtNK4o2kg9zioPQMWZFyxGdfWYjPLun8Im926hQ==
X-Received: by 2002:adf:e685:: with SMTP id r5mr841525wrm.340.1603910429440;
        Wed, 28 Oct 2020 11:40:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f7sm597277wrx.64.2020.10.28.11.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 11:40:28 -0700 (PDT)
Date:   Wed, 28 Oct 2020 19:40:26 +0100
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
Subject: Re: [PATCH v2 2/5] Fonts: Make font size unsigned in font_desc
Message-ID: <20201028184026.GX401619@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jiri Slaby <jirislaby@kernel.org>, linux-parisc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
 <20201028105647.1210161-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028105647.1210161-1-yepeilin.cs@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Oct 28, 2020 at 06:56:47AM -0400, Peilin Ye wrote:
> `width` and `height` are defined as unsigned in our UAPI font descriptor
> `struct console_font`. Make them unsigned in our kernel font descriptor
> `struct font_desc`, too.
> 
> Also, change the corresponding printk() format identifiers from `%d` to
> `%u`, in sti_select_fbfont().
> 
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Pushed to drm-misc-next, thanks for the patch.
-Daniel

> ---
> Change in v2:
>   - Mention `struct console_font` in the commit message. (Suggested by
>     Daniel Vetter <daniel@ffwll.ch>)
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

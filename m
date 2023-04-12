Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A92E6DFDB0
	for <lists+linux-parisc@lfdr.de>; Wed, 12 Apr 2023 20:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjDLShe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 12 Apr 2023 14:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjDLShT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 12 Apr 2023 14:37:19 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9A286B0
        for <linux-parisc@vger.kernel.org>; Wed, 12 Apr 2023 11:36:20 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-2f4130b898cso40954f8f.0
        for <linux-parisc@vger.kernel.org>; Wed, 12 Apr 2023 11:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1681324578; x=1683916578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iotXYskUF+/DG6kbootzfPpseutpEZOaWKQuwFW3nPc=;
        b=F2yWnTh6JD6YAwIbKGqZlFf6jElNl09gRIdVnXLocP6oQxKA0JlBaArPGod51MruWm
         vMCtIiqSpufEh/ZxzSz1aEwzjX63Hvxjavo5lH80nIkFle4P3A5hJQC6ejniScteYyNV
         DdtmZN8REHK8F4Igf4pbPhcWHNHHGX1Xvmyno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681324578; x=1683916578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iotXYskUF+/DG6kbootzfPpseutpEZOaWKQuwFW3nPc=;
        b=CodHKtpl+cdCpbRF/Iac74wy04TywDggedhsuIk6HEaQWCeZDZAf4Tpn7q4vSAsg2R
         CpwePUaTe0dE/pGTLOEqkFLywchakJDXCK3Boa7/hM1yLv2n1C+GnqGg01BoWWuS7pYX
         d0GV8IoBsxDKvUhqR3sr+9Wes5tZ7TvpjxIrJoDv1hQmS6+tPZ3at1E9lPGh8/BzesCg
         eH47MFR1NAf5eoNAaT5jzRlRiyTfEgp9CxNiW/RXyYjUVTBTMmxIXltjuUWtGpJaEldp
         hBmc8DANfj2R9HOG1fyNAVBZ6xEYdCHGKjVEIOp1OL7XgMZ4w7KxdbFgADjyiB7K3eYV
         9Nwg==
X-Gm-Message-State: AAQBX9dP+B1KbpVxy+eXKikfwJecI8LEqsLXW8GgiKRGyQ4RUvFAlqv3
        Nsbjpcrjiiqb8QEHXJ9aq5VBBg==
X-Google-Smtp-Source: AKy350b3o7jNJvapLc+5SVz7C5pAkMSqDY8s1MCWq3A7ljAn7esG8AWQCPoQifBpt5RWkp9oJizbSw==
X-Received: by 2002:a5d:664e:0:b0:2c7:1c72:699f with SMTP id f14-20020a5d664e000000b002c71c72699fmr2545182wrw.4.1681324578620;
        Wed, 12 Apr 2023 11:36:18 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id z16-20020a5d4c90000000b002cf1c435afcsm17808612wrs.11.2023.04.12.11.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 11:36:17 -0700 (PDT)
Date:   Wed, 12 Apr 2023 20:36:16 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-parisc@vger.kernel.org
Subject: Re: [PATCH] fbdev: modedb: Fix kernel crash in fb_videomode_to_var()
Message-ID: <ZDb6IF6Jj0xtVlme@phenom.ffwll.local>
References: <ZB4GS3zT3oh/afkf@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZB4GS3zT3oh/afkf@ls3530>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Mar 24, 2023 at 09:21:31PM +0100, Helge Deller wrote:
> Fix a kernel crash in the fbdev modedb code which can happen if you boot
> a system without any graphic card driver, in which case the dummycon
> driver takes the console. If you then load a fbdev graphics driver and
> start a the X11-fbdev the kernel will crash with a backtrace:
> 
>   IAOQ[0]: fb_videomode_to_var+0xc/0x88
>  Backtrace:
>   [<10582ff8>] display_to_var+0x28/0xe8
>   [<1058584c>] fbcon_switch+0x15c/0x55c
>   [<105a8a1c>] redraw_screen+0xdc/0x228
>   [<1059d6f8>] complete_change_console+0x50/0x140
>   [<1059eae0>] change_console+0x6c/0xdc
>   [<105ab4f4>] console_callback+0x1a0/0x1a8
>   [<101cb5e8>] process_one_work+0x1c4/0x3cc
>   [<101cb978>] worker_thread+0x188/0x4b4
>   [<101d5a94>] kthread+0xec/0xf4
>   [<1018801c>] ret_from_kernel_thread+0x1c/0x24
> 
> The problem is, that the dummycon driver may not have a valid monitor
> mode defined (which is ok for that driver), so the mode field in
> fbcon_display can be NULL.
> 
> Fix the crash by simply returning from fb_var_to_videomode()
> if the video mode field is NULL.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable <stable@kernel.org>

Also here since the other thread is private: I don't think this makes
sense, and it shouldn't happen that disp->mode is bogus when we have an
fbdev bound for that vc.

I think the below might work, I spotted this while auditing code around
this (but it turned out to be a dead-end for the bug I was chasing):

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index eb565a10e5cd..1f2ab00ec6d4 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2684,8 +2684,8 @@ static void fbcon_modechanged(struct fb_info *info)
 	p = &fb_display[vc->vc_num];
 	set_blitting_type(vc, info);
 
+	var_to_display(p, &info->var, info);
 	if (con_is_visible(vc)) {
-		var_to_display(p, &info->var, info);
 		cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
 		rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
 		cols /= vc->vc_font.width;

If this works I can bake it into a real patch.
-Daniel

> 
> ---
> 
> diff --git a/drivers/video/fbdev/core/modedb.c b/drivers/video/fbdev/core/modedb.c
> index 6473e0dfe146..6a670b9dbcb4 100644
> --- a/drivers/video/fbdev/core/modedb.c
> +++ b/drivers/video/fbdev/core/modedb.c
> @@ -893,6 +893,8 @@ void fb_var_to_videomode(struct fb_videomode *mode,
>  void fb_videomode_to_var(struct fb_var_screeninfo *var,
>  			 const struct fb_videomode *mode)
>  {
> +	if (!mode)
> +		return;
>  	var->xres = mode->xres;
>  	var->yres = mode->yres;
>  	var->xres_virtual = mode->xres;

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

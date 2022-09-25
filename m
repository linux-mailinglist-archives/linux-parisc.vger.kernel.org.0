Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3FA55E908B
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 02:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiIYAoF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 24 Sep 2022 20:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbiIYAn6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 24 Sep 2022 20:43:58 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766E84660C
        for <linux-parisc@vger.kernel.org>; Sat, 24 Sep 2022 17:43:52 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id w20so3266716ply.12
        for <linux-parisc@vger.kernel.org>; Sat, 24 Sep 2022 17:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=DppxKsLVh6ZmQmzczDJR/PGILiF3xOVpf3GavpeSXaA=;
        b=PTFJq7iMk3rsXWUCAWedsEyvuAXeHIOF8teXd+MnIZnk3qgxrvlvm2me4WDgNSZUfl
         eGR9e4eFxMgHfT9ZmIi/2JZsGHSKvYvrxJIDfUwHUcixdPaLO/SJSH3o4BX+IapDDcPC
         qL1mZQNBznXZkr/wiN/so0gi6hVxMKNlxGmmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=DppxKsLVh6ZmQmzczDJR/PGILiF3xOVpf3GavpeSXaA=;
        b=nwGO0V25GLar3faSoi9rwlu5fMSLO/4v3feCtgTTlq1GsTXGEwUBa0yGkM4YnsuHk3
         1trl/3J7m1oJTh5mQKB9HCciz681PneKnGgMZKK5VqI5Kjfr86/FYt3FaIKClFN6ehaV
         yUyD1h/iOlUcAZHV8q/CvxvlCjJLmkLfCT6cxrucasNrDVjaUcQ6q+/UupAC+FL56Rt+
         VrLj3UtthPAP0mf2MZbqimC7XQ7aoUaEUpb2roYZTYt/6iPo2TIJsRdb3cZejIEsTRj4
         NygT9UKAZ9qiNXxLYXEeNXO4YjNqotGJdT7CC6oManHOm4HiU83QUV+kd534TbJEjgJ6
         pXUA==
X-Gm-Message-State: ACrzQf2y89ue211tQ5ul37wLxwQY5ndPlULDd48RZn8Bf5TQEYAzy1k+
        kcHnm6qPdBMCiRFegCAKYTOsZQ==
X-Google-Smtp-Source: AMsMyM4NUDNkq7A9diS6bPTvQqeHy0cuaRfHyEiOkh3ifh7MMCqujGgF4GGVp/Yop81CdGxrou4pWA==
X-Received: by 2002:a17:902:b68f:b0:178:627d:b38d with SMTP id c15-20020a170902b68f00b00178627db38dmr15532832pls.87.1664066631991;
        Sat, 24 Sep 2022 17:43:51 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:cfca:1243:a69b:bb70])
        by smtp.gmail.com with ESMTPSA id c10-20020a170903234a00b001743ba85d39sm8549293plh.110.2022.09.24.17.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 17:43:50 -0700 (PDT)
Date:   Sun, 25 Sep 2022 09:43:45 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Helge Deller <deller@gmx.de>
Cc:     John Ogness <john.ogness@linutronix.de>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-parisc@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH printk 11/18] printk: Convert console_drivers list to
 hlist
Message-ID: <Yy+kQf0yQcth4kyT@google.com>
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
 <20220924000454.3319186-12-john.ogness@linutronix.de>
 <Yy88ZIIzEXtfb+m6@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yy88ZIIzEXtfb+m6@p100>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On (22/09/24 19:20), Helge Deller wrote:
> diff --git a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_cons.c
> index 3f9abf0263ee..f15998aa47a8 100644
> --- a/arch/parisc/kernel/pdc_cons.c
> +++ b/arch/parisc/kernel/pdc_cons.c
> @@ -262,8 +262,6 @@ void __init pdc_console_init(void)
>   */
>  void pdc_console_restart(bool hpmc)
>  {
> -	struct console *console;
> -
>  	if (pdc_console_initialized)
>  		return;
> 
> @@ -275,8 +273,8 @@ void pdc_console_restart(bool hpmc)
>  		pdc_cons.flags &= ~CON_PRINTBUFFER;
> 
>  	while (!hlist_empty(&console_list)) {
> -		unregister_console(READ_ONCE(hlist_entry(console_list.first,
> -							 struct console, node)));
> +		unregister_console(hlist_entry(console_list.first,
> +						 struct console, node));

In this case we maybe can use cons_first() macro here (perhaps
give it a little more clear name (first_console()?) and move to
printk.h) and also do READ_ONCE there

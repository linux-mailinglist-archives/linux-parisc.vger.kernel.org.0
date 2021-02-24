Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2EC32478D
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Feb 2021 00:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbhBXXdC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 24 Feb 2021 18:33:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbhBXXdB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 24 Feb 2021 18:33:01 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36847C061574
        for <linux-parisc@vger.kernel.org>; Wed, 24 Feb 2021 15:32:21 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id o10so2559467pgg.4
        for <linux-parisc@vger.kernel.org>; Wed, 24 Feb 2021 15:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g5Gy0p/FQq9jX447dEvvCmbDqR5vUzjHm6T2Y74f/1I=;
        b=QFkVgQNTiu+/N75DJ6Z59aF8QOPIoxiX6qncyFFy4xTBds6g3WqzTlBjfdpPLRXISu
         iL89TgGf1xUQeRrY/5A2kdhWaGsYPaq3X7FaK8prs4/0BZ6aNr2Jqg1gfyp705qAqTRL
         OPlGqFU6exNaqMHv4QmNzz20egGMt7rHAhEPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g5Gy0p/FQq9jX447dEvvCmbDqR5vUzjHm6T2Y74f/1I=;
        b=fIw6Uu4w61X/JQdiySRjf3TT63ChkeZv0Tj5/pp29wLRSKu0tUEzw8DnJGSkdprnlL
         VP8h5PX+ufUJYW+3G+PNYo4mHFkquckqlsDz2UTd0uKNDCjMPle3zv3PeLfA6hCQQT56
         xV3mhjjy0HRGcCbBvaPH6DqeYvike4a4B3qtmoa8KruTld8WlvWSxGnzdeDn6F0Oy5gJ
         Ro0iAnZj4l9Le+ZOiqV162GHUKN5kVmpBTd9sQyOsrdn0WFEqEMGTXD36quKWXkhmAeL
         ElYMUd3T1QA1cQTmFftmPuBR7wlbZ9kbkz828Xy6CGtuwnHu3CNgKJCRez0fxgjMGA8v
         tQAA==
X-Gm-Message-State: AOAM530fh9fhmxJ/8COHTQh+OOun3anwkvT7oubJuS65xnqwC8NIghEM
        odVDDZA4H0uQeHcwOvfgmkHP/A==
X-Google-Smtp-Source: ABdhPJyEOHGWDGnSX+oJgmdx37VbyypUjZW+35RnUDRvzjr6jKfJ4VQJNyRorCN9sLTIUKVtbYHrFg==
X-Received: by 2002:a63:e42:: with SMTP id 2mr335730pgo.100.1614209540694;
        Wed, 24 Feb 2021 15:32:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o18sm3956468pjq.44.2021.02.24.15.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 15:32:20 -0800 (PST)
Date:   Wed, 24 Feb 2021 15:32:19 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Guenter Roeck <linux@roeck-us.net>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] parisc: select
 FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Message-ID: <202102241508.A10EB51C8@keescook>
References: <20210224225706.2726050-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224225706.2726050-1-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Feb 24, 2021 at 02:57:06PM -0800, Sami Tolvanen wrote:
> parisc uses -fpatchable-function-entry with dynamic ftrace, which means we
> don't need recordmcount. Select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
> to tell that to the build system.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 3b15cdc15956 ("tracing: move function tracer options to Kconfig")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

Cross-build tested for defconfig, allmodconfig, allyesconfig:

Tested-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/parisc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index ecef9aff9d72..f56c67bbe495 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -61,6 +61,7 @@ config PARISC
>  	select HAVE_KRETPROBES
>  	select HAVE_DYNAMIC_FTRACE if $(cc-option,-fpatchable-function-entry=1,1)
>  	select HAVE_FTRACE_MCOUNT_RECORD if HAVE_DYNAMIC_FTRACE
> +	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
>  	select HAVE_KPROBES_ON_FTRACE
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS
>  	select SET_FS
> 
> base-commit: 062c84fccc4444805738d76a2699c4d3c95184ec
> -- 
> 2.30.0.617.g56c4b15f3c-goog
> 

-- 
Kees Cook

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2686C32458F
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Feb 2021 22:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbhBXVDN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 24 Feb 2021 16:03:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233452AbhBXVDK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 24 Feb 2021 16:03:10 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB664C06174A
        for <linux-parisc@vger.kernel.org>; Wed, 24 Feb 2021 13:02:29 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id o38so2300598pgm.9
        for <linux-parisc@vger.kernel.org>; Wed, 24 Feb 2021 13:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4SvlU/VPC3jitNMDFCoTdqUmM2ems/SUz1e3P7eEQk8=;
        b=SYlpN8qNejqUuVmTxma7IIbHRieuWsqqi0lJCa8ykjPWjpAK9ezSrITp7k9r0KcJ0n
         1seoBdkqKTnw2Nj9nD4RS8s1swSaatRMA1HbOKTVpbaqXpnMcK2rU71vPN0HO522+Pnt
         S4jpK5AwG+5gwWq1FFkBH1RcJ7NZEvIpYx2lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4SvlU/VPC3jitNMDFCoTdqUmM2ems/SUz1e3P7eEQk8=;
        b=WI+kuYdWdscxeBzuqekznF8nhnNV0/jBXvwhmuPTo9K7AP91Nqn68RRkm2YlCpQUj+
         B+GlazlEjJ8gD1TodhYnb9bOhlmAIwWxe7pCbom3pQFOXuRBOumqjDlW+ASZesk03Q1L
         LIAhfOh7XC5nqBPocd0guGFgJSU3xpM+EQl5NkCT7wOEJzbHmhBmyXrqtVZ51go0zLdk
         v5d2FIJbUoVYuZ2PzRge+aq+0ekIM45qHrELG0nCL8sIWyH1isnM+k1Fxcdpsb0MiZoR
         +FrGcvyqaV+b/J0egj84CGtAe+I3k2gx9ksFnkEBu0uMz71306Ne2bYZTMIYFQnNxj38
         xy/g==
X-Gm-Message-State: AOAM5330k8206uFIguDxQ1u856tCgmpB/QSxJKFhR4MNedk/PO+qvjTt
        OiV3zXrzR62kF4UPSn956SVo0A==
X-Google-Smtp-Source: ABdhPJz66XN4j2LpwPuoy3e6mwQZLmn2HaozrxHR8+LnUzKBiVoxMW84WCO4p1plsgRGBhl00k+6Og==
X-Received: by 2002:a62:7c15:0:b029:1ed:9e29:5998 with SMTP id x21-20020a627c150000b02901ed9e295998mr16836549pfc.22.1614200549528;
        Wed, 24 Feb 2021 13:02:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e24sm3558427pjr.13.2021.02.24.13.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 13:02:28 -0800 (PST)
Date:   Wed, 24 Feb 2021 13:02:27 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Guenter Roeck <linux@roeck-us.net>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] parisc: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Message-ID: <202102241301.226812E88@keescook>
References: <20210224205938.4104543-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224205938.4104543-1-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Feb 24, 2021 at 12:59:38PM -0800, Sami Tolvanen wrote:
> parisc uses -fpatchable-function-entry with dynamic ftrace, which means we
> don't need recordmcount. Select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
> to tell that to the build system.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 3b15cdc15956 ("tracing: move function tracer options to Kconfig")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

I've got parisc building now, and can confirm:

Tested-by: Kees Cook <keescook@chromium.org>

Guenter, does this fix it for you too?

-Kees

> ---
>  arch/parisc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index ecef9aff9d72..9ee806f68123 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -60,6 +60,7 @@ config PARISC
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
>  	select HAVE_DYNAMIC_FTRACE if $(cc-option,-fpatchable-function-entry=1,1)
> +	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if HAVE_DYNAMIC_FTRACE
>  	select HAVE_FTRACE_MCOUNT_RECORD if HAVE_DYNAMIC_FTRACE
>  	select HAVE_KPROBES_ON_FTRACE
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS
> 
> base-commit: 719bbd4a509f403f537adcaefd8ce17532be2e84
> -- 
> 2.30.0.617.g56c4b15f3c-goog
> 

-- 
Kees Cook

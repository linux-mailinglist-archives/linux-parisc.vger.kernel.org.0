Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803D642FD77
	for <lists+linux-parisc@lfdr.de>; Fri, 15 Oct 2021 23:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243125AbhJOVfH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 15 Oct 2021 17:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243106AbhJOVfG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 15 Oct 2021 17:35:06 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF00C061762
        for <linux-parisc@vger.kernel.org>; Fri, 15 Oct 2021 14:32:59 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id q5so9701993pgr.7
        for <linux-parisc@vger.kernel.org>; Fri, 15 Oct 2021 14:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YNBNEYisZ+541asH+L6t1hZlJ/Xn9d3ughoW3yhbnMY=;
        b=f8kTQ/Y/ACr3yL4eMWtqbWU2xm18S+76EHKyee4Vqqv4SV8J6qk5BuskJbEb6Ql/TJ
         c9EbbOivEp4/Vy74Zv5n8MvM1vLyBEeJPN8m+5olTn2ub0SZO8xZlaRygBBGEjyk6s6j
         dW6pUEjVARu6NrsLidMTQLR5wt2C5k6t+XvQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YNBNEYisZ+541asH+L6t1hZlJ/Xn9d3ughoW3yhbnMY=;
        b=j+zma1fRjDEwobAqqsfpDIusxmrwkCIQIqcSynHLKUfDw4FB6u4xYCmARbQ6iwznO/
         2KSpDY47Y+dEMYzJXYb2vD39UkJuNLYN0gRfE0va8NnSjQZAjl3stEtkL0UkOhVsEFPL
         2H1H3W0cqppvgXJXsL0r8FSFg0jMGZcof/MhTmJOVHklc6fLfLpA3SxBjEynhJUxSyAX
         PZDQ1aybadEES4hUCyal8qFsNO22PzgJIP34X9o6XiLfoLHiqtbCkLHaaIfB4scCMM14
         3DRBJpk7rBL/UhsAwoSugOL3X4zzHSbdAIGCqBcKscJXHLf/gUAmg15dbaiOhboITqgt
         9mDA==
X-Gm-Message-State: AOAM5306WkxT/zk9u7H7wif8OtSxg5yPbyrfgK18oW4OwwPP9KizLscR
        WKgu1npMVJ03yo9go85PUAKA8A==
X-Google-Smtp-Source: ABdhPJzAyN+K8Hifn5n3pJa0D9tsRyoaRMolZRmu5TyHtvN6ydh9MAL1iJXdAj5PTEgi34yjsZ8kvg==
X-Received: by 2002:a63:ef58:: with SMTP id c24mr10773001pgk.299.1634333579455;
        Fri, 15 Oct 2021 14:32:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t126sm5787900pfc.80.2021.10.15.14.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 14:32:59 -0700 (PDT)
Date:   Fri, 15 Oct 2021 14:32:58 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 11/13] lkdtm: Fix lkdtm_EXEC_RODATA()
Message-ID: <202110151432.D8203C19@keescook>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <44946ed0340013a52f8acdee7d6d0781f145cd6b.1634190022.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44946ed0340013a52f8acdee7d6d0781f145cd6b.1634190022.git.christophe.leroy@csgroup.eu>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Oct 14, 2021 at 07:50:00AM +0200, Christophe Leroy wrote:
> Behind its location, lkdtm_EXEC_RODATA() executes
> lkdtm_rodata_do_nothing() which is a real function,
> not a copy of do_nothing().
> 
> So executes it directly instead of using execute_location().
> 
> This is necessary because following patch will fix execute_location()
> to use a copy of the function descriptor of do_nothing() and
> function descriptor of lkdtm_rodata_do_nothing() might be different.
> 
> And fix displayed addresses by dereferencing the function descriptors.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I still don't understand this -- it doesn't look needed at all given the
changes in patch 12. (i.e. everything is using
dereference_function_descriptor() now)

Can't this patch be dropped?

-Kees

> ---
>  drivers/misc/lkdtm/perms.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 035fcca441f0..5266dc28df6e 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -153,7 +153,14 @@ void lkdtm_EXEC_VMALLOC(void)
>  
>  void lkdtm_EXEC_RODATA(void)
>  {
> -	execute_location(lkdtm_rodata_do_nothing, CODE_AS_IS);
> +	pr_info("attempting ok execution at %px\n",
> +		dereference_function_descriptor(do_nothing));
> +	do_nothing();
> +
> +	pr_info("attempting bad execution at %px\n",
> +		dereference_function_descriptor(lkdtm_rodata_do_nothing));
> +	lkdtm_rodata_do_nothing();
> +	pr_err("FAIL: func returned\n");
>  }
>  
>  void lkdtm_EXEC_USERSPACE(void)
> -- 
> 2.31.1
> 

-- 
Kees Cook

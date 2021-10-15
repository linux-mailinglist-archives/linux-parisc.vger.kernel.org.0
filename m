Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE8542FD6E
	for <lists+linux-parisc@lfdr.de>; Fri, 15 Oct 2021 23:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238613AbhJOVdn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 15 Oct 2021 17:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbhJOVdm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 15 Oct 2021 17:33:42 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2BFC061570
        for <linux-parisc@vger.kernel.org>; Fri, 15 Oct 2021 14:31:35 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id 187so9411519pfc.10
        for <linux-parisc@vger.kernel.org>; Fri, 15 Oct 2021 14:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kKloKGIwGWmZY9+Er8BC6aPtcIV5M1fZmtHmnCWa8iU=;
        b=JeYYnn823k8n2zSxtjokkfqoZ5ilS26HSi3+OKWmuzF1ap1aszmc7JLPZWsF4HCG0w
         31EKzOJ0R9W8h1AKhQ/AK6BIP9nPFEBX8Fhn+ihNhFPlklATnjeMva6cxWbMA+SX6L+t
         CU/dKvCcEPU/V6JRuGbgX3x4m1PI5C82Th35I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kKloKGIwGWmZY9+Er8BC6aPtcIV5M1fZmtHmnCWa8iU=;
        b=J7qOU+Guxd84snwL7sLA3mVimqqYa+8OyuWd6+Qm5ZqrLFYXWzJ0tht943wB0ZZNSJ
         /YHW7pw5a0LDkyUNKsbpO/im4HwdYUz5KZUyuSJduJaPgckxw68Ygv+wksMq2gFW/iXV
         0JbW+5NmbUsQPfu9o00C6l7ZV6jb7fqqNXa23NWagsiyvnlcbb4i88NnB3B53BTxi30x
         /aKq4PKsVp5NZJfBPqngKKyLXgIphzdmN86V+tsTIGcLw5cU9FVpv3FUi4N1F545UmEv
         3r/eTbmQyaqlQX0/7u7+UJooH5oI09hLL/sVUMy56DHeuYgyOkyoEo8aopocQEYzkMqq
         wLXg==
X-Gm-Message-State: AOAM533Klndzv9ZpOcbaXX/vlvFch0kaRUO174AkPtLaZASz3G4R1Jdh
        Nr4D2uTFK5mGDM8f8hWTEJui/Q==
X-Google-Smtp-Source: ABdhPJwdYjbf9GZPBypn6MBgVe8w8NzMTcIJZgnbet0In82Ohn0MIUwTdtq337oO2srKIC8IRC508w==
X-Received: by 2002:a05:6a00:992:b0:44d:8981:37f6 with SMTP id u18-20020a056a00099200b0044d898137f6mr9473913pfg.76.1634333495151;
        Fri, 15 Oct 2021 14:31:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id gf23sm6006874pjb.26.2021.10.15.14.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 14:31:34 -0700 (PDT)
Date:   Fri, 15 Oct 2021 14:31:33 -0700
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
Subject: Re: [PATCH v2 12/13] lkdtm: Fix execute_[user]_location()
Message-ID: <202110151428.187B1CF@keescook>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <cbee30c66890994e116a8eae8094fa8c5336f90a.1634190022.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbee30c66890994e116a8eae8094fa8c5336f90a.1634190022.git.christophe.leroy@csgroup.eu>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Oct 14, 2021 at 07:50:01AM +0200, Christophe Leroy wrote:
> execute_location() and execute_user_location() intent
> to copy do_nothing() text and execute it at a new location.
> However, at the time being it doesn't copy do_nothing() function
> but do_nothing() function descriptor which still points to the
> original text. So at the end it still executes do_nothing() at
> its original location allthough using a copied function descriptor.
> 
> So, fix that by really copying do_nothing() text and build a new
> function descriptor by copying do_nothing() function descriptor and
> updating the target address with the new location.
> 
> Also fix the displayed addresses by dereferencing do_nothing()
> function descriptor.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/misc/lkdtm/perms.c     | 25 +++++++++++++++++++++----
>  include/asm-generic/sections.h |  5 +++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 5266dc28df6e..96b3ebfcb8ed 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -44,19 +44,32 @@ static noinline void do_overwritten(void)
>  	return;
>  }
>  
> +static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
> +{
> +	memcpy(fdesc, do_nothing, sizeof(*fdesc));
> +	fdesc->addr = (unsigned long)dst;
> +	barrier();
> +
> +	return fdesc;
> +}

How about collapsing the "have_function_descriptors()" check into
setup_function_descriptor()?

static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
{
	if (__is_defined(HAVE_FUNCTION_DESCRIPTORS)) {
		memcpy(fdesc, do_nothing, sizeof(*fdesc));
		fdesc->addr = (unsigned long)dst;
		barrier();
		return fdesc;
	} else {
		return dst;
	}
}

> +
>  static noinline void execute_location(void *dst, bool write)
>  {
>  	void (*func)(void) = dst;
> +	func_desc_t fdesc;
> +	void *do_nothing_text = dereference_function_descriptor(do_nothing);
>  
> -	pr_info("attempting ok execution at %px\n", do_nothing);
> +	pr_info("attempting ok execution at %px\n", do_nothing_text);
>  	do_nothing();
>  
>  	if (write == CODE_WRITE) {
> -		memcpy(dst, do_nothing, EXEC_SIZE);
> +		memcpy(dst, do_nothing_text, EXEC_SIZE);
>  		flush_icache_range((unsigned long)dst,
>  				   (unsigned long)dst + EXEC_SIZE);
>  	}
>  	pr_info("attempting bad execution at %px\n", func);
> +	if (have_function_descriptors())
> +		func = setup_function_descriptor(&fdesc, dst);
>  	func();
>  	pr_err("FAIL: func returned\n");
>  }
> @@ -67,15 +80,19 @@ static void execute_user_location(void *dst)
>  
>  	/* Intentionally crossing kernel/user memory boundary. */
>  	void (*func)(void) = dst;
> +	func_desc_t fdesc;
> +	void *do_nothing_text = dereference_function_descriptor(do_nothing);
>  
> -	pr_info("attempting ok execution at %px\n", do_nothing);
> +	pr_info("attempting ok execution at %px\n", do_nothing_text);
>  	do_nothing();
>  
> -	copied = access_process_vm(current, (unsigned long)dst, do_nothing,
> +	copied = access_process_vm(current, (unsigned long)dst, do_nothing_text,
>  				   EXEC_SIZE, FOLL_WRITE);
>  	if (copied < EXEC_SIZE)
>  		return;
>  	pr_info("attempting bad execution at %px\n", func);
> +	if (have_function_descriptors())
> +		func = setup_function_descriptor(&fdesc, dst);
>  	func();
>  	pr_err("FAIL: func returned\n");
>  }


> diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
> index 76163883c6ff..d225318538bd 100644
> --- a/include/asm-generic/sections.h
> +++ b/include/asm-generic/sections.h
> @@ -70,6 +70,11 @@ typedef struct {
>  } func_desc_t;
>  #endif
>  
> +static inline bool have_function_descriptors(void)
> +{
> +	return __is_defined(HAVE_FUNCTION_DESCRIPTORS);
> +}
> +
>  /* random extra sections (if any).  Override
>   * in asm/sections.h */
>  #ifndef arch_is_kernel_text

This hunk seems like it should live in a separate patch.

-- 
Kees Cook

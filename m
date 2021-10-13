Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFBC42B820
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Oct 2021 08:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbhJMHBH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 13 Oct 2021 03:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhJMHBG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 13 Oct 2021 03:01:06 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5948DC061570
        for <linux-parisc@vger.kernel.org>; Tue, 12 Oct 2021 23:59:04 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id k26so1612212pfi.5
        for <linux-parisc@vger.kernel.org>; Tue, 12 Oct 2021 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ah8mNtDhQsWbV9KwnesQGFpsH5Aqgy4h8sZPRodsuTQ=;
        b=iYoXg2tr5uR+0Nm6/7bv2feTzNboP5MoWc+N3Mcwv2iDRVw0pFvhxWOd61gJnNH9su
         tIqFIxnUdQlKPtmJqrQ8BNteu39zfQaWMQasygpt32FcCdo7pqlDFdgKgPrXyx3AptwM
         zkZxhWFgsqIFBb3TLt1dhhopIbTg0apkRywBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ah8mNtDhQsWbV9KwnesQGFpsH5Aqgy4h8sZPRodsuTQ=;
        b=v1aO+ghtxdZnPPGTL87R7jWn8r6wWerZYY6bFpXLMz42E0dw+StnTMk+/0KlkOKUeB
         csqryvxIZg9mPChwi41md0lZ2+1fqR4SwA66mDUiuZ4hhik29BDqbZ3AEi1v/k56Ynkj
         EK8N34qcLLQkOuJcuL5QhB+t3PjhHi5aBofSeUY9SzGkm7vrpcQMUNrJattRfwR05bl/
         Z7VrKyz6faFOqnRJvWk1g9kA0DHSwd/zkLTVekygBsIAkupRB+4OsyWrnk1NblggMtNt
         0M3+lnnjYQ3geb8PKjXDWqY7G/ANH6sMx/mg3ySkR4fSm+bTsAsKS5Z3T46txcxzcTDH
         V1zA==
X-Gm-Message-State: AOAM531aUjRmyD063/+yW64VlXZYj857taiJy4uiQZbSgZhMvt1nSZWf
        gh9ZvPsuTzyrSnwz41YpWICdjg==
X-Google-Smtp-Source: ABdhPJzillT6hQ4qfjxKjNb7ySoarsV30yXxp2Jky0yj9b4NY2jS3CPORXAf7y3D7ilwslclDlQbpA==
X-Received: by 2002:a62:188c:0:b0:44d:6660:212b with SMTP id 134-20020a62188c000000b0044d6660212bmr1056541pfy.8.1634108343817;
        Tue, 12 Oct 2021 23:59:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n21sm1086528pfv.115.2021.10.12.23.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 23:59:03 -0700 (PDT)
Date:   Tue, 12 Oct 2021 23:59:02 -0700
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
Subject: Re: [PATCH v1 01/10] powerpc: Move 'struct ppc64_opd_entry' back
 into asm/elf.h
Message-ID: <202110122358.4AFDC0BC7@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <8ff3ec195d695033b652e9971fba2dc5528f7151.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ff3ec195d695033b652e9971fba2dc5528f7151.1633964380.git.christophe.leroy@csgroup.eu>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Oct 11, 2021 at 05:25:28PM +0200, Christophe Leroy wrote:
> 'struct ppc64_opd_entry' doesn't belong to uapi/asm/elf.h
> 
> It was initially in module_64.c and commit 2d291e902791 ("Fix compile
> failure with non modular builds") moved it into asm/elf.h
> 
> But it was by mistake added outside of __KERNEL__ section,
> therefore commit c3617f72036c ("UAPI: (Scripted) Disintegrate
> arch/powerpc/include/asm") moved it to uapi/asm/elf.h
> 
> Move it back into asm/elf.h, this brings it back in line with
> IA64 and PARISC architectures.
> 
> Fixes: 2d291e902791 ("Fix compile failure with non modular builds")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I'd agree with Arnd: this is a reasonable cleanup and nothing should be
using it.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

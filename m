Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7389D33AB
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Oct 2019 23:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbfJJVx1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Oct 2019 17:53:27 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46597 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfJJVx1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Oct 2019 17:53:27 -0400
Received: by mail-pl1-f193.google.com with SMTP id q24so3427411plr.13
        for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2019 14:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eZ5a1UrQhKc0eFrayHNWPPaPzIDNm8Pl4fc7UtzEcwI=;
        b=C2jVvEnjI3cDO6vB/Rft3tcJex85MLNmn0DKywgUaA+JqHl5XVj8PXi/cisN6F6y3c
         jEyND9KgFacuQi0DUApP9FWNA9RdjSaH2p6/y3f9VUjJTyU7C7G4tqBJKEoaMJdm2xc7
         cC3Xwkvz83wYVon/M1YaWoXbhEZ1L27sCVrzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eZ5a1UrQhKc0eFrayHNWPPaPzIDNm8Pl4fc7UtzEcwI=;
        b=Hc7kuSCi21/5Ly9wOhguznbw1legpBWy658sfxOmpKea6zPT0Jd9hrHrg8ug8cL7IK
         /sfh7GCYKmUV/WW2QDX4Rx7EmzXTInzeVYBYyfhUH5ARFGtvLljngz6xW2/e4yH0i14Q
         fWMjg4LfGk4zkXJms/qUzF125fL96bno6uqJuxBQPHuSNHs2e+uosPWkSK0FKPgtX+WE
         ALB0CgJ0s8NW3/OEyNYzaBmSBNhyjcbiRJKLgTTkYJtMWkR0+f87sqkPa0hKn/BOpGk6
         JhRsUNkx5wNbXgcfgOyBzJiobxN8Vuep+Btivb0k8fZs3TeTTislPP0mYYA5UjnrcdVh
         F4HQ==
X-Gm-Message-State: APjAAAWujKh8ys0xnIPHCTNBNpCK190zkposKeoP4t587731eOeWgV4N
        cC34TfsLGKkOABE6HFtmp6X+6g==
X-Google-Smtp-Source: APXvYqzvP9DPNQm4eEFwpmDjtjMePiabTkC2OLVsNO4cce1OJAtguBuNxerHNmLTKublc5lHaVGkBg==
X-Received: by 2002:a17:902:8bc4:: with SMTP id r4mr11153280plo.341.1570744406496;
        Thu, 10 Oct 2019 14:53:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y4sm23629pfr.118.2019.10.10.14.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 14:53:25 -0700 (PDT)
Date:   Thu, 10 Oct 2019 14:53:24 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christian Brauner <christian.brauner@ubuntu.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-um@lists.infradead.org, luto@kernel.org, oleg@redhat.com,
        tglx@linutronix.de, wad@chromium.org, x86@kernel.org,
        Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v1] seccomp: simplify secure_computing()
Message-ID: <201910101450.0B13B7F@keescook>
References: <20190920131907.6886-1-christian.brauner@ubuntu.com>
 <20190924064420.6353-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924064420.6353-1-christian.brauner@ubuntu.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Sep 24, 2019 at 08:44:20AM +0200, Christian Brauner wrote:
> Afaict, the struct seccomp_data argument to secure_computing() is unused
> by all current callers. So let's remove it.
> The argument was added in [1]. It was added because having the arch
> supply the syscall arguments used to be faster than having it done by
> secure_computing() (cf. Andy's comment in [2]). This is not true anymore
> though.

Yes; thanks for cleaning this up!

> diff --git a/arch/s390/kernel/ptrace.c b/arch/s390/kernel/ptrace.c
> index ad71132374f0..ed80bdfbf5fe 100644
> --- a/arch/s390/kernel/ptrace.c
> +++ b/arch/s390/kernel/ptrace.c
> @@ -439,7 +439,7 @@ static int poke_user(struct task_struct *child, addr_t addr, addr_t data)
>  long arch_ptrace(struct task_struct *child, long request,
>  		 unsigned long addr, unsigned long data)
>  {
> -	ptrace_area parea; 
> +	ptrace_area parea;
>  	int copied, ret;
>  
>  	switch (request) {

If this were whitespace cleanup in kernel/seccomp.c, I'd take it without
flinching. As this is only tangentially related and in an arch
directory, I've dropped this hunk out of a cowardly fear of causing
(a likely very unlikely) merge conflict.

I'd rather we globally clean up trailing whitespace at the end of -rc1
and ask Linus to run some crazy script. :)

So, with that hunk removed, I've applied this to for-next/seccomp. :)

Thanks!

-- 
Kees Cook

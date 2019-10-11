Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6416CD4509
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2019 18:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbfJKQJ0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 11 Oct 2019 12:09:26 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38246 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfJKQJ0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 11 Oct 2019 12:09:26 -0400
Received: by mail-pg1-f196.google.com with SMTP id x10so6055805pgi.5
        for <linux-parisc@vger.kernel.org>; Fri, 11 Oct 2019 09:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rz208JH/bAYgb34feMbXc7rOAmJSapYVvu3TBVmWgf0=;
        b=k3VEdnK1XLODdhPbFCe/vXjRUrVGk8LtbhfzFlecnP8Kmv9f4bYkCsfO3n/TqN0AdN
         qBPqcub0N0dKdLHi1OxIweb3/6eczWoee7LuePEuJPxxCrmCNRf0LI9uLqFq5rTIaXHw
         uP6X5tVwyIUzUKipWUOB9mLE9R+uA81t/qC+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rz208JH/bAYgb34feMbXc7rOAmJSapYVvu3TBVmWgf0=;
        b=KndP6PMVGRcwxo6X8trYffbrTF3E6O8m2EEBKeXU3xR7oagbYp/oGPcfMMIx1GZTTi
         /MTuXiJoJvsLDFu4VfuFVMKFHTAUl9j8WywsT6O+KxKY5z1igj39fd9avReo4Qu9FCks
         1akikedGbnEpQPAid4UC5jXfqT1le2/dDA1ZyobS8Vzf0aUV3J6HLgosLBueNAlyxinH
         uLTP/LmNU9n3/FgADQhVmVLLgYtQehpbuzYWJdbtRuy5TpwJQYAj3vnNNUAD7OgREV1q
         xySIseuE2EmdDXv05bI/QrFgjPcEbqMlc4+DcLYdVPXsrsySMeIBIRk7XmUIlARTGWGe
         TFTQ==
X-Gm-Message-State: APjAAAWdk6ttwoAoj7Sme7f5qZtQuCIS6ixu1vEDiA45yVlrY52risLm
        oKFoqA83HT64Cafg8zaCgs+lLA==
X-Google-Smtp-Source: APXvYqzRI04wjSOtKB/baIR7njDLMah96e9dDVUlsW+Ic2nxptL0dLB9zZ6sMSyGO7t7MBKia+2VpQ==
X-Received: by 2002:a63:b5b:: with SMTP id a27mr18354873pgl.262.1570810165767;
        Fri, 11 Oct 2019 09:09:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d3sm8459551pgb.3.2019.10.11.09.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 09:09:24 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:09:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Borislav Petkov <bp@alien8.de>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, x86@kernel.org,
        linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 02/29] powerpc: Remove PT_NOTE workaround
Message-ID: <201910110908.040009F27@keescook>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-3-keescook@chromium.org>
 <878sprx1br.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878sprx1br.fsf@mpe.ellerman.id.au>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Oct 11, 2019 at 05:07:04PM +1100, Michael Ellerman wrote:
> Kees Cook <keescook@chromium.org> writes:
> > In preparation for moving NOTES into RO_DATA, remove the PT_NOTE
> > workaround since the kernel requires at least gcc 4.6 now.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  arch/powerpc/kernel/vmlinux.lds.S | 24 ++----------------------
> >  1 file changed, 2 insertions(+), 22 deletions(-)
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks!

> For the archives, Joel tried a similar patch a while back which caused
> some problems, see:
> 
>   https://lore.kernel.org/linuxppc-dev/20190321003253.22100-1-joel@jms.id.au/
> 
> and a v2:
> 
>   https://lore.kernel.org/linuxppc-dev/20190329064453.12761-1-joel@jms.id.au/
> 
> This is similar to his v2. The only outstanding comment on his v2 was
> from Segher:
>   (And I do not know if there are any tools that expect the notes in a phdr,
>   or even specifically the second phdr).
> 
> But this patch solves that by not changing the note.

Ah yes. Agreed: I'm retaining the note and dropping the workarounds.
FWIW, this builds happily for me in my tests.

-Kees

-- 
Kees Cook

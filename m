Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CF73E1BC1
	for <lists+linux-parisc@lfdr.de>; Thu,  5 Aug 2021 20:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241393AbhHESys (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 5 Aug 2021 14:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241463AbhHESyr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 5 Aug 2021 14:54:47 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133B4C061765
        for <linux-parisc@vger.kernel.org>; Thu,  5 Aug 2021 11:54:32 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id l18so7874352wrv.5
        for <linux-parisc@vger.kernel.org>; Thu, 05 Aug 2021 11:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mCmxN128wN048rQ3mL+tGyaLgz6ahBPx10bueA4yYQQ=;
        b=GOrV3VP+r8pYdlSiWQTpaesHdYyjntzU0PvvHrN5y3GEyAm/V0Gk6/Q2DVPAjUOuHG
         cg9PKnXKTT6euec26ur9UeGp7ZJ1lMFf0XKNZ8JHvT1V9wtuX3S5sCHtymzoXEU9qj2q
         qvrLHR5Nn9+CzXn368JWDViQsPx0sYdfYo81GedinLwzH0j/KWAgMJ76cgcFRANa52Ap
         k/HeuXbl/H4MM5n9iS0qwck3lV1RsVGsi6ht6u6CHCiFHc0J5dQij11Gxp4rS/NpUOOz
         xuYYqbl/V2ElVpVt72G3YEr+BRDilwSbeYw+9JCFvZusmxJWVls+zLhfdxvvorH6XeKQ
         WnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mCmxN128wN048rQ3mL+tGyaLgz6ahBPx10bueA4yYQQ=;
        b=hRppvUKX5xYZsU806FOJgASTn+p7VsNZr/MX6wSpwrIwSai8ykLBdRkHb71OGF2wMW
         rcoUqWP5/GT0zKyakk4K6BbDipp6LKWe43e3f5VgpBXXEYEG8+sxgzsQqdsG9XbR6THa
         iv8dHzH1YQF+Blm4yg6KyGWN0UAeJEODewToz2ksrgQHDxoGQQM2349EY5j8MSIPMeZK
         CgTFaye1YLmWPY9bNNjnfhb1b4iZhMO2p2a8g4OiGsV9wPXNR5XnrT1R8CUCuloUb5bi
         7wLi+ioTF6W1wQxIVEw2qAeQFB2pk7ZNCCynmDHNRMWRQrPNA8Rz+cVIB6ByI/PIn1By
         FMxQ==
X-Gm-Message-State: AOAM533msKhHA56r7LxJCeIjs6Ty6YKhO2BBIhbyzBEK5JQ2JbTJcLNZ
        Xw8Z/muMzhPWMPrIEtq45lljLg==
X-Google-Smtp-Source: ABdhPJwssE+mX4OXOdITg+L7JFPUjj2TqXmuwypTLByy6roZIhynzabMmSfypihLZgWIBDpfU85saA==
X-Received: by 2002:a5d:5906:: with SMTP id v6mr6899987wrd.194.1628189670642;
        Thu, 05 Aug 2021 11:54:30 -0700 (PDT)
Received: from google.com ([109.180.115.228])
        by smtp.gmail.com with ESMTPSA id p5sm7799843wrd.25.2021.08.05.11.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 11:54:30 -0700 (PDT)
Date:   Thu, 5 Aug 2021 19:54:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Vineet Gupta <vgupta@synopsys.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Brian Cain <bcain@codeaurora.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 1/3] arch: Export machine_restart() instances so they can
 be called from modules
Message-ID: <YQwz4xkuxvfrCnag@google.com>
References: <20210805075032.723037-1-lee.jones@linaro.org>
 <20210805075032.723037-2-lee.jones@linaro.org>
 <20210805173625.GH6719@arm.com>
 <YQww08x2whx/LIIT@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YQww08x2whx/LIIT@kroah.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, 05 Aug 2021, Greg Kroah-Hartman wrote:

> On Thu, Aug 05, 2021 at 06:36:25PM +0100, Catalin Marinas wrote:
> > On Thu, Aug 05, 2021 at 08:50:30AM +0100, Lee Jones wrote:
> > > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > > index b4bb67f17a2ca..cf89ce91d7145 100644
> > > --- a/arch/arm64/kernel/process.c
> > > +++ b/arch/arm64/kernel/process.c
> > > @@ -212,6 +212,7 @@ void machine_restart(char *cmd)
> > >  	printk("Reboot failed -- System halted\n");
> > >  	while (1);
> > >  }
> > > +EXPORT_SYMBOL(machine_restart);
> > 
> > Should we make this EXPORT_SYMBOL_GPL? I suppose it's not for general
> > use by out of tree drivers and it matches the other pm_power_off symbol
> > we export in this file.
> 
> Yes please.

Sure.

Thanks for the feedback.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84893355162
	for <lists+linux-parisc@lfdr.de>; Tue,  6 Apr 2021 12:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245255AbhDFK6R (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 6 Apr 2021 06:58:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35500 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245257AbhDFK6P (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 6 Apr 2021 06:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617706687;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aoo4T5OcYVMmIH5rVBArOHDK8SbcOJSOJ1qUYgR/5T8=;
        b=AvnKlSPrT2rbxeIr7hzHPgE1FIFEaIEmuwVwtjzpFDSS7c89SEXHhCcM585T6XgLiWkA93
        MmgNkWfTtvkJispz9eMSEDyNIh47YNDIPqCTeTWfYl3YP0hIGUH8S7xlwgn6Dbn5T+ykvh
        0oqFpWqa9s2D1y17v8/Tv0wqSwWiJnQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-oGGRjvfYN_yas4iF57RVdA-1; Tue, 06 Apr 2021 06:58:05 -0400
X-MC-Unique: oGGRjvfYN_yas4iF57RVdA-1
Received: by mail-pg1-f200.google.com with SMTP id n23so4473052pgl.2
        for <linux-parisc@vger.kernel.org>; Tue, 06 Apr 2021 03:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aoo4T5OcYVMmIH5rVBArOHDK8SbcOJSOJ1qUYgR/5T8=;
        b=eDd43bMzIsiEW/e6yTbYWc4F7ETnCfWQ7OZ8YFdnQltQiTcGymxioUanFJKvcNT8dW
         Ege414bXAElf/rAs9E+XBYBfvBehUfp2//dWRMr2VhlrS+XRp/a3aPHNilXlr2c3tgih
         QQxUYfGXVLzs8nno6faHO5zW6KTOky5oiQehC1VzFXD6YdLdhcCgWiiT3zS30DMhBzYd
         V60twO1WULeHgJ6OXHg+3kJqGkt1Dm0SxTTP182GHoDz+k0PCr0Gj9sFQJCxDmCCPc9v
         e2c+A2znrMo+upWBhbDvU1pqV1r4UnTeL0h6Otm2TJHxSXJFMFnouJjtKOxpH9RZJjJw
         i6Hw==
X-Gm-Message-State: AOAM532BhB/VcwgwPPTGA8TTDcpreNu3TwY2zFgm2alq1QGKGzFNbtL1
        ZnigWf+C6OM4EUhmht2GcyF5q+fG8zE7c4W02UqYDQ1uy+Ymn9Kz9DObmucmcis2we6LaO4DuVL
        ry7yrm/H64fG/fA6ZdkdO7IPK
X-Received: by 2002:a65:6643:: with SMTP id z3mr1474564pgv.387.1617706684307;
        Tue, 06 Apr 2021 03:58:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya/JAeXp9rFtQDgDn8HW+qGdQS73sx5LoNGY80ZZXhkPwr1QTS3aX8lbQdzfQ4srYGA95yMQ==
X-Received: by 2002:a65:6643:: with SMTP id z3mr1474553pgv.387.1617706684057;
        Tue, 06 Apr 2021 03:58:04 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id c6sm19868861pfj.99.2021.04.06.03.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 03:58:03 -0700 (PDT)
Date:   Tue, 6 Apr 2021 18:57:53 +0800
From:   Gao Xiang <hsiangkao@redhat.com>
To:     Helge Deller <deller@gmx.de>
Cc:     Gao Xiang <xiang@kernel.org>, linux-parisc@vger.kernel.org,
        Liam Beguin <liambeguin@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] parisc: avoid a warning on u8 cast for cmpxchg on u8
 pointers
Message-ID: <20210406105753.GA550515@xiangao.remote.csb>
References: <20210406045929.30331-1-xiang@kernel.org>
 <ee2016b1-926e-93b1-ba92-d5f4975f06c9@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee2016b1-926e-93b1-ba92-d5f4975f06c9@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Apr 06, 2021 at 12:08:55PM +0200, Helge Deller wrote:
> On 4/6/21 6:59 AM, Gao Xiang wrote:
> > From: Gao Xiang <hsiangkao@redhat.com>
> > 
> > commit b344d6a83d01 ("parisc: add support for cmpxchg on u8 pointers")
> > can generate a sparse warningi ("cast truncates bits from constant
> > value"), which has been reported several times [1] [2] [3].
> > 
> > The original code worked as expected, but anyway, let silence such
> > sparse warning as what others did [4].
> > 
> > [1] https://lore.kernel.org/r/202104061220.nRMBwCXw-lkp@intel.com
> > [2] https://lore.kernel.org/r/202012291914.T5Agcn99-lkp@intel.com
> > [3] https://lore.kernel.org/r/202008210829.KVwn7Xeh%25lkp@intel.com
> > [4] https://lore.kernel.org/r/20210315131512.133720-2-jacopo+renesas@jmondi.org
> > Cc: Liam Beguin <liambeguin@gmail.com>
> > Cc: Helge Deller <deller@gmx.de>
> > Signed-off-by: Gao Xiang <hsiangkao@redhat.com>
> 
> applied to the parisc for-next git tree.
> (I fixed up the typo above too)

Thanks all! :)

Thanks,
Gao Xiang

> 
> Thanks!
> Helge
> 
> > ---
> >   arch/parisc/include/asm/cmpxchg.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/parisc/include/asm/cmpxchg.h b/arch/parisc/include/asm/cmpxchg.h
> > index cf5ee9b0b393..84ee232278a6 100644
> > --- a/arch/parisc/include/asm/cmpxchg.h
> > +++ b/arch/parisc/include/asm/cmpxchg.h
> > @@ -72,7 +72,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new_, int size)
> >   #endif
> >   	case 4: return __cmpxchg_u32((unsigned int *)ptr,
> >   				     (unsigned int)old, (unsigned int)new_);
> > -	case 1: return __cmpxchg_u8((u8 *)ptr, (u8)old, (u8)new_);
> > +	case 1: return __cmpxchg_u8((u8 *)ptr, old & 0xff, new_ & 0xff);
> >   	}
> >   	__cmpxchg_called_with_bad_pointer();
> >   	return old;
> > 
> 


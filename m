Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCAF485A9A
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jan 2022 22:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244405AbiAEV3K (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jan 2022 16:29:10 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:41833 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244426AbiAEV3K (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jan 2022 16:29:10 -0500
Received: by mail-pg1-f173.google.com with SMTP id f8so305788pgf.8
        for <linux-parisc@vger.kernel.org>; Wed, 05 Jan 2022 13:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=geDubaEazrAukgkgSHvBdcuiGvi1NZeM565x3dKQUGo=;
        b=KirvHUtRKqae39VGt6ve7Y0sjuKJB1X2cX9Mr85qllwJJGA305t90twES7Puf11u/u
         n6fEJ7hZ8m5NMjSCmON5ifKouiN7vWgbHflzGENqsonbUB7mRocHmC1+SeEJGKNsbDgr
         xcbyxby3TB8r253BivZ4iSYMqqhQGqJxNTl7DLwDu0IZL0S3ZEvddBFeM27A5W6cEwjp
         9OCHCNd7WLC8r7C1T9NSZ9AKOYifvVqW4tjSinDbt983nKa64E7FlN2F9yB+EYqpNWLK
         ppK5nhWhVhJtVuhc1qjHgcsIpnmklyCsbvc3UBIv4byaCjXatxe1JmybNpFK+c114oEL
         hJfA==
X-Gm-Message-State: AOAM531q/aCWEa+gvYqMIuAhWPmKKuEwDQziL01oZc2L4kZ1GeMTLknp
        Dnd5skMYj8Sm155mWtnsrLU2sKYkIPg=
X-Google-Smtp-Source: ABdhPJyohybXPe4dioy/R3n5sCL5WmhlR2vBEhhF6QuvRFzZvlXdTrhJ47WbGiVLRPIJm1J3edcErg==
X-Received: by 2002:aa7:85d8:0:b0:4bc:a1d8:d333 with SMTP id z24-20020aa785d8000000b004bca1d8d333mr16797540pfn.4.1641418149764;
        Wed, 05 Jan 2022 13:29:09 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:fe3a:aa6c:7088:7ef7? ([2620:15c:211:201:fe3a:aa6c:7088:7ef7])
        by smtp.gmail.com with ESMTPSA id mh3sm3761321pjb.26.2022.01.05.13.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 13:29:08 -0800 (PST)
Message-ID: <daa2fc8f-306d-8b7c-defa-bc01c8f17cd3@acm.org>
Date:   Wed, 5 Jan 2022 13:29:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] parisc: io: Improve the outb(), outw() and outl() macros
Content-Language: en-US
To:     "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
References: <20211012222936.3810578-1-bvanassche@acm.org>
Cc:     deller@gmx.de, linux-parisc@vger.kernel.org
From:   Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20211012222936.3810578-1-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/12/21 15:29, Bart Van Assche wrote:
> This patch fixes the following build error for source file
> drivers/scsi/pcmcia/sym53c500_cs.c:
> 
> In file included from ./include/linux/bug.h:5,
>                   from ./include/linux/cpumask.h:14,
>                   from ./include/linux/mm_types_task.h:14,
>                   from ./include/linux/mm_types.h:5,
>                   from ./include/linux/buildid.h:5,
>                   from ./include/linux/module.h:14,
>                   from drivers/scsi/pcmcia/sym53c500_cs.c:42:
> drivers/scsi/pcmcia/sym53c500_cs.c: In function ‘SYM53C500_intr’:
> ./arch/parisc/include/asm/bug.h:28:2: error: expected expression before ‘do’
>     28 |  do {        \
>        |  ^~
> ./arch/parisc/include/asm/io.h:276:20: note: in expansion of macro ‘BUG’
>    276 | #define outb(x, y) BUG()
>        |                    ^~~
> drivers/scsi/pcmcia/sym53c500_cs.c:124:19: note: in expansion of macro ‘outb’
>    124 | #define REG0(x)  (outb(C4_IMG, (x) + CONFIG4))
>        |                   ^~~~
> drivers/scsi/pcmcia/sym53c500_cs.c:362:2: note: in expansion of macro ‘REG0’
>    362 |  REG0(port_base);
>        |  ^~~~
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   arch/parisc/include/asm/io.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
> index 0b5259102319..837ddddbac6a 100644
> --- a/arch/parisc/include/asm/io.h
> +++ b/arch/parisc/include/asm/io.h
> @@ -273,9 +273,9 @@ static inline int inl(unsigned long addr)
>   	return -1;
>   }
>   
> -#define outb(x, y)	BUG()
> -#define outw(x, y)	BUG()
> -#define outl(x, y)	BUG()
> +#define outb(x, y)	({(void)(x); (void)(y); BUG(); 0;})
> +#define outw(x, y)	({(void)(x); (void)(y); BUG(); 0;})
> +#define outl(x, y)	({(void)(x); (void)(y); BUG(); 0;})
>   #endif
>   
>   /*
> 

(+Helge Deller and linux-parisc)

Ping?

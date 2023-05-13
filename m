Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0AAB701ADC
	for <lists+linux-parisc@lfdr.de>; Sun, 14 May 2023 01:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbjEMXdb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 13 May 2023 19:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjEMXda (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 May 2023 19:33:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07BF270A
        for <linux-parisc@vger.kernel.org>; Sat, 13 May 2023 16:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684020759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kuHEY7gsVuiFiXl+53MD5bHOx6Z5hSGvu1zCkH4fAZs=;
        b=aEpAtregpTgD8r2sGEXOex0opZGGAurh05T+BrxuUuF56Myu9n/avxKEzMOAZOzP6bXsR5
        TubnaN1HR45yfECGxpUplU0ipPxb0WjkAFhRtFXnZAvv6JCVJeOpGC7h5RyrMd3KN3nFC5
        Iy+nYA7ElmpYrziPlILd/QFzDKOpb7I=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-ZGFOlar4Pl2d0H12cxxebg-1; Sat, 13 May 2023 19:32:38 -0400
X-MC-Unique: ZGFOlar4Pl2d0H12cxxebg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-3f387ab062dso55905121cf.3
        for <linux-parisc@vger.kernel.org>; Sat, 13 May 2023 16:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684020757; x=1686612757;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuHEY7gsVuiFiXl+53MD5bHOx6Z5hSGvu1zCkH4fAZs=;
        b=Uy8JIvfH5zbqpBxiMSejxVlJ/oITurSjOkZe5u8Hp0yY/Ty5YDFeabABgnC/XTzJI2
         knc6R+o+xDaijzyF7wDnEOTy1aHlQ2Tw2OwP46BMKHWLlF9uD1k2ISBq8z/UQ6DO7D++
         DphlOS+iWlZuDDwoiKSFeoDkQr58UqBRfTe8XBEf7ew6/AJgm2qKo5fE0mnTfnR+bxL4
         rc0m0EkZvlSKgpkrbJ1iHp5gqlhdBXCyAbp9BSlKkLQ9SRzHpchpem32RFeJbMXE0RaQ
         h+asPT6IvDquW+FaRkqH/MfHNLYF3z4J+FvLoicCvcHUrkIgLz8So2wNOoQpITv4YWCG
         3sig==
X-Gm-Message-State: AC+VfDyXOE2ThDKEiWiwCK0fltFzY/7A0TIhkBhp55LPuhVX/SKXEGbF
        I/FTf1V/d3qDaTL5dhzRKhLQYHQy8WFhOLWs5nHl+4OZrpW7vWKHJGk2ZrZsjLcJbf9IzniwZoa
        Cp/5yjWOeeVyLdTkpqEPiqFfYixKNIrQYMbY=
X-Received: by 2002:ac8:5a48:0:b0:3f3:d87c:14c1 with SMTP id o8-20020ac85a48000000b003f3d87c14c1mr28834500qta.35.1684020757584;
        Sat, 13 May 2023 16:32:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5D+fal4N9vrCWvptFrFF8LHTxDKxyuVsWhmSiQ3xHBcnkh1gQL+mRuwHxfMuGJLbVRNvqKbg==
X-Received: by 2002:ac8:5a48:0:b0:3f3:d87c:14c1 with SMTP id o8-20020ac85a48000000b003f3d87c14c1mr28834484qta.35.1684020757311;
        Sat, 13 May 2023 16:32:37 -0700 (PDT)
Received: from ?IPV6:2603:7000:3d00:1816::1772? (2603-7000-3d00-1816-0000-0000-0000-1772.res6.spectrum.com. [2603:7000:3d00:1816::1772])
        by smtp.gmail.com with ESMTPSA id o27-20020a05620a131b00b0075794298894sm3453962qkj.105.2023.05.13.16.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 16:32:36 -0700 (PDT)
Message-ID: <aa47c2f2-2bee-6f73-9987-cd1800433a39@redhat.com>
Date:   Sun, 14 May 2023 01:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To:     Helge Deller <deller@gmx.de>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Cc:     linux-parisc@vger.kernel.org
References: <1683740497@msgid.manchmal.in-ulm.de>
 <8889a75f-1a81-905e-8bc4-a733de32985f@gmx.de>
 <1683825030@msgid.manchmal.in-ulm.de>
 <85aef102-8407-68c7-2dc2-87e5a866906b@gmx.de>
 <1683928214@msgid.manchmal.in-ulm.de> <ZF9+OYqQS/vy7Oq5@p100>
 <8d23bbd1-adcb-d52e-791b-42faae04c14e@redhat.com>
 <0ae03822-01ee-cd57-ac33-7d9df6774bd7@gmx.de>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: Regression with kernel 6.3 "kernel BUG at
 include/linux/swapops.h:472!"
In-Reply-To: <0ae03822-01ee-cd57-ac33-7d9df6774bd7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

>>
>> This fix makes it work like the layout I documented.
> 
> Yes, and your layout looks good for me.

Good :)

> 
>> What I originally tried doing was reusing one of the spare bits instead of reworking
>> the layout. Apparently, I got the old layout wrong. :(
> 
> Don't worry! Your patch harmonizes parisc to the other platforms, which is good.
> 
>> So if I understood the layout right this time, maybe we can just use one of the two
>> spare bits: _PAGE_HUGE (or alternatively, _PAGE_DIRTY_BIT)?
> 
> Yes, or keep what you suggested.
> 
> What I don't understand yet is the original code:
> #define __swp_type(x)                     ((x).val & 0x1f)
> #define __swp_offset(x)                   ( (((x).val >> 6) &  0x7) | \
>                                             (((x).val >> 8) & ~0x7) )
> #define __swp_entry(type, offset)         ((swp_entry_t) { (type) | \
>                                               ((offset &  0x7) << 6) | \
>                                               ((offset & ~0x7) << 8) })
> 
> Don't we loose one of the offset bits?

Let's assume we have the offset 0xff. Encoding it with type 0 would be

((0xff & 0x7) << 6) | ((0xff & ~0x7) << 8)
-> (0x7 << 6) | (0xf8 << 8)
-> 0x1c0 | 0xf800
-> 0xf9c0

Extracting the offset:

((0xf9c0 >> 6) & 0x7) | ((0xf9c0 >> 8) & ~0x7)
-> (0x3e7 & 0x7) | (0xf9 & ~0x7)
-> 0x7 | 0xf8
-> 0xff

I think it's correct. The confusing part (that resulted in the BUG here) 
is that we end up wasting bit #26, because there is a spare bit between 
the type and the offset.

Maybe a relic from the past -- or copy-and-paste, because some archs 
supported types with > 5 bits, but core-MM only ever uses 5 bits.

> Mask 0x7 is 3 bits, but we shift by 6 and 8 (=2 bits difference), so I believe the second shift should be 9.
> If it would be 9, then no &0x07 is needed and only one shift would be sufficient.
> 
> I don't know much in the swap pte area, but isn't the previous original code wrong?
> Which bits of the swp_entry are used where?
I think the old code was correct. There are apparently two spare bits 
that we can use. I just messed up the old layout, thinking there is only 
one.

So we can either use the new layout I documented (with the fix you 
propose), or use another layout.

In any case, we *gain* one more bit for the offset compared to the old 
layout.


I'm more than happy to keep the new layout. Regarding your fix, maybe 
avoid the other ~0x7 as well by using similar shifting in __swp_entry()


  #define __swp_entry(type, offset)         ((swp_entry_t) { \
  					    ((type) & 0x1f) | \
					    ((offset &  0x7) << 5) | \
					    ((offset >> 3) << 10) })

So it's easier to match to the logic/values in __swp_offset().


In any case,

Reviewed-by: David Hildenbrand <david@redhat.com>

and thanks!

-- 
Thanks,

David / dhildenb


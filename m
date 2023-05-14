Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE78701AE8
	for <lists+linux-parisc@lfdr.de>; Sun, 14 May 2023 02:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjENAJT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 13 May 2023 20:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjENAJS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 May 2023 20:09:18 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81066268E
        for <linux-parisc@vger.kernel.org>; Sat, 13 May 2023 17:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684022950; i=deller@gmx.de;
        bh=5jw/wRILs4DtAJ+yvzf7JywjXhQ92Gn++P8EJLIOeNk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=itPKFx5GrEFJIc4abT3qglWIQv10G1FadFpFDky2TjGv45qCd+Eb5xKKwhdETj3NG
         AGOtfnhv8IW48IeP73WfER3VXJSHrwJN+aOFq58ECTNbY3a8boZRxshL0e8OmbfmBv
         ZRt18HLMs+u+ahoTKhCRoI3oUG1md5cw9cY4tmc+lQYyqbPIiUf08oiHuWTQ/77oGo
         nZ6f1NYctBAjDeoOCAOZFnvdok5Lx6JbetOZxdKC5CzFSHYYdeAMuHQf0CjQlIBUhj
         QT4wTvXu7Vbcn0iW7GE2zrAB3lw7TdUcJ3f4NboPMxuSIQ/YWVSRgtx7zG0m44diV4
         MtdKw4H8GwOdQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.158.250]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6Ue3-1q4tBv20PR-006y5q; Sun, 14
 May 2023 02:09:10 +0200
Message-ID: <383c0cb0-d47e-1e32-01f8-8eb4a9f4ceb1@gmx.de>
Date:   Sun, 14 May 2023 02:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Regression with kernel 6.3 "kernel BUG at
 include/linux/swapops.h:472!"
Content-Language: en-US
To:     David Hildenbrand <david@redhat.com>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Cc:     linux-parisc@vger.kernel.org
References: <1683740497@msgid.manchmal.in-ulm.de>
 <8889a75f-1a81-905e-8bc4-a733de32985f@gmx.de>
 <1683825030@msgid.manchmal.in-ulm.de>
 <85aef102-8407-68c7-2dc2-87e5a866906b@gmx.de>
 <1683928214@msgid.manchmal.in-ulm.de> <ZF9+OYqQS/vy7Oq5@p100>
 <8d23bbd1-adcb-d52e-791b-42faae04c14e@redhat.com>
 <0ae03822-01ee-cd57-ac33-7d9df6774bd7@gmx.de>
 <aa47c2f2-2bee-6f73-9987-cd1800433a39@redhat.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <aa47c2f2-2bee-6f73-9987-cd1800433a39@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GHG1mGJhNz69JzvF4SxDoh8vHLq78+GKcjmHFR7HJZEzoLtzqFq
 VVYGv7BvbAs14RWCi9kfDJ5sDisbo4pDHjFNZqS7hWJuGDBsicLBRkGa8QMCbvDEkO762gX
 5N1B2C1oDJi924abwK8wJGdyePtm4dVzIzCNk7rEarnkM4bAN+vGEuNWelv/HVXK6pu+VdJ
 7bNgfD9shBf96KJZVzunw==
UI-OutboundReport: notjunk:1;M01:P0:Kl7QiLmAsNw=;+u7sXN7Dapul3GgFrmlwLZn/UlH
 TaWli4jCRw/8+oLfebc/kIIKCP3D1gXmJWkinRhdQys9YF5bGLSt2THJusSJneTXHwQCJYG9A
 eQARmKBLlZFDKUyWlmYocCorV8YIz8toXEwmZhCTrmMonTJStvTRCUmOJ3HJG702zhbCfWwN1
 eIpYb/RHtctnw90uynBHjcffDBP+rqDAcfhB4Ox7wm1f+1zdxNcp9hcpWeJeDwW4g+iCqlnBt
 aWNFqRp5G03Yxbc7FJF5XohotObye8zLAMJlQ22xNWnPZuVQJ0KrkXPCfd0Nrsz7GeJBnF5ZV
 z9T3xgOW1hyY7e6Yu8qcj9z/ZSraijV5xHAY1dWu6JfxLLHA9oPKgVvo3OsUM7wbX5pTG3Bio
 WwCZ4ft3QCRdVeE1b5AIlvsj9EGiRe64OPWKliIDwozqz/3/Q1s8SHMPlxLo1PsutQTniZ0//
 rV+eU097BUSUfnXD3BGe/orgwyQN/fUMrBDlvtSUbmJGIXzSbWNKjCZv9L/4Lp4XUB7g3gZQE
 Rr7iahegTooZ5vMFR4kVCfoNELhP4k1o6lUrH1SAh8f2KH4N+PdYKO7fhAOWnV/HNew/CZz/m
 khwAfItwiFJduMoUoKZCJZ9eC/uHLu/n1SoicgAiawr9j5E/L06eZQfVyeN8khVa6GIH5WpYy
 ORzAW41IjYJyN7BlAUV7hSM4iLQ0AhxVOMe3pb6qn5HSx+8WESZMxoweb74a3PjYSWtZ+lvrI
 uU9Sr2pHWkO4VxXNjagp08mvZ9JLjaRcpiaREfQjadK2m3SlZKWmLzJI5lw57S+bKvw8aZy80
 Su+POgGNMjO2nttP0OPh7I1wgaeAk2fGVkvn9S5flsuXTg53PQx5CdF6Wy0iyy/eti5chskbO
 Mq1TvvJfJ74iA8cywX5qV7WqBkGXwcLcdbd1fdVJ5Ob57u3f3WHk1M+obM4i+6i4/1q/0PBiv
 YmD3pg==
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/14/23 01:32, David Hildenbrand wrote:
>>>
>>> This fix makes it work like the layout I documented.
>>
>> Yes, and your layout looks good for me.
>
> Good :)
>
>>
>>> What I originally tried doing was reusing one of the spare bits instea=
d of reworking
>>> the layout. Apparently, I got the old layout wrong. :(
>>
>> Don't worry! Your patch harmonizes parisc to the other platforms, which=
 is good.
>>
>>> So if I understood the layout right this time, maybe we can just use o=
ne of the two
>>> spare bits: _PAGE_HUGE (or alternatively, _PAGE_DIRTY_BIT)?
>>
>> Yes, or keep what you suggested.
>>
>> What I don't understand yet is the original code:
>> #define __swp_type(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (=
(x).val & 0x1f)
>> #define __swp_offset(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ( (((x).val >=
> 6) &=C2=A0 0x7) | \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (((x).val >> 8) & ~0x7) )
>> #define __swp_entry(type, offset)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((swp_entry_t) { (type) | \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((offset &=C2=A0=
 0x7) << 6) | \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((offset & ~0x7)=
 << 8) })
>>
>> Don't we loose one of the offset bits?
>
> Let's assume we have the offset 0xff. Encoding it with type 0 would be
>
> ((0xff & 0x7) << 6) | ((0xff & ~0x7) << 8)
> -> (0x7 << 6) | (0xf8 << 8)
> -> 0x1c0 | 0xf800
> -> 0xf9c0
>
> Extracting the offset:
>
> ((0xf9c0 >> 6) & 0x7) | ((0xf9c0 >> 8) & ~0x7)
> -> (0x3e7 & 0x7) | (0xf9 & ~0x7)
> -> 0x7 | 0xf8
> -> 0xff
>
> I think it's correct.

Yes. Seems good.

> The confusing part (that resulted in the BUG here) is that we end up was=
ting bit #26, because there is a spare bit between the type and the offset=
.
>
> Maybe a relic from the past -- or copy-and-paste, because some archs sup=
ported types with > 5 bits, but core-MM only ever uses 5 bits.

Hard to say. It has been as such since a long time....

>> Mask 0x7 is 3 bits, but we shift by 6 and 8 (=3D2 bits difference), so =
I believe the second shift should be 9.
>> If it would be 9, then no &0x07 is needed and only one shift would be s=
ufficient.
>>
>> I don't know much in the swap pte area, but isn't the previous original=
 code wrong?
>> Which bits of the swp_entry are used where?
> I think the old code was correct. There are apparently two spare bits th=
at we can use. I just messed up the old layout, thinking there is only one=
.
>
> So we can either use the new layout I documented (with the fix you propo=
se), or use another layout.

I think I prefer the layout which you documented.

> In any case, we *gain* one more bit for the offset compared to the old l=
ayout.
>
>
> I'm more than happy to keep the new layout. Regarding your fix, maybe av=
oid the other ~0x7 as well by using similar shifting in __swp_entry()
>
>
>  =C2=A0#define __swp_entry(type, offset)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ((swp_entry_t) { \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((type) & 0x1f) | \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((of=
fset &=C2=A0 0x7) << 5) | \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((of=
fset >> 3) << 10) })
>
> So it's easier to match to the logic/values in __swp_offset().

Yes, it's much better.
I fixed it up like this in my current git tree.

> In any case,
> Reviewed-by: David Hildenbrand <david@redhat.com>

Great. Thanks for your help & suggestions!

Helge

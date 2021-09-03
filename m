Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2729A40004A
	for <lists+linux-parisc@lfdr.de>; Fri,  3 Sep 2021 15:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbhICNNx (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 3 Sep 2021 09:13:53 -0400
Received: from mout.gmx.net ([212.227.17.20]:33883 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235264AbhICNNx (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 3 Sep 2021 09:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630674767;
        bh=+WUTw7CsKf8jHLzwJtWc7i9o0wlJRJXZq+kw7ikC9EA=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=KYiF0c0whwGhNB95fnps9TuYaAMtE4TfkCogzBKQJXkc4EqHSfTzciKjpdmx8ppqH
         qNXyFd1rWNCd/N5+vU+RyApsS76FoxBtcBoH3aM+FzPpD2zxwdyZ41q3lNm6YmyMbP
         Z5wwZfDOXRzQy9aqHdy328LNWaIxMnVO6XlC4iiE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.183.73]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KPq-1n3pXB1Nha-010Nmn; Fri, 03
 Sep 2021 15:12:47 +0200
Subject: Re: [PATCH] parisc: Drop __arch_swab16(), arch_swab24(),
 _arch_swab32() and __arch_swab64() functions
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YTHWzLrVpZV/dk8n@ls3530>
 <bbd93244-9071-3dd9-bdb3-d3f5b1809358@bell.net>
From:   Helge Deller <deller@gmx.de>
Message-ID: <2cfa60ad-8846-62a0-0d69-488cf2f4ab7d@gmx.de>
Date:   Fri, 3 Sep 2021 15:12:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bbd93244-9071-3dd9-bdb3-d3f5b1809358@bell.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OrZTHvkuY360aEcxQ46iZReKkRc9DVESDjbLvY56t6zjmQcrDWZ
 wszp1I7qmOZFll1QHZ4NfFuYl2LjSoLS8ljwNekGd3KyToxCYOfPrra9xZi0gnKU7crCm5T
 JEQmvYBcOjGs47fAhRUTxQ4rqq3L6qfLAcaIB/j/3tLyPSLMlhFm9PMOrQTejLaetMxkBbC
 AY6GjGO9/ZxM89RfWRZMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:08ra2J9cCjQ=:aT8i8RmsBhOFfMZ04xC6+w
 DUJ5ePsImK9RkGzguDm08m6FI9fmrpId6LdlTeS8wdDWV/XVKVELShkUnqPtDDqp7HLLca19l
 qEoQBtzU75vh0VVuAGBcmJYCpdcrM/uHQZFkfCT/mJP0Otc4C3Bt5BNRb7ghv545I/3n5pgoB
 zXyC+WoLTz+bsT166rOVtPKuh3FUsIw1X5CcTEzHXFHfyka9KN0brfOnE9r/9+mKSe6R4L4Q4
 OIWjlSXnMpfcHqSz6UASRcemU/b9YTq5Q9nH8v0Jt2iahTzPGlOva9uM7TSGZPNOsW/5XoLIt
 e+8CYPYmVGaWeCO58Zpqo/UH9MQo/6qMEmxBnYLxNDJhpBIqVf4FcoQlExVOY3+L284UIyHv1
 aCUCC7jzVR3hkEGrz1/1oAfVhishT2uVwUKWDuPI4piZnckhP2Et4LAJr21xe0b540SnLd77M
 r13r59/qQ41Xa4eUheNlqXvzUUOzGyuAA3TwBXbtpwEPklpaq9sVK7dRTG4Kka3BSq423PN2r
 lXTHvXMvHNzgVz8rmJvcLZHvI/SC0uYm+8mX2/bBCZeLqPmFaRWgshtvTUiOxhATxszYJxVkf
 uZCCKwjnZMV79oFc+CDkjzEpEmD4hMZf6WgCTGDtUiEHuIheOcuxvhVK8pYntQkVRa2DocPL4
 S3YwV0e/iVBBbMuHkRO/ruk6yuAZYlNmSPvBRCij4mqWVrAPHQcE5deuc8+9d6ypUG/XkHmZl
 9M/mvk5LMMD9T1zg5oxZ6yVFDNGmk2qwBlSVyANY5qnRR55GFVWlSUg1vyJMHgr4lwHbA+w22
 oZP0+jBKNYYvuI7/0ebJVLQdYcl5+b9qoHwmZ0cwigyirC1NVDTqPT2pZzSfJvLQGq9Q1cmXV
 xZxRazkUHQdXEzCaIxzis26CFrq0gs0Y5JFxMWMjVfdVZMkIvizUqP1M3AT36ULCgA5mX1SMH
 aZNm+DN6UiWYJjVD9bxG502J3UKWfWyru2scR+zxQgT1a3K0DP6qpzXZVKExog8E5IVPs3VNJ
 8rcgH2HS0JerSL1iIP3bTKQ25XeyCt0Lp69uqoRqIe4QW1381fawBxrLFvaDfFzOJuLHJQEAY
 ndV9D7Az3qFCYzqlJi9gfoC8nMUDiMKqpq8
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/3/21 2:41 PM, John David Anglin wrote:
> Hi Helge,
>
> I don't believe the compiler can implement __arch_swab64() as efficientl=
y as the inline assembly
> code.=C2=A0 The compiler doesn't know about the permh or hsh instruction=
s.

Yes, it does.

u64 test(u64 x)
{
        return swab64(x);
}

generates:

0000000000000070 <test>:
   70:   08 03 02 41     copy r3,r1
   74:   08 1e 02 43     copy sp,r3
   78:   73 c1 00 88     std,ma r1,40(sp)
   7c:   fb 5a 69 1f     permh,3210 r26,r31
   80:   f8 1f 8a 1c     hshl r31,8,ret0
   84:   fb e0 ca 1f     hshr,u r31,8,r31
   88:   0b fc 02 5c     or ret0,r31,ret0
   8c:   34 7e 00 80     ldo 40(r3),sp
   90:   e8 40 d0 00     bve (rp)
   94:   53 c3 3f 8d     ldd,mb -40(sp),r3


Helge

>
> Dave
>
> On 2021-09-03 4:03 a.m., Helge Deller wrote:
>> No need to keep those as inline assembly functions, the compiler now
>> generates the same or even better optimized code.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/include/uapi/asm/swab.h b/arch/parisc/include/=
uapi/asm/swab.h
>> deleted file mode 100644
>> index 35fb2d1bfbbd..000000000000
>> --- a/arch/parisc/include/uapi/asm/swab.h
>> +++ /dev/null
>> @@ -1,68 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> -#ifndef _PARISC_SWAB_H
>> -#define _PARISC_SWAB_H
>> -
>> -#include <asm/bitsperlong.h>
>> -#include <linux/types.h>
>> -#include <linux/compiler.h>
>> -
>> -#define __SWAB_64_THRU_32__
>> -
>> -static inline __attribute_const__ __u16 __arch_swab16(__u16 x)
>> -{
>> -	__asm__("dep %0, 15, 8, %0\n\t"		/* deposit 00ab -> 0bab */
>> -		"shd %%r0, %0, 8, %0"		/* shift 000000ab -> 00ba */
>> -		: "=3Dr" (x)
>> -		: "0" (x));
>> -	return x;
>> -}
>> -#define __arch_swab16 __arch_swab16
>> -
>> -static inline __attribute_const__ __u32 __arch_swab24(__u32 x)
>> -{
>> -	__asm__("shd %0, %0, 8, %0\n\t"		/* shift xabcxabc -> cxab */
>> -		"dep %0, 15, 8, %0\n\t"		/* deposit cxab -> cbab */
>> -		"shd %%r0, %0, 8, %0"		/* shift 0000cbab -> 0cba */
>> -		: "=3Dr" (x)
>> -		: "0" (x));
>> -	return x;
>> -}
>> -
>> -static inline __attribute_const__ __u32 __arch_swab32(__u32 x)
>> -{
>> -	unsigned int temp;
>> -	__asm__("shd %0, %0, 16, %1\n\t"	/* shift abcdabcd -> cdab */
>> -		"dep %1, 15, 8, %1\n\t"		/* deposit cdab -> cbab */
>> -		"shd %0, %1, 8, %0"		/* shift abcdcbab -> dcba */
>> -		: "=3Dr" (x), "=3D&r" (temp)
>> -		: "0" (x));
>> -	return x;
>> -}
>> -#define __arch_swab32 __arch_swab32
>> -
>> -#if __BITS_PER_LONG > 32
>> -/*
>> -** From "PA-RISC 2.0 Architecture", HP Professional Books.
>> -** See Appendix I page 8 , "Endian Byte Swapping".
>> -**
>> -** Pretty cool algorithm: (* =3D=3D zero'd bits)
>> -**      PERMH   01234567 -> 67452301 into %0
>> -**      HSHL    67452301 -> 7*5*3*1* into %1
>> -**      HSHR    67452301 -> *6*4*2*0 into %0
>> -**      OR      %0 | %1  -> 76543210 into %0 (all done!)
>> -*/
>> -static inline __attribute_const__ __u64 __arch_swab64(__u64 x)
>> -{
>> -	__u64 temp;
>> -	__asm__("permh,3210 %0, %0\n\t"
>> -		"hshl %0, 8, %1\n\t"
>> -		"hshr,u %0, 8, %0\n\t"
>> -		"or %1, %0, %0"
>> -		: "=3Dr" (x), "=3D&r" (temp)
>> -		: "0" (x));
>> -	return x;
>> -}
>> -#define __arch_swab64 __arch_swab64
>> -#endif /* __BITS_PER_LONG > 32 */
>> -
>> -#endif /* _PARISC_SWAB_H */
>
>


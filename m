Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABD0444A18
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Nov 2021 22:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhKCVL5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 Nov 2021 17:11:57 -0400
Received: from mout.gmx.net ([212.227.17.20]:52791 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230070AbhKCVL4 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Nov 2021 17:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1635973752;
        bh=CLzeTBuB1nuHrtEqg0NI0aWjn3DsA1x4O1YQUctxYpI=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=B0+mowzf0/wLemSFLOpAlbp6XNaoeXrCBoOYd/dYgL5keAYWI1OKOEaw+2baYh6+Y
         DkLYuvhGB4QoU93jWqJYtGcvTTA3WZpEFr2dsiwU26nneD3iP2g1q2KliznGG2isCD
         LG5ui9hiwyRgEJmN16/Br9T4r9treuXAUH9zMBTg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.181.103]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9g4-1myoxo1Kvc-00GaEs; Wed, 03
 Nov 2021 22:09:12 +0100
Message-ID: <cf2c5fa8-5b98-50b7-00ef-0e86df918e8e@gmx.de>
Date:   Wed, 3 Nov 2021 22:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] parisc: Fix code/instruction patching on PA1.x machines
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Sven Schnelle <svens@stackframe.org>
References: <YX8HK7ZZZhjRQzcr@ls3530>
 <91b3d125-18ae-e10f-3000-1b17a43a156f@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <91b3d125-18ae-e10f-3000-1b17a43a156f@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f9QhPMbhrTTOuXzc+14HQ4rJRhtdQ52wNOQTlBZsikoMhTaDGvK
 eVTJ3+i9smoZFUt1FB6MvwHPPV6pbkxNxbFebA3ncJR8uIMKdicJiJA/yGgMIFYffBh82yE
 3GF47deJu2c5jfWPjlqsY4+9eLcQdojqxxI2QnvBkldiZubYumTgH4D/upJpJqtGtNbOGIR
 0Mie8qjzSoI1F7E3bjazQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gMT6f6YEwAQ=:w5z4Gc/qeRx46u956yl9Wj
 fNfPn9+bxXXuH8+YeO989R07Bl6kQhwosjuzO5nbTdhRFdjqGzkkxj4CigF8aXJJXtWWHZQQp
 CIeornlQq7bMMQiw/kPpVsLR8Otu7T20w3zq1PHsd/djnR6b21b+0u7IkePWYTsSwh7FQN/Zg
 6ySWf8aC6pGoq12JvCnHlzI6KWoCgiId0vuMSz8YSrG4t937eFeTosNuwN1mbHsIOgbF34k/n
 DzPqUrRCqBLBkJsa2xdFGUrXdtTEuqKvUP0p4ZA8WQykd5ILLWwl5/hYwAk52HGsHNAdbwQl3
 5O5Z4LjuI080r9rnZvQhipWWjUcAtx671+hLRLIT8YN3vHGB/yVLw9kbSonUKxpRe8xaJzBP4
 QrNTh6a8jjUARRgBe5kUY0kOIVnpJaRsPfnwdGBeibM4bYQEAGYRJG1r2jUK0aIQzbyUk/J3x
 SDbkVrxaD5roLA1Sq1/HoFR+keeXG3DRn2a5yldTMjuBkRqEoxckKhpgy7FH9UMU8r/oeQNL5
 XBIwoKAKx+nF+m2QLFqo2rUW+Be42Tu3HQLr6cx9y19xSUt2ckDJSXS2BPNGYKoMu+wJPOLu+
 NieZtvW8/B3LdBOqJTkBj0jcK17UDGTzC9okWQl+tDUguw6EJJOebcWbN/WuR3wiRMcpZNbY4
 TDilmrd4iIrXxqkwFtta+eJIzgymZcQ0O5IwUrmH7T4E/JfkKV6GWtdOJxMsU+HXS6sbqhIw/
 Qi+X38nkHqOi5p37IySEiPpFOSGuSyARo/XBkQMUuGi2xKv0N5VIqUhHf/uyWTMUTJ9U16WIv
 QkIP53We/HeShR3KYkLjBQPih3YDpM5E6JmobrCHZgEiNbmQXhRoDEyIYokq5u1+9kt/JnHC4
 6LQwj8qDEuS4IP/fw7varwB4DdADsM/uPECw5uIAuNZ6hcB23g2Q9DDa9sBbhAv7u9JFaXJ9J
 EFHkv13yL9gYeVQCpPeiTfYj7L0ikUxpYQUzneyfsGaf7lYVGvbD/xfsenD6Ag3J7tt+u+yiU
 7pN9Eyh/pX8gXnG0Ug3oefH/cnhedW2dop1WkAhDk7lJB5q3a73ZazPhjH8YI4GBO/59sLBgQ
 ppKHESqyE1yg3k=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Dave,

On 11/3/21 21:12, John David Anglin wrote:
> I think the real problem is that neither flush_kernel_vmap_range() or
> invalidate_kernel_vmap_range() flush the icache.  They only operate
> on the data cache. flush_icache_range will flush both caches.
Yes.
But we write the new instructions to a congruently memory are (same
physical memory like the kernel code), then flush/invalidate the
D-Cache, and finally flush the I-cache of kernel code memory.
See last function call of __patch_text_multiple().

So, logically I think it should work (and it does on PA2.x).

Or do you mean to flush the I-Cache of both mappings?

Helge


>
> Dave
>
> On 2021-10-31 5:14 p.m., Helge Deller wrote:
>> On PA1.x machines it's not sufficient to just flush the data and
>> instruction caches when we have written new instruction codes into the
>> parallel mapped memory segment, but we really need to invalidate (purge=
)
>> the cache too. Otherwise the processor will still execute the old
>> instructions which are still in the data/instruction cache.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Fixes: 4e87ace902cf ("parisc: add support for patching multiple words")
>> Cc: stable@vger.kernel.org # v5.3+
>>
>> diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
>> index 80a0ab372802..8cbb7e1d5a2b 100644
>> --- a/arch/parisc/kernel/patch.c
>> +++ b/arch/parisc/kernel/patch.c
>> @@ -81,7 +81,7 @@ void __kprobes __patch_text_multiple(void *addr, u32 =
*insn, unsigned int len)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * We're crossing a page boundary, so
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * need to remap
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flu=
sh_kernel_vmap_range((void *)fixmap,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inv=
alidate_kernel_vmap_range((void *)fixmap,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (p-fixmap) * sizeof(*p));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (mapped)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch_unmap(FIX_TEXT_POKE0, &flags);
>> @@ -90,9 +90,10 @@ void __kprobes __patch_text_multiple(void *addr, u32=
 *insn, unsigned int len)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> -=C2=A0=C2=A0=C2=A0 flush_kernel_vmap_range((void *)fixmap, (p-fixmap) =
* sizeof(*p));
>> +=C2=A0=C2=A0=C2=A0 invalidate_kernel_vmap_range((void *)fixmap, (p-fix=
map) * sizeof(*p));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mapped)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch_unmap(FIX_=
TEXT_POKE0, &flags);
>> +=C2=A0=C2=A0=C2=A0 invalidate_kernel_vmap_range((void *)start, end - s=
tart);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flush_icache_range(start, end);

^^  HERE


>> =C2=A0 }
>>
>
>


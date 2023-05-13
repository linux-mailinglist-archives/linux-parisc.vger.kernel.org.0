Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7DAC70178F
	for <lists+linux-parisc@lfdr.de>; Sat, 13 May 2023 15:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238477AbjEMN6Y (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 13 May 2023 09:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbjEMN6Y (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 May 2023 09:58:24 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F524D8
        for <linux-parisc@vger.kernel.org>; Sat, 13 May 2023 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1683986298; i=deller@gmx.de;
        bh=4Zf/QKNyCaAchV794cWHrfS6Ou2s3dlMV1vdVr/Ruk0=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=KliE8op/DVMcQaoOC2/yx5HbtbHYHS56+BzLUtfvmd6CrDpmH1mgJt0VhGHl1sI5L
         zArvEHJezC2hVXDP9+91XZl6KNweF8huDzfWbwCEooVq+sMsIII5jTYy10FKt37L9H
         TzSxa46Ow/b1m9KlCRcJ4V84E1QeO0WYaXsGrjlHT3r9daxKnHTxeAP73NTlnEQwQK
         2ZaTiTQe6YO/Z8Jgo3dk1snZ2CnEM4vTPZmbSkSYw4chCf3XA+E3i8gB7pQqIin0+m
         bNI8a1iCkHRQ6w9MfuQTP6KNMPhQR9Pyjsmetg+IWf8avIpRRH3MTUUQQYbw6Hx7Pw
         9aOF4T3TaKAVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.158.250]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KPg-1qNe6V48WY-010KDC; Sat, 13
 May 2023 15:58:18 +0200
Message-ID: <0ae03822-01ee-cd57-ac33-7d9df6774bd7@gmx.de>
Date:   Sat, 13 May 2023 15:58:17 +0200
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
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <8d23bbd1-adcb-d52e-791b-42faae04c14e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b8lYXwEIdnCcB4Rp/n/NMMOWbTG6tI/aaFVnS2zAgT5wEXZXTjO
 rvf0zLglrxhu+q0ep1Y66Ke0UFZVT+WUGQjyf5jo5g0+fnySCVIk8DDMlqKy5sp7ALdQAQj
 Tp0GWjwCiYfk41dGoEBb0oDnA9McTHaoN1pItvPdtpXmQoM0Pwzvr0husb+fVEamtvxCwte
 3F0Ti/iYBTifire/tYYNw==
UI-OutboundReport: notjunk:1;M01:P0:PdQAATrpuKU=;WnILy/LIlOdoFXp3svr8zwJDLot
 Cx3HoAUe9JboQbK4PmaTi4kYYL/oCryGBy47hefzrdrt1Ek2yqTKlR7XB4AYSZBK564drcoUU
 YL85FLJd4cJryH6BA36OgsBEksGt/7XCw+L92yW8AA//+PqKXecBoOLNM3DtDxvUgck+0kQ2r
 pBlIuoSfaxa1ftTN8Xoovu2ufL3aaiw3jKIs2BdFZy4f7dRBPg0r65Us4nX25nQwAM9wgAQgy
 HZZ8wKEWC+nqouI1XHRRzFgqrA1nBb1IG3sm7mD65NK5EOcEllBnz21H785aFsI5OO8e+jpRJ
 WWU74Oj0sZ+JK1ZKE+XHmluk3sFjbOG2YoRXisDvkis6T3lSQz9AezObYKO+aU0/SAATisnlV
 x0veveZ97F8Lh8gtKGUDjIs4ZqVcM427yg0bGZsCe4tsi32JOQNmqv3tMCaKhL7bGnasP/Tbj
 nAQbPWdVP3JmWXP1Mja3i5ypd+pJs6sTGYZgq2sI5Eixf1rbVLGVfUitxUm7+Jc8Tik+Bt61u
 0C/BVH1BHY6uFPmRJiBzjVcQpJCbEqlrOAgIWYF3VcdmZ2OwhrNiqD2eiSjBMl+Aag98x+UST
 TA/XvZlTGyDfqb88ZWTdTJDZvWh1CnkIFlgSf6dY2x/YuUEDnXJ5xJNKFvE6UB2jNvcsHY6Yy
 1RNLtmRvCO6hCPPokYx7TtZmzwmiA76EE1JFFN+ebM+5I8A/TOyuk3Lx5U6M8MDQ7nadH9ldr
 qxIH4MZWTNM0tDb1nRZ3cawVWF1Q4teX0ulwzM0zvfBLC7VDBCjiNZFB/OS+MLnrQBp9izyeR
 6+QB67y1CpO2iGUAYguSj6/ExcRUChuBJPxYWf3wsgedBULcCRWhojCm2VvRpj2FVW2KxSHvV
 USEQ8ZUVcAu5xnZ+EzeD/Gj6v1KlX0yg2HGEQClipC3tp7n+ne0lJT7CPhBWI6RxgqpTFZQb4
 ZcXT8A==
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/13/23 15:21, David Hildenbrand wrote:
>> Yes, makes sense.
>>
>>> [1] Total is 1 Gbyte, and running
>>> =C2=A0=C2=A0=C2=A0=C2=A0 | dd if=3D/dev/zero bs=3D896M count=3D1 | pv =
--rate-limit=3D1k >/dev/null
>>> =C2=A0=C2=A0=C2=A0=C2=A0 might not be the best style but does the tric=
k: Wait for pv to
>>> =C2=A0=C2=A0=C2=A0=C2=A0 count up to a minute, then ^C it. If the host=
 is still okay after
>>> =C2=A0=C2=A0=C2=A0=C2=A0 that, it's considered "good".
>>
>> Thanks for bisecting and coming up with a testcase!
>> The attached patch survives for me on my C3000 with 2GB RAM with this t=
est:
>> =C2=A0=C2=A0=C2=A0=C2=A0dd if=3D/dev/zero bs=3D1896M count=3D1 | pv
>> (well, the OOM-killer might jump in, but even that is survived).
>>
>> Could you try the patch below?
>
> Thanks for debugging! :)
>>
>> [PATCH] parisc: Fix encoding of swp_entry due to added SWP_EXCLUSIVE fl=
ag
>>
>> Fix the __swp_offset() and __swp_entry() macros due to commit 6d239fc78=
c0b
>> ("parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE") which introduced t=
he
>> SWP_EXCLUSIVE flag by reusing the _PAGE_ACCESSED flag.
>>
>> Reported-by: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
>> Fixes: 6d239fc78c0b ("parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE"=
)
>>
>> diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/as=
m/pgtable.h
>> index e2950f5db7c9..522846be54b7 100644
>> --- a/arch/parisc/include/asm/pgtable.h
>> +++ b/arch/parisc/include/asm/pgtable.h
>> @@ -413,12 +413,12 @@ extern void paging_init (void);
>> =C2=A0=C2=A0 *=C2=A0=C2=A0 For the 64bit version, the offset is extende=
d by 32bit.
>> =C2=A0=C2=A0 */
>> =C2=A0 #define __swp_type(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ((x).val & 0x1f)
>> -#define __swp_offset(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ( (((x).va=
l >> 6) &=C2=A0 0x7) | \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (((x).val >> 8) =
& ~0x7) )
>> +#define __swp_offset(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ( (((x).va=
l >> 5) &=C2=A0 0x7) | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (((x).val >> 10)=
 << 3) )
>> =C2=A0 #define __swp_entry(type, offset)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ((swp_entry_t) { \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ((type) & 0x1f) | \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((of=
fset &=C2=A0 0x7) << 6) | \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((of=
fset & ~0x7) << 8) })
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((of=
fset &=C2=A0 0x7) << 5) | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((of=
fset & ~0x7) << 7) })
>> =C2=A0 #define __pte_to_swp_entry(pte)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ((swp_entry_t) { pte_val(pte) })
>> =C2=A0 #define __swp_entry_to_pte(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ((pte_t) { (x).val })
>
> This fix makes it work like the layout I documented.

Yes, and your layout looks good for me.

> What I originally tried doing was reusing one of the spare bits instead =
of reworking
> the layout. Apparently, I got the old layout wrong. :(

Don't worry! Your patch harmonizes parisc to the other platforms, which is=
 good.

> So if I understood the layout right this time, maybe we can just use one=
 of the two
> spare bits: _PAGE_HUGE (or alternatively, _PAGE_DIRTY_BIT)?

Yes, or keep what you suggested.

What I don't understand yet is the original code:
#define __swp_type(x)                     ((x).val & 0x1f)
#define __swp_offset(x)                   ( (((x).val >> 6) &  0x7) | \
                                           (((x).val >> 8) & ~0x7) )
#define __swp_entry(type, offset)         ((swp_entry_t) { (type) | \
                                             ((offset &  0x7) << 6) | \
                                             ((offset & ~0x7) << 8) })

Don't we loose one of the offset bits?
Mask 0x7 is 3 bits, but we shift by 6 and 8 (=3D2 bits difference), so I b=
elieve the second shift should be 9.
If it would be 9, then no &0x07 is needed and only one shift would be suff=
icient.

I don't know much in the swap pte area, but isn't the previous original co=
de wrong?
Which bits of the swp_entry are used where?

Helge

> diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm=
/pgtable.h
> index e2950f5db7c9..ee9f08cd5938 100644
> --- a/arch/parisc/include/asm/pgtable.h
> +++ b/arch/parisc/include/asm/pgtable.h
> @@ -218,8 +218,8 @@ extern void __update_cache(pte_t pte);
>  =C2=A0#define _PAGE_KERNEL_RWX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (_PA=
GE_KERNEL_EXEC | _PAGE_WRITE)
>  =C2=A0#define _PAGE_KERNEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (_PAGE_KERNEL_RO | _PAGE_WRITE)
>
> -/* We borrow bit 23 to store the exclusive marker in swap PTEs. */
> -#define _PAGE_SWP_EXCLUSIVE=C2=A0=C2=A0=C2=A0 _PAGE_ACCESSED
> +/* We borrow bit 21 to store the exclusive marker in swap PTEs. */
> +#define _PAGE_SWP_EXCLUSIVE=C2=A0=C2=A0=C2=A0 _PAGE_HUGE
>
>  =C2=A0/* The pgd/pmd contains a ptr (in phys addr space); since all pgd=
s/pmds
>  =C2=A0 * are page-aligned, we don't care about the PAGE_OFFSET bits, ex=
cept
> @@ -405,7 +405,7 @@ extern void paging_init (void);
>  =C2=A0 *
>  =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3
>  =C2=A0 *=C2=A0=C2=A0 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 =
5 6 7 8 9 0 1
> - *=C2=A0=C2=A0 <---------------- offset -----------------> P E <ofs> < =
type ->
> + *=C2=A0=C2=A0 <---------------- offset ---------------> E P <ofs> 0 < =
type ->
>  =C2=A0 *
>  =C2=A0 *=C2=A0=C2=A0 E is the exclusive marker that is not stored in sw=
ap entries.
>  =C2=A0 *=C2=A0=C2=A0 _PAGE_PRESENT (P) must be 0.
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 110a36479dce..7510db355f48 100644
>
>


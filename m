Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32B45ED8E9
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Sep 2022 11:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbiI1J0Q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 28 Sep 2022 05:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbiI1JZq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Sep 2022 05:25:46 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A512813FBF
        for <linux-parisc@vger.kernel.org>; Wed, 28 Sep 2022 02:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664357123;
        bh=9hgewmOR//8cvQSjRO9O/RLCoFLji1UtrneI5MEQSIY=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=JmcOb6Yb64lIBUfZIVzMlGZnhIG12ql0TbUTVv9DmVWYhCJd/n6vgEvdtRZnm9mgC
         NUwWy+3/vi1OFT/g/UIX1gM9AmscwVSS0pfFHzypjhcZsDdQnLLBCHx9ihOs+oS9iK
         EeQoeAAYbftgGNwLuq8BVDCmi10js3iT8jCkYB94=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.180.135]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89L1-1oZsQ5414t-005I8L; Wed, 28
 Sep 2022 11:25:23 +0200
Message-ID: <80d82836-5078-5345-8567-091d8da81157@gmx.de>
Date:   Wed, 28 Sep 2022 11:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on PA2.0 machines
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YzCkkyktEZFM0svQ@p100>
 <1063fc54-738a-a1b9-fb53-8202287805c7@bell.net>
 <1de28183-2252-04dc-9838-d695161a01ed@gmx.de>
 <5f476a72-d2c0-8b0e-2446-13456a92e0bf@bell.net>
 <efb7b1fa-f593-3c52-c8b2-cd42c2594848@gmx.de>
 <8a3451ca-cd30-4730-b7b2-bce7fdc47682@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <8a3451ca-cd30-4730-b7b2-bce7fdc47682@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zYoy8byjAGEnsfwx0oC2eJjTt6zY6XNgwe1/da/4+lwiOx6FIC7
 hj5FnyZUW6cHOa9CdqSLOmfScyYI3dxF5XiBmeKJP6UvmFzs/Z1fiNuRoovSmIjllb1+DWv
 ujPWZTOlvFATnPgF8XIsgsUi7AqAwvNRZKRA7oSxYQJ6e26FVtZofoi9R4lo3sxibsH2/Vq
 lTriUhXegNCdORsEICBpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I+FTWkvGtB8=:hip0iabdgylHN85n/6HwsS
 iqYBmOKIPwQ2nbuy+HI2C+h5Z936bYQo0IvJcWwplJ21gF8e0YTv+g2Zx2AJcr9cUBe7Zl1DO
 uFW5mab5WxCngsXH8kQu3zoQ06XnkQ8ZlzoARnyZD7jiyXd6mWvsvd1wiBJaNGW6JJDMSeATK
 HJIYITwKB1Etnshk5HPTm7eLtPYIh0pGu1htSyBlA2bEeVioFfht8s4NeqPC3kwi0HPMk1OBC
 KWmwbouWExS4mD5TG8JqLmA7l5mcB1sIKyBVKedJrCwH8Ne7gLrvCuNyhgMMfVaAcBtaZ5tH2
 CmyCCJhLXzjQiftFUJKulx6AkodBPXh7XFNNRfhfxXOp5TTkGxG+RdJIojiY7ucKos4ZM0zA2
 EJNRSZrZaVasBROoM1wcw4TS/QT8wenRPD6r7g85UA2vtzD59hFLUgm9QjM6xwhbNSTb7wu+o
 jxr1XRb08ZXrDQZUkjK10eRiVLco8L8L6QaGaSjGprZotlAgPzTlR7JAfN/y1EkQe6FTTllM8
 hoS/I61YBV+/CsVOYfmvfLBZy8N3GhFd20lS6iom3Y13DcNm6jdEukfsCFhKfO4DvtIJT5Daa
 dwXQ+JOHMVJZg16P7tR4c7elozB1jBQEqxtqGH/Q5uYprXtJc9LohIZd2GT8YDCVIH687jJxn
 YDVNrnCsXEZYb6Qoq45chP177DTCcUYBAQIzYswfVEzVRSKEO4O9sMG63h46bXngbzPNHNX9O
 1/R1aBcTCbNLo95zp7y5CUzaWAqPbrLFvM1piWyZp/C/B9KRui3NCQ/mlbPkuBjNNJxnZTBDX
 62KeI5s34lRVhH1dKk1uVUnZMzayzlEkzp1SDI36AkbxjFwcN01ZYDjXyj2zi2dGSzAHjyCAF
 WnN9BoTL/M8so+bBwYA+Lgy1Xn4VCcRJjRoY6dYo9LqR/fw6jjr/Ku+zdQk5IK6gdoxFQJwS6
 n24/NOT4bX3XOFJlODsSPvGu2neKjRmRFwyRfytzabQ0MsZ7flV7HW5CjVmQ3Vsm57RkWyE6w
 B/ys8Rrc/d8SH91trt1mVgDFmazCV8ETQxkDwx699daeRELd0w9gQccidgibRSkb+au9PmR4h
 OAQIdK3n1jn+B5ZlpgDobBG5ImDmXHrIlrWbvTW10TI+6mBLf948WXlPVtVzeEp0aykcqAcrl
 87G8M=
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_ZBI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/28/22 00:06, John David Anglin wrote:
> On 2022-09-27 4:06 p.m., Helge Deller wrote:
>> On 9/25/22 22:28, John David Anglin wrote:
>>> On 2022-09-25 4:11 p.m., Helge Deller wrote:
>>>> n=C2=A09/25/22=C2=A022:02,=C2=A0John=C2=A0David=C2=A0Anglin=C2=A0wrot=
e:
>>>>> On=C2=A02022-09-25=C2=A02:57=C2=A0p.m.,=C2=A0Helge=C2=A0Deller=C2=A0=
wrote:
>>>>>> +#ifdef=C2=A0CONFIG_PA20
>>>>>> +#define=C2=A0ALT_COND_PACACHE=C2=A0=C2=A0=C2=A0=C2=A0ALT_COND_ALWA=
YS
>>>>>> +#else
>>>>>> +#define=C2=A0ALT_COND_PACACHE=C2=A0=C2=A0=C2=A0=C2=A0ALT_COND_NO_S=
MP
>>>>>> +#endif
>>>>>> +
>>>>>> =C2=A0=C2=A0ENTRY_CFI(flush_tlb_all_local)
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*=C2=A0The=C2=A0pitlbe=C2=
=A0and=C2=A0pdtlbe=C2=A0instructions=C2=A0should=C2=A0only=C2=A0be=C2=A0us=
ed=C2=A0to
>>>>>> @@=C2=A0-539,15=C2=A0+545,10=C2=A0@@=C2=A0ENTRY_CFI(copy_user_page_=
asm)
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*=C2=A0Purge=C2=A0any=C2=A0old=
=C2=A0translations=C2=A0*/
>>>>>>
>>>>>> -#ifdef=C2=A0CONFIG_PA20
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0pdtlb,l=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0%r0(%r28)
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0pdtlb,l=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0%r0(%r29)
>>>>>> -#else
>>>>>> =C2=A0=C2=A00:=C2=A0=C2=A0=C2=A0=C2=A0pdtlb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0%r0(%r28)
>>>>>> =C2=A0=C2=A01:=C2=A0=C2=A0=C2=A0=C2=A0pdtlb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0%r0(%r29)
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0ALTERNATIVE(0b,=C2=A00b+4,=C2=A0ALT_COND_N=
O_SMP,=C2=A0INSN_PxTLB)
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0ALTERNATIVE(1b,=C2=A01b+4,=C2=A0ALT_COND_N=
O_SMP,=C2=A0INSN_PxTLB)
>>>>>> -#endif
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0ALTERNATIVE(0b,=C2=A00b+4,=C2=A0ALT_COND_P=
ACACHE,=C2=A0INSN_PxTLB)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0ALTERNATIVE(1b,=C2=A01b+4,=C2=A0ALT_COND_P=
ACACHE,=C2=A0INSN_PxTLB)
>>>>> This=C2=A0doesn't=C2=A0look=C2=A0correct.=C2=A0=C2=A0If=C2=A0ALT_CON=
D_PACACHE=C2=A0is=C2=A0defined=C2=A0as=C2=A0ALT_COND_NO_SMP,=C2=A0the=C2=
=A0pdtlb
>>>>> instructions=C2=A0will=C2=A0be=C2=A0converted=C2=A0to=C2=A0pdtlb,l=
=C2=A0instructions=C2=A0when=C2=A0running=C2=A0UP.=C2=A0=C2=A0These=C2=A0a=
re=C2=A0not=C2=A0supported
>>>>> on PA 1.1.
>>>>
>>>> Your=C2=A0concern=C2=A0is=C2=A0correct,=C2=A0but=C2=A0there=C2=A0is=
=C2=A0an=C2=A0additonal=C2=A0check=C2=A0in=C2=A0the=C2=A0alternative-codin=
g,
>>>> which=C2=A0prevents=C2=A0enabling=C2=A0the=C2=A0local=C2=A0flag=C2=A0=
if=C2=A0we're=C2=A0not=C2=A0running=C2=A0on=C2=A0a=C2=A0PA2.0=C2=A0CPU.
>>>> So,=C2=A0those=C2=A0ALTERNATIVE()=C2=A0macros=C2=A0will=C2=A0only=C2=
=A0apply=C2=A0on=C2=A0PA2.0=C2=A0machines.
>>> You are correct.=C2=A0 Missed that.
>>>
>>> That only leaves the bus serialization issue when pdtlb is used on an =
SMP machine.
>>
>> I think we are Ok with what's in the kernel already.
>>
>> According to arch/parisc/include/asm/pgtable.h:
>>
>> * This is for the serialization of PxTLB broadcasts. At least on the N =
class
>> =C2=A0* systems, only one PxTLB inter processor broadcast can be active=
 at any one
>> =C2=A0* time on the Merced bus. */
>> extern spinlock_t pa_tlb_flush_lock;
>> #if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
>> extern int pa_serialize_tlb_flushes;
>> #else
>> #define pa_serialize_tlb_flushes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (0)
>> #endif
>>
>> we currently do TLB serialization on 64-bit machines with a 64-bit kern=
el only.
>> N-class machines are 64-bit-only machines which can't run a 32-bit kern=
el.
>> So, 32-bit SMP kernels (which don't have serialization for PxTLB flushe=
s)
>> don't seem to be affected.

> I don't know enough to be certain. I know the c8000/rp3440 with the Itan=
ium/zx1 CPU/memory
> bus needs serialization (tried removing lock).=C2=A0 I suspect all machi=
nes with Runway or Runway+
> CPU/memory buses need serialization.
> https://www.openpa.net/bus.html#runway

Yes, but those all run only 64-bit kernels.

> The openpa site says there are some PA-7200 machines (e.g., D class)=C2=
=A0 with this bus.=C2=A0 They would be 32-bit only.

I don't have PA-7x00 SMP machines, but a J5000 (https://www.openpa.net/sys=
tems/hp-visualize_j5000_j5600_j7000_j7600.html)
with Astro memory/Runway controller on which I can try the 32-bit SMP kern=
el again.

Helge

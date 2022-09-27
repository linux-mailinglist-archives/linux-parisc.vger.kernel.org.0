Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD225ECDE0
	for <lists+linux-parisc@lfdr.de>; Tue, 27 Sep 2022 22:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbiI0UId (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 27 Sep 2022 16:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232681AbiI0UIF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 27 Sep 2022 16:08:05 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734E51D983B
        for <linux-parisc@vger.kernel.org>; Tue, 27 Sep 2022 13:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664309200;
        bh=EZWiHHdEi5zCZg2gpsfHeIDMSAgMFdKAkKguxFZYlNA=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=On07nfGhWU4ZwxxxpCCj+zg/sqDlszcKPTtnHbkVicbrYZq4WvWqxFm3Ueed1FMR9
         aOWueJt16D3ZnobaFEJxbNmSrIAK/nm0pEpkiC10Ui6C9GrBaqOrF8ISeC/eQfn88F
         Yv9svxQfISYFi8uNAuCjgodYUpQ8lhOOTk4E/auQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.138.255]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mel3t-1pDQPt2Ggf-00akjv; Tue, 27
 Sep 2022 22:06:40 +0200
Message-ID: <efb7b1fa-f593-3c52-c8b2-cd42c2594848@gmx.de>
Date:   Tue, 27 Sep 2022 22:06:37 +0200
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
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <5f476a72-d2c0-8b0e-2446-13456a92e0bf@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RRKIzX1/GV7jyab6VBpDBeJ+aZPa0YpcDo9vdFExjTHjUcJHiip
 IqJj8FiX8ocxRdjrN0QUV3oEeyINlmRRyt/u2cm0+YZNBJj963w7ET+MvLuHxD6mSMcJQWD
 Ez1jB18wf8y9HDJ/pUKv6VAvR4YTNXXQQAQMHMLM9mlvv31N6V/9nx81A4rvHse5i1KjXhU
 KRKsY5B6t2LTfk2Sg8VXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0yogiM7yxVU=:uBSy3yBQ7xObQh8JPHfUF7
 tc3S+A54foYiHJUAytS3/QE/28OZs3o5q6y+rbDKpePbyEqE+m4N9FILw6Bo6lRTAE+wM/GWu
 NWcawzAlppd/BJSXlENm+iRDl+Ca62BQqwsNW32mSZT1HUadjyQpDAAMMfNdiU59p9MVciIN0
 uKrhEdjLlu9QNiTlTAM4XkthgdeWo8sxxmT5BXgyj0czgD2CPT3PbFi8o+2y+xLrR+qCta2Dj
 B9NJgZ7Npzfh4bU/NleCgnk2GlEhW/tetI50JgwIcnrGiGA7Pt/rK81dpS0DU0Ea2rq/YUvV1
 pJ9FyATvu5N6R8C/jZzcKyjXIO1dhi4mYaCybO4UKgubF8LJ9BH7mKwH4XiaMoCVCXQ1yh2nD
 byNOmedXBZSVM7V/epqJsgWO391ZGQMIF2HMrJaqkAs+uryNHkomAWgd6uA9wUjIgXkCBTPbm
 ik3+YxWFTvgFo0coMjTp95HoH87wQXQCACZNOGFOjENC0YAIwGIixzWTDFo9BwvD2yx9jMI+r
 d1FRZ41Cf0u64mVncxWWdy9F5zyOMsNUCrHDeictux2DzQgQy5A4QjcAezqE6AZXFUHm5C6g8
 rNVfCA1VuaGhhLhcAsdLheM2tl0Y9zhbfdi/rjDwR0erx4RUr+vJFjNMVCLdCpFHUVemGjDGN
 b7mMh+T88O8qYrXDL1aY2tR9DNuzSVTqB9WzNkxfN3OnRt8PkCjPTg9Spt+SPfyjXeA3Pk0An
 gWW2uNFnZbH6mbrMn3GBlyMdUNh0OG8YxsSC0yzdWq/B1kKH40b3BeYKOSfzrdvPJ1y4N37hs
 m1BVGbIS4GGNYJpUOwXCkgD0vi0UzRMGGBAk3pU8XUudw2nk1w89rqllEYVtSIhijBC4PhSlE
 tBYmmh9AbpnUZoLvCxf03gswor0V9Y/Bx572JZVfjnhRnmQm0ld1S53ngPIR4lU91LHov3f12
 v1WFRxN2rMBhmOOVRDRXLhB/t20kq6JAMWznzxgKFk1pSOvcPXmkHQSUBtqewc58+73hopl+7
 Sv9/JJQc5P2bR/gQQ55kDJdXpgXISa4eYEtB67FQ5VulKca4no2XIbQIZR1Dsf26YkyUsslY/
 4GMhQxJL7aAEaphREuas/Laepepnb4xq57gu+cOVXdO9QKpcMSPxM/qZaSJlthXgmSim4TWWf
 UUBgC/tGdCpYVNiup3DShlJyQI
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_H2,RCVD_IN_MSPIKE_ZBI,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/25/22 22:28, John David Anglin wrote:
> On 2022-09-25 4:11 p.m., Helge Deller wrote:
>> n=C2=A09/25/22=C2=A022:02,=C2=A0John=C2=A0David=C2=A0Anglin=C2=A0wrote:
>>> On=C2=A02022-09-25=C2=A02:57=C2=A0p.m.,=C2=A0Helge=C2=A0Deller=C2=A0wr=
ote:
>>>> +#ifdef=C2=A0CONFIG_PA20
>>>> +#define=C2=A0ALT_COND_PACACHE=C2=A0=C2=A0=C2=A0=C2=A0ALT_COND_ALWAYS
>>>> +#else
>>>> +#define=C2=A0ALT_COND_PACACHE=C2=A0=C2=A0=C2=A0=C2=A0ALT_COND_NO_SMP
>>>> +#endif
>>>> +
>>>> =C2=A0=C2=A0ENTRY_CFI(flush_tlb_all_local)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*=C2=A0The=C2=A0pitlbe=C2=
=A0and=C2=A0pdtlbe=C2=A0instructions=C2=A0should=C2=A0only=C2=A0be=C2=A0us=
ed=C2=A0to
>>>> @@=C2=A0-539,15=C2=A0+545,10=C2=A0@@=C2=A0ENTRY_CFI(copy_user_page_as=
m)
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*=C2=A0Purge=C2=A0any=C2=A0old=
=C2=A0translations=C2=A0*/
>>>>
>>>> -#ifdef=C2=A0CONFIG_PA20
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0pdtlb,l=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0%r0(%r28)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0pdtlb,l=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0%r0(%r29)
>>>> -#else
>>>> =C2=A0=C2=A00:=C2=A0=C2=A0=C2=A0=C2=A0pdtlb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0%r0(%r28)
>>>> =C2=A0=C2=A01:=C2=A0=C2=A0=C2=A0=C2=A0pdtlb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0%r0(%r29)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0ALTERNATIVE(0b,=C2=A00b+4,=C2=A0ALT_COND_NO_=
SMP,=C2=A0INSN_PxTLB)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0ALTERNATIVE(1b,=C2=A01b+4,=C2=A0ALT_COND_NO_=
SMP,=C2=A0INSN_PxTLB)
>>>> -#endif
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0ALTERNATIVE(0b,=C2=A00b+4,=C2=A0ALT_COND_PAC=
ACHE,=C2=A0INSN_PxTLB)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0ALTERNATIVE(1b,=C2=A01b+4,=C2=A0ALT_COND_PAC=
ACHE,=C2=A0INSN_PxTLB)
>>> This=C2=A0doesn't=C2=A0look=C2=A0correct.=C2=A0=C2=A0If=C2=A0ALT_COND_=
PACACHE=C2=A0is=C2=A0defined=C2=A0as=C2=A0ALT_COND_NO_SMP,=C2=A0the=C2=A0p=
dtlb
>>> instructions=C2=A0will=C2=A0be=C2=A0converted=C2=A0to=C2=A0pdtlb,l=C2=
=A0instructions=C2=A0when=C2=A0running=C2=A0UP.=C2=A0=C2=A0These=C2=A0are=
=C2=A0not=C2=A0supported
>>> on PA 1.1.
>>
>> Your=C2=A0concern=C2=A0is=C2=A0correct,=C2=A0but=C2=A0there=C2=A0is=C2=
=A0an=C2=A0additonal=C2=A0check=C2=A0in=C2=A0the=C2=A0alternative-coding,
>> which=C2=A0prevents=C2=A0enabling=C2=A0the=C2=A0local=C2=A0flag=C2=A0if=
=C2=A0we're=C2=A0not=C2=A0running=C2=A0on=C2=A0a=C2=A0PA2.0=C2=A0CPU.
>> So,=C2=A0those=C2=A0ALTERNATIVE()=C2=A0macros=C2=A0will=C2=A0only=C2=A0=
apply=C2=A0on=C2=A0PA2.0=C2=A0machines.
> You are correct.=C2=A0 Missed that.
>
> That only leaves the bus serialization issue when pdtlb is used on an SM=
P machine.

I think we are Ok with what's in the kernel already.

According to arch/parisc/include/asm/pgtable.h:

* This is for the serialization of PxTLB broadcasts. At least on the N cla=
ss
  * systems, only one PxTLB inter processor broadcast can be active at any=
 one
  * time on the Merced bus. */
extern spinlock_t pa_tlb_flush_lock;
#if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
extern int pa_serialize_tlb_flushes;
#else
#define pa_serialize_tlb_flushes        (0)
#endif

we currently do TLB serialization on 64-bit machines with a 64-bit kernel =
only.
N-class machines are 64-bit-only machines which can't run a 32-bit kernel.
So, 32-bit SMP kernels (which don't have serialization for PxTLB flushes)
don't seem to be affected.

Helge

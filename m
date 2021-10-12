Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE52042AE37
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Oct 2021 22:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235086AbhJLUyw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Oct 2021 16:54:52 -0400
Received: from mout.gmx.net ([212.227.15.15]:46687 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235100AbhJLUyw (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Oct 2021 16:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634071940;
        bh=A4x1BLuy7hrPPrJu1s7aX/Jh3czKoHag+napyYRsyds=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=ksLcWczmg/8ddAe1R9xNBh1I6Njtnb/mvgLSBUKzLRlcPYAvXsgwBqco+Q51+H42I
         ZRITdtLmkN+vEcNaLOINyBaXnyO7tCMstEH7h/EvPYR+sr6Z5PkooETwbBPufJP5L6
         oTyGjH6fAm0YG/Gs9f+B3seeDsvuw/va98OCuh+E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.128.177]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwZ4-1mstY01Fhk-00uGYN; Tue, 12
 Oct 2021 22:52:20 +0200
Message-ID: <d994f5f2-7f7d-3eda-3ea2-c003eb198b3e@gmx.de>
Date:   Tue, 12 Oct 2021 22:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] parisc/firmware: add functions to retrieve TOC data
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>
Cc:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <20211010183815.5780-1-svens@stackframe.org>
 <20211010183815.5780-2-svens@stackframe.org>
 <11844080.O9o76ZdvQC@daneel.sf-tec.de>
 <9567f761-5100-b367-32f9-a6b39094d630@gmx.de>
 <875yu20yrn.fsf@x1.stackframe.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <875yu20yrn.fsf@x1.stackframe.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FQX9327XKZFoIRMcd8bmY6RZS1kZtO+NW62jP3MKnov02SFMM/1
 sdwtEA3oC98jMYUWkRYbam+tjdbvFWHk+8NIP6O7xfcjJu15aOq3GzV1HwsVHREjcfN8zlw
 4JgawZxGeU/boKzUDwVL6jc4iQtF7C2SYZGGLR6uZz4fko8fYjlCOWNbn3eCJPPX/PGd+ps
 6mHntm8A0ouwVhMhfkT+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SAInVVIOUNE=:F+sgjNvvLgc2sylC+50TeS
 Lpn+ANAIhbIk7z2iyUiJaHDXgFWQ+U0DHpnWZE/YKBvJV5vYCxxXth0y/7a5Wkgq1Ro2WjaeM
 7ryG3aSgJwHIrHwMfx8mJ99RBBoChuVVNgTH+ByWjnKoR9JdLTn64duOTjQYKfpQ9vmHtVg0R
 4NTdPLjJRrCKz6QIiD0pEl+VQEJ2fS67aKUaMBsOatx7BDynXtN1/vHksyYkBVnPI3hi7ut/k
 NIWef7rJyp8xCC+E5+cvhcMOL3FMQ8zI/cdguAydV73ni8ZqEI1l9b8y0qWwREz3GzP0ez0DD
 z+CmwyufHnC6wCyWoaRxBfvPaKyds+c1+KsBJA0Xc4Gn/PYLhTDZ5HGfFXHPesgBsFjMw+31O
 dHIIrwlqAKUHKHY21M752+kChT9owrJmGXEnLvfk3rGXEoDVmwOI5zo9C69FCBVhJl95KgQbd
 E2GvLbCJqzNIpRTbQillgREluNgGm4weqs8iiDzKlOe8GaCg3b15NYuhLZsrd3xdZozO+Q7yx
 iwUAS2KP0AsOUxrTeeKWgGL3pMziBtnaAtC8pjwp1rPYpwfe1gMuBRt3UTZksqUxhUYE+rcLi
 o/PucqTLqQXPjSxDB6arHkpy0LrYEjLVdT/+y9n+zZW/Ce2/ngqEA1aiWppxdl4e9lzvtbZTb
 mf2ZoudkQxyw7AHZ8yeYq01+T5Oz8WNERn+UuCJ87zKCsIaQDM0NlqtQyqTOhMA1bZbqdpkVy
 XoZhcgBTj+aDiK7+/0CnWLZGyhULvRQz87shoTiUscKv/jij65PwrIIwLbs8nvSFSHFr6wql7
 /IBaNHCiKpwTiC1y89Qo5nLAA37wFLnWKbigkTGtuFfN22qhFnpLormVCzG5fsTws6ltGeiRb
 4C3UPfgR1LBYLN9DLEE3oDSNqiZCdF8Vvn5G4iALMgZxLATMpl9HacSB0SePKdxBT/1HVSSZl
 ic2H4nPMffFTPb0ujf8eolLYrLzC4GmpLCwZE734F2JRI6497MO9o6Mah5MbKqYc834j99Tza
 vmX3k9jqjxm8G0zdZEyZnaxu1jKvchqE2n5khdF7RuvABc6FfTaYNx/Q2ix7nNVL6reRT4NNt
 XS6ZuYHkYXuiZc=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/12/21 22:33, Sven Schnelle wrote:
> Helge Deller <deller@gmx.de> writes:
>
>> On 10/11/21 17:05, Rolf Eike Beer wrote:
>>>> --- a/arch/parisc/include/uapi/asm/pdc.h
>>>> +++ b/arch/parisc/include/uapi/asm/pdc.h
>>>> @@ -689,6 +689,28 @@ struct pdc_hpmc_pim_20 { /* PDC_PIM */
>>>>  	unsigned long long fr[32];
>>>>  };
>>>>
>>>> +struct pdc_toc_pim_11 {
>>>> +	unsigned int gr[32];
>>>> +	unsigned int cr[32];
>>>> +	unsigned int sr[8];
>>>> +	unsigned int iasq_back;
>>>> +	unsigned int iaoq_back;
>>>> +	unsigned int check_type;
>>>> +	unsigned int hversion;
>>>> +	unsigned int cpu_state;
>>>> +};
>>>> +
>>>> +struct pdc_toc_pim_20 {
>>>> +	unsigned long long gr[32];
>>>> +	unsigned long long cr[32];
>>>> +	unsigned long long sr[8];
>>>> +	unsigned long long iasq_back;
>>>> +	unsigned long long iaoq_back;
>>>> +	unsigned int check_type;
>>>> +	unsigned int hversion;
>>>> +	unsigned int cpu_state;
>>>> +};
>>>> +
>>>>  #endif /* !defined(__ASSEMBLY__) */
>>>
>>> Since these are defined by the hardware and have a well defined size I=
 suggest
>>> using u32 and u64 to cover this.
>>
>> You're right.
>> But in the whole file we use "unsigned int" for 32bit, and "unsigned lo=
ng long"
>> for 64bit, so this change is consistent with the other contents.
>
> Yes, especially the 'unsigned long long' catched my eye. However, i kept
> it that way so it is consistent with the other structs. I'm happy to
> change the types with a cleanup patch, but i'm wondering: why is that
> all uapi? IMHO this should go to include/asm? Any objections against
> moving it? I don't see how userspace could use that given that only the
> kernel should be able to call into firmware.

I think for the palo bootloader and the qemu sources they were put in incl=
ude/uapi.
Both projects have copies though, so I think it can go to include/asm.
If you send a patch I can take it.

Helge

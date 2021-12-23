Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2903247E8EE
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Dec 2021 22:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245175AbhLWVO5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 Dec 2021 16:14:57 -0500
Received: from mout.gmx.net ([212.227.17.22]:34093 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240686AbhLWVO4 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 Dec 2021 16:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1640294084;
        bh=Hhy+3uGH0pLGIY9H/P8OtaFTKsPNwD03qCokR5dMibg=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=gzTWzTD5OUXBpi4+/4bKgbddRT+qQosVD2z6BSH2UP9FSDaeGMLYvzZwyGwSi1CfU
         Gz1AJsd9sV0MRQkeDYM4dV5T0x2R1Aiy+HTym6+yR+yQxf5OwTFpYze6ZjVwCg8lI/
         TYGVPZbx2Oqn1+VYNtClqrOvMH1nAUrzyGh32CO4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.187.188]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfNf-1mBQjr0Qcp-00v4y9; Thu, 23
 Dec 2021 22:14:44 +0100
Message-ID: <b2a05978-9ec9-5bfb-8df3-746b3321cb71@gmx.de>
Date:   Thu, 23 Dec 2021 22:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] parisc: Rewrite light-weight syscall and futex code
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YcScAR4cPgyI5B6d@mx3210.localdomain> <YcTEOhVnmT8kQRmf@ls3530>
 <888da884-86e0-e6f4-68c3-e3448eb4c9c8@bell.net>
 <6e4b0354-c3d9-ec11-4303-525e04c2d5d8@gmx.de>
 <96a706a5-a2c0-68ae-2541-0ae7287e2aab@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <96a706a5-a2c0-68ae-2541-0ae7287e2aab@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t7ErICSP4Uryg4fTlL8iUNkvzE39iVS5aY/soMn3xbYPHlxz71s
 fMB6jstObIHK99FzWC6w/sWp555nLJAObTdfUJ/BBBxkDAE/NCAsD35+JPmxy6SFyFovwe+
 RxjYJm7ikHWZRVq2tou1oXPp4XcKMeawunqGp+huJo1vtOMA/cvhahGPWbXpuEP64Lh00+H
 utUmCtye3aZf2JFYpsKmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kj344YUZrZI=:FmPkyZRuB5tSnhShTTdETW
 B9F6YEHeygtydPb4Do+Xns9whnWxjAyS/ImG9S8gMbqNxuAF4sEQWlFU0iu66xrWoNHbwV0ZY
 xEqBbWKSJ2tUrck3DDAsawJJ7/H4PaDyxAZcNBjizuawuHWMPDfYgv0+qGIBpuh30xuvPoLM2
 dJCqZiP4SLyb8Hu3iDCwHUZ29pJpGEoFg5PAcZrnVZfKLPQpw/GymGI8dPVbt9+uw092+yXOb
 EAoQncYJ2vGF2UD5sgOe5EADRYJ72LM2gHR6QM4alIDsc/mtF+wg7nZ1pt7g0skawMhAR7V/J
 yv2Hk+/bTpSSsqYDeqN1+7yAbU+tPxBiKH/tEBkkSx5HDvAORI+aw/pCrR8qGJmsNh6vY+DHV
 EdO86ivObJ04Q5HdctGHxzvb2kTujrcSzvv18JNmnwCgg2vSZk46xbIxqNCioViS/an3ciIoP
 3ykKHW+5DZn/woV60YLPbOo8t24ZwdlSlC2EzWv44GuwZpQNFxxz8W62aSOMCg69cFglZ6XAk
 ngENC734oqwPceBRe4hOz358bAGd2ypshhSAu9nodbW64PDzFG97QIoWdUXJg/UsIRbVhxnQC
 KUxXZH+CiXpWK/PunaknRLAfMcL44YwRUy4uWOJUNa0FWSotUbK0x/ccm3veEajkKy1n4uMhU
 Tnt+veZ/hjXuwAF2kf2xg6prDF3zL2/t1Pgp1Jf7O8Mdy0ZjVEwAFe1KH0ecwr1bf3TeDFqwB
 cRnWvKfNFfOeP+oNMgvjq7DjvJMscpDlbgREvrxaPJPmljLFV2JzXCcgxP8QiNg4nkoR1IBKu
 n2qH25xoZUTXDu56P1bdd6zU5ou57X23ms4HbnvlG6C1W6pPQHHzYidnouuwglWxy4+k7/3y2
 1As+7vsVr3nTXNUdWhuU5ub16O6f2jrjg7tMCoEgc1MPNV/ItgmB+dSKx5Vy8NOHkwdyd8aJp
 PqzupxA6pCUAEduvLXIVwd2aFxsb+1adWP3/gk4e0SAppJAhHA10L43GEP0DnIeLASBJRT06W
 1nFEkTbivz1SRh7yiR5di3rePhZ7j+/q4ZZ9CKCcY0V/Q535D6N9yq/SilX95zF1hwOEWxFgc
 dLVZbboW8F21YQ=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/23/21 21:14, John David Anglin wrote:
> On 2021-12-23 2:31 p.m., Helge Deller wrote:
>> On 12/23/21 20:17, John David Anglin wrote:
>>> On 2021-12-23 1:47 p.m., Helge Deller wrote:
>>>> ...
>>>>> In order to do this, we need a mechanism to trigger COW breaks outsi=
de the
>>>>> critical region. Fortunately, parisc has the "stbys,e" instruction. =
When
>>>>> the leftmost byte of a word is addressed, this instruction triggers =
all
>>>>> the exceptions of a normal store but it does not write to memory. Th=
us,
>>>>> we can use it to trigger COW breaks outside the critical region with=
out
>>>>> modifying the data that is to be updated atomically.
>>>> ...
>>>>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/a=
sm/futex.h
>>>>> index 9cd4dd6e63ad..8f97db995b04 100644
>>>>> --- a/arch/parisc/include/asm/futex.h
>>>>> +++ b/arch/parisc/include/asm/futex.h
>>>> ...
>>>>> +static inline bool _futex_force_interruptions(unsigned long ua)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 bool result;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__(
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\tldw 0(%1), %0\n"
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2:\tstbys,e %%r0, 0(%1)=
\n"
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "\tcomclr,=3D %%r0, %%r0=
, %0\n"
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "3:\tldi 1, %0\n"
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY=
(1b, 3b)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY=
(2b, 3b)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3D&r" (result) : "r"=
 (ua) : "memory"
>>>>> +=C2=A0=C2=A0=C2=A0 );
>>>>> +=C2=A0=C2=A0=C2=A0 return result;
>>>> I wonder if we can get rid of the comclr,=3D instruction by using
>>>> ASM_EXCEPTIONTABLE_ENTRY_EFAULT instead of ASM_EXCEPTIONTABLE_ENTRY,
>>>> e.g.:
>>>>
>>>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/as=
m/futex.h
>>>> index 8f97db995b04..ea052f013865 100644
>>>> --- a/arch/parisc/include/asm/futex.h
>>>> +++ b/arch/parisc/include/asm/futex.h
>>>> @@ -21,20 +21,21 @@ static inline unsigned long _futex_hash_index(uns=
igned long ua)
>>>> =C2=A0=C2=A0=C2=A0 * if load and store fault.
>>>> =C2=A0=C2=A0=C2=A0 */
>>>>
>>>> -static inline bool _futex_force_interruptions(unsigned long ua)
>>>> +static inline unsigned long _futex_force_interruptions(unsigned long=
 ua)
>>>> =C2=A0=C2=A0 {
>>>> -=C2=A0=C2=A0=C2=A0 bool result;
>>>> +=C2=A0=C2=A0=C2=A0 register unsigned long error __asm__ ("r8") =3D 0=
;
>>>> +=C2=A0=C2=A0=C2=A0 register unsigned long temp;
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __asm__ __volatile__(
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\tldw 0(%1), %0\n"
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2:\tstbys,e %%r0, 0(%1)\=
n"
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "\tcomclr,=3D %%r0, %%r0,=
 %0\n"
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "3:\tldi 1, %0\n"
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY(=
1b, 3b)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY(=
2b, 3b)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3D&r" (result) : "r" =
(ua) : "memory"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\tldw 0(%2), %0\n"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2:\tstbys,e %%r0, 0(%2)\=
n"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "3:\n"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY_=
EFAULT(1b, 3b)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY_=
EFAULT(2b, 3b)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (temp), "=3Dr" (=
error)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (ua), "1" (error) :=
 "memory"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 );
>>>> -=C2=A0=C2=A0=C2=A0 return result;
>>>> +=C2=A0=C2=A0=C2=A0 return error;
>>>> =C2=A0=C2=A0 }
>>> I don't think this is a win.
>>>
>>> 1) Register %r8 needs to get loaded with 0. So, that's one instruction=
.
>> True. On the other hand you don't need the "ldi 1,%0" then, which bring=
s parity.
>>
>>> 2) Register %r8 is a caller saves register. Using it will cause gcc to=
 save and restore it from stack. This may
>>> cause a stack frame to be created when one isn't needed. The save and =
restore instructions are more
>>> expensive, particularly if they cause a TLB miss.
>> Because of this reason, wouln't it make sense to switch the uaccess fun=
ctions away from r8 too,
>> and use another temp register in both?
> Yes. I think it would be best to use %r28.=C2=A0 Then, error will be in =
correct register for return.

r29 seems to generate smaller code than r28, so I choosed r29.

> The variables temp and error can combined.

Then I need the copy %r0,%error in asm code.
It's no option to use ldw with target register %r0 ?

>>> Note that the comclr both clears result and nullifies the following ld=
i instruction, so it is not executed in the fast path.
>> Yes, but when emulating with qemu, it generates comparism and jumps, wh=
ile the loading of r8 (see 1)), is trivial.
> In this case, the comparison is always true. Does qemu detect that?

Doesn't seem so. I think it's quite uncommon to use it that way... :-)

> The comclr is equivalent to setting target register to 0 and a branch to=
 .+8.
>>
>> If we change the uaccess functions away from r8, then we can drop comcl=
r (and save one instruction).
> If we can use %r28, we should be able to save one instruction.

Yes.

> It's slightly less work for me if you change the uaccess and update the =
asm at the same time.

Sure. I'll clean it up and commit to for-next.

Helge

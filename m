Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14851441FDE
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Nov 2021 19:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhKASUN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 1 Nov 2021 14:20:13 -0400
Received: from mout.gmx.net ([212.227.17.22]:43847 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232124AbhKASUM (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Nov 2021 14:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1635790636;
        bh=yzodJQ6uSUGdI95UyrC0iT9cG3ecC4GW+LawXvyLwbo=;
        h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
        b=jML9UyxUA0NtRtVll+MRmiGrB7iTIcH5yrANP+kthynjvU/Sn0vHL/tZ2922nIecl
         hm4Bi1lLdUf8NMFpm2Ka53ggXK5HRws+BVSsh4WtWZgfQveqrR2M0H4+B8BE311TFQ
         v32RnDmn64AHAC9qkiVsPc3BZiYrsZr7Y6M5iB3Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.177.231]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17UQ-1mbivh32So-012Vfq; Mon, 01
 Nov 2021 19:10:19 +0100
Message-ID: <0cdbabc1-4aa1-1908-51a3-a195ea9a37f5@gmx.de>
Date:   Mon, 1 Nov 2021 19:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     deller@kernel.org
References: <3b8410fd-f688-862f-3c3c-7ccf5d523075@gmx.de>
 <a10ff403-3869-9eb1-8213-b51e6ca8d219@bell.net>
 <0a068f90-84bb-dbe1-b8b3-6fd7709b814a@gmx.de>
 <dba5227c-0616-f51e-b716-9569304804bd@bell.net>
 <c25d8ffb-be2b-fb56-f0c9-11323d256a15@gmx.de>
 <86ce35e1-7ef0-1f5c-5cbe-a498a280be29@bell.net>
 <5650aab0-5cfd-a114-6a69-e8dc86123b93@bell.net>
 <93de32e2-9922-99cf-17ce-95409d6c0813@bell.net>
From:   Helge Deller <deller@gmx.de>
Subject: Re: fixmap problem on PA11 hardware
In-Reply-To: <93de32e2-9922-99cf-17ce-95409d6c0813@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vJs++VaEzTpiQpmtftgxcueBZg/36JUG0VcjUdOmC6UclhvtQUs
 5M3E4ZfcIB6X40yIxfsbr44G12lbbGtH/5oLvivtS/becagt1yiW/a1YGiigCLcQEZGnuu4
 dJVVCl4T6Upv3z3vXK8GF5bcXHOol6JooKDPBQKqnefqax90XDiIIbheirYEsJtaxS34yeT
 ojEtA4dyXE9rYeZmXXGSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YFxAQKuP2iQ=:w9Ow+t7OPp4x4vBCs6uDrh
 QDnQpNGEUIMrQrrV3cGJWqMJ+TmswT6bp58VsftKzkKK3lpfFltEJCn78PFyR6sR2ny0Uf4eK
 rP75cNwbO8wQbxLq064zV0EAUZhfJqzqjF6R69Ruh7t+CWWJM6F1Sq7CupQqlqMFGassdP1I2
 xreJxQbyJ1VSx2Qy8yoHJMEMdX+VQ74XnbMHsrJac+VzKKTmsHTrzyUp/E97tMQIN7vTd6LGb
 qFJDVwPU84gvnfUd3D3X1N4mXEkG17UJGOOtUkGjcSfNCL17I0rlpwa5vLvkY4c//VLOXkXem
 QosMhaSTrJMdF0J6b2pMA5JzEFfiOA1mb3M++qGLdZXkO5DPoSelhv8viTjfv61CDfausw3we
 sQIuSATK5M/0SckDM4MzVE1nIof9gvFStk88zYejo5aGtds/y0UYw+eACxH2Z2+5gfu/R+/Br
 GfRzm0mACw/4ucdI+f2wj9MzqGKkiMRzbIWNR25TAybXISMcmukphgVxyuKf3fP64oACfJJWS
 sUh1q+W1wApjrwB3sRScX0MzIg/kitThQIcoQLFVK1z30GkFyOyp5FyFu5Nzd03EGkradTs6D
 NMRS1Nnndy3sJiqTtsBvTxmm+Kr+r0ONnEzr5TPn0ZVoUSjwPeFro0oxElMqPztPaGWPynzru
 uSUCook/P8F51f9AAgmYRen7pPzZXn7jJGE1WB7eYWxu/x3gSfRzcV83hCJo4c47LpZsf1h1m
 Jz6QJ2GC+omvhUpGmyMvgXTulOrrUM2qBr+tOaa6S5dYjqYO0NSNIsN9TO2H87yEyr4O8+Vof
 +8FZVQIk/b6EJbuHBVMW/37IfhVQA3dgV/nXo7OX4eB6Biq4xV+Ar6Q1uqMYW4efc0IBAx5wV
 S19g/XmgTYbPdVAWc3WHBBWbXxrAZjT3vLry025igFCbi0KIS0PxlEpI2R+hV5WXWRHQQD0Ay
 6gmyRumWeMtSBTL+vmjtdq9d26xBQWO0G7RySJkPhmY4NO/NmmD1YKhmh/RYB+aZVgFg8hThc
 seNMKiXcVK2CMA/T1YtrAH3ggbyCi+7TG9gMxErL3Fpt94PwhjbKvve1VE5BNvrQ4loMiktlj
 Juz+kH2e7sw/e4=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/1/21 01:06, John David Anglin wrote:
> On 2021-10-31 8:01 p.m., John David Anglin wrote:
>> On 2021-10-31 7:56 p.m., John David Anglin wrote:
>>> n=C2=A02021-10-31=C2=A07:07=C2=A0p.m.,=C2=A0Helge=C2=A0Deller=C2=A0wro=
te:
>>>> On=C2=A010/31/21=C2=A023:47,=C2=A0John=C2=A0David=C2=A0Anglin=C2=A0wr=
ote:
>>>>> My=C2=A0sense=C2=A0is=C2=A0the=C2=A0invalidate=C2=A0patch=C2=A0isn't=
=C2=A0correct.=C2=A0=C2=A0The=C2=A0main=C2=A0difference=C2=A0between=C2=A0=
pdc=C2=A0and=C2=A0fdc=C2=A0is=C2=A0that
>>>>> it=C2=A0is=C2=A0optional=C2=A0whether=C2=A0pdc=C2=A0writes=C2=A0the=
=C2=A0cache=C2=A0line=C2=A0back=C2=A0to=C2=A0memory=C2=A0when=C2=A0it's=C2=
=A0dirty=C2=A0at=C2=A0priority=C2=A00.
>>>> That's=C2=A0true,=C2=A0nevertheless=C2=A0I've=C2=A0seen=C2=A0differen=
t=C2=A0behaviour=C2=A0on=C2=A0real=C2=A0hardware.
>>>>
>>>> It=C2=A0might=C2=A0be,=C2=A0that:
>>>>
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0flush_kernel_vmap_range((void=C2=A0*)fixmap,=
=C2=A0(p-fixmap)=C2=A0*=C2=A0sizeof(*p));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0invalidate_kernel_vmap_range((void=C2=A0*)fi=
xmap,=C2=A0(p-fixmap)=C2=A0*=C2=A0sizeof(*p));
>>>> (here=C2=A0the=C2=A0flush=C2=A0might=C2=A0be=C2=A0sufficient)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if=C2=A0(mapped)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0patch_unm=
ap(FIX_TEXT_POKE0,=C2=A0&flags);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0invalidate_kernel_vmap_range((void=C2=A0*)st=
art,=C2=A0end=C2=A0-=C2=A0start);
>>>> (but=C2=A0here=C2=A0the=C2=A0pdc=C2=A0is=C2=A0necessary=C2=A0to=C2=A0=
actually=C2=A0drop=C2=A0data=C2=A0from=C2=A0I-cache)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flush_icache_range(start,=C2=A0en=
d);
>>>>
>>>> I=C2=A0can=C2=A0test=C2=A0tomorrow...
>>> Maybe=C2=A0sync=C2=A0is=C2=A0needed=C2=A0before=C2=A0releasing=C2=A0lo=
ck.=C2=A0=C2=A0pdc/fdc=C2=A0are=C2=A0weakly=C2=A0ordered.
>> Forget that.=C2=A0 There already is a sync.
> Could it be we incorrectly change the flush/purge operations to nops?
> 89:=C2=A0=C2=A0=C2=A0=C2=A0 ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, IN=
SN_NOP)

No, can't be.
The alternative patching hasn't run yet when the kprobe testcases run.

Nevertheless, I don't fully understand it yet.
The same code works differently depending on the machine.

Helge

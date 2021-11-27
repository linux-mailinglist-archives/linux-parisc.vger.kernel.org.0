Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 757B64601DE
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Nov 2021 23:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236066AbhK0WNq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 27 Nov 2021 17:13:46 -0500
Received: from mout.gmx.net ([212.227.17.22]:57131 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233576AbhK0WLq (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Nov 2021 17:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638050900;
        bh=WEBnulSbaHSHhGWbSGTD5H/rOGeUYVPHtJS6s2ugwbM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=U5K/xdSB1tDFhg3a8fgr/5DcjV1iwY8B+Iab8gRN+SI6vSnpMEUEPqKWG1dUbJ4dN
         j6k/p+tYrWLF+B7hQWD4/UrKGusMx7QYIJJlLBjmL2GbdsPtHZFnnbA1Nxdkr+aYuL
         k0UR8NnVDmiZvYYDiHa9qTKdEQ1sWa1kZGMGIt3w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.151.211]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Udt-1mxygf1rgX-006zHz; Sat, 27
 Nov 2021 23:08:20 +0100
Message-ID: <67e98d1b-ad50-26ff-7201-047fd0256895@gmx.de>
Date:   Sat, 27 Nov 2021 23:08:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] parisc: Do not export __lshrdi3 on 64-bit with gcc >= 11
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Sven Schnelle <svens@stackframe.org>,
        Mikulas Patocka <mpatocka@redhat.com>
References: <20211127105818.299902-1-deller@gmx.de>
 <0ed4c18f-79fb-fc95-5baf-ae9a1f99625b@bell.net>
 <a2e9d25d-9a59-1cdf-a0cc-8344625bd2dc@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <a2e9d25d-9a59-1cdf-a0cc-8344625bd2dc@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rzbTyf5qxjCl6Rj/PL+Vw7zfkcpQapgY0ucNYRWTm5ZUqc7F52r
 mHtTPsj3QjFG+M6h4kU23bphbZgdWSpxB6kdqwVfepO0SwOu5cvddUeCtBcRJQWREYoUEna
 6FM4sk1+idnZLsNJBL9VWqw8/TarcHZTEU9sHYQTN+TtEO8QFXA21gfBb5YKnns7iTkWkMQ
 BkyL2E4e8p1CZoqGF5DrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MNVmkztzyuI=:u/eDz/+CMZ/aicoNBb30fj
 yJs/hGVHRBZTM7QlrNTVrgvwC24kJPTx4y+/z4+3Bmr5KFL+r3JsHJcfoozTihynDgMco39k6
 e1z5YheLq5hNtJW9zw7rJOw+yzQINUBV7wxNcFRdNYO/43Mxe0vLkINSRwUtvd06QpaCR5K9P
 zYnq3beVKi+7kKBVvJGOuPonQ5SmYGmS2L1ZumxGthMrmdD30x8sHbS2hUIjvj38jp6P5RwvW
 pLMVPeBYaL2NPQarz/xSSGJcv2T8l1Ju1/rpFrNuICVP8FUEPuP7ZRbtSL2uMCX3EgacXLWZj
 AJx6cBOI7Vk3O/0JpEyS9bIxbugAyIbVqMLAat2ontTIcYx/4lMmooMhOGY0QqTwN77hvrXgj
 JSOz5xXNVdzYb89wDFGVw5n3QQpNJGiZZHrxWHRAzqLKK1sbOcd/ofXbEQaITmrd/0o/xtm2Y
 GakOjlgpAg3YKscT04tX9Q0mEaRj0akAkwxjk3aegc6Ht1+eQV/WzvpUB/94nOcsq1FNDyEB/
 K21xLD4bEzemozrD/2BTT5sKNhKESLlRLmhapBmgqwGTO9RoeXOqg9g4TzW02OmiB2YMV0dC6
 DSqwBzD892C4ZRS0HFvrweavEOgmM7zjBP3LbJigJMtpsKvP/f6RKbFxrhtj/y2cJPtoEwl1f
 WcA9e00cpjHoGO40qATSQ38EqHQek2OKkvInx3X13EBlx44Xm9V0fVQv9GvsME5HbtpMi4RGH
 YLOV41IG5kZ5QvOCZKNhxIam2sr72vCVnAqC8Sv316Wo0x0UDoXOfe5XU9tXYd5MBpzGwqa6K
 v7mRRAyA8x2TyhA2ATeC/NSoyUQR0GVpOxcp4OAhENZb6+dZPJ4jHm85XAqZKhsATQLiMccAO
 3lYZZTMg0rEwc7hsO54sitgZMotGPTzqTPG0XUPZtRMqzk7iPtRUlUlo5yueeTL7J1m0PEiS7
 WBHsKkHzz+5oWAeQiCPUGamwR/DAWcThV/9Ap5Yn+s+3oBmIHhMqJwn0hRy7hZTdEWDizSXJM
 PYXHsQsfqv3T3hBv+M9qU3vUzGepdrJDsBB/Hry/1WG8YOF7tlIQeMyUQwO3fJ4vIuT0pUq+i
 hM7tGr4e/XyZn4=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/27/21 22:52, John David Anglin wrote:
> On 2021-11-27 11:32 a.m., John David Anglin wrote:
>> On=C2=A02021-11-27=C2=A05:58=C2=A0a.m.,=C2=A0Helge=C2=A0Deller=C2=A0wro=
te:
>>> It=C2=A0seems=C2=A0the=C2=A0__lshrdi3=C2=A0symbol=C2=A0was=C2=A0droppe=
d=C2=A0from=C2=A0libgcc.a=C2=A0from=C2=A0gcc-11=C2=A0for
>>> 64-bit=C2=A0executables.
>> This=C2=A0is=C2=A0gcc=C2=A0bug.=C2=A0=C2=A0There's=C2=A0a=C2=A0typo=C2=
=A0in=C2=A0libgcc/config/pa/t-dimode:
>>
>> #=C2=A0Extra=C2=A0DImode=C2=A0libgcc2=C2=A0functions=C2=A0to=C2=A0build=
.
>> lib2difuncs=C2=A0=3D=C2=A0_muldi3=C2=A0_negdi2=C2=A0_lshrdi=C2=A0_ashld=
i3=C2=A0_ashrdi3=C2=A0_cmpdi2=C2=A0_ucmpdi2
>>
>> Will=C2=A0fix.
> This is now fixed in upstream gcc source.

Thanks for fixing, Dave!

So, my patch:
https://patchwork.kernel.org/project/linux-parisc/patch/20211127105818.299=
902-1-deller@gmx.de/
and Mikulas patch:
https://patchwork.kernel.org/project/linux-parisc/patch/alpine.LRH.2.02.21=
11270717490.10680@file01.intranet.prod.int.rdu2.redhat.com/
won't be needed.

Good to know.

Helge

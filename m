Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B3828B097
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Oct 2020 10:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgJLIw0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Oct 2020 04:52:26 -0400
Received: from mout.gmx.net ([212.227.17.22]:32947 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726862AbgJLIw0 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Oct 2020 04:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602492709;
        bh=auDAUy7U7gxW+JzcegXnC/OFahBdXxOwWrgn4Q9Q3B0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=bbRC8jVXonZuoI1HW3pDW2Lg47zguV5UuRY5enVjRAbWe1JQ+GAZ+8sco827JFspQ
         D0/+4xXvIqIyJ1oeWEzDkRhhBkSOmEYI5gYQuBZf8zaw+b92xwUNXIGG+ITyDQ7Dao
         g32GcBTGqnrAY+wZnO4oRwvOt8yl87ZWgX+R1Q28=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.58] ([92.116.158.71]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvcG-1kwmNJ2ZrU-00UvXJ; Mon, 12
 Oct 2020 10:51:49 +0200
Subject: Re: PATCH v2] parisc: Add MAP_UNINITIALIZED define
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20201010215431.GA30936@ls3530.fritz.box>
 <20201012065051.GA3458@ls3530.fritz.box>
 <18f8c87e7ebaf020a6c61dfdd0d893ba@sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <829bb90f-91ff-dd68-2150-f4264ff92230@gmx.de>
Date:   Mon, 12 Oct 2020 10:51:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <18f8c87e7ebaf020a6c61dfdd0d893ba@sf-tec.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jKv+fjOHDJr2JyQpR32WZhODkZwvDwxZZOaF801bpkvmY5Xijut
 by2Dex+aXdzmH62lk8N+JB8zLxsSltXjCeT5Z73tx6vzghEJqh2/A22Jl6XSfFQ2lLEr1Xk
 WSASU/osjksmF4MgG29c5/MW44nCo/rinIKyCuGCBcTsCFLvVaxuY4/P9KIdZPAEuMW3Txs
 1bBpxlOpkwnqDDoy7X1Uw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:U3iHABzsick=:KYCXuVMTFEBUaLjARtSXBl
 SeM8qBvRoYWsuzcqktf72EQwkvmYk9SffBw0V1kcVCUiMjc4ur3/eTOQomJKp1hRcLtb/hAgg
 +cX4vokiYm8TP+iE8gpKwCI1N0UAY806j0DUSbyBF7HidN2GLPyU1cbfLYlRvt+Gl5vs3yRYC
 9mo0ZvtTtYm2xjjDYTqiq4uxTPLaG636OegBdPJbmvS6FxsXCMc8nMTZYGk2ARiAzWpWDZDoe
 Y2PqwBPhSBiDWaIci1VvCVMIaDRsa9abj2nVmDDwN1+etAsy1do3a1lTwvv5T1qJKUvIYPID8
 iHrYJwGaWGT18+iuZcrWllCjSScYSaZq/RuTf3vgboK9XFdd05jXv1INJBqVmwEgeJ9sUDT3J
 +K23BlrwPbd6uUOmyBY/PgfeDTNksCe/f1eCZlLJsybiTUJUwce0dIIggQkVjQMoowcc1fHxQ
 n0gPwlqfChf9aI3n8CINB8gBdWM8DX6fF3RI9NS/7FigAY5/qiuuXsSkacXp06ppv7w2VUra5
 T3xv3ouM6C6KD7ith/A5L+SqKLY9RqEk5MY2c+nmssbKHHFHU7UVPh2YOFnwyVc2Z4gP7Cg0t
 GBNy7a8DVVqn17I6dpF/ShUNOut57BJs7dRsJezjo4YnbJWjkj8URl+K/x4+qyeSR15AkzUNq
 LY9iOpXB7u/dyM4UDOWFcUWJl6WgCPXu1/M2wrbtU0EEoGDSiPCHRahZEPANF5VeOVhn7cGwK
 XrbLgO8/7ntwwMsZp6Vin13Hecj419+I/3nF3KmDVsjgffbgoHQFvWi6f1LTQ5A5sgC1QR16A
 duR0cTkS+GuFOTeoPXJuj6O4aBO//mtt3aajOrdT4YHgkLHcIGIuvcMbE7ZsgtQmLZQlnOV0y
 5/KD0C3u63CY6KOoVPDkJI4QpTKZ6R128YQ1FuSEeZ2WREry6ApY1gljPzIVtyE4klMPNNNSb
 I8zARzuycozlT4d9Ffw0xp1q1HVkOgSnvcMgWePzgR5yOaL6IdbkCcAAqEbpZll4qldMaS8mk
 1IsxfYSsxboUPhlEQo6Xu+ksjSN2GxGNi9W/UDfAHQd311o6v/T3XD5bNIoxDvAYjgAnECFMU
 g6yP3FaPUYRCJCZDzCwIwo78XZi7mPFpmJR9YiYVfAfowO5mk11IycahwdT9h8N6v/XZGJKOa
 Rd6doxPYgm88zlE6nrra7C3KJOgR6foFeEhnvJQ0uKPbjBA+8QZdNz2VePKPKvHsp5002jPpD
 kn2a4D57eejMVlatf
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/12/20 10:24 AM, Rolf Eike Beer wrote:
> Am 2020-10-12 08:50, schrieb Helge Deller:
>> We will not allow unitialized anon mmaps, but we need this define
>> to prevent build errors, e.g. the debian foot package.
>>
>> Suggested-by: John David Anglin <dave.anglin@bell.net>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/include/uapi/asm/mman.h
>> b/arch/parisc/include/uapi/asm/mman.h
>> index 6fd8871e4081..ab78cba446ed 100644
>> --- a/arch/parisc/include/uapi/asm/mman.h
>> +++ b/arch/parisc/include/uapi/asm/mman.h
>> @@ -25,6 +25,7 @@
>> =C2=A0#define MAP_STACK=C2=A0=C2=A0=C2=A0 0x40000=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* give out an address that is best suited
>> for process/thread stacks */
>> =C2=A0#define MAP_HUGETLB=C2=A0=C2=A0=C2=A0 0x80000=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* create a huge page mapping */
>> =C2=A0#define MAP_FIXED_NOREPLACE 0x100000=C2=A0=C2=A0=C2=A0 /* MAP_FIX=
ED which doesn't unmap
>> underlying mapping */
>> +#define MAP_UNINITIALIZED 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/* uninitialized anonymous mmap */
>>
>> =C2=A0#define MS_SYNC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* synchronous memory sync */
>> =C2=A0#define MS_ASYNC=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* sync memory asynchronously */
>> diff --git a/tools/arch/parisc/include/uapi/asm/mman.h
>> b/tools/arch/parisc/include/uapi/asm/mman.h
>> index f9fd1325f5bd..506c06a6536f 100644
>> --- a/tools/arch/parisc/include/uapi/asm/mman.h
>> +++ b/tools/arch/parisc/include/uapi/asm/mman.h
>> @@ -39,6 +39,5 @@
>> =C2=A0#define MADV_SOFT_OFFLINE 101
>> =C2=A0/* MAP_32BIT is undefined on parisc, fix it for perf */
>> =C2=A0#define MAP_32BIT=C2=A0=C2=A0=C2=A0 0
>> -/* MAP_UNINITIALIZED is undefined on parisc, fix it for perf */
>> =C2=A0#define MAP_UNINITIALIZED=C2=A0=C2=A0=C2=A0 0
>> =C2=A0#endif
>
> Shouldn't the define itself be deleted here, too?

No, because it doesn't include arch/parisc/include/uapi/asm/mman.h

Helge

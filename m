Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838744577D9
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Nov 2021 21:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235650AbhKSUp2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Nov 2021 15:45:28 -0500
Received: from mout.gmx.net ([212.227.15.18]:53859 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235586AbhKSUpT (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Nov 2021 15:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637354529;
        bh=W+SrwejPRciyEg8TlXSIQJpj7y3g5K/vgF4p4vK2uNk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=lSkWEHc3LoLVemO174rd/NI5h2zeo88QTvpmP+LQSrpJ8tSlw3wH50FrK1RQNT1jR
         Lcyo1QSm1rR1Bm0ahItWbaWpFdPUVswnRZOiOJ7RMjPerZrPphG1GimCU7N4OPAIvo
         eSoMeE0lRt6gvkz5roLz7JX8MbPknYV7zDVj5j7o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.19]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MybKp-1mRYpI1p4X-00yxMF; Fri, 19
 Nov 2021 21:42:09 +0100
Message-ID: <37e2e038-328f-0553-f1ee-03dbf8e8a02a@gmx.de>
Date:   Fri, 19 Nov 2021 21:41:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] parisc: Fix extraction of hash lock bits in syscall.S
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <df51e873-4576-d4c2-7d86-b607cbb714b4@bell.net>
 <YZfJLEmjAUdY+4OO@ls3530> <8125f9ae-e0ff-e3d7-f9d0-7315131fbda8@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <8125f9ae-e0ff-e3d7-f9d0-7315131fbda8@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UVeHQQRuP32OJTvjcygYvvAnjT5URVbWR/0R6hSdzHLKaMZkIoK
 tdmJzFyCKrMoFn90qAkDxUxNoySShnGXG3q7v+c3YgUZM4ka6WQ+FRehyk+izCKOVQg/wqP
 xJMAZWusgfazO8mYx2AV75JREiIvQOi2R+BQMJtF8niaJm6zXu6IpOuZyXTzoN7zHmRHPmD
 pJYTcf4lijN906oAY2sAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8MyfTw58pMc=:TEWFSC97O4HIexTjVuJa/F
 u1BISykOb6XjO+Yrc3mCsW2KjilSy1qkzibiV+2u712+l6O2EB/Hnf4572m4QwXaLVEPZew8T
 uYqR2ZaLaiMZ7z57gtczSfEk/buZZw5TkMrMY0ZxWqZAbJO0HZiJW5yc4OAUWujca8nicGV7O
 EFIH59C4/jbInvkDx2VWL8zbPMqFz1fuXD4X5nE8b/5uZ6pm72IhDDA1yE8cE8w6okl5dTPyF
 a1fOXhmRIcp5uZ9MHdZ9QP/nBSkCnRZDXY2oIYnoK6JkEtS2i+XNvBNvQLEZxQz6TufuRADxX
 o67C3EvYxPrTT3qHHRhQZQRLMSTitUL/eziUmIhgu74PsKph+45V+4uP5dOLenmxhHnJvlQS/
 nfAazjM1+8Jcc9e/NmrBA/zrrxUOU3CVM+QfF76O5lLgwpSFdvcYhrG+4OkPYvYKk05yYrNSu
 EAXrrsfQg/DezX63lMQyoi/VvCS9rKN4JouLxux8mlHM9M7Iz2pOGINjKAhdm02L8IbIToezs
 RIq8UxxPyMoHKDlEvN4slApWrPKIpj+uyfP4sLoQ0gbwRE/D8BvoIoUyQjahLTFI95VBQKuEi
 Y2Euo/u9eOIkmxz22I2YLr1GGlULD7jDzARugo1XRkY6dIQgmH2TXPpENXcwx/4PB10twDk5S
 TTkxNNDec29jqYf6V3SmCSTLYpw12/uIlpY8QC/gdPemShaqMxCWsgEYyKoPzOniCiTkXbNfp
 af1Kwti5ghMEjcEzlVHI34paeYHDXz57f2z3Jk35BC1PW7HqZ1NuN6qTsykF2WOxJBi3TljkE
 dtM3oORS8nIpe/6MqfeEe1bl0U1vFofhdAOgHMhOrPeyNUqD//erBPGtHpQS6Oh/5oqS+GeAv
 oGCgBNgtglBzwPKLA6GXADR9AvGTu01Rr91gT2kpeZaEDf+znR+Ud4bwnd05KkiQTaiIyw7W2
 lVM0KG+0KPMiC/PsteF7198KDFQF8XYaERUSns8bCIsofgDgfc96wkw8cE/L8/AZMomLQOFc9
 bBIj0q+YIEMPeCAdGvkW3BVWVNd4RAyHgCMLQ6X/XH9aLN/WwNk88deIWM2LqHf+Cg==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/19/21 21:27, John David Anglin wrote:
> On 2021-11-19 10:56 a.m., Helge Deller wrote:
>> * John David Anglin<dave.anglin@bell.net>:
>>> The extru instruction leaves the most significant 32 bits of the targe=
t register in an undefined
>>> state on PA 2.0 systems.=C2=A0 If any of these bits are nonzero, this =
will break the calculation of the
>>> lock pointer.
>>>
>>> Fix by using extrd,u instruction on 64-bit kernels.
>> I wonder if we shouldn't introduce an extru_safe() macro.
>> The name doesn't matter, but that way we can get rid of the ifdefs and
>> use it in other places as well, e.g. as seen below.
>> Thoughs?
> Seems like a good idea.
>
> Only question is this hunk
>
> @@ -366,17 +366,9 @@
> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0*/
> =C2=A0=C2=A0=C2=A0=C2=A0 .macro=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 L2_=
ptep=C2=A0=C2=A0=C2=A0 pmd,pte,index,va,fault
> =C2=A0#if CONFIG_PGTABLE_LEVELS =3D=3D 3
> -=C2=A0=C2=A0=C2=A0 extru=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 \va,31-AS=
M_PMD_SHIFT,ASM_BITS_PER_PMD,\index
> +=C2=A0=C2=A0=C2=A0 extru_safe=C2=A0=C2=A0=C2=A0 \va,31-ASM_PMD_SHIFT,AS=
M_BITS_PER_PMD,\index
> =C2=A0#else
> -# if defined(CONFIG_64BIT)
> -=C2=A0=C2=A0=C2=A0 extrd,u=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 \va,63-=
ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
> -=C2=A0 #else
> -=C2=A0 # if PAGE_SIZE > 4096
> -=C2=A0=C2=A0=C2=A0 extru=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 \va,31-AS=
M_PGDIR_SHIFT,32-ASM_PGDIR_SHIFT,\index
> -=C2=A0 # else
> -=C2=A0=C2=A0=C2=A0 extru=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 \va,31-AS=
M_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
> -=C2=A0 # endif
> -# endif
> +=C2=A0=C2=A0=C2=A0 extru_safe=C2=A0=C2=A0=C2=A0 \va,31-ASM_PGDIR_SHIFT,=
ASM_BITS_PER_PGD,\index
> =C2=A0#endif
> =C2=A0=C2=A0=C2=A0=C2=A0 dep=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %r0,31,PAGE_SHIFT,\pmd=C2=A0 /* clear offse=
t */
> =C2=A0#if CONFIG_PGTABLE_LEVELS < 3
>
> where we lose the PAGE_SIZE > 4096 shift.

That's a left-over.
PAGE_SIZE>4096 can only be enabled on PA20 and is currently marked broken =
anyway.
The if was there to theoretically be able to use it with 32bit kernels whe=
re
the extru length extended left to the upper 32bits...

Helge

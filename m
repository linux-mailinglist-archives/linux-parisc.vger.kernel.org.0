Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38D7C744F9D
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Jul 2023 20:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjGBSNE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jul 2023 14:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjGBSND (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jul 2023 14:13:03 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93F99D
        for <linux-parisc@vger.kernel.org>; Sun,  2 Jul 2023 11:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1688321578; x=1688926378; i=deller@gmx.de;
 bh=9gk3r8O9exgD7e+PMsF45LftV5N98/CyRJvNn3Q0QJ0=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=QgAjMZkejE8b+LC5SJgYm76ujE0H+PPrTVGkL5xYq+Nu/SW2zNzvO9wfyp9Ia67lOCmvd1j
 8aehv8dm9IXUWA1DpHYDaQtrW5eXGphdYjVfCa5MBJM8nKbC6+2wVKxyoxyaCLujkga7PE5Pi
 1dPUrrp1l4LydQMXWE2pMlOdxkyzsG3/05y/pxQtVnno0iTVerB7eWPxAIzsWzLJUOtUDhqxx
 KbBMNkoGYwsIrS7sApXl2nYggX9hsZwwsb4hCyBSxkUKQYp5YO2OM/ZwGWY1ABz65rMGEmJBY
 QOI80e1Nnp0w3cIzL+r3wXp3hCVmZ24KzQx82utIOuqSjkgLfBkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.131]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ81-1qU3wN1JPZ-00WBzT; Sun, 02
 Jul 2023 20:12:58 +0200
Message-ID: <eca59ca8-47bc-f11d-9616-6b4b5b846e52@gmx.de>
Date:   Sun, 2 Jul 2023 20:12:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: execv: Argument list too long
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <612eaa53-6904-6e16-67fc-394f4faa0e16@bell.net>
 <52379fd0-1c3a-1cf6-1e00-dab8bcf8dab6@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <52379fd0-1c3a-1cf6-1e00-dab8bcf8dab6@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7202L05GHk9I5x+EYuoLwhveELkiCEOLIlNSfOvMlTSBs/8h+jy
 s7ljSVZGYoNUNeaxQhNlVQM/cn3bQj0N/21bCu+IGNyjxFxwY5MOUzq2QkYg8QmMsxlPp0y
 ilGfuokj7MYC0/u0Q9w3pbcc1Ew6+FI6K2/pQBKhQjRQoGLErqmY0fhiynxLIQioEIkKB+u
 U8epxLYUu6RwgZ3aWr/TA==
UI-OutboundReport: notjunk:1;M01:P0:SdkfCuBOXDY=;Dx3unRM3yu8MLk7JAlC+H1vsylA
 NskjvJSiPsvjILssbJhvviqgpMNdF2kKvnn7IHjxrCU28PIteNXqIfwdR5Bu4zrOoopaKdl3q
 LITGPHQ915nON9r0CZX8CyQbyjyMPLYm4vz4nJ54XfL1hEta8dF0KJ/Zfb1nRJ86xIzTOSaaj
 iPwgF0rA2pLA4EKhGu405wAehOvDHjmN+FLfiNjjzmhGDnY5q/VuQJtTU1iDw2cGfDbcbzAmG
 M4L+KgAJAbrxQZHi/WUGPkGJ2Z+s4ZXqpEWTpXL/6tm5jEFurWwLsBjfNM4dBsfSU0Cam/iFO
 SqiKqs00mopwpQlTHtkgHwnEn2a14+CLG+Xr6ohwS4Tj9SLqVapzpN97Sa9UglzEPesf6vgXM
 J8nOAlQApXLYPjReIy/bJTexvZ3Nn1dBN1u4jTudUt7Z8sdrNsVmkRhUk53f1yYGBsboVsF3i
 hObovrce7csDRUtb5xcMEwqQQiLcwjiwyQF+Zj9DK4jvvd4/TUma+8GI/tUNRmBL5nb2yQL2X
 PlqYrD5VM4UXME49whGX7ZbKFwGPcXZx7/uX3teZwkoSpJj+9AWz6ygSDbo1TP+ryp3frcwBn
 UNnwB2/BAwjMcHwruFtGMd0iF+ZzdwA3MerlM8xIyeo6QcnC/rDCNzNvFn44Txj6EpefcyPeS
 IpkjaBY12MOND5W9pyCOiM5ACCvbE9Y2zTfhHkw3zxCqCFiPQFvEtForYhsL/CMOHkDAwCKWI
 EdnF6Wx+079BRp2iK2KSVUC+3gsjO75P82s3ILxFWFqKfPrCSPQK8MOkawIsYhrk0WGBl8Cx/
 +JgFdovw2yX0/PQKAcPH0gJTn7Vdhr9H4nTyxMjTGWPmc+kUx+cS9iyN1jbX375bk8YiW03Vg
 gEYFvZYxShlGpwro9GaenMMZ+fTC46IcBjZy2EW6IkY23B4n2sstEI9cdAreGA2n3FgvX8zzf
 ohGnUw==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 7/2/23 17:24, John David Anglin wrote:
> On 2023-07-02 11:08 a.m., John David Anglin wrote:
>> With Linux=C2=A0 6.1.37+, there is a problem with argument lists:
>>
>> | gcc -E -undef=C2=A0=C2=A0=C2=A0=C2=A0 -I../include -I/home/dave/gnu/g=
libc/objdir/csu -I/home/dave/gnu/glibc/objdir=C2=A0 -I../sysdeps/unix/sysv=
/linux/hppa -I../sysdeps/hppa/nptl=C2=A0 -I../sysdeps/unix/sysv/linux/incl=
ude -I../sysdeps/unix/sysv/linux=C2=A0 -I../sysdeps/nptl -I../sysdeps/pthr=
ead -I../sysdeps/gnu=C2=A0 -I../sysdeps/unix/inet -I../sysdeps/unix/sysv=
=C2=A0 -I../sysdeps/unix=C2=A0 -I../sysdeps/posix -I../sysdeps/hppa/hppa1.=
1 -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32=C2=A0 -I../sysdeps/=
ieee754/dbl-64 -I../sysdeps/hppa/fpu=C2=A0 -I../sysdeps/hppa -I../sysdeps/=
ieee754 -I../sysdeps/generic=C2=A0 -I.. -I../libio -I. -nostdinc -isystem =
/usr/lib/gcc/hppa-linux-gnu/12/include -isystem /usr/include -D_LIBC_REENT=
RANT=C2=A0 -include ../include/libc-symbols.h -DTOP_NAMESPACE=3Dglibc -x a=
ssembler-with-cpp - \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > /home/da=
ve/gnu/glibc/objdir/Versions.v.iT
>> make[2]: /bin/sh: Argument list too long
>> gcc: fatal error: cannot execute '/usr/lib/gcc/hppa-linux-gnu/12/cc1': =
execv: Argument list too long
>> compilation terminated.
>>
>> Linux 6.1.36+ is okay.
>>
>> It doesn't help to increase stack limit.
> I suppose this was caused by:
>
> commit 4a1db15878aacb89e8f24c98a2f96fad6db3f967
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:=C2=A0=C2=A0 Thu Jun 29 23:04:57 2023 -0700
>
>  =C2=A0=C2=A0=C2=A0 parisc: fix expand_stack() conversion
>
>  =C2=A0=C2=A0=C2=A0 commit ea3f8272876f2958463992f6736ab690fde7fa9c upst=
ream.
>
>  =C2=A0=C2=A0=C2=A0 In commit 8d7071af8907 ("mm: always expand the stack=
 with the mmap write
>  =C2=A0=C2=A0=C2=A0 lock held") I tried to deal with the remaining odd p=
age fault handling
>  =C2=A0=C2=A0=C2=A0 cases.=C2=A0 The oddest one is ia64, which has stack=
s that grow both up and
>  =C2=A0=C2=A0=C2=A0 down.=C2=A0 And because ia64 was _so_ odd, I asked p=
eople to verify the end
>  =C2=A0=C2=A0=C2=A0 result.
>
>  =C2=A0=C2=A0=C2=A0 But a close second oddity is parisc, which is the on=
ly one that has a
>  =C2=A0=C2=A0=C2=A0 main stack growing up (our "CONFIG_STACK_GROWSUP" co=
nfig option).=C2=A0 But
>  =C2=A0=C2=A0=C2=A0 it looked obvious enough that I didn't worry about i=
t.
>
>  =C2=A0=C2=A0=C2=A0 I should have worried a bit more.=C2=A0 Not because =
it was particularly
>  =C2=A0=C2=A0=C2=A0 complex, but because I just used the wrong variable =
name.
>
>  =C2=A0=C2=A0=C2=A0 The previous vma isn't called "prev", it's called "p=
rev_vma". Blush.
>
>  =C2=A0=C2=A0=C2=A0 Fixes: 8d7071af8907 ("mm: always expand the stack wi=
th the mmap write lock held")

I think it's this one:
8d7071af8907 ("mm: always expand the stack with the mmap write lock held")

Helge

Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 583F75E95C7
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 22:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbiIYUBA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 16:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbiIYUA7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 16:00:59 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720622655B
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 13:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664136049;
        bh=SrZmauGvlsN5a0CuZ4tg+R9wyyoAWYK9KxwQDqXF83U=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=RPDW5El+YG+A/vnjdefKICNp7+Go4e1VzbgqBnCJRVQVysfGx3m72NyJpCLBhKf+T
         Wm5v2yu8Dyj+0qKXBdjcZ9EFYs+u6amE19uR6qaMCY5hX6d0epLCSVM+veWueTZE3s
         jqKscILcBIxko1piqP3NYF/atnYk9T9CPZAhg3lM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvY8-1ogxcn1MH2-00UrpL; Sun, 25
 Sep 2022 22:00:49 +0200
Message-ID: <4ab6bb84-f3ca-8900-237b-40c296d09b7b@gmx.de>
Date:   Sun, 25 Sep 2022 22:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on UP machines
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Yy/7g0NzOi/igNi7@p100>
 <d195aae3-b76b-1365-6e53-28c6791c77e3@bell.net>
 <92a8b235-7d04-9931-a153-440adbc8802a@gmx.de>
 <bffa9fac-a6f6-fc7e-0e66-5df215aef2ba@bell.net>
 <e2ffc031-0e62-8e2b-82eb-aac0460a453c@bell.net>
 <114efb2d-7f09-6a80-43d7-2a132146774f@gmx.de>
 <67ff767d-5db9-384b-f144-1cd34d9f4f86@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <67ff767d-5db9-384b-f144-1cd34d9f4f86@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qLg/MurE2kxC9vbURnZBvW3f6pcX19CFxGwSjouDh4W6Z7uLWs7
 MyCQyuY+zq+n1A1fP3cNMhFvHms87pOgtAygAr3sCGf7TNyv0SmKmDBjfmG5vBYApjzEwYU
 gcRgZjEciPRNHf8zS59vnZbNwGvPu9sloEfalPoJbi3gRxZZ0ujy/N/O9vXuVFjUohth2L7
 yEkko3ktFtJzLsI6Ih7WQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KthQq5NSyDI=:hr6hDBlh+f+bwmonV2xwOT
 1VTmm+WglRGwoU/AvKxbFVIGaBhTIQbVD/xvmFny0ILlpwfRCdI8eeIEC4TvLpIt+I/FwLhaz
 MsonrySsw0RCWinnaPnC3JYuwla/xbSl+r78+l+nkWNypJgL6hMlZKnTqWJ2SAUzTEOnJTrte
 hvIho1WWs/bj4bnpUC2VO7NGQH5L5Bi09n8RbEGdUGVDhx6suih8Sh89KVTakVzjTUbP9IOaU
 664s/37s9S2ZRJ1bx7Z/tTe/kdrFw1wSxb9r6v8r2xRIXy1CLP2HanG27Cuw/kHe6Er5eD4U1
 1DqUcohSgVRCKRr2jX54BOB05xe5kLkgBCzdj8CUQYfix5VpJNeZiy8MoEHZy2Tr0/4gcykGH
 16s/9KymlKDvmqQQ6Apzs3wI0qSxKhrjnO26lj3kaQ2mioULqCzKuyF2ZcvWUYvRpw0TteJOf
 iEN7ApWV38SKOSnMZk9Angxu0E+ULa4S3BEsInnGWx3QZCa7joWzwFJGDGXZIXZGrywLmTmgm
 HH+BxKXxi7sMJuzz8O33Ziyis2XaGSveLN9K43rxx+SurpJXFbu1SX4P5EdrEIbP8hOJFmwnU
 IKAlp3nJ2nsskAXadZ8C0PYlzHBUgYZyLJExFTVdcwJ1jGZ4yBEEoNCMB5pD19lEiFB8/kvD9
 S9TpArbMsFfKZbq6VCNRWlj1zn+3xWYOk/1Pi3whbqgUzCPC9uq1H73mnj/MsFIp6yAFjanMz
 S8vgCfOq9kGKAG385g/CnK5A+Hw+TFM2rrM/pYpGSl4k+COdO7ahM4K1zbMW49FhiKB0dHKmO
 EU0/iKND6xvmdLIIsX4iLlXsNLCP0HsZBA6kaDEfA1uwN1gvM00PydS92rNZFoHmKLGLc6QWe
 85/J2puZS/GCNjum2k2WIKRGg2jMq+AyUzJ0/hdWZkAikGHZurYjONZaHxVFgd3Vl7/Yhcb1/
 3FUGg3qb9nA8YHwkt6yO+9RYRhDZ44v4GLIno42w3+FvSDutw0oH1y4gXpWBZd31kSKi1Ivtz
 A7I2rYC9VwB55hd8dw5zW7YqGoQBczuy6B5aPofposlFIANQBnMO/cbZeuFHyZGzY0k+Is5z7
 tNR3J3UDzBVSeHkgL8I2mY80POsjkQRNp61ogfH+RAPAqlTjJxTSLxu6/lUXvkV9CCrWQsqzs
 OZdoWzHIw7KqnHwRajFcU4v7+2
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/25/22 21:27, John David Anglin wrote:
> On 2022-09-25 2:58 p.m., Helge Deller wrote:
>> On 9/25/22 20:44, John David Anglin wrote:
>>> On 2022-09-25 2:19 p.m., John David Anglin wrote:
>>>>> One=C2=A0goal=C2=A0of=C2=A0that=C2=A0patch=C2=A0was=C2=A0to=C2=A0dro=
p=C2=A0the=C2=A0CONFIG_PA20=C2=A0ifdef=C2=A0case,
>>>>> because=C2=A0a=C2=A032-bit=C2=A0kernel=C2=A0could=C2=A0be=C2=A0compi=
led=C2=A0for=C2=A0PA8000=C2=A0in=C2=A0which=C2=A0case
>>>>> the=C2=A0"pdtlb,l"=C2=A0will=C2=A0burn=C2=A0the=C2=A0machine.
>>>> Don't=C2=A0think=C2=A0so.=C2=A0=C2=A0"pdtlb,l"=C2=A0is=C2=A0available=
=C2=A0on=C2=A0all=C2=A0PA=C2=A02.0=C2=A0machines.=C2=A0It's=C2=A0not=C2=A0=
64-bit=C2=A0specific.
>>> There is some difference in implementation between PA 1.1 and 2.0. 64-=
bit register
>>> values are used in the PA 2.0 implementation.
>>
>> That's right.
>> But if you build a 32-bit kernel and choose to optimize for PA8x00 CPUs=
,
>> the CONFIG_PA20 is set and the local-purge is used unconditionally.
>> That breaks e.g. when running such a kernel in qemu (which is 32-bit on=
ly).
> I don't think that's a valid kernel configuration for qemu.

I agree - it's probably not the best choice if you want to run qemu...

> It only supports the PA 1.1 instruction set.  PA8x00 CPUs always
> support the PA 2.0 instruction set even when running in 32-bit mode.
The 32-bit kernel is built with the 32-bit compiler.
As far as I understand arch/parisc/Makefile, choosing the CPU type
just enables *tuning* for the selected CPU. See Makefile:

# select which processor to optimise for
cflags-$(CONFIG_PA7000)         +=3D -march=3D1.1 -mschedule=3D7100
cflags-$(CONFIG_PA7200)         +=3D -march=3D1.1 -mschedule=3D7200
cflags-$(CONFIG_PA7100LC)       +=3D -march=3D1.1 -mschedule=3D7100LC
cflags-$(CONFIG_PA7300LC)       +=3D -march=3D1.1 -mschedule=3D7300
cflags-$(CONFIG_PA8X00)         +=3D -march=3D2.0 -mschedule=3D8000

The only assembler instructions which break qemu are our manually
added ones: "pdtlb,l" and "ldd" (for flushing - see my first patch).
The two patches I sent today allows to boot such a kernel, and
they still keep the PA2.0 support when run on PA2.0 machines.

Helge

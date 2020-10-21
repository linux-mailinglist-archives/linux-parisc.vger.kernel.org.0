Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEFF294807
	for <lists+linux-parisc@lfdr.de>; Wed, 21 Oct 2020 08:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408511AbgJUGHl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 21 Oct 2020 02:07:41 -0400
Received: from mout.gmx.net ([212.227.17.21]:52059 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408510AbgJUGHl (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 21 Oct 2020 02:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603260438;
        bh=vvo3c9Vl95AKQ2dX/CixE6nBiCQzfZGn4tMW/lHpg7I=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=POczZfd5QqtJEWj+VCR5zuOkenOKYKi5h9jJiUBdnTbpzOjpOmkYtecqsRYmijwrD
         7GULWTMeLSqi+xBmy7d8mRBpQTvdf/4SGQXcawJbr1HlOT0FgYF5iP5dsMzWRbMwG3
         gfx2zQxZKFeVgK82p5yXQTjeNjER1Dwe2XE8MfgA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.187.237]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ81-1kyUfT2YfF-00WDKZ; Wed, 21
 Oct 2020 08:07:18 +0200
Subject: Re: [RFC PATCH] parisc: Define O_NONBLOCK to become 000200000
To:     Jeroen Roovers <jer@xs4all.nl>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20200829122017.GA3988@ls3530.fritz.box>
 <20201020192101.772bedd5@wim.jer>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
Date:   Wed, 21 Oct 2020 08:07:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201020192101.772bedd5@wim.jer>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XsBFwLAmz5cRCBWJe8UnjqAdrVQTo//dT40tTIinbIfRz0p08T3
 TILbJPlIj+C6iFAodmTfRn6x1XNr8i9HyNuKzc3b6vw+h+DcgZgirjc7ytslTnB3t+qTeix
 DLiGd8cY1PR4ifMEc/WrfYn5PkdAhxQzyoXUsgD3dDTy3/rynxPrcWj54K5AhXVHxUYiE0x
 +mQmRVrI8ZYmh+aTPGW6w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4j4AgTQzNCs=:2IzMP0+R9C4OPDtFQQgJh9
 E57yhKbr6J/WbSBfm6y3RWKuXfhCrKTvDiozlfZVXM9gA7+hJXcio6xx4V4Xnd+P+tG89JtGt
 yXrJNfuR1GELyD+E6nKw+eL0fgsvYnN5xJG40n+ZeHNDa/MHxQ1szftCJxcjTvCRiJCTdO1/5
 3EbAKyOibvGwUgq5JwkQ1WjlmTa7U3AjwMBVcC/K5Gb7x9aY/811c9xS7YKp72+vAEunOxdlg
 73M+kAL8d65vtw/8642elgcrHhiqm+0lt5E3Pgge+VFFD4WCe/7aO8dz0Z2NGuF9VWhWtuIht
 B0fV6QRJM5JtGAgQzAOLpKSHuHblygRUpwCJu1y4EcMdU4a3a7PdbMuUeYOS9U8e+DIw2aI3x
 2ooAsaezvi3HABIgZj/equ/CxZCzX26bydcVaSxA55cO0iThK6n0wahuh1zBD9uVF+k4ZctaL
 wKla1nzwhHXMuv8EpOaKzSNEHKQIYY6jvrcRz0b/hrooUmA+xRwvn+8ahwRorKsuxv0g/d/XB
 lpgO3tko8pP1GbAcsHpYi+pAmQMosk3N/dxIPs25SYzBAQ1NA1Y9LUQysw2x+rSM60i3gQ5US
 CNQfNXkrw66YmHusz9kCy2NI15zThhxy0/4VybN9pEXoJKge36FR71LGZ2JrWyWksns/idhMK
 t2a7nXNWrbFEEm7OVOjmyXKD0mOwHZ3+KgLuToZ55er2kmDxrqmqiCdxsp8Lqct6KE3Ys+euQ
 RUimt6/MV3g2y/7BeC6Ivs6ZTxOgn7rjJZ12lVFHAw3Aabw46/C6yrO2gSDYMZYDOI7cObGia
 mkw/cOAiZNjpK2aX7X/1D630wyqjtVV9pdiTXEQEcifSbuZD/nfvemLwUJrBaRJjUH88uUSuM
 qwgigsKs90EVbMr7zo7g==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/20/20 7:21 PM, Jeroen Roovers wrote:
> On Sat, 29 Aug 2020 14:20:17 +0200
> Helge Deller <deller@gmx.de> wrote:
>
>> HPUX has separate NDELAY & NONBLOCK values. In the past we wanted to
>> be able to run HP-UX binaries natively on parisc Linux which is why
>> we defined O_NONBLOCK to 000200004 to distinguish NDELAY & NONBLOCK
>> bits.
>> But with 2 bits set in this bitmask we often ran into compatibility
>> issues with other Linux applications which often only test one bit (or
>> even compare the values).
>>
>> To avoid such issues in the future, this patch changes O_NONBLOCK to
>> become 000200000. That way old programs will still be functional, and
>> for new programs we now have only one bit set.
>
> I am seeing a problem with this exact commit in userland, so I think
> that last sentence is incorrect:

Thanks for testing and bisecting!!!

I'm fine with reverting the change, but we really need to
analyze what is broken (and why).

In general the kernel sources seem ok as it's important,
that code just check if bits are set, not if the value
is equal to something e.g.
good:  if (flags & O_NONBLOCK) { ... }
bad:   if (flags =3D=3D O_NONBLOCK) { .... }


> The first sign (in the boot process) that something is wrong is that
> idmapd fails to start:
>
>  * Starting idmapd ...
>  * make sure DNOTIFY support is enabled ...
>  [ !! ]
>  * ERROR: rpc.idmapd failed to start
>  * ERROR: cannot start nfsclient as rpc.idmapd would not start

Could you try an strace on it?
idmapd is from glibc, so I'll look into it too.

> Then, elogind reports an error when I ssh in as regular user:
>
> [  297.825133][ T4273] elogind-daemon[4273]: Failed to register SIGHUP
> handler: Invalid argument
> [  297.825133][ T4273] elogind-daemon[4273]: Failed to register SIGHUP
> handler: Invalid argument [  298.040379][ T4273] elogind-daemon[4273]:
> Failed to fully start up daemon: Invalid argument
> [  298.040379][T4273] elogind-daemon[4273]: Failed to fully start up
> daemon: Invalid argument
>
> Yet the unprivileged user succeeds in logging in over SSH. Following
> that, sudo fails:
>
> jeroen@karsten ~ $ sudo -i
> sudo: unable to allocate memory
>
> root can still login on the serial console and over SSH.

At first thought I assume those issues are not related to the O_NONBLOCK
patch. Can you try strace on the sudo too ?

> Would it make sense to rebuild libc against the newer kernel headers?

Yes, might make sense, but then my patch isn't compatible.
So, I'd like to avoid that.

> Or is this an unexpected result from the above commit and would it be
> useful to figure out what is going on while the bad kernel is running?

As I said, idmapd might be related, the elogind/sudo tests needs checking.

Helge

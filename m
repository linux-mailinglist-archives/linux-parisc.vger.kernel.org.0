Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2A33FAE81
	for <lists+linux-parisc@lfdr.de>; Sun, 29 Aug 2021 22:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbhH2Usi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 29 Aug 2021 16:48:38 -0400
Received: from mout.gmx.net ([212.227.15.15]:49779 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234667AbhH2Usi (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 29 Aug 2021 16:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630270056;
        bh=fiewBWCc7GrPJ+YLf1HPOer4XnV9sdQjuHJ0rR0S5Ls=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Dk5WOFKTMqxV4q2x3kaCpIq06rtTsiFj3zqfsdPfweNgmVvYu11amI2T8TWIYpOKj
         G3TREXzrhZuX4nusPaPO3Sb3eZr54vIrSies1w8tNwI9LFYxHO+N173kVxjW3Xxo7n
         ikfxytws7SjyFGw52Bm3IySkddM7cQPPPBAp9e58=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.150.237]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ7v-1mYM3m3OD7-00WGc4; Sun, 29
 Aug 2021 22:47:35 +0200
Subject: Re: [PATCH] parisc: fix crash with signals and alloca
To:     Mikulas Patocka <mpatocka@redhat.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
References: <alpine.LRH.2.02.2108291530440.5661@file01.intranet.prod.int.rdu2.redhat.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <e890c401-a745-ad07-cfa5-bef61d3d8e46@gmx.de>
Date:   Sun, 29 Aug 2021 22:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2108291530440.5661@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R7lEDrUOe9rdxsBQk+LuYU3nlTWGA51A2dRxkHRHar6jWpNje6A
 cqdsxTIw3+NsysoxD3kK/nBgsMSnnkIDD1sjS1OnCOiOycWXqMkJqAndDsGtqCbrkSJlPLD
 3NzEDfk4+IE1YGOrHhErCDsD7xqYegUE//88wpJxb0Uc5N2TpqWIh8h8TdYMwimPJ0WKvpq
 9KW6MMEpQ2tKlGUGhWXFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pyo8aF9VKVs=:i7iRmP7veif+Orq4lSp33x
 n4qCb6PaA/x4BO0di58+Xk6K1v5cxtc7MecKScUXQHmh5xCGKqZh/OIgUVzWZbc/aPmnjUQtg
 zFwlWLgEoxRI4xpG0IdnBbIJjyLYuBwm5lJNRiLkjYPQqqkZYe6zHu/0YVV5d7iuP5rHaCW2t
 viktAl+3chHCq8McK4E/Rj2nnKh1bcUyazFIjBpWwc1ahfyLlKHO0AV9xZA6sNopby84zgLvw
 G2tURNWkSiQi4195cEX+OaPEvqa0RWGKuENokKVYEYpqQqyIf+x/ZjRSJAZEE91+4quLIoR8h
 0shFETHRBnN3hEF3hGxlRClBUleC4bgOk+Afrwrd9pwzcBd6GkqWfRFWl0QkIXoD1VvxzmI9H
 WO9VP3nGtj0fEGwx3hMRvZh+IRpyyXYfxyPSVabb0j1i5MFqm7GKwChi5fugD/ozNFKzcXV7W
 UYKiOBw9OPfsm8x1+OoXx6twFSmFyc8jfVO730UnPgn0DYMw2IG/R4ATIeDyB9i39/jQCESEn
 XN2Glpak858DnbRR6R+i9/VG6Z0WyiJ4nr0JjxXrBzRwxFbM2lre5j4iUXaEI5tl16rUHqFY4
 Nf84EH2N17pyJb6GWe8nQgQoj8XGr+nKjCfSt4+yj5OKWTV1ZQzeUh1UNo3bzUjuJ+5wOQVJI
 BRmRx9YYipckUeZ7RpWspbBo0zALxy5xPYtjMaixVGxYy+mVspKzT3FFZJoqGPPy9LIb5Quij
 URwcoBN9ZbbfvvHWZxGMT9dt85LAkn59Y1nZYIig+JPPTJnWMwKukhMn+F0ttYhZhwnWZCQF6
 ymRiT9ohXDVaTLxTnXDOm8VzcKXAoFyRQMCWf5ZI4v6V883QLAazA8AsDJuukI46KJHZ66rh0
 +P2qvOuW1Q6+jaybKp9PGP2i9zKZv4Pw042OIo0Yt6U3QRc3btQeV8/FJ91eOcjO+SXq8HwDJ
 JCR2tLkQzifEz3goDcrHcxuAfM8kDfXgutWv4azgpSk1EoeYZBj4fdiS3WguzVHhlw0vN85EF
 utvZuSgEYbqQVcEo7CqsGuCkhJBiSZV/Q1qyPgS7jb0udvdDCssLAxRTEC5cIjuy5fN3te06A
 YUlfn/WmoQGf/bo80gR7gn9GpnIShHNqmpv
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/29/21 9:50 PM, Mikulas Patocka wrote:
> Hi
>
> I was debugging some crashes on parisc and I found out that there is a
> crash possibility if a function using alloca is interrupted by a signal.
> The reason for the crash is that the gcc alloca implementation leaves
> garbage in the upper 32 bits of the sp register. This normally doesn't
> matter (the upper bits are ignored because the PSW W-bit is clear),
> however the signal delivery routine in the kernel uses full 64 bits of s=
p
> and it fails with -EFAULT if the upper 32 bits are not zero.
>
> I created this program that demonstrates the problem:
>
> #include <stdlib.h>
> #include <unistd.h>
> #include <signal.h>
> #include <alloca.h>
>
> static __attribute__((noinline,noclone)) void aa(int *size)
> {
> 	void * volatile p =3D alloca(-*size);
> 	while (1) ;
> }
>
> static void handler(int sig)
> {
> 	write(1, "signal delivered\n", 17);
> 	_exit(0);
> }
>
> int main(void)
> {
> 	int size =3D -0x100;
> 	signal(SIGALRM, handler);
> 	alarm(1);
> 	aa(&size);
> }
>
> If you compile it with optimizations, it will crash.
> The "aa" function has this disassembly:
>
> 000106a0 <aa>:
>     106a0:       08 03 02 41     copy r3,r1
>     106a4:       08 1e 02 43     copy sp,r3
>     106a8:       6f c1 00 80     stw,ma r1,40(sp)
>     106ac:       37 dc 3f c1     ldo -20(sp),ret0
>     106b0:       0c 7c 12 90     stw ret0,8(r3)
>     106b4:       0f 40 10 9c     ldw 0(r26),ret0		; ret0 =3D 0x00000000F=
FFFFF00
>     106b8:       97 9c 00 7e     subi 3f,ret0,ret0	; ret0 =3D 0xFFFFFFFF=
0000013F
>     106bc:       d7 80 1c 1a     depwi 0,31,6,ret0	; ret0 =3D 0xFFFFFFFF=
00000100
>     106c0:       0b 9e 0a 1e     add,l sp,ret0,sp	;   sp =3D 0xFFFFFFFFx=
xxxxxxx
>     106c4:       e8 1f 1f f7     b,l,n 106c4 <aa+0x24>,r0
>
> This patch fixes the bug by truncating the "frame" variable to 32 bits.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
>
> ---
>   arch/parisc/kernel/signal.c |    5 +++++
>   1 file changed, 5 insertions(+)
>
> Index: linux-5.12/arch/parisc/kernel/signal.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-5.12.orig/arch/parisc/kernel/signal.c	2021-08-29 19:06:33.0000=
00000 +0200
> +++ linux-5.12/arch/parisc/kernel/signal.c	2021-08-29 21:17:55.000000000=
 +0200
> @@ -246,6 +246,11 @@ setup_rt_frame(struct ksignal *ksig, sig
>
>   #ifdef CONFIG_64BIT
>
> +	if (is_compat_task()) {
> +		/* The gcc alloca implementation leaves garbage in the upper 32 bits =
of sp.*/
> +		frame =3D (struct rt_sigframe __user *)(unsigned long)ptr_to_compat(f=
rame);
> +	}
> +


Very good catch!!!!
I'm just wondering if we miss to clip the sp somewhere earlier in the
kernel call chain (e.g. in the irq/entry handlers), or if the clipping
should be done somewhere else, e.g. some lines above here...

Helge




>   	compat_frame =3D (struct compat_rt_sigframe __user *)frame;
>
>   	if (is_compat_task()) {
>


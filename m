Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9935A1F85D3
	for <lists+linux-parisc@lfdr.de>; Sun, 14 Jun 2020 01:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgFMXJL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 13 Jun 2020 19:09:11 -0400
Received: from mout.gmx.net ([212.227.17.21]:51341 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726258AbgFMXJK (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 Jun 2020 19:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1592089715;
        bh=jnVcnFBff2T/un5fgbc7oUacNUtfZQxS34DA1FEN64o=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=JkoPejafYkkBODOIbvxAiFGCva6N/enHvBYVzUMgVEAjGmufGqMvkaJ6hjL8+G26E
         XqZSO1r706UMMRfFcqrmsmZDTnlQwYZfINAywphwgkbo4z584OckWOrDENTYCd7cXv
         mvNR2g0EkvXpcKHRRx18/76oVdNJGkl+61OTgay8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.151.203]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7QxB-1ipwq62Bn3-017kMx; Sun, 14
 Jun 2020 01:08:35 +0200
Subject: Re: [PATCH] parisc: Prevent optimization of loads and stores in
 atomic operations
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Rolf Eike Beer <eike@sf-mail.de>
References: <55841e49-cf36-e49a-5b33-7b60d3275e56@bell.net>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <aca3f8ae-1cf1-6920-ef6a-7a3585dd1d09@gmx.de>
Date:   Sun, 14 Jun 2020 01:08:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <55841e49-cf36-e49a-5b33-7b60d3275e56@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:35uPYGUDHLyEBcReIFjvEGmg8UofoVgNPp6XaNrm21ieXDoGrei
 MDDqErpRSjKqB2nswWb/VrHOsoxBNiFWZwkGPOeQVj8yOLDha7Qap2/LzEIRIDvylQOoF50
 s4nXdm/wu7uFZjh5FR2tUtZXyzFXDgG60lRrRHllHAoLrroeADtf87/ySxFFmLrqsrgL5ZL
 pQrBASEl/PT650qCX7UuA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yAZHiBl9ryk=:2qRuh4ALrVmvgCgr9dvd/0
 pBgygNkOydoBiJQdkF331f8pshG6nLUNlNWsvh7nPtJXf8xmWY3UaJNlHhW/H6sqmWI0sGma8
 Y7DfcW9Sd7Snljn8/GuoAPGOrjhX6NYz35dFVF+lAOdfI8im+2er4xr63MbhN0LnCL0EdE75i
 tJpHgQu/IrtoP8UBNT0nL4baS7Sqx7srGcf4/a6Gd4iXfY3YA8LMh0NeXEouRIyll+nbv7Y+7
 +Te7oLAUte2l0oYY3oeXdHHFiO6+Z+l+4gdIpAK+f5VzgxDwyeJmDd7itdxkwo71irfxZSAEU
 43bVSrFvxSxndt3Rn5NsSmSsglXiwSpyoemkb9/6k828Vclf0kd28HFnKGdvoKOY+dbDIH2cC
 8U6ny43Kdsvw7iTLlB6txLTQtF0BOrCOOfMhw7WdBFNqWjpKUAjeuZQIgRTpgII1a9nj6eeLQ
 eHWhFEYwuvO8hzUjNt1A15XM9x9W5on5IjARZUXNu6Qnz73JX89AyuF9s7TI+Slhw5D20CY88
 LiVMiQpiDj29DuQlTmh9inzCKJ0cmYAVa6y75oEvL7YqZBFbOAPgpHVeRzY5LcumolK0X7KM5
 ER26hxfVjvKKXcSQaP3Tby2DzWC2Ea/qhGVW8Vdtbs5LJW3h9Bp32C7zCWcnkXghn0XvfQPSy
 +p31eodtQAhx9jqE+1tdEB6DXzw+h/rwuNDKs8eUVhPuMY1zuZjnb+ZQE2sPGFpUK+ZwGZhv1
 1+eolucJWt1E5Fz0l7uIHLg1ftN5OeeG6FTMA9D73hYvSy/4fgHOepVG4Eson7o9Ph/jrsnHf
 9EperdX7oBASZi5BLRzBHMv5g9nwYqsmZeS0A6fgYqsJKQwO/OMx1ys/OydovHP1Xhnqc/6KZ
 +6r6aixKXopRbzMPw8eaGGWiQxZ7iYZtP9igB3vNAo1wAVMSM3Yo7GhiRsPBTRJC25+aEVgZA
 Nnumi4RMlj5/LIYsXVENKO4onMx58aZmQGxodcn5T7Lj3nB+SmER5c1edCNTjjVLMztHilBq5
 7V8lxnHar4U4TMy2TRWKqhNBTZiW+R3A4ebvkd3X6NSTcx3heDPjTDqHn/h6BlhcuB+mT1isP
 MvMKwC1ukv7q5FllkO4NgBTlzMr14lMc4G5KkqKpuTfEwlBLnpJvh1DDQW6onBK9ZiSJxjE8M
 RHTMtwhwn7N/i8a06uKLPGDwX9bFNZ0pfpPaWfZzO0WWKRy0jt9dAvVbn9vjnxeGDs88taUG8
 yQ6zLSjj6z0ZMKz4Q
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 13.06.20 17:20, John David Anglin wrote:
> Stalls are quite frequent with recent kernels.  When the stall is detect=
ed by rcu_sched, we
> get a backtrace similar to the following:
...
> The fix is to use a volatile pointer for the accesses in spinlocks.  Thi=
s prevents gcc from
> optimizing the accesses.

Very nice finding!
If this really fixes the stalls we have seen in the past, then that's a BI=
G step forward!

...
> diff --git a/arch/parisc/lib/bitops.c b/arch/parisc/lib/bitops.c
> index 70ffbcf889b8..5904966ca957 100644
> --- a/arch/parisc/lib/bitops.c
> +++ b/arch/parisc/lib/bitops.c
> @@ -21,11 +21,12 @@ arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lo=
ck_aligned =3D {
>  unsigned long __xchg64(unsigned long x, unsigned long *ptr)
>  {
>  	unsigned long temp, flags;
> +	volatile unsigned long *p =3D ptr;

Regarding your changes to bitops.c, can't we instead
simply tag the parameter ptr with "volatile", e.g.
 unsigned long __xchg64(unsigned long x, volatile unsigned long *ptr)
 unsigned long __xchg32(int x, volatile int *ptr)
 unsigned long __xchg8(char x, volatile char *ptr)

Helge


>
> -	_atomic_spin_lock_irqsave(ptr, flags);
> -	temp =3D *ptr;
> -	*ptr =3D x;
> -	_atomic_spin_unlock_irqrestore(ptr, flags);
> +	_atomic_spin_lock_irqsave(p, flags);
> +	temp =3D *p;
> +	*p =3D x;
> +	_atomic_spin_unlock_irqrestore(p, flags);
>  	return temp;
>  }
>  #endif
> @@ -33,12 +34,13 @@ unsigned long __xchg64(unsigned long x, unsigned lon=
g *ptr)
>  unsigned long __xchg32(int x, int *ptr)
>  {
>  	unsigned long flags;
> +	volatile int *p =3D ptr;
>  	long temp;
>
> -	_atomic_spin_lock_irqsave(ptr, flags);
> -	temp =3D (long) *ptr;	/* XXX - sign extension wanted? */
> -	*ptr =3D x;
> -	_atomic_spin_unlock_irqrestore(ptr, flags);
> +	_atomic_spin_lock_irqsave(p, flags);
> +	temp =3D (long) *p;	/* XXX - sign extension wanted? */
> +	*p =3D x;
> +	_atomic_spin_unlock_irqrestore(p, flags);
>  	return (unsigned long)temp;
>  }
>
> @@ -46,12 +48,13 @@ unsigned long __xchg32(int x, int *ptr)
>  unsigned long __xchg8(char x, char *ptr)
>  {
>  	unsigned long flags;
> +	volatile char *p =3D ptr;
>  	long temp;
>
> -	_atomic_spin_lock_irqsave(ptr, flags);
> -	temp =3D (long) *ptr;	/* XXX - sign extension wanted? */
> -	*ptr =3D x;
> -	_atomic_spin_unlock_irqrestore(ptr, flags);
> +	_atomic_spin_lock_irqsave(p, flags);
> +	temp =3D (long) *p;	/* XXX - sign extension wanted? */
> +	*p =3D x;
> +	_atomic_spin_unlock_irqrestore(p, flags);
>  	return (unsigned long)temp;
>  }
>


Return-Path: <linux-parisc+bounces-1681-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF1191713D
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Jun 2024 21:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D0252875D4
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Jun 2024 19:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CFB144315;
	Tue, 25 Jun 2024 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="n/WcS/8D"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6217671750
	for <linux-parisc@vger.kernel.org>; Tue, 25 Jun 2024 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719344937; cv=none; b=KCynOQnson60+h4coWJLU7qejhYQxNwuaIGbuwURmswE9qU74w+DbzMiq6trboGfO9UjlRqntwLruVbSFqOMl+LSr6qToRMSr4mvrDB0NItRV22jqvatCBJJpu3y22UGqDUjylJckEQZ1wN2/KZRGdSMW+TTTmqEnn7ePiiMPA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719344937; c=relaxed/simple;
	bh=zlaYS1kXeWUtowvQ+glkiYfWUfN2YbiQ6+Q9eOGbWeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Eqwk6em99FMYnGsf1p2CDlBhk4NRCC+0mP6GZizm0T4qlv042zj9FB/mbhOOS936wHWK6IGpHzL3K8dHKNqLGu16kn9HG7DVQVGbZF/+prfMeUTKyacYc4/fm8z8117GZVqFyN4HXpst8dn5nBD3EGazFfH62wnIoyxB1znztuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=n/WcS/8D; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719344924; x=1719949724; i=deller@gmx.de;
	bh=QtSUnVDOBm9BxNWonlgF67fR0pP7735geHJnRdCD3fw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=n/WcS/8DzXeQ6Dif9iIeYrKwQTBUzdy/vkIT7Nj2S96dvdxHDfbodjOerg+rzdwB
	 QEFT7OaxMtb9GPUkeyXFs9dSVqrMu9FgRiBItBF3WJ0YO3EG9QqG0U5CfTGVLvYz+
	 upgnxfgh1jSyn0CODbsRd8yRwMipkR39IhlQhIQ2jyk5UY//lZpaX9RHlfyQRKG4X
	 84dqq0zwkQf/CEi29kxN3Ld8GY/0iglnhZZqYvMb+cFgKFLR9/40ktdYl+zxO6+bd
	 3M71U4kte5+VkQ410qtiqEZRUdOXGBFmk8EDhap3PQ3BQqHkiHpxVjXZbAsmfcDHf
	 RfJsuPSL5SsbgP4lyQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.133]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KTy-1sUgSv33GE-00ybe6; Tue, 25
 Jun 2024 21:48:43 +0200
Message-ID: <47136a43-058f-4258-bd1b-3475fd7ea14a@gmx.de>
Date: Tue, 25 Jun 2024 21:48:42 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hppa/vdso: Add wrappers for vDSO functions
To: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
 Helge Deller <deller@kernel.org>, libc-alpha@sourceware.org,
 John David Anglin <dave.anglin@bell.net>, carlos@redhat.com,
 linux-parisc@vger.kernel.org
References: <ZnXT9hNtYWLg9MID@carbonx1>
 <fd19f26c-0ebf-42ef-bfc3-686a82104d07@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <fd19f26c-0ebf-42ef-bfc3-686a82104d07@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:himhYW18dT2crdCekRbTiRr6ihdYDqD4pTd5Xynf8SBMSy6wD7l
 5y36gA7P/XFtY0wwj4hKu9EUtecbO28+3HcHnGHhVccWvUSCIu1kNUlSvGozAIh6tZPF/KS
 v4yy05MvQvTcx8YPXRX/4A8mhSNuMuxXWf/Iw9FSPWIStKqeAoA1GbrqH97HGwzQFZOPHNJ
 v1WuPqzyRay4bp67Wx57Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rUtbSJsBVZw=;hIyrl3Udawdc4FknYq/1Z/iq5v6
 UUZPrCZ0nYhZBZoltXMNRZYutPKZKcEdMDixztDHDqXX/M49tOyqRukPADJ2BovGBJCY0Mi8X
 OAQThHTnxtidvjy052vgAHHWZgj7XbXLgIqepB3Tp/dxgwm91iMzBWV44OczVUU/4pharuQkF
 iCpgLbXdUlJ95TrP/SRv05A79QWQtYWDmqAfByCQ9plBOhwtReTSxPPCwL3XY7oMz6VyuGr2R
 0ktxldlMxBJh0L1Qbl+w0rH3Y6xlYGMuTyEWTopa5gcIxePG2flq30R0ZZAYb8NP3A/PMg6uO
 KZxYwCRny2M8Ezyue27UMJ2Ku/awQajx0sSlrFq93zqkRl+U3WEHogS8ZTEd/cT1FsUeH3rjq
 xiikM1mRBxSVNAI5zZkP7aL+dqYE3ep0u6uqLjdiabEfcQZOwkLKl4+BMndcoRTxV9HPXpedB
 ByZX3Vj2v6gcWNB7E8MoftYqIqkLMYMYdGMRBkIlbHZcufw5LdtKRyiI98OvQFellEKl8e7CM
 +mSxDRDtJtspvo+JIibIzQiJ0A3qGPAXrvjn3+F0UOd0urjDI3bmrFzBfmttNvWJvoIQxP7pV
 KxSC+/e6LR+byGJ5DajqfHeaTcWrp4vy3/EiKhJJKzV4rO3oNDFievySRC6yqxfidND3Ar9Qx
 9TK49lH7m5/Pk6lP6tzSO+DZCtdaNU1dDTJS4OdX7F6lL3GMDxcwubDcFshHMg5lx9TRsoEky
 bT2zFFtYi7V1UJULA3gG+Iba15xMgVRtQxtA8z90Qd2/NVyEYmu6PpldQ4Tkujx+YccyVzpHL
 ozu0OYMMiwPoQK6Z7pzIx7ZNySBEZlX3F2KCMNMWSKTmc=

On 6/24/24 22:31, Adhemerval Zanella Netto wrote:
>
>
> On 21/06/24 16:26, Helge Deller wrote:
>> The upcoming parisc (hppa) v6.11 Linux kernel will include vDSO
>> support for gettimeofday(), clock_gettime() and clock_gettime64()
>> syscalls for 32- and 64-bit userspace.
>> The patch below adds the necessary glue code for glibc.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> Changes in v2:
>> - add vsyscalls for 64-bit too
>>
>> diff -up ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org ./sysdeps/unix/sys=
v/linux/hppa/sysdep.h
>> --- ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org	2024-06-15 20:20:58.992=
000000 +0000
>> +++ ./sysdeps/unix/sysv/linux/hppa/sysdep.h	2024-06-21 19:19:02.1320000=
00 +0000
>> @@ -468,6 +468,18 @@ L(pre_end):					ASM_LINE_SEP	\
>>   #define CLOB_ARGS_1 CLOB_ARGS_2, "%r25"
>>   #define CLOB_ARGS_0 CLOB_ARGS_1, "%r26"
>>
>> +#define VDSO_NAME	"LINUX_6.11"
>> +#define VDSO_HASH	182951793
>> +
>> +#ifdef __LP64__
>> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
>> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>> +#else
>> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
>> +# define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
>> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
>> +#endif /* __LP64__ */
>> +
>>   #endif	/* __ASSEMBLER__ */
>
> Not sure why you have added the gettimeofday support, currently 32 bits
> it is already routed to to clock_gettime (which will use
> __vdso_clock_gettime64 anyway).

Yep, you are right.
I actually didn't checked if it's being used but just saw it's defined
for other arches too, so I assumed it to be used.

> For hppa to actually use, it would require to add a way to call it
> for !USE_IFUNC_GETTIMEOFDAY gettimeofday, which I am not it really be
> an improvement here.

Yes, that doesn't make sense.

Looking at the code it seems riscv, sparc, arm, mips and s390 define it
too, without being used. Do you suggest we should remove gettimeofday
vsyscall from hppa again (or just keep like the others even if not being u=
sed)?

Helge


Return-Path: <linux-parisc+bounces-2728-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F355E9A0D88
	for <lists+linux-parisc@lfdr.de>; Wed, 16 Oct 2024 17:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D7461F23981
	for <lists+linux-parisc@lfdr.de>; Wed, 16 Oct 2024 15:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F3282D98;
	Wed, 16 Oct 2024 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="E0AnlBma"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E941EB27
	for <linux-parisc@vger.kernel.org>; Wed, 16 Oct 2024 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729090858; cv=none; b=rTh6nGZP4n/OmO1qrJZFRYyzoJHHWsSjgy5mvq7xxrlXura3XK7iUvUMZMQWhSHjxMIm3C3OJkVYC1dXxOGmr93fin9hEniDPHGcQzrIJ1QbwxLxRu0Wu5O4ZWsIk1un3cmmh7ujAnYvY4JglWO+LmkPjgPpMGRnD2cyXds+yp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729090858; c=relaxed/simple;
	bh=wabeuKjPlHtpvesIZ1r1UvjQlSgC+6u3KamrrKPyUbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=truKcDAArfbKegVW4WNfcGDUEzeGSPVqhNFE+GYDV21QwZrlPjUVuz7+O3csT5jg7o3LbhUmEZfl7PgJgYxf3wEMNZVMzcLRQDaa7kf/q8EYrRMw/ppzFjAk6T3yUSuChLU6asyI56KZuH09RIJZhs/LZknFTYcEb3GzOA6xnww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=E0AnlBma; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729090852; x=1729695652; i=deller@gmx.de;
	bh=wabeuKjPlHtpvesIZ1r1UvjQlSgC+6u3KamrrKPyUbg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=E0AnlBmabKb7ZvD3MMGKfn5CZocEIbXm5tjzDewAUC+O7dBpKPnVfJnV764G0moa
	 P8wswNxSPfV0wMDyGvGCvCku1HkrPvWtS1lDuQ8YfefP5bScPEkbj38GuTSqxKUXq
	 j5n1aeOfzd5EEQWQo3ZvYNCBQyuwmbiNu+tQcWurIoFHmd+TxKTItlchHASkT+s3X
	 e0G5dCGyzNBOTQQ5/fAur/tOOnu1O8wXKEkAuo2pj+/sAl8j/0AFqvMaHzLSjtulo
	 PVUXVGCBO8InZETDX0X+ZCuldFRJ+dHWRr46DUdwxBPwXRTJQAur+g96q8mKs+eAQ
	 ncXj2UPz+xoxMa0ZaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbkp-1tJzBf2OOx-00P6DO; Wed, 16
 Oct 2024 17:00:52 +0200
Message-ID: <333db349-e721-4093-9918-7a6b7e62dfb3@gmx.de>
Date: Wed, 16 Oct 2024 17:00:51 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Migrating parisc.wiki.kernel.org to RTD
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-parisc@vger.kernel.org
References: <20241011-fine-bold-quail-2d60be@lemur>
 <cb65fcea-3a45-4b96-a96c-e4480a12d6b4@gmx.de>
 <20241015-shrewd-mayfly-of-coffee-3802f0@lemur>
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
In-Reply-To: <20241015-shrewd-mayfly-of-coffee-3802f0@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YWK5jBQy3UE0pJHNjAkvS73vO7zt7lPxLkEYVaQEeE1F6yUUa5h
 v9dY2t0welSG6HgSl/mn9PW08+anrli3EiUApOhdHJHbTUd5P5KyDksdg2kwRY8opUOlY8C
 bZD5BhAT6HqGocj1c4DUg7xmt99mS1iVzJ0tPU/bC0PFIAbjwU2cJUWzxsvaM4GEizkYbXb
 lGFxVMatikcPUM5zoRjhw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JqXRg4LwV28=;OYdirsjoyDHv1tml0NOcZcAoeA9
 1ehZu9Qzw8ziKjTuxGLosekKLj6C/EGgroS1BylNYSGENyVwwe/NoTlFcSNPd6By7IwpT4MNQ
 QC4KqzsjE6kKb8mmxPQBASHYYe1hWPlpCoM+Yy6WqtYW1oKQO42e8BVZZuWeYUMWPU+ate8Q2
 Uv4Cr3uhqJw5DxQ0snPt4WHy+qaiO0on8VB1rTViB62qPu27GshYqwMC9kZsYFeDjdsOS66Sb
 jj/kAFjFAOcQZXTSfiFM73Ls6b/pu3UKH9dy6rUFIp6zHOAykenjn4URTg+yiWw5MwtxWJugQ
 bLuxCx+tKYnvWG79sSS1DjWPP9tPYVWzU0YHsEOe6i9YvdTXdVLV9SbtjR6NGSPP1k1pM6OFI
 G/wBfxkQiqmHxFrucQeFC1HRjcXcPTcfV5uY5IcELIflFDA7DGLJpZUfoZWeXL0fm6R50CG2D
 xfheh0LgrqlG3m9NAX5OD4OlDZZAWCLUh5q1YNNp6tlSjlaRPDXFRUCoO7TbA0eW1xVkiY2y9
 /EUfoXAtzDswgFjDFdRsBh8PAZjYLAOguzNbnxemqzvXQXQjCwd9x0qexOzEa1W60LIQLuILu
 /YWYkwTJGOS4uaBpDnDnAY+ZruCohgPDDfLKbv1bWsLXsDMR2KK39IBlsOH3vHZ9ckF1dTofy
 D70hcFVMQxl8Q8Us9JwyAcGpbwxYPO0qrzQ9re2YFuIVqV0Ceolho8wh/5/SgYCYV1s3Cv+wK
 ntgKo/wx8AQek85P08TiuO+ImmIvsxtZ3m70l0dWzf21J+z4zcKKIdQzu/D4w3DtguyLmlc9Y
 TUQLZvlmN4nsHNqPQkWmGLWw==

Hi Konstantin,

On 10/15/24 18:32, Konstantin Ryabitsev wrote:
>> I have not used RTD yet, so maybe someone here on the mailing list
>> has some knowledge and want to help?
>
> I'm happy to guide you along. I've added a readthedocs.yml and
> requirements.txt files to the repo:
>
> https://git.kernel.org/pub/scm/docs/docsko/parisc.git
>
> You can clone it and then push to your github or gitlab repo. After that=
,
> generating a readthedocs build is very easy:
>
> https://docs.readthedocs.io/en/stable/tutorial/index.html
>
> If you follow that, you should be able to get a build of the repository =
in
> 20-30 minutes. After that, you can even edit the documents directly on g=
ithub
> and have them automatically rendered.

> Once you have it working on the readthedocs site, I can help you configu=
re a
> docs.kernel.org domain

Ok so far.
https://readthedocs.org/projects/parisc/
https://parisc.readthedocs.io/en/latest/
source from here:
https://github.com/hdeller/parisc-website.git

> and set the redirects from the old wiki.

Before setting up redirects, can you help me with this error:

deller@carbonx1:/home/cvs/LINUX/parisc-website$ make html
Running Sphinx v8.1.3
loading translations [en]... done
Extension error:
Could not import extension sphinxcontrib.applehelp (exception: cannot impo=
rt name 'SkipProgressMessage' from 'sphinx.util' (/home/deller/.local/lib/=
python3.12/site-packages/sphinx/util/__init__.py))
make: *** [Makefile:20: html] Error 2

Helge


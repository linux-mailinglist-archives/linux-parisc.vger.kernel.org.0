Return-Path: <linux-parisc+bounces-3804-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B76B10F74
	for <lists+linux-parisc@lfdr.de>; Thu, 24 Jul 2025 18:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADBF81CC840B
	for <lists+linux-parisc@lfdr.de>; Thu, 24 Jul 2025 16:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37318260578;
	Thu, 24 Jul 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="Uhbw3RNW"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE7E244EA1
	for <linux-parisc@vger.kernel.org>; Thu, 24 Jul 2025 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753373700; cv=none; b=PO33CmtiHpyEG8uSpx61pzQ5iNApAh+a800VrtfR1WZOTNCbWvSAp+NPzi6Jz7nzvDejHsCPtajNgMaDxwqIOIqNS0yeZswxupGy4tkjFCxvHBzEJ6XXX9BIgf5irDHY0pnpDemvNbYkPIR+Mi5VT/nwAVhV3upMTAkIINohAkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753373700; c=relaxed/simple;
	bh=jj6d7WiNX+gUrTJY0ZZBpTTKyRvMc9EodBVfOWM3i/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFSQXxoplaQSxb/6fobLh69WnJQ6eDDwhtESBhDWuf5fXcY+4dkVEeQXQAH4c+Uu7x8UnUlrWO71uo0rz9f+E23HGapdw3Qi0ajaZ3K6kWqYK8eGgMQViSDDk8jhuF5vfIm37MuMrbqUadjE3qjISEX7sSk7oWeMrxa4Z04OyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=Uhbw3RNW; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753373691; x=1753978491; i=deller@gmx.de;
	bh=xCP0WXqabFVwyFEuF5ksdcIMazFdntHkaTW2a1kkkrY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Uhbw3RNW2x+bB3Ue4CHoBqQxZnRUQXPhwLYdXj5678+TmD4XVclewvcaXuQJntbp
	 4z+J+QDZNa1cgz98OyeVUQI/MK1JH/Ipf0pbR7wwzgWb4d/6tvZjgtxFq3uM2kn/D
	 Y7HoMDYwEsnHs1sAuDl6MjNtzYoIx5DcR7UB1L7az8x1OOAaLqdEfr74tFPfJHeJu
	 UY9CzBsiWSDN2wOcadI9O6kFal9uZtcpOr9RA7s3ZXxs4oZv8s9laM/+jhCJkIFLR
	 M5PNXcwPgqpyqQ/2BWXdkPBvHGkr+7GNUBPnWye4orHPreu7o4GU1z3j3HV5VRzFt
	 ibvCcdlpQTLP/Xj7qg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfJX-1uQSkH2z7v-00vkzd; Thu, 24
 Jul 2025 18:14:50 +0200
Message-ID: <2923e512-36f6-4cf3-9606-18031167a93a@gmx.de>
Date: Thu, 24 Jul 2025 18:14:48 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [thomas-weissschuh:vdso/unaligned 1/3]
 include/vdso/unaligned.h:21:9: warning: '__builtin_memcpy' reading 4 bytes
 from a region of size 1
To: Ian Rogers <irogers@google.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-parisc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, kernel test robot <lkp@intel.com>
References: <202507231135.OtEGYfnQ-lkp@intel.com>
 <CAP-5=fWXcGiWXeb8=165tCVtEAYX7qkVUpanbpmg=Db=kwEP0g@mail.gmail.com>
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
In-Reply-To: <CAP-5=fWXcGiWXeb8=165tCVtEAYX7qkVUpanbpmg=Db=kwEP0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ozATh7R0sd3OarI904/qJUlzeFv/A8wMlWsGooKvMhsT4XhcbRC
 9WTgfBB4DKobTFQdL5d5wKsmrJkVSVHig3CKn1TQt4rQJqL0PCZQ4XAtJ33t/9gUd2NnrvD
 sFqKuXcuwRu+gYpu7xm4T3UzAm4e06HEEVKd2Iql2/QRubR2mEgi9enkMAFqdYLOzvjhz8Z
 b/ktsaBJRRScwsDsEu/Kw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vC/AYqsWCSE=;0IWgjlEbHD8c1GfkZFjp6JRlLmF
 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
 Q+Ob1G9zG+byoM=

On 7/23/25 18:11, Ian Rogers wrote:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/arch/parisc/boot/compressed/misc.c#n28
>    /* output_len is inserted by the linker possibly at an unaligned addr=
ess */
>    extern char output_len;
> ...
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/arch/parisc/boot/compressed/misc.c#n312
>    vmlinux_len =3D get_unaligned_le32(&output_len);
>=20
> is reading a char as an le32, so a 1 byte value as a 4-byte le32. It
> appears the code didn't originally declare output_len this way but it
> was changed in commit  c42813b71a06 ("parisc: Fix unaligned-access
> crash in bootloader"):
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/arch/parisc/boot/compressed/misc.c?id=3Dc42813b71a06a2ff4a155aa87ac6=
09feeab76cf3
> -extern __le32 output_len __aligned(1);
> +extern char output_len;
>=20
> Using __builtin_memcpy for unaligned values is sound. I'm not clear
> what the appropriate parisc fix would be nor how I could test it for
> the "unalignment-exception" reported in commit c42813b71a06. I suspect
> the fix is to revert that commit. I believe we're seeing this warning
> now as the casts of the previous __get_unaligned_t would hide the
> issue.

I'm afraid that if you revert my patch, the compiler may again "optimize"
__builtin_memcpy() to a single-memory-access assembler instruction, which
then will fail again if the variable output_len was stored at an unaligned=
 address.
So the same issue as described in commit c42813b71a06.
Please note, that this is the boot loader, where an in-kernel
unalignment handler isn't functional yet.

My proposal to fix this is to avoid -Wstringop-overread when compiling
this file. Maybe some Makefile logic as done with CFLAGS_REMOVE_fpudispatc=
h.o
in arch/parisc/math-emu/Makefile can be added?

Helge


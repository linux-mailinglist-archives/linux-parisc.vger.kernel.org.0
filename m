Return-Path: <linux-parisc+bounces-4456-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D84D0665D
	for <lists+linux-parisc@lfdr.de>; Thu, 08 Jan 2026 23:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D2D7301BCD3
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Jan 2026 22:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77B32F3623;
	Thu,  8 Jan 2026 22:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="Bu3p+J4u"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2CD2F39B5
	for <linux-parisc@vger.kernel.org>; Thu,  8 Jan 2026 22:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767910174; cv=none; b=poWUGSxa0peQ3ruTiS/pOF3dOoFkZKm/bjriGUJI1bEcNLN20WQ7jt0d/K2or2CWP8+97Su8J7IdR8vCxeT6mkXYD56Sjn3QrDx2vN/2SP++yOlmRjR+vuvzuR57sTO4P5pWgxlJ3RUd5/ha1b/CXSsXF9uYiPhCuKV//9dcb54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767910174; c=relaxed/simple;
	bh=wuONJHtgWzUBR2mdoTjAJzXdaRhkESRNgQsNyRbrzGQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=LwI2WlFMQjZI66yC1tjizAKwsmlH5UjOWdA0PE75Ru29koO6kqOwHYJqMDVC0ut6Xqba+bD3zSX0STRVrH4JOGsKmSzfRFEI2cdF8U6qxsokbSNbjjdLr+ELLehvOXpRZRotQjcAGhtoS2JFWOA14ShlREdqF53RCSGReokNjNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=Bu3p+J4u; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767910161; x=1768514961; i=deller@gmx.de;
	bh=wuONJHtgWzUBR2mdoTjAJzXdaRhkESRNgQsNyRbrzGQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Bu3p+J4uuM1lcP5lh7UtpjVQI5oGtGrniAFMN1de/tITFeVKHj29e7TQVIdpwd9M
	 JntMig0wWdx5/vVLDrKd0nqO5mhhBo/m+5rtlhVcSQfV36HOFChmJH6nMqGmDXqWZ
	 y0v3Q4Na9tTmEu2tk+SXbwwpAvUEcQLos13XomxupXTS5IsQXn+7bSxf8kcc2MgK3
	 xBQVgd5WqboIF9kIQWLFb8qvQ41MM4ukfZnR60yoJ1BoLjwx2peof/9RxZ2lu4qnx
	 qZKcxDqz3D8azVere4Se+EHAX55fINOE2hFNiwePXwSOGdRKj8m8wF8LX1+yZM4p5
	 RHaquHTAcQ+ACLrAJg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.142]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNcA-1wDJ0j26xk-00gAL9; Thu, 08
 Jan 2026 23:09:21 +0100
Message-ID: <7ee9287b-6353-4f8d-a0ad-40382f165cc8@gmx.de>
Date: Thu, 8 Jan 2026 23:09:20 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: HPPA porters <debian-hppa@lists.debian.org>,
 linux-parisc <linux-parisc@vger.kernel.org>, hppa <hppa@gentoo.org>
From: Helge Deller <deller@gmx.de>
Subject: any owner of rp3410 or rp3440 which is locked to one core?
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:QEet5K2LPZa8l3sQhRBtoPb+CVo7BUcXNqjT9B0x/mx3BwKoIzG
 YHEjQxAUw7qwiAUxpWxdk9q9MZHTwzAQbcipWaQNCTiEjGzkKenC9jYutMSBd8Cw6hzNh0+
 VAIa/7Hoxr8eQAHz+PZBnUertzAV8h2qD+kB4ftydCgfZduIPEnaFQF9aDoGNkwQbjiOR5+
 ZuUZDsxdb4eG1BBuiLKZg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3GwLRBGE8QM=;eHwfNPXRtAu1pi5VYELHMcXacIu
 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
 W6WzAejp+io7Nhf7jF2X8KV5sng0xFwehhZja7

Hi fans of historic HP-PARISC machines!

Is there anyone here on the list which has a rp3410 or rp3440
which is locked to only one core via software license?
If so, can you please contact me off-list, as I'd like to
check some things...

Thanks!
Helge


Return-Path: <linux-parisc+bounces-145-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E0E806190
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Dec 2023 23:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 065661C20AF5
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Dec 2023 22:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1396ABB2;
	Tue,  5 Dec 2023 22:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="mduCJ1FM"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DC21A5
	for <linux-parisc@vger.kernel.org>; Tue,  5 Dec 2023 14:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1701814677; x=1702419477; i=deller@gmx.de;
	bh=yGZRrzsE1ner5B7J8acRhSc6QkpA8lOdedwNknEeLoA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=mduCJ1FMpzvIjoTQK5ekSlkFmpt3Na+klnMzatJGojRCDAuqU0q6z58eJ8EOtD/c
	 H+YVXiLeTGWSLjK6Sczq7gnmAoASwoFepJjeD8la+sdQQo2bgwBHh0XjsCEMXfnbX
	 kdrBHmYMd9yKMWQC6sRkPV4Jza23LSy9KPc4hASte409uL7egH1/EpASswwsu20Xj
	 IXCWrVXtKjPASMdTcTQbd6xoMHUlvoqeyufT1XKHtUAc6Yfz/FcJp9+D5F4K1/DQ9
	 RSo0CIt3KZcy0lR2JLcjaBwM1VVwqXJZ/jIxd/M3ma0Y3ur0piWmdm9lSPJah7yDU
	 7w/rlXpE3Xpk14P1lA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.147.78]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hvR-1rHPtK1agp-011h0c; Tue, 05
 Dec 2023 23:17:57 +0100
Message-ID: <939d6c5c-567a-4db2-bb2d-7bca12f66fe8@gmx.de>
Date: Tue, 5 Dec 2023 23:17:56 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [parisc] superio: Add error handling for request_region
 in superio_init
Content-Language: en-US
To: Haoran Liu <liuhaoran14@163.com>
Cc: linux-parisc@vger.kernel.org
References: <20231129152546.34962-1-liuhaoran14@163.com>
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
In-Reply-To: <20231129152546.34962-1-liuhaoran14@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P+JRKBIQIUOaBeJtdmuE7JrQwM8LYolRWppSTU0dc9YpNgeVAbI
 JSASuCrHlLgX33I/atDPM384tU7JLrPfXJ5yzUogdi1rFQgSYHPzkqrhIekTX1NXmpVmLT7
 O+zQOpo3mflBHtV87MBYB46N6PWbGJfjxQplrskvRlPiU9RG5cQt6Ia3jLIYoFcToCpgFhH
 2ReR3A3UFW1Kt6ynAtIag==
UI-OutboundReport: notjunk:1;M01:P0:k+fP8ehYVts=;1fm1Aw3ABA3ZZLrBj1Y3Q7Iq206
 i7iE8u5vyB69AUdaKrUKfsMVUOT7+eWTxBzxx46y+6Pigad0iurBk72JOjgCAuOM9aE8zoA+G
 EG+AdXNPkaqmVgUfxWjVByZjCLV8Ups8+asG/WYwUJI58shTnbjh1yA+MerhlaT2dQedR6tuO
 CC+FfYqaSSDM1YhRr21dOfpot2UlF1lbT3z+JeqxWrZdx4Mf9BX83WBuLc0JTLAMOth2hqCDT
 a1c3JlaF6mGXrJuLsIjB/DPDRCDP3s96I9huB72UHo3Z2seImnEb0Hm5PIWU4ECmk3KHDz2nA
 pTVTyQQFNCDMxhXWtBOsJEX2kJ+xyh7RwXf1U/wliHNHfPZhEBR5s8x2piEqH5UsYjP45IfyM
 nmEc/DTW+jsogfo7t5a1HSc9LcXzPmynIdtLB5fy0iYHYFI+KeaPRCHjGTzVn6CHzuRzowwNb
 eBrOImJbG9DQg0N6jyeJt/8FlrJcYaMKvUHp8ewiWAfFuqJo8vmduGU8PWoAijdxmhTfya0oN
 dD2fgmMzfsbSXyPM1mqqK2ZfkudchD9j/9BZEoo0Ui+RnTK4l3L06Sh5In8gIhTHLQ4RW6Kg0
 ASXWSSJUlKeIZ3GuppRw9m3iv50N/eDAqIPajtGDe5Yx70ctQhSdfBi169DIQdhYcCvruNSYr
 W07frfkC+SQwVapfQWdJGtgcYjsMopS0M/ObkRpvUIwg+YCPVGuKZko3GVqJnpWHs2YFKGl/4
 GNWq7DMjjnmRXQM41UnJLHr6DdvUB65mWJTxccz1Kic3xb2/OMLKla0ILrlNRUtei11EX0he0
 fvLvSanUMzJlhEMxWs+f3M8SLY+ZJILyw1iEmBajrua7MR5ZSnx9d3jnS0SmBBFxXzB41QeUz
 ei1pV8hi/iA3X7sqMtykNXFLurpu8ziYU7gD/d1gYMtowv3tZF434X6BgxDl+ng1y201/21Mz
 +BLOHw==

On 11/29/23 16:25, Haoran Liu wrote:
> This patch introduces error handling for the request_region call in the
> superio_init function within drivers/parisc/superio.c. Prior to this pat=
ch,
> the function did not handle the scenario where request_region might fail=
,
> potentially leading to resource conflicts.
>
> Although the error addressed by this patch may not occur in the current
> environment, I still suggest implementing these error handling routines
> if the function is not highly time-sensitive. As the environment evolves
> or the code gets reused in different contexts, there's a possibility tha=
t
> these errors might occur. Addressing them now can prevent potential
> debugging efforts in the future, which could be quite resource-intensive=
.
>
> Signed-off-by: Haoran Liu <liuhaoran14@163.com>
> ---
>   drivers/parisc/superio.c | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
> index e973c6893203..36c01e70671d 100644
> --- a/drivers/parisc/superio.c
> +++ b/drivers/parisc/superio.c
> @@ -187,9 +187,23 @@ superio_init(struct pci_dev *pcidev)
>   	sio->acpi_base &=3D ~1;
>   	printk(KERN_INFO PFX "ACPI at 0x%x\n", sio->acpi_base);
>
> -	request_region (IC_PIC1, 0x1f, "pic1");
> -	request_region (IC_PIC2, 0x1f, "pic2");
> -	request_region (sio->acpi_base, 0x1f, "acpi");
> +	if (!request_region(IC_PIC1, 0x1f, "pic1")) {
> +		printk(KERN_ERR PFX "request_region failed for pic1\n");

Maybe you want to use pr_err() instead here ?

Helge


> +		return;
> +	}
> +
> +	if (!request_region(IC_PIC2, 0x1f, "pic2")) {
> +		printk(KERN_ERR PFX "request_region failed for pic2\n");
> +		release_region(IC_PIC1, 0x1f);
> +		return;
> +	}
> +
> +	if (!request_region(sio->acpi_base, 0x1f, "acpi")) {
> +		printk(KERN_ERR PFX "request_region failed for acpi\n");
> +		release_region(IC_PIC1, 0x1f);
> +		release_region(IC_PIC2, 0x1f);
> +		return;
> +	}
>
>   	/* Enable the legacy I/O function */
>   	pci_read_config_word (pdev, PCI_COMMAND, &word);



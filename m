Return-Path: <linux-parisc+bounces-872-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5CA87608C
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Mar 2024 10:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 508731C2296E
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Mar 2024 09:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2B65339D;
	Fri,  8 Mar 2024 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="ACxTbg7b"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C01853372
	for <linux-parisc@vger.kernel.org>; Fri,  8 Mar 2024 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709888450; cv=none; b=UI2Nn09OTaZjDwEOUQ9M/8M/Pyy3h/kezxlpvDPfAUSZnBI+6Y6CF/uyQzcmfvI9k0JVxow1hxljF5163xouYBWDuYq7Hnv6s8PHf03eXwOvEbPG7zAbneTe8WdT3AUVB/UxuNw3hqN46tUVtLffHRep8u+0e5QxNBGMJzsx8Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709888450; c=relaxed/simple;
	bh=wy234DlU5pfm6jNfA9NvGVzT8S8xeq7IYiqmEjNBbUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBpM1TiWWJ44b1duOUcvy/t/llLQUcZ/v8E172YeMuk7kpH/lfRpm/wC9AcdoSdEwvnJyfab2VUegv0piBBwl+uTvGYO4bBFM1eVuV9B8ZHQ4R3UazAF5BFohjhmKaAB7xRnGfaP/52XsLOs7G4TbSy0E6LsJ3Q9hkW7K8piqUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=ACxTbg7b; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1709888435; x=1710493235; i=deller@gmx.de;
	bh=wy234DlU5pfm6jNfA9NvGVzT8S8xeq7IYiqmEjNBbUY=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=ACxTbg7btBHS08nbSCD+30zUC7cgSjFfg711GtEFo4RZQS8NjTkmpGsQw4LF+PJg
	 WOKh9OECSkFmTkGnUIcMI/dxukBDZ0l3Ht2zWxUEkvMJCzVwVQPPe/UJa3l2NuxMl
	 xXjwSKZEJbkHMqUVtjTPYCELFusyySlU8ZV2xvaQI/iRZ28RNTLnXoA05UT1607vg
	 6IQDgnMnLE2a2CBKejNZEq23vcxvcJcDMTxRPAp4NgrWjahovOp2nWT4GBiW5vGk0
	 lhDh7Jl9Gy3oSaOA8xUF+YOfZjeMbLjBPDJjiC4fSIfSd8s26WraJd5dUst9VsWZI
	 ms8B4R7Ns1yhL+Fw9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.151.51]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N79yG-1qm2m72ncK-017X0i; Fri, 08
 Mar 2024 10:00:35 +0100
Message-ID: <5096df26-83fe-4843-afd0-54de8cbb7d6c@gmx.de>
Date: Fri, 8 Mar 2024 10:00:34 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: led: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-parisc@vger.kernel.org, kernel@pengutronix.de
References: <a6c58690efa78eb20258f5831f0ed1861e357844.1709886922.git.u.kleine-koenig@pengutronix.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <a6c58690efa78eb20258f5831f0ed1861e357844.1709886922.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HVG81/jjORrKGBMZMsMDTPASeC6n0RHo7Sa7NfTyM0/l4waCljk
 xMHj3xGXulfMFaJpJrV1rvAtqN7uUFFaxGP0rEhF/LL18UbxxvkfOMKo4NKKv6mRt/Ios3l
 MI0vQZYmkeR4+bGlstcwycKpVZa4+st9EPzzYVsaWdhxaKDu/BJbZZKnTrvM4KEOsZyB1qX
 xaDiRmuOB3MylGccivIbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cpf0zUraf+A=;UGgeRuLVInW2Yiy128Pt1vBmw7g
 vcA0mqmMhsSOkc/OCWDXp6zYB5o591+EvwyZpcJFBXSMNTrtrYobsH+fsuPIUhAl0jTgT/SXK
 e0ln84owcsYRSUvSz5jUBud0xDLrdfplcXcA7RYCF1zDRcZglz6QHNSUKvM2n/w9NE3vxmTl9
 JUK1dE/D/mOekNRTJ1/PNiaKQQEnsAEl57phhEgUxmmx5ffpXAKNkflZ/YO8RtF2w/FZb6Qkx
 z61haPnSoSdArLWZKs3FD/q3OaO/ENZYABtyJpriulCykq0s+KA3FHtq/mOIV3XcvuqolVmZH
 b5cxJaXL6MI1FCMY+UQoIiNdCxSnzb22sB2o7BhZQY5ZsDmr0xzpg3anHzOFFP5hnrM5JdH7s
 +luIVwg9GRQJEdST7unDX8VLTF8vGmSAgWvBU64GAydbmZeNTScj4oRRrXchXfLpxCcXsJy6b
 Qt3XQiWuGPENSt9nnxco+P/H9Qf3Yh+E00Tp/CiwxeF4zBo5J06H3EJHqG+T5hjDM1Kz806Qu
 QGI/N1EWseio5UZqXsyXO35eaMbfqUY8JZu/jWZGkLU1dK21EQpocQ45zYjPU2PG8XOb8C7Bx
 eHXKm8r/9vJo7QecDvjPPvi3mlUzOWs5Qq/DBAq2jz/e/4nfe/QG4y20ERwwROWGK4FQ/ANji
 z4F6Dptkk95CG25A7zsINVtVvfpP7yFAWdyQEkRZL8WJ2LHvhC24GWnmMD1y6DF/WRVlcTLpV
 hDvhFggrEKnPKowF7t/WhXanV3EBAJdDSQ7iBRpiMuddS8/I5f0vFK+pqFfHK+zx/xNKkDkrw
 033eGHcyfE8OkDhJXkSC4RJ+0zc5duPDuD25Ic7+0ZlLk=

On 3/8/24 09:51, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

applied to parisc tree.

Thanks!
Helge

> ---
>   drivers/parisc/led.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
> index 1f75d2416001..b49cb010a4d8 100644
> --- a/drivers/parisc/led.c
> +++ b/drivers/parisc/led.c
> @@ -308,15 +308,13 @@ static int hppa_led_generic_probe(struct platform_=
device *pdev,
>   	return 0;
>   }
>
> -static int platform_led_remove(struct platform_device *pdev)
> +static void platform_led_remove(struct platform_device *pdev)
>   {
>   	struct hppa_drvdata *p =3D platform_get_drvdata(pdev);
>   	int i;
>
>   	for (i =3D 0; i < NUM_LEDS_PER_BOARD; i++)
>   		led_classdev_unregister(&p->leds[i].led_cdev);
> -
> -	return 0;
>   }
>
>   static struct led_type mainboard_led_types[NUM_LEDS_PER_BOARD] =3D {
> @@ -371,7 +369,7 @@ MODULE_ALIAS("platform:platform-leds");
>
>   static struct platform_driver hppa_mainboard_led_driver =3D {
>   	.probe		=3D platform_led_probe,
> -	.remove		=3D platform_led_remove,
> +	.remove_new	=3D platform_led_remove,
>   	.driver		=3D {
>   		.name	=3D "platform-leds",
>   	},
>
> base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd



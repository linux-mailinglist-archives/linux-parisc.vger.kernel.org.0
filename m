Return-Path: <linux-parisc+bounces-3299-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C82EA2985D
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Feb 2025 19:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5CFE188A48B
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Feb 2025 18:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F79C161321;
	Wed,  5 Feb 2025 18:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="pkN+kBGx"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131E13D897
	for <linux-parisc@vger.kernel.org>; Wed,  5 Feb 2025 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778772; cv=none; b=b+1N18EID7X41mHuRjN6L9URQJpp5PCiyA2lZS42XzHZbJoBHupz48FVwQdhs1+tpW8ScYriWPhOsbT8Hoe6sdajnV246S7Tt0cgnhJz3z65suDUXToZR6MsAAz5CQrxU4KhqaFg2s4r3zZ2+u6M3tdiKcP3ZUI5iBaBJGQa5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778772; c=relaxed/simple;
	bh=FLgXwrWY4cQIdGHf/0XoDCs488seZJZ545UfyzFQ5Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLUI3xx71+6TXQMEdWaGtchJBcOzqwjWJz5XZL288urIuGAq2MC2RyCVDgityurEGP2+4qFsywNP/qLB1jzwda1iUYk+/89hC2waSQg2p3k5sgr12xWtG9W87ZGBWqgLkJAiPPuD8zyGTma7uBPpx9hA8kKBW0E2po/l+wisyMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=pkN+kBGx; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738778766; x=1739383566; i=deller@gmx.de;
	bh=+j9TbRh4FNZRYXwoqEO7WEsNnWh0gQUhvTgeZHhktXs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pkN+kBGxoUVVXpFZg4m4GZAMo0fuFFVOigFhrSFHx5LBcWhrO/mbEUJBtaVu/7y5
	 d+8D+4fRjlaX7ktkT1tPSQggR8HyRBp7DohMB4clP7Bg3MbDJ1SwXh43b0+IG8uqP
	 1buIhszRWOgmz8w73/9SkCTUsyhfJS+pWtqeV1Z1zsHA89VIWKwobuDvaxQl0bpI8
	 kI8C3cg4kKNbPc9/10uucmIzLUszV0OfUcSFiHehoDM7QXC4UsWO1+m77Fq906ZwH
	 T9vyjM+Xfj1f9hObSdsQe3Nd4UHfAX5/CH8+Jj1QWlG53y3zlE7PcsOgKGOkombdv
	 nffmgaXQLbfSG3rhdQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEFvj-1tXjZr0Jmv-00HMnC; Wed, 05
 Feb 2025 19:06:06 +0100
Message-ID: <4dee439b-939e-47d5-a975-404bcfbfa895@gmx.de>
Date: Wed, 5 Feb 2025 19:06:05 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] parisc: Remove unused symbol vdso_data
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-parisc@vger.kernel.org
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
 <20250204-vdso-store-rng-v3-2-13a4669dfc8c@linutronix.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250204-vdso-store-rng-v3-2-13a4669dfc8c@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:trl+tjH+rEaudo7wvyo6ADVscb9Pn8zmHyp5pfqMgwwQv5wo3us
 4pT8/vv8ylYdPBM2cdMDCx2ji5Ig4brjoPT4HBUMzrizoSMU80ID6pJVaJv1glxLhc6axc9
 A/uCAZHJbyl09dvunrk1t+YuPK9S5EyhZbHuPmYDkQwX/olcLAnbJxfvutUdYblPD6O/LHL
 95BzKVKS6dBBEmhTdIkXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Q/QcnrFBeVw=;m5o1vqEhnvx//RU5Hj6x6MANKDc
 rZ3ak0j22QFy3rDhF12A3B2it2TksHZ9VuR0mtAhIl7/LIm+abXUtJhWCEYH/fMmCsyqQ1OO4
 StTU7jVNPQE5GXEXMGxDRuuuN3NTklhMeiNr5JT9aSg1Icy4FVyC9+yanhSa2RWi26O+LgE9+
 JckmbUpF+xIGmiGBPA41s2kOcAJ066Zv8H5brUHTGD1omh4Xz9NMhZYg521dCfxZG45g3uqYi
 ZUBEyTAG9YqSkT5bV6vkTlHKNCXieOnw+MfQraBnbtC/9HtjcDrUns+rNM/bWp+7BWgtuLufJ
 33pqshYOe+gWviDoYr09vOFNQR0tlAWz3LkZsD3DhvRwd6hzolVTJc/tgsGa4SSUYgM70/mcY
 zGmmjQdiJVxtKCj3Nm9YcbRIwdo5MlNloDBUr2zs7cFCkXUab3+FNrML+ZgyxuMCh1Tk9LveR
 nziYKPIj5Z9W4HSiIznFrvilBCPnQ7FTjmOhV5ZnYdcLm1PyrWu01+2SAISQt4sqsphqYIBCV
 ByXrDOaghHu8BGc+JnMe9Qe8X4+/aOfqd3huWnJNPmps2LQxURfYD/ojGclC48qbFDINPGBhx
 4FIUAwuke2rHw6gKYBoiN+WscOstniPJzdRjlynhciRPh81YM00lvYCsL5UUTaWjlEvGCb7rn
 fz2oczfBRXXVVQJXA0vL09qvmm2//oYnnmv6ld1eKDdIv/8XSCBv3zyMxBB8ELkMtLqinyOM0
 DSSlC+hv71GWixtzrDxhgVwRM1a+u2pliSCPxznCGqaO+sez/nD31Y/+3JFEgYdXbfxD09OIc
 vyDTbDl5B1be/fRgl/hV/YFQGer7ahUSSWzfEziSMlTRfPE0xLI02Xp2uJj37EmWPeVlLh8fZ
 DdFwb1l9TZpP8XZu3z121luErOgNUpfZsI7IWecgzSNxxSuweIqCnl7ZAbs2c3+k/iXlgmY00
 hCsftspjXNS6Y0AbDh/D1piELJqQZNJGatFv0gFXMOKlomgLWkU6U888dWLoR3XhX/vFWu8Ly
 mYB8FqoibiS/IAvDBAyXsv6kXXuqDL9zeB/pDXbcRMwHJjDQ+LsDVy9sIdSO0YkpsgsAzwosR
 XQ/BFmWveg4fTI0pXGYWWaAioaGIwQ9VX2H5ycRV0ygxT9rQP7Sdt37U2/w/ULRPnNMwCy80W
 2se5N84c0mZ/ZS/vxjHfOUO+SA72AhJK4BmqeKsULJe6Vy3Qaf63pObwzQKl5PWSHdi2K8fTX
 E8XzokJakGQ0tpo/5gCgwuh/Yz2U/yB9d1mbBGheuR1mU7UQAauux7nJDvN0P3UafbXYQNht/
 KvSJaK2VHDT8gvQx7J5tMrUPcQpu2cqhJntTt5yzObpQtc=

On 2/4/25 13:05, Thomas Wei=C3=9Fschuh wrote:
> The symbol vdso_data is and has been unused.
> Remove it.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>   arch/parisc/include/asm/vdso.h | 2 --
>   1 file changed, 2 deletions(-)

Acked-by: Helge Deller <deller@gmx.de> # parisc




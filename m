Return-Path: <linux-parisc+bounces-2547-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8139E99391E
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 165F81F219FF
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3B31DE4D8;
	Mon,  7 Oct 2024 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="Rvmp78J7"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1401F1DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336398; cv=none; b=mQf9/aqcXcxSxL2z0F4VWAZxKu7oTykO6h5zf11SaxbNcVGswr2Y8xmUMnqv0QaBop2s2+CVgCxn/f4ws7PWMo3ulLSdroIJHwheGY77Ow1l1FfQqJDyA8o+7QmKL8Xo86QybMWWsScUmthts4oz7fBAaRFV5KfpPN+lLQ4BvXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336398; c=relaxed/simple;
	bh=LCEjSKhe+bQ/ksFDUzBA3SfVyQZJZEPA2EEhJVAGwOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMI245S1U7AkhaLj14uq23IDNZwri00VRgMrYdE9VwxifXHLk8LzyPpz5ery3l/ZFKp5A6uyEAsCMUFu1DPZjOgOJcH6YyiqV2Cm4FG//FYAHnOF/dB/zrjXP4eJgnr7TsoW3CVkbKE31dgLKBfe2Hl3jhBpxE4GxLPht/kWeKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=Rvmp78J7; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336385; x=1728941185; i=deller@gmx.de;
	bh=9xmTQ3MTHaGYfKNMFGOwKAEB7OrnQPo8rEImMyiimE0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Rvmp78J7xgXjBHartScHLsrJ2xoXYbH3t5dilflpsQPfeOMFvmpBwepVbc2Zxzj8
	 FDANatcFIsLUjvA2NENVR+2HFvLoEMJPdUVPo3r0oPeMMF7Au/wEr86kl2xn6Or6G
	 VR+k7x6eFwLZjc6/vJ7yKtyCCVrxr0To/SrUBD0paYUvh2khiwElAel28QObAOxfy
	 2OsA2D/zlHKKMogFYjVlli9ASO2JN9cH3672FNOunitG4CURXML/0CuG0Ih9imrRE
	 YKu8ku7dPNbVMZ6+lV/VuUR1Rr8166P5mcv93MQURVUKavikRszQuaUYzlRysX+QZ
	 NCvFteHZC3f0iZuT7g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9g4-1tCFfZ154u-00D5Um; Mon, 07
 Oct 2024 23:26:25 +0200
Message-ID: <71ea154d-e4aa-4d6c-9dfb-d5d89f90205c@gmx.de>
Date: Mon, 7 Oct 2024 23:26:24 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/21] target/arm: Add arm_cpu_tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-21-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JAJ0OjAMb9ZDbCeq+sgTWHRGALHE12S63zBxJ37RKEmacI1b2z4
 ts1U4xdufUFvO0EOYGTmeOn8ogQOCirbXS38pnTDMe3UFw0dz7RvG+TD8k+94IM8WiqYjX4
 Y0x3U62oTahPq7rWxM8/aTD6woe1FvXJOa5Zrb/iDIWhZvGIq1qz1roGv+1r68MaHqt5km7
 vNfWerUktVYGdvLpMDvpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4DGfTGgMgws=;kADFpI8nnwRfK0gIDXE6ebrR8fY
 JSxkpTN/flu0+WUF7WQLZsfWjfcj4Ok1rcP3BzcF5jp3E1N7UFsetJ5bDhxbW6jlrHT4aR4yB
 i+zZ/PQU5+BKUfuGqdMqDyGDWfyKtM1LkF+EQ/95QNiDCvGXUbu/u2Z9A3oGNWHbwU26SxqKV
 jlcELhySE9Y38LTOvqhKdf9AqpPnNHJ59+8HJ8k+N8HR+CWePDPePiIG0+onjcJ2Iu2evP/p7
 N7qXPiqepv9z+bBmfO/OEK5a79y+mjsYyIgsK7ruJS6/BoZVQA9r8ih0bdWHQhpsiGTNCZHAx
 /7e0kl3rJPlXjzzXq4e7GBI5xkOXahXbg51+TLAyjqmz1/tGNySQoODB51MYah1XRWQkl0ZJA
 BgTspoYg6CtCr4xNHduisdbd0uYeWUHwMN3YrHJhTtkXT1L7WoC1Obo6QLgNLce9q77h9Hipv
 D4iWptWm1sZ/Pa3ApDrGvO/6w5/7di2JxbtxZzu/MV0PbMR34p4jC3ZqKU3iIyiqCAG6sj6Dd
 f0eyN0oBYt1uCpeO87mkSJjPqnWe7EscxZxIGD2GYgZGNLDkOOTWdOgWCGMEkud59Gd4Lo9Gx
 Jyqtnsx2uoQFmlA3jSGbwHhnEfxlCC4VBEM8Nfmrp5Zdn+k3aE44PTHfUsEv7ShIzOnI4h7bK
 1DdrwqOeqfQYrtv6PjxA6xPPUAbGz1FqFhywzc/yc3XISRtAHq5lgzJktbS74BQ4LQcwW8WdT
 nPnRQSCuo4a8/HHdCXe6DGn09SpK+fRhXuUkdXezAxSMjyhKsOtMm17kj4ccjVQYJj0oRQzSb
 RG8J/BVGWqDieCOfB0cWQe1Q==

On 10/5/24 22:05, Richard Henderson wrote:
> Fill in the tlb_fill_align hook.  So far this is the same
> as tlb_fill_align_first, except that we can pass memop to
> get_phys_addr as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>


> ---
>   target/arm/internals.h      |  3 +++
>   target/arm/cpu.c            |  2 +-
>   target/arm/tcg/cpu-v7m.c    |  2 +-
>   target/arm/tcg/tlb_helper.c | 27 +++++++++++++++++++++++----
>   4 files changed, 28 insertions(+), 6 deletions(-)



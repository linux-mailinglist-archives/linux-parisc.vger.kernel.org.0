Return-Path: <linux-parisc+bounces-2524-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2639938CD
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7E31F20C71
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FD31DE4CB;
	Mon,  7 Oct 2024 21:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="AHtyEj5z"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED3513698F
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335635; cv=none; b=WoXOmQog2a5Ao3KuTnqYwMFJwyKlGDwV20mHy7JrpfMkNCTUMzYyj2bcNsbYNww4EU0dP/a8myg91eVpGanMfHAJFaPsokVUBcMchuEJQLo6WJZk6FhFWjX2cMV20VXXSVx79hY1PnqJ6gs7Oo9OpHXeLkheH8B6g2eNk7xHf2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335635; c=relaxed/simple;
	bh=dngar7wPpGayadXHG9hP2bPdwOESE+E7KjwBmcENg8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RumR+Ob8jYJVnavvJlnkks1g2vntKcy+dS6cgwgu84NJiz2ymV9E2yoiDqJPDUjVpyOHAajPUEg7SklGd/TjtF+2CelEkfcs1bB/xeuxlAy2rG9KDvW5uslrFw5HfZF9yPQrk2k6gndIJpycG8Q46qiFI0zouuFmJhzf+jUAe28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=AHtyEj5z; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335620; x=1728940420; i=deller@gmx.de;
	bh=Pz5aP8rM2IkjmDqGJVSZO6hFnDGmCcDZPRR0Xl8N/Lg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AHtyEj5znbElMcpcboPDdC/Aucx1e95B5esfZ9BT7HY8OFNpqzkC1S4tT8n0IUtf
	 EJjIzc3RRNXMg+MlxfSP/6D5r8UzdmDdEouQ/nTWxlReEjgUbnQy8vMHDpbk8LbFC
	 AF1K7elP4x0COQZqBy53PgN9fcghMiQNx9nFV5AgxBpYzjjzgbADS7XTMAR20NNL4
	 aRavC5j2A2sV8rlOBLt2udwW8Jw5ZFXLHTX9THUhy4kVqHQFkNN7j87lTcYWxiwmo
	 BKjNteszchQF2BqoYzZehba2eqEyjuw+FHR8FEye5OrEsmlNcq5klAu1T5L0x6dYP
	 6Oupa1WWDDFiq61qnQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf0U-1tgdXC2afq-00mfrJ; Mon, 07
 Oct 2024 23:13:40 +0200
Message-ID: <6df44ac0-72cd-4623-a810-66f8d781ed0c@gmx.de>
Date: Mon, 7 Oct 2024 23:13:39 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/21] accel/tcg: Use the tlb_fill_align hook
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-8-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w34hSYqPDYn4tdrjdLnz7tfaS71dn/GNVaP/T6ox3AQ4CsFkyiv
 wfRQCdLSjJn4c5bQJpQax9y3Hg33fkxXQ+8gxIkXVteNRxzFm2w9dcJIOY3juF2OsWPuEGT
 MKOZzFjuRpWuxBL2PlFQ+pH3LbS2I7mPgVzSZvkQuYSS6BmvKfHJC90iT7FHGbByEx80n+M
 RR9o3Im1aSG94TkU0KYyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hpXcjcPchdE=;yx8cwG4AtgnbjShREQbolJnZ/Qq
 SotXILWpAHNi1EmjHoVs3+wIfOTRErswxv2CWvu7GSULt1Z0y4w2cqy2aFkZgY86Zrep+mOUn
 u4y2uuhdPjpZAvxeDVdeE7a5VQ3oE5eo5AuZClYYhHPrJRVxStUY02Y0vAj/rcd7qRutXBN6v
 e4PO+B/hwCFbuhm98U5L8jocApqsqhJwFbCvCwZErZU2dKvVIo1Uh+AklO5tBK1tQNa3gn+5Y
 hcHnDjxxkuam+7Ek1YFZ8oNHBLZEZHuTRgdcUNiW0fPLyoNWlD5m34rv1XTx5aJdtq62LfvHh
 VkFt4rvAtnle7tMM8m4euOfNDcWV68yck6wvf0wZgBj+kw1EEkfyxi45q6K4TL+tIrggXrt/o
 FdEeGB+89fXOS5X79hsH2mIAyk7AHSNcbFAs3ApDygsVrwU5p3B4hTnqBcKO61p67dfu75qiZ
 +ptECvKVMGwVJF9f78rlyQwlQ8+xcW0KZVsjMyYuE/GZzeYW69nmy3pAwf6eZsFY8/zLxjQGQ
 8JNCQ28ncKIFcDD03xLtZUf3vqP6JYmj5/ELI69i8b8pGBPZmW9CxPrRS5MD7h9DHBChWxigW
 Psv8dV4ozG5L3RWwX3ABJMV/LhdZ36dypzsFQwZioA+bJmL4qaHCUAg9F+cS5KPCdS31vRGAr
 4newGJIa1+rSK9Ufe8uJIouM2OM7C4hyrFkGrW9AVjooKY700gGf8fMxlHICe8XSNA13kBGWF
 2qDUrBygxvsQ2jS378VlLna/wffRPzoMLwxCRlJj6IUf9dZN5QD8lSzEy7SQIjsU8ZXCWaPLI
 j+w2K6ZpojY7Cp+JDtyY0dfg==

On 10/5/24 22:05, Richard Henderson wrote:
> When we have a tlb miss, defer the alignment check to
> the new tlb_fill_align hook.  Move the existing alignment
> check so that we only perform it with a tlb hit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   accel/tcg/cputlb.c | 89 +++++++++++++++++++++++++---------------------
>   1 file changed, 49 insertions(+), 40 deletions(-)


